Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BBB793F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 14:23:16 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAvSt-0000Ti-M1
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 08:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPO-0005Q2-OH
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPM-0004Vh-Oz
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvP8-0004AA-75; Thu, 19 Sep 2019 08:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84371A3D3A8;
 Thu, 19 Sep 2019 12:19:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4785E60BF1;
 Thu, 19 Sep 2019 12:19:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:44 +0200
Message-Id: <20190919121845.29520-5-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 19 Sep 2019 12:19:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/5] vhost: assert on
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

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- assert(!ret)
---
 hw/virtio/vhost.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 34accdf615..975cb4c28c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -672,7 +672,7 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
                                          iommu_listener);
     struct vhost_iommu *iommu;
     Int128 end;
-    int iommu_idx;
+    int iommu_idx, ret;
     IOMMUMemoryRegion *iommu_mr;
=20
     if (!memory_region_is_iommu(section->mr)) {
@@ -696,7 +696,8 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
     iommu->iommu_offset =3D section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev =3D dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n);
+    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu->n=
);
+    assert(!ret);
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
--=20
2.20.1


