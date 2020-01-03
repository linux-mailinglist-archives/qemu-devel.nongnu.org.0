Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D012F8F3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 14:49:27 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inNKP-0008AF-Vl
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 08:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1inNIU-0007JO-B3
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1inNIO-0001RP-Fr
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:25 -0500
Received: from mga03.intel.com ([134.134.136.65]:21930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1inNIO-0001PI-6k
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 08:47:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 05:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; d="scan'208";a="221640121"
Received: from iov2.bj.intel.com ([10.238.145.72])
 by orsmga006.jf.intel.com with ESMTP; 03 Jan 2020 05:47:15 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com
Subject: [PATCH v1 2/2] intel_iommu: add present bit check for pasid table
 entries
Date: Fri,  3 Jan 2020 21:28:06 +0800
Message-Id: <1578058086-4288-3-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578058086-4288-1-git-send-email-yi.l.liu@intel.com>
References: <1578058086-4288-1-git-send-email-yi.l.liu@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: kevin.tian@intel.com, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Yi Sun <yi.y.sun@linux.intel.com>, jun.j.tian@intel.com, yi.l.liu@intel.com,
 yi.y.sun@intel.co
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The present bit check for pasid entry (pe) and pasid directory
entry (pdire) were missed in previous commits as fpd bit check
doesn't require present bit as "Set". This patch adds the present
bit check for callers which wants to get a valid pe/pdire.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c          | 92 +++++++++++++++++++++++++++++++++---------
 hw/i386/intel_iommu_internal.h |  1 +
 2 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 00ebae4..bfe8edb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -686,9 +686,18 @@ static inline bool vtd_pe_type_check(X86IOMMUState *x86_iommu,
     return true;
 }
 
-static int vtd_get_pasid_dire(dma_addr_t pasid_dir_base,
-                              uint32_t pasid,
-                              VTDPASIDDirEntry *pdire)
+static inline bool vtd_pdire_present(VTDPASIDDirEntry *pdire)
+{
+    return pdire->val & 1;
+}
+
+/**
+ * Caller of this function should check present bit if wants
+ * to use pdir entry for futher usage except for fpd bit check.
+ */
+static int vtd_get_pdire_from_pdir_table(dma_addr_t pasid_dir_base,
+                                         uint32_t pasid,
+                                         VTDPASIDDirEntry *pdire)
 {
     uint32_t index;
     dma_addr_t addr, entry_size;
@@ -703,18 +712,22 @@ static int vtd_get_pasid_dire(dma_addr_t pasid_dir_base,
     return 0;
 }
 
-static int vtd_get_pasid_entry(IntelIOMMUState *s,
-                               uint32_t pasid,
-                               VTDPASIDDirEntry *pdire,
-                               VTDPASIDEntry *pe)
+static inline bool vtd_pe_present(VTDPASIDEntry *pe)
+{
+    return pe->val[0] & VTD_PASID_ENTRY_P;
+}
+
+static int vtd_get_pe_in_pasid_leaf_table(IntelIOMMUState *s,
+                                          uint32_t pasid,
+                                          dma_addr_t addr,
+                                          VTDPASIDEntry *pe)
 {
     uint32_t index;
-    dma_addr_t addr, entry_size;
+    dma_addr_t entry_size;
     X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
 
     index = VTD_PASID_TABLE_INDEX(pasid);
     entry_size = VTD_PASID_ENTRY_SIZE;
-    addr = pdire->val & VTD_PASID_TABLE_BASE_ADDR_MASK;
     addr = addr + index * entry_size;
     if (dma_memory_read(&address_space_memory, addr, pe, entry_size)) {
         return -VTD_FR_PASID_TABLE_INV;
@@ -732,25 +745,54 @@ static int vtd_get_pasid_entry(IntelIOMMUState *s,
     return 0;
 }
 
-static int vtd_get_pasid_entry_from_pasid(IntelIOMMUState *s,
-                                          dma_addr_t pasid_dir_base,
-                                          uint32_t pasid,
-                                          VTDPASIDEntry *pe)
+/**
+ * Caller of this function should check present bit if wants
+ * to use pasid entry for futher usage except for fpd bit check.
+ */
+static int vtd_get_pe_from_pdire(IntelIOMMUState *s,
+                                 uint32_t pasid,
+                                 VTDPASIDDirEntry *pdire,
+                                 VTDPASIDEntry *pe)
+{
+    dma_addr_t addr = pdire->val & VTD_PASID_TABLE_BASE_ADDR_MASK;
+
+    return vtd_get_pe_in_pasid_leaf_table(s, pasid, addr, pe);
+}
+
+/**
+ * This function gets a pasid entry from a specified pasid
+ * table (includes dir and leaf table) with a specified pasid.
+ * Sanity check should be done to ensure return a present
+ * pasid entry to caller.
+ */
+static int vtd_get_pe_from_pasid_table(IntelIOMMUState *s,
+                                       dma_addr_t pasid_dir_base,
+                                       uint32_t pasid,
+                                       VTDPASIDEntry *pe)
 {
     int ret;
     VTDPASIDDirEntry pdire;
 
-    ret = vtd_get_pasid_dire(pasid_dir_base, pasid, &pdire);
+    ret = vtd_get_pdire_from_pdir_table(pasid_dir_base,
+                                        pasid, &pdire);
     if (ret) {
         return ret;
     }
 
-    ret = vtd_get_pasid_entry(s, pasid, &pdire, pe);
+    if (!vtd_pdire_present(&pdire)) {
+        return -VTD_FR_PASID_TABLE_INV;
+    }
+
+    ret = vtd_get_pe_from_pdire(s, pasid, &pdire, pe);
     if (ret) {
         return ret;
     }
 
-    return ret;
+    if (!vtd_pe_present(pe)) {
+        return -VTD_FR_PASID_TABLE_INV;
+    }
+
+    return 0;
 }
 
 static int vtd_ce_get_rid2pasid_entry(IntelIOMMUState *s,
@@ -763,7 +805,7 @@ static int vtd_ce_get_rid2pasid_entry(IntelIOMMUState *s,
 
     pasid = VTD_CE_GET_RID2PASID(ce);
     pasid_dir_base = VTD_CE_GET_PASID_DIR_TABLE(ce);
-    ret = vtd_get_pasid_entry_from_pasid(s, pasid_dir_base, pasid, pe);
+    ret = vtd_get_pe_from_pasid_table(s, pasid_dir_base, pasid, pe);
 
     return ret;
 }
@@ -781,7 +823,11 @@ static int vtd_ce_get_pasid_fpd(IntelIOMMUState *s,
     pasid = VTD_CE_GET_RID2PASID(ce);
     pasid_dir_base = VTD_CE_GET_PASID_DIR_TABLE(ce);
 
-    ret = vtd_get_pasid_dire(pasid_dir_base, pasid, &pdire);
+    /*
+     * No present bit check since fpd is meaningful even
+     * if the present bit is clear.
+     */
+    ret = vtd_get_pdire_from_pdir_table(pasid_dir_base, pasid, &pdire);
     if (ret) {
         return ret;
     }
@@ -791,7 +837,15 @@ static int vtd_ce_get_pasid_fpd(IntelIOMMUState *s,
         return 0;
     }
 
-    ret = vtd_get_pasid_entry(s, pasid, &pdire, &pe);
+    if (!vtd_pdire_present(&pdire)) {
+        return -VTD_FR_PASID_TABLE_INV;
+    }
+
+    /*
+     * No present bit check since fpd is meaningful even
+     * if the present bit is clear.
+     */
+    ret = vtd_get_pe_from_pdire(s, pasid, &pdire, &pe);
     if (ret) {
         return ret;
     }
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index edcf9fc..862033e 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -479,6 +479,7 @@ typedef struct VTDRootEntry VTDRootEntry;
 #define VTD_PASID_ENTRY_FPD           (1ULL << 1) /* Fault Processing Disable */
 
 /* PASID Granular Translation Type Mask */
+#define VTD_PASID_ENTRY_P              1ULL
 #define VTD_SM_PASID_ENTRY_PGTT        (7ULL << 6)
 #define VTD_SM_PASID_ENTRY_FLT         (1ULL << 6)
 #define VTD_SM_PASID_ENTRY_SLT         (2ULL << 6)
-- 
2.7.4


