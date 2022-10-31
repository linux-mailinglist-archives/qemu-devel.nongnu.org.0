Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D906137BB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUKR-0000tv-KQ; Mon, 31 Oct 2022 08:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJZ-00073W-J9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJX-0003j1-7r
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b7tBODySCSVS0cvFan2OucwmNA/UHr9T82r+sfnQz3c=;
 b=AgIvEmpB3URMKyN3Mz3Z7e2MeGNgdeHw25MYBmwK8LLxg+6pcoNAXwpelR1d3wyQzZASY6
 hni7IEuBxF+hIzItuj/SOdB+Dzu0DlGui0Wiqw/lG8uYx3igMVWgNRDxx9L3WkpUGjIzHx
 UW+JF3XZq/jb/RC9H9KCiUQja2a9t7o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-oa4bTgopPX6EMEIJx2NPQQ-1; Mon, 31 Oct 2022 08:54:48 -0400
X-MC-Unique: oa4bTgopPX6EMEIJx2NPQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso2572169wmh.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7tBODySCSVS0cvFan2OucwmNA/UHr9T82r+sfnQz3c=;
 b=vtio/65YrKw6scBavsuNBNF364jhndYthl6UohmIF0tJOcpbeEMRM/pYWTBMbcilk8
 j9tCcr943GCx0Ry/zpqaFc2vWgWO+BD44ytphUgFiAuOxA3Sk4N6whPRms52nsysfr0Q
 Dja0wWxRv9H881EYZ+Nq+M+QPylR53GtAvyz1V4WxrwH3CVKjKgx6uRih+06+lg8PMRF
 PMyGWo+l0EiKy3OvruHD9Mpn51lOtIHzTo4pE34+cI4ju87iK9D3juq6t2VO47uKNedc
 9mVdPmGSfAlSvz51PqeLn02V7lavis55oq+Y3/Un79WRSmNuMTnLf6ytvej69X0g44kH
 R3Sw==
X-Gm-Message-State: ACrzQf1k0NGGUcJ6Vsm37X+8Ub8XeEXbdD255EMlmsGpX8qZwDcyAm/O
 P2+vYcBJ+NJADsNyqmq2r1c1EyWZDDn7x2AXuwumh7x+Wxo9+JmUy4sWmH7iNdvtKB7hh/UR7wr
 tjRTnLb9rGNacjHx9TIn8te6eJVGhuRHY0ZKBiO45vUSm9qHFbYpnBpx9svtb
X-Received: by 2002:a5d:4306:0:b0:236:c907:76f7 with SMTP id
 h6-20020a5d4306000000b00236c90776f7mr3925672wrq.130.1667220886850; 
 Mon, 31 Oct 2022 05:54:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lTDztAMU/kZZMLN+I8MJf4mR3c6EIejZGjn9ZWfxSzbHRcIYxb9hM71uic8aykPvDOySJ7Q==
X-Received: by 2002:a5d:4306:0:b0:236:c907:76f7 with SMTP id
 h6-20020a5d4306000000b00236c90776f7mr3925654wrq.130.1667220886503; 
 Mon, 31 Oct 2022 05:54:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m62-20020a1c2641000000b003cf47556f21sm7191820wmm.2.2022.10.31.05.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:46 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 84/86] intel-iommu: drop VTDBus
Message-ID: <20221031124928.128475-85-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Jason Wang <jasowang@redhat.com>

We introduce VTDBus structure as an intermediate step for searching
the address space. This works well with SID based matching/lookup. But
when we want to support SID plus PASID based address space lookup,
this intermediate steps turns out to be a burden. So the patch simply
drops the VTDBus structure and use the PCIBus and devfn as the key for
the g_hash_table(). This simplifies the codes and the future PASID
extension.

To prevent being slower for past vtd_find_as_from_bus_num() callers, a
vtd_as cache indexed by the bus number is introduced to store the last
recent search result of a vtd_as belongs to a specific bus.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221028061436.30093-3-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 include/hw/i386/intel_iommu.h |  11 +-
 hw/i386/intel_iommu.c         | 234 +++++++++++++++++-----------------
 2 files changed, 118 insertions(+), 127 deletions(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 67653b0f9b..e49fff2a6c 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -58,7 +58,6 @@ typedef struct VTDContextEntry VTDContextEntry;
 typedef struct VTDContextCacheEntry VTDContextCacheEntry;
 typedef struct VTDAddressSpace VTDAddressSpace;
 typedef struct VTDIOTLBEntry VTDIOTLBEntry;
-typedef struct VTDBus VTDBus;
 typedef union VTD_IR_TableEntry VTD_IR_TableEntry;
 typedef union VTD_IR_MSIAddress VTD_IR_MSIAddress;
 typedef struct VTDPASIDDirEntry VTDPASIDDirEntry;
@@ -111,12 +110,6 @@ struct VTDAddressSpace {
     IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
 };
 
-struct VTDBus {
-    PCIBus* bus;		/* A reference to the bus to provide translation for */
-    /* A table of VTDAddressSpace objects indexed by devfn */
-    VTDAddressSpace *dev_as[];
-};
-
 struct VTDIOTLBEntry {
     uint64_t gfn;
     uint16_t domain_id;
@@ -253,8 +246,8 @@ struct IntelIOMMUState {
     uint32_t context_cache_gen;     /* Should be in [1,MAX] */
     GHashTable *iotlb;              /* IOTLB */
 
-    GHashTable *vtd_as_by_busptr;   /* VTDBus objects indexed by PCIBus* reference */
-    VTDBus *vtd_as_by_bus_num[VTD_PCI_BUS_MAX]; /* VTDBus objects indexed by bus number */
+    GHashTable *vtd_address_spaces;             /* VTD address spaces */
+    VTDAddressSpace *vtd_as_cache[VTD_PCI_BUS_MAX]; /* VTD address space cache */
     /* list of registered notifiers */
     QLIST_HEAD(, VTDAddressSpace) vtd_as_with_notifiers;
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 271de995be..9fe5a222eb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -61,6 +61,16 @@
     }                                                                         \
 }
 
+/*
+ * PCI bus number (or SID) is not reliable since the device is usaully
+ * initalized before guest can configure the PCI bridge
+ * (SECONDARY_BUS_NUMBER).
+ */
+struct vtd_as_key {
+    PCIBus *bus;
+    uint8_t devfn;
+};
+
 static void vtd_address_space_refresh_all(IntelIOMMUState *s);
 static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n);
 
@@ -210,6 +220,27 @@ static guint vtd_uint64_hash(gconstpointer v)
     return (guint)*(const uint64_t *)v;
 }
 
+static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
+{
+    const struct vtd_as_key *key1 = v1;
+    const struct vtd_as_key *key2 = v2;
+
+    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
+}
+
+/*
+ * Note that we use pointer to PCIBus as the key, so hashing/shifting
+ * based on the pointer value is intended. Note that we deal with
+ * collisions through vtd_as_equal().
+ */
+static guint vtd_as_hash(gconstpointer v)
+{
+    const struct vtd_as_key *key = v;
+    guint value = (guint)(uintptr_t)key->bus;
+
+    return (guint)(value << 8 | key->devfn);
+}
+
 static gboolean vtd_hash_remove_by_domain(gpointer key, gpointer value,
                                           gpointer user_data)
 {
@@ -248,22 +279,14 @@ static gboolean vtd_hash_remove_by_page(gpointer key, gpointer value,
 static void vtd_reset_context_cache_locked(IntelIOMMUState *s)
 {
     VTDAddressSpace *vtd_as;
-    VTDBus *vtd_bus;
-    GHashTableIter bus_it;
-    uint32_t devfn_it;
+    GHashTableIter as_it;
 
     trace_vtd_context_cache_reset();
 
-    g_hash_table_iter_init(&bus_it, s->vtd_as_by_busptr);
+    g_hash_table_iter_init(&as_it, s->vtd_address_spaces);
 
-    while (g_hash_table_iter_next (&bus_it, NULL, (void**)&vtd_bus)) {
-        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
-            vtd_as = vtd_bus->dev_as[devfn_it];
-            if (!vtd_as) {
-                continue;
-            }
-            vtd_as->context_cache_entry.context_cache_gen = 0;
-        }
+    while (g_hash_table_iter_next (&as_it, NULL, (void**)&vtd_as)) {
+        vtd_as->context_cache_entry.context_cache_gen = 0;
     }
     s->context_cache_gen = 1;
 }
@@ -993,32 +1016,6 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
     return slpte & rsvd_mask;
 }
 
-/* Find the VTD address space associated with a given bus number */
-static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_num)
-{
-    VTDBus *vtd_bus = s->vtd_as_by_bus_num[bus_num];
-    GHashTableIter iter;
-
-    if (vtd_bus) {
-        return vtd_bus;
-    }
-
-    /*
-     * Iterate over the registered buses to find the one which
-     * currently holds this bus number and update the bus_num
-     * lookup table.
-     */
-    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
-    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
-        if (pci_bus_num(vtd_bus->bus) == bus_num) {
-            s->vtd_as_by_bus_num[bus_num] = vtd_bus;
-            return vtd_bus;
-        }
-    }
-
-    return NULL;
-}
-
 /* Given the @iova, get relevant @slptep. @slpte_level will be the last level
  * of the translation, can be used for deciding the size of large page.
  */
@@ -1632,26 +1629,15 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
 
 static void vtd_switch_address_space_all(IntelIOMMUState *s)
 {
+    VTDAddressSpace *vtd_as;
     GHashTableIter iter;
-    VTDBus *vtd_bus;
-    int i;
 
-    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
-    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
-        for (i = 0; i < PCI_DEVFN_MAX; i++) {
-            if (!vtd_bus->dev_as[i]) {
-                continue;
-            }
-            vtd_switch_address_space(vtd_bus->dev_as[i]);
-        }
+    g_hash_table_iter_init(&iter, s->vtd_address_spaces);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_as)) {
+        vtd_switch_address_space(vtd_as);
     }
 }
 
-static inline uint16_t vtd_make_source_id(uint8_t bus_num, uint8_t devfn)
-{
-    return ((bus_num & 0xffUL) << 8) | (devfn & 0xffUL);
-}
-
 static const bool vtd_qualified_faults[] = {
     [VTD_FR_RESERVED] = false,
     [VTD_FR_ROOT_ENTRY_P] = false,
@@ -1686,18 +1672,37 @@ static inline bool vtd_is_interrupt_addr(hwaddr addr)
     return VTD_INTERRUPT_ADDR_FIRST <= addr && addr <= VTD_INTERRUPT_ADDR_LAST;
 }
 
+static gboolean vtd_find_as_by_sid(gpointer key, gpointer value,
+                                   gpointer user_data)
+{
+    struct vtd_as_key *as_key = (struct vtd_as_key *)key;
+    uint16_t target_sid = *(uint16_t *)user_data;
+    uint16_t sid = PCI_BUILD_BDF(pci_bus_num(as_key->bus), as_key->devfn);
+    return sid == target_sid;
+}
+
+static VTDAddressSpace *vtd_get_as_by_sid(IntelIOMMUState *s, uint16_t sid)
+{
+    uint8_t bus_num = PCI_BUS_NUM(sid);
+    VTDAddressSpace *vtd_as = s->vtd_as_cache[bus_num];
+
+    if (vtd_as &&
+        (sid == PCI_BUILD_BDF(pci_bus_num(vtd_as->bus), vtd_as->devfn))) {
+        return vtd_as;
+    }
+
+    vtd_as = g_hash_table_find(s->vtd_address_spaces, vtd_find_as_by_sid, &sid);
+    s->vtd_as_cache[bus_num] = vtd_as;
+
+    return vtd_as;
+}
+
 static void vtd_pt_enable_fast_path(IntelIOMMUState *s, uint16_t source_id)
 {
-    VTDBus *vtd_bus;
     VTDAddressSpace *vtd_as;
     bool success = false;
 
-    vtd_bus = vtd_find_as_from_bus_num(s, VTD_SID_TO_BUS(source_id));
-    if (!vtd_bus) {
-        goto out;
-    }
-
-    vtd_as = vtd_bus->dev_as[VTD_SID_TO_DEVFN(source_id)];
+    vtd_as = vtd_get_as_by_sid(s, source_id);
     if (!vtd_as) {
         goto out;
     }
@@ -1733,7 +1738,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
     VTDContextCacheEntry *cc_entry;
     uint64_t slpte, page_mask;
     uint32_t level;
-    uint16_t source_id = vtd_make_source_id(bus_num, devfn);
+    uint16_t source_id = PCI_BUILD_BDF(bus_num, devfn);
     int ret_fr;
     bool is_fpd_set = false;
     bool reads = true;
@@ -1905,11 +1910,10 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
                                           uint16_t source_id,
                                           uint16_t func_mask)
 {
+    GHashTableIter as_it;
     uint16_t mask;
-    VTDBus *vtd_bus;
     VTDAddressSpace *vtd_as;
     uint8_t bus_n, devfn;
-    uint16_t devfn_it;
 
     trace_vtd_inv_desc_cc_devices(source_id, func_mask);
 
@@ -1932,32 +1936,31 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
     mask = ~mask;
 
     bus_n = VTD_SID_TO_BUS(source_id);
-    vtd_bus = vtd_find_as_from_bus_num(s, bus_n);
-    if (vtd_bus) {
-        devfn = VTD_SID_TO_DEVFN(source_id);
-        for (devfn_it = 0; devfn_it < PCI_DEVFN_MAX; ++devfn_it) {
-            vtd_as = vtd_bus->dev_as[devfn_it];
-            if (vtd_as && ((devfn_it & mask) == (devfn & mask))) {
-                trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(devfn_it),
-                                             VTD_PCI_FUNC(devfn_it));
-                vtd_iommu_lock(s);
-                vtd_as->context_cache_entry.context_cache_gen = 0;
-                vtd_iommu_unlock(s);
-                /*
-                 * Do switch address space when needed, in case if the
-                 * device passthrough bit is switched.
-                 */
-                vtd_switch_address_space(vtd_as);
-                /*
-                 * So a device is moving out of (or moving into) a
-                 * domain, resync the shadow page table.
-                 * This won't bring bad even if we have no such
-                 * notifier registered - the IOMMU notification
-                 * framework will skip MAP notifications if that
-                 * happened.
-                 */
-                vtd_sync_shadow_page_table(vtd_as);
-            }
+    devfn = VTD_SID_TO_DEVFN(source_id);
+
+    g_hash_table_iter_init(&as_it, s->vtd_address_spaces);
+    while (g_hash_table_iter_next(&as_it, NULL, (void**)&vtd_as)) {
+        if ((pci_bus_num(vtd_as->bus) == bus_n) &&
+            (vtd_as->devfn & mask) == (devfn & mask)) {
+            trace_vtd_inv_desc_cc_device(bus_n, VTD_PCI_SLOT(vtd_as->devfn),
+                                         VTD_PCI_FUNC(vtd_as->devfn));
+            vtd_iommu_lock(s);
+            vtd_as->context_cache_entry.context_cache_gen = 0;
+            vtd_iommu_unlock(s);
+            /*
+             * Do switch address space when needed, in case if the
+             * device passthrough bit is switched.
+             */
+            vtd_switch_address_space(vtd_as);
+            /*
+             * So a device is moving out of (or moving into) a
+             * domain, resync the shadow page table.
+             * This won't bring bad even if we have no such
+             * notifier registered - the IOMMU notification
+             * framework will skip MAP notifications if that
+             * happened.
+             */
+            vtd_sync_shadow_page_table(vtd_as);
         }
     }
 }
@@ -2473,18 +2476,13 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
 {
     VTDAddressSpace *vtd_dev_as;
     IOMMUTLBEvent event;
-    struct VTDBus *vtd_bus;
     hwaddr addr;
     uint64_t sz;
     uint16_t sid;
-    uint8_t devfn;
     bool size;
-    uint8_t bus_num;
 
     addr = VTD_INV_DESC_DEVICE_IOTLB_ADDR(inv_desc->hi);
     sid = VTD_INV_DESC_DEVICE_IOTLB_SID(inv_desc->lo);
-    devfn = sid & 0xff;
-    bus_num = sid >> 8;
     size = VTD_INV_DESC_DEVICE_IOTLB_SIZE(inv_desc->hi);
 
     if ((inv_desc->lo & VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO) ||
@@ -2495,12 +2493,11 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
         return false;
     }
 
-    vtd_bus = vtd_find_as_from_bus_num(s, bus_num);
-    if (!vtd_bus) {
-        goto done;
-    }
-
-    vtd_dev_as = vtd_bus->dev_as[devfn];
+    /*
+     * Using sid is OK since the guest should have finished the
+     * initialization of both the bus and device.
+     */
+    vtd_dev_as = vtd_get_as_by_sid(s, sid);
     if (!vtd_dev_as) {
         goto done;
     }
@@ -3427,27 +3424,27 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
 
 VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 {
-    uintptr_t key = (uintptr_t)bus;
-    VTDBus *vtd_bus = g_hash_table_lookup(s->vtd_as_by_busptr, &key);
+    /*
+     * We can't simply use sid here since the bus number might not be
+     * initialized by the guest.
+     */
+    struct vtd_as_key key = {
+        .bus = bus,
+        .devfn = devfn,
+    };
     VTDAddressSpace *vtd_dev_as;
     char name[128];
 
-    if (!vtd_bus) {
-        uintptr_t *new_key = g_malloc(sizeof(*new_key));
-        *new_key = (uintptr_t)bus;
-        /* No corresponding free() */
-        vtd_bus = g_malloc0(sizeof(VTDBus) + sizeof(VTDAddressSpace *) * \
-                            PCI_DEVFN_MAX);
-        vtd_bus->bus = bus;
-        g_hash_table_insert(s->vtd_as_by_busptr, new_key, vtd_bus);
-    }
-
-    vtd_dev_as = vtd_bus->dev_as[devfn];
-
+    vtd_dev_as = g_hash_table_lookup(s->vtd_address_spaces, &key);
     if (!vtd_dev_as) {
+        struct vtd_as_key *new_key = g_malloc(sizeof(*new_key));
+
+        new_key->bus = bus;
+        new_key->devfn = devfn;
+
         snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
                  PCI_FUNC(devfn));
-        vtd_bus->dev_as[devfn] = vtd_dev_as = g_new0(VTDAddressSpace, 1);
+        vtd_dev_as = g_new0(VTDAddressSpace, 1);
 
         vtd_dev_as->bus = bus;
         vtd_dev_as->devfn = (uint8_t)devfn;
@@ -3503,6 +3500,8 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
                                             &vtd_dev_as->nodmar, 0);
 
         vtd_switch_address_space(vtd_dev_as);
+
+        g_hash_table_insert(s->vtd_address_spaces, new_key, vtd_dev_as);
     }
     return vtd_dev_as;
 }
@@ -3881,7 +3880,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
 
     QLIST_INIT(&s->vtd_as_with_notifiers);
     qemu_mutex_init(&s->iommu_lock);
-    memset(s->vtd_as_by_bus_num, 0, sizeof(s->vtd_as_by_bus_num));
     memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
                           "intel_iommu", DMAR_REG_SIZE);
 
@@ -3903,8 +3901,8 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     /* No corresponding destroy */
     s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
                                      g_free, g_free);
-    s->vtd_as_by_busptr = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
-                                              g_free, g_free);
+    s->vtd_address_spaces = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
+                                      g_free, g_free);
     vtd_init(s);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
     pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
-- 
MST


