Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775368B472
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 04:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOs4J-0002vt-QJ; Sun, 05 Feb 2023 22:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4H-0002v8-U7
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:21 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4F-000694-T0
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:21 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VawTBr._1675653665; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VawTBr._1675653665) by smtp.aliyun-inc.com;
 Mon, 06 Feb 2023 11:21:06 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 1/2] virtio_net: virtio_net_tx_complete() stop flush new
 packets for purge operation
Date: Mon,  6 Feb 2023 11:21:04 +0800
Message-Id: <20230206032105.35831-2-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230206032105.35831-1-xuanzhuo@linux.alibaba.com>
References: <20230206032105.35831-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 761767cc32
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For async tx, virtio_net_tx_complete() is called when purge or flush
operation is done. But for purge operation, we should not try to flush
new packet from tx queue. The purge operation means we will stop the
queue soon.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/virtio-net.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..6daa1e5ac1 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2601,21 +2601,25 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
     q->async_tx.elem = NULL;
 
     virtio_queue_set_notification(q->tx_vq, 1);
-    ret = virtio_net_flush_tx(q);
-    if (ret >= n->tx_burst) {
-        /*
-         * the flush has been stopped by tx_burst
-         * we will not receive notification for the
-         * remainining part, so re-schedule
-         */
-        virtio_queue_set_notification(q->tx_vq, 0);
-        if (q->tx_bh) {
-            qemu_bh_schedule(q->tx_bh);
-        } else {
-            timer_mod(q->tx_timer,
-                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+
+    /* len == 0 means purge, we should not flush new tx packets. */
+    if (len) {
+        ret = virtio_net_flush_tx(q);
+        if (ret >= n->tx_burst) {
+            /*
+             * the flush has been stopped by tx_burst
+             * we will not receive notification for the
+             * remainining part, so re-schedule
+             */
+            virtio_queue_set_notification(q->tx_vq, 0);
+            if (q->tx_bh) {
+                qemu_bh_schedule(q->tx_bh);
+            } else {
+                timer_mod(q->tx_timer,
+                          qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
+            }
+            q->tx_waiting = 1;
         }
-        q->tx_waiting = 1;
     }
 }
 
-- 
2.32.0.3.g01195cf9f


