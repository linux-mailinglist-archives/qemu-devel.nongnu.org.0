Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBE99BC1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 19:28:36 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0qt1-0001fk-78
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 13:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qos-0005uj-7i
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qor-00037j-9s
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:24:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qoo-00035b-ML; Thu, 22 Aug 2019 13:24:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC5A21801587;
 Thu, 22 Aug 2019 17:24:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02B8F60610;
 Thu, 22 Aug 2019 17:24:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:48 +0200
Message-Id: <20190822172350.12008-4-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 22 Aug 2019 17:24:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 3/5] hw/vfio/common: Fail on VFIO/HW nested
 paging detection
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today, VFIO only works along with vIOMMU supporting
caching mode. The SMMUv3 does not support this mode and
requires HW nested paging to work properly with VFIO.

So any attempt to run a VFIO device protected by such IOMMU
would prevent the assigned device from working and at the
moment the guest does not even boot as the default
memory_region_iommu_replay() implementation attempts to
translate the whole address space and completely stalls
the guest.

So let's fail on that case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- use IOMMU_ATTR_HW_NESTED_PAGING
- do not abort anymore but jump to fail
---
 hw/vfio/common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d8..2b66cf7553 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -606,9 +606,19 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        bool nested;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
+
+        if (!memory_region_iommu_get_attr(iommu_mr,
+                                          IOMMU_ATTR_HW_NESTED_PAGING,
+                                          (void *)&nested) && nested) {
+            error_report("VFIO/vIOMMU integration based on HW nested pag=
ing "
+                         "is not yet supported");
+            ret =3D -EINVAL;
+            goto fail;
+        }
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
--=20
2.20.1


