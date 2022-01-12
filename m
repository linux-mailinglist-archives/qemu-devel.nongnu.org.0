Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C093E48C025
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:43:09 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZDo-0004zc-Pw
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3w-0003fr-0a
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3u-0002fV-6o
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641976373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhZsgv4sPQaXFtzY16yWsVIvtj+86X5z7l4XzOuYVZs=;
 b=fp1GIhQwaRzHD4qAKJNu8LO/OQPhotuCz4u9l1Uat2zIdXR/pW/PfU8UZMvP3jwikA1a7W
 Me8DSJiJxXoIQeyANEYbHlTXUJmbOaWpOX+/kqNZdl40++oqs1O10Wd5VStTqnsU69GjaQ
 21dvF9qdySX/Ekyq8A68zRUrEBmJN3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-mI-dVWANN76tfbRqy7JPzw-1; Wed, 12 Jan 2022 03:32:50 -0500
X-MC-Unique: mI-dVWANN76tfbRqy7JPzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB2F484BA43;
 Wed, 12 Jan 2022 08:32:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-115.pek2.redhat.com
 [10.72.13.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E5C73151;
 Wed, 12 Jan 2022 08:32:47 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 04/13] net/colo-compare.c: Optimize compare order for
 performance
Date: Wed, 12 Jan 2022 16:32:11 +0800
Message-Id: <20220112083220.51806-5-jasowang@redhat.com>
In-Reply-To: <20220112083220.51806-1-jasowang@redhat.com>
References: <20220112083220.51806-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 leirao <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

COLO-compare use the glib function g_queue_find_custom to dump
another VM's networking packet to compare. But this function always
start find from the queue->head(here is the newest packet), It will
reduce the success rate of comparison. So this patch reversed
the order of the queues for performance.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reported-by: leirao <lei.rao@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b966e7e..216de5a 100644
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
2.7.4


