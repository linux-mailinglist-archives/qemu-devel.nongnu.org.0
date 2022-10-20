Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDEE605B67
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:46:36 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olS8H-0004iK-Dl
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:46:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olS0k-0000id-OV
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfp-00032F-PU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:11 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:47683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfn-0005LK-Bq
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:09 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJdE-1pUiej3hw4-00jGVW; Thu, 20 Oct 2022 11:16:58 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v12 17/17] net: stream: add QAPI events to report connection
 state
Date: Thu, 20 Oct 2022 11:16:24 +0200
Message-Id: <20221020091624.48368-18-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BMDXyw1i1PI1BNI3n7CxEZG2rEIig4qtmnIwVCRGZ8kKuSpDNWI
 98LDzrvkBaD9Bb3ATUXF1OOjYAn4yNd4WeYdWUa0WtW9Fr8wNSWKYGoSIrVDEAEiq8Xaztt
 0tg5+FMrdIviR82NsvaGYRBpvnCm+GWlexSe/UqcyhbPyPW1f2UGMgPpiB5idNsMbx77bal
 7eYe5nvCTOQt8ijOekPkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5idzqakK7aA=:PdmSNBYPYZN6TfRGlZGxqf
 uJclGnrR2L7r2m8dJvBYB7KrlSsacFT4neCZ8eMhl1JRDu2DIvQMi9zxNpLKy8Crrt78iZiFZ
 QfWb8sveZegpSHE0EjeRd6akS9J6nTYRz7r9H0RH3p7bm42bJoCTKkBPtitRMyZak9bo7IVi2
 igAYHAoAukxcz2Mz7gKuf0TqKxxlYoqhzQi6t2YXq0Upy9nIE3WJKcDD7lsm/3ODL2l2/fOZ6
 OkdPFKWN8Dzqblx+sqORbAyo2hqYurEsDJqAGJEiDfYq8x+Y2N/TAS5On4PRhBocTRV0kVLQT
 AIXeQK8Lu/3C2XypbG2CJhWvcl4SS2vPxTaiU6FYe3YrAx+vbGOkY5DWXwm20Ofg7y5UoF9eY
 HVQIgj7ySsUiyz42rfesplZ85mGEne+VxePIMSJxxgTCj4Bq1Ywed8xkLiJr7j023tA5PTRPV
 ghBPg4jkjPzUfuDnlXbnmcOIvd0I6xYiABPjvxCHPpS3FLqL/CVgmHAZdabkR9H8YVx1QsgAM
 vRx8S0ngRcl+sScr4hdF7jgfh19V3g4Lc5VYV/vL9toDdnek9+CZXdJ0xA2Da+x3mALebsnqf
 Lm5ns6V0U5q+LlKEyY+dZpxhNNChd4YFpfra3mfIdUpW1ltJB0LLcLbwjzUd6LknTI3P2cnj0
 hXsN9+xgjKzkfthpOpwn2+vrtPKc2Ix9j6rkvlvd14bZ5tkH4Vi67XEU/M+13qUhpsC8EDu9o
 7OSM0VF2Y8ZZ5v+lJSEdUwdBmSdcKEJdwTXcDfUsBhHjHg45G35YWAtEKyLdBxKGMYJN0niJg
 9tNRCkK
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The netdev reports NETDEV_STREAM_CONNECTED event when the backend
is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

The NETDEV_STREAM_CONNECTED event includes the URI of the destination
address.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/stream.c  | 11 +++++++++--
 qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 95d6b910407d..8ad757cefbdf 100644
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
 
+        qapi_event_send_netdev_stream_disconnected(s->nc.name);
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
index 39388b1b6c41..569ab7fd37e3 100644
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
+# @NETDEV_STREAM_DISCONNECTED:
+#
+# Emitted when the netdev stream backend is disconnected
+#
+# @netdev-id: QEMU netdev id that is disconnected
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { 'event': 'NETDEV_STREAM_DISCONNECTED',
+#      'data': {'netdev-id': 'netdev0'},
+#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
+#
+##
+{ 'event': 'NETDEV_STREAM_DISCONNECTED',
+  'data': { 'netdev-id': 'str' } }
-- 
2.37.3


