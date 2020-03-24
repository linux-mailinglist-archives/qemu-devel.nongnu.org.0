Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D41905D9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 07:40:43 +0100 (CET)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGdEv-0006IV-Hd
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 02:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49421)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1jGdE6-0005mN-Ip
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 02:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1jGdE4-0006Ni-Eo
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 02:39:49 -0400
Received: from [107.174.27.60] (port=52372 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1jGdE4-0006N0-9X; Tue, 24 Mar 2020 02:39:48 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 967B6AE80013;
 Tue, 24 Mar 2020 02:37:28 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] vfio/spapr: Fix page size calculation
Date: Tue, 24 Mar 2020 17:39:12 +1100
Message-Id: <20200324063912.25063-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity detected an issue (CID 1421903) with potential call of clz64(0)
which returns 64 which make it do "<<" with a negative number.

This checks the mask and avoids undefined behaviour.

In practice pgsizes and memory_region_iommu_get_min_page_size() always
have some common page sizes and even if they did not, the resulting page
size would be 0x8000.0000.0000.0000 (gcc 9.2) and
ioctl(VFIO_IOMMU_SPAPR_TCE_CREATE) would fail anyway.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/vfio/spapr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index 33692fc86fd6..2900bd19417a 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -147,7 +147,7 @@ int vfio_spapr_create_window(VFIOContainer *container,
 {
     int ret = 0;
     IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
-    uint64_t pagesize = memory_region_iommu_get_min_page_size(iommu_mr);
+    uint64_t pagesize = memory_region_iommu_get_min_page_size(iommu_mr), pgmask;
     unsigned entries, bits_total, bits_per_level, max_levels;
     struct vfio_iommu_spapr_tce_create create = { .argsz = sizeof(create) };
     long rampagesize = qemu_minrampagesize();
@@ -159,8 +159,8 @@ int vfio_spapr_create_window(VFIOContainer *container,
     if (pagesize > rampagesize) {
         pagesize = rampagesize;
     }
-    pagesize = 1ULL << (63 - clz64(container->pgsizes &
-                                   (pagesize | (pagesize - 1))));
+    pgmask = container->pgsizes & (pagesize | (pagesize - 1));
+    pagesize = pgmask ? (1ULL << (63 - clz64(pgmask))) : 0;
     if (!pagesize) {
         error_report("Host doesn't support page size 0x%"PRIx64
                      ", the supported mask is 0x%lx",
-- 
2.17.1


