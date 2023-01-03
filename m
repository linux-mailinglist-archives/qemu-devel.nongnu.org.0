Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686BE65C1E2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCiBx-0006UQ-H5; Tue, 03 Jan 2023 09:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiBv-0006UH-DX
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:22:59 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiBs-0006xa-0A
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:22:59 -0500
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MILnm-1oyMhh1u5c-00EM8X; Tue, 03 Jan 2023 15:22:49 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2] net: stream: add a new option to automatically reconnect
Date: Tue,  3 Jan 2023 15:22:47 +0100
Message-Id: <20230103142247.218039-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:leW7aXO2Eduun07nUOEuN3UH9zUv3dbu8N6VyY/nFX75XAScFww
 Ou0mijHl54HCzshgpr99uCyft9FE81fBIaVtZu/JiA+OoxI8Mqgdl5hmyekuE2LXfVIwZAY
 WmKsfWda3NRQpp1AWK6k+LUZCGbcyUc8UFNGu89LPuPWAQ6XrSaYBluSvy7iK/mt/PnaGBA
 pbBJO5I3Ii0ajYRUam5uA==
UI-OutboundReport: notjunk:1;M01:P0:PXyVNuR6GX8=;KwaITtq2ywBliYKxMiLXBURx6D6
 /JVmV8nFMs/pJwQ8DFKZd3ra++OrTytiVM+P+f31nKS1UOSvOIfNQcwycdM623HghnTzFClbV
 yzxUCwPFuV/Hk5BWxwNPLA4/tIPX52Q6t6eWQH0y7LdwJdH/8ng2qKEFyVb0408/5xwqufhC/
 C2B2tXKpQMb27SocGWPxrn6DcGnaHXt2El18u2A9CKQu+l1tCfklveoc+h3QtqkfvFdw0/PFK
 8dEr1dCqPdPe3w/A6C5Mf0ig/a5oTeI/M1OHSmNYamD2MxI4wEt4DI+9pnGQgK/CsL3PDKfct
 n4pnbhdVLYFxPYvFOmq63jGXjDM/1gHhYmpiWXfGQjeB4S9mjqfR8i/op29wQ22ydgH2hOtDX
 1fPOr3Rh+Fp3PUVnBtwLXloFuKVYHCYFI+IxvxcVvq+dMqqJ4tFQkCpfIY0zaU/HKOlGSZbJh
 Y2nJmJxKae0pV+B+F5qmQ7/mT1oT+6If03cvSjKPR9YbPQUk9OvXpTNZ3DtDv9f3Cutdpk1p0
 qxZtf9xIH081/0kADljxHH9mZEJF6xiPRo2LunkWX2L7E41QpeSbwplstFrV7zkCAZRHf/pPw
 T5X8p91FEBPWufraKa/S040qQUQMli35/aGLktilI/dQm0PvRdu7v4zmqR3601pCej5WzfMkH
 h15c6VSUarualH4Now5C9F3LDhQOvMogh5907+UkZA==
Received-SPF: permerror client-ip=217.72.192.73;
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
Based-on: <20230103110049.120340-1-lvivier@redhat.com>
    
v2:
- rebase

 net/stream.c                |  53 ++++++++++++++++++-
 qapi/net.json               |   6 ++-
 qemu-options.hx             |   6 +--
 tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+), 5 deletions(-)

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
index 522ac582edeb..5b72c936b3ac 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -585,6 +585,9 @@
 # @addr: socket address to listen on (server=true)
 #        or connect to (server=false)
 # @server: create server socket (default: false)
+# @reconnect: For a client socket, if a socket is disconnected,
+#             then attempt a reconnect after the given number of seconds.
+#             Setting this to zero disables this function. (default: 0)
 #
 # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
@@ -593,7 +596,8 @@
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
index 96fc0aeba427..6c24f5abbdee 100644
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
@@ -409,6 +508,7 @@ int main(int argc, char **argv)
         qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
         qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
         qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
+        qtest_add_func("/netdev/stream/inet/reconnect", test_stream_inet_reconnect);
     }
     if (has_ipv6) {
         qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
-- 
2.39.0


