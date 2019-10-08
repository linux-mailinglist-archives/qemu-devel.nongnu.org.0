Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E560CF0E6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 04:46:56 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHfWZ-0003HB-IV
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 22:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qi1.zhang@intel.com>) id 1iHfUq-0002C7-C3
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qi1.zhang@intel.com>) id 1iHfUo-0001rg-Nz
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:45003)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qi1.zhang@intel.com>) id 1iHfUo-0001qw-GF
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 19:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="193266136"
Received: from a23004-02.sh.intel.com ([10.239.9.19])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2019 19:45:03 -0700
From: qi1.zhang@intel.com
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] intel_iommu: split the resevred fields arrays into two
 ones
Date: Tue,  8 Oct 2019 10:34:55 +0800
Message-Id: <d3aa65ad0510cdafd5d7dcbc54bc250feb6aa59b.1570498233.git.qi1.zhang@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570498233.git.qi1.zhang@intel.com>
References: <cover.1570498233.git.qi1.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Cc: qi1.zhang@intel.com, ehabkost@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, yadong.qi@intel.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Zhang, Qi" <qi1.zhang@intel.com>

Signed-off-by: Zhang, Qi <qi1.zhang@intel.com>
---
 hw/i386/intel_iommu.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f1de8fdb75..a118efaeaf 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -910,18 +910,19 @@ static dma_addr_t vtd_get_iova_pgtbl_base(IntelIOMMUState *s,
 
 /*
  * Rsvd field masks for spte:
- *     Index [1] to [4] 4k pages
- *     Index [5] to [8] large pages
+ *     vtd_spte_rsvd 4k pages
+ *     vtd_spte_rsvd_large large pages
  */
-static uint64_t vtd_paging_entry_rsvd_field[9];
+static uint64_t vtd_spte_rsvd[5];
+static uint64_t vtd_spte_rsvd_large[5];
 
 static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
 {
     if (slpte & VTD_SL_PT_PAGE_SIZE_MASK) {
         /* Maybe large page */
-        return slpte & vtd_paging_entry_rsvd_field[level + 4];
+        return slpte & vtd_spte_rsvd_large[level];
     } else {
-        return slpte & vtd_paging_entry_rsvd_field[level];
+        return slpte & vtd_spte_rsvd[level];
     }
 }
 
@@ -3547,15 +3548,17 @@ static void vtd_init(IntelIOMMUState *s)
     /*
      * Rsvd field masks for spte
      */
-    vtd_paging_entry_rsvd_field[0] = ~0ULL;
-    vtd_paging_entry_rsvd_field[1] = VTD_SPTE_PAGE_L1_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[2] = VTD_SPTE_PAGE_L2_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[3] = VTD_SPTE_PAGE_L3_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[4] = VTD_SPTE_PAGE_L4_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[5] = VTD_SPTE_LPAGE_L1_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[6] = VTD_SPTE_LPAGE_L2_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[7] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits);
-    vtd_paging_entry_rsvd_field[8] = VTD_SPTE_LPAGE_L4_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd[0] = ~0ULL;
+    vtd_spte_rsvd[1] = VTD_SPTE_PAGE_L1_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd[2] = VTD_SPTE_PAGE_L2_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd[3] = VTD_SPTE_PAGE_L3_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd[4] = VTD_SPTE_PAGE_L4_RSVD_MASK(s->aw_bits);
+
+    vtd_spte_rsvd_large[0] = ~0ULL;
+    vtd_spte_rsvd_large[1] = VTD_SPTE_LPAGE_L1_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd_large[2] = VTD_SPTE_LPAGE_L2_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd_large[4] = VTD_SPTE_LPAGE_L4_RSVD_MASK(s->aw_bits);
 
     if (x86_iommu_ir_supported(x86_iommu)) {
         s->ecap |= VTD_ECAP_IR | VTD_ECAP_MHMV;
-- 
2.20.1


