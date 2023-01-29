Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027967FC77
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxna-0001U1-Bc; Sat, 28 Jan 2023 21:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLxnY-0001TO-C9
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:52:04 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLxnT-0007Bl-QB
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:52:04 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VaIwus0_1674960712; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaIwus0_1674960712) by smtp.aliyun-inc.com;
 Sun, 29 Jan 2023 10:51:52 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v1 2/2] virtio-net: virtio_net_flush_tx() check for per-queue
 reset
Date: Sun, 29 Jan 2023 10:51:50 +0800
Message-Id: <20230129025150.119972-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: d3903c2c1b
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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

Check whether it is per-queue reset state in virtio_net_flush_tx().

Before per-queue reset, we need to recover async tx resources. At this
time, virtio_net_flush_tx() is called, but we should not try to send
new packets, so virtio_net_flush_tx() should check the current
per-queue reset state.

Fixes: 7dc6be52 ("virtio-net: support queue reset")
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..fba6451a50 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2627,7 +2627,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
     VirtQueueElement *elem;
     int32_t num_packets = 0;
     int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
-    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
+    if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
+        virtio_queue_reset_state(q->tx_vq)) {
         return num_packets;
     }
 
-- 
2.32.0.3.g01195cf9f


