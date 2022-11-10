Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605AD623CBC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:35:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot25E-0000Ao-J4; Thu, 10 Nov 2022 02:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ot24i-00008Z-17
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:34:21 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ot24f-0007Ze-IW
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 02:34:11 -0500
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyJx6-1pBfxG1wvk-00yjsS; Thu, 10 Nov 2022 08:34:02 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] net: stream: add a new option to automatically reconnect
Date: Thu, 10 Nov 2022 08:34:00 +0100
Message-Id: <20221110073400.968475-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8uumsA8+bgri6fnLuhBI0FfxkwkEiCYXSEv+WycUEBwWdl9cASZ
 03dsSaRGnPHGTMGvkWoaSD1lRWVRejuMEEiBNOoCZoN3J605FpLeGod2EmdjPc9DRObP4z4
 wHbgfxKUPaSDvLB0SfKPQcz4tQnzBZyN2eP5Yi8+2N2C3CLn4HBzB9Jjm8EUz0PRtmJODEQ
 +Rouj8gHiQh06GYHdHyMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5+QGL2OxpjM=:/L9oect43JgxhpUsrF8f9/
 qCYZa3OKe8FhsZL9TlVsEC0yDxPHJLl4OHurJnYrkWs7JhGaRF7zCyLCEGPHHF92rW+8K7eCe
 bezKc0AZuPuprOQ4Qn5ozeozXJL1vgYNUc4Ec11Qwi6ntAb8FGeAADlSMeJp7UcHPVsI1HU6E
 ZvmjrxNxOPXhff4Vp+T0CQkAIYQORi+eY6WaNIkZa3Zlm1w8ZhIbBuJ1UFEWNgA0GVspSUV8Q
 Iry0ExVv0InSoZ/QQ5EZ31NYxrDpBrHAHsQGkF0k3xlfefUz3a2P0pwI+u32D3pAFqGZigafh
 tM8WyamvztHU7xh3IFi09MlqzlqE5OINfx0X7AKHT9m8LSCWqxfCEOR5U/Z+P20pG6uaEf3eq
 2YTJZuSbt9cIr0sd4tJt/q9qNszDUBbEQ/wIv2TUcgVp6fajg6473CzVECcGk4AM3JNbHGL4L
 i7Qw1W6Ev7IYq0H4pFxy2imRy3BWTHi25QHpIGCj7mxtKR0XC3e5UZLUG0QMyqa49bSTksgRv
 B9hEGpnYoz59BfnEGg/22iCmRSHAtZUuu+fxvXv9bWzofbyb9GaruOMtSJsgJu3bsLA0b7YVn
 01JhFuMS5ivucKik+SbQ8EJk2aTWPfq+PBQQMVCmYc42aAs94wAW3hOWvP4yq+g08p2zZ8fhr
 7/VQKZROcfh79dUJc784XzCWFIckZ/X/1kJAS9wzh+oh/NwY+koIf1c0otGqM6Zqy7fNRmgS5
 QOqN8TRrn6RI++sKBD4D9lF5VUW428jHj6Axpw3JtmsKml6SGD1X39BuQn2VDv14yv9v82XUi
 eGUb8Th
Received-SPF: permerror client-ip=212.227.126.187;
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

Notes:
    Based-on: <20221109130301.790679-1-lvivier@redhat.com>

 net/stream.c                |  53 ++++++++++++++++++-
 qapi/net.json               |   6 ++-
 qemu-options.hx             |   6 +--
 tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 53b7040cc417..c1523e8190cc 100644
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
         qemu_set_info_str(&s->nc, "");
 
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
index 8b8a4a5d016f..528ab1ffb5e2 100644
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
index b6b59244a282..3d22bad6415f 100644
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
 
@@ -144,6 +148,101 @@ static void test_stream_inet_ipv4(void)
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
@@ -411,6 +510,7 @@ int main(int argc, char **argv)
         qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
         qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
         qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
+        qtest_add_func("/netdev/stream/inet/reconnect", test_stream_inet_reconnect);
     }
     if (has_ipv6) {
         qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
-- 
2.38.1


