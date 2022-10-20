Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54C6066CB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:11:29 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ4T-0003VU-PO
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:11:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYng-0002Vk-25
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNZ-0004vx-U1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:50 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-00076l-1X
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:45 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZjQl-1oZbU20G99-00WrGW; Thu, 20 Oct 2022 18:26:29 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 17/17] net: stream: add QAPI events to report connection
 state
Date: Thu, 20 Oct 2022 18:25:58 +0200
Message-Id: <20221020162558.123284-18-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ClPY+RmgtMJu78OIyrUAFsndfiBsAICuefcqDMPSEUykumV0oa
 pkrYmgXaQFb5pQIxSkTSbWXazvyzPdwvk/fjh939ixbylrzgqZ/7RoPwrc1xEwcy/vgZkcN
 qGlrYM6PIrRSop4JFwQOc9JRH9CnL9g6Y9k8lWtVRGWDt1s0iAYyqD4rk8JnoNQVwyinU9V
 Ks0dXXubYDsT6m7LFNcpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wft59S4V5ag=:5S5861xC8QSUT3tMI6YJY1
 TlKIXQ427MOcEguuHzrJxelhJZFyH6FHOudFJoiU4IIhl4IQVyE6FtlwcSRka3QDS5FxIL5s3
 RzXxYqoXpTanRztWq0kvCyf2gYuc0E3SReGwioIXfnawtdZicLv8zpajqcqz1qRIIX+NwsLBE
 FeuIhrHyZwBX1Cn7BBILjJBTALpJ7WTygDJlcxt4DHvz+Rm+rmQG2zGJagrhmefvRTi7IVlpv
 +ds07+O9meFjmO4yhzJ/3AmFNxJftcINwK2AK6I8o8/i7ZnxhqsDiYStI/KflJbo9tLvpktK8
 ghswShpPclP0xf2y6DOCa65huqAvKnbp/aIuNTPvIWgZnuBgmZ3I9G6gj2QvJ9/IKdywRqGrs
 /iFf/DSk9RMDzBTadb9mcyPoX52k1xqcXIsihmATfywXvVXjdwQ5vkWRw+ahxUwLIdrKnXNo/
 YrZPDCGOCXO+qt/y5wAeiUTpZsHRiU8JK6FbcHDyC9swANj+pwOFcge6AeQAXkpZoF+9n/Dnk
 uNVy/MLTJqysqkgFUe4wFBv9WEnDOF2fzdHCbzts5mHL3eI5wCxoazhnG+EUksQEtVrfWJlla
 reGY84PqqsplbFUcWh4IPZAc9rtkMbt9t/HZnFyROlanMTl9U36MIxcYFh2Q1w/APmh0U4b2b
 Vl1jmS0jVQrm986YyIqtoyksrGOEVS2OkMFuXsoBmlSdk0USe8dIloMKOQOXWbg0BRR1iQzbp
 fJCPr80rMIK8z+JqVKuvpHBobLIGxy+usrrIhrZL8CTNp2KTT3ou3mQpucOC0Zc1lyhqokfUE
 IiR7q+q
Received-SPF: permerror client-ip=212.227.126.133;
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
 net/stream.c  |  9 +++++++--
 qapi/net.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 95d6b910407d..cac01d4d792a 100644
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
@@ -244,8 +247,8 @@ static void net_stream_listen(QIONetListener *listener,
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
     g_free(uri);
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
-
 }
 
 static void net_stream_server_listening(QIOTask *task, gpointer opaque)
@@ -327,7 +330,6 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
         goto error;
     }
     g_assert(ret == 0);
-    qapi_free_SocketAddress(addr);
 
     net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
 
@@ -338,6 +340,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
                                             s, NULL);
     s->nc.link_down = false;
 
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
+    qapi_free_SocketAddress(addr);
+
     return;
 error:
     object_unref(OBJECT(s->ioc));
diff --git a/qapi/net.json b/qapi/net.json
index 39388b1b6c41..c37b24717382 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -895,3 +895,52 @@
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
2.37.3


