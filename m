Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E233FDA5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 04:17:02 +0100 (CET)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMj9g-0003Og-Tl
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 23:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3n-0004Ob-AF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:54706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMj3k-0005wD-HL
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:10:55 -0400
IronPort-SDR: b2jOrDz3uzt0EagMqak6dy7g5XZnZ6Dp9DDSilRp0aoeyHyDLE6j14BN376Y1IWktk02Vu2JQg
 MudugLa4L6ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189681354"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189681354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:51 -0700
IronPort-SDR: 6tscJbnu7obPtbHWtrzlEk+HM+I3VNQcJ2bHDuZWuqyIGgR8a08DUbI3+EUAL7o2RAbhRIP48z
 lFAOtQEh6igA==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412898271"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:10:49 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V3 6/7] net/colo-compare: Add passthrough list to CompareState
Date: Thu, 18 Mar 2021 11:04:59 +0800
Message-Id: <20210318030500.55352-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318030500.55352-1-chen.zhang@intel.com>
References: <20210318030500.55352-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add passthrough list for each CompareState.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 29 +++++++++++++++++++++++++++++
 net/colo-compare.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index a803f8b888..40af8cd501 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    PassthroughEntry *bypass, *next;
     int ret;
 
     if (mode == PRIMARY_IN) {
@@ -160,6 +161,32 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     }
     fill_connection_key(pkt, &key);
 
+    /* Check COLO passthrough connenction */
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(bypass, &s->passthroughlist, node, next) {
+            if (((key.ip_proto == IPPROTO_TCP) && (bypass->l4_protocol == 0)) ||
+                ((key.ip_proto == IPPROTO_UDP) && (bypass->l4_protocol == 1))) {
+                if (bypass->src_port == 0 || bypass->src_port == key.dst_port) {
+                    if (bypass->src_ip.s_addr == 0 ||
+                        bypass->src_ip.s_addr == key.src.s_addr) {
+                        if (bypass->dst_port == 0 ||
+                            bypass->dst_port == key.src_port) {
+                            if (bypass->dst_ip.s_addr == 0 ||
+                                bypass->dst_ip.s_addr == key.dst.s_addr) {
+                                packet_destroy(pkt, NULL);
+                                pkt = NULL;
+                                qemu_mutex_unlock(&s->passthroughlist_mutex);
+                                return -1;
+                            }
+                        }
+                    }
+                }
+            }
+        }
+    }
+    qemu_mutex_unlock(&s->passthroughlist_mutex);
+
     conn = connection_get(s->connection_track_table,
                           &key,
                           &s->conn_list);
@@ -1224,6 +1251,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     g_queue_init(&s->conn_list);
+    QLIST_INIT(&s->passthroughlist);
 
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
@@ -1236,6 +1264,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     if (!colo_compare_active) {
         qemu_mutex_init(&event_mtx);
         qemu_cond_init(&event_complete_cond);
+        qemu_mutex_init(&s->passthroughlist_mutex);
         colo_compare_active = true;
     }
     QTAILQ_INSERT_TAIL(&net_compares, s, next);
diff --git a/net/colo-compare.h b/net/colo-compare.h
index 2a9dcac0a7..2259abcd63 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -54,6 +54,15 @@ typedef struct SendEntry {
     uint8_t *buf;
 } SendEntry;
 
+typedef struct PassthroughEntry {
+    int l4_protocol;
+    int src_port;
+    int dst_port;
+    struct in_addr src_ip;
+    struct in_addr dst_ip;
+    QLIST_ENTRY(PassthroughEntry) node;
+} PassthroughEntry;
+
 /*
  *  + CompareState ++
  *  |               |
@@ -110,6 +119,8 @@ struct CompareState {
 
     QEMUBH *event_bh;
     enum colo_event event;
+    QLIST_HEAD(, PassthroughEntry) passthroughlist;
+    QemuMutex passthroughlist_mutex;
 
     QTAILQ_ENTRY(CompareState) next;
 };
-- 
2.25.1


