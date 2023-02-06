Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDA68B473
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 04:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOs4K-0002w8-Ar; Sun, 05 Feb 2023 22:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4G-0002ut-Rt
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:20 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4E-000698-Ev
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:20 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VawgfOv_1675653666; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VawgfOv_1675653666) by smtp.aliyun-inc.com;
 Mon, 06 Feb 2023 11:21:07 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v2 2/2] virtio_net: just purge tx when dev/queue reset
Date: Mon,  6 Feb 2023 11:21:05 +0800
Message-Id: <20230206032105.35831-3-xuanzhuo@linux.alibaba.com>
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

When dev/queue reset, we should just purge all packet, not try to flush
the async packets. When flush these async packets, the
callback(virtio_net_tx_complete) will try to flush new packets from tx
queue.

Fixes: 7dc6be52 ("virtio-net: support queue reset")
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1451
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6daa1e5ac1..2ac6d3dad9 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -570,7 +570,7 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
         vhost_net_virtqueue_reset(vdev, nc, queue_index);
     }
 
-    flush_or_purge_queued_packets(nc);
+    qemu_purge_queued_packets(nc);
 }
 
 static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
-- 
2.32.0.3.g01195cf9f


