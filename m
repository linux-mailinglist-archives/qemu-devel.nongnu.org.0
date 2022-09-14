Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4A5B8059
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:39:02 +0200 (CEST)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKAv-0001q1-T9
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJto-0001vR-2t
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:20 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:55125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oYJtk-0003OA-R3
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:21:19 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VPlZpK2_1663129270; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VPlZpK2_1663129270) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 12:21:11 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, kangjie.xu@linux.alibaba.com
Subject: [PATCH v5 14/15] virtio-net: support queue_enable
Date: Wed, 14 Sep 2022 12:20:54 +0800
Message-Id: <20220914042055.61939-15-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 164b406b96
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Support queue_enable in vhost-kernel scenario. It can be called when
a vq reset operation has been performed and the vq is restared.

It should be noted that we can restart the vq when the vhost has
already started. When launching a new vhost device, the vhost is not
started and all vqs are not initalized until VIRTIO_PCI_COMMON_STATUS
is written. Thus, we should use vhost_started to differentiate the
two cases: vq reset and device start.

Currently it only supports vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index d774a3e652..7817206596 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -557,6 +557,26 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
     flush_or_purge_queued_packets(nc);
 }
 
+static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    int r;
+
+    if (!nc->peer || !vdev->vhost_started) {
+        return;
+    }
+
+    if (get_vhost_net(nc->peer) &&
+        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
+        r = vhost_net_virtqueue_restart(vdev, nc, queue_index);
+        if (r < 0) {
+            error_report("unable to restart vhost net virtqueue: %d, "
+                            "when resetting the queue", queue_index);
+        }
+    }
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -3802,6 +3822,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->bad_features = virtio_net_bad_features;
     vdc->reset = virtio_net_reset;
     vdc->queue_reset = virtio_net_queue_reset;
+    vdc->queue_enable = virtio_net_queue_enable;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
-- 
2.32.0.3.g01195cf9f


