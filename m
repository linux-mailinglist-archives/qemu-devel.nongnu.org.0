Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940365EBC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:36:11 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlczK-0003ki-9W
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35329)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcw7-0008T4-Mt
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcw6-00057z-NP
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:32:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcw1-0004zF-JV; Thu, 11 Jul 2019 13:32:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49E2F59441;
 Thu, 11 Jul 2019 17:32:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B84325C69A;
 Thu, 11 Jul 2019 17:32:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:45 +0200
Message-Id: <20190711172845.31035-30-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 11 Jul 2019 17:32:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 29/29] vfio: Remove VFIO/SMMUv3 assert
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

Now all the bricks are there, let allow VFIO/SMMUv3 use case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8a2d201058..c849b084bf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -834,17 +834,9 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
         IOMMUNotify notify;
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
-        bool nested;
         int iommu_idx, flags;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
-
-        if (!memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NEST=
ED,
-                                          (void *)&nested) && nested) {
-            error_report("VFIO/vIOMMU integration based on HW nested pag=
ing "
-                         "is not yet supported");
-            abort();
-        }
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
--=20
2.20.1


