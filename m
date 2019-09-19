Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF71B7938
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 14:22:16 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAvRu-0007Ky-Ue
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 08:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOw-0005Bc-Ps
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOu-0003v4-Q3
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvOq-0003ph-07; Thu, 19 Sep 2019 08:19:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E8B22A09A0;
 Thu, 19 Sep 2019 12:19:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E1F60BF1;
 Thu, 19 Sep 2019 12:19:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:41 +0200
Message-Id: <20190919121845.29520-2-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 19 Sep 2019 12:19:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/5] memory: allow
 memory_region_register_iommu_notifier() to fail
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, when a notifier is attempted to be registered and its
flags are not supported (especially the MAP one) by the IOMMU MR,
we generally abruptly exit in the IOMMU code. The failure could be
handled more nicely in the caller and especially in the VFIO code.

So let's allow memory_region_register_iommu_notifier() to fail as
well as notify_flag_changed() callback.

All sites implementing the callback are updated. This patch does
not yet remove the exit(1) in the amd_iommu code.

in SMMUv3 we turn the warning message into an error message saying
that the assigned device would not work properly.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- turn the warning message into an error message
---
 hw/arm/smmuv3.c       | 12 +++++++-----
 hw/i386/amd_iommu.c   |  7 ++++---
 hw/i386/intel_iommu.c |  7 ++++---
 hw/ppc/spapr_iommu.c  |  7 ++++---
 include/exec/memory.h | 18 +++++++++++++-----
 memory.c              | 28 ++++++++++++++++++----------
 6 files changed, 50 insertions(+), 29 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index db051dcac8..2845aa7ffd 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1469,9 +1469,9 @@ static void smmuv3_class_init(ObjectClass *klass, v=
oid *data)
     dc->realize =3D smmu_realize;
 }
=20
-static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                       IOMMUNotifierFlag old,
-                                       IOMMUNotifierFlag new)
+static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                      IOMMUNotifierFlag old,
+                                      IOMMUNotifierFlag new)
 {
     SMMUDevice *sdev =3D container_of(iommu, SMMUDevice, iommu);
     SMMUv3State *s3 =3D sdev->smmu;
@@ -1481,8 +1481,9 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryR=
egion *iommu,
         int bus_num =3D pci_bus_num(sdev->bus);
         PCIDevice *pcidev =3D pci_find_device(sdev->bus, bus_num, sdev->=
devfn);
=20
-        warn_report("SMMUv3 does not support notification on MAP: "
-                     "device %s will not function properly", pcidev->nam=
e);
+        error_report("SMMUv3 does not support notification on MAP: "
+                     "device %s would not function properly", pcidev->na=
me);
+        return -EINVAL;
     }
=20
     if (old =3D=3D IOMMU_NOTIFIER_NONE) {
@@ -1492,6 +1493,7 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryR=
egion *iommu,
         trace_smmuv3_notify_flag_del(iommu->parent_obj.name);
         QLIST_REMOVE(sdev, next);
     }
+    return 0;
 }
=20
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 08884523e2..137ba367db 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1466,9 +1466,9 @@ static const MemoryRegionOps mmio_mem_ops =3D {
     }
 };
=20
-static void amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                            IOMMUNotifierFlag old,
-                                            IOMMUNotifierFlag new)
+static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                           IOMMUNotifierFlag old,
+                                           IOMMUNotifierFlag new)
 {
     AMDVIAddressSpace *as =3D container_of(iommu, AMDVIAddressSpace, iom=
mu);
=20
@@ -1478,6 +1478,7 @@ static void amdvi_iommu_notify_flag_changed(IOMMUMe=
moryRegion *iommu,
                      PCI_FUNC(as->devfn));
         exit(1);
     }
+    return 0;
 }
=20
 static void amdvi_init(AMDVIState *s)
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f1de8fdb75..6465a570a1 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2929,9 +2929,9 @@ static IOMMUTLBEntry vtd_iommu_translate(IOMMUMemor=
yRegion *iommu, hwaddr addr,
     return iotlb;
 }
=20
-static void vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                          IOMMUNotifierFlag old,
-                                          IOMMUNotifierFlag new)
+static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                         IOMMUNotifierFlag old,
+                                         IOMMUNotifierFlag new)
 {
     VTDAddressSpace *vtd_as =3D container_of(iommu, VTDAddressSpace, iom=
mu);
     IntelIOMMUState *s =3D vtd_as->iommu_state;
@@ -2944,6 +2944,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemo=
ryRegion *iommu,
     } else if (new =3D=3D IOMMU_NOTIFIER_NONE) {
         QLIST_REMOVE(vtd_as, next);
     }
+    return 0;
 }
=20
 static int vtd_post_load(void *opaque, int version_id)
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index e87b3d50f7..8d3b38f90b 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -205,9 +205,9 @@ static int spapr_tce_get_attr(IOMMUMemoryRegion *iomm=
u,
     return -EINVAL;
 }
=20
-static void spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
-                                          IOMMUNotifierFlag old,
-                                          IOMMUNotifierFlag new)
+static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
+                                         IOMMUNotifierFlag old,
+                                         IOMMUNotifierFlag new)
 {
     struct SpaprTceTable *tbl =3D container_of(iommu, SpaprTceTable, iom=
mu);
=20
@@ -216,6 +216,7 @@ static void spapr_tce_notify_flag_changed(IOMMUMemory=
Region *iommu,
     } else if (old !=3D IOMMU_NOTIFIER_NONE && new =3D=3D IOMMU_NOTIFIER=
_NONE) {
         spapr_tce_set_need_vfio(tbl, false);
     }
+    return 0;
 }
=20
 static int spapr_tce_table_post_load(void *opaque, int version_id)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index a30245c25a..83257e3dce 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -288,10 +288,14 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      * @old_flags: events which previously needed to be notified
      * @new_flags: events which now need to be notified
+     *
+     * Returns 0 on success, or a negative errno; in particular
+     * returns -EINVAL if the new flag bitmap is not supported by the
+     * IOMMU memory region.
      */
-    void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
-                                IOMMUNotifierFlag old_flags,
-                                IOMMUNotifierFlag new_flags);
+    int (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
+                               IOMMUNotifierFlag old_flags,
+                               IOMMUNotifierFlag new_flags);
     /* Called to handle memory_region_iommu_replay().
      *
      * The default implementation of memory_region_iommu_replay() is to
@@ -1067,13 +1071,17 @@ void memory_region_notify_one(IOMMUNotifier *noti=
fier,
  * memory_region_register_iommu_notifier: register a notifier for change=
s to
  * IOMMU translation entries.
  *
+ * Returns 0 on success, or a negative errno otherwise. In particular,
+ * -EINVAL indicates that at least one of the attributes of the notifier
+ * is not supported (flag/range) by the IOMMU memory region.
+ *
  * @mr: the memory region to observe
  * @n: the IOMMUNotifier to be added; the notify callback receives a
  *     pointer to an #IOMMUTLBEntry as the opaque value; the pointer
  *     ceases to be valid on exit from the notifier.
  */
-void memory_region_register_iommu_notifier(MemoryRegion *mr,
-                                           IOMMUNotifier *n);
+int memory_region_register_iommu_notifier(MemoryRegion *mr,
+                                          IOMMUNotifier *n);
=20
 /**
  * memory_region_iommu_replay: replay existing IOMMU translations to
diff --git a/memory.c b/memory.c
index b9dd6b94ca..2545d22ca9 100644
--- a/memory.c
+++ b/memory.c
@@ -1837,33 +1837,37 @@ bool memory_region_is_logging(MemoryRegion *mr, u=
int8_t client)
     return memory_region_get_dirty_log_mask(mr) & (1 << client);
 }
=20
-static void memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *i=
ommu_mr)
+static int memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *io=
mmu_mr)
 {
     IOMMUNotifierFlag flags =3D IOMMU_NOTIFIER_NONE;
     IOMMUNotifier *iommu_notifier;
     IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_GET_CLASS(iommu=
_mr);
+    int ret =3D 0;
=20
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         flags |=3D iommu_notifier->notifier_flags;
     }
=20
     if (flags !=3D iommu_mr->iommu_notify_flags && imrc->notify_flag_cha=
nged) {
-        imrc->notify_flag_changed(iommu_mr,
-                                  iommu_mr->iommu_notify_flags,
-                                  flags);
+        ret =3D imrc->notify_flag_changed(iommu_mr,
+                                        iommu_mr->iommu_notify_flags,
+                                        flags);
     }
=20
-    iommu_mr->iommu_notify_flags =3D flags;
+    if (!ret) {
+        iommu_mr->iommu_notify_flags =3D flags;
+    }
+    return ret;
 }
=20
-void memory_region_register_iommu_notifier(MemoryRegion *mr,
-                                           IOMMUNotifier *n)
+int memory_region_register_iommu_notifier(MemoryRegion *mr,
+                                          IOMMUNotifier *n)
 {
     IOMMUMemoryRegion *iommu_mr;
+    int ret;
=20
     if (mr->alias) {
-        memory_region_register_iommu_notifier(mr->alias, n);
-        return;
+        return memory_region_register_iommu_notifier(mr->alias, n);
     }
=20
     /* We need to register for at least one bitfield */
@@ -1874,7 +1878,11 @@ void memory_region_register_iommu_notifier(MemoryR=
egion *mr,
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
=20
     QLIST_INSERT_HEAD(&iommu_mr->iommu_notify, n, node);
-    memory_region_update_iommu_notify_flags(iommu_mr);
+    ret =3D memory_region_update_iommu_notify_flags(iommu_mr);
+    if (ret) {
+        QLIST_REMOVE(n, node);
+    }
+    return ret;
 }
=20
 uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_=
mr)
--=20
2.20.1


