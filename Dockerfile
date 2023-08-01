# syntax=docker/dockerfile:1

FROM golang:1.20

WORKDIR /app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod ./
RUN go mod download


#COPY /Users/diegoferreira/dev/FullCycle/docker/desafioGO .
COPY *.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o /hello

EXPOSE 8080

CMD ["/hello"]