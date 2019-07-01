Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E95B83B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 11:43:23 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhsqI-00036K-Ln
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 05:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsei-0002QP-Bx
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhseh-0000QH-1G
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 05:31:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsee-0000AI-8A; Mon, 01 Jul 2019 05:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8494988307;
 Mon,  1 Jul 2019 09:30:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C39D7D5CB;
 Mon,  1 Jul 2019 09:30:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:31 +0200
Message-Id: <20190701093034.18873-4-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 09:31:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/6] hw/vfio/common: Do not replay IOMMU
 mappings in nested case
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

In nested mode, the stage 1 translation tables are owned by
the guest and there is no caching on host side. So there is
no need to replay the mappings.

As of today, the SMMUv3 nested mode is not yet implemented
and there is no functional VFIO integration without. But
keeping the replay call would execute the default implementation
of memory_region_iommu_replay and attempt to translate the whole
address range, completely stalling qemu. Keeping the MAP/UNMAP
notifier registration allows to hit a warning message in the
SMMUv3 device that tells the user which VFIO device will not
function properly:

"qemu-system-aarch64: -device vfio-pci,host=3D0000:89:00.0: warning:
SMMUv3 does not support notification on MAP: device vfio-pci will not
function properly"

Besides, removing the replay call now allows the guest to boot.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a859298fda..9ea58df67a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -604,6 +604,7 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        bool nested =3D false;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
@@ -631,8 +632,12 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
         memory_region_register_iommu_notifier(section->mr, &giommu->n);
-        memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&nested);
+        if (!nested) {
+            memory_region_iommu_replay(iommu_mr, &giommu->n);
+        }
         return;
     }
=20
--=20
2.20.1


