FROM golang
RUN mkdir -p /go/src/gomicro
WORKDIR /go/src/gomicro
COPY .  /go/src/gomicro
CMD [ "go-wrapper" ,"run"]
ONBUILD COPY . /go/src/gomicro
ONBUILD RUN go-wrapper download
ONBUILD RUN go-wrapper install
RUN go get -d -v
RUN go install -v