Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B35CF0E5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 04:46:54 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHfWW-0003EL-T6
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 22:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qi1.zhang@intel.com>) id 1iHfUq-0002C9-Ht
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qi1.zhang@intel.com>) id 1iHfUp-0001s1-8P
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:45003)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qi1.zhang@intel.com>) id 1iHfUo-0001qw-WA
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 22:45:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Oct 2019 19:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; d="scan'208";a="193266147"
Received: from a23004-02.sh.intel.com ([10.239.9.19])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2019 19:45:04 -0700
From: qi1.zhang@intel.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] intel_iommu: TM field should not be in reserved bits
Date: Tue,  8 Oct 2019 10:34:56 +0800
Message-Id: <758ae02ef3a36b2790a7e61018bb55379ceeb450.1570498233.git.qi1.zhang@intel.com>
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

When dt is supported, TM field should not be Reserved(0).

Refer to VT-d Spec 9.8

Signed-off-by: Zhang, Qi <qi1.zhang@intel.com>
Signed-off-by: Qi, Yadong <yadong.qi@intel.com>
---
 hw/i386/intel_iommu.c          | 12 ++++++++----
 hw/i386/intel_iommu_internal.h | 17 +++++++++++++----
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a118efaeaf..d62604ece3 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3549,15 +3549,19 @@ static void vtd_init(IntelIOMMUState *s)
      * Rsvd field masks for spte
      */
     vtd_spte_rsvd[0] = ~0ULL;
-    vtd_spte_rsvd[1] = VTD_SPTE_PAGE_L1_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd[1] = VTD_SPTE_PAGE_L1_RSVD_MASK(s->aw_bits,
+                                                  x86_iommu->dt_supported);
     vtd_spte_rsvd[2] = VTD_SPTE_PAGE_L2_RSVD_MASK(s->aw_bits);
     vtd_spte_rsvd[3] = VTD_SPTE_PAGE_L3_RSVD_MASK(s->aw_bits);
     vtd_spte_rsvd[4] = VTD_SPTE_PAGE_L4_RSVD_MASK(s->aw_bits);
 
     vtd_spte_rsvd_large[0] = ~0ULL;
-    vtd_spte_rsvd_large[1] = VTD_SPTE_LPAGE_L1_RSVD_MASK(s->aw_bits);
-    vtd_spte_rsvd_large[2] = VTD_SPTE_LPAGE_L2_RSVD_MASK(s->aw_bits);
-    vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits);
+    vtd_spte_rsvd_large[1] = VTD_SPTE_LPAGE_L1_RSVD_MASK(s->aw_bits,
+                                                         x86_iommu->dt_supported);
+    vtd_spte_rsvd_large[2] = VTD_SPTE_LPAGE_L2_RSVD_MASK(s->aw_bits,
+                                                         x86_iommu->dt_supported);
+    vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits,
+                                                         x86_iommu->dt_supported);
     vtd_spte_rsvd_large[4] = VTD_SPTE_LPAGE_L4_RSVD_MASK(s->aw_bits);
 
     if (x86_iommu_ir_supported(x86_iommu)) {
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index c1235a7063..3a839a8925 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -387,7 +387,9 @@ typedef union VTDInvDesc VTDInvDesc;
 #define VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO 0xffff0000ffe0fff8
 
 /* Rsvd field masks for spte */
-#define VTD_SPTE_PAGE_L1_RSVD_MASK(aw) \
+#define VTD_SPTE_PAGE_L1_RSVD_MASK(aw, dt_supported) \
+        dt_supported ? \
+        (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
 #define VTD_SPTE_PAGE_L2_RSVD_MASK(aw) \
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
@@ -395,11 +397,17 @@ typedef union VTDInvDesc VTDInvDesc;
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
 #define VTD_SPTE_PAGE_L4_RSVD_MASK(aw) \
         (0x880ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
-#define VTD_SPTE_LPAGE_L1_RSVD_MASK(aw) \
+#define VTD_SPTE_LPAGE_L1_RSVD_MASK(aw, dt_supported) \
+        dt_supported ? \
+        (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
         (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
-#define VTD_SPTE_LPAGE_L2_RSVD_MASK(aw) \
+#define VTD_SPTE_LPAGE_L2_RSVD_MASK(aw, dt_supported) \
+        dt_supported ? \
+        (0x1ff800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
         (0x1ff800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
-#define VTD_SPTE_LPAGE_L3_RSVD_MASK(aw) \
+#define VTD_SPTE_LPAGE_L3_RSVD_MASK(aw, dt_supported) \
+        dt_supported ? \
+        (0x3ffff800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
         (0x3ffff800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
 #define VTD_SPTE_LPAGE_L4_RSVD_MASK(aw) \
         (0x880ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM))
@@ -506,5 +514,6 @@ typedef struct VTDRootEntry VTDRootEntry;
 #define VTD_SL_W                    (1ULL << 1)
 #define VTD_SL_PT_BASE_ADDR_MASK(aw) (~(VTD_PAGE_SIZE - 1) & VTD_HAW_MASK(aw))
 #define VTD_SL_IGN_COM              0xbff0000000000000ULL
+#define VTD_SL_TM                   (1ULL << 62)
 
 #endif
-- 
2.20.1


