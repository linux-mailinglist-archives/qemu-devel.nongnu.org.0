Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DDE360779
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:47:44 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzXD-0007Gi-Ce
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRK-0000vb-Ke
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:54488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRF-0002Gx-6X
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:38 -0400
IronPort-SDR: hVtZwFQ0WiaM2ETlzV2SHOEVLo7fnxVBQ5OgrOy+ZBFJwG3wZADAsuQfo5JJWHryvPUqhdGCog
 5rBUY8Mz4gBA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146938"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:31 -0700
IronPort-SDR: KsqX13h4VAk7N+JPfxQB4qhkMvT9gABloxaeYFdBWe9s6LUCBOt5b6Zf2/v1LODhJygBtamtKm
 6vGjWLbaS7Aw==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425134996"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:28 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 5/6] net/colo-compare: Add passthrough list to CompareState
Date: Thu, 15 Apr 2021 18:35:14 +0800
Message-Id: <20210415103515.1251386-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415103515.1251386-1-chen.zhang@intel.com>
References: <20210415103515.1251386-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
index b51b1437ef..fa5a0834b2 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    COLOPassthroughEntry *pass, *next;
     int ret;
 
     if (mode == PRIMARY_IN) {
@@ -160,6 +161,32 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     }
     fill_connection_key(pkt, &key);
 
+    /* Check COLO passthrough specifications */
+    qemu_mutex_lock(&s->passthroughlist_mutex);
+    if (!QLIST_EMPTY(&s->passthroughlist)) {
+        QLIST_FOREACH_SAFE(pass, &s->passthroughlist, node, next) {
+            if (((key.ip_proto == IPPROTO_TCP) && (pass->l4_protocol == 0)) ||
+                ((key.ip_proto == IPPROTO_UDP) && (pass->l4_protocol == 1))) {
+                if (pass->src_port == 0 || pass->src_port == key.dst_port) {
+                    if (pass->src_ip.s_addr == 0 ||
+                        pass->src_ip.s_addr == key.src.s_addr) {
+                        if (pass->dst_port == 0 ||
+                            pass->dst_port == key.src_port) {
+                            if (pass->dst_ip.s_addr == 0 ||
+                                pass->dst_ip.s_addr == key.dst.s_addr) {
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
@@ -1225,6 +1252,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     g_queue_init(&s->conn_list);
+    QLIST_INIT(&s->passthroughlist);
 
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
@@ -1237,6 +1265,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     if (!colo_compare_active) {
         qemu_mutex_init(&event_mtx);
         qemu_cond_init(&event_complete_cond);
+        qemu_mutex_init(&s->passthroughlist_mutex);
         colo_compare_active = true;
     }
     QTAILQ_INSERT_TAIL(&net_compares, s, next);
diff --git a/net/colo-compare.h b/net/colo-compare.h
index ab649c9dbe..fe7fff0d8d 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -54,6 +54,15 @@ typedef struct COLOSendEntry {
     uint8_t *buf;
 } COLOSendEntry;
 
+typedef struct COLOPassthroughEntry {
+    int l4_protocol;
+    int src_port;
+    int dst_port;
+    struct in_addr src_ip;
+    struct in_addr dst_ip;
+    QLIST_ENTRY(COLOPassthroughEntry) node;
+} COLOPassthroughEntry;
+
 /*
  *  + CompareState ++
  *  |               |
@@ -110,6 +119,8 @@ struct CompareState {
 
     QEMUBH *event_bh;
     enum colo_event event;
+    QLIST_HEAD(, COLOPassthroughEntry) passthroughlist;
+    QemuMutex passthroughlist_mutex;
 
     QTAILQ_ENTRY(CompareState) next;
 };
-- 
2.25.1


