Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8B68E65A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 04:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPafr-0007df-5M; Tue, 07 Feb 2023 21:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pPafp-0007dG-Ej
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pPafm-0002qQ-2S
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675825141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZfTx2d7YdNYt+dPk/Wc2Lg4biteVf4geiGkmTsi/ps=;
 b=CHRDURZzYiHssHKj+zFdoeippaClsmX+LjMXiGHw/IEgwKlRvKGaaSKgOr7q1N1K9oY3En
 dADzanXkehqSGIPM4/J+qW0Kj1tAsMO8C75vTtvLj3F2MYWSf519QZJzYLKnVO6pZ/DYNV
 oy8VTexLsgZ6Sqg9c8B86oDrj0fIyF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-s-K0l29tMh-MoX1dCbuXrQ-1; Tue, 07 Feb 2023 21:57:46 -0500
X-MC-Unique: s-K0l29tMh-MoX1dCbuXrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D81F1C05131
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 02:57:46 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-101.pek2.redhat.com [10.72.12.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2CA492B21;
 Wed,  8 Feb 2023 02:57:43 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v13 2/2] vhost-vdpa: add support for vIOMMU
Date: Wed,  8 Feb 2023 10:57:22 +0800
Message-Id: <20230208025722.2683024-3-lulu@redhat.com>
In-Reply-To: <20230208025722.2683024-1-lulu@redhat.com>
References: <20230208025722.2683024-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

1.Add support for vIOMMU.
Add the new function to deal with iommu MR.
- during iommu_region_add register a specific IOMMU notifier,
  and store all notifiers in a list.
- during iommu_region_del, compare and delete the IOMMU notifier from the list
- since the SVQ not support iommu yet, add the check for IOMMU
  in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
  function will return fail.

2.Skip the check in vhost_vdpa_listener_skipped_section() while
MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 173 ++++++++++++++++++++++++++++++---
 include/hw/virtio/vhost-vdpa.h |  11 +++
 2 files changed, 173 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 542e003101..46f676ab71 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "hw/virtio/virtio-access.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -60,15 +61,22 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
                      iova_min, section->offset_within_address_space);
         return true;
     }
+    /*
+     * While using vIOMMU, Sometimes the section will be larger than iova_max
+     * but the memory that  actually mapping is smaller, So skip the check
+     * here. Will add the check in vhost_vdpa_iommu_map_notify,
+     *There is the real size that maps to the kernel
+     */
 
-    llend = vhost_vdpa_section_end(section);
-    if (int128_gt(llend, int128_make64(iova_max))) {
-        error_report("RAM section out of device range (max=0x%" PRIx64
-                     ", end addr=0x%" PRIx64 ")",
-                     iova_max, int128_get64(llend));
-        return true;
+    if (!memory_region_is_iommu(section->mr)) {
+        llend = vhost_vdpa_section_end(section);
+        if (int128_gt(llend, int128_make64(iova_max))) {
+            error_report("RAM section out of device range (max=0x%" PRIx64
+                         ", end addr=0x%" PRIx64 ")",
+                         iova_max, int128_get64(llend));
+            return true;
+        }
     }
-
     return false;
 }
 
@@ -185,6 +193,118 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     v->iotlb_batch_begin_sent = false;
 }
 
+static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
+{
+    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
+
+    hwaddr iova = iotlb->iova + iommu->iommu_offset;
+    struct vhost_vdpa *v = iommu->dev;
+    void *vaddr;
+    int ret;
+    Int128 llend;
+
+    if (iotlb->target_as != &address_space_memory) {
+        error_report("Wrong target AS \"%s\", only system memory is allowed",
+                     iotlb->target_as->name ? iotlb->target_as->name : "none");
+        return;
+    }
+    RCU_READ_LOCK_GUARD();
+    /* check if RAM section out of device range */
+    llend = int128_add(int128_makes64(iotlb->addr_mask), int128_makes64(iova));
+    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
+        error_report("RAM section out of device range (max=0x%" PRIx64
+                     ", end addr=0x%" PRIx64 ")",
+                     v->iova_range.last, int128_get64(llend));
+        return;
+    }
+
+    vhost_vdpa_iotlb_batch_begin_once(v);
+
+    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
+        bool read_only;
+
+        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
+            return;
+        }
+
+        ret = vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                 iotlb->addr_mask + 1, vaddr, read_only);
+        if (ret) {
+            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
+        }
+    } else {
+        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                   iotlb->addr_mask + 1);
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, ret);
+        }
+    }
+}
+
+static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
+                                        MemoryRegionSection *section)
+{
+    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
+
+    struct vdpa_iommu *iommu;
+    Int128 end;
+    int iommu_idx;
+    IOMMUMemoryRegion *iommu_mr;
+    int ret;
+
+    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
+
+    iommu = g_malloc0(sizeof(*iommu));
+    end = int128_add(int128_make64(section->offset_within_region),
+                     section->size);
+    end = int128_sub(end, int128_one());
+    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
+                                                   MEMTXATTRS_UNSPECIFIED);
+    iommu->iommu_mr = iommu_mr;
+    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
+                        IOMMU_NOTIFIER_IOTLB_EVENTS,
+                        section->offset_within_region,
+                        int128_get64(end),
+                        iommu_idx);
+    iommu->iommu_offset = section->offset_within_address_space -
+                          section->offset_within_region;
+    iommu->dev = v;
+
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    if (ret) {
+        g_free(iommu);
+        return;
+    }
+
+    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
+    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
+
+    return;
+}
+
+static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
+                                        MemoryRegionSection *section)
+{
+    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
+
+    struct vdpa_iommu *iommu;
+
+    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
+    {
+        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
+            iommu->n.start == section->offset_within_region) {
+            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
+            QLIST_REMOVE(iommu, iommu_next);
+            g_free(iommu);
+            break;
+        }
+    }
+}
+
 static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                            MemoryRegionSection *section)
 {
@@ -199,6 +319,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_add(listener, section);
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -278,6 +402,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_del(listener, section);
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -288,7 +415,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
     llend = vhost_vdpa_section_end(section);
 
-    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
+    trace_vhost_vdpa_listener_region_del(v, iova,
+        int128_get64(int128_sub(llend, int128_one())));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
@@ -315,10 +443,28 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         vhost_iova_tree_remove(v->iova_tree, *result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
+    /*
+     * The unmap ioctl doesn't accept a full 64-bit. need to check it
+     */
+    if (int128_eq(llsize, int128_2_64())) {
+        llsize = int128_rshift(llsize, 1);
+        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                   int128_get64(llsize));
+
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, int128_get64(llsize), ret);
+        }
+        iova += int128_get64(llsize);
+    }
     ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
                                int128_get64(llsize));
+
     if (ret) {
-        error_report("vhost_vdpa dma unmap error!");
+        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                     "0x%" HWADDR_PRIx ") = %d (%m)",
+                     v, iova, int128_get64(llsize), ret);
     }
 
     memory_region_unref(section->mr);
@@ -578,7 +724,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
@@ -1130,7 +1275,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
+        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled)) {
+            error_report("the SVQ can not wortk in with IOMMU enable, please "
+                         "disable IOMMU and try again");
+            return -1;
+        }
+        memory_listener_register(&v->listener, dev->vdev->dma_as);
+
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 7997f09a8d..54cede86dc 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -49,6 +49,8 @@ typedef struct vhost_vdpa {
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    QLIST_HEAD(, vdpa_iommu) iommu_list;
+    IOMMUNotifier n;
 } VhostVDPA;
 
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
@@ -58,4 +60,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
                          hwaddr size);
 
+typedef struct vdpa_iommu {
+    struct vhost_vdpa *dev;
+    IOMMUMemoryRegion *iommu_mr;
+    hwaddr iommu_offset;
+    IOMMUNotifier n;
+    QLIST_ENTRY(vdpa_iommu) iommu_next;
+} VDPAIOMMUState;
+
+
 #endif
-- 
2.34.3


