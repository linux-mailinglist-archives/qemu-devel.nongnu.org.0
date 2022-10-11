Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D85FBC51
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:42:40 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiM5H-0007mW-NS
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWR-0006TR-5r
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:40 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLWO-0003n1-PQ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:38 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MkYLW-1pRsXE1Tsk-00m5IA; Tue, 11 Oct 2022 22:06:10 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
Subject: [PATCH v11 17/17] net: stream: add QAPI events to report connection
 state
Date: Tue, 11 Oct 2022 22:05:39 +0200
Message-Id: <20221011200539.1486809-18-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ukB643UynxESkuvexvwLMO3uLV40x/y239Rykp2Y8sCiFWsyJzz
 351vqoEiEJ+zfGSWXiI8XZ0XxoDl75/BoX8hEZBsBrZQRf7ry6FHk62R2I9B7JdBl8SOFqV
 G9iftbojj91MV499/58NxR26Ka9FYnfrnqkyhvFfI6Dbl89+juAGFqb1WNwMcQjsJ1JiA4F
 4xVtj1/D/e2gkxRQkwCAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aw+E7ZncHHc=:sGiI6m52tLA4EWvJQWVP1v
 wqQwOtOSmF+ipRzx0rMfFy78aiXhu++rHuFct7/hixs5OutDiOy2cFQAs23H3LMEZrV+Fj+w2
 Jxum8wTo2mnQOH9V63eme0Vk9ldwizckHyFbYzhmN5o0TlkCarhyKt4JuNi9NUkLDSyCBIZbX
 Exm3/VS7xtcUFMGtrBCWdo/LSwVf31G6ViTPzv1F1tCMlDyNKwGN86ZEsMBCyYANIJMNEkiN7
 F5shUVmMlTWl98xQoJyPNCSaezFhoWi5zua8k4ZOGXjDFpFjkDVkSPs3pakeq+qjK9YliM1eL
 0yUApUMAiU8uYcUJm0y2H+9Y3NsuJzKVo0mrgB2CDpA4cb5zsPmWTGNJO7oW4is3iYpCcv2uA
 x420htJSvn727nVtYfz12NUDtqJnYngX4WW68CT9RxuuFSPMdfWYLp1QFzTCvpIOeLlEuLS69
 zM7joIFwsjKL3Ws/t9Rk8xsi99GgGNFGhjJbJP3f3ioXi/Co/MLcg0dlQtXv3146ZyY7F4b+n
 MSr0CvZz4LUx0230ZXxoN98l81Af4ai3jQujngFai9+pMcXdBwCqmOCy+F6kirkyPjCKFvWDU
 N7laJXqxe5RDMfeMiJHGm3+Q2i4VJ/AfVSm1k7LqTxv2HRcDBtV9ZqF7aF0dCcW0VaZLHnRh/
 N8qvPBPHUzZVcGeDmjk/MPxCtKKuRMerXVo/GNlcVDuGf8bop8WWZpBuo/kS44bWnOr/E+M1m
 +Rq6Tt4F8wSaFL8PgNCx3mhYlPX2B4zgZtVYHkKdHksYw6B7vZlNND8Un8x1uzYt9v8F5Kwdw
 ZM9HMrG
Received-SPF: permerror client-ip=212.227.126.130;
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/stream.c  | 11 +++++++++--
 qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 0293e38e5b57..821ae3265356 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -38,6 +38,7 @@
 #include "io/channel.h"
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
+#include "qapi/qapi-events-net.h"
 
 typedef struct NetStreamState {
     NetClientState nc;
@@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
         s->nc.link_down = true;
         qemu_set_info_str(&s->nc, "");
 
+        qapi_event_send_netdev_stream_eoc(s->nc.name);
+
         return G_SOURCE_REMOVE;
     }
     buf = buf1;
@@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
-    g_free(uri);
     qapi_free_SocketAddress(addr);
 
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
 }
 
 static void net_stream_server_listening(QIOTask *task, gpointer opaque)
@@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     g_assert(addr != NULL);
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
-    g_free(uri);
 
     ret = qemu_socket_try_set_nonblock(sioc->fd);
     if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
         qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
                           addr->u.fd.str, -ret);
+        g_free(uri);
         qapi_free_SocketAddress(addr);
         goto error;
     }
@@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
                                             s, NULL);
     s->nc.link_down = false;
 
+    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
+    g_free(uri);
+
     return;
 error:
     object_unref(OBJECT(s->ioc));
diff --git a/qapi/net.json b/qapi/net.json
index 6a1a49749294..69f83bceff3f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -895,3 +895,49 @@
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


