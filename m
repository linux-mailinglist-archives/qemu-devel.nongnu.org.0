Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7FF6333A8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 04:02:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxJXJ-0004TQ-U7; Mon, 21 Nov 2022 22:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxJXI-0004Sw-Af
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 22:01:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxJXG-0003Dd-Qc
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 22:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669086081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D4ilwaPzH+gwrvGhVguLNdMR/FXM8V17lUtN9+aGSio=;
 b=GaSOx/5VR+dp+o15jdo1JhgzRX6jPMlv15Tx90GnARUwXizAzb1r3irJJ/BrBvQdXEH/ag
 /IbLw2SxLuazh11jzMCzCflYVk3j9UomNBSO7XcLvi+2Y5/oSMGhe60SBWAkdFfDTEpUYI
 Wo9Vgo2U8wDDW36Xka0TwlCRtrHsh2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-9Hcfjy_oPY2xFkDGimqomQ-1; Mon, 21 Nov 2022 22:01:18 -0500
X-MC-Unique: 9Hcfjy_oPY2xFkDGimqomQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E111E85A5B6;
 Tue, 22 Nov 2022 03:01:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-197.pek2.redhat.com
 [10.72.13.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E09140C835A;
 Tue, 22 Nov 2022 03:01:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Yalan Zhang <yalzhang@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH for 7.2?] vhost: fix vq dirt bitmap syncing when vIOMMU is
 enabled
Date: Tue, 22 Nov 2022 11:01:11 +0800
Message-Id: <20221122030111.4230-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
GPA. So we need to translate it to GPA before the syncing otherwise we
may hit the following crash since IOVA could be out of the scope of
the GPA log size. This could be noted when using virtio-IOMMU with
vhost using 1G memory.

Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
Cc: qemu-stable@nongnu.org
Reported-by: Yalan Zhang <yalzhang@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost.c | 65 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index d1c4c20b8c..26b319f34e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -106,11 +106,30 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
     }
 }
 
+static bool vhost_dev_has_iommu(struct vhost_dev *dev)
+{
+    VirtIODevice *vdev = dev->vdev;
+
+    /*
+     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
+     * incremental memory mapping API via IOTLB API. For platform that
+     * does not have IOMMU, there's no need to enable this feature
+     * which may cause unnecessary IOTLB miss/update transactions.
+     */
+    if (vdev) {
+        return virtio_bus_device_iommu_enabled(vdev) &&
+            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    } else {
+        return false;
+    }
+}
+
 static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
                                    MemoryRegionSection *section,
                                    hwaddr first,
                                    hwaddr last)
 {
+    IOMMUTLBEntry iotlb;
     int i;
     hwaddr start_addr;
     hwaddr end_addr;
@@ -132,13 +151,37 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
     }
     for (i = 0; i < dev->nvqs; ++i) {
         struct vhost_virtqueue *vq = dev->vqs + i;
+        hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
+        hwaddr phys, s;
 
         if (!vq->used_phys && !vq->used_size) {
             continue;
         }
 
-        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
-                              range_get_last(vq->used_phys, vq->used_size));
+        if (vhost_dev_has_iommu(dev)) {
+            while (used_size) {
+                rcu_read_lock();
+                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
+                                                      used_phys,
+                                                      true, MEMTXATTRS_UNSPECIFIED);
+                rcu_read_unlock();
+
+                if (iotlb.target_as == NULL) {
+                    return -EINVAL;
+                }
+
+                phys = iotlb.translated_addr;
+                s = MIN(iotlb.addr_mask + 1, used_size);
+
+                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
+                                      range_get_last(phys, used_size));
+                used_size -= s;
+                used_phys += s;
+            }
+        } else {
+            vhost_dev_sync_region(dev, section, start_addr, end_addr, used_phys,
+                                  range_get_last(used_phys, used_size));
+        }
     }
     return 0;
 }
@@ -306,24 +349,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
     dev->log_size = size;
 }
 
-static bool vhost_dev_has_iommu(struct vhost_dev *dev)
-{
-    VirtIODevice *vdev = dev->vdev;
-
-    /*
-     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
-     * incremental memory mapping API via IOTLB API. For platform that
-     * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update transactions.
-     */
-    if (vdev) {
-        return virtio_bus_device_iommu_enabled(vdev) &&
-            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-    } else {
-        return false;
-    }
-}
-
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
                               hwaddr *plen, bool is_write)
 {
-- 
2.25.1


