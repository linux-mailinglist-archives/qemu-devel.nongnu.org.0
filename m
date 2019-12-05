Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE9113EF9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 11:01:45 +0100 (CET)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icnxA-00053w-B5
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 05:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.y.sun@linux.intel.com>) id 1icnvL-00048Y-Gk
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 04:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.y.sun@linux.intel.com>) id 1icnvJ-00009B-7a
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 04:59:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:7856)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.y.sun@linux.intel.com>)
 id 1icnvI-00005j-S1
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 04:59:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 01:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="219160278"
Received: from yisun1-ubuntu.bj.intel.com ([10.238.156.100])
 by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2019 01:59:40 -0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] intel_iommu: fix bug to read DMAR_RTADDR_REG
Date: Thu,  5 Dec 2019 17:54:39 +0800
Message-Id: <20191205095439.29114-1-yi.y.sun@linux.intel.com>
X-Mailer: git-send-email 2.15.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: jasowang@redhat.com, Yi Sun <yi.y.sun@linux.intel.com>, dgilbert@redhat.com,
 peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Should directly read DMAR_RTADDR_REG but not using 's->root'.
Because 's->root' is modified in 'vtd_root_table_setup()' so
that the first 12 bits are omitted. This causes the guest
iommu debugfs cannot show pasid tables.

Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 hw/i386/intel_iommu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 43c94b993b..ee06993675 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2610,16 +2610,15 @@ static uint64_t vtd_mem_read(void *opaque, hwaddr addr, unsigned size)
     switch (addr) {
     /* Root Table Address Register, 64-bit */
     case DMAR_RTADDR_REG:
+        val = vtd_get_quad_raw(s, DMAR_RTADDR_REG);
         if (size == 4) {
-            val = s->root & ((1ULL << 32) - 1);
-        } else {
-            val = s->root;
+            val = val & ((1ULL << 32) - 1);
         }
         break;
 
     case DMAR_RTADDR_REG_HI:
         assert(size == 4);
-        val = s->root >> 32;
+        val = vtd_get_quad_raw(s, DMAR_RTADDR_REG) >> 32;
         break;
 
     /* Invalidation Queue Address Register, 64-bit */
-- 
2.17.1


