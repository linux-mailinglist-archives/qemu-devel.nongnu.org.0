Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A45F58B9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 19:00:38 +0200 (CEST)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7l7-00049R-Cz
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 13:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og797-0007V3-DE
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:21 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og792-0002pO-DE
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:21 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeCxd-1pELMs1H1D-00bNBF; Wed, 05 Oct 2022 18:21:13 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v10 15/17] net: stream: move to QIO to enable additional
 parameters
Date: Wed,  5 Oct 2022 18:20:49 +0200
Message-Id: <20221005162051.1120041-16-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tQs95C/6cwU3V68TJNxjS8A0MKlicb5KnEfED4/VSFLVblqhoHn
 5KwP094tXimXbUeYTxCAWuVsdVmNfb0zwsGYlVJhAbVFI1C4ablTFgl8sohABpuaP9tDgAm
 +WL756ntqczpHqZaVoJUhvJ/90DvpQrNvO03Uu/X7MYbXF/SXCIV5c2/ykzlI1ddhc6ceWA
 GDN6s7pgvc/VeehROdxhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:viFprx2RP/k=:QT0LyRTfjNUVuHn+bdAf2/
 B+pR0c349uhjCQr994pdeqGCu3oWm9bdApHsD/zeR/L3NAvwVJ1MOLjkcDa/IXEm2Zhr3/rHx
 AD1R1BaLLVzOfmjVe0zB9CNujJoOAT4FL4mLE/kd7h8wDzMEGrqZ71xuF0+hoQ1fy5LG2fxbz
 vzNtN2l3aUGnjl/lBpifsk5jPhAm0YVw8yvk3eHcjyeiA8QcEafa8tEq5sc2+3xeG3JV4bdgP
 CzukSKXzKDwZL5FBnaPc1AGp+8BiW0GDcz6eyQdpxBjaKaKNh/wiB5XjsPHDYwa8pHv+wxCMf
 td7sjhYnsSQ55sKSeE7eGom9dZQsT+fy6WM38rGg3V3VeSJ/N5LOX150tq7K29hwbCXld6lZ/
 a76UuSqsnw4OwamnAzUYOTks9/pr8W/n52N/4XzCnmdN8nr3UfrerX9wbrf7uskjWdnuuZc+k
 gHMuq2+/A+2uRPyNC13qedhGhR0a9UIA8HIU+kbkwZprl64IpeyRttOHm/PojVCX3RtLYq6+m
 oNQHaA1815DF9NPaUSeSRdKCuv5mz+ihwEbOLiqb6ky4vZGK+6KoK+eDIGgQigfOZGqL8w4dF
 U3HBqoyVFITuAJqcYEMdGYDkHKVI8ZVM6r039Utw1zTMRCn+MWhmJ4Tszktne0La/OjeuaG6s
 9PSgTWN9KMQCR7HUBrc8d4Kxnsq8413DS2dzjCFxOxqkYWQbcU89zVZIEZBRvKwinmqOHsNTk
 6tplFu5Y9iZA0rJs+SEqYtxB6nCUXcJz3G7sXiHi2YaxRqy1mSWGujRK3pTSDwGBbnsOVsH0M
 1IF4lEU
Received-SPF: permerror client-ip=217.72.192.75;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
This allows net/stream to use all the available parameters provided by
SocketAddress.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/stream.c    | 484 +++++++++++++++++-------------------------------
 qemu-options.hx |   4 +-
 2 files changed, 171 insertions(+), 317 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index d26c79d035fc..8e4618e3f84d 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -35,48 +35,36 @@
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
-    bool read_poll;               /* waiting to receive data? */
-    bool write_poll;              /* waiting to transmit data? */
 } NetStreamState;
 
-static void net_stream_send(void *opaque);
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
-                        s->read_poll ? net_stream_send : NULL,
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
@@ -93,13 +81,16 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
             .iov_len  = size,
         },
     };
+    struct iovec local_iov[2];
+    unsigned int nlocal_iov;
     size_t remaining;
     ssize_t ret;
 
-    remaining = iov_size(iov, 2) - s->send_index;
-    ret = iov_send(s->fd, iov, 2, s->send_index, remaining);
 
-    if (ret == -1 && errno == EAGAIN) {
+    remaining = iov_size(iov, 2) - s->send_index;
+    nlocal_iov = iov_copy(local_iov, 2, iov, 2, s->send_index, remaining);
+    ret = qio_channel_writev(s->ioc, local_iov, nlocal_iov, NULL);
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
         ret = 0; /* handled further down */
     }
     if (ret == -1) {
@@ -108,19 +99,25 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
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
 
@@ -131,19 +128,24 @@ static void net_stream_rs_finalize(SocketReadState *rs)
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
@@ -151,51 +153,63 @@ static void net_stream_send(void *opaque)
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
         qemu_set_info_str(&s->nc, "");
 
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
-    net_stream_read_poll(s, true);
-}
-
 static NetClientInfo net_stream_info = {
     .type = NET_CLIENT_DRIVER_STREAM,
     .size = sizeof(NetStreamState),
@@ -203,76 +217,67 @@ static NetClientInfo net_stream_info = {
     .cleanup = net_stream_cleanup,
 };
 
-static NetStreamState *net_stream_fd_init(NetClientState *peer,
-                                          const char *model,
-                                          const char *name,
-                                          int fd, int is_connected)
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
 
-    qemu_set_info_str(nc, "fd=%d", fd);
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
-
-    if (is_connected) {
-        net_stream_connect(s);
+    if (cioc->localAddr.ss_family == AF_UNIX) {
+        addr = qio_channel_socket_get_local_address(cioc, NULL);
     } else {
-        qemu_set_fd_handler(s->fd, NULL, net_stream_connect, s);
+        addr = qio_channel_socket_get_remote_address(cioc, NULL);
     }
-    return s;
+    g_assert(addr != NULL);
+    uri = socket_uri(addr);
+    qemu_set_info_str(&s->nc, uri);
+    g_free(uri);
+    qapi_free_SocketAddress(addr);
+
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
+    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
+    SocketAddress *addr;
+    int ret;
 
-    s->fd = fd;
-    s->nc.link_down = false;
-    net_stream_connect(s);
-    switch (saddr.ss_family) {
-    case AF_INET: {
-        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
-
-        qemu_set_info_str(&s->nc, "connection from %s:%d",
-                          inet_ntoa(saddr_in->sin_addr),
-                          ntohs(saddr_in->sin_port));
-        break;
+    if (listen_sioc->fd < 0) {
+        qemu_set_info_str(&s->nc, "connection error");
+        return;
     }
-    case AF_UNIX: {
-        struct sockaddr_un saddr_un;
 
-        len = sizeof(saddr_un);
-        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
-        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
-        break;
-    }
-    default:
-        g_assert_not_reached();
+    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
+    g_assert(addr != NULL);
+    ret = qemu_socket_try_set_nonblock(listen_sioc->fd);
+    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
+        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
+                          addr->u.fd.str, -ret);
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
@@ -283,105 +288,54 @@ static int net_stream_server_init(NetClientState *peer,
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
+        qemu_set_info_str(&s->nc, "connection error");
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
 
-        saddr_un.sun_family = PF_UNIX;
-        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
-                       addr->u.q_unix.path);
-        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
-            error_setg(errp, "UNIX socket path '%s' is too long",
-                       addr->u.q_unix.path);
-            error_append_hint(errp, "Path must be less than %zu bytes\n",
-                              sizeof(saddr_un.sun_path));
-            return -1;
-        }
+    addr = qio_channel_socket_get_remote_address(sioc, NULL);
+    g_assert(addr != NULL);
+    uri = socket_uri(addr);
+    qemu_set_info_str(&s->nc, uri);
+    g_free(uri);
 
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
-        error_setg(errp, "only support inet or fd type");
-        return -1;
-    }
-
-    ret = listen(fd, 0);
-    if (ret < 0) {
-        error_setg_errno(errp, errno, "can't listen on socket");
-        closesocket(fd);
-        return -1;
+    ret = qemu_socket_try_set_nonblock(sioc->fd);
+    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
+        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
+                          addr->u.fd.str, -ret);
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
@@ -391,118 +345,18 @@ static int net_stream_client_init(NetClientState *peer,
                                   Error **errp)
 {
     NetStreamState *s;
-    struct sockaddr_in saddr_in;
-    struct sockaddr_un saddr_un;
-    int fd, connected, ret;
-
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
-                              errp) < 0) {
-            return -1;
-        }
+    NetClientState *nc;
+    QIOChannelSocket *sioc = qio_channel_socket_new();
 
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
-        break;
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        saddr_un.sun_family = PF_UNIX;
-        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
-                       addr->u.q_unix.path);
-        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
-            error_setg(errp, "UNIX socket path '%s' is too long",
-                       addr->u.q_unix.path);
-            error_append_hint(errp, "Path must be less than %zu bytes\n",
-                              sizeof(saddr_un.sun_path));
-            return -1;
-        }
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    s = DO_UPCAST(NetStreamState, nc, nc);
 
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
-        break;
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
-        break;
-    default:
-        error_setg(errp, "only support inet, unix or fd type");
-        return -1;
-    }
+    s->ioc = QIO_CHANNEL(sioc);
+
+    qio_channel_socket_connect_async(sioc, addr,
+                                     net_stream_client_connected, s,
+                                     NULL, NULL);
 
-    s = net_stream_fd_init(peer, model, name, fd, connected);
-
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        qemu_set_info_str(&s->nc, "connect to %s:%d",
-                          inet_ntoa(saddr_in.sin_addr),
-                          ntohs(saddr_in.sin_port));
-        break;
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        qemu_set_info_str(&s->nc, " connect to %s", saddr_un.sun_path);
-        break;
-    case SOCKET_ADDRESS_TYPE_FD:
-        qemu_set_info_str(&s->nc, "connect to fd %d", fd);
-        break;
-    default:
-        g_assert_not_reached();
-    }
     return 0;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 1111e02a220c..8357ee2d96d7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2756,8 +2756,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port\n"
-    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
     "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
-- 
2.37.3


