Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F46482AE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3d7J-0004Ym-Es; Fri, 09 Dec 2022 08:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3d75-0004P4-Rc
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3d6y-0004mn-KI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670591296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjPP19z/KvGMAKG0s3g3XiM7abjfQKXhB02y3pd5ND8=;
 b=Bx52wrT1K8CQ0mem3UHeKjxtlPNsBV74lQJLOZpm0WYmNkO0ZDr3mp7FYtRDQMRHNYKhaC
 yvceJ6K0dKUWkG8bzDJWyXkuU9GXwZQt4A3zk5kC4VqTOgBIhqszdrFUJaGf7ZpddHhGKH
 wQ7K+2c5ahsuOh985A1F3D7oJ6u3vLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-zU0zkbqlMxSjAr_Elb1zGQ-1; Fri, 09 Dec 2022 08:08:15 -0500
X-MC-Unique: zU0zkbqlMxSjAr_Elb1zGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDBFA185A79C
 for <qemu-devel@nongnu.org>; Fri,  9 Dec 2022 13:08:14 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-16.pek2.redhat.com [10.72.12.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D276E2166B26;
 Fri,  9 Dec 2022 13:08:12 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v12 1/1] vhost-vdpa: add support for vIOMMU
Date: Fri,  9 Dec 2022 21:08:05 +0800
Message-Id: <20221209130805.3614970-2-lulu@redhat.com>
In-Reply-To: <20221209130805.3614970-1-lulu@redhat.com>
References: <20221209130805.3614970-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

1.Skip the check in vhost_vdpa_listener_skipped_section() while
MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
2.Add support for vIOMMU.
Add the new function to deal with iommu MR.
- during iommu_region_add register a specific IOMMU notifier,
 and store all notifiers in a list.
- during iommu_region_del, compare and delete the IOMMU notifier from the list

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++---
 include/hw/virtio/vhost-vdpa.h |  10 ++
 2 files changed, 161 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..2b3920c2a1 100644
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
 
@@ -173,6 +181,115 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
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
+        ret = vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr,
+            read_only);
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
+        section->size);
+    end = int128_sub(end, int128_one());
+    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
+        MEMTXATTRS_UNSPECIFIED);
+    iommu->iommu_mr = iommu_mr;
+    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
+        IOMMU_NOTIFIER_IOTLB_EVENTS,
+        section->offset_within_region, int128_get64(end), iommu_idx);
+    iommu->iommu_offset = section->offset_within_address_space -
+        section->offset_within_region;
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
@@ -187,6 +304,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_add(listener, section);
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -266,6 +387,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_del(listener, section);
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -276,7 +400,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
     llend = vhost_vdpa_section_end(section);
 
-    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
+    trace_vhost_vdpa_listener_region_del(v, iova,
+        int128_get64(int128_sub(llend, int128_one())));
 
     if (int128_ge(int128_make64(iova), llend)) {
         return;
@@ -303,9 +428,24 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         vhost_iova_tree_remove(v->iova_tree, *result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
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
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
     if (ret) {
-        error_report("vhost_vdpa dma unmap error!");
+        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                     "0x%" HWADDR_PRIx ") = %d (%m)",
+                     v, iova, int128_get64(llsize), ret);
     }
 
     memory_region_unref(section->mr);
@@ -597,7 +737,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
-    memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
@@ -1115,7 +1254,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
+        memory_listener_register(&v->listener, dev->vdev->dma_as);
+
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 1111d85643..0d5b2c9508 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -40,8 +40,18 @@ typedef struct vhost_vdpa {
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


