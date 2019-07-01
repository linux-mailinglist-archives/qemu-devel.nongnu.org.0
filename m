Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1492B3EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 14:02:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVEKh-0001Hl-KF
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 08:02:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3c-0004dB-Qi
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3b-0004pB-7D
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE3X-0004mD-Q1; Mon, 27 May 2019 07:44:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14624792B3;
	Mon, 27 May 2019 11:44:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF8835D962;
	Mon, 27 May 2019 11:44:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:56 +0200
Message-Id: <20190527114203.2762-21-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 27 May 2019 11:44:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 20/27] hw/vfio/common: Setup nested stage
 mappings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nested mode, legacy vfio_iommu_map_notify cannot be used as
there is no "caching" mode and we do not trap on map.

On Intel, vfio_iommu_map_notify was used to DMA map the RAM
through the host single stage.

With nested mode, we need to setup the stage 2 and the stage 1
separately. This patch introduces a prereg_lsitener to setup
the stage 2 mapping.

The stage 1 mapping, owned by the guest, is passed to the host
when the guest invalidates the stage 1 configuration, through
a dedicated config IOMMU notifier. Guest IOTLB invalidations
are cascaded downto the host through another IOMMU MR UNMAP
notifier.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

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
 hw/vfio/common.c     | 151 +++++++++++++++++++++++++++++++++++++++----
 hw/vfio/trace-events |   2 +
 2 files changed, 142 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 26bc2ab19f..084e3f30e6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -445,6 +445,71 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, voi=
d **vaddr,
     return true;
 }
=20
+/* Pass the guest stage 1 config to the host */
+static void vfio_iommu_nested_notify(IOMMUNotifier *n, IOMMUConfig *cfg)
+{
+    VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container =3D giommu->container;
+    struct vfio_iommu_type1_attach_pasid_table info;
+    int ret;
+
+    info.argsz =3D sizeof(info);
+    info.flags =3D 0;
+    memcpy(&info.config, &cfg->pasid_cfg, sizeof(cfg->pasid_cfg));
+
+    ret =3D ioctl(container->fd, VFIO_IOMMU_ATTACH_PASID_TABLE, &info);
+    if (ret) {
+        error_report("%p: failed to pass S1 config to the host (%d)",
+                     container, ret);
+    }
+}
+
+/* Propagate a guest IOTLB invalidation to the host (nested mode) */
+static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iot=
lb)
+{
+    VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
+    hwaddr start =3D iotlb->iova + giommu->iommu_offset;
+
+    VFIOContainer *container =3D giommu->container;
+    struct vfio_iommu_type1_cache_invalidate ustruct;
+    size_t size =3D iotlb->addr_mask + 1;
+    int ret;
+
+    assert(iotlb->perm =3D=3D IOMMU_NONE);
+
+    ustruct.argsz =3D sizeof(ustruct);
+    ustruct.flags =3D 0;
+    ustruct.info.version =3D IOMMU_CACHE_INVALIDATE_INFO_VERSION_1;
+
+    if (size <=3D 0x10000) {
+        ustruct.info.cache =3D IOMMU_CACHE_INV_TYPE_IOTLB;
+        ustruct.info.granularity =3D IOMMU_INV_GRANU_ADDR;
+        ustruct.info.addr_info.flags =3D IOMMU_INV_ADDR_FLAGS_ARCHID;
+        if (iotlb->leaf) {
+            ustruct.info.addr_info.flags |=3D IOMMU_INV_ADDR_FLAGS_LEAF;
+        }
+        ustruct.info.addr_info.archid =3D iotlb->arch_id;
+        ustruct.info.addr_info.addr =3D start;
+        ustruct.info.addr_info.granule_size =3D size;
+        ustruct.info.addr_info.nb_granules =3D 1;
+        trace_vfio_iommu_addr_inv_iotlb(iotlb->arch_id, start, size, 1,
+                                        iotlb->leaf);
+    } else {
+        ustruct.info.cache =3D IOMMU_CACHE_INV_TYPE_IOTLB;
+        ustruct.info.granularity =3D IOMMU_INV_GRANU_PASID;
+        ustruct.info.pasid_info.archid =3D iotlb->arch_id;
+        ustruct.info.pasid_info.flags =3D IOMMU_INV_PASID_FLAGS_ARCHID;
+        trace_vfio_iommu_asid_inv_iotlb(iotlb->arch_id);
+    }
+
+    ret =3D ioctl(container->fd, VFIO_IOMMU_CACHE_INVALIDATE, &ustruct);
+    if (ret) {
+        error_report("%p: failed to invalidate CACHE for 0x%"PRIx64
+                     " mask=3D0x%"PRIx64" (%d)",
+                     container, start, iotlb->addr_mask, ret);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb=
)
 {
     VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
@@ -628,6 +693,32 @@ static void vfio_dma_unmap_ram_section(VFIOContainer=
 *container,
     }
 }
=20
+static void vfio_prereg_listener_region_add(MemoryListener *listener,
+                                            MemoryRegionSection *section=
)
+{
+    VFIOContainer *container =3D
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    vfio_dma_map_ram_section(container, section);
+
+}
+static void vfio_prereg_listener_region_del(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container =3D
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
@@ -739,21 +830,40 @@ static void vfio_listener_region_add(MemoryListener=
 *listener,
=20
         offset =3D section->offset_within_address_space -
                     section->offset_within_region;
-        giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offset);
-
         llend =3D int128_add(int128_make64(section->offset_within_region=
),
                            section->size);
         llend =3D int128_sub(llend, int128_one());
         iommu_idx =3D memory_region_iommu_attrs_to_index(iommu_mr,
                                                        MEMTXATTRS_UNSPEC=
IFIED);
-        iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_map_notify,
-                                  IOMMU_NOTIFIER_IOTLB_ALL,
-                                  section->offset_within_region,
-                                  int128_get64(llend),
-                                  iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
-        memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        if (container->iommu_type =3D=3D VFIO_TYPE1_NESTING_IOMMU) {
+            /* Config notifier to propagate guest stage 1 config changes=
 */
+            giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offse=
t);
+            iommu_config_notifier_init(&giommu->n, vfio_iommu_nested_not=
ify,
+                                       IOMMU_NOTIFIER_CONFIG_PASID, iomm=
u_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_ne=
xt);
+            memory_region_register_iommu_notifier(section->mr, &giommu->=
n);
+
+            /* IOTLB unmap notifier to propagate guest IOTLB invalidatio=
ns */
+            giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offse=
t);
+            iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_unmap_notif=
y,
+                                      IOMMU_NOTIFIER_IOTLB_UNMAP,
+                                      section->offset_within_region,
+                                      int128_get64(llend),
+                                      iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_ne=
xt);
+            memory_region_register_iommu_notifier(section->mr, &giommu->=
n);
+        } else {
+            /* MAP/UNMAP IOTLB notifier */
+            giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offse=
t);
+            iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_map_notify,
+                                      IOMMU_NOTIFIER_IOTLB_ALL,
+                                      section->offset_within_region,
+                                      int128_get64(llend),
+                                      iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_ne=
xt);
+            memory_region_register_iommu_notifier(section->mr, &giommu->=
n);
+        }
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
         return;
@@ -850,15 +960,21 @@ static void vfio_listener_region_del(MemoryListener=
 *listener,
     }
 }
=20
-static const MemoryListener vfio_memory_listener =3D {
+static MemoryListener vfio_memory_listener =3D {
     .region_add =3D vfio_listener_region_add,
     .region_del =3D vfio_listener_region_del,
 };
=20
+static MemoryListener vfio_memory_prereg_listener =3D {
+    .region_add =3D vfio_prereg_listener_region_add,
+    .region_del =3D vfio_prereg_listener_region_del,
+};
+
 static void vfio_listener_release(VFIOContainer *container)
 {
     memory_listener_unregister(&container->listener);
-    if (container->iommu_type =3D=3D VFIO_SPAPR_TCE_v2_IOMMU) {
+    if (container->iommu_type =3D=3D VFIO_SPAPR_TCE_v2_IOMMU ||
+        container->iommu_type =3D=3D VFIO_TYPE1_NESTING_IOMMU) {
         memory_listener_unregister(&container->prereg_listener);
     }
 }
@@ -1354,6 +1470,19 @@ static int vfio_connect_container(VFIOGroup *group=
, AddressSpace *as,
         }
         vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
         container->pgsizes =3D info.iova_pgsizes;
+
+        if (container->iommu_type =3D=3D VFIO_TYPE1_NESTING_IOMMU) {
+            container->prereg_listener =3D vfio_memory_prereg_listener;
+            memory_listener_register(&container->prereg_listener,
+                                     &address_space_memory);
+            if (container->error) {
+                memory_listener_unregister(&container->prereg_listener);
+                ret =3D container->error;
+                error_setg(errp, "RAM memory listener initialization fai=
led "
+                          " for container");
+                goto free_container_exit;
+            }
+        }
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 410801de6e..9f1868af2d 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -115,6 +115,8 @@ vfio_region_sparse_mmap_header(const char *name, int =
index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long =
end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t=
 subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64=
_t nb_granules, bool leaf) "nested IOTLB invalidate asid=3D%d, addr=3D0x%=
"PRIx64" granule_size=3D0x%"PRIx64" nb_granules=3D0x%"PRIx64" leaf=3D%d"
+vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=3D%d"
=20
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to g=
roup #%d"
--=20
2.20.1


