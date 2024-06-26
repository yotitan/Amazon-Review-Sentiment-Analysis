FROM python:3.9-slim

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update \
    && apt install -y htop wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.9.0-0-Linux-x86_64.sh \
    && mkdir root/.conda \
    && sh Miniconda3-py39_23.9.0-0-Linux-x86_64.sh -b \
    && rm -f Miniconda3-py39_23.9.0-0-Linux-x86_64.sh

RUN conda create -y -n arsa python=3.9

COPY . src/
RUN /bin/bash -c "cd src \
    && source activate arsa \
    && pip install -r requirements.txt"
