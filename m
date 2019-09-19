Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE4B7949
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 14:25:04 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAvUd-0002I1-N8
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 08:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvP1-0005IN-3X
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOz-00040d-Vi
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 08:19:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64579)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvOx-0003xf-LX; Thu, 19 Sep 2019 08:19:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E52AE3D962;
 Thu, 19 Sep 2019 12:19:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239A660BF1;
 Thu, 19 Sep 2019 12:19:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:43 +0200
Message-Id: <20190919121845.29520-4-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 19 Sep 2019 12:19:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/5] exec: assert on
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
- add assert(!ret)
---
 exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 8b998974f8..5be8db6253 100644
--- a/exec.c
+++ b/exec.c
@@ -663,7 +663,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
      */
     MemoryRegion *mr =3D MEMORY_REGION(iommu_mr);
     TCGIOMMUNotifier *notifier;
-    int i;
+    int i, ret;
=20
     for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
         notifier =3D g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifie=
r *, i);
@@ -692,7 +692,9 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
                             0,
                             HWADDR_MAX,
                             iommu_idx);
-        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
+        ret =3D memory_region_register_iommu_notifier(notifier->mr,
+                                                    &notifier->n);
+        assert(!ret);
     }
=20
     if (!notifier->active) {
--=20
2.20.1


