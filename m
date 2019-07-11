Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5865EF4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:46:21 +0200 (CEST)
Received: from localhost ([::1]:44373 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hld9A-0008Jn-Rs
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4h-0006f9-8h
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4e-0005JF-Cl
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4a-0005BN-GJ; Thu, 11 Jul 2019 13:41:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9DD324ACDF;
 Thu, 11 Jul 2019 17:41:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6A3E60600;
 Thu, 11 Jul 2019 17:41:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:20 +0200
Message-Id: <20190711173933.31203-17-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 11 Jul 2019 17:41:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 16/29] vfio: Introduce helpers to DMA
 map/unmap a RAM section
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's introduce two helpers that allow to DMA map/unmap a RAM
section. Those helpers will be called for nested stage setup in
another call site. Also the vfio_listener_region_add/del()
structure may be clearer.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 177 ++++++++++++++++++++++++++-----------------
 hw/vfio/trace-events |   4 +-
 2 files changed, 108 insertions(+), 73 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 81d29ce908..ef8452a4bc 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -510,13 +510,115 @@ hostwin_from_range(VFIOContainer *container, hwadd=
r iova, hwaddr end)
     return NULL;
 }
=20
+static int vfio_dma_map_ram_section(VFIOContainer *container,
+                                    MemoryRegionSection *section)
+{
+    VFIOHostDMAWindow *hostwin;
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    void *vaddr;
+    int ret;
+
+    assert(memory_region_is_ram(section->mr));
+
+    iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    llend =3D int128_make64(section->offset_within_address_space);
+    llend =3D int128_add(llend, section->size);
+    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    end =3D int128_get64(int128_sub(llend, int128_one()));
+
+    vaddr =3D memory_region_get_ram_ptr(section->mr) +
+            section->offset_within_region +
+            (iova - section->offset_within_address_space);
+
+    hostwin =3D hostwin_from_range(container, iova, end);
+    if (!hostwin) {
+        error_report("vfio: IOMMU container %p can't map guest IOVA regi=
on"
+                     " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
+                     container, iova, end);
+        return -EFAULT;
+    }
+
+    trace_vfio_dma_map_ram(iova, end, vaddr);
+
+    llsize =3D int128_sub(llend, int128_make64(iova));
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+
+        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
+            trace_vfio_listener_region_add_no_dma_map(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                int128_getlo(section->size),
+                pgmask + 1);
+            return 0;
+        }
+    }
+
+    ret =3D vfio_dma_map(container, iova, int128_get64(llsize),
+                       vaddr, section->readonly);
+    if (ret) {
+        error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
+                     "0x%"HWADDR_PRIx", %p) =3D %d (%m)",
+                     container, iova, int128_get64(llsize), vaddr, ret);
+        if (memory_region_is_ram_device(section->mr)) {
+            /* Allow unexpected mappings not to be fatal for RAM devices=
 */
+            return 0;
+        }
+        return ret;
+    }
+    return 0;
+}
+
+static void vfio_dma_unmap_ram_section(VFIOContainer *container,
+                                       MemoryRegionSection *section)
+{
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    bool try_unmap =3D true;
+    int ret;
+
+    iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    llend =3D int128_make64(section->offset_within_address_space);
+    llend =3D int128_add(llend, section->size);
+    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return;
+    }
+    end =3D int128_get64(int128_sub(llend, int128_one()));
+
+    llsize =3D int128_sub(llend, int128_make64(iova));
+
+    trace_vfio_dma_unmap_ram(iova, end);
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask;
+        VFIOHostDMAWindow *hostwin =3D hostwin_from_range(container, iov=
a, end);
+
+        assert(hostwin); /* or region_add() would have failed */
+
+        pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+        try_unmap =3D !((iova & pgmask) || (int128_get64(llsize) & pgmas=
k));
+    }
+
+    if (try_unmap) {
+        ret =3D vfio_dma_unmap(container, iova, int128_get64(llsize));
+        if (ret) {
+            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx") =3D %d (%m)",
+                         container, iova, int128_get64(llsize), ret);
+        }
+    }
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container =3D container_of(listener, VFIOContainer, l=
istener);
     hwaddr iova, end;
-    Int128 llend, llsize;
-    void *vaddr;
+    Int128 llend;
     int ret;
     VFIOHostDMAWindow *hostwin;
=20
@@ -650,41 +752,9 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
     }
=20
     /* Here we assume that memory_region_is_ram(section->mr)=3D=3Dtrue *=
/
-
-    vaddr =3D memory_region_get_ram_ptr(section->mr) +
-            section->offset_within_region +
-            (iova - section->offset_within_address_space);
-
-    trace_vfio_listener_region_add_ram(iova, end, vaddr);
-
-    llsize =3D int128_sub(llend, int128_make64(iova));
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-
-        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
-            trace_vfio_listener_region_add_no_dma_map(
-                memory_region_name(section->mr),
-                section->offset_within_address_space,
-                int128_getlo(section->size),
-                pgmask + 1);
-            return;
-        }
-    }
-
-    ret =3D vfio_dma_map(container, iova, int128_get64(llsize),
-                       vaddr, section->readonly);
-    if (ret) {
-        error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                     "0x%"HWADDR_PRIx", %p) =3D %d (%m)",
-                     container, iova, int128_get64(llsize), vaddr, ret);
-        if (memory_region_is_ram_device(section->mr)) {
-            /* Allow unexpected mappings not to be fatal for RAM devices=
 */
-            return;
-        }
+    if (vfio_dma_map_ram_section(container, section)) {
         goto fail;
     }
-
     return;
=20
 fail:
@@ -710,10 +780,6 @@ static void vfio_listener_region_del(MemoryListener =
*listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container =3D container_of(listener, VFIOContainer, l=
istener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    int ret;
-    bool try_unmap =3D true;
=20
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_del_skip(
@@ -752,38 +818,7 @@ static void vfio_listener_region_del(MemoryListener =
*listener,
          */
     }
=20
-    iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend =3D int128_make64(section->offset_within_address_space);
-    llend =3D int128_add(llend, section->size);
-    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
-
-    if (int128_ge(int128_make64(iova), llend)) {
-        return;
-    }
-    end =3D int128_get64(int128_sub(llend, int128_one()));
-
-    llsize =3D int128_sub(llend, int128_make64(iova));
-
-    trace_vfio_listener_region_del(iova, end);
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin =3D hostwin_from_range(container, iov=
a, end);
-
-        assert(hostwin); /* or region_add() would have failed */
-
-        pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-        try_unmap =3D !((iova & pgmask) || (int128_get64(llsize) & pgmas=
k));
-    }
-
-    if (try_unmap) {
-        ret =3D vfio_dma_unmap(container, iova, int128_get64(llsize));
-        if (ret) {
-            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") =3D %d (%m)",
-                         container, iova, int128_get64(llsize), ret);
-        }
-    }
+    vfio_dma_unmap_ram_section(container, section);
=20
     memory_region_unref(section->mr);
=20
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b1ef55a33f..410801de6e 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -97,10 +97,10 @@ vfio_iommu_map_notify(const char *op, uint64_t iova_s=
tart, uint64_t iova_end) "i
 vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING re=
gion_add 0x%"PRIx64" - 0x%"PRIx64
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add=
 [iommu] 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, voi=
d *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_dma_map_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "r=
egion_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uin=
t64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=3D0x%"PRI=
x64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING re=
gion_del 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"P=
RIx64" - 0x%"PRIx64
+vfio_dma_unmap_ram(uint64_t start, uint64_t end) "region_del 0x%"PRIx64"=
 - 0x%"PRIx64
 vfio_disconnect_container(int fd) "close container->fd=3D%d"
 vfio_put_group(int fd) "close group->fd=3D%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_=
regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: =
%u"
--=20
2.20.1


