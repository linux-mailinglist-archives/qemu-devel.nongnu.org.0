Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F452B4F2D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:24:35 +0100 (CET)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejB4-0002Kf-RT
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3F-0001Fz-L1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3B-0001OU-GF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrm6etX+xSQ0DjAAbhw1Ofc8o3lQfVRGCiPpu+Z3wU0=;
 b=QEDjFlrOhL5Crv9o4RNDt6IzM0YUrLHEOOUC6KUctjGz72ZShGT+eo2shuBW8Vjl09W14t
 UkZq9gBvVLBAnilsv3oIq/hWGuUk0WzhCNzEmv5X70dUYY1tLGGOHf9FWq48B1DtCMWI9o
 T+RpxbbLXsy/mY1v4E/GZsfqU2KdGP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-8kMMgYUcPLKZRjNWwh1MGQ-1; Mon, 16 Nov 2020 13:16:20 -0500
X-MC-Unique: 8kMMgYUcPLKZRjNWwh1MGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E3361017DCB;
 Mon, 16 Nov 2020 18:16:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEF215C1CF;
 Mon, 16 Nov 2020 18:16:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 12/26] vfio: Set up nested stage mappings
Date: Mon, 16 Nov 2020 19:13:35 +0100
Message-Id: <20201116181349.11908-13-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nested mode, legacy vfio_iommu_map_notify cannot be used as
there is no "caching" mode and we do not trap on map.

On Intel, vfio_iommu_map_notify was used to DMA map the RAM
through the host single stage.

With nested mode, we need to setup the stage 2 and the stage 1
separately. This patch introduces a prereg_listener to setup
the stage 2 mapping.

The stage 1 mapping, owned by the guest, is passed to the host
when the guest invalidates the stage 1 configuration, through
a dedicated PCIPASIDOps callback. Guest IOTLB invalidations
are cascaded downto the host through another IOMMU MR UNMAP
notifier.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- remove PASID based invalidation

v5 -> v6:
- add error_report_err()
- remove the abort in case of nested stage case

v4 -> v5:
- use VFIO_IOMMU_SET_PASID_TABLE
- use PCIPASIDOps for config notification

v3 -> v4:
- use iommu_inv_pasid_info for ASID invalidation

v2 -> v3:
- use VFIO_IOMMU_ATTACH_PASID_TABLE
- new user API
- handle leaf

v1 -> v2:
- adapt to uapi changes
- pass the asid
- pass IOMMU_NOTIFIER_S1_CFG when initializing the config notifier
---
 hw/vfio/common.c     | 111 +++++++++++++++++++++++++++++++++++++++++--
 hw/vfio/pci.c        |  21 ++++++++
 hw/vfio/trace-events |   2 +
 3 files changed, 129 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a9e3c77863..6b3bba7ff9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -597,6 +597,45 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
     return true;
 }
 
+/* Propagate a guest IOTLB invalidation to the host (nested mode) */
+static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    hwaddr start = iotlb->iova + giommu->iommu_offset;
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_cache_invalidate ustruct = {};
+    struct iommu_inv_addr_info *addr_info = &ustruct.info.granu.addr_info;
+    size_t size = iotlb->addr_mask + 1;
+    int ret;
+
+    assert(iotlb->perm == IOMMU_NONE);
+
+    ustruct.argsz = sizeof(ustruct);
+    ustruct.flags = 0;
+    ustruct.info.argsz = sizeof(struct iommu_cache_invalidate_info);
+    ustruct.info.version = IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
+
+    ustruct.info.cache = IOMMU_CACHE_INV_TYPE_IOTLB;
+    ustruct.info.granularity = IOMMU_INV_GRANU_ADDR;
+    addr_info->flags = IOMMU_INV_ADDR_FLAGS_ARCHID;
+    if (iotlb->leaf) {
+        addr_info->flags |= IOMMU_INV_ADDR_FLAGS_LEAF;
+    }
+    addr_info->archid = iotlb->arch_id;
+    addr_info->addr = start;
+    addr_info->granule_size = size;
+    addr_info->nb_granules = 1;
+    trace_vfio_iommu_addr_inv_iotlb(iotlb->arch_id, start, size, 1,
+                                    iotlb->leaf);
+
+    ret = ioctl(container->fd, VFIO_IOMMU_CACHE_INVALIDATE, &ustruct);
+    if (ret) {
+        error_report("%p: failed to invalidate CACHE for 0x%"PRIx64
+                     " mask=0x%"PRIx64" (%d)",
+                     container, start, iotlb->addr_mask, ret);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
@@ -778,6 +817,35 @@ static void vfio_dma_unmap_ram_section(VFIOContainer *container,
     }
 }
 
+static void vfio_prereg_listener_region_add(MemoryListener *listener,
+                                            MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+    Error *err = NULL;
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    vfio_dma_map_ram_section(container, section, &err);
+    if (err) {
+        error_report_err(err);
+    }
+}
+static void vfio_prereg_listener_region_del(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    vfio_dma_unmap_ram_section(container, section);
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -880,9 +948,10 @@ static void vfio_listener_region_add(MemoryListener *listener,
     memory_region_ref(section->mr);
 
     if (memory_region_is_iommu(section->mr)) {
+        IOMMUNotify notify;
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
-        int iommu_idx;
+        int iommu_idx, flags;
 
         trace_vfio_listener_region_add_iommu(iova, end);
         /*
@@ -901,8 +970,18 @@ static void vfio_listener_region_add(MemoryListener *listener,
         llend = int128_sub(llend, int128_one());
         iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                        MEMTXATTRS_UNSPECIFIED);
-        iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
-                            IOMMU_NOTIFIER_ALL,
+
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            /* IOTLB unmap notifier to propagate guest IOTLB invalidations */
+            flags = IOMMU_NOTIFIER_UNMAP;
+            notify = vfio_iommu_unmap_notify;
+        } else {
+            /* MAP/UNMAP IOTLB notifier */
+            flags = IOMMU_NOTIFIER_ALL;
+            notify = vfio_iommu_map_notify;
+        }
+
+        iommu_notifier_init(&giommu->n, notify, flags,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);
@@ -922,7 +1001,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
-        memory_region_iommu_replay(giommu->iommu, &giommu->n);
+        if (flags & IOMMU_NOTIFIER_MAP) {
+            memory_region_iommu_replay(giommu->iommu, &giommu->n);
+        }
 
         return;
     }
@@ -1169,10 +1250,16 @@ static const MemoryListener vfio_memory_listener = {
     .log_sync = vfio_listerner_log_sync,
 };
 
+static MemoryListener vfio_memory_prereg_listener = {
+    .region_add = vfio_prereg_listener_region_add,
+    .region_del = vfio_prereg_listener_region_del,
+};
+
 static void vfio_listener_release(VFIOContainer *container)
 {
     memory_listener_unregister(&container->listener);
-    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
+    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU ||
+        container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
         memory_listener_unregister(&container->prereg_listener);
     }
 }
@@ -1819,6 +1906,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             vfio_get_iommu_info_migration(container, info);
         }
         g_free(info);
+
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            container->prereg_listener = vfio_memory_prereg_listener;
+            memory_listener_register(&container->prereg_listener,
+                                     &address_space_memory);
+            if (container->error) {
+                memory_listener_unregister(&container->prereg_listener);
+                ret = -1;
+                error_propagate_prepend(errp, container->error,
+                                    "RAM memory listener initialization failed "
+                                    "for container");
+                goto free_container_exit;
+            }
+        }
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 58c0ce8971..720720e187 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2758,6 +2758,25 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }
 
+static int vfio_iommu_set_pasid_table(PCIBus *bus, int32_t devfn,
+                                      IOMMUConfig *config)
+{
+    PCIDevice *pdev = bus->devices[devfn];
+    VFIOPCIDevice *vdev = DO_UPCAST(VFIOPCIDevice, pdev, pdev);
+    VFIOContainer *container = vdev->vbasedev.group->container;
+    struct vfio_iommu_type1_set_pasid_table info;
+
+    info.argsz = sizeof(info);
+    info.flags = VFIO_PASID_TABLE_FLAG_SET;
+    memcpy(&info.config, &config->pasid_cfg, sizeof(config->pasid_cfg));
+
+    return ioctl(container->fd, VFIO_IOMMU_SET_PASID_TABLE, &info);
+}
+
+static PCIPASIDOps vfio_pci_pasid_ops = {
+    .set_pasid_table = vfio_iommu_set_pasid_table,
+};
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
@@ -3069,6 +3088,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
 
+    pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
+
     return;
 
 out_deregister:
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index fae7026cd7..347090cfb4 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -118,6 +118,8 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64_t nb_granules, bool leaf) "nested IOTLB invalidate asid=%d, addr=0x%"PRIx64" granule_size=0x%"PRIx64" nb_granules=0x%"PRIx64" leaf=%d"
+vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=%d"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
-- 
2.21.3


