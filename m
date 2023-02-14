Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88896958F9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:14:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRoYD-0001zx-Ai; Tue, 14 Feb 2023 01:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoYB-0001zc-AX
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoY9-0007uu-Cw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676355140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qh6pjxI57nyNd0YtxhdyNDjdngiKetwsIXN8i5MYBFE=;
 b=CsPq+xnl0SHR/u4DP43wn69gXmweJ+AwHccYWF9kwt9QJITJ6J1m+WCBfLTZaXVQnt4lKR
 tfUaXu+yMhe4plnVu793zyir9j2yc56E5bE8eLc3bahpX/qpGCqNqVrtEVZEciI1qe3tP0
 qdoznGbhq3NoxtP8XAUZ2op28CFAHSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-cdy29D4iOdKKotY8xBGV4Q-1; Tue, 14 Feb 2023 01:12:17 -0500
X-MC-Unique: cdy29D4iOdKKotY8xBGV4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC6E80D0E0;
 Tue, 14 Feb 2023 06:12:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-89.pek2.redhat.com [10.72.12.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9EFA140EBF6;
 Tue, 14 Feb 2023 06:12:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 09/10] net: stream: add a new option to automatically reconnect
Date: Tue, 14 Feb 2023 14:11:39 +0800
Message-Id: <20230214061140.36696-10-jasowang@redhat.com>
In-Reply-To: <20230214061140.36696-1-jasowang@redhat.com>
References: <20230214061140.36696-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Laurent Vivier <lvivier@redhat.com>

In stream mode, if the server shuts down there is currently
no way to reconnect the client to a new server without removing
the NIC device and the netdev backend (or to reboot).

This patch introduces a reconnect option that specifies a delay
to try to reconnect with the same parameters.

Add a new test in qtest to test the reconnect option and the
connect/disconnect events.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/stream.c                |  53 ++++++++++++++++++++++-
 qapi/net.json               |   7 ++-
 qemu-options.hx             |   6 +--
 tests/qtest/netdev-socket.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 162 insertions(+), 5 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 37ff727..9204b4c 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -39,6 +39,8 @@
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
 #include "qapi/qapi-events-net.h"
+#include "qapi/qapi-visit-sockets.h"
+#include "qapi/clone-visitor.h"
 
 typedef struct NetStreamState {
     NetClientState nc;
@@ -49,11 +51,15 @@ typedef struct NetStreamState {
     guint ioc_write_tag;
     SocketReadState rs;
     unsigned int send_index;      /* number of bytes sent*/
+    uint32_t reconnect;
+    guint timer_tag;
+    SocketAddress *addr;
 } NetStreamState;
 
 static void net_stream_listen(QIONetListener *listener,
                               QIOChannelSocket *cioc,
                               void *opaque);
+static void net_stream_arm_reconnect(NetStreamState *s);
 
 static gboolean net_stream_writable(QIOChannel *ioc,
                                     GIOCondition condition,
@@ -170,6 +176,7 @@ static gboolean net_stream_send(QIOChannel *ioc,
         qemu_set_info_str(&s->nc, "%s", "");
 
         qapi_event_send_netdev_stream_disconnected(s->nc.name);
+        net_stream_arm_reconnect(s);
 
         return G_SOURCE_REMOVE;
     }
@@ -187,6 +194,14 @@ static gboolean net_stream_send(QIOChannel *ioc,
 static void net_stream_cleanup(NetClientState *nc)
 {
     NetStreamState *s = DO_UPCAST(NetStreamState, nc, nc);
+    if (s->timer_tag) {
+        g_source_remove(s->timer_tag);
+        s->timer_tag = 0;
+    }
+    if (s->addr) {
+        qapi_free_SocketAddress(s->addr);
+        s->addr = NULL;
+    }
     if (s->ioc) {
         if (QIO_CHANNEL_SOCKET(s->ioc)->fd != -1) {
             if (s->ioc_read_tag) {
@@ -346,12 +361,37 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
 error:
     object_unref(OBJECT(s->ioc));
     s->ioc = NULL;
+    net_stream_arm_reconnect(s);
+}
+
+static gboolean net_stream_reconnect(gpointer data)
+{
+    NetStreamState *s = data;
+    QIOChannelSocket *sioc;
+
+    s->timer_tag = 0;
+
+    sioc = qio_channel_socket_new();
+    s->ioc = QIO_CHANNEL(sioc);
+    qio_channel_socket_connect_async(sioc, s->addr,
+                                     net_stream_client_connected, s,
+                                     NULL, NULL);
+    return G_SOURCE_REMOVE;
+}
+
+static void net_stream_arm_reconnect(NetStreamState *s)
+{
+    if (s->reconnect && s->timer_tag == 0) {
+        s->timer_tag = g_timeout_add_seconds(s->reconnect,
+                                             net_stream_reconnect, s);
+    }
 }
 
 static int net_stream_client_init(NetClientState *peer,
                                   const char *model,
                                   const char *name,
                                   SocketAddress *addr,
+                                  uint32_t reconnect,
                                   Error **errp)
 {
     NetStreamState *s;
@@ -364,6 +404,10 @@ static int net_stream_client_init(NetClientState *peer,
     s->ioc = QIO_CHANNEL(sioc);
     s->nc.link_down = true;
 
+    s->reconnect = reconnect;
+    if (reconnect) {
+        s->addr = QAPI_CLONE(SocketAddress, addr);
+    }
     qio_channel_socket_connect_async(sioc, addr,
                                      net_stream_client_connected, s,
                                      NULL, NULL);
@@ -380,7 +424,14 @@ int net_init_stream(const Netdev *netdev, const char *name,
     sock = &netdev->u.stream;
 
     if (!sock->has_server || !sock->server) {
-        return net_stream_client_init(peer, "stream", name, sock->addr, errp);
+        return net_stream_client_init(peer, "stream", name, sock->addr,
+                                      sock->has_reconnect ? sock->reconnect : 0,
+                                      errp);
+    }
+    if (sock->has_reconnect) {
+        error_setg(errp, "'reconnect' option is incompatible with "
+                         "socket in server mode");
+        return -1;
     }
     return net_stream_server_init(peer, "stream", name, sock->addr, errp);
 }
diff --git a/qapi/net.json b/qapi/net.json
index 522ac58..d6eb300 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -585,6 +585,10 @@
 # @addr: socket address to listen on (server=true)
 #        or connect to (server=false)
 # @server: create server socket (default: false)
+# @reconnect: For a client socket, if a socket is disconnected,
+#             then attempt a reconnect after the given number of seconds.
+#             Setting this to zero disables this function. (default: 0)
+#             (since 8.0)
 #
 # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
@@ -593,7 +597,8 @@
 { 'struct': 'NetdevStreamOptions',
   'data': {
     'addr':   'SocketAddress',
-    '*server': 'bool' } }
+    '*server': 'bool',
+    '*reconnect': 'uint32' } }
 
 ##
 # @NetdevDgramOptions:
diff --git a/qemu-options.hx b/qemu-options.hx
index 88e93c6..1417fab 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2769,9 +2769,9 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev socket,id=str[,fd=h][,udp=host:port][,localaddr=host:port]\n"
     "                configure a network backend to connect to another network\n"
     "                using an UDP tunnel\n"
-    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off]\n"
-    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off]\n"
-    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=inet,addr.host=host,addr.port=port[,to=maxport][,numeric=on|off][,keep-alive=on|off][,mptcp=on|off][,addr.ipv4=on|off][,addr.ipv6=on|off][,reconnect=seconds]\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=unix,addr.path=path[,abstract=on|off][,tight=on|off][,reconnect=seconds]\n"
+    "-netdev stream,id=str[,server=on|off],addr.type=fd,addr.str=file-descriptor[,reconnect=seconds]\n"
     "                configure a network backend to connect to another network\n"
     "                using a socket connection in stream mode.\n"
     "-netdev dgram,id=str,remote.type=inet,remote.host=maddr,remote.port=port[,local.type=inet,local.host=addr]\n"
diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 1d98dca..270e424 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -11,6 +11,10 @@
 #include <glib/gstdio.h>
 #include "../unit/socket-helpers.h"
 #include "libqtest.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/sockets.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
 
 #define CONNECTION_TIMEOUT    60
 
@@ -142,6 +146,101 @@ static void test_stream_inet_ipv4(void)
     qtest_quit(qts0);
 }
 
+static void wait_stream_connected(QTestState *qts, const char *id,
+                                  SocketAddress **addr)
+{
+    QDict *resp, *data;
+    QString *qstr;
+    QObject *obj;
+    Visitor *v = NULL;
+
+    resp = qtest_qmp_eventwait_ref(qts, "NETDEV_STREAM_CONNECTED");
+    g_assert_nonnull(resp);
+    data = qdict_get_qdict(resp, "data");
+    g_assert_nonnull(data);
+
+    qstr = qobject_to(QString, qdict_get(data, "netdev-id"));
+    g_assert_nonnull(data);
+
+    g_assert(!strcmp(qstring_get_str(qstr), id));
+
+    obj = qdict_get(data, "addr");
+
+    v = qobject_input_visitor_new(obj);
+    visit_type_SocketAddress(v, NULL, addr, NULL);
+    visit_free(v);
+    qobject_unref(resp);
+}
+
+static void wait_stream_disconnected(QTestState *qts, const char *id)
+{
+    QDict *resp, *data;
+    QString *qstr;
+
+    resp = qtest_qmp_eventwait_ref(qts, "NETDEV_STREAM_DISCONNECTED");
+    g_assert_nonnull(resp);
+    data = qdict_get_qdict(resp, "data");
+    g_assert_nonnull(data);
+
+    qstr = qobject_to(QString, qdict_get(data, "netdev-id"));
+    g_assert_nonnull(data);
+
+    g_assert(!strcmp(qstring_get_str(qstr), id));
+    qobject_unref(resp);
+}
+
+static void test_stream_inet_reconnect(void)
+{
+    QTestState *qts0, *qts1;
+    int port;
+    SocketAddress *addr;
+
+    port = inet_get_free_port(false);
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
+
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
+
+    qts1 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,server=false,id=st0,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,reconnect=1,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
+
+    wait_stream_connected(qts0, "st0", &addr);
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
+    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
+    qapi_free_SocketAddress(addr);
+
+    /* kill server */
+    qtest_quit(qts0);
+
+    /* check client has been disconnected */
+    wait_stream_disconnected(qts1, "st0");
+
+    /* restart server */
+    qts0 = qtest_initf("-nodefaults -M none "
+                       "-netdev stream,id=st0,server=true,addr.type=inet,"
+                       "addr.ipv4=on,addr.ipv6=off,"
+                       "addr.host=127.0.0.1,addr.port=%d", port);
+
+    /* wait connection events*/
+    wait_stream_connected(qts0, "st0", &addr);
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
+    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
+    qapi_free_SocketAddress(addr);
+
+    wait_stream_connected(qts1, "st0", &addr);
+    g_assert_cmpint(addr->type, ==, SOCKET_ADDRESS_TYPE_INET);
+    g_assert_cmpstr(addr->u.inet.host, ==, "127.0.0.1");
+    g_assert_cmpint(atoi(addr->u.inet.port), ==, port);
+    qapi_free_SocketAddress(addr);
+
+    qtest_quit(qts1);
+    qtest_quit(qts0);
+}
+
 static void test_stream_inet_ipv6(void)
 {
     QTestState *qts0, *qts1;
@@ -418,6 +517,8 @@ int main(int argc, char **argv)
 #ifndef _WIN32
         qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
 #endif
+        qtest_add_func("/netdev/stream/inet/reconnect",
+                       test_stream_inet_reconnect);
     }
     if (has_ipv6) {
         qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
-- 
2.7.4


