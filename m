Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543EA65E91
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:29:39 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlcsz-000460-Rx
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcsb-00038q-Ft
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcsa-0001bQ-FG
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcsY-0001Yb-9d; Thu, 11 Jul 2019 13:29:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83316308FB9D;
 Thu, 11 Jul 2019 17:29:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94C8A5C1B4;
 Thu, 11 Jul 2019 17:29:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:17 +0200
Message-Id: <20190711172845.31035-2-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 11 Jul 2019 17:29:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 01/29] memory: Remove unused
 memory_region_iommu_replay_all()
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

memory_region_iommu_replay_all is not used. Remove it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 10 ----------
 memory.c              |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2c5cdffa31..a078cd033f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1076,16 +1076,6 @@ void memory_region_register_iommu_notifier(MemoryR=
egion *mr,
  */
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifi=
er *n);
=20
-/**
- * memory_region_iommu_replay_all: replay existing IOMMU translations
- * to all the notifiers registered.
- *
- * Note: this is not related to record-and-replay functionality.
- *
- * @iommu_mr: the memory region to observe
- */
-void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr);
-
 /**
  * memory_region_unregister_iommu_notifier: unregister a notifier for
  * changes to IOMMU translation entries.
diff --git a/memory.c b/memory.c
index 480f3d989b..90967b579d 100644
--- a/memory.c
+++ b/memory.c
@@ -1910,15 +1910,6 @@ void memory_region_iommu_replay(IOMMUMemoryRegion =
*iommu_mr, IOMMUNotifier *n)
     }
 }
=20
-void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr)
-{
-    IOMMUNotifier *notifier;
-
-    IOMMU_NOTIFIER_FOREACH(notifier, iommu_mr) {
-        memory_region_iommu_replay(iommu_mr, notifier);
-    }
-}
-
 void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
                                              IOMMUNotifier *n)
 {
--=20
2.20.1


