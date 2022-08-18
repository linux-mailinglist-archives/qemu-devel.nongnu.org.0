Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8159879E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:40:01 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhcm-0002tp-NE
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhK3-00019J-1W
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:20:39 -0400
Received: from smtp236.sjtu.edu.cn ([202.120.2.236]:47488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhK0-00008W-HQ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:20:38 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp236.sjtu.edu.cn (Postfix) with ESMTPS id 4C5FE1008B391;
 Thu, 18 Aug 2022 23:13:00 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 780512391A011;
 Thu, 18 Aug 2022 23:13:00 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qSkmh4vJ0xkC; Thu, 18 Aug 2022 23:13:00 +0800 (CST)
Received: from localhost.localdomain (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id A90832391A010;
 Thu, 18 Aug 2022 23:12:51 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: eperezma@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 mst@redhat.com
Cc: qemu-devel@nongnu.org,
	Guo Zhi <qtxuning1999@sjtu.edu.cn>
Subject: [RFC 1/2] virtio: expose used buffers
Date: Thu, 18 Aug 2022 23:12:43 +0800
Message-Id: <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
Received-SPF: pass client-ip=202.120.2.236;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp236.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Follow VIRTIO 1.1 spec, we can only writing out a single used ring for a
batch of descriptors, and only notify guest when the batch of
descriptors have all been used.

We do that batch for tx, because the driver doesn't need to know the
length of tx buffer, while for rx, we don't apply the batch strategy.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 hw/net/virtio-net.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056f..c8e83921 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2542,8 +2542,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
     VirtIONet *n = q->n;
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     VirtQueueElement *elem;
+    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
     int32_t num_packets = 0;
     int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
+    size_t j;
     if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
         return num_packets;
     }
@@ -2621,14 +2623,35 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
         }
 
 drop:
-        virtqueue_push(q->tx_vq, elem, 0);
-        virtio_notify(vdev, q->tx_vq);
-        g_free(elem);
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER)) {
+            virtqueue_push(q->tx_vq, elem, 0);
+            virtio_notify(vdev, q->tx_vq);
+            g_free(elem);
+        } else {
+            elems[num_packets] = elem;
+        }
 
         if (++num_packets >= n->tx_burst) {
             break;
         }
     }
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER) && num_packets) {
+        /**
+         * If in order feature negotiated, devices can notify the use of a batch
+         * of buffers to the driver by only writing out a single used ring entry
+         * with the id corresponding to the head entry of the descriptor chain
+         * describing the last buffer in the batch.
+         */
+        virtqueue_fill(q->tx_vq, elems[num_packets - 1], 0, 0);
+        for (j = 0; j < num_packets; j++) {
+            g_free(elems[j]);
+        }
+
+        virtqueue_flush(q->tx_vq, num_packets);
+        virtio_notify(vdev, q->tx_vq);
+    }
+
     return num_packets;
 }
 
-- 
2.17.1


