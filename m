Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919875EB20B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:25:05 +0200 (CEST)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuf1-0000OY-V6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8K-0008O4-1o
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:17 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8I-0005yv-6t
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:15 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MeDYt-1pD4EF0ZSp-00bHBg; Mon, 26 Sep 2022 21:51:08 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v9 16/16] net: stream: add QAPI events to report connection
 state
Date: Mon, 26 Sep 2022 21:50:48 +0200
Message-Id: <20220926195048.487915-17-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8xIdsAiIgrEIaVZte9hpYUldYf52KSCrOn3k0R2QwlOqhMfDu4d
 8Q0G2nUGYFM9bWeyY5IzyV6EXcee+pj2tfJ2r9/oo1iavqRF2c3AfGBj/EZJ05I29pOxotD
 3fa64/Ip3MpKVrGxGUhSjNMpPP6328WKfaLBL3bLU5MY9JuauwRrJEymjo/oc+qhnTFUVZF
 +wqFA+lbE1iUAnQn5Drxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+wJ2aaT51X8=:A26wBue5T5ot5TzFoQ65i8
 DVM5hQGu/8lypQRSRHwZ1i59JsHGbz3QzopHJnRLO4f3rSrhC5ApyvxGEc4DHS7IzsjSIUqjY
 7YLN/nyTXk7Ab7zlxr9DDLSiHxW3XaV9Z6n5KWqpxNXyktzsF/NV6WFkJwypAhPayw8x1k6m0
 mzqyKzInoQexSkmfd0dZV+1GznLynFPVfrlhA7a3sE20zWDq6uPvX9EAmmEcieCrODsOkumKs
 jj5HgdmOuYmHgYeC+WyHA1J8oI1nzJVuUUeAq8SLlctilXML4/meUNt4lLVX3THPvXYGdwQVi
 4srRP4D+s21fsheqeT399+EoiaegQa01nxKZgXgCHtsdwH7lzDdPpQEQceWO4FTOw58XevMpq
 i2N/jVK9ol4sCY+oeLQxfDh5bwjELNhjrPW23+tKnqVG2Phgv5MtwmFi1VRl5CY09UzheNX51
 OrOvPkwFBsW5AkwWWv+g25x1RpRs53JqggSFnR4yhLU2tu3emu6hG4FiA2pZL6EK6K0jLQWb1
 Z33G1afKlJTfQEvvO6WaRi65TzCv1zWXbjIfgJMzU3DknaTq/eocm5Juq94X0fRrWgQvkbyq7
 LbvtIbIJ47OncNJolSS+5WrBYjDbaz6f/guZ+xi2gFVQxmzlD0E7pRRRjTjNSwJn4hPup1Fy5
 NOB9R7vy+ogvJniFjcyl0rtapah3vNyXmDEDtHNzgQiTO2dEUO25V+uZRGPLPCt5L+9EVQCe5
 6nojILXdsRXtpWZSC3W83TWqMwE0zyn5bmDoX1Dgww+m9zBVE0SDeKwX6vRaXip8I9gwEa4Q4
 pHTDTqQ
Received-SPF: permerror client-ip=212.227.126.131;
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
index 9b50a32531a9..745967c3608d 100644
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
         memset(s->nc.info_str, 0, sizeof(s->nc.info_str));
 
+        qapi_event_send_netdev_stream_eoc(s->nc.name);
+
         return G_SOURCE_REMOVE;
     }
     buf = buf1;
@@ -244,9 +247,10 @@ static void net_stream_listen(QIONetListener *listener,
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), uri);
-    g_free(uri);
     qapi_free_SocketAddress(addr);
 
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
 }
 
 static void net_stream_server_listening(QIOTask *task, gpointer opaque)
@@ -319,13 +323,13 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), uri);
-    g_free(uri);
 
     ret = qemu_socket_try_set_nonblock(sioc->fd);
     if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
         snprintf(s->nc.info_str, sizeof(s->nc.info_str),
                  "can't use file descriptor %s (errno %d)",
                  addr->u.fd.str, -ret);
+        g_free(uri);
         return;
     }
     g_assert(ret == 0);
@@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
 
     s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
                                             s, NULL);
+
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
 }
 
 static int net_stream_client_init(NetClientState *peer,
diff --git a/qapi/net.json b/qapi/net.json
index 9cc4be7535bb..6bf919afc26a 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -892,3 +892,49 @@
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


