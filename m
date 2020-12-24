Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD92E235F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 02:17:34 +0100 (CET)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksFFz-0002qw-Mb
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 20:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFCH-0001XA-1a
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFCF-0004bX-9R
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:40 -0500
IronPort-SDR: q2JkD8txv8gTyEtczXUFcc6UzfejFV9qnv10WDz9YtNQlau4y39rtxjSXCJR9b8vjkKN2mlsjF
 Dqk+Fr4RYLtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="237652010"
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="237652010"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:22 -0800
IronPort-SDR: 2/eLm4uw9NezWb+g5hc+pKBOfqaIUPFmlhvwsgzl0oSruMLbrwerYFd2uH1+0K/NIoDdBMLjFs
 mvFQNITptJHg==
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="565580046"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:20 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 3/3] net/colo-compare: Add handler for passthrough connection
Date: Thu, 24 Dec 2020 09:09:18 +0800
Message-Id: <20201224010918.19275-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201224010918.19275-1-chen.zhang@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=2.3, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Currently, we just use guest's TCP/UDP source port as the key
to bypass certain network traffic.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 net/colo-compare.h |  2 ++
 net/net.c          | 27 +++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 337025b44f..11a32caa9b 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -46,6 +46,9 @@ static QTAILQ_HEAD(, CompareState) net_compares =
 static NotifierList colo_compare_notifiers =
     NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
 
+static QLIST_HEAD(, PassthroughEntry) passthroughlist =
+    QLIST_HEAD_INITIALIZER(passthroughlist);
+
 #define COMPARE_READ_LEN_MAX NET_BUFSIZE
 #define MAX_QUEUE_SIZE 1024
 
@@ -103,6 +106,12 @@ typedef struct SendEntry {
     uint8_t *buf;
 } SendEntry;
 
+typedef struct PassthroughEntry {
+    bool is_tcp;
+    uint16_t port;
+    QLIST_ENTRY(PassthroughEntry) node;
+} PassthroughEntry;
+
 struct CompareState {
     Object parent;
 
@@ -247,6 +256,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    PassthroughEntry *bypass, *next;
     int ret;
 
     if (mode == PRIMARY_IN) {
@@ -264,8 +274,23 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
         pkt = NULL;
         return -1;
     }
+
     fill_connection_key(pkt, &key);
 
+    /* Check COLO passthrough connenction */
+    if (!QLIST_EMPTY(&passthroughlist)) {
+        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
+            if (((key.ip_proto == IPPROTO_TCP) && bypass->is_tcp) ||
+                ((key.ip_proto == IPPROTO_UDP) && !bypass->is_tcp)) {
+                if (bypass->port == key.src_port) {
+                    packet_destroy(pkt, NULL);
+                    pkt = NULL;
+                    return -1;
+                }
+            }
+        }
+    }
+
     conn = connection_get(s->connection_track_table,
                           &key,
                           &s->conn_list);
@@ -1373,6 +1398,30 @@ static void colo_flush_packets(void *opaque, void *user_data)
     }
 }
 
+void colo_compare_passthrough_add(bool is_tcp, const uint16_t port)
+{
+    PassthroughEntry *bypass = NULL;
+
+    bypass = g_new0(PassthroughEntry, 1);
+    bypass->is_tcp = is_tcp;
+    bypass->port = port;
+    QLIST_INSERT_HEAD(&passthroughlist, bypass, node);
+}
+
+void colo_compare_passthrough_del(bool is_tcp, const uint16_t port)
+{
+    PassthroughEntry *bypass = NULL, *next = NULL;
+
+    if (!QLIST_EMPTY(&passthroughlist)) {
+        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
+            if ((bypass->is_tcp == is_tcp) && (bypass->port == port)) {
+                QLIST_REMOVE(bypass, node);
+                g_free(bypass);
+            }
+        }
+    }
+}
+
 static void colo_compare_class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
diff --git a/net/colo-compare.h b/net/colo-compare.h
index 22ddd512e2..1fa026c85e 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -20,5 +20,7 @@
 void colo_notify_compares_event(void *opaque, int event, Error **errp);
 void colo_compare_register_notifier(Notifier *notify);
 void colo_compare_unregister_notifier(Notifier *notify);
+void colo_compare_passthrough_add(bool is_tcp, const uint16_t port);
+void colo_compare_passthrough_del(bool is_tcp, const uint16_t port);
 
 #endif /* QEMU_COLO_COMPARE_H */
diff --git a/net/net.c b/net/net.c
index eac7a92618..1f303e8309 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,6 +55,7 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "net/colo-compare.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1155,12 +1156,38 @@ void qmp_colo_passthrough_add(const char *prot, const uint32_t port,
                               Error **errp)
 {
     /* Setup passthrough connection */
+    if (port > 65536) {
+        error_setg(errp, "COLO pass through get wrong port");
+        return;
+    }
+
+    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
+        colo_compare_passthrough_add(true, (uint16_t)port);
+    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
+        colo_compare_passthrough_add(false, (uint16_t)port);
+    } else {
+        error_setg(errp, "COLO pass through just support tcp or udp protocol");
+        return;
+    }
 }
 
 void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
                               Error **errp)
 {
     /* Delete passthrough connection */
+    if (port > 65536) {
+        error_setg(errp, "COLO pass through get wrong port");
+        return;
+    }
+
+    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
+        colo_compare_passthrough_del(true, (uint16_t)port);
+    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
+        colo_compare_passthrough_del(false, (uint16_t)port);
+    } else {
+        error_setg(errp, "COLO pass through just support tcp or udp protocol");
+        return;
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.17.1


