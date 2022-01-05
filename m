Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7C484D1D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:29:54 +0100 (CET)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xvt-0006T9-O4
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:29:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmu-0004Jx-Mc
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmr-0002eF-8S
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641356432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCmDNpVvtT0pyKj2wmQUmyT+5oPdaTSlJRNlvwrEyUo=;
 b=IdT7TQnJ7iG1v50e5G5ELxzLIEvgtj0Nollq48RsFPdz2VS9llLHj7rTlXdnaamG7gDwKo
 xryK54gI+snMeE9fiRFpUuVaJyB2zl6R9htyfBrJeIxxvyzNF1cB4w5p0fXeEI1PnShueP
 Ja4P3/8qY0fGo3VXD4voE0QoRMXQUVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-ihfTJekeNtiPWs9DFOdu7Q-1; Tue, 04 Jan 2022 23:20:29 -0500
X-MC-Unique: ihfTJekeNtiPWs9DFOdu7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0401023F4D;
 Wed,  5 Jan 2022 04:20:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F18E6ABAF;
 Wed,  5 Jan 2022 04:20:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 3/3] intel-iommu: PASID support
Date: Wed,  5 Jan 2022 12:19:45 +0800
Message-Id: <20220105041945.13459-5-jasowang@redhat.com>
In-Reply-To: <20220105041945.13459-1-jasowang@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For simplicity, PASID cache is not implemented so we can simply
implement the PASID cache flush as a nop. This could be added in the
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

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c          | 355 +++++++++++++++++++++++++--------
 hw/i386/intel_iommu_internal.h |  14 +-
 hw/i386/trace-events           |   2 +
 include/hw/i386/intel_iommu.h  |   6 +-
 include/hw/pci/pci_bus.h       |   2 +
 5 files changed, 289 insertions(+), 90 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 58c682097b..04ae604ea1 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -64,6 +64,14 @@
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
@@ -193,15 +201,36 @@ static inline gboolean vtd_as_has_map_notifier(VTDAddressSpace *as)
 }
 
 /* GHashTable functions */
-static gboolean vtd_uint64_equal(gconstpointer v1, gconstpointer v2)
+static gboolean vtd_iotlb_equal(gconstpointer v1, gconstpointer v2)
+{
+    const struct vtd_iotlb_key *key1 = v1;
+    const struct vtd_iotlb_key *key2 = v2;
+
+    return key1->sid == key2->sid &&
+           key1->pasid == key2->pasid &&
+           key1->level == key2->level &&
+           key1->gfn == key2->gfn;
+}
+
+static guint vtd_iotlb_hash(gconstpointer v)
+{
+    const struct vtd_iotlb_key *key = v;
+
+    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
+           (key->level) << VTD_IOTLB_LVL_SHIFT |
+           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
+}
+
+static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
 {
     const struct vtd_as_key *key1 = v1;
     const struct vtd_as_key *key2 = v2;
 
-    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
+    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn) &&
+           (key1->pasid == key2->pasid);
 }
 
-static guint vtd_uint64_hash(gconstpointer v)
+static guint vtd_as_hash(gconstpointer v)
 {
     const struct vtd_as_key *key = v;
     guint value = (guint)(uintptr_t)key->bus;
@@ -241,6 +270,29 @@ static gboolean vtd_hash_remove_by_page(gpointer key, gpointer value,
              (entry->gfn == gfn_tlb));
 }
 
+static gboolean vtd_hash_remove_by_page_pasid(gpointer key, gpointer value,
+                                              gpointer user_data)
+{
+    VTDIOTLBEntry *entry = (VTDIOTLBEntry *)value;
+    VTDIOTLBPageInvInfo *info = (VTDIOTLBPageInvInfo *)user_data;
+    uint64_t gfn = (info->addr >> VTD_PAGE_SHIFT_4K) & info->mask;
+    uint64_t gfn_tlb = (info->addr & entry->mask) >> VTD_PAGE_SHIFT_4K;
+    return (entry->domain_id == info->domain_id) &&
+           (entry->pasid == info->pasid) &&
+            (((entry->gfn & info->mask) == gfn) ||
+             (entry->gfn == gfn_tlb));
+}
+
+static gboolean vtd_hash_remove_by_pasid(gpointer key, gpointer value,
+                                         gpointer user_data)
+{
+    VTDIOTLBEntry *entry = (VTDIOTLBEntry *)value;
+    VTDIOTLBPageInvInfo *info = (VTDIOTLBPageInvInfo *)user_data;
+
+    return (entry->domain_id == info->domain_id) &&
+           (entry->pasid == info->pasid);
+}
+
 /* Reset all the gen of VTDAddressSpace to zero and set the gen of
  * IntelIOMMUState to 1.  Must be called with IOMMU lock held.
  */
@@ -281,13 +333,6 @@ static void vtd_reset_caches(IntelIOMMUState *s)
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
@@ -295,15 +340,17 @@ static uint64_t vtd_get_iotlb_gfn(hwaddr addr, uint32_t level)
 
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
@@ -317,10 +364,11 @@ out:
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
@@ -334,7 +382,13 @@ static void vtd_update_iotlb(IntelIOMMUState *s, uint16_t source_id,
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
 
@@ -803,13 +857,15 @@ static int vtd_get_pe_from_pasid_table(IntelIOMMUState *s,
 
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
 
@@ -818,15 +874,17 @@ static int vtd_ce_get_rid2pasid_entry(IntelIOMMUState *s,
 
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
@@ -872,12 +930,13 @@ static inline uint32_t vtd_ce_get_level(VTDContextEntry *ce)
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
 
@@ -890,12 +949,13 @@ static inline uint32_t vtd_ce_get_agaw(VTDContextEntry *ce)
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
 
@@ -937,31 +997,33 @@ static inline bool vtd_ce_type_check(X86IOMMUState *x86_iommu,
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
 
@@ -995,15 +1057,16 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
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
 
-    if (!vtd_iova_range_check(s, iova, ce, aw_bits)) {
+    if (!vtd_iova_range_check(s, iova, ce, aw_bits, pasid)) {
         error_report_once("%s: detected IOVA overflow (iova=0x%" PRIx64 ")",
                           __func__, iova);
         return -VTD_FR_ADDR_BEYOND_MGAW;
@@ -1019,7 +1082,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
         if (slpte == (uint64_t)-1) {
             error_report_once("%s: detected read error on DMAR slpte "
                               "(iova=0x%" PRIx64 ")", __func__, iova);
-            if (level == vtd_get_iova_level(s, ce)) {
+            if (level == vtd_get_iova_level(s, ce, pasid)) {
                 /* Invalid programming of context-entry */
                 return -VTD_FR_CONTEXT_ENTRY_INV;
             } else {
@@ -1261,18 +1324,19 @@ next:
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
@@ -1340,7 +1404,7 @@ static int vtd_ce_rid2pasid_check(IntelIOMMUState *s,
      * has valid rid2pasid setting, which includes valid
      * rid2pasid field and corresponding pasid entry setting
      */
-    return vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+    return vtd_ce_get_rid2pasid_entry(s, ce, &pe, PCI_NO_PASID);
 }
 
 /* Map a device to its corresponding domain (context-entry) */
@@ -1423,12 +1487,13 @@ static int vtd_sync_shadow_page_hook(IOMMUTLBEvent *event,
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
 
@@ -1446,10 +1511,10 @@ static int vtd_sync_shadow_page_table_range(VTDAddressSpace *vtd_as,
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
@@ -1493,13 +1558,14 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
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
@@ -1535,7 +1601,7 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
         return false;
     }
 
-    return vtd_dev_pt_enabled(s, &ce);
+    return vtd_dev_pt_enabled(s, &ce, as->pasid);
 }
 
 /* Return whether the device is using IOMMU translation. */
@@ -1669,7 +1735,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
     uint8_t bus_num = pci_bus_num(bus);
     VTDContextCacheEntry *cc_entry;
     uint64_t slpte, page_mask;
-    uint32_t level;
+    uint32_t level, pasid = vtd_as->pasid;
     uint16_t source_id = vtd_make_source_id(bus_num, devfn);
     int ret_fr;
     bool is_fpd_set = false;
@@ -1688,17 +1754,6 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
 
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
-    }
-
     /* Try to fetch context-entry from cache first */
     if (cc_entry->context_cache_gen == s->context_cache_gen) {
         trace_vtd_iotlb_cc_hit(bus_num, devfn, cc_entry->context_entry.hi,
@@ -1707,14 +1762,14 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         ce = cc_entry->context_entry;
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!is_fpd_set && s->root_scalable) {
-            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
+            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set, pasid);
             VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
         }
     } else {
         ret_fr = vtd_dev_to_context_entry(s, bus_num, devfn, &ce);
         is_fpd_set = ce.lo & VTD_CONTEXT_ENTRY_FPD;
         if (!ret_fr && !is_fpd_set && s->root_scalable) {
-            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set);
+            ret_fr = vtd_ce_get_pasid_fpd(s, &ce, &is_fpd_set, pasid);
         }
         VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
         /* Update context-cache */
@@ -1725,11 +1780,16 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         cc_entry->context_cache_gen = s->context_cache_gen;
     }
 
+    /* Try to fetch slpte form IOTLB */
+    if ((pasid == PCI_NO_PASID) && s->root_scalable) {
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
@@ -1750,14 +1810,24 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
         return true;
     }
 
+    iotlb_entry = vtd_lookup_iotlb(s, source_id, addr, pasid);
+    if (iotlb_entry) {
+        trace_vtd_iotlb_page_hit(source_id, addr, iotlb_entry->slpte,
+                                 iotlb_entry->domain_id);
+        slpte = iotlb_entry->slpte;
+        access_flags = iotlb_entry->access_flags;
+        page_mask = iotlb_entry->mask;
+        goto out;
+    }
+
     ret_fr = vtd_iova_to_slpte(s, &ce, addr, is_write, &slpte, &level,
-                               &reads, &writes, s->aw_bits);
+                               &reads, &writes, s->aw_bits, pasid);
     VTD_PE_GET_FPD_ERR(ret_fr, is_fpd_set, s, source_id, addr, is_write);
 
     page_mask = vtd_slpt_level_page_mask(level);
     access_flags = IOMMU_ACCESS_FLAG(reads, writes);
-    vtd_update_iotlb(s, source_id, vtd_get_domain_id(s, &ce), addr, slpte,
-                     access_flags, level);
+    vtd_update_iotlb(s, source_id, vtd_get_domain_id(s, &ce, pasid),
+                     addr, slpte, access_flags, level, pasid);
 out:
     vtd_iommu_unlock(s);
     entry->iova = addr & page_mask;
@@ -1949,7 +2019,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
     QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
         if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
                                       vtd_as->devfn, &ce) &&
-            domain_id == vtd_get_domain_id(s, &ce)) {
+            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
             vtd_sync_shadow_page_table(vtd_as);
         }
     }
@@ -1957,7 +2027,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
 
 static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                                            uint16_t domain_id, hwaddr addr,
-                                           uint8_t am)
+                                             uint8_t am, uint32_t pasid)
 {
     VTDAddressSpace *vtd_as;
     VTDContextEntry ce;
@@ -1965,9 +2035,11 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
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
@@ -2011,7 +2083,52 @@ static void vtd_iotlb_page_invalidate(IntelIOMMUState *s, uint16_t domain_id,
     vtd_iommu_lock(s);
     g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page, &info);
     vtd_iommu_unlock(s);
-    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am);
+    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, PCI_NO_PASID);
+}
+
+static void vtd_iotlb_page_pasid_invalidate(IntelIOMMUState *s,
+                                            uint16_t domain_id,
+                                            hwaddr addr, uint8_t am,
+                                            uint32_t pasid)
+{
+    VTDIOTLBPageInvInfo info;
+
+    trace_vtd_inv_desc_iotlb_pasid_pages(domain_id, addr, am, pasid);
+
+    assert(am <= VTD_MAMV);
+    info.domain_id = domain_id;
+    info.addr = addr;
+    info.mask = ~((1 << am) - 1);
+    info.pasid = pasid;
+    vtd_iommu_lock(s);
+    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_page_pasid, &info);
+    vtd_iommu_unlock(s);
+    vtd_iotlb_page_invalidate_notify(s, domain_id, addr, am, pasid);
+}
+
+static void vtd_iotlb_pasid_invalidate(IntelIOMMUState *s, uint16_t domain_id,
+                                       uint32_t pasid)
+{
+    VTDIOTLBPageInvInfo info;
+    VTDAddressSpace *vtd_as;
+    VTDContextEntry ce;
+
+    trace_vtd_inv_desc_iotlb_pasid(domain_id, pasid);
+
+    info.domain_id = domain_id;
+    info.pasid = pasid;
+    vtd_iommu_lock(s);
+    g_hash_table_foreach_remove(s->iotlb, vtd_hash_remove_by_pasid, &info);
+    vtd_iommu_unlock(s);
+
+    QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
+        if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
+                                      vtd_as->devfn, &ce) &&
+            domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid) &&
+            pasid == vtd_as->pasid) {
+            vtd_sync_shadow_page_table(vtd_as);
+        }
+    }
 }
 
 /* Flush IOTLB
@@ -2388,6 +2505,52 @@ static bool vtd_process_iotlb_desc(IntelIOMMUState *s, VTDInvDesc *inv_desc)
     return true;
 }
 
+static bool vtd_process_iotlb_pasid_desc(IntelIOMMUState *s,
+                                         VTDInvDesc *inv_desc)
+{
+    uint32_t pasid;
+    uint16_t domain_id;
+    uint8_t am;
+    hwaddr addr;
+
+    if ((inv_desc->lo & VTD_INV_DESC_IOTLB_PASID_RSVD_LO) ||
+        (inv_desc->hi & VTD_INV_DESC_IOTLB_PASID_RSVD_HI)) {
+        error_report_once("%s: invalid iotlb pasid inv desc: hi=0x%"PRIx64
+                          ", lo=0x%"PRIx64" (reserved bits unzero)",
+                          __func__, inv_desc->hi, inv_desc->lo);
+        return false;
+    }
+
+    switch (inv_desc->lo & VTD_INV_DESC_IOTLB_G) {
+    case VTD_INV_DESC_IOTLB_PASID_PASID:
+        domain_id = VTD_INV_DESC_IOTLB_DID(inv_desc->lo);
+        pasid = VTD_INV_DESC_IOTLB_PASID(inv_desc->lo);
+        vtd_iotlb_pasid_invalidate(s, domain_id, pasid);
+        break;
+    case VTD_INV_DESC_IOTLB_PASID_PAGE:
+        domain_id = VTD_INV_DESC_IOTLB_DID(inv_desc->lo);
+        pasid = VTD_INV_DESC_IOTLB_PASID(inv_desc->lo);
+        addr = VTD_INV_DESC_IOTLB_ADDR(inv_desc->hi);
+        am = VTD_INV_DESC_IOTLB_AM(inv_desc->hi);
+        if (am > VTD_MAMV) {
+            error_report_once("%s: invalid iotlb inv desc: hi=0x%"PRIx64
+                              ", lo=0x%"PRIx64" (am=%u > VTD_MAMV=%u)",
+                              __func__, inv_desc->hi, inv_desc->lo,
+                              am, (unsigned)VTD_MAMV);
+            return false;
+        }
+        vtd_iotlb_page_pasid_invalidate(s, domain_id, addr, am, pasid);
+        break;
+    default:
+        error_report_once("%s: invalid iotlb pasid inv desc: hi=0x%"PRIx64
+                          ", lo=0x%"PRIx64" (type mismatch: 0x%llx)",
+                          __func__, inv_desc->hi, inv_desc->lo,
+                          inv_desc->lo & VTD_INV_DESC_IOTLB_G);
+        return false;
+    }
+    return true;
+}
+
 static bool vtd_process_inv_iec_desc(IntelIOMMUState *s,
                                      VTDInvDesc *inv_desc)
 {
@@ -2487,15 +2650,19 @@ static bool vtd_process_inv_desc(IntelIOMMUState *s)
         }
         break;
 
-    /*
-     * TODO: the entity of below two cases will be implemented in future series.
-     * To make guest (which integrates scalable mode support patch set in
-     * iommu driver) work, just return true is enough so far.
-     */
     case VTD_INV_DESC_PC:
+        trace_vtd_inv_desc("pc", inv_desc.hi, inv_desc.lo);
+        /* We don't implement PASID cache, so it's fine to simply check iqa.dw */
+        if (!s->iq_dw) {
+            return false;
+        }
         break;
 
     case VTD_INV_DESC_PIOTLB:
+        trace_vtd_inv_desc("pasid-iotlb", inv_desc.hi, inv_desc.lo);
+        if (!s->iq_dw || !vtd_process_iotlb_pasid_desc(s, &inv_desc)) {
+            return false;
+        }
         break;
 
     case VTD_INV_DESC_WAIT:
@@ -3071,6 +3238,7 @@ static Property vtd_properties[] = {
                       VTD_HOST_ADDRESS_WIDTH),
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
+    DEFINE_PROP_BOOL("x-pasid-mode", IntelIOMMUState, pasid, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3344,11 +3512,13 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
     },
 };
 
-VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
+VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus,
+                                 int devfn, unsigned int pasid)
 {
     struct vtd_as_key key = {
         .bus = bus,
         .devfn = devfn,
+        .pasid = pasid,
     };
     VTDAddressSpace *vtd_dev_as = g_hash_table_lookup(s->vtd_as, &key);
     char name[128];
@@ -3358,6 +3528,7 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 
         new_key->bus = bus;
         new_key->devfn = devfn;
+        new_key->pasid = pasid;
 
         snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
                  PCI_FUNC(devfn));
@@ -3365,6 +3536,7 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 
         vtd_dev_as->bus = bus;
         vtd_dev_as->devfn = (uint8_t)devfn;
+        vtd_dev_as->pasid = pasid;
         vtd_dev_as->iommu_state = s;
         vtd_dev_as->context_cache_entry.context_cache_gen = 0;
         vtd_dev_as->iova_tree = iova_tree_new();
@@ -3420,6 +3592,7 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 
         g_hash_table_insert(s->vtd_as, new_key, vtd_dev_as);
     }
+
     return vtd_dev_as;
 }
 
@@ -3525,7 +3698,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                                   "legacy mode",
                                   bus_n, PCI_SLOT(vtd_as->devfn),
                                   PCI_FUNC(vtd_as->devfn),
-                                  vtd_get_domain_id(s, &ce),
+                                  vtd_get_domain_id(s, &ce, vtd_as->pasid),
                                   ce.hi, ce.lo);
         if (vtd_as_has_map_notifier(vtd_as)) {
             /* This is required only for MAP typed notifiers */
@@ -3535,10 +3708,10 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
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
@@ -3629,6 +3802,10 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
     }
 
+    if (s->pasid) {
+        s->ecap |= VTD_ECAP_PASID;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
@@ -3702,8 +3879,7 @@ static AddressSpace *vtd_host_dma_iommu(PCIBus *bus, void *opaque, int devfn)
 
     assert(0 <= devfn && devfn < PCI_DEVFN_MAX);
 
-    vtd_as = vtd_find_add_as(s, bus, devfn);
-
+    vtd_as = vtd_find_add_as(s, bus, devfn, PCI_NO_PASID);
     return &vtd_as->as;
 }
 
@@ -3746,6 +3922,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
         return false;
     }
 
+    if (s->pasid && !s->scalable_mode) {
+        error_setg(errp, "Need to set PASID for scalable mode");
+        return false;
+    }
+
     return true;
 }
 
@@ -3808,9 +3989,9 @@ static void vtd_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->csrmem);
     /* No corresponding destroy */
-    s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
+    s->iotlb = g_hash_table_new_full(vtd_iotlb_hash, vtd_iotlb_equal,
                                      g_free, g_free);
-    s->vtd_as = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
+    s->vtd_as = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
                                       g_free, g_free);
     vtd_init(s);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index a6c788049b..c0402113e2 100644
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
@@ -190,6 +191,7 @@
 #define VTD_ECAP_PT                 (1ULL << 6)
 #define VTD_ECAP_MHMV               (15ULL << 20)
 #define VTD_ECAP_SRS                (1ULL << 31)
+#define VTD_ECAP_PASID              (1ULL << 40)
 #define VTD_ECAP_SMTS               (1ULL << 43)
 #define VTD_ECAP_SLTS               (1ULL << 46)
 
@@ -210,6 +212,8 @@
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
index 014d77dc2a..2fadbf6033 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -97,6 +97,7 @@ struct VTDPASIDEntry {
 struct VTDAddressSpace {
     PCIBus *bus;
     uint8_t devfn;
+    uint32_t pasid;
     AddressSpace as;
     IOMMUMemoryRegion iommu;
     MemoryRegion root;          /* The root container of the device */
@@ -113,6 +114,7 @@ struct VTDAddressSpace {
 struct VTDIOTLBEntry {
     uint64_t gfn;
     uint16_t domain_id;
+    uint32_t pasid;
     uint64_t slpte;
     uint64_t mask;
     uint8_t access_flags;
@@ -258,6 +260,7 @@ struct IntelIOMMUState {
     bool buggy_eim;                 /* Force buggy EIM unless eim=off */
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
+    bool pasid;                     /* Whether to support PASID */
 
     /*
      * Protects IOMMU states in general.  Currently it protects the
@@ -269,6 +272,7 @@ struct IntelIOMMUState {
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


