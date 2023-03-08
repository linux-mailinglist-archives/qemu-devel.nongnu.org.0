Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE736B0FBD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx7m-00047g-71; Wed, 08 Mar 2023 11:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7e-00046m-FT; Wed, 08 Mar 2023 11:58:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7V-0003vA-C1; Wed, 08 Mar 2023 11:58:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 25CF7400B1;
 Wed,  8 Mar 2023 19:58:17 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C804C1FD;
 Wed,  8 Mar 2023 19:58:15 +0300 (MSK)
Received: (nullmailer pid 2098256 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Yalan Zhang <yalzhang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 02/47] vhost: fix vq dirty bitmap syncing when vIOMMU is
 enabled
Date: Wed,  8 Mar 2023 19:57:05 +0300
Message-Id: <20230308165815.2098148-2-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jason Wang <jasowang@redhat.com>

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
Message-Id: <20221216033552.77087-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 345cc1cbcbce2bab00abc2b88338d7d89c702d6b)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost.c | 84 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index d1c4c20b8c..34d356e903 100644
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
@@ -137,8 +156,51 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
             continue;
         }
 
-        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
-                              range_get_last(vq->used_phys, vq->used_size));
+        if (vhost_dev_has_iommu(dev)) {
+            IOMMUTLBEntry iotlb;
+            hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
+            hwaddr phys, s, offset;
+
+            while (used_size) {
+                rcu_read_lock();
+                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
+                                                      used_phys,
+                                                      true,
+                                                      MEMTXATTRS_UNSPECIFIED);
+                rcu_read_unlock();
+
+                if (!iotlb.target_as) {
+                    qemu_log_mask(LOG_GUEST_ERROR, "translation "
+                                  "failure for used_iova %"PRIx64"\n",
+                                  used_phys);
+                    return -EINVAL;
+                }
+
+                offset = used_phys & iotlb.addr_mask;
+                phys = iotlb.translated_addr + offset;
+
+                /*
+                 * Distance from start of used ring until last byte of
+                 * IOMMU page.
+                 */
+                s = iotlb.addr_mask - offset;
+                /*
+                 * Size of used ring, or of the part of it until end
+                 * of IOMMU page. To avoid zero result, do the adding
+                 * outside of MIN().
+                 */
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
@@ -306,24 +368,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
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
2.30.2


