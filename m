Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8D484D19
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:27:42 +0100 (CET)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xtl-00050Q-Jh
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmb-00043x-Pj
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmZ-0002c4-45
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641356414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jEBFCHGl+LRIBGdPZkPGYe+hx2ST0Kigx8++uiLUQQ=;
 b=LwDjgWX10mFtpVBVFiMfpMga4lYFxAAy/gWmDmIgiVYznuWeN091MRDMrUZwWnSeclcsvP
 Bf4Gq1RkABlMLggSCC8tqW2VZsC/g0woI/RFIYLwSjGoqrLctvntw3k9pUsUh5NAp8Z3Gs
 fFTsrycwlWI0zQQ1BPDN4oYAzedjZic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-ecCBCGkXME-JC-SE_kLkDA-1; Tue, 04 Jan 2022 23:20:11 -0500
X-MC-Unique: ecCBCGkXME-JC-SE_kLkDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23827180830C;
 Wed,  5 Jan 2022 04:20:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C16F971C80;
 Wed,  5 Jan 2022 04:20:07 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 2/3] intel-iommu: drop VTDBus
Date: Wed,  5 Jan 2022 12:19:44 +0800
Message-Id: <20220105041945.13459-4-jasowang@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

We introduce VTDBus structure as an intermediate step for searching
the address space. This works well with SID based matching/lookup. But
when we want to support SID plus PASID based address space lookup,
this intermediate steps turns out to be a burden. So the patch simply
drops the VTDBus structure and use the PCIBus and devfn as the key for
the g_hash_table(). This simplifies the codes and the future PASID
extension.

This may case slight slower for the vtd_find_as_from_bus_num() callers
but since they are all called from the control path, we can afford it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c         | 183 +++++++++++++---------------------
 include/hw/i386/intel_iommu.h |  10 +-
 2 files changed, 69 insertions(+), 124 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index f2c7a23712..58c682097b 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -61,6 +61,11 @@
     }                                                                         \
 }
 
+struct vtd_as_key {
+    PCIBus *bus;
+    uint8_t devfn;
+};
+
 static void vtd_address_space_refresh_all(IntelIOMMUState *s);
 static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n);
 
@@ -190,12 +195,18 @@ static inline gboolean vtd_as_has_map_notifier(VTDAddressSpace *as)
 /* GHashTable functions */
 static gboolean vtd_uint64_equal(gconstpointer v1, gconstpointer v2)
 {
-    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
+    const struct vtd_as_key *key1 = v1;
+    const struct vtd_as_key *key2 = v2;
+
+    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
 }
 
 static guint vtd_uint64_hash(gconstpointer v)
 {
-    return (guint)*(const uint64_t *)v;
+    const struct vtd_as_key *key = v;
+    guint value = (guint)(uintptr_t)key->bus;
+
+    return (guint)(value << 8 | key->devfn);
 }
 
 static gboolean vtd_hash_remove_by_domain(gpointer key, gpointer value,
@@ -236,22 +247,14 @@ static gboolean vtd_hash_remove_by_page(gpointer key, gpointer value,
 static void vtd_reset_context_cache_locked(IntelIOMMUState *s)
 {
     VTDAddressSpace *vtd_as;
-    VTDBus *vtd_bus;
-    GHashTableIter bus_it;
-    uint32_t devfn_it;
+    GHashTableIter as_it;
 
     trace_vtd_context_cache_reset();
 
-    g_hash_table_iter_init(&bus_it, s->vtd_as_by_busptr);
+    g_hash_table_iter_init(&as_it, s->vtd_as);
 
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
@@ -986,32 +989,6 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
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
@@ -1604,18 +1581,12 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
 
 static void vtd_switch_address_space_all(IntelIOMMUState *s)
 {
+    VTDAddressSpace *vtd_as;
     GHashTableIter iter;
-    VTDBus *vtd_bus;
-    int i;
-
-    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
-    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
-        for (i = 0; i < PCI_DEVFN_MAX; i++) {
-            if (!vtd_bus->dev_as[i]) {
-                continue;
-            }
-            vtd_switch_address_space(vtd_bus->dev_as[i]);
-        }
+
+    g_hash_table_iter_init(&iter, s->vtd_as);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_as)) {
+        vtd_switch_address_space(vtd_as);
     }
 }
 
@@ -1659,16 +1630,11 @@ static inline bool vtd_is_interrupt_addr(hwaddr addr)
 
 static void vtd_pt_enable_fast_path(IntelIOMMUState *s, uint16_t source_id)
 {
-    VTDBus *vtd_bus;
     VTDAddressSpace *vtd_as;
     bool success = false;
+    uintptr_t key = (uintptr_t)source_id;
 
-    vtd_bus = vtd_find_as_from_bus_num(s, VTD_SID_TO_BUS(source_id));
-    if (!vtd_bus) {
-        goto out;
-    }
-
-    vtd_as = vtd_bus->dev_as[VTD_SID_TO_DEVFN(source_id)];
+    vtd_as = g_hash_table_lookup(s->vtd_as, &key);
     if (!vtd_as) {
         goto out;
     }
@@ -1876,11 +1842,10 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
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
 
@@ -1903,32 +1868,31 @@ static void vtd_context_device_invalidate(IntelIOMMUState *s,
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
+    g_hash_table_iter_init(&as_it, s->vtd_as);
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
@@ -2442,18 +2406,14 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
 {
     VTDAddressSpace *vtd_dev_as;
     IOMMUTLBEvent event;
-    struct VTDBus *vtd_bus;
+    uintptr_t key;
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
@@ -2464,12 +2424,8 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
         return false;
     }
 
-    vtd_bus = vtd_find_as_from_bus_num(s, bus_num);
-    if (!vtd_bus) {
-        goto done;
-    }
-
-    vtd_dev_as = vtd_bus->dev_as[devfn];
+    key = (uintptr_t)sid;
+    vtd_dev_as = g_hash_table_lookup(s->vtd_as, &key);
     if (!vtd_dev_as) {
         goto done;
     }
@@ -3390,27 +3346,22 @@ static const MemoryRegionOps vtd_mem_ir_ops = {
 
 VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
 {
-    uintptr_t key = (uintptr_t)bus;
-    VTDBus *vtd_bus = g_hash_table_lookup(s->vtd_as_by_busptr, &key);
-    VTDAddressSpace *vtd_dev_as;
+    struct vtd_as_key key = {
+        .bus = bus,
+        .devfn = devfn,
+    };
+    VTDAddressSpace *vtd_dev_as = g_hash_table_lookup(s->vtd_as, &key);
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
+    if (!vtd_dev_as) {
+        struct vtd_as_key *new_key = g_malloc(sizeof(*new_key));
 
-    vtd_dev_as = vtd_bus->dev_as[devfn];
+        new_key->bus = bus;
+        new_key->devfn = devfn;
 
-    if (!vtd_dev_as) {
         snprintf(name, sizeof(name), "vtd-%02x.%x", PCI_SLOT(devfn),
                  PCI_FUNC(devfn));
-        vtd_bus->dev_as[devfn] = vtd_dev_as = g_malloc0(sizeof(VTDAddressSpace));
+        vtd_dev_as = g_malloc0(sizeof(VTDAddressSpace));
 
         vtd_dev_as->bus = bus;
         vtd_dev_as->devfn = (uint8_t)devfn;
@@ -3466,6 +3417,8 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
                                             &vtd_dev_as->nodmar, 0);
 
         vtd_switch_address_space(vtd_dev_as);
+
+        g_hash_table_insert(s->vtd_as, new_key, vtd_dev_as);
     }
     return vtd_dev_as;
 }
@@ -3750,6 +3703,7 @@ static AddressSpace *vtd_host_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     assert(0 <= devfn && devfn < PCI_DEVFN_MAX);
 
     vtd_as = vtd_find_add_as(s, bus, devfn);
+
     return &vtd_as->as;
 }
 
@@ -3835,7 +3789,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
 
     QLIST_INIT(&s->vtd_as_with_notifiers);
     qemu_mutex_init(&s->iommu_lock);
-    memset(s->vtd_as_by_bus_num, 0, sizeof(s->vtd_as_by_bus_num));
     memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
                           "intel_iommu", DMAR_REG_SIZE);
 
@@ -3857,8 +3810,8 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     /* No corresponding destroy */
     s->iotlb = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
                                      g_free, g_free);
-    s->vtd_as_by_busptr = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
-                                              g_free, g_free);
+    s->vtd_as = g_hash_table_new_full(vtd_uint64_hash, vtd_uint64_equal,
+                                      g_free, g_free);
     vtd_init(s);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
     pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 41783ee46d..014d77dc2a 100644
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
@@ -252,8 +245,7 @@ struct IntelIOMMUState {
     uint32_t context_cache_gen;     /* Should be in [1,MAX] */
     GHashTable *iotlb;              /* IOTLB */
 
-    GHashTable *vtd_as_by_busptr;   /* VTDBus objects indexed by PCIBus* reference */
-    VTDBus *vtd_as_by_bus_num[VTD_PCI_BUS_MAX]; /* VTDBus objects indexed by bus number */
+    GHashTable *vtd_as;             /* VTD address space indexed by source id*/
     /* list of registered notifiers */
     QLIST_HEAD(, VTDAddressSpace) vtd_as_with_notifiers;
 
-- 
2.25.1


