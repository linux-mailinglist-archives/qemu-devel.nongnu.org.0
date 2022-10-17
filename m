Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44872600B1E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:41:41 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMct-00050s-Tc
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMO4-0005ZN-3I
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:20 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMNv-0002oo-Cz
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:13 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VSMILV6_1665998761; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VSMILV6_1665998761) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 17:26:01 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v6 02/15] virtio: introduce virtio_queue_reset()
Date: Mon, 17 Oct 2022 17:25:45 +0800
Message-Id: <20221017092558.111082-3-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
References: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3b20cde7ef
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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

Introduce a new interface function virtio_queue_reset() to implement
reset for vq.

Add a new callback to VirtioDeviceClass for queue reset operation for
each child device.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio.c         | 11 +++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6f42fcadd7..cf5f9ca387 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2484,6 +2484,17 @@ static void __virtio_queue_reset(VirtIODevice *vdev, uint32_t i)
     virtio_virtqueue_reset_region_cache(&vdev->vq[i]);
 }
 
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
+{
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    if (k->queue_reset) {
+        k->queue_reset(vdev, queue_index);
+    }
+
+    __virtio_queue_reset(vdev, queue_index);
+}
+
 void virtio_reset(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f41b4a7e64..74d76c1dbc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -148,6 +148,7 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
      * the modern one.
@@ -286,6 +287,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
                                       MemoryRegion *mr, bool assign);
 int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
+void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
 
-- 
2.32.0.3.g01195cf9f


