Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F290163CEC0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 06:34:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0FiY-00017P-Fc; Wed, 30 Nov 2022 00:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0FiW-00016h-Gl
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0FiT-0005eJ-BL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669786384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAQ7B8dUHTrbbrBY0ae/RPWTQGXnbCdiqxv221exja8=;
 b=a064VHIdf40/WZrCPZI0jA4NrjHf8RF8k7xUdBn7BK2RfGoTL4GrJt7UgEg/YwbwuQfdpK
 h1FcS0wETRGjH7n7DGoG9IrxVAOEPZpnWMR+iu26lwsqoRldpWbRejQAKAhTEm3Sb4pGFc
 +vFrlwFm0mckZETrhEcBBXHnYWPz3yk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-TwykwO_xNdeg-EW0d8vBBg-1; Wed, 30 Nov 2022 00:33:02 -0500
X-MC-Unique: TwykwO_xNdeg-EW0d8vBBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23018811E67
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:33:02 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-154.pek2.redhat.com [10.72.12.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D248C4A9254;
 Wed, 30 Nov 2022 05:32:59 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v11 2/2] vhost-vdpa: add support for vIOMMU
Date: Wed, 30 Nov 2022 13:32:51 +0800
Message-Id: <20221130053251.2606831-3-lulu@redhat.com>
In-Reply-To: <20221130053251.2606831-1-lulu@redhat.com>
References: <20221130053251.2606831-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

Add support for vIOMMU. add the new function to deal with iommu MR.
- during iommu_region_add register a specific IOMMU notifier,
 and store all notifiers in a list.
- during iommu_region_del, compare and delete the IOMMU notifier from the list

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 147 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vdpa.h |  10 +++
 2 files changed, 153 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index f0e9963d19..4137094fef 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "hw/virtio/virtio-access.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -180,6 +181,119 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
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
+    llend =
+        int128_add(int128_makes64(iotlb->addr_mask + 1), int128_makes64(iova));
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
+
+        ret =
+            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
+        if (ret) {
+            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
+        }
+    } else {
+        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
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
+            section->size);
+    end = int128_sub(end, int128_one());
+    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
+            MEMTXATTRS_UNSPECIFIED);
+
+    iommu->iommu_mr = iommu_mr;
+
+    iommu_notifier_init(
+        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
+        section->offset_within_region, int128_get64(end), iommu_idx);
+    iommu->iommu_offset =
+        section->offset_within_address_space - section->offset_within_region;
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
@@ -193,6 +307,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_add(listener, section);
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -267,6 +385,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_del(listener, section);
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -277,7 +398,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
     llend = vhost_vdpa_section_end(section);
 
-    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
+    trace_vhost_vdpa_listener_region_del(
+        v, iova, int128_get64(int128_sub(llend, int128_one())));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
@@ -300,9 +422,26 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         vhost_iova_tree_remove(v->iova_tree, result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
+
+    /*
+     * The unmap ioctl doesn't accept a full 64-bit. need to check it
+     */
+    if (int128_eq(llsize, int128_2_64())) {
+        llsize = int128_rshift(llsize, 1);
+        ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, int128_get64(llsize), ret);
+        }
+        iova += int128_get64(llsize);
+    }
+
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
-        error_report("vhost_vdpa dma unmap error!");
+        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                     "0x%" HWADDR_PRIx ") = %d (%m)",
+                     v, iova, int128_get64(llsize), ret);
     }
 
     memory_region_unref(section->mr);
@@ -594,7 +733,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
@@ -1134,7 +1272,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
+        memory_listener_register(&v->listener, dev->vdev->dma_as);
+
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index d10a89303e..564acda810 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    QLIST_HEAD(, vdpa_iommu) iommu_list;
+    IOMMUNotifier n;
 } VhostVDPA;
 
+typedef struct vdpa_iommu {
+    struct vhost_vdpa *dev;
+    IOMMUMemoryRegion *iommu_mr;
+    hwaddr iommu_offset;
+    IOMMUNotifier n;
+    QLIST_ENTRY(vdpa_iommu) iommu_next;
+} VDPAIOMMUState;
+
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
                        void *vaddr, bool readonly);
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
-- 
2.34.3


