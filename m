Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84555B504C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 19:33:11 +0200 (CEST)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXQpS-0003MV-LC
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 13:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXQfH-00038d-EO
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 13:22:39 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:51356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXQfD-0003LW-Op
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 13:22:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VPKg0wv_1662916945; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VPKg0wv_1662916945) by smtp.aliyun-inc.com;
 Mon, 12 Sep 2022 01:22:26 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v4 13/15] virtio-net: support queue reset
Date: Mon, 12 Sep 2022 01:22:09 +0800
Message-Id: <46d6618a04fb41f1ac1fcec36ee73a52c5d9d4c6.1662916759.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

virtio-net and vhost-kernel implement queue reset.
Queued packets in the corresponding queue pair are flushed
or purged.

For virtio-net, userspace datapath will be disabled later in
__virtio_queue_reset(). It will set addr of vring to 0 and idx to 0.
Thus, virtio_net_receive() and virtio_net_flush_tx() will not receive
or send packets.

For vhost-net, the datapath will be disabled in vhost_net_virtqueue_reset().

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
---
 hw/net/virtio-net.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 27b59c0ad6..d774a3e652 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -540,6 +540,23 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
     return info;
 }
 
+static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+
+    if (!nc->peer) {
+        return;
+    }
+
+    if (get_vhost_net(nc->peer) &&
+        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
+        vhost_net_virtqueue_reset(vdev, nc, queue_index);
+    }
+
+    flush_or_purge_queued_packets(nc);
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->set_features = virtio_net_set_features;
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
+    vdc->queue_reset = virtio_net_queue_reset;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
2.32.0


