Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E888693A08
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 21:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRJJ2-0004zl-Rt; Sun, 12 Feb 2023 15:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIX-0004W8-Qf
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIV-0002Av-1D
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676235005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfCpQ24VnaDsbMJsvnpcwQdy4D0AoKUoiSA/11MsIic=;
 b=YVx7EftKi5EmoyW6YihMtNTpO9b9ofly14lSuZtWv4ez8fhV+s1gddWm9sD7fVKivkeNUh
 aJuzpSGy0ae4Wsaz1ZaNT0dXE7pHXZ7a7kbokmLyDRDtItrd8uTe3Y4h5s9fw0B6RCjFku
 hu1I8V15jpXAbX52KCVaOUGIdXm7t3U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-TmhRSAs8MhK_-rRmCus71Q-1; Sun, 12 Feb 2023 15:50:02 -0500
X-MC-Unique: TmhRSAs8MhK_-rRmCus71Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53EB885A588;
 Sun, 12 Feb 2023 20:50:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90121492B15;
 Sun, 12 Feb 2023 20:49:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
Date: Mon, 13 Feb 2023 00:49:41 +0400
Message-Id: <20230212204942.1905959-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Until now, a win32 SOCKET handle is often cast to an int file
descriptor, as this is what other OS use for sockets. When necessary,
QEMU eventually queries whether it's a socket with the help of
fd_is_socket(). However, there is no guarantee of conflict between the
fd and SOCKET space. Such conflict would have surprising consequences,
we shouldn't mix them.

Also, it is often forgotten that SOCKET must be closed with
closesocket(), and not close().

Instead, let's make the win32 socket wrapper functions return and take a
file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
necessary. A bit of adaptation is necessary in io/ as well.

Unfortunately, we can't drop closesocket() usage, despite
_open_osfhandle() documentation claiming transfer of ownership, testing
shows bad behaviour if you forget to call closesocket().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 io/channel-socket.c |  18 +++--
 io/channel-watch.c  |  17 +++--
 util/oslib-win32.c  | 164 ++++++++++++++++++++++++++++++++++++++------
 3 files changed, 165 insertions(+), 34 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 2040297d2b..18cc062431 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -426,6 +426,14 @@ static void qio_channel_socket_init(Object *obj)
     ioc->fd = -1;
 }
 
+static void wsa_event_clear(int sockfd)
+{
+#ifdef WIN32
+    SOCKET s = _get_osfhandle(sockfd);
+    WSAEventSelect(s, NULL, 0);
+#endif
+}
+
 static void qio_channel_socket_finalize(Object *obj)
 {
     QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(obj);
@@ -441,9 +449,7 @@ static void qio_channel_socket_finalize(Object *obj)
                 err = NULL;
             }
         }
-#ifdef WIN32
-        WSAEventSelect(ioc->fd, NULL, 0);
-#endif
+        wsa_event_clear(ioc->fd);
         closesocket(ioc->fd);
         ioc->fd = -1;
     }
@@ -845,9 +851,7 @@ qio_channel_socket_close(QIOChannel *ioc,
     Error *err = NULL;
 
     if (sioc->fd != -1) {
-#ifdef WIN32
-        WSAEventSelect(sioc->fd, NULL, 0);
-#endif
+        wsa_event_clear(sioc->fd);
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
         }
@@ -899,7 +903,7 @@ static void qio_channel_socket_set_aio_fd_handler(QIOChannel *ioc,
                                                   void *opaque)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
-    aio_set_fd_handler(ctx, sioc->fd, false,
+    aio_set_fd_handler(ctx, _get_osfhandle(sioc->fd), false,
                        io_read, io_write, NULL, NULL, opaque);
 }
 
diff --git a/io/channel-watch.c b/io/channel-watch.c
index ad7c568a84..8c1c24008f 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "io/channel-watch.h"
 
 typedef struct QIOChannelFDSource QIOChannelFDSource;
@@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel *ioc,
 
 #ifdef CONFIG_WIN32
 GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
-                                         int socket,
+                                         int sockfd,
                                          GIOCondition condition)
 {
+    SOCKET s = _get_osfhandle(sockfd);
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-    WSAEventSelect(socket, ioc->event,
-                   FD_READ | FD_ACCEPT | FD_CLOSE |
-                   FD_CONNECT | FD_WRITE | FD_OOB);
+    if (s == -1 ||
+        WSAEventSelect(s, ioc->event,
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB) == SOCKET_ERROR) {
+        g_autofree gchar *emsg = g_win32_error_message(GetLastError());
+        error_printf("error creating socket watch: %s", emsg);
+        return NULL;
+    }
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
@@ -293,7 +300,7 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     object_ref(OBJECT(ioc));
 
     ssource->condition = condition;
-    ssource->socket = socket;
+    ssource->socket = s;
     ssource->revents = 0;
 
     ssource->fd.fd = (gintptr)ioc->event;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 07ade41800..78fab521cf 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,8 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    WSAEventSelect(fd, NULL, 0);
+    SOCKET s = _get_osfhandle(fd);
+    WSAEventSelect(s, NULL, 0);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -297,7 +298,13 @@ int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
 {
     int ret;
-    ret = connect(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = connect(s, addr, addrlen);
     if (ret < 0) {
         if (WSAGetLastError() == WSAEWOULDBLOCK) {
             errno = EINPROGRESS;
@@ -313,7 +320,13 @@ int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
 int qemu_listen_wrap(int sockfd, int backlog)
 {
     int ret;
-    ret = listen(sockfd, backlog);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = listen(s, backlog);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -326,7 +339,13 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
                    socklen_t addrlen)
 {
     int ret;
-    ret = bind(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = bind(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -337,12 +356,22 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr *addr,
 #undef socket
 int qemu_socket_wrap(int domain, int type, int protocol)
 {
-    int ret;
-    ret = socket(domain, type, protocol);
-    if (ret < 0) {
+    SOCKET s;
+    int fd;
+
+    s = socket(domain, type, protocol);
+    if (s == -1) {
         errno = socket_error();
+        return -1;
     }
-    return ret;
+
+    fd = _open_osfhandle(s, _O_BINARY);
+    if (fd < 0) {
+        closesocket(s);
+        errno = ENOMEM;
+    }
+
+    return fd;
 }
 
 
@@ -350,10 +379,22 @@ int qemu_socket_wrap(int domain, int type, int protocol)
 int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
                      socklen_t *addrlen)
 {
-    int ret;
-    ret = accept(sockfd, addr, addrlen);
-    if (ret < 0) {
+    int ret = -1;
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    s = accept(s, addr, addrlen);
+    if (s == -1) {
         errno = socket_error();
+    } else {
+        ret = _open_osfhandle(s, _O_BINARY);
+        if (ret < 0) {
+            closesocket(s);
+            errno = ENOMEM;
+        }
     }
     return ret;
 }
@@ -363,7 +404,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
 int qemu_shutdown_wrap(int sockfd, int how)
 {
     int ret;
-    ret = shutdown(sockfd, how);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = shutdown(s, how);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -375,7 +422,13 @@ int qemu_shutdown_wrap(int sockfd, int how)
 int qemu_ioctlsocket_wrap(int fd, int req, void *val)
 {
     int ret;
-    ret = ioctlsocket(fd, req, val);
+    SOCKET s = _get_osfhandle(fd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = ioctlsocket(s, req, val);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -387,10 +440,28 @@ int qemu_ioctlsocket_wrap(int fd, int req, void *val)
 int qemu_closesocket_wrap(int fd)
 {
     int ret;
-    ret = closesocket(fd);
+    SOCKET s = _get_osfhandle(fd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+
+    /*
+     * close() must be called before closesocket(), otherwise close() returns an
+     * error and sets EBADF.
+     */
+    ret = close(fd);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* closesocket() is required, event after close()! */
+    ret = closesocket(s);
     if (ret < 0) {
         errno = socket_error();
     }
+
     return ret;
 }
 
@@ -400,7 +471,14 @@ int qemu_getsockopt_wrap(int sockfd, int level, int optname,
                          void *optval, socklen_t *optlen)
 {
     int ret;
-    ret = getsockopt(sockfd, level, optname, optval, optlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+
+    ret = getsockopt(s, level, optname, optval, optlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -413,7 +491,13 @@ int qemu_setsockopt_wrap(int sockfd, int level, int optname,
                          const void *optval, socklen_t optlen)
 {
     int ret;
-    ret = setsockopt(sockfd, level, optname, optval, optlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = setsockopt(s, level, optname, optval, optlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -426,7 +510,13 @@ int qemu_getpeername_wrap(int sockfd, struct sockaddr *addr,
                           socklen_t *addrlen)
 {
     int ret;
-    ret = getpeername(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = getpeername(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -439,7 +529,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockaddr *addr,
                           socklen_t *addrlen)
 {
     int ret;
-    ret = getsockname(sockfd, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = getsockname(s, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -451,7 +547,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockaddr *addr,
 ssize_t qemu_send_wrap(int sockfd, const void *buf, size_t len, int flags)
 {
     int ret;
-    ret = send(sockfd, buf, len, flags);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = send(s, buf, len, flags);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -464,7 +566,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf, size_t len, int flags,
                          const struct sockaddr *addr, socklen_t addrlen)
 {
     int ret;
-    ret = sendto(sockfd, buf, len, flags, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = sendto(s, buf, len, flags, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -476,7 +584,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf, size_t len, int flags,
 ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags)
 {
     int ret;
-    ret = recv(sockfd, buf, len, flags);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = recv(s, buf, len, flags);
     if (ret < 0) {
         errno = socket_error();
     }
@@ -489,7 +603,13 @@ ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen)
 {
     int ret;
-    ret = recvfrom(sockfd, buf, len, flags, addr, addrlen);
+    SOCKET s = _get_osfhandle(sockfd);
+
+    if (s == -1) {
+        errno = EINVAL;
+        return -1;
+    }
+    ret = recvfrom(s, buf, len, flags, addr, addrlen);
     if (ret < 0) {
         errno = socket_error();
     }
-- 
2.39.1


