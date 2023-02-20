Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6B69CB28
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU5Rd-00080z-8K; Mon, 20 Feb 2023 07:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU5Ra-000803-7K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU5RX-0005h0-U3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 07:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676896735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BSf74cTUjnd8sQTueyoxUZpvfVCxNglttNrzkxwe/og=;
 b=TxexDSek3kiN2F9Lzk3sjbvRjY8MzExmwCQsmEru3qhxHPNdXdIqMwvLFAPI6TF8whNYBW
 B9KklkmdACwnHm4fs9foYByk3GH4fTsZ52j722f1hrGY2nf3JSdhypRW4eMJJDZN+QJvir
 nYV8QXD5Snabt66+5ChakPViOdkiYTY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-650qXDoFMLKFJ5_XMTzbZA-1; Mon, 20 Feb 2023 07:38:52 -0500
X-MC-Unique: 650qXDoFMLKFJ5_XMTzbZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5D0A29AA2C5;
 Mon, 20 Feb 2023 12:38:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 496F72166B26;
 Mon, 20 Feb 2023 12:38:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 335F821E6A1F; Mon, 20 Feb 2023 13:38:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  qemu-arm@nongnu.org,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
Date: Mon, 20 Feb 2023 13:38:50 +0100
In-Reply-To: <20230212204942.1905959-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 13 Feb 2023 00:49:41 +0400")
Message-ID: <87r0ukbjfp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Until now, a win32 SOCKET handle is often cast to an int file
> descriptor, as this is what other OS use for sockets.

Brief recap, to refamiliarize myself with the way this stuff works under
Windows:

1. Both POSIX and Windows use small integer file descriptors.

2. With POSIX, these are an OS thing.  With Windows, these are a CRT
   thing, wrapping a HANDLE, which is the OS thing.

3. A Windows HANDLE is to be treated as an abstract data type.

4. _get_osfhandle() returns a CRT file descriptor's HANDLE.

5. _open_osfhandle() creates a CRT file descriptor that wraps around a
   HANDLE.

6. Closing a CRT file descriptor also closes the wrapped HANDLE.

7. A Windows SOCKET is also a HANDLE.  Maybe.  I guess.  Docs are
   confusing.

8. There's merry confusion between int, intptr_t, HANDLE, SOCKET, and
   who knows what else.

>                                                       When necessary,
> QEMU eventually queries whether it's a socket with the help of
> fd_is_socket(). However, there is no guarantee of conflict between the
> fd and SOCKET space. Such conflict would have surprising consequences,
> we shouldn't mix them.

True.

However, if conflicts were an issue in practice, conflating the two
wouldn't be so common, don't you think?  File descriptors start at zero.
Perhaps SOCKETs are much bigger when interpreted as int?  Not really
relevant, because:

> Also, it is often forgotten that SOCKET must be closed with
> closesocket(), and not close().

Yup.  After the next patch, we don't have to remember anymore outside
oslib-win32.c, and that's a fairly compelling argument for this patch.

> Instead, let's make the win32 socket wrapper functions return and take a
> file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> necessary. A bit of adaptation is necessary in io/ as well.
>
> Unfortunately, we can't drop closesocket() usage, despite
> _open_osfhandle() documentation claiming transfer of ownership, testing
> shows bad behaviour if you forget to call closesocket().

I figure this refers to your patch to qemu_closesocket_wrap().  Correct?

What bad behavior did you observe in testing?

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  io/channel-socket.c |  18 +++--
>  io/channel-watch.c  |  17 +++--
>  util/oslib-win32.c  | 164 ++++++++++++++++++++++++++++++++++++++------
>  3 files changed, 165 insertions(+), 34 deletions(-)
>
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 2040297d2b..18cc062431 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -426,6 +426,14 @@ static void qio_channel_socket_init(Object *obj)
>      ioc->fd =3D -1;
>  }
>=20=20
> +static void wsa_event_clear(int sockfd)
> +{
> +#ifdef WIN32
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +    WSAEventSelect(s, NULL, 0);
> +#endif
> +}
> +
>  static void qio_channel_socket_finalize(Object *obj)
>  {
>      QIOChannelSocket *ioc =3D QIO_CHANNEL_SOCKET(obj);
> @@ -441,9 +449,7 @@ static void qio_channel_socket_finalize(Object *obj)
>                  err =3D NULL;
>              }
>          }
> -#ifdef WIN32
> -        WSAEventSelect(ioc->fd, NULL, 0);
> -#endif
> +        wsa_event_clear(ioc->fd);
>          closesocket(ioc->fd);
>          ioc->fd =3D -1;
>      }
> @@ -845,9 +851,7 @@ qio_channel_socket_close(QIOChannel *ioc,
>      Error *err =3D NULL;
>=20=20
>      if (sioc->fd !=3D -1) {
> -#ifdef WIN32
> -        WSAEventSelect(sioc->fd, NULL, 0);
> -#endif
> +        wsa_event_clear(sioc->fd);
>          if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
>              socket_listen_cleanup(sioc->fd, errp);
>          }

Factoring out wsa_event_clear() could be a separate patch.  Observation,
not demand.

> @@ -899,7 +903,7 @@ static void qio_channel_socket_set_aio_fd_handler(QIO=
Channel *ioc,
>                                                    void *opaque)
>  {
>      QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> -    aio_set_fd_handler(ctx, sioc->fd, false,
> +    aio_set_fd_handler(ctx, _get_osfhandle(sioc->fd), false,
>                         io_read, io_write, NULL, NULL, opaque);
>  }
>=20=20
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index ad7c568a84..8c1c24008f 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -19,6 +19,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "io/channel-watch.h"
>=20=20
>  typedef struct QIOChannelFDSource QIOChannelFDSource;
> @@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel *io=
c,
>=20=20
>  #ifdef CONFIG_WIN32
>  GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
> -                                         int socket,
> +                                         int sockfd,
>                                           GIOCondition condition)
>  {
> +    SOCKET s =3D _get_osfhandle(sockfd);

_get_osfhandle() returns a HANDLE as intptr_t.  Is a HANDLE that refers
to a socket also a SOCKET?  The docs I found so far are confusing...

>      GSource *source;
>      QIOChannelSocketSource *ssource;
>=20=20
> -    WSAEventSelect(socket, ioc->event,
> -                   FD_READ | FD_ACCEPT | FD_CLOSE |
> -                   FD_CONNECT | FD_WRITE | FD_OOB);
> +    if (s =3D=3D -1 ||
> +        WSAEventSelect(s, ioc->event,
> +                       FD_READ | FD_ACCEPT | FD_CLOSE |
> +                       FD_CONNECT | FD_WRITE | FD_OOB) =3D=3D SOCKET_ERR=
OR) {
> +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError());
> +        error_printf("error creating socket watch: %s", emsg);

Uh, why is printing an error appropriate here?  Shouldn't we leave error
handling to callers?

Also, does GetLastError() do the right thing after _get_osfhandle()
failure?  _get_osfhandle() is documented to set errno...

> +        return NULL;
> +    }
>=20=20
>      source =3D g_source_new(&qio_channel_socket_source_funcs,
>                            sizeof(QIOChannelSocketSource));
> @@ -293,7 +300,7 @@ GSource *qio_channel_create_socket_watch(QIOChannel *=
ioc,
>      object_ref(OBJECT(ioc));
>=20=20
>      ssource->condition =3D condition;
> -    ssource->socket =3D socket;
> +    ssource->socket =3D s;
>      ssource->revents =3D 0;
>=20=20
>      ssource->fd.fd =3D (gintptr)ioc->event;
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 07ade41800..78fab521cf 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -180,7 +180,8 @@ static int socket_error(void)
>  void qemu_socket_set_block(int fd)
>  {
>      unsigned long opt =3D 0;
> -    WSAEventSelect(fd, NULL, 0);
> +    SOCKET s =3D _get_osfhandle(fd);
> +    WSAEventSelect(s, NULL, 0);
>      ioctlsocket(fd, FIONBIO, &opt);
>  }
>=20=20
> @@ -297,7 +298,13 @@ int qemu_connect_wrap(int sockfd, const struct socka=
ddr *addr,
>                        socklen_t addrlen)
>  {
>      int ret;
> -    ret =3D connect(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;

_get_osfhandle() is documented to set errno to EBADF in this case.  If
true, you change errno from EBADF to EINVAL.  Doesn't seem like an
improvement :)

More of the same below, not pointing it out there.

> +        return -1;
> +    }
> +    ret =3D connect(s, addr, addrlen);
>      if (ret < 0) {
>          if (WSAGetLastError() =3D=3D WSAEWOULDBLOCK) {
>              errno =3D EINPROGRESS;
> @@ -313,7 +320,13 @@ int qemu_connect_wrap(int sockfd, const struct socka=
ddr *addr,
>  int qemu_listen_wrap(int sockfd, int backlog)
>  {
>      int ret;
> -    ret =3D listen(sockfd, backlog);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D listen(s, backlog);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -326,7 +339,13 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr=
 *addr,
>                     socklen_t addrlen)
>  {
>      int ret;
> -    ret =3D bind(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D bind(s, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -337,12 +356,22 @@ int qemu_bind_wrap(int sockfd, const struct sockadd=
r *addr,
>  #undef socket
>  int qemu_socket_wrap(int domain, int type, int protocol)
>  {
> -    int ret;
> -    ret =3D socket(domain, type, protocol);
> -    if (ret < 0) {
> +    SOCKET s;
> +    int fd;
> +
> +    s =3D socket(domain, type, protocol);
> +    if (s =3D=3D -1) {
>          errno =3D socket_error();
> +        return -1;
>      }
> -    return ret;
> +
> +    fd =3D _open_osfhandle(s, _O_BINARY);
> +    if (fd < 0) {
> +        closesocket(s);
> +        errno =3D ENOMEM;

_open_osfhandle() is not documented to set errno, unlike
_get_osfhandle().  So, okay, I guess.

Similar uses below, also okay.

> +    }
> +
> +    return fd;
>  }
>=20=20
>=20=20
> @@ -350,10 +379,22 @@ int qemu_socket_wrap(int domain, int type, int prot=
ocol)
>  int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
>                       socklen_t *addrlen)
>  {
> -    int ret;
> -    ret =3D accept(sockfd, addr, addrlen);
> -    if (ret < 0) {
> +    int ret =3D -1;
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    s =3D accept(s, addr, addrlen);
> +    if (s =3D=3D -1) {
>          errno =3D socket_error();
> +    } else {
> +        ret =3D _open_osfhandle(s, _O_BINARY);
> +        if (ret < 0) {
> +            closesocket(s);
> +            errno =3D ENOMEM;
> +        }
>      }
>      return ret;
>  }
> @@ -363,7 +404,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr *ad=
dr,
>  int qemu_shutdown_wrap(int sockfd, int how)
>  {
>      int ret;
> -    ret =3D shutdown(sockfd, how);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D shutdown(s, how);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -375,7 +422,13 @@ int qemu_shutdown_wrap(int sockfd, int how)
>  int qemu_ioctlsocket_wrap(int fd, int req, void *val)
>  {
>      int ret;
> -    ret =3D ioctlsocket(fd, req, val);
> +    SOCKET s =3D _get_osfhandle(fd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D ioctlsocket(s, req, val);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -387,10 +440,28 @@ int qemu_ioctlsocket_wrap(int fd, int req, void *va=
l)
>  int qemu_closesocket_wrap(int fd)
>  {
>      int ret;
> -    ret =3D closesocket(fd);
> +    SOCKET s =3D _get_osfhandle(fd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +
> +    /*
> +     * close() must be called before closesocket(), otherwise close() re=
turns an
> +     * error and sets EBADF.
> +     */
> +    ret =3D close(fd);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* closesocket() is required, event after close()! */

As you mention in the commit message, this contradicts _open_osfhandle()
documentation, which claims close() is enough.  I think the comment here
should mention it, too.

Found in an old Stackoverflow reply:

    open() returns CRT file descriptors which is different from the
    Win32 handle. You can create a CRT file descriptor using
    _open_osfhandle(). But this is not recommened for sockets because
    you cannot close the file in a clean way. You either use close()
    which will leak the Winsock user-mode state, or closesocket() which
    will leak the CRT descriptor.

https://stackoverflow.com/questions/4676256/whats-the-difference-between-so=
cket-and-handle-in-windows

How can we be sure this is not an issue here?

> +    ret =3D closesocket(s);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> +
>      return ret;
>  }
>=20=20

[...]


