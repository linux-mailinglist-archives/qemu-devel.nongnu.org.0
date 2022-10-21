Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA06073D5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:19:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloBQ-0007Ud-4O
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:19:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2t-000541-60
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2U-0003fs-NB
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:02 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2Q-00022b-GU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:02 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MFspV-1otE9s3MGV-00HN31; Fri, 21 Oct 2022 11:09:48 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Date: Fri, 21 Oct 2022 11:09:20 +0200
Message-Id: <20221021090922.170074-16-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ogVtRU/Y8L0DEFpJBE7pyNsAFn6O11+IaF6Qh70AAhF4CewGHia
 TwEr/vrVnn42KpXnWvAfKIt9AJZXfonMR0LD9WOyYBj0E1ypLh0CoiQcASOLNVYyMuy5E3v
 M3kCzvk2E45Hke1xKhyGvHvYk+j8XJtXzNhFGsPDje3KRXwdEtySNhqkfdeyksJ9pU6DViQ
 8njk5A+4lJML2xUUlGUng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d0GFfGQb3tw=:CJZXm63r4DH3ggK54l2r2Y
 F0Hq6Gb1/Tf2hc0CepLLNNUa1+i3Hmowpr31nDMovaXRcwqUXdLQQeDCTyS1TiHGHWNjFKdyb
 jUSs0LZX0KB3sx0vjFnGFp1fhRAYeqSWvvs+1XQIIURpk8Rmesjz5fhhy1R8IxYMNuLWny0ak
 +YOm11ZrWJdLO36hpBG27At5cWo3Xbv6DJUoBts3ba1t/3skd7AJZ0HXRrtRBokKxBbVVR+/G
 ZQH5DrlJ9DZh5E6MAl2ngthXxsogMb8i2YFb6YnkhoHOrIU9RAOeV0/b3AelNKwLzPkFhN96p
 WqXG7LtdVt1+qsKJXYUoBH6IGoTijK8QfqHXtZdO31aKxMEdp5XkVe6lNt/fevsgElKPywEt2
 YcXw8ZVrlwTqiwrJAr92bCxj4FQryRoFBn1VqHKabiwxtWSpVRxbGxTKyzie5BWmkGx17kUVE
 MXbxXjTpuwTTF6IcDtZmBurucj7ynRv+xrGb5Mu6dfYnqutx0J6Z1Wom22aF1W2A+nQGzoREe
 STxeloc0zSKldnop3diocK6B7L1JlqX+4673PCudQhZbkzBKkj1ukCzGyEZ4xi60FQ4kGJoDD
 1mZHjW6O98TL3Arwt2u186grZ1Hs0De3j/TzuF5mTLa6IhMMFqlXxlYLB0H/7r2xfPss4f0kN
 Gwp6xuTh3etKS+1fAvzjmDnN2C4GpwSB8cdCNdZnCLNN18fMVtMbZTEu+8/Ki34lpoRfCT5xO
 grdJF+crzXp7lw7W7/Hd2qWeEkUaeMMDqNJ/9hCMXTy/mJ+S/yBSnzmwGXNzFzdpYKrQ2ibv5
 o6Zd2Vs
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/stream.c    | 492 +++++++++++++++++-------------------------------
 qemu-options.hx |   4 +-
 2 files changed, 178 insertions(+), 318 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 884f473018da..54c67e14d240 100644
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
@@ -93,13 +81,15 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
             .iov_len  = size,
         },
     };
+    struct iovec local_iov[2];
+    unsigned int nlocal_iov;
     size_t remaining;
     ssize_t ret;
 
     remaining = iov_size(iov, 2) - s->send_index;
-    ret = iov_send(s->fd, iov, 2, s->send_index, remaining);
-
-    if (ret == -1 && errno == EAGAIN) {
+    nlocal_iov = iov_copy(local_iov, 2, iov, 2, s->send_index, remaining);
+    ret = qio_channel_writev(s->ioc, local_iov, nlocal_iov, NULL);
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
         ret = 0; /* handled further down */
     }
     if (ret == -1) {
@@ -108,19 +98,25 @@ static ssize_t net_stream_receive(NetClientState *nc, const uint8_t *buf,
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
 
@@ -131,19 +127,24 @@ static void net_stream_rs_finalize(SocketReadState *rs)
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
@@ -151,51 +152,63 @@ static void net_stream_send(void *opaque)
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
         }
-        closesocket(s->fd);
+        if (s->listener) {
+            qio_net_listener_set_client_func(s->listener, net_stream_listen,
+                                             s, NULL);
+        }
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
@@ -203,76 +216,66 @@ static NetClientInfo net_stream_info = {
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
-
-    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    NetStreamState *s = opaque;
+    SocketAddress *addr;
+    char *uri;
 
-    qemu_set_info_str(nc, "fd=%d", fd);
+    object_ref(OBJECT(cioc));
 
-    s = DO_UPCAST(NetStreamState, nc, nc);
+    qio_net_listener_set_client_func(s->listener, NULL, s, NULL);
 
-    s->fd = fd;
-    s->listen_fd = -1;
-    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
+    s->ioc = QIO_CHANNEL(cioc);
+    qio_channel_set_name(s->ioc, "stream-server");
+    s->nc.link_down = false;
 
-    /* Disable Nagle algorithm on TCP sockets to reduce latency */
-    socket_set_nodelay(fd);
+    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
+                                            s, NULL);
 
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
@@ -283,105 +286,61 @@ static int net_stream_server_init(NetClientState *peer,
 {
     NetClientState *nc;
     NetStreamState *s;
-    int fd, ret;
+    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
 
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
+    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
+    s = DO_UPCAST(NetStreamState, nc, nc);
 
-        socket_set_fast_reuse(fd);
+    s->listen_ioc = QIO_CHANNEL(listen_sioc);
+    qio_channel_socket_listen_async(listen_sioc, addr, 0,
+                                    net_stream_server_listening, s,
+                                    NULL, NULL);
 
-        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
-        if (ret < 0) {
-            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
-                             inet_ntoa(saddr_in.sin_addr));
-            closesocket(fd);
-            return -1;
-        }
-        break;
-    }
-    case SOCKET_ADDRESS_TYPE_UNIX: {
-        struct sockaddr_un saddr_un;
-
-        ret = unlink(addr->u.q_unix.path);
-        if (ret < 0 && errno != ENOENT) {
-            error_setg_errno(errp, errno, "failed to unlink socket %s",
-                             addr->u.q_unix.path);
-            return -1;
-        }
+    return 0;
+}
 
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
+static void net_stream_client_connected(QIOTask *task, gpointer opaque)
+{
+    NetStreamState *s = opaque;
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
+    SocketAddress *addr;
+    gchar *uri;
+    int ret;
 
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
+    if (sioc->fd < 0) {
+        qemu_set_info_str(&s->nc, "connection error");
+        goto error;
     }
 
-    ret = listen(fd, 0);
-    if (ret < 0) {
-        error_setg_errno(errp, errno, "can't listen on socket");
-        closesocket(fd);
-        return -1;
+    addr = qio_channel_socket_get_remote_address(sioc, NULL);
+    g_assert(addr != NULL);
+    uri = socket_uri(addr);
+    qemu_set_info_str(&s->nc, uri);
+    g_free(uri);
+
+    ret = qemu_socket_try_set_nonblock(sioc->fd);
+    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
+        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
+                          addr->u.fd.str, -ret);
+        qapi_free_SocketAddress(addr);
+        goto error;
     }
+    g_assert(ret == 0);
 
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
+    s->nc.link_down = false;
+    qapi_free_SocketAddress(addr);
+
+    return;
+error:
+    object_unref(OBJECT(s->ioc));
+    s->ioc = NULL;
 }
 
 static int net_stream_client_init(NetClientState *peer,
@@ -391,118 +350,19 @@ static int net_stream_client_init(NetClientState *peer,
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
+    s->nc.link_down = true;
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
index fafb214cb89f..a91f96a264cc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2772,8 +2772,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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


