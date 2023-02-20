Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22F69D0A1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU86j-0000xd-Az; Mon, 20 Feb 2023 10:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pU86g-0000xB-NO
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pU86d-0005Hx-Ho
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676906968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0u73xg5EpJe3HSO7+tnURQA5YWrQDUTCUAVC9uYvTGw=;
 b=JvqIH4v9TTiIXowODKTLBmw+3B2+XlDkgJNOdl83pg1yZugXhBklqgX65HJUnsK10ystsm
 XD/j5iUSzjF5jdK0zMoMq+b7y4qOavcaNMhfHj8U2OWRG+1uhyT+xgnPwUnV4iFjbup8yu
 nGUtUglBLPe3azBUTGGt9KQrlLiV1mI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-9wgS_zEgNuyRPCGlPcLFow-1; Mon, 20 Feb 2023 10:29:24 -0500
X-MC-Unique: 9wgS_zEgNuyRPCGlPcLFow-1
Received: by mail-ed1-f72.google.com with SMTP id
 x16-20020a05640226d000b004a6c2f6a226so1587017edd.15
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0u73xg5EpJe3HSO7+tnURQA5YWrQDUTCUAVC9uYvTGw=;
 b=H6u7ZGNJ787c0RPXEE8/mjJ0vvyptTaG14I90ZVcL4QuoiM30KZvX3ozIreY/eO7k0
 nigAT3RyH/Cw5eAGGAd0XGtdG/us7DiItKYCw1F/GSWBwJgt3AgsWRE0mTzLjzj2Bok+
 /XHTrQRKFyeN2UNjhO0kLjbdioVr6UGQqnAGx/9S7C3tLuNRloEHvKmOcLT3HT/ddMfJ
 ZQ1TCGgyi8nw2u0lvDVy4ehcGsbBxgwbQFlTM7pnLu4hKLgYF6yoG9ozZEnAFHcN2l+8
 m6U9Zfb7fRebxjIEGx9eB/uLfY5B/3nQ+XHnUi055pXj4CSbkx7KIBPn8k2cfVCg8FC5
 sqJQ==
X-Gm-Message-State: AO0yUKXl8W1VTbGScLq8HIkRE1wLZL+Qet7MULmPvWwtUeaoJZdKjQXV
 N8TRPFpSZ41K89tFI86zy372oHBBP/JjZTV+aX52hJsxcYQFA7x4YSnwvKoXiKyyirqCvZbxUWW
 wFV5GA8+kixra79BhlQ0JjBZ+i5/9Qdw=
X-Received: by 2002:a17:906:e217:b0:8b1:38d6:9853 with SMTP id
 gf23-20020a170906e21700b008b138d69853mr4224814ejb.2.1676906963583; 
 Mon, 20 Feb 2023 07:29:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+/3177kzJL8AH6fN/tsU6OII/J8FXD7gC3YJr1ockLCAmPhiSCib3fsX9zxv7I+UJSICYPaqXnZbg9DxzAR/Y=
X-Received: by 2002:a17:906:e217:b0:8b1:38d6:9853 with SMTP id
 gf23-20020a170906e21700b008b138d69853mr4224796ejb.2.1676906963209; Mon, 20
 Feb 2023 07:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
In-Reply-To: <87r0ukbjfp.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Feb 2023 19:29:11 +0400
Message-ID: <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000dd255405f523537c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000dd255405f523537c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Feb 20, 2023 at 4:38 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Until now, a win32 SOCKET handle is often cast to an int file
> > descriptor, as this is what other OS use for sockets.
>
> Brief recap, to refamiliarize myself with the way this stuff works under
> Windows:
>
> 1. Both POSIX and Windows use small integer file descriptors.
>
> 2. With POSIX, these are an OS thing.  With Windows, these are a CRT
>    thing, wrapping a HANDLE, which is the OS thing.
>
> 3. A Windows HANDLE is to be treated as an abstract data type.
>
> 4. _get_osfhandle() returns a CRT file descriptor's HANDLE.
>
> 5. _open_osfhandle() creates a CRT file descriptor that wraps around a
>    HANDLE.
>
> 6. Closing a CRT file descriptor also closes the wrapped HANDLE.
>
> 7. A Windows SOCKET is also a HANDLE.  Maybe.  I guess.  Docs are
>    confusing.
>

Kind of, but not really. I think a HANDLE is a kind of void*. You need to
be careful using it appropriately with the right functions. Sometime, a
HANDLE can work with generic functions, like ReadFile, but you should not
use a CloseHandle on SOCKET, or registry key..


>
> 8. There's merry confusion between int, intptr_t, HANDLE, SOCKET, and
>    who knows what else.
>

indeed


>
> >                                                       When necessary,
> > QEMU eventually queries whether it's a socket with the help of
> > fd_is_socket(). However, there is no guarantee of conflict between the
> > fd and SOCKET space. Such conflict would have surprising consequences,
> > we shouldn't mix them.
>
> True.
>
> However, if conflicts were an issue in practice, conflating the two
> wouldn't be so common, don't you think?  File descriptors start at zero.
> Perhaps SOCKETs are much bigger when interpreted as int?  Not really
> relevant, because:
>

They are usually fairly low integers on my system.


>
> > Also, it is often forgotten that SOCKET must be closed with
> > closesocket(), and not close().
>
> Yup.  After the next patch, we don't have to remember anymore outside
> oslib-win32.c, and that's a fairly compelling argument for this patch.
>
> > Instead, let's make the win32 socket wrapper functions return and take =
a
> > file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> > necessary. A bit of adaptation is necessary in io/ as well.
> >
> > Unfortunately, we can't drop closesocket() usage, despite
> > _open_osfhandle() documentation claiming transfer of ownership, testing
> > shows bad behaviour if you forget to call closesocket().
>
> I figure this refers to your patch to qemu_closesocket_wrap().  Correct?
>
> What bad behavior did you observe in testing?
>

Weird failures, as if fd and SOCKET were mixed by the CRT.. ex of test:

#include <winsock2.h>
#include <windows.h>
#include <io.h>
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>

static bool
fd_is_socket(int fd)
{
    int optval;
    int optlen =3D sizeof(optval);
    SOCKET s =3D _get_osfhandle(fd);

    return getsockopt(s, SOL_SOCKET, SO_TYPE, (char *)&optval, &optlen) =3D=
=3D
0;
}

static void
test(void)
{
    SOCKET s;
    int fd;
    char tmp[] =3D "fooXXXXXX";

    s =3D socket(AF_INET, SOCK_STREAM, 0);
    fd =3D _open_osfhandle(s, 0);
    printf("sock: %d\n", fd);
    assert(fd_is_socket(fd));
    assert(close(fd) =3D=3D 0);
    /* if you comment this, test will fail after a few iterations */
    assert(closesocket(s) =3D=3D 0);

    fd =3D mkstemp(tmp);
    printf("tmp: %d\n", fd);
    assert(!fd_is_socket(fd));
    assert(close(fd) =3D=3D 0);
}

int main(int argc, char *argv[])
{
    int i;
    WSADATA wsaData;

    WSAStartup(MAKEWORD(2,2), &wsaData);

    for (i =3D 0; i < 40; i++) {
        test();
    }

    return 0;
}

fd_is_socket() is wrong after a few iterations if you forget closesocket().


> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  io/channel-socket.c |  18 +++--
> >  io/channel-watch.c  |  17 +++--
> >  util/oslib-win32.c  | 164 ++++++++++++++++++++++++++++++++++++++------
> >  3 files changed, 165 insertions(+), 34 deletions(-)
> >
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index 2040297d2b..18cc062431 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -426,6 +426,14 @@ static void qio_channel_socket_init(Object *obj)
> >      ioc->fd =3D -1;
> >  }
> >
> > +static void wsa_event_clear(int sockfd)
> > +{
> > +#ifdef WIN32
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +    WSAEventSelect(s, NULL, 0);
> > +#endif
> > +}
> > +
> >  static void qio_channel_socket_finalize(Object *obj)
> >  {
> >      QIOChannelSocket *ioc =3D QIO_CHANNEL_SOCKET(obj);
> > @@ -441,9 +449,7 @@ static void qio_channel_socket_finalize(Object *obj=
)
> >                  err =3D NULL;
> >              }
> >          }
> > -#ifdef WIN32
> > -        WSAEventSelect(ioc->fd, NULL, 0);
> > -#endif
> > +        wsa_event_clear(ioc->fd);
> >          closesocket(ioc->fd);
> >          ioc->fd =3D -1;
> >      }
> > @@ -845,9 +851,7 @@ qio_channel_socket_close(QIOChannel *ioc,
> >      Error *err =3D NULL;
> >
> >      if (sioc->fd !=3D -1) {
> > -#ifdef WIN32
> > -        WSAEventSelect(sioc->fd, NULL, 0);
> > -#endif
> > +        wsa_event_clear(sioc->fd);
> >          if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) =
{
> >              socket_listen_cleanup(sioc->fd, errp);
> >          }
>
> Factoring out wsa_event_clear() could be a separate patch.  Observation,
> not demand.
>

ok


>
> > @@ -899,7 +903,7 @@ static void
> qio_channel_socket_set_aio_fd_handler(QIOChannel *ioc,
> >                                                    void *opaque)
> >  {
> >      QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > -    aio_set_fd_handler(ctx, sioc->fd, false,
> > +    aio_set_fd_handler(ctx, _get_osfhandle(sioc->fd), false,
> >                         io_read, io_write, NULL, NULL, opaque);
> >  }
> >
> > diff --git a/io/channel-watch.c b/io/channel-watch.c
> > index ad7c568a84..8c1c24008f 100644
> > --- a/io/channel-watch.c
> > +++ b/io/channel-watch.c
> > @@ -19,6 +19,7 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> >  #include "io/channel-watch.h"
> >
> >  typedef struct QIOChannelFDSource QIOChannelFDSource;
> > @@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel
> *ioc,
> >
> >  #ifdef CONFIG_WIN32
> >  GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
> > -                                         int socket,
> > +                                         int sockfd,
> >                                           GIOCondition condition)
> >  {
> > +    SOCKET s =3D _get_osfhandle(sockfd);
>
> _get_osfhandle() returns a HANDLE as intptr_t.  Is a HANDLE that refers
> to a socket also a SOCKET?  The docs I found so far are confusing...
>

yes


>
> >      GSource *source;
> >      QIOChannelSocketSource *ssource;
> >
> > -    WSAEventSelect(socket, ioc->event,
> > -                   FD_READ | FD_ACCEPT | FD_CLOSE |
> > -                   FD_CONNECT | FD_WRITE | FD_OOB);
> > +    if (s =3D=3D -1 ||
> > +        WSAEventSelect(s, ioc->event,
> > +                       FD_READ | FD_ACCEPT | FD_CLOSE |
> > +                       FD_CONNECT | FD_WRITE | FD_OOB) =3D=3D SOCKET_E=
RROR)
> {
> > +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError(=
));
> > +        error_printf("error creating socket watch: %s", emsg);
>
> Uh, why is printing an error appropriate here?  Shouldn't we leave error
> handling to callers?
>

We could, but we would have to modify callers as well, which can go deep. I
am considering a &error_warn as a first approach (I am working on something
to check other WSA API users). Does that sound reasonable?


> Also, does GetLastError() do the right thing after _get_osfhandle()
> failure?  _get_osfhandle() is documented to set errno...
>
>
Indeed, I better use errno.


> > +        return NULL;
> > +    }
> >
> >      source =3D g_source_new(&qio_channel_socket_source_funcs,
> >                            sizeof(QIOChannelSocketSource));
> > @@ -293,7 +300,7 @@ GSource *qio_channel_create_socket_watch(QIOChannel
> *ioc,
> >      object_ref(OBJECT(ioc));
> >
> >      ssource->condition =3D condition;
> > -    ssource->socket =3D socket;
> > +    ssource->socket =3D s;
> >      ssource->revents =3D 0;
> >
> >      ssource->fd.fd =3D (gintptr)ioc->event;
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 07ade41800..78fab521cf 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -180,7 +180,8 @@ static int socket_error(void)
> >  void qemu_socket_set_block(int fd)
> >  {
> >      unsigned long opt =3D 0;
> > -    WSAEventSelect(fd, NULL, 0);
> > +    SOCKET s =3D _get_osfhandle(fd);
> > +    WSAEventSelect(s, NULL, 0);
> >      ioctlsocket(fd, FIONBIO, &opt);
> >  }
> >
> > @@ -297,7 +298,13 @@ int qemu_connect_wrap(int sockfd, const struct
> sockaddr *addr,
> >                        socklen_t addrlen)
> >  {
> >      int ret;
> > -    ret =3D connect(sockfd, addr, addrlen);
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
>
> _get_osfhandle() is documented to set errno to EBADF in this case.  If
> true, you change errno from EBADF to EINVAL.  Doesn't seem like an
> improvement :)
>

right


>
> More of the same below, not pointing it out there.
>
> > +        return -1;
> > +    }
> > +    ret =3D connect(s, addr, addrlen);
> >      if (ret < 0) {
> >          if (WSAGetLastError() =3D=3D WSAEWOULDBLOCK) {
> >              errno =3D EINPROGRESS;
> > @@ -313,7 +320,13 @@ int qemu_connect_wrap(int sockfd, const struct
> sockaddr *addr,
> >  int qemu_listen_wrap(int sockfd, int backlog)
> >  {
> >      int ret;
> > -    ret =3D listen(sockfd, backlog);
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +    ret =3D listen(s, backlog);
> >      if (ret < 0) {
> >          errno =3D socket_error();
> >      }
> > @@ -326,7 +339,13 @@ int qemu_bind_wrap(int sockfd, const struct
> sockaddr *addr,
> >                     socklen_t addrlen)
> >  {
> >      int ret;
> > -    ret =3D bind(sockfd, addr, addrlen);
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +    ret =3D bind(s, addr, addrlen);
> >      if (ret < 0) {
> >          errno =3D socket_error();
> >      }
> > @@ -337,12 +356,22 @@ int qemu_bind_wrap(int sockfd, const struct
> sockaddr *addr,
> >  #undef socket
> >  int qemu_socket_wrap(int domain, int type, int protocol)
> >  {
> > -    int ret;
> > -    ret =3D socket(domain, type, protocol);
> > -    if (ret < 0) {
> > +    SOCKET s;
> > +    int fd;
> > +
> > +    s =3D socket(domain, type, protocol);
> > +    if (s =3D=3D -1) {
> >          errno =3D socket_error();
> > +        return -1;
> >      }
> > -    return ret;
> > +
> > +    fd =3D _open_osfhandle(s, _O_BINARY);
> > +    if (fd < 0) {
> > +        closesocket(s);
> > +        errno =3D ENOMEM;
>
> _open_osfhandle() is not documented to set errno, unlike
> _get_osfhandle().  So, okay, I guess.
>
> Similar uses below, also okay.
>
> > +    }
> > +
> > +    return fd;
> >  }
> >
> >
> > @@ -350,10 +379,22 @@ int qemu_socket_wrap(int domain, int type, int
> protocol)
> >  int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
> >                       socklen_t *addrlen)
> >  {
> > -    int ret;
> > -    ret =3D accept(sockfd, addr, addrlen);
> > -    if (ret < 0) {
> > +    int ret =3D -1;
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +    s =3D accept(s, addr, addrlen);
> > +    if (s =3D=3D -1) {
> >          errno =3D socket_error();
> > +    } else {
> > +        ret =3D _open_osfhandle(s, _O_BINARY);
> > +        if (ret < 0) {
> > +            closesocket(s);
> > +            errno =3D ENOMEM;
> > +        }
> >      }
> >      return ret;
> >  }
> > @@ -363,7 +404,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr
> *addr,
> >  int qemu_shutdown_wrap(int sockfd, int how)
> >  {
> >      int ret;
> > -    ret =3D shutdown(sockfd, how);
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +    ret =3D shutdown(s, how);
> >      if (ret < 0) {
> >          errno =3D socket_error();
> >      }
> > @@ -375,7 +422,13 @@ int qemu_shutdown_wrap(int sockfd, int how)
> >  int qemu_ioctlsocket_wrap(int fd, int req, void *val)
> >  {
> >      int ret;
> > -    ret =3D ioctlsocket(fd, req, val);
> > +    SOCKET s =3D _get_osfhandle(fd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +    ret =3D ioctlsocket(s, req, val);
> >      if (ret < 0) {
> >          errno =3D socket_error();
> >      }
> > @@ -387,10 +440,28 @@ int qemu_ioctlsocket_wrap(int fd, int req, void
> *val)
> >  int qemu_closesocket_wrap(int fd)
> >  {
> >      int ret;
> > -    ret =3D closesocket(fd);
> > +    SOCKET s =3D _get_osfhandle(fd);
> > +
> > +    if (s =3D=3D -1) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * close() must be called before closesocket(), otherwise close()
> returns an
> > +     * error and sets EBADF.
> > +     */
> > +    ret =3D close(fd);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    /* closesocket() is required, event after close()! */
>
> As you mention in the commit message, this contradicts _open_osfhandle()
> documentation, which claims close() is enough.  I think the comment here
> should mention it, too.
>
> Found in an old Stackoverflow reply:
>
>     open() returns CRT file descriptors which is different from the
>     Win32 handle. You can create a CRT file descriptor using
>     _open_osfhandle(). But this is not recommened for sockets because
>     you cannot close the file in a clean way. You either use close()
>     which will leak the Winsock user-mode state, or closesocket() which
>     will leak the CRT descriptor.
>
>
> https://stackoverflow.com/questions/4676256/whats-the-difference-between-=
socket-and-handle-in-windows
>
> How can we be sure this is not an issue here?
>

With enough testing (example code above), error checking for close and
closesocket  & running the whole QEMU test suite, I hope it's ok..

--000000000000dd255405f523537c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 20, 2023 at 4:38 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_blank">a=
rmbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Until now, a win32 SOCKET handle is often cast to an int file<br>
&gt; descriptor, as this is what other OS use for sockets.<br>
<br>
Brief recap, to refamiliarize myself with the way this stuff works under<br=
>
Windows:<br>
<br>
1. Both POSIX and Windows use small integer file descriptors.<br>
<br>
2. With POSIX, these are an OS thing.=C2=A0 With Windows, these are a CRT<b=
r>
=C2=A0 =C2=A0thing, wrapping a HANDLE, which is the OS thing.<br>
<br>
3. A Windows HANDLE is to be treated as an abstract data type.<br>
<br>
4. _get_osfhandle() returns a CRT file descriptor&#39;s HANDLE.<br>
<br>
5. _open_osfhandle() creates a CRT file descriptor that wraps around a<br>
=C2=A0 =C2=A0HANDLE.<br>
<br>
6. Closing a CRT file descriptor also closes the wrapped HANDLE.<br>
<br>
7. A Windows SOCKET is also a HANDLE.=C2=A0 Maybe.=C2=A0 I guess.=C2=A0 Doc=
s are<br>
=C2=A0 =C2=A0confusing.<br></blockquote><div><br></div><div>Kind of, but no=
t really. I think a HANDLE is a kind of void*. You need to be careful using=
 it appropriately with the right functions. Sometime, a HANDLE can work wit=
h generic functions, like ReadFile, but you should not use a CloseHandle on=
 SOCKET, or registry key..<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
8. There&#39;s merry confusion between int, intptr_t, HANDLE, SOCKET, and<b=
r>
=C2=A0 =C2=A0who knows what else.<br></blockquote><div><br></div><div>indee=
d</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0When necessary,<br>
&gt; QEMU eventually queries whether it&#39;s a socket with the help of<br>
&gt; fd_is_socket(). However, there is no guarantee of conflict between the=
<br>
&gt; fd and SOCKET space. Such conflict would have surprising consequences,=
<br>
&gt; we shouldn&#39;t mix them.<br>
<br>
True.<br>
<br>
However, if conflicts were an issue in practice, conflating the two<br>
wouldn&#39;t be so common, don&#39;t you think?=C2=A0 File descriptors star=
t at zero.<br>
Perhaps SOCKETs are much bigger when interpreted as int?=C2=A0 Not really<b=
r>
relevant, because:<br></blockquote><div><br></div><div>They are usually fai=
rly low integers on my system.</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; Also, it is often forgotten that SOCKET must be closed with<br>
&gt; closesocket(), and not close().<br>
<br>
Yup.=C2=A0 After the next patch, we don&#39;t have to remember anymore outs=
ide<br>
oslib-win32.c, and that&#39;s a fairly compelling argument for this patch.<=
br>
<br>
&gt; Instead, let&#39;s make the win32 socket wrapper functions return and =
take a<br>
&gt; file descriptor, and let util/ wrappers do the fd/SOCKET conversion as=
<br>
&gt; necessary. A bit of adaptation is necessary in io/ as well.<br>
&gt;<br>
&gt; Unfortunately, we can&#39;t drop closesocket() usage, despite<br>
&gt; _open_osfhandle() documentation claiming transfer of ownership, testin=
g<br>
&gt; shows bad behaviour if you forget to call closesocket().<br>
<br>
I figure this refers to your patch to qemu_closesocket_wrap().=C2=A0 Correc=
t?<br>
<br>
What bad behavior did you observe in testing?<br></blockquote><div><br></di=
v><div>Weird failures, as if fd and SOCKET were mixed by the CRT.. ex of te=
st:<br></div><div>=C2=A0</div><div>#include &lt;winsock2.h&gt;<br>#include =
&lt;windows.h&gt;<br>#include &lt;io.h&gt;<br>#include &lt;assert.h&gt;<br>=
#include &lt;stdbool.h&gt;<br>#include &lt;stdio.h&gt;<br><br>static bool<b=
r>fd_is_socket(int fd)<br>{<br>=C2=A0 =C2=A0 int optval;<br>=C2=A0 =C2=A0 i=
nt optlen =3D sizeof(optval);<br>=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(=
fd);<br><br>=C2=A0 =C2=A0 return getsockopt(s, SOL_SOCKET, SO_TYPE, (char *=
)&amp;optval, &amp;optlen) =3D=3D 0;<br>}<br><br>static void<br>test(void)<=
br>{<br>=C2=A0 =C2=A0 SOCKET s;<br>=C2=A0 =C2=A0 int fd;<br>=C2=A0 =C2=A0 c=
har tmp[] =3D &quot;fooXXXXXX&quot;;<br><br>=C2=A0 =C2=A0 s =3D socket(AF_I=
NET, SOCK_STREAM, 0);<br>=C2=A0 =C2=A0 fd =3D _open_osfhandle(s, 0);<br>=C2=
=A0 =C2=A0 printf(&quot;sock: %d\n&quot;, fd);<br>=C2=A0 =C2=A0 assert(fd_i=
s_socket(fd));<br>=C2=A0 =C2=A0 assert(close(fd) =3D=3D 0);<br>=C2=A0 =C2=
=A0 /* if you comment this, test will fail after a few iterations */<br>=C2=
=A0 =C2=A0 assert(closesocket(s) =3D=3D 0);<br><br>=C2=A0 =C2=A0 fd =3D mks=
temp(tmp);<br>=C2=A0 =C2=A0 printf(&quot;tmp: %d\n&quot;, fd);<br>=C2=A0 =
=C2=A0 assert(!fd_is_socket(fd));<br>=C2=A0 =C2=A0 assert(close(fd) =3D=3D =
0);<br>}<br><br>int main(int argc, char *argv[])<br>{<br>=C2=A0 =C2=A0 int =
i;<br>=C2=A0 =C2=A0 WSADATA wsaData;<br><br>=C2=A0 =C2=A0 WSAStartup(MAKEWO=
RD(2,2), &amp;wsaData);<br><br>=C2=A0 =C2=A0 for (i =3D 0; i &lt; 40; i++) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 test();<br>=C2=A0 =C2=A0 }<br><br>=C2=A0 =
=C2=A0 return 0;<br>}</div><div><br></div><div>fd_is_socket() is wrong afte=
r a few iterations if you forget closesocket().<br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 io/channel-socket.c |=C2=A0 18 +++--<br>
&gt;=C2=A0 io/channel-watch.c=C2=A0 |=C2=A0 17 +++--<br>
&gt;=C2=A0 util/oslib-win32.c=C2=A0 | 164 +++++++++++++++++++++++++++++++++=
+++++------<br>
&gt;=C2=A0 3 files changed, 165 insertions(+), 34 deletions(-)<br>
&gt;<br>
&gt; diff --git a/io/channel-socket.c b/io/channel-socket.c<br>
&gt; index 2040297d2b..18cc062431 100644<br>
&gt; --- a/io/channel-socket.c<br>
&gt; +++ b/io/channel-socket.c<br>
&gt; @@ -426,6 +426,14 @@ static void qio_channel_socket_init(Object *obj)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 ioc-&gt;fd =3D -1;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void wsa_event_clear(int sockfd)<br>
&gt; +{<br>
&gt; +#ifdef WIN32<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +=C2=A0 =C2=A0 WSAEventSelect(s, NULL, 0);<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void qio_channel_socket_finalize(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QIOChannelSocket *ioc =3D QIO_CHANNEL_SOCKET(obj);=
<br>
&gt; @@ -441,9 +449,7 @@ static void qio_channel_socket_finalize(Object *ob=
j)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D =
NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -#ifdef WIN32<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 WSAEventSelect(ioc-&gt;fd, NULL, 0);<br>
&gt; -#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wsa_event_clear(ioc-&gt;fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(ioc-&gt;fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioc-&gt;fd =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -845,9 +851,7 @@ qio_channel_socket_close(QIOChannel *ioc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (sioc-&gt;fd !=3D -1) {<br>
&gt; -#ifdef WIN32<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 WSAEventSelect(sioc-&gt;fd, NULL, 0);<br>
&gt; -#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wsa_event_clear(sioc-&gt;fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qio_channel_has_feature(ioc, QIO=
_CHANNEL_FEATURE_LISTEN)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 socket_listen_cleanup(=
sioc-&gt;fd, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Factoring out wsa_event_clear() could be a separate patch.=C2=A0 Observatio=
n,<br>
not demand.<br></blockquote><div><br></div><div>ok</div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; @@ -899,7 +903,7 @@ static void qio_channel_socket_set_aio_fd_handler(=
QIOChannel *ioc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc)=
;<br>
&gt; -=C2=A0 =C2=A0 aio_set_fd_handler(ctx, sioc-&gt;fd, false,<br>
&gt; +=C2=A0 =C2=A0 aio_set_fd_handler(ctx, _get_osfhandle(sioc-&gt;fd), fa=
lse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0io_read, io_write, NULL, NULL, opaque);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/io/channel-watch.c b/io/channel-watch.c<br>
&gt; index ad7c568a84..8c1c24008f 100644<br>
&gt; --- a/io/channel-watch.c<br>
&gt; +++ b/io/channel-watch.c<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 #include &quot;io/channel-watch.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct QIOChannelFDSource QIOChannelFDSource;<br>
&gt; @@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel =
*ioc,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifdef CONFIG_WIN32<br>
&gt;=C2=A0 GSource *qio_channel_create_socket_watch(QIOChannel *ioc,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int socket,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int sockfd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GIOCondition condition)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
<br>
_get_osfhandle() returns a HANDLE as intptr_t.=C2=A0 Is a HANDLE that refer=
s<br>
to a socket also a SOCKET?=C2=A0 The docs I found so far are confusing...<b=
r></blockquote><div><br></div><div>yes</div><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GSource *source;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QIOChannelSocketSource *ssource;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 WSAEventSelect(socket, ioc-&gt;event,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
FD_READ | FD_ACCEPT | FD_CLOSE |<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
FD_CONNECT | FD_WRITE | FD_OOB);<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 WSAEventSelect(s, ioc-&gt;event,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0FD_READ | FD_ACCEPT | FD_CLOSE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0FD_CONNECT | FD_WRITE | FD_OOB) =3D=3D SOCKET_ERROR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree gchar *emsg =3D g_win32_error_=
message(GetLastError());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;error creating socket =
watch: %s&quot;, emsg);<br>
<br>
Uh, why is printing an error appropriate here?=C2=A0 Shouldn&#39;t we leave=
 error<br>
handling to callers?<br></blockquote><div><br></div><div>We could, but we w=
ould have to modify callers as well, which can go deep. I am considering a =
&amp;error_warn as a first approach (I am working on something to check oth=
er WSA API users). Does that sound reasonable?<br></div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, does GetLastError() do the right thing after _get_osfhandle()<br>
failure?=C2=A0 _get_osfhandle() is documented to set errno...<br>
<br></blockquote><div><br></div><div>Indeed, I better use errno.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 source =3D g_source_new(&amp;qio_channel_socket_so=
urce_funcs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(QIOChannelSocketSource));<br>
&gt; @@ -293,7 +300,7 @@ GSource *qio_channel_create_socket_watch(QIOChanne=
l *ioc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_ref(OBJECT(ioc));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssource-&gt;condition =3D condition;<br>
&gt; -=C2=A0 =C2=A0 ssource-&gt;socket =3D socket;<br>
&gt; +=C2=A0 =C2=A0 ssource-&gt;socket =3D s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssource-&gt;revents =3D 0;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ssource-&gt;fd.fd =3D (gintptr)ioc-&gt;event;<br>
&gt; diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
&gt; index 07ade41800..78fab521cf 100644<br>
&gt; --- a/util/oslib-win32.c<br>
&gt; +++ b/util/oslib-win32.c<br>
&gt; @@ -180,7 +180,8 @@ static int socket_error(void)<br>
&gt;=C2=A0 void qemu_socket_set_block(int fd)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned long opt =3D 0;<br>
&gt; -=C2=A0 =C2=A0 WSAEventSelect(fd, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(fd);<br>
&gt; +=C2=A0 =C2=A0 WSAEventSelect(s, NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ioctlsocket(fd, FIONBIO, &amp;opt);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -297,7 +298,13 @@ int qemu_connect_wrap(int sockfd, const struct so=
ckaddr *addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 socklen_t addrlen)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D connect(sockfd, addr, addrlen);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
<br>
_get_osfhandle() is documented to set errno to EBADF in this case.=C2=A0 If=
<br>
true, you change errno from EBADF to EINVAL.=C2=A0 Doesn&#39;t seem like an=
<br>
improvement :)<br></blockquote><div><br></div><div>right</div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
More of the same below, not pointing it out there.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D connect(s, addr, addrlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (WSAGetLastError() =3D=3D WSAEWOU=
LDBLOCK) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINPROGRESS;=
<br>
&gt; @@ -313,7 +320,13 @@ int qemu_connect_wrap(int sockfd, const struct so=
ckaddr *addr,<br>
&gt;=C2=A0 int qemu_listen_wrap(int sockfd, int backlog)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D listen(sockfd, backlog);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D listen(s, backlog);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -326,7 +339,13 @@ int qemu_bind_wrap(int sockfd, const struct socka=
ddr *addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0socklen_t addrlen)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D bind(sockfd, addr, addrlen);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D bind(s, addr, addrlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -337,12 +356,22 @@ int qemu_bind_wrap(int sockfd, const struct sock=
addr *addr,<br>
&gt;=C2=A0 #undef socket<br>
&gt;=C2=A0 int qemu_socket_wrap(int domain, int type, int protocol)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D socket(domain, type, protocol);<br>
&gt; -=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 SOCKET s;<br>
&gt; +=C2=A0 =C2=A0 int fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D socket(domain, type, protocol);<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fd =3D _open_osfhandle(s, _O_BINARY);<br>
&gt; +=C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOMEM;<br>
<br>
_open_osfhandle() is not documented to set errno, unlike<br>
_get_osfhandle().=C2=A0 So, okay, I guess.<br>
<br>
Similar uses below, also okay.<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return fd;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; @@ -350,10 +379,22 @@ int qemu_socket_wrap(int domain, int type, int p=
rotocol)<br>
&gt;=C2=A0 int qemu_accept_wrap(int sockfd, struct sockaddr *addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0socklen_t *addrlen)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D accept(sockfd, addr, addrlen);<br>
&gt; -=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 int ret =3D -1;<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s =3D accept(s, addr, addrlen);<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D _open_osfhandle(s, _O_BINARY);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 closesocket(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt; @@ -363,7 +404,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr =
*addr,<br>
&gt;=C2=A0 int qemu_shutdown_wrap(int sockfd, int how)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D shutdown(sockfd, how);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(sockfd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D shutdown(s, how);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -375,7 +422,13 @@ int qemu_shutdown_wrap(int sockfd, int how)<br>
&gt;=C2=A0 int qemu_ioctlsocket_wrap(int fd, int req, void *val)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D ioctlsocket(fd, req, val);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(fd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ret =3D ioctlsocket(s, req, val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D socket_error();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -387,10 +440,28 @@ int qemu_ioctlsocket_wrap(int fd, int req, void =
*val)<br>
&gt;=C2=A0 int qemu_closesocket_wrap(int fd)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt; -=C2=A0 =C2=A0 ret =3D closesocket(fd);<br>
&gt; +=C2=A0 =C2=A0 SOCKET s =3D _get_osfhandle(fd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* close() must be called before closesocket(), ot=
herwise close() returns an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* error and sets EBADF.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 ret =3D close(fd);<br>
&gt; +=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* closesocket() is required, event after close()! */<b=
r>
<br>
As you mention in the commit message, this contradicts _open_osfhandle()<br=
>
documentation, which claims close() is enough.=C2=A0 I think the comment he=
re<br>
should mention it, too.<br>
<br>
Found in an old Stackoverflow reply:<br>
<br>
=C2=A0 =C2=A0 open() returns CRT file descriptors which is different from t=
he<br>
=C2=A0 =C2=A0 Win32 handle. You can create a CRT file descriptor using<br>
=C2=A0 =C2=A0 _open_osfhandle(). But this is not recommened for sockets bec=
ause<br>
=C2=A0 =C2=A0 you cannot close the file in a clean way. You either use clos=
e()<br>
=C2=A0 =C2=A0 which will leak the Winsock user-mode state, or closesocket()=
 which<br>
=C2=A0 =C2=A0 will leak the CRT descriptor.<br>
<br>
<a href=3D"https://stackoverflow.com/questions/4676256/whats-the-difference=
-between-socket-and-handle-in-windows" rel=3D"noreferrer" target=3D"_blank"=
>https://stackoverflow.com/questions/4676256/whats-the-difference-between-s=
ocket-and-handle-in-windows</a><br>
<br>
How can we be sure this is not an issue here?<br></blockquote><div><br></di=
v><div>With enough testing (example code above), error checking for close a=
nd closesocket=C2=A0 &amp; running the whole QEMU test suite, I hope it&#39=
;s ok..<br></div><br></div></div>

--000000000000dd255405f523537c--


