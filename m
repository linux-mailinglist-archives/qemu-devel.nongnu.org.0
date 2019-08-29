Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447DA144B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 11:04:38 +0200 (CEST)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3GM8-0003d6-RP
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 05:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJd-0001ra-18
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 05:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJb-00011H-Nt
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 05:02:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3GJZ-0000xx-13; Thu, 29 Aug 2019 05:01:57 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4ED8186E86F;
 Thu, 29 Aug 2019 09:01:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2505D1001938;
 Thu, 29 Aug 2019 09:01:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com
Date: Thu, 29 Aug 2019 11:01:40 +0200
Message-Id: <20190829090141.21821-2-eric.auger@redhat.com>
In-Reply-To: <20190829090141.21821-1-eric.auger@redhat.com>
References: <20190829090141.21821-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 29 Aug 2019 09:01:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 1/2] memory: Add
 IOMMU_ATTR_NEED_HW_NESTED_PAGING IOMMU memory region attribute
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
Cc: aik@ozlabs.ru, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduce a new IOMMU Memory Region attribute,
IOMMU_ATTR_NEED_HW_NESTED_PAGING that tells whether the
virtual IOMMU relies on physical IOMMU HW nested paging
capability when protecting host assigned devices.

Current Intel virtual IOMMU device supports "Caching
Mode" and does not require 2 stages at physical level to be
integrated with VFIO. However SMMUv3 does not implement such
"caching mode" and requires HW nested paging.

As such SMMUv3 is the first IOMMU device to advertise this
attribute.

This new attribute will allow the VFIO code to specialize
its handling.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- patches 1, 4, 5 were upstreamed separately
- s/IOMMU_ATTR_HW_NESTED_PAGING/IOMMU_ATTR_NEED_HW_NESTED_PAGING

v3 -> v4:
- s/IOMMU_ATTR_VFIO_NESTED/IOMMU_ATTR_HW_NESTED_PAGING
- add comments related to the existing attributes
- fix space after the cast
---
 hw/arm/smmuv3.c       | 12 ++++++++++++
 include/exec/memory.h |  8 +++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2eaf07fb5f..a932bf7136 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1490,6 +1490,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemory=
Region *iommu,
     }
 }
=20
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr =3D=3D IOMMU_ATTR_NEED_HW_NESTED_PAGING) {
+        *(bool *)data =3D true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1497,6 +1508,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
=20
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
+    imrc->get_attr =3D smmuv3_get_attr;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
diff --git a/include/exec/memory.h b/include/exec/memory.h
index fddc2ff48a..61493633fa 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -212,7 +212,13 @@ typedef struct MemoryRegionClass {
=20
=20
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    /* Retrieve an integer corresponding to the TCE file descriptor */
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    /*
+     * Retrieve a boolean that indicates whether the virtual IOMMU relie=
s
+     * on physical IOMMU HW nested paging to protect host assigned devic=
es
+     */
+    IOMMU_ATTR_NEED_HW_NESTED_PAGING,
 };
=20
 /**
--=20
2.20.1


