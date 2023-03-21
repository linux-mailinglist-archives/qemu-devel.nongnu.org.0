Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C776C3423
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecuM-00028s-3M; Tue, 21 Mar 2023 10:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pecuJ-00028K-5I
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pecuF-0000Gy-Sl
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679408647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Z36zrY8yINw2NTYx96JuuE6nE70sBkfz3Vcrk17eHs=;
 b=ZfmNJh1b0VrXGCoXgCexcZ17D+dSAjdmIPp8/tlUU1+wPJt5NjlBj7jBMOcN0b6tOkIMJY
 eRK+BuMPMD5opqBVKBYI4OqprvKNALsUpHPrBX6C6T6BxU1zh6eBHrozSrMAVXc71fz19L
 smS6KgEiZO/o0oV9FpX5ztYYGDgwBak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-v4B3JtLsNu2GpZOM9QcH3Q-1; Tue, 21 Mar 2023 10:24:05 -0400
X-MC-Unique: v4B3JtLsNu2GpZOM9QcH3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 933E82806044
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:24:05 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57426C15BA0;
 Tue, 21 Mar 2023 14:24:03 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v15 4/4] vhost-vdpa: Add support for vIOMMU.
Date: Tue, 21 Mar 2023 22:23:27 +0800
Message-Id: <20230321142327.749980-5-lulu@redhat.com>
In-Reply-To: <20230321142327.749980-1-lulu@redhat.com>
References: <20230321142327.749980-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

1. The vIOMMU support will make vDPA can work in IOMMU mode. This
will fix security issues while using the no-IOMMU mode.
To support this feature we need to add new functions for IOMMU MR adds and
deletes.

Also since the SVQ does not support vIOMMU yet, add the check for IOMMU
in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
the function will return fail.

2. Skip the iova_max check vhost_vdpa_listener_skipped_section(). While
MR is IOMMU, move this check to vhost_vdpa_iommu_map_notify()

Verified in vp_vdpa and vdpa_sim_net driver

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/trace-events         |   2 +-
 hw/virtio/vhost-vdpa.c         | 159 ++++++++++++++++++++++++++++++---
 include/hw/virtio/vhost-vdpa.h |  11 +++
 3 files changed, 161 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8f8d05cf9b..de4da2c65c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -33,7 +33,7 @@ vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
 vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint32_t asid, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" asid: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
 vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
-vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
+vhost_vdpa_iotlb_batch_end_once(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
 vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
 vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
 vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0c8c37e786..39720d12a6 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "hw/virtio/virtio-access.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -60,13 +61,21 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
                      iova_min, section->offset_within_address_space);
         return true;
     }
+    /*
+     * While using vIOMMU, sometimes the section will be larger than iova_max,
+     * but the memory that actually maps is smaller, so move the check to
+     * function vhost_vdpa_iommu_map_notify(). That function will use the actual
+     * size that maps to the kernel
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
 
     return false;
@@ -158,9 +167,8 @@ static void vhost_vdpa_iotlb_batch_begin_once(struct vhost_vdpa *v)
     v->iotlb_batch_begin_sent = true;
 }
 
-static void vhost_vdpa_listener_commit(MemoryListener *listener)
+static void vhost_vdpa_iotlb_batch_end_once(struct vhost_vdpa *v)
 {
-    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
     struct vhost_dev *dev = v->dev;
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
@@ -176,7 +184,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     msg.type = v->msg_type;
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
 
-    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
+    trace_vhost_vdpa_iotlb_batch_end_once(v, fd, msg.type, msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -185,6 +193,124 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     v->iotlb_batch_begin_sent = false;
 }
 
+static void vhost_vdpa_listener_commit(MemoryListener *listener)
+{
+    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
+    vhost_vdpa_iotlb_batch_end_once(v);
+}
+
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
+    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
+        bool read_only;
+
+        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
+            return;
+        }
+        vhost_vdpa_iotlb_batch_begin_once(v);
+        ret = vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                 iotlb->addr_mask + 1, vaddr, read_only);
+        if (ret) {
+            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
+        }
+    } else {
+        vhost_vdpa_iotlb_batch_begin_once(v);
+        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                   iotlb->addr_mask + 1);
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, iotlb->addr_mask + 1, ret);
+        }
+    }
+    vhost_vdpa_iotlb_batch_end_once(v);
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
@@ -199,6 +325,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_add(listener, section);
+        return;
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -278,6 +408,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
                                             v->iova_range.last)) {
         return;
     }
+    if (memory_region_is_iommu(section->mr)) {
+        vhost_vdpa_iommu_region_del(listener, section);
+    }
 
     if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
                  (section->offset_within_region & ~TARGET_PAGE_MASK))) {
@@ -1182,7 +1315,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        memory_listener_register(&v->listener, &address_space_memory);
+        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled)) {
+            error_report("SVQ can not work while IOMMU enable, please disable"
+                         "IOMMU and try again");
+            return -1;
+        }
+        memory_listener_register(&v->listener, dev->vdev->dma_as);
+
         return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     }
 
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c278a2a8de..e64bfc7f98 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -52,6 +52,8 @@ typedef struct vhost_vdpa {
     struct vhost_dev *dev;
     Error *migration_blocker;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    QLIST_HEAD(, vdpa_iommu) iommu_list;
+    IOMMUNotifier n;
 } VhostVDPA;
 
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
@@ -61,4 +63,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
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


