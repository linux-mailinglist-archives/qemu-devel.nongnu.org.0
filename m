Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400F557F71
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:09:35 +0200 (CEST)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4POg-0000iy-3w
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o4P9T-0005iW-0e
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o4P9Q-00052y-K1
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655999624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzQEl6Oah2Xo3zMJ/YTxqBMp3VN5aG6zKPl5WMrBrEk=;
 b=LEgak4dbkiPAPFyikG7/iPx6RXJPH5V95zLpMyBcBh4Oe5PB3G1BuX/iZB9YCxtGxLDkhl
 raAHigVriq4w7HQ34pNfoSXaFSQmLLGLUkcCEnvrubtJCPWbJG7u9KHZ0KhaMZqI8i1cTT
 hU8vpCaQcwrUr8/WYhe6yNZMo9i9/H0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-mVe2RKpLO4aPeLOhIB1HOA-1; Thu, 23 Jun 2022 11:53:42 -0400
X-MC-Unique: mVe2RKpLO4aPeLOhIB1HOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A81781D9CA
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 15:53:42 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8763EC15D42;
 Thu, 23 Jun 2022 15:53:40 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 11/11] net: stream: move to QIO
Date: Thu, 23 Jun 2022 17:53:17 +0200
Message-Id: <20220623155317.675932-12-lvivier@redhat.com>
In-Reply-To: <20220623155317.675932-1-lvivier@redhat.com>
References: <20220623155317.675932-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use QIOChannel, QIOChannelSocket and QIONetListener.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/stream.c | 475 ++++++++++++++++++---------------------------------
 1 file changed, 165 insertions(+), 310 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 7df3bb2691a8..6e9952c7c3ef 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -34,48 +34,36 @@
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/cutils.h"
+#include "io/channel.h"
+#include "io/channel-socket.h"
+#include "io/net-listener.h"
 
 typedef struct NetStreamState {
     NetClientState nc;
-    int listen_fd;
-    int fd;
+    QIOChannel *listen_ioc;
+    QIONetListener *listener;
+    QIOChannel *ioc;
+    guint ioc_read_tag;
+    guint ioc_write_tag;
     SocketReadState rs;
     unsigned int send_index;      /* number of bytes sent*/
-    IOHandler *send_fn;
-    bool read_poll;               /* waiting to receive data? */
-    bool write_poll;              /* waiting to transmit data? */
 } NetStreamState;
 
-static void net_stream_accept(void *opaque);
-static void net_stream_writable(void *opaque);
+static void net_stream_listen(QIONetListener *listener,
+                              QIOChannelSocket *cioc,
+                              void *opaque);
 
-static void net_stream_update_fd_handler(NetStreamState *s)
+static gboolean net_stream_writable(QIOChannel *ioc,
+                                    GIOCondition condition,
+                                    gpointer data)
 {
-    qemu_set_fd_handler(s->fd,
-                        s->read_poll ? s->send_fn : NULL,
-                        s->write_poll ? net_stream_writable : NULL,
-                        s);
-}
-
-static void net_stream_read_poll(NetStreamState *s, bool enable)
-{
-    s->read_poll = enable;
-    net_stream_update_fd_handler(s);
-}
-
-static void net_stream_write_poll(NetStreamState *s, bool enable)
-{
-    s->write_poll = enable;
-    net_stream_update_fd_handler(s);
-}
-
-static void net_stream_writable(void *opaque)
-{
-    NetStreamState *s = opaque;
+    NetStreamState *s = data;
 
-    net_stream_write_poll(s, false);
+    s->ioc_write_tag = 0;
 
     qemu_flush_queued_packets(&s->nc);
+
+    return G_SOURCE_REMOVE;
 }
 
 static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
@@ -92,12 +80,15 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
             .iov_len  = size,
         },
     };
+    struct iovec local_iov[2];
+    unsigned int nlocal_iov;
     size_t remaining;
     ssize_t ret;
 
-    remaining = iov_size(iov, 2) - s->send_index;
-    ret = iov_send(s->fd, iov, 2, s->send_index, remaining);
 
+    remaining = iov_size(iov, 2) - s->send_index;
+    nlocal_iov = iov_copy(local_iov, 2, iov, 2, s->send_index, remaining);
+    ret = qio_channel_writev(s->ioc, local_iov, nlocal_iov, NULL);
     if (ret == -1 && errno == EAGAIN) {
         ret = 0; /* handled further down */
     }
@@ -107,19 +98,25 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
     }
     if (ret < (ssize_t)remaining) {
         s->send_index += ret;
-        net_stream_write_poll(s, true);
+        s->ioc_write_tag = qio_channel_add_watch(s->ioc, G_IO_OUT,
+                                                 net_stream_writable, s, NULL);
         return 0;
     }
     s->send_index = 0;
     return size;
 }
 
+static gboolean net_stream_send(QIOChannel *ioc,
+                                GIOCondition condition,
+                                gpointer data);
+
 static void net_stream_send_completed(NetClientState *nc, ssize_t len)
 {
     NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
 
-    if (!s->read_poll) {
-        net_stream_read_poll(s, true);
+    if (!s->ioc_read_tag) {
+        s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN,
+                                                net_stream_send, s, NULL);
     }
 }
 
@@ -130,19 +127,24 @@ static void net_stream_rs_finalize(SocketReadState *rs)
     if (qemu_send_packet_async(&s->nc, rs->buf,
                                rs->packet_len,
                                net_stream_send_completed) == 0) {
-        net_stream_read_poll(s, false);
+        if (s->ioc_read_tag) {
+            g_source_remove(s->ioc_read_tag);
+            s->ioc_read_tag = 0;
+        }
     }
 }
 
-static void net_stream_send(void *opaque)
+static gboolean net_stream_send(QIOChannel *ioc,
+                                GIOCondition condition,
+                                gpointer data)
 {
-    NetStreamState *s = opaque;
+    NetStreamState *s = data;
     int size;
     int ret;
-    uint8_t buf1[NET_BUFSIZE];
-    const uint8_t *buf;
+    char buf1[NET_BUFSIZE];
+    const char *buf;
 
-    size = recv(s->fd, buf1, sizeof(buf1), 0);
+    size = qio_channel_read(s->ioc, buf1, sizeof(buf1), NULL);
     if (size < 0) {
         if (errno != EWOULDBLOCK) {
             goto eoc;
@@ -150,52 +152,63 @@ static void net_stream_send(void *opaque)
     } else if (size == 0) {
         /* end of connection */
     eoc:
-        net_stream_read_poll(s, false);
-        net_stream_write_poll(s, false);
-        if (s->listen_fd != -1) {
-            qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
+        s->ioc_read_tag = 0;
+        if (s->ioc_write_tag) {
+            g_source_remove(s->ioc_write_tag);
+            s->ioc_write_tag = 0;
+        }
+        if (s->listener) {
+            qio_net_listener_set_client_func(s->listener, net_stream_listen,
+                                             s, NULL);
         }
-        closesocket(s->fd);
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
 
-        s->fd = -1;
         net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
         s->nc.link_down = true;
         memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
 
-        return;
+        return G_SOURCE_REMOVE;
     }
     buf = buf1;
 
-    ret = net_fill_rstate(&s->rs, buf, size);
+    ret = net_fill_rstate(&s->rs, (const uint8_t *)buf, size);
 
     if (ret == -1) {
         goto eoc;
     }
+
+    return G_SOURCE_CONTINUE;
 }
 
 static void net_stream_cleanup(NetClientState *nc)
 {
     NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
-    if (s->fd != -1) {
-        net_stream_read_poll(s, false);
-        net_stream_write_poll(s, false);
-        close(s->fd);
-        s->fd = -1;
+    if (s->ioc) {
+        if (QIO_CHANNEL_SOCKET(s->ioc)->fd != -1) {
+            if (s->ioc_read_tag) {
+                g_source_remove(s->ioc_read_tag);
+                s->ioc_read_tag = 0;
+            }
+            if (s->ioc_write_tag) {
+                g_source_remove(s->ioc_write_tag);
+                s->ioc_write_tag = 0;
+            }
+        }
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
     }
-    if (s->listen_fd != -1) {
-        qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
-        closesocket(s->listen_fd);
-        s->listen_fd = -1;
+    if (s->listen_ioc) {
+        if (s->listener) {
+            qio_net_listener_disconnect(s->listener);
+            object_unref(OBJECT(s->listener));
+            s->listener = NULL;
+        }
+        object_unref(OBJECT(s->listen_ioc));
+        s->listen_ioc = NULL;
     }
 }
 
-static void net_stream_connect(void *opaque)
-{
-    NetStreamState *s = opaque;
-    s->send_fn = net_stream_send;
-    net_stream_read_poll(s, true);
-}
-
 static NetClientInfo net_stream_info = {
     .type = NET_CLIENT_DRIVER_STREAM,
     .size = sizeof(NetStreamState),
@@ -203,77 +216,64 @@ static NetClientInfo net_stream_info = {
     .cleanup = net_stream_cleanup,
 };
 
-static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
-                                                 const char *model,
-                                                 const char *name,
-                                                 int fd, int is_connected)
+static void net_stream_listen(QIONetListener *listener,
+                              QIOChannelSocket *cioc,
+                              void *opaque)
 {
-    NetClientState *nc;
-    NetStreamState *s;
+    NetStreamState *s = opaque;
+    SocketAddress *addr;
+    char *uri;
 
-    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    object_ref(OBJECT(cioc));
 
-    snprintf(nc->info_str, sizeof(nc->info_str), "fd=%d", fd);
+    qio_net_listener_set_client_func(s->listener, NULL, s, NULL);
 
-    s = DO_UPCAST(NetStreamState, nc, nc);
+    s->ioc = QIO_CHANNEL(cioc);
+    qio_channel_set_name(s->ioc, "stream-server");
+    s->nc.link_down = false;
 
-    s->fd = fd;
-    s->listen_fd = -1;
-    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
+                                            s, NULL);
 
-    /* Disable Nagle algorithm on TCP sockets to reduce latency */
-    socket_set_nodelay(fd);
+    addr = qio_channel_socket_get_remote_address(cioc, NULL);
+    g_assert(addr != NULL);
+    uri = socket_uri(addr);
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), uri);
+    g_free(uri);
+    qapi_free_SocketAddress(addr);
 
-    if (is_connected) {
-        net_stream_connect(s);
-    } else {
-        qemu_set_fd_handler(s->fd, NULL, net_stream_connect, s);
-    }
-    return s;
 }
 
-static void net_stream_accept(void *opaque)
+static void net_stream_server_listening(QIOTask *task, gpointer opaque)
 {
     NetStreamState *s = opaque;
-    struct sockaddr_storage saddr;
-    socklen_t len;
-    int fd;
-
-    for (;;) {
-        len = sizeof(saddr);
-        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
-        if (fd < 0 && errno != EINTR) {
-            return;
-        } else if (fd >= 0) {
-            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
-            break;
-        }
-    }
-
-    s->fd = fd;
-    s->nc.link_down = false;
-    net_stream_connect(s);
-    switch (saddr.ss_family) {
-    case AF_INET: {
-        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
+    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
+    SocketAddress *addr;
+    int ret;
 
-        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-                 "connection from %s:%d",
-                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
-        break;
+    if (listen_sioc->fd < 0) {
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "connection error");
+        return;
     }
-    case AF_UNIX: {
-        struct sockaddr_un saddr_un;
 
-        len = sizeof(saddr_un);
-        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
+    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
+    g_assert(addr != NULL);
+    ret = qemu_socket_try_set_nonblock(listen_sioc->fd);
+    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
         snprintf(s->nc.info_str, sizeof(s->nc.info_str),
-                 "connect from %s", saddr_un.sun_path);
-        break;
-    }
-    default:
-        g_assert_not_reached();
+                 "can't use file descriptor %s (errno %d)",
+                 addr->u.fd.str, -ret);
+        return;
     }
+    g_assert(ret == 0);
+    qapi_free_SocketAddress(addr);
+
+    s->nc.link_down = true;
+    s->listener = qio_net_listener_new();
+
+    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+    qio_net_listener_set_client_func(s->listener, net_stream_listen, s, NULL);
+    qio_net_listener_add(s->listener, listen_sioc);
 }
 
 static int net_stream_server_init(NetClientState *peer,
@@ -284,103 +284,55 @@ static int net_stream_server_init(NetClientState *peer,
 {
     NetClientState *nc;
     NetStreamState *s;
-    int fd, ret;
+    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
 
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET: {
-        struct sockaddr_in saddr_in;
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    s = DO_UPCAST(NetStreamState, nc, nc);
 
-        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
-                              errp) < 0) {
-            return -1;
-        }
+    s->listen_ioc = QIO_CHANNEL(listen_sioc);
+    qio_channel_socket_listen_async(listen_sioc, addr, 0,
+                                    net_stream_server_listening, s,
+                                    NULL, NULL);
 
-        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
-        if (fd < 0) {
-            error_setg_errno(errp, errno, "can't create stream socket");
-            return -1;
-        }
-        qemu_socket_set_nonblock(fd);
+    return 0;
+}
 
-        socket_set_fast_reuse(fd);
+static void net_stream_client_connected(QIOTask *task, gpointer opaque)
+{
+    NetStreamState *s = opaque;
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
+    SocketAddress *addr;
+    gchar *uri;
+    int ret;
 
-        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
-        if (ret < 0) {
-            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
-                             inet_ntoa(saddr_in.sin_addr));
-            closesocket(fd);
-            return -1;
-        }
-        break;
+    if (sioc->fd < 0) {
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str), "connection error");
+        return;
     }
-    case SOCKET_ADDRESS_TYPE_UNIX: {
-        struct sockaddr_un saddr_un;
-
-        ret = unlink(addr->u.q_unix.path);
-        if (ret < 0 && errno != ENOENT) {
-            error_setg_errno(errp, errno, "failed to unlink socket %s",
-                             addr->u.q_unix.path);
-            return -1;
-        }
-
-        saddr_un.sun_family = PF_UNIX;
-        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
-                       addr->u.q_unix.path);
-        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
-            error_setg(errp, "UNIX socket path '%s' is too long",
-                       addr->u.q_unix.path);
-            error_append_hint(errp, "Path must be less than %zu bytes\n",
-                              sizeof(saddr_un.sun_path));
-        }
 
-        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
-        if (fd < 0) {
-            error_setg_errno(errp, errno, "can't create stream socket");
-            return -1;
-        }
-        qemu_socket_set_nonblock(fd);
-
-        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
-        if (ret < 0) {
-            error_setg_errno(errp, errno, "can't create socket with path: %s",
-                             saddr_un.sun_path);
-            closesocket(fd);
-            return -1;
-        }
-        break;
-    }
-    case SOCKET_ADDRESS_TYPE_FD:
-        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
-        if (fd == -1) {
-            return -1;
-        }
-        ret = qemu_socket_try_set_nonblock(fd);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
-                             name, fd);
-            return -1;
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
+    addr = qio_channel_socket_get_remote_address(sioc, NULL);
+    g_assert(addr != NULL);
+    uri = socket_uri(addr);
+    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), uri);
+    g_free(uri);
 
-    ret = listen(fd, 0);
-    if (ret < 0) {
-        error_setg_errno(errp, errno, "can't listen on socket");
-        closesocket(fd);
-        return -1;
+    ret = qemu_socket_try_set_nonblock(sioc->fd);
+    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
+        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
+                 "can't use file descriptor %s (errno %d)",
+                 addr->u.fd.str, -ret);
+        return;
     }
+    g_assert(ret == 0);
+    qapi_free_SocketAddress(addr);
 
-    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
-    s = DO_UPCAST(NetStreamState, nc, nc);
-    s->fd = -1;
-    s->listen_fd = fd;
-    s->nc.link_down = true;
     net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
 
-    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
-    return 0;
+    /* Disable Nagle algorithm on TCP sockets to reduce latency */
+    qio_channel_set_delay(s->ioc, false);
+
+    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
+                                            s, NULL);
 }
 
 static int net_stream_client_init(NetClientState *peer,
@@ -390,114 +342,17 @@ static int net_stream_client_init(NetClientState *peer,
                                   Error **errp)
 {
     NetStreamState *s;
-    int fd, connected, ret;
-    gchar *info_str;
-
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET: {
-        struct sockaddr_in saddr_in;
-
-        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
-                              errp) < 0) {
-            return -1;
-        }
-
-        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
-        if (fd < 0) {
-            error_setg_errno(errp, errno, "can't create stream socket");
-            return -1;
-        }
-        qemu_socket_set_nonblock(fd);
-
-        connected = 0;
-        for (;;) {
-            ret = connect(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
-            if (ret < 0) {
-                if (errno == EINTR || errno == EWOULDBLOCK) {
-                    /* continue */
-                } else if (errno == EINPROGRESS ||
-                           errno == EALREADY) {
-                    break;
-                } else {
-                    error_setg_errno(errp, errno, "can't connect socket");
-                    closesocket(fd);
-                    return -1;
-                }
-            } else {
-                connected = 1;
-                break;
-            }
-        }
-        info_str = g_strdup_printf("connect to %s:%d",
-                                   inet_ntoa(saddr_in.sin_addr),
-                                   ntohs(saddr_in.sin_port));
-        break;
-    }
-    case SOCKET_ADDRESS_TYPE_UNIX: {
-        struct sockaddr_un saddr_un;
-
-        saddr_un.sun_family = PF_UNIX;
-        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
-                       addr->u.q_unix.path);
-        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
-            error_setg(errp, "UNIX socket path '%s' is too long",
-                       addr->u.q_unix.path);
-            error_append_hint(errp, "Path must be less than %zu bytes\n",
-                              sizeof(saddr_un.sun_path));
-        }
+    NetClientState *nc;
+    QIOChannelSocket *sioc = qio_channel_socket_new();
 
-        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
-        if (fd < 0) {
-            error_setg_errno(errp, errno, "can't create stream socket");
-            return -1;
-        }
-        qemu_socket_set_nonblock(fd);
-
-        connected = 0;
-        for (;;) {
-            ret = connect(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
-            if (ret < 0) {
-                if (errno == EINTR || errno == EWOULDBLOCK) {
-                    /* continue */
-                } else if (errno == EAGAIN ||
-                           errno == EALREADY) {
-                    break;
-                } else {
-                    error_setg_errno(errp, errno, "can't connect socket");
-                    closesocket(fd);
-                    return -1;
-                }
-            } else {
-                connected = 1;
-                break;
-            }
-        }
-        info_str = g_strdup_printf(" connect to %s", saddr_un.sun_path);
-        break;
-    }
-    case SOCKET_ADDRESS_TYPE_FD:
-        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
-        if (fd == -1) {
-            return -1;
-        }
-        ret = qemu_socket_try_set_nonblock(fd);
-        if (ret < 0) {
-            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
-                             name, fd);
-            return -1;
-        }
-        connected = 1;
-        info_str = g_strdup_printf("connect to fd %d", fd);
-        break;
-    default:
-        error_setg(errp, "only support inet, unix or fd type");
-        return -1;
-    }
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    s = DO_UPCAST(NetStreamState, nc, nc);
 
-    s = net_stream_fd_init_stream(peer, model, name, fd, connected);
+    s->ioc = QIO_CHANNEL(sioc);
 
-    pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
-    g_free(info_str);
+    qio_channel_socket_connect_async(sioc, addr,
+                                     net_stream_client_connected, s,
+                                     NULL, NULL);
 
     return 0;
 }
-- 
2.36.1


