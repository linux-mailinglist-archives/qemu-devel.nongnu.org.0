Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059F6109D6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:52:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIGY-00084b-G8; Fri, 28 Oct 2022 01:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIG1-0007c6-NO
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIFy-0007yA-7V
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yim4hN5M2QyA/LcySuAPRnMDv88LnV/rxlL/OqW1+Zs=;
 b=HdOT6Le9ux1f7cinI1tJ6BxDz/EY4f3sFVM4vwDSgYAIlN7a9UbMkJ5DpAoIK28EUTBsi7
 qtITjju3mZcT33lk/iQU7wM7PuRsz4E3ib9nN6/J2FOdfkD9KPL3WYCi9IR4Fw4meACAOt
 8HK7NS4B6trKvDk7yojF81c+qWgiif4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-YHG0iVHnPgegihifxLgC4g-1; Fri, 28 Oct 2022 01:50:09 -0400
X-MC-Unique: YHG0iVHnPgegihifxLgC4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95D14101A52A
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:50:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45A1BC15BA8;
 Fri, 28 Oct 2022 05:50:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 26/26] net: stream: add QAPI events to report connection state
Date: Fri, 28 Oct 2022 13:48:35 +0800
Message-Id: <20221028054835.29674-27-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Laurent Vivier <lvivier@redhat.com>

The netdev reports NETDEV_STREAM_CONNECTED event when the backend
is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

The NETDEV_STREAM_CONNECTED event includes the destination address.

This allows a system manager like libvirt to detect when the server
fails.

For instance with passt:

{ 'execute': 'qmp_capabilities' }
{ "return": { } }
{ "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
    "event": "NETDEV_STREAM_CONNECTED",
    "data": { "netdev-id": "netdev0",
        "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }

[killing passt here]

{ "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
    "event": "NETDEV_STREAM_DISCONNECTED",
    "data": { "netdev-id": "netdev0" } }

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/stream.c  |  5 +++++
 qapi/net.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/net/stream.c b/net/stream.c
index 54c67e1..53b7040 100644
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
@@ -244,6 +247,7 @@ static void net_stream_listen(QIONetListener *listener,
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
     g_free(uri);
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
 }
 
@@ -335,6 +339,7 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
                                             s, NULL);
     s->nc.link_down = false;
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
 
     return;
diff --git a/qapi/net.json b/qapi/net.json
index cbc8d77..522ac58 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -898,3 +898,52 @@
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
+# @addr: The destination address
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { "event": "NETDEV_STREAM_CONNECTED",
+#      "data": { "netdev-id": "netdev0",
+#                "addr": { "port": "47666", "ipv6": true,
+#                          "host": "::1", "type": "inet" } },
+#      "timestamp": { "seconds": 1666269863, "microseconds": 311222 } }
+#
+# or
+#
+# <- { "event": "NETDEV_STREAM_CONNECTED",
+#      "data": { "netdev-id": "netdev0",
+#                "addr": { "path": "/tmp/qemu0", "type": "unix" } },
+#      "timestamp": { "seconds": 1666269706, "microseconds": 413651 } }
+#
+##
+{ 'event': 'NETDEV_STREAM_CONNECTED',
+  'data': { 'netdev-id': 'str',
+            'addr': 'SocketAddress' } }
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
2.7.4


