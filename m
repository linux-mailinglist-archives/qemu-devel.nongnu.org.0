Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26F5F58CF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 19:07:09 +0200 (CEST)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7rQ-0003fZ-DN
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 13:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og797-0007U3-0s
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og795-0002pw-0l
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:20 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N336J-1pKQ9G44CL-013JLj; Wed, 05 Oct 2022 18:21:16 +0200
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
Subject: [PATCH v10 17/17] net: stream: add QAPI events to report connection
 state
Date: Wed,  5 Oct 2022 18:20:51 +0200
Message-Id: <20221005162051.1120041-18-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FeeVUmUVqZAXA9vnWy09Ptp2DcaGUWfqZVV0nkmUM/fsVbz4FlP
 MV3gOqBiZsV07uDMlp0Eb2+Fw/Ldv4Mk6dYG9AEOHD7wKPu0M4KCN5v789VT8Y9o8sJlhHY
 VrrergbI5Ql5ewo6LvJ2LKLyaPmxRwTc8Hus8AFzUHpTiaR+R6S9RqHCjHN/jXpSj5tQl77
 QTLd5E1QlrW+eUo7hFKfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Mt3iotd5WY=:oKKoJR4CFw6QXT19Oi59zE
 Q63JgRPN7V5jIohJ74WpzgxhXHq23K2LqqRbnuOC6EleKf/0C7yPDco6adDmhB4yxaamGlWRl
 BstbaN4a5cdxcsmxaOPAu6QfJ07KfwU6Z2fB6Ai+fQzNCJxDi72A7x795CCCMhcXjhFLRlxAq
 PZ5Q+DzKc5C2+C1LyxAiAI4fDDbEo5w4TU4c1bzIeSQwGPvB/z6dFdoji69PsrvSVMWM0MtqM
 w4Lj32oZUQK4KHm8xYtro/mQqE5B1y/YQMtrZ4B2swR2FAy6SJ2gg/Qb6Cjhjz1s0WYiXX52I
 bs3H2xwzdGhMb170x4Y9lHqw5Im+E8FxejhYy/vpKAL97XLjYyb6Puo20sA7LWtLX/fiY0yu6
 6zz0dYOqLp2hEs+1daiRYl8D/1tWEu8fXnlk+168I/3CVTkgQ+box6hwhWaIQJgGlesXM6533
 q31ODpIiALpZBKNByCzLp3edZh1Y+r1G7gBeDKrVrtEWxtDukMRng0F/pFQRuU3tk8BG3jbB7
 EV83IahpNxNOxwbCyRV4sXoBJaSBwF9tBpTt7lrwhsxLHY9n0AC6z7rv1RAMcl3qugmZKb8ud
 2iYuFs1CU7zSdohG9eCp/9gZzNkROWGBp2P7Mp1wZS78rNP/1AuvaycjL2Ys0q16L0L2151c+
 nxBu9gsWS1Fa+1TnFwusK19UNhz3Y6ENY0GZi1yKeOnkhl3BHyoqLUZEsaCdmQy5VQV9WTThN
 tzdoKUbwmfzpI0w6LZqc8QX72OTz+/9bj9/5jxZX3eMKMZl0Oz/zyY5B4HOpPKgKaTAK0wv8q
 aeFUW9M
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The netdev reports NETDEV_STREAM_CONNECTED event when the backend
is connected, and NETDEV_STREAM_EOC when it is disconnected.

The NETDEV_STREAM_CONNECTED event includes the URI of the destination
address.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/stream.c  | 11 +++++++++--
 qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 8e4618e3f84d..926c6e6a015e 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -38,6 +38,7 @@
 #include "io/channel.h"
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
+#include "qapi/qapi-events-net.h"
 
 typedef struct NetStreamState {
     NetClientState nc;
@@ -169,6 +170,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
         s->nc.link_down = true;
         qemu_set_info_str(&s->nc, "");
 
+        qapi_event_send_netdev_stream_eoc(s->nc.name);
+
         return G_SOURCE_REMOVE;
     }
     buf = buf1;
@@ -244,9 +247,10 @@ static void net_stream_listen(QIONetListener *listener,
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
-    g_free(uri);
     qapi_free_SocketAddress(addr);
 
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
 }
 
 static void net_stream_server_listening(QIOTask *task, gpointer opaque)
@@ -318,12 +322,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
-    g_free(uri);
 
     ret = qemu_socket_try_set_nonblock(sioc->fd);
     if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
         qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
                           addr->u.fd.str, -ret);
+        g_free(uri);
         return;
     }
     g_assert(ret == 0);
@@ -336,6 +340,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
 
     s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
                                             s, NULL);
+
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
 }
 
 static int net_stream_client_init(NetClientState *peer,
diff --git a/qapi/net.json b/qapi/net.json
index 14d1531536c5..3173682b4e09 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -891,3 +891,49 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @NETDEV_STREAM_CONNECTED:
+#
+# Emitted when the netdev stream backend is connected
+#
+# @netdev-id: QEMU netdev id that is connected
+# @uri: The Uniform Resource Identifier identifying the destination address
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { 'event': 'NETDEV_STREAM_CONNECTED',
+#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
+#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
+#
+# or
+#
+# <- { 'event': 'NETDEV_STREAM_CONNECTED',
+#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
+#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
+#
+##
+{ 'event': 'NETDEV_STREAM_CONNECTED',
+  'data': { 'netdev-id': 'str',
+            'uri': 'str' } }
+
+##
+# @NETDEV_STREAM_EOC:
+#
+# Emitted when the netdev stream backend is disconnected
+#
+# @netdev-id: QEMU netdev id that is disconnected
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { 'event': 'NETDEV_STREAM_EOC',
+#      'data': {'netdev-id': 'netdev0'},
+#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
+#
+##
+{ 'event': 'NETDEV_STREAM_EOC',
+  'data': { 'netdev-id': 'str' } }
-- 
2.37.3


