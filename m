Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2663B8F8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 05:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozrpV-0002m9-Ai; Mon, 28 Nov 2022 23:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozrpT-0002kH-Jl
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 23:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozrpS-00019C-01
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 23:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669694561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q00ZRCccIVEEZPjtW5YbQtoYIvdhlNWKQe2rgb72lU8=;
 b=Lx0LixzZhw1Ps2O+/gEgN8buG/3y7aLYMTeNJA3O3BEaRdn6jxINN+Q5OhoNCKHebvmkLt
 GvDgg949QErxgaVK+30UeXw/jzwHgqTfHJglqsPqh8H9nfKCBBMy90TuYLSt/V23zVAE2I
 XXx/oUetJCU6ah/bUuT2fxynZ44DVvE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-c8QoGRSRMWChyNfBqT7z-w-1; Mon, 28 Nov 2022 23:02:37 -0500
X-MC-Unique: c8QoGRSRMWChyNfBqT7z-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FBDD1C06909;
 Tue, 29 Nov 2022 04:02:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-207.pek2.redhat.com
 [10.72.12.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 937BA17595;
 Tue, 29 Nov 2022 04:02:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 Lei Yang <leiyang@redhat.com>, Yalan Zhang <yalzhang@redhat.com>
Subject: [PATCH for 7.2? V2] vhost: fix vq dirty bitmap syncing when vIOMMU is
 enabled
Date: Tue, 29 Nov 2022 12:02:32 +0800
Message-Id: <20221129040232.10116-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Tested-by: Lei Yang <leiyang@redhat.com>
Reported-by: Yalan Zhang <yalzhang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V1:
- Fix the address calculation when used ring is not page aligned
- Fix the length for each round of dirty bitmap syncing
- Use LOG_GUEST_ERROR to log wrong used adddress
- Various other tweaks
---
 hw/virtio/vhost.c | 76 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index d1c4c20b8c..0cd5f25fcb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -20,6 +20,7 @@
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "qemu/memfd.h"
+#include "qemu/log.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -106,6 +107,24 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
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
@@ -137,8 +156,43 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
             continue;
         }
 
-        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
-                              range_get_last(vq->used_phys, vq->used_size));
+        if (vhost_dev_has_iommu(dev)) {
+            IOMMUTLBEntry iotlb;
+            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
+            hwaddr phys, s;
+
+            while (used_size) {
+                rcu_read_lock();
+                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
+                                                      used_phys,
+                                                      true, MEMTXATTRS_UNSPECIFIED);
+                rcu_read_unlock();
+
+                if (!iotlb.target_as) {
+                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
+                                  "failure for used_phys %"PRIx64"\n", used_phys);
+                    return -EINVAL;
+                }
+
+                phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
+
+                /* Distance from start of used ring until last byte of
+                   IOMMU page */
+                s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
+                /* Size of used ring, or of the part of it until end
+                   of IOMMU page */
+                s = MIN(s, used_size - 1) + 1;
+
+                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
+                                      range_get_last(phys, s));
+                used_size -= s;
+                used_phys += s;
+            }
+        } else {
+            vhost_dev_sync_region(dev, section, start_addr,
+                                  end_addr, vq->used_phys,
+                                  range_get_last(vq->used_phys, vq->used_size));
+        }
     }
     return 0;
 }
@@ -306,24 +360,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
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


