Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5334E205D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:59:27 +0100 (CET)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWB4g-0008SH-6z
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:59:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB0K-0005Zu-QH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB0G-0005Bf-4H
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647842091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2As1Z1a8qSs3KBGzg9rVAPAl8irLtZvpGxiklXUGbEU=;
 b=af5CiElmll+wydTtKWSi1f9hBrqyY+d0+5oSF6CIGl+udfDl+WnyAbQYik4zxR90VfvYlp
 85ScWhxqVAnNpDE7W1emAtk34hDbGxWkDMjQfa9jE/ITPtcXnYq5Z8o2E2eEUqyNCzVAr5
 qH7lmdj1eFzRtaDb9FovITzPQT4177k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-iSDSkMhTMVSkS49bg7ynyw-1; Mon, 21 Mar 2022 01:54:48 -0400
X-MC-Unique: iSDSkMhTMVSkS49bg7ynyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F83100B8C8;
 Mon, 21 Mar 2022 05:54:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-31.pek2.redhat.com [10.72.14.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D8BE43248C;
 Mon, 21 Mar 2022 05:54:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH V2 4/4] intel-iommu: PASID support
Date: Mon, 21 Mar 2022 13:54:29 +0800
Message-Id: <20220321055429.10260-5-jasowang@redhat.com>
In-Reply-To: <20220321055429.10260-1-jasowang@redhat.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
existing support for scalable mode, we need to implement the following
missing parts:

1) tag VTDAddressSpace with PASID and support IOMMU/DMA translation
   with PASID
2) tag IOTLB with PASID
3) PASID cache and its flush
4) Fault recording with PASID

For simplicity:

1) PASID cache is not implemented so we can simply implement the PASID
cache flush as a nop.
2) Fault recording with PASID is not supported, NFR is not changed.

All of the above is not mandatory and could be implemented in the
future.

Note that though PASID based IOMMU translation is ready but no device
can issue PASID DMA right now. In this case, PCI_NO_PASID is used as
PASID to identify the address w/ PASID. vtd_find_add_as() has been
extended to provision address space with PASID which could be utilized
by the future extension of PCI core to allow device model to use PASID
based DMA translation.

This feature would be useful for:

1) prototyping PASID support for devices like virtio
2) future vPASID work
3) future PRS and vSVA work

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 357 +++++++++++++++++++++++++--------
 hw/i386/intel_iommu_internal.h |  14 +-
 hw/i386/trace-events           |   2 +
 include/hw/i386/intel_iommu.h  |   7 +-
 include/hw/pci/pci_bus.h       |   2 +
 5 files changed, 296 insertions(+), 86 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 82787f9850..13447fda16 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -58,6 +58,14 @@
 struct vtd_as_key {
     PCIBus *bus;
     uint8_t devfn;
+    uint32_t pasid;
+};
+
+struct vtd_iotlb_key {
+    uint16_t sid;
+    uint32_t pasid;
+    uint64_t gfn;
+    uint32_t level;
 };
 
 static void vtd_address_space_refresh_all(IntelIOMMUState *s);
@@ -199,14 +207,24 @@ static inline gboolean vtd_as_has_map_notifier(VTDAddressSpace *as)
 }
 
 /* GHashTable functions */
-static gboolean vtd_uint64_equal(gconstpointer v1, gconstpointer v2)
+static gboolean vtd_iotlb_equal(gconstpointer v1, gconstpointer v2)
 {
-    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
+    const struct vtd_iotlb_key *key1 = v1;
+    const struct vtd_iotlb_key *key2 = v2;
+
+    return key1->sid == key2->sid &&
+           key1->pasid == key2->pasid &&
+           key1->level == key2->level &&
+           key1->gfn == key2->gfn;
 }
 
-static guint vtd_uint64_hash(gconstpointer v)
+static guint vtd_iotlb_hash(gconstpointer v)
 {
-    return (guint)*(const uint64_t *)v;
+    const struct vtd_iotlb_key *key = v;
+
+    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
+           (key->level) << VTD_IOTLB_LVL_SHIFT |
+           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
 }
 
 static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
@@ -214,7 +232,8 @@ static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
     const struct vtd_as_key *key1 = v1;
     const struct vtd_as_key *key2 = v2;
 
-    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
+    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn) &&
+           (key1->pasid == key2->pasid);
 }
 
 static inline uint16_t vtd_make_source_id(uint8_t bus_num, uint8_t devfn)
@@ -306,13 +325,6 @@ static void vtd_reset_caches(IntelIOMMUState *s)
     vtd_iommu_unlock(s);
 }
 
-static uint64_t vtd_get_iotlb_key(uint64_t gfn, uint16_t source_id,
-                                  uint32_t level)
-{
-    return gfn | ((uint64_t)(source_id) << VTD_IOTLB_SID_SHIFT) |
-           ((uint64_t)(level) << VTD_IOTLB_LVL_SHIFT);
-}
-
 static uint64_t vtd_get_iotlb_gfn(hwaddr addr, uint32_t level)
 {
     return (addr & vtd_slpt_level_page_mask(level)) >> VTD_PAGE_SHIFT_4K;
@@ -320,15 +332,17 @@ static uint64_t vtd_get_iotlb_gfn(hwaddr addr, uint32_t level)
 
 /* Must be called with IOMMU lock held */
 static VTDIOTLBEntry *vtd_lookup_iotlb(IntelIOMMUState *s, uint16_t source_id,
-                                       hwaddr addr)
+                                       hwaddr addr, uint32_t pasid)
 {
+    struct vtd_iotlb_key key;
     VTDIOTLBEntry *entry;
-    uint64_t key;
     int level;
 
     for (level = VTD_SL_PT_LEVEL; level < VTD_SL_PML4_LEVEL; level++) {
-        key = vtd_get_iotlb_key(vtd_get_iotlb_gfn(addr, level),
-                                source_id, level);
+        key.gfn = vtd_get_iotlb_gfn(addr, level);
+        key.level = level;
+        key.sid = source_id;
+        key.pasid = pasid;
         entry = g_hash_table_lookup(s->iotlb, &key);
         if (entry) {
             goto out;
@@ -342,10 +356,11 @@ out:
 /* Must be with IOMMU lock held */
 static void vtd_update_iotlb(IntelIOMMUState *s, uint16_t source_id,
                              uint16_t domain_id, hwaddr addr, uint64_t slpte,
-                             uint8_t access_flags, uint32_t level)
+                             uint8_t access_flags, uint32_t level,
+                             uint32_t pasid)
 {
     VTDIOTLBEntry *entry = g_malloc(sizeof(*entry));
-    uint64_t *key = g_malloc(sizeof(*key));
+    struct vtd_iotlb_key *key = g_malloc(sizeof(*key));
     uint64_t gfn = vtd_get_iotlb_gfn(addr, level);
 
     trace_vtd_iotlb_page_update(source_id, addr, slpte, domain_id);
@@ -359,7 +374,13 @@ static void vtd_update_iotlb(IntelIOMMUState *s, uint16_t source_id,
     entry->slpte = slpte;
     entry->access_flags = access_flags;
     entry->mask = vtd_slpt_level_page_mask(level);
-    *key = vtd_get_iotlb_key(gfn, source_id, level);
+    entry->pasid = pasid;
+
+    key->gfn = gfn;
+    key->sid = source_id;
+    key->level = level;
+    key->pasid = pasid;
+
     g_hash_table_replace(s->iotlb, key, entry);
 }
 
@@ -823,13 +844,15 @@ static int vtd_get_pe_from_pasid_table(IntelIOMMUState *s,
 
 static int vtd_ce_get_rid2pasid_entry(IntelIOMMUState *s,
                                       VTDContextEntry *ce,
-                                      VTDPASIDEntry *pe)
+                                      VTDPASIDEntry *pe,
+                                      uint32_t pasid)
 {
-    uint32_t pasid;
     dma_addr_t pasid_dir_base;
     int ret = 0;
 
-    pasid = VTD_CE_GET_RID2PASID(ce);
+    if (pasid == PCI_NO_PASID) {
+        pasid = VTD_CE_GET_RID2PASID(ce);
+    }
     pasid_dir_base = VTD_CE_GET_PASID_DIR_TABLE(ce);
     ret = vtd_get_pe_from_pasid_table(s, pasid_dir_base, pasid, pe);
 
@@ -838,15 +861,17 @@ static int vtd_ce_get_rid2pasid_entry(IntelIOMMUState *s,
 
 static int vtd_ce_get_pasid_fpd(IntelIOMMUState *s,
                                 VTDContextEntry *ce,
-                                bool *pe_fpd_set)
+                                bool *pe_fpd_set,
+                                uint32_t pasid)
 {
     int ret;
-    uint32_t pasid;
     dma_addr_t pasid_dir_base;
     VTDPASIDDirEntry pdire;
     VTDPASIDEntry pe;
 
-    pasid = VTD_CE_GET_RID2PASID(ce);
+    if (pasid == PCI_NO_PASID) {
+        pasid = VTD_CE_GET_RID2PASID(ce);
+    }
     pasid_dir_base = VTD_CE_GET_PASID_DIR_TABLE(ce);
 
     /*
@@ -892,12 +917,13 @@ static inline uint32_t vtd_ce_get_level(VTDContextEntry *ce)
 }
 
 static uint32_t vtd_get_iova_level(IntelIOMMUState *s,
-                                   VTDContextEntry *ce)
+                                   VTDContextEntry *ce,
+                                   uint32_t pasid)
 {
     VTDPASIDEntry pe;
 
     if (s->root_scalable) {
-        vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        vtd_ce_get_rid2pasid_entry(s, ce, &pe, pasid);
         return VTD_PE_GET_LEVEL(&pe);
     }
 
@@ -910,12 +936,13 @@ static inline uint32_t vtd_ce_get_agaw(VTDContextEntry *ce)
 }
 
 static uint32_t vtd_get_iova_agaw(IntelIOMMUState *s,
-                                  VTDContextEntry *ce)
+                                  VTDContextEntry *ce,
+                                  uint32_t pasid)
 {
     VTDPASIDEntry pe;
 
     if (s->root_scalable) {
-        vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        vtd_ce_get_rid2pasid_entry(s, ce, &pe, pasid);
         return 30 + ((pe.val[0] >> 2) & VTD_SM_PASID_ENTRY_AW) * 9;
     }
 
@@ -957,31 +984,33 @@ static inline bool vtd_ce_type_check(X86IOMMUState *x86_iommu,
 }
 
 static inline uint64_t vtd_iova_limit(IntelIOMMUState *s,
-                                      VTDContextEntry *ce, uint8_t aw)
+                                      VTDContextEntry *ce, uint8_t aw,
+                                      uint32_t pasid)
 {
-    uint32_t ce_agaw = vtd_get_iova_agaw(s, ce);
+    uint32_t ce_agaw = vtd_get_iova_agaw(s, ce, pasid);
     return 1ULL << MIN(ce_agaw, aw);
 }
 
 /* Return true if IOVA passes range check, otherwise false. */
 static inline bool vtd_iova_range_check(IntelIOMMUState *s,
                                         uint64_t iova, VTDContextEntry *ce,
-                                        uint8_t aw)
+                                        uint8_t aw, uint32_t pasid)
 {
     /*
      * Check if @iova is above 2^X-1, where X is the minimum of MGAW
      * in CAP_REG and AW in context-entry.
      */
-    return !(iova & ~(vtd_iova_limit(s, ce, aw) - 1));
+    return !(iova & ~(vtd_iova_limit(s, ce, aw, pasid) - 1));
 }
 
 static dma_addr_t vtd_get_iova_pgtbl_base(IntelIOMMUState *s,
-                                          VTDContextEntry *ce)
+                                          VTDContextEntry *ce,
+                                          uint32_t pasid)
 {
     VTDPASIDEntry pe;
 
     if (s->root_scalable) {
-        vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        vtd_ce_get_rid2pasid_entry(s, ce, &pe, pasid);
         return pe.val[0] & VTD_SM_PASID_ENTRY_SLPTPTR;
     }
 
@@ -1015,16 +1044,17 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
 static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
                              uint64_t iova, bool is_write,
                              uint64_t *slptep, uint32_t *slpte_level,
-                             bool *reads, bool *writes, uint8_t aw_bits)
+                             bool *reads, bool *writes, uint8_t aw_bits,
+                             uint32_t pasid)
 {
-    dma_addr_t addr = vtd_get_iova_pgtbl_base(s, ce);
-    uint32_t level = vtd_get_iova_level(s, ce);
+    dma_addr_t addr = vtd_get_iova_pgtbl_base(s, ce, pasid);
+    uint32_t level = vtd_get_iova_level(s, ce, pasid);
     uint32_t offset;
     uint64_t slpte;
     uint64_t access_right_check;
     uint64_t xlat, size;
 
-    if (!vtd_iova_range_check(s, iova, ce, aw_bits)) {
+    if (!vtd_iova_range_check(s, iova, ce, aw_bits, pasid)) {
         error_report_once("%s: detected IOVA overflow (iova=0x%" PRIx64 ")",
                           __func__, iova);
         return -VTD_FR_ADDR_BEYOND_MGAW;
@@ -1040,7 +1070,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
         if (slpte == (uint64_t)-1) {
             error_report_once("%s: detected read error on DMAR slpte "
                               "(iova=0x%" PRIx64 ")", __func__, iova);
-            if (level == vtd_get_iova_level(s, ce)) {
+            if (level == vtd_get_iova_level(s, ce, pasid)) {
                 /* Invalid programming of context-entry */
                 return -VTD_FR_CONTEXT_ENTRY_INV;
             } else {
@@ -1304,18 +1334,19 @@ next:
  */
 static int vtd_page_walk(IntelIOMMUState *s, VTDContextEntry *ce,
                          uint64_t start, uint64_t end,
-                         vtd_page_walk_info *info)
+                         vtd_page_walk_info *info,
+                         uint32_t pasid)
 {
-    dma_addr_t addr = vtd_get_iova_pgtbl_base(s, ce);
-    uint32_t level = vtd_get_iova_level(s, ce);
+    dma_addr_t addr = vtd_get_iova_pgtbl_base(s, ce, pasid);
+    uint32_t level = vtd_get_iova_level(s, ce, pasid);
 
-    if (!vtd_iova_range_check(s, start, ce, info->aw)) {
+    if (!vtd_iova_range_check(s, start, ce, info->aw, pasid)) {
         return -VTD_FR_ADDR_BEYOND_MGAW;
     }
 
-    if (!vtd_iova_range_check(s, end, ce, info->aw)) {
+    if (!vtd_iova_range_check(s, end, ce, info->aw, pasid)) {
         /* Fix end so that it reaches the maximum */
-        end = vtd_iova_limit(s, ce, info->aw);
+        end = vtd_iova_limit(s, ce, info->aw, pasid);
     }
 
     return vtd_page_walk_level(addr, start, end, level, true, true, info);
@@ -1383,7 +1414,7 @@ static int vtd_ce_rid2pasid_check(IntelIOMMUState *s,
      * has valid rid2pasid setting, which includes valid
      * rid2pasid field and corresponding pasid entry setting
      */
-    return vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+    return vtd_ce_get_rid2pasid_entry(s, ce, &pe, PCI_NO_PASID);
 }
 
 /* Map a device to its corresponding domain (context-entry) */
@@ -1466,12 +1497,13 @@ static int vtd_sync_shadow_page_hook(IOMMUTLBEvent *event,
 }
 
 static uint16_t vtd_get_domain_id(IntelIOMMUState *s,
-                                  VTDContextEntry *ce)
+                                  VTDContextEntry *ce,
+                                  uint32_t pasid)
 {
     VTDPASIDEntry pe;
 
     if (s->root_scalable) {
-        vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        vtd_ce_get_rid2pasid_entry(s, ce, &pe, pasid);
         return VTD_SM_PASID_ENTRY_DID(pe.val[1]);
     }
 
@@ -1489,10 +1521,10 @@ static int vtd_sync_shadow_page_table_range(VTDAddressSpace *vtd_as,
         .notify_unmap = true,
         .aw = s->aw_bits,
         .as = vtd_as,
-        .domain_id = vtd_get_domain_id(s, ce),
+        .domain_id = vtd_get_domain_id(s, ce, vtd_as->pasid),
     };
 
-    return vtd_page_walk(s, ce, addr, addr + size, &info);
+    return vtd_page_walk(s, ce, addr, addr + size, &info, vtd_as->pasid);
 }
 
 static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
@@ -1536,13 +1568,14 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
  * 1st-level translation or 2nd-level translation, it depends
  * on PGTT setting.
  */
-static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
+static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce,
+                               uint32_t pasid)
 {
     VTDPASIDEntry pe;
     int ret;
 
     if (s->root_scalable) {
-        ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe, pasid);
         if (ret) {
             /*
              * This error is guest triggerable. We should assumt PT
@@ -1578,19 +1611,20 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
         return false;
     }
 
-    return vtd_dev_pt_enabled(s, &ce);
+    return vtd_dev_pt_enabled(s, &ce, as->pasid);
 }
 
 /* Return whether the device is using IOMMU translation. */
 static bool vtd_switch_address_space(VTDAddressSpace *as)
 {
-    bool use_iommu;
+    bool use_iommu, pt;
     /* Whether we need to take the BQL on our own */
     bool take_bql = !qemu_mutex_iothread_locked();
 
     assert(as);
 
     use_iommu = as->iommu_state->dmar_enabled && !vtd_as_pt_enabled(as);
+    pt = as->iommu_state->dmar_enabled && vtd_as_pt_enabled(as);
 
     trace_vtd_switch_address_space(pci_bus_num(as->bus),
                                    VTD_PCI_SLOT(as->devfn),
@@ -1610,11 +1644,53 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
     if (use_iommu) {
         memory_region_set_enabled(&as->nodmar, false);
         memory_region_set_enabled(MEMORY_REGION(&as->iommu), true);
+        /*
+         * vt-d spec v3.4 3.14:
+         *
+         * """
+         * Requests-with-PASID with input address in range 0xFEEx_xxxx
+         * are translated normally like any other request-with-PASID
+         * through DMA-remapping hardware.
+         * """
+         *
+         * Need to disable ir for as with PASID.
+         */
+        if (as->pasid != PCI_NO_PASID) {
+            memory_region_set_enabled(&as->iommu_ir, false);
+        } else {
+            memory_region_set_enabled(&as->iommu_ir, true);
+        }
     } else {
         memory_region_set_enabled(MEMORY_REGION(&as->iommu), false);
         memory_region_set_enabled(&as->nodmar, true);
     }
 
+    /*
+     * vtd-spec v3.4 3.14:
+     *
+     * """
+     * Requests-with-PASID with input address in range 0xFEEx_xxxx are
+     * translated normally like any other request-with-PASID through
+     * DMA-remapping hardware. However, if such a request is processed
+     * using pass-through translation, it will be blocked as described
+     * in the paragraph below.
+     *
+     * Software must not program paging-structure entries to remap any
+     * address to the interrupt address range. Untranslated requests
+     * and translation requests that result in an address in the
+     * interrupt range will be blocked with condition code LGN.4 or
+     * SGN.8.
+     * """
+     *
+     * We enable per as memory region (iommu_ir_fault) for catching
+     * the tranlsation for interrupt range through PASID + PT.
+     */
+    if (pt && as->pasid != PCI_NO_PASID) {
+        memory_region_set_enabled(&as->iommu_ir_fault, true);
+    } else {
+        memory_region_set_enabled(&as->iommu_ir_fault, false);
+    }
+
     if (take_bql) {
         qemu_mutex_unlock_iothread();
     }
@@ -1747,13 +1823,14 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
     uint8_t bus_num = pci_bus_num(bus);
     VTDContextCacheEntry *cc_entry;
     uint64_t slpte, page_mask;
-    uint32_t level;
+    uint32_t level, pasid = vtd_as->pasid;
     uint16_t source_id = vtd_make_source_id(bus_num, devfn);
     int ret_fr;
     bool is_fpd_set = false;
     bool reads = true;
     bool writes = true;
     uint8_t access_flags;
+    bool rid2pasid = (pasid == PCI_NO_PASID) && s->root_scalable;
     VTDIOTLBEntry *iotlb_entry;
 
     /*
@@ -1766,15 +1843,17 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
 
     cc_entry = &vtd_as->context_cache_entry;
 
-    /* Try to fetch slpte form IOTLB */
-    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr);
-    if (iotlb_entry) {
-        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
-                                 iotlb_entry->domain_id);
-        slpte = iotlb_entry->slpte;
-        access_flags = iotlb_entry->access_flags;
-        page_mask = iotlb_entry->mask;
-        goto out;
+    /* Try to fetch slpte form IOTLB, we don't need RID2PASID logic */
+    if (!rid2pasid) {
+        iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
+        if (iotlb_entry) {
+            trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
+                                     iotlb_entry->domain_id);
+            slpte = iotlb_entry->slpte;
+            access_flags = iotlb_entry->access_flags;
+            page_mask = iotlb_entry->mask;
+            goto out;
+        }
     }
 
     /* Try to fetch context-entry from cache first */
@@ -1785,7 +1864,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         ce = cc_entry->context_entry;
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!is_fpd_set && s->root_scalable) {
-            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
+            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set, pasid);
             if (ret_fr) {
                 vtd_qualify_report_fault(s, -ret_fr, is_fpd_set,
                                          source_id, addr, is_write);
@@ -1796,7 +1875,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!ret_fr && !is_fpd_set && s->root_scalable) {
-            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
+            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set, pasid);
         }
         if (ret_fr) {
             vtd_qualify_report_fault(s, -ret_fr, is_fpd_set,
@@ -1811,11 +1890,15 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         cc_entry->context_cache_gen = s->context_cache_gen;
     }
 
+    if (rid2pasid) {
+        pasid = VTD_CE_GET_RID2PASID(&ce);
+    }
+
     /*
      * We don't need to translate for pass-through context entries.
      * Also, let's ignore IOTLB caching as well for PT devices.
      */
-    if (vtd_dev_pt_enabled(s, &ce)) {
+    if (vtd_dev_pt_enabled(s, &ce, pasid)) {
         entry->iova = addr & VTD_PAGE_MASK_4K;
         entry->translated_addr = entry->iova;
         entry->addr_mask = ~VTD_PAGE_MASK_4K;
@@ -1836,8 +1919,21 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         return true;
     }
 
+    /* Try to fetch slpte form IOTLB for RID2PASID slow path */
+    if (rid2pasid) {
+        iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
+        if (iotlb_entry) {
+            trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
+                                     iotlb_entry->domain_id);
+            slpte = iotlb_entry->slpte;
+            access_flags = iotlb_entry->access_flags;
+            page_mask = iotlb_entry->mask;
+            goto out;
+        }
+    }
+
     ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
-                               &reads, &writes, s->aw_bits);
+                               &reads, &writes, s->aw_bits, pasid);
     if (ret_fr) {
         vtd_qualify_report_fault(s, -ret_fr, is_fpd_set, source_id,
                                  addr, is_write);
@@ -1846,8 +1942,8 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
 
     page_mask = vtd_slpt_level_page_mask(level);
     access_flags = IOMMU_ACCESS_FLAG(reads, writes);
-    vtd_update_iotlb(s, source_id, vtd_get_domain_id(s, &ce), addr, slpte,
-                     access_flags, level);
+    vtd_update_iotlb(s, source_id, vtd_get_domain_id(s, &ce, pasid),
+                     addr, slpte, access_flags, level, pasid);
 out:
     vtd_iommu_unlock(s);
     entry->iova = addr & page_mask;
@@ -2039,7 +2135,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
-            domain_id == vtd_get_domain_id(s, &ce)) {
+            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
             vtd_sync_shadow_page_table(vtd_as);
         }
     }
@@ -2047,7 +2143,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
 
 static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                                            uint16_t domain_id, hwaddr addr,
-                                           uint8_t am)
+                                             uint8_t am, uint32_t pasid)
 {
     VTDAddressSpace *vtd_as;
     VTDContextEntry ce;
@@ -2055,9 +2151,11 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
     hwaddr size = (1 << am) * VTD_PAGE_SIZE;
 
     QLIST_FOREACH(vtd_as, &(s->vtd_as_with_notifiers), next) {
+        if (pasid != PCI_NO_PASID && pasid != vtd_as->pasid)
+            continue;
         ret = vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                        vtd_as->devfn, &ce);
-        if (!ret && domain_id == vtd_get_domain_id(s, &ce)) {
+        if (!ret && domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
             if (vtd_as_has_map_notifier(vtd_as)) {
                 /*
                  * As long as we have MAP notifications registered in
@@ -2101,7 +2199,7 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
     vtd_iommu_lock(s);
     g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
     vtd_iommu_unlock(s);
-    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
+    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
 }
 
 /* Flush IOTLB
@@ -3168,6 +3266,7 @@ static Property vtd_properties[] = {
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
     DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
+    DEFINE_PROP_BOOL("x-pasid-mode", IntelIOMMUState, pasid, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3441,7 +3540,63 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
     },
 };
 
-VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
+static void vtd_report_ir_illegal_access(VTDAddressSpace *vtd_as,
+                                         hwaddr addr, bool is_write)
+{
+    IntelIOMMUState *s = vtd_as->iommu_state;
+    uint8_t bus_n = pci_bus_num(vtd_as->bus);
+    uint16_t sid = vtd_make_source_id(bus_n, vtd_as->devfn);
+    bool is_fpd_set = false;
+    VTDContextEntry ce;
+
+    assert(vtd_as->pasid != PCI_NO_PASID);
+
+    /* Try out best to fetch FPD, we can't do anything more */
+    if (vtd_dev_to_context_entry(s, bus_n, vtd_as->devfn, &ce) == 0) {
+        is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
+        if (!is_fpd_set && s->root_scalable) {
+            vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set, vtd_as->pasid);
+        }
+    }
+
+    vtd_qualify_report_fault(s, VTD_FR_SM_INTERRUPT_ADDR,
+                             is_fpd_set, sid, addr, is_write);
+}
+
+static MemTxResult vtd_mem_ir_fault_read(void *opaque, hwaddr addr,
+                                         uint64_t *data, unsigned size,
+                                         MemTxAttrs attrs)
+{
+    vtd_report_ir_illegal_access(opaque, addr, false);
+
+    return MEMTX_ERROR;
+}
+
+static MemTxResult vtd_mem_ir_fault_write(void *opaque, hwaddr addr,
+                                          uint64_t value, unsigned size,
+                                          MemTxAttrs attrs)
+{
+    vtd_report_ir_illegal_access(opaque, addr, true);
+
+    return MEMTX_ERROR;
+}
+
+static const MemoryRegionOps vtd_mem_ir_fault_ops = {
+    .read_with_attrs = vtd_mem_ir_fault_read,
+    .write_with_attrs = vtd_mem_ir_fault_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus,
+                                 int devfn, unsigned int pasid)
 {
     /*
      * We can't simply use sid here since the bus number might not be
@@ -3450,6 +3605,7 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
     struct vtd_as_key key = {
         .bus = bus,
         .devfn = devfn,
+        .pasid = pasid,
     };
     VTDAddressSpace *vtd_dev_as;
     char name[128];
@@ -3460,13 +3616,21 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 
         new_key->bus = bus;
         new_key->devfn = devfn;
+        new_key->pasid = pasid;
+
+        if (pasid == PCI_NO_PASID) {
+            snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
+                     PCI_FUNC(devfn));
+        } else {
+            snprintf(name, sizeof(name), "vtd-%02x.%x-pasid-%x", PCI_SLOT(devfn),
+                     PCI_FUNC(devfn), pasid);
+        }
 
-        snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
-                 PCI_FUNC(devfn));
         vtd_dev_as = g_malloc0(sizeof(VTDAddressSpace));
 
         vtd_dev_as->bus = bus;
         vtd_dev_as->devfn = (uint8_t)devfn;
+        vtd_dev_as->pasid = pasid;
         vtd_dev_as->iommu_state = s;
         vtd_dev_as->context_cache_entry.context_cache_gen = 0;
         vtd_dev_as->iova_tree = iova_tree_new();
@@ -3507,6 +3671,24 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
                                             VTD_INTERRUPT_ADDR_FIRST,
                                             &vtd_dev_as->iommu_ir, 1);
 
+        /*
+         * This region is used for catching fault to access interrupt
+         * range via passthrough + PASID. See also
+         * vtd_switch_address_space(). We can't use alias since we
+         * need to know the sid which is valid for MSI who uses
+         * bus_master_as (see msi_send_message()).
+         */
+        memory_region_init_io(&vtd_dev_as->iommu_ir_fault, OBJECT(s),
+                              &vtd_mem_ir_fault_ops, vtd_dev_as, "vtd-no-ir",
+                              VTD_INTERRUPT_ADDR_SIZE);
+        /*
+         * Hook to root since when PT is enabled vtd_dev_as->iommu
+         * will be disabled.
+         */
+        memory_region_add_subregion_overlap(MEMORY_REGION(&vtd_dev_as->root),
+                                            VTD_INTERRUPT_ADDR_FIRST,
+                                            &vtd_dev_as->iommu_ir_fault, 2);
+
         /*
          * Hook both the containers under the root container, we
          * switch between DMAR & noDMAR by enable/disable
@@ -3627,7 +3809,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                                   "legacy mode",
                                   bus_n, PCI_SLOT(vtd_as->devfn),
                                   PCI_FUNC(vtd_as->devfn),
-                                  vtd_get_domain_id(s, &ce),
+                                  vtd_get_domain_id(s, &ce, vtd_as->pasid),
                                   ce.hi, ce.lo);
         if (vtd_as_has_map_notifier(vtd_as)) {
             /* This is required only for MAP typed notifiers */
@@ -3637,10 +3819,10 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                 .notify_unmap = false,
                 .aw = s->aw_bits,
                 .as = vtd_as,
-                .domain_id = vtd_get_domain_id(s, &ce),
+                .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
             };
 
-            vtd_page_walk(s, &ce, 0, ~0ULL, &info);
+            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
         }
     } else {
         trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
@@ -3735,6 +3917,10 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SC;
     }
 
+    if (s->pasid) {
+        s->ecap |= VTD_ECAP_PASID;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
@@ -3808,7 +3994,7 @@ static AddressSpace *vtd_host_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
     assert(0 <= devfn && devfn < PCI_DEVFN_MAX);
 
-    vtd_as = vtd_find_add_as(s, bus, devfn);
+    vtd_as = vtd_find_add_as(s, bus, devfn, PCI_NO_PASID);
     return &vtd_as->as;
 }
 
@@ -3851,6 +4037,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
         return false;
     }
 
+    if (s->pasid && !s->scalable_mode) {
+        error_setg(errp, "Need to set PASID for scalable mode");
+        return false;
+    }
+
     return true;
 }
 
@@ -3913,7 +4104,7 @@ static void vtd_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->csrmem);
     /* No corresponding destroy */
-    s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
+    s->iotlb = g_hash_table_new_full(vtd_iotlb_hash, vtd_iotlb_equal,
                                      g_free, g_free);
     s->vtd_as = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
                                       g_free, g_free);
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 930ce61feb..f6d1fae79b 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -114,8 +114,9 @@
                                      VTD_INTERRUPT_ADDR_FIRST + 1)
 
 /* The shift of source_id in the key of IOTLB hash table */
-#define VTD_IOTLB_SID_SHIFT         36
-#define VTD_IOTLB_LVL_SHIFT         52
+#define VTD_IOTLB_SID_SHIFT         20
+#define VTD_IOTLB_LVL_SHIFT         28
+#define VTD_IOTLB_PASID_SHIFT       30
 #define VTD_IOTLB_MAX_SIZE          1024    /* Max size of the hash table */
 
 /* IOTLB_REG */
@@ -191,6 +192,7 @@
 #define VTD_ECAP_SC                 (1ULL << 7)
 #define VTD_ECAP_MHMV               (15ULL << 20)
 #define VTD_ECAP_SRS                (1ULL << 31)
+#define VTD_ECAP_PASID              (1ULL << 40)
 #define VTD_ECAP_SMTS               (1ULL << 43)
 #define VTD_ECAP_SLTS               (1ULL << 46)
 
@@ -211,6 +213,8 @@
 #define VTD_CAP_DRAIN_READ          (1ULL << 55)
 #define VTD_CAP_DRAIN               (VTD_CAP_DRAIN_READ | VTD_CAP_DRAIN_WRITE)
 #define VTD_CAP_CM                  (1ULL << 7)
+#define VTD_PASID_ID_SHIFT          20
+#define VTD_PASID_ID_MASK           ((1ULL << VTD_PASID_ID_SHIFT) - 1)
 
 /* Supported Adjusted Guest Address Widths */
 #define VTD_CAP_SAGAW_SHIFT         8
@@ -379,6 +383,11 @@ typedef union VTDInvDesc VTDInvDesc;
 #define VTD_INV_DESC_IOTLB_AM(val)      ((val) & 0x3fULL)
 #define VTD_INV_DESC_IOTLB_RSVD_LO      0xffffffff0000ff00ULL
 #define VTD_INV_DESC_IOTLB_RSVD_HI      0xf80ULL
+#define VTD_INV_DESC_IOTLB_PASID_PASID  (2ULL << 4)
+#define VTD_INV_DESC_IOTLB_PASID_PAGE   (3ULL << 4)
+#define VTD_INV_DESC_IOTLB_PASID(val)   (((val) >> 32) & VTD_PASID_ID_MASK)
+#define VTD_INV_DESC_IOTLB_PASID_RSVD_LO      0xfff00000000001c0ULL
+#define VTD_INV_DESC_IOTLB_PASID_RSVD_HI      0xf80ULL
 
 /* Mask for Device IOTLB Invalidate Descriptor */
 #define VTD_INV_DESC_DEVICE_IOTLB_ADDR(val) ((val) & 0xfffffffffffff000ULL)
@@ -413,6 +422,7 @@ typedef union VTDInvDesc VTDInvDesc;
 /* Information about page-selective IOTLB invalidate */
 struct VTDIOTLBPageInvInfo {
     uint16_t domain_id;
+    uint32_t pasid;
     uint64_t addr;
     uint8_t mask;
 };
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index 5bf7e52bf5..57beff0c17 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -12,6 +12,8 @@ vtd_inv_desc_cc_devices(uint16_t sid, uint16_t fmask) "context invalidate device
 vtd_inv_desc_iotlb_global(void) "iotlb invalidate global"
 vtd_inv_desc_iotlb_domain(uint16_t domain) "iotlb invalidate whole domain 0x%"PRIx16
 vtd_inv_desc_iotlb_pages(uint16_t domain, uint64_t addr, uint8_t mask) "iotlb invalidate domain 0x%"PRIx16" addr 0x%"PRIx64" mask 0x%"PRIx8
+vtd_inv_desc_iotlb_pasid_pages(uint16_t domain, uint64_t addr, uint8_t mask, uint32_t pasid) "iotlb invalidate domain 0x%"PRIx16" addr 0x%"PRIx64" mask 0x%"PRIx8" pasid 0x%"PRIx32
+vtd_inv_desc_iotlb_pasid(uint16_t domain, uint32_t pasid) "iotlb invalidate domain 0x%"PRIx16" pasid 0x%"PRIx32
 vtd_inv_desc_wait_sw(uint64_t addr, uint32_t data) "wait invalidate status write addr 0x%"PRIx64" data 0x%"PRIx32
 vtd_inv_desc_wait_irq(const char *msg) "%s"
 vtd_inv_desc_wait_write_fail(uint64_t hi, uint64_t lo) "write fail for wait desc hi 0x%"PRIx64" lo 0x%"PRIx64
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index fa1bed353c..0d1029f366 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -97,11 +97,13 @@ struct VTDPASIDEntry {
 struct VTDAddressSpace {
     PCIBus *bus;
     uint8_t devfn;
+    uint32_t pasid;
     AddressSpace as;
     IOMMUMemoryRegion iommu;
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion nodmar;        /* The alias of shared nodmar MR */
     MemoryRegion iommu_ir;      /* Interrupt region: 0xfeeXXXXX */
+    MemoryRegion iommu_ir_fault; /* Interrupt region for catching fault */
     IntelIOMMUState *iommu_state;
     VTDContextCacheEntry context_cache_entry;
     QLIST_ENTRY(VTDAddressSpace) next;
@@ -113,6 +115,7 @@ struct VTDAddressSpace {
 struct VTDIOTLBEntry {
     uint64_t gfn;
     uint16_t domain_id;
+    uint32_t pasid;
     uint64_t slpte;
     uint64_t mask;
     uint8_t access_flags;
@@ -260,6 +263,7 @@ struct IntelIOMMUState {
     bool buggy_eim;                 /* Force buggy EIM unless eim=off */
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
+    bool pasid;                     /* Whether to support PASID */
 
     /*
      * Protects IOMMU states in general.  Currently it protects the
@@ -271,6 +275,7 @@ struct IntelIOMMUState {
 /* Find the VTD Address space associated with the given bus pointer,
  * create a new one if none exists
  */
-VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn);
+VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus,
+                                 int devfn, unsigned int pasid);
 
 #endif
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..cbfcf0b770 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -26,6 +26,8 @@ enum PCIBusFlags {
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
 };
 
+#define PCI_NO_PASID UINT32_MAX
+
 struct PCIBus {
     BusState qbus;
     enum PCIBusFlags flags;
-- 
2.25.1


