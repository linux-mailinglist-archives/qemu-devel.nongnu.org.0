Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603047A346
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 02:19:33 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz7Kt-0001ag-8P
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 20:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mz7IT-0000N0-PQ
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 20:17:01 -0500
Received: from mga01.intel.com ([192.55.52.88]:46571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mz7IR-0008OU-1q
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 20:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639963019; x=1671499019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=viMARr3WAXsxH84iUwuTuMEvWkdL8QMoD+QKjSxoH0Y=;
 b=IJP/+RdtH9GYtcvJe8CtRlqoRHKoySxn5rybk2hOZgbFvVvp/hE2b0dM
 +AxxVeX+DXiz8vOjeK3bu+BK+7BGCh3zIsSsj8z9DFlhgk7g9enEDfO6W
 etIhHsmnFOwEvKXP6QPmxsAWnPfJETbcdtrqqk81MJWB/mm2gfK4LQPFy
 MJ0WF0IbpaEFUxDlV0SKmDot3PP/AwuyER8+KUi0kjJnk5Zr++7lVVwHe
 /LQiHynZDTXu48dOWGh3itQno6ZXa+kBG4yoo7aT9rkLPbKgqhHlUWP6D
 i82626WfUh+gfcYunDZZHve4LqU5b++jRpBOJ8m9i5TR8WR+vtO7AeEwE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="264256325"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="264256325"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 17:16:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="467210998"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 17:16:52 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 1/2] net/colo-compare.c: Optimize compare order for performance
Date: Mon, 20 Dec 2021 09:06:02 +0800
Message-Id: <20211220010603.1443843-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.204,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, leirao <lei.rao@intel.com>,
 qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

COLO-compare use the glib function g_queue_find_custom to dump
another VM's networking packet to compare. But this function always
start find from the queue->head(here is the newest packet), It will
reduce the success rate of comparison. So this patch reversed
the order of the queues for performance.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reported-by: leirao <lei.rao@intel.com>
---
 net/colo-compare.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b966e7e514..216de5a12b 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -197,7 +197,7 @@ static void colo_compare_inconsistency_notify(CompareState *s)
 /* Use restricted to colo_insert_packet() */
 static gint seq_sorter(Packet *a, Packet *b, gpointer data)
 {
-    return a->tcp_seq - b->tcp_seq;
+    return b->tcp_seq - a->tcp_seq;
 }
 
 static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
@@ -421,13 +421,13 @@ pri:
     if (g_queue_is_empty(&conn->primary_list)) {
         return;
     }
-    ppkt = g_queue_pop_head(&conn->primary_list);
+    ppkt = g_queue_pop_tail(&conn->primary_list);
 sec:
     if (g_queue_is_empty(&conn->secondary_list)) {
-        g_queue_push_head(&conn->primary_list, ppkt);
+        g_queue_push_tail(&conn->primary_list, ppkt);
         return;
     }
-    spkt = g_queue_pop_head(&conn->secondary_list);
+    spkt = g_queue_pop_tail(&conn->secondary_list);
 
     if (ppkt->tcp_seq == ppkt->seq_end) {
         colo_release_primary_pkt(s, ppkt);
@@ -458,7 +458,7 @@ sec:
             }
         }
         if (!ppkt) {
-            g_queue_push_head(&conn->secondary_list, spkt);
+            g_queue_push_tail(&conn->secondary_list, spkt);
             goto pri;
         }
     }
@@ -477,7 +477,7 @@ sec:
         if (mark == COLO_COMPARE_FREE_PRIMARY) {
             conn->compare_seq = ppkt->seq_end;
             colo_release_primary_pkt(s, ppkt);
-            g_queue_push_head(&conn->secondary_list, spkt);
+            g_queue_push_tail(&conn->secondary_list, spkt);
             goto pri;
         } else if (mark == COLO_COMPARE_FREE_SECONDARY) {
             conn->compare_seq = spkt->seq_end;
@@ -490,8 +490,8 @@ sec:
             goto pri;
         }
     } else {
-        g_queue_push_head(&conn->primary_list, ppkt);
-        g_queue_push_head(&conn->secondary_list, spkt);
+        g_queue_push_tail(&conn->primary_list, ppkt);
+        g_queue_push_tail(&conn->secondary_list, spkt);
 
 #ifdef DEBUG_COLO_PACKETS
         qemu_hexdump(stderr, "colo-compare ppkt", ppkt->data, ppkt->size);
@@ -673,7 +673,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
 
     while (!g_queue_is_empty(&conn->primary_list) &&
            !g_queue_is_empty(&conn->secondary_list)) {
-        pkt = g_queue_pop_head(&conn->primary_list);
+        pkt = g_queue_pop_tail(&conn->primary_list);
         result = g_queue_find_custom(&conn->secondary_list,
                  pkt, (GCompareFunc)HandlePacket);
 
@@ -689,7 +689,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
              * timeout, it will trigger a checkpoint request.
              */
             trace_colo_compare_main("packet different");
-            g_queue_push_head(&conn->primary_list, pkt);
+            g_queue_push_tail(&conn->primary_list, pkt);
 
             colo_compare_inconsistency_notify(s);
             break;
@@ -819,7 +819,7 @@ static int compare_chr_send(CompareState *s,
         entry->buf = g_malloc(size);
         memcpy(entry->buf, buf, size);
     }
-    g_queue_push_head(&sendco->send_list, entry);
+    g_queue_push_tail(&sendco->send_list, entry);
 
     if (sendco->done) {
         sendco->co = qemu_coroutine_create(_compare_chr_send, sendco);
@@ -1347,7 +1347,7 @@ static void colo_flush_packets(void *opaque, void *user_data)
     Packet *pkt = NULL;
 
     while (!g_queue_is_empty(&conn->primary_list)) {
-        pkt = g_queue_pop_head(&conn->primary_list);
+        pkt = g_queue_pop_tail(&conn->primary_list);
         compare_chr_send(s,
                          pkt->data,
                          pkt->size,
@@ -1357,7 +1357,7 @@ static void colo_flush_packets(void *opaque, void *user_data)
         packet_destroy_partial(pkt, NULL);
     }
     while (!g_queue_is_empty(&conn->secondary_list)) {
-        pkt = g_queue_pop_head(&conn->secondary_list);
+        pkt = g_queue_pop_tail(&conn->secondary_list);
         packet_destroy(pkt, NULL);
     }
 }
-- 
2.25.1


