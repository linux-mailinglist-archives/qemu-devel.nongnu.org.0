Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C997A65EC99
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:13:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQ3t-00043y-Pz; Thu, 05 Jan 2023 08:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDQ3s-000435-16
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:13:36 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDQ3p-0005Zw-9D
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:13:35 -0500
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtPzy-1ow9Wd1IR4-00unFo; Thu, 05 Jan 2023 14:13:25 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3] net: stream: add a new option to automatically reconnect
Date: Thu,  5 Jan 2023 14:13:22 +0100
Message-Id: <20230105131322.469173-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cQ0gCBT/bkN80bxi7/FMq2L2fP7novHiJiefEMXv4qFl8yCxz8w
 1ioSGWPeQzrCHUFzdqHov9OTUBXwfbmchjKthSepRaOblvE6kf6lF5reVTBanyv8FrMV5fQ
 GHBydTWhcCfbF7F8nRaPBsefkhD5Hpuj/UI1XtJuUOm/Fs3iHdr+0PKXoDevN4q2uPCwS8h
 rlm888x53mPcPcVqOrGCQ==
UI-OutboundReport: notjunk:1;M01:P0:lffFk5RC2K8=;ptSHkwt6XOSsw6PbjHIx1a82MQK
 fAWwkk+bFsNfzhlBIckntYdKTbUKDNwA/QSS1aEGPKUxH3rinV6V6JcXHMX52B7UK55gkhdbA
 OeVINA/0Efb8It+oPFNGY9CfFQyvv8iL1/pCG3JyuP7osg9Ly7TBgx7M/SpENtvKQbxeUjWbx
 5ldYFvbttt1F+KljYNSRZKZtJEtSt0hrep/5flRpxM7FennpO2nC6ZWb2c1uIiMAaQo3BAyNf
 tixmmzlSJzsP7S+rNMCNIMvS30TCQB3SeYsb3jCP4DlWi+/b30xG1DDXgBnII3rpFTcVfsGuk
 RQcz9g8AzgCHFVviC1FIVOVvM4FAYW7E2CZLYFfvRslh4vvaLRgtUT/lfmMzDS74gib7GJ1Wm
 L/dY6sszbrOar2iH7gMjBHmDoIMA3Gn7UyEuz1fEfYUfno/8LRPf/4pzHHLQwzHiqSnyS341x
 bKLKHQzbcq97XFYxAHRybBWntPr4Q2iw8Qejls1Tb8L+Oyc6we2mPLJOrOQYVamXFrxWMMSc+
 chMpf/d/8yQgETLoJBq6wKBxifKSGeyiVJTFu7Awa9GFUrqQqiVU2wAKJ2T8Y0OWG+EdC67Co
 Pyu6/ezGqKXS80sKTOCzmAb6iWZltm/TDuluh/Lc2GP+hfrUhHUTWAT6OduYGgLbb5dOSmLXX
 grzbJ+e6Ci10+AIQkG9Lb/++aowyjNsd66lNCeikGg==
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

In stream mode, if the server shuts down there is currently
no way to reconnect the client to a new server without removing
the NIC device and the netdev backend (or to reboot).

This patch introduces a reconnect option that specifies a delay
to try to reconnect with the same parameters.

Add a new test in qtest to test the reconnect option and the
connect/disconnect events.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
Based-on: <20230105093751.416666-1-lvivier@redhat.com>
    
v3:
- add "since 8.0" in net.json
    
v2:
- rebase

 net/stream.c                |  53 ++++++++++++++++++-
 qapi/net.json               |   7 ++-
 qemu-options.hx             |   6 +--
 tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+), 5 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 37ff727e0c42..9204b4c96e40 100644
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
index 522ac582edeb..d6eb30008be0 100644
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
index 7f99d15b231f..e8d3a384e165 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2766,9 +2766,9 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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
index a9db9fa06e79..b6db396599ae 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -10,6 +10,10 @@
 #include <glib/gstdio.h>
 #include "../unit/socket-helpers.h"
 #include "libqtest.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/sockets.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-sockets.h"
 
 #define CONNECTION_TIMEOUT    5
 
@@ -141,6 +145,101 @@ static void test_stream_inet_ipv4(void)
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
@@ -415,6 +514,7 @@ int main(int argc, char **argv)
         qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
         qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
         qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
+        qtest_add_func("/netdev/stream/inet/reconnect", test_stream_inet_reconnect);
     }
     if (has_ipv6) {
         qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
-- 
2.39.0


