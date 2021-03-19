Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065B341401
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:07:44 +0100 (CET)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6QJ-0004t7-7P
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jx-0006yY-U5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:65167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jv-0004RO-0x
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:09 -0400
IronPort-SDR: nGy0XTujBCW8i2LTindx+K2ylmAyZoDGPt7+cTXQ2j56prLT+cOPq7Nu6tz5vS4x9U9rbUl6Eo
 ZiuPNqfAw4HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409924"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:59 -0700
IronPort-SDR: 0azxCiNkRZ4MO6e8peIeWx8ZvTDmHaTrcm7e6t68Q03d+0s0M6/plRD2MFGAt+izbWmuO+3k/V
 7cjQ3+Lzc9Kw==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456711"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:56 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 6/7] net/colo-compare: Add passthrough list to CompareState
Date: Fri, 19 Mar 2021 11:55:07 +0800
Message-Id: <20210319035508.113741-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319035508.113741-1-chen.zhang@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
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


