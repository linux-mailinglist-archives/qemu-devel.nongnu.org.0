Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0AB19BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 10:41:59 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8h9S-0001U2-1L
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 04:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4Y-0005bP-9A
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4X-000897-5j
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 04:36:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56072)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4V-00087H-2p; Fri, 13 Sep 2019 04:36:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6275730860BF;
 Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B35260F80;
 Fri, 13 Sep 2019 08:36:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:11 +0200
Message-Id: <20190913083615.14719-3-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 13 Sep 2019 08:36:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 2/6] vfio/common: Handle
 memory_region_register_iommu_notifier() failure
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

Now memory_region_register_iommu_notifier() is allowed to fail,
let's handle the returned value in vfio_listener_region_add().

This will allow to remove the error handling (exit) in the
IOMMUs that implement a notify_flag_changed() that sometimes
cannot accept the MAP flag.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d8..d57d72cfb9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -630,9 +630,13 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
-        memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        ret =3D memory_region_register_iommu_notifier(section->mr, &giom=
mu->n);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
         return;
--=20
2.20.1


