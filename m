Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632C832B3F4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:25:23 +0100 (CET)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ4c-0001tS-FM
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0f-0005TE-5j
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:17 -0500
Received: from mga18.intel.com ([134.134.136.126]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0d-000591-BD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:16 -0500
IronPort-SDR: Oa4q8qmbzZqQlB/l67ML2wWRRCd4VKqKwcFodXWWdCGMNwrwp/SDzwWso7EmOKe0DHsSbd6s+S
 IgF226D0eCJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732242"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:14 -0800
IronPort-SDR: aNiscmCcDGy0aMH/GgZvxWj48UkuVgs8PUGDtCzTqgZs7L55CPyyd1a+eISZ44MRz3J7Tik3Ao
 GBB2zOCxt/iw==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407060047"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:11 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 6/7] net/colo-compare: Add passthrough list to CompareState
Date: Wed,  3 Mar 2021 12:15:38 +0800
Message-Id: <20210303041539.1032415-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add passthrough list for each CompareState.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 25 +++++++++++++++++++++++++
 net/colo-compare.h | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index a803f8b888..80cea32c20 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    PassthroughEntry *bypass, *next;
     int ret;
 
     if (mode == PRIMARY_IN) {
@@ -160,6 +161,29 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     }
     fill_connection_key(pkt, &key);
 
+    /* Check COLO passthrough connenction */
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
+                                return -1;
+                            }
+                        }
+                    }
+                }
+            }
+        }
+    }
+
     conn = connection_get(s->connection_track_table,
                           &key,
                           &s->conn_list);
@@ -1224,6 +1248,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     g_queue_init(&s->conn_list);
+    QLIST_INIT(&s->passthroughlist);
 
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
diff --git a/net/colo-compare.h b/net/colo-compare.h
index 2a9dcac0a7..31644f145b 100644
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
@@ -110,6 +119,7 @@ struct CompareState {
 
     QEMUBH *event_bh;
     enum colo_event event;
+    QLIST_HEAD(, PassthroughEntry) passthroughlist;
 
     QTAILQ_ENTRY(CompareState) next;
 };
-- 
2.25.1


