Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB23258F98
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 15:55:46 +0200 (CEST)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD6lF-0000ss-I8
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 09:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6kB-0007zy-0e
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:54:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6k6-0001Sv-Ek
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598968471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOzKJ5AzFEQmaYakg/4gXVFRd3NmhbihYnNYaQPIKN8=;
 b=AZcrQnIu+dLmlR+6MhycYnbstoF047BhBw6J5pC9CCIetN4PUmIMW5nIALYcm76YzRjQwZ
 Ok+EUr9f9p9uIjeTG9fJ4AZVU8rr3eoV4jQjxgk1P7wvTC7gLKtzhu/SM0m61tKKOqX5w/
 boIS+OzetqnkZ0FeNuMbPCwUO48rcJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Yb6ccSKsNNKIaQg-6IU0iA-1; Tue, 01 Sep 2020 09:54:29 -0400
X-MC-Unique: Yb6ccSKsNNKIaQg-6IU0iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02B0D10066FF;
 Tue,  1 Sep 2020 13:54:28 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-114-76.ams2.redhat.com [10.36.114.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 271A27C549;
 Tue,  1 Sep 2020 13:54:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v7 2/5] memory: Add IOMMUTLBEvent
Date: Tue,  1 Sep 2020 15:53:40 +0200
Message-Id: <20200901135343.22136-3-eperezma@redhat.com>
In-Reply-To: <20200901135343.22136-1-eperezma@redhat.com>
References: <20200901135343.22136-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This way we can tell between regulars IOMMURLBEntries (entry of IOMMU
hardware) and notifications.

In the notifications, we set explicitly if it is a MAPs or an UNMAP,
instead of trusting in entry permissions to differenciate them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/arm/smmu-common.c  | 13 ++++---
 hw/arm/smmuv3.c       | 13 ++++---
 hw/i386/intel_iommu.c | 88 ++++++++++++++++++++++++-------------------
 hw/misc/tz-mpc.c      | 32 +++++++++-------
 hw/ppc/spapr_iommu.c  | 15 ++++----
 include/exec/memory.h | 31 ++++++++-------
 softmmu/memory.c      | 16 +++-----
 7 files changed, 112 insertions(+), 96 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 88d2c454f0..405d5c5325 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -465,14 +465,15 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
 /* Unmap the whole notifier's range */
 static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 {
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
 
-    entry.target_as = &address_space_memory;
-    entry.iova = n->start;
-    entry.perm = IOMMU_NONE;
-    entry.addr_mask = n->end - n->start;
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.iova = n->start;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.addr_mask = n->end - n->start;
 
-    memory_region_notify_iommu_one(n, &entry);
+    memory_region_notify_iommu_one(n, &event);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0a893ae918..62b0e289ca 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -799,7 +799,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                uint8_t tg, uint64_t num_pages)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     uint8_t granule = tg;
 
     if (!tg) {
@@ -822,12 +822,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
         granule = tt->granule_sz;
     }
 
-    entry.target_as = &address_space_memory;
-    entry.iova = iova;
-    entry.addr_mask = num_pages * (1 << granule) - 1;
-    entry.perm = IOMMU_NONE;
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.iova = iova;
+    event.entry.addr_mask = num_pages * (1 << granule) - 1;
+    event.entry.perm = IOMMU_NONE;
 
-    memory_region_notify_iommu_one(n, &entry);
+    memory_region_notify_iommu_one(n, &event);
 }
 
 /* invalidate an asid/iova range tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 2ad6b9d796..0c4aef5cb5 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1073,7 +1073,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
     }
 }
 
-typedef int (*vtd_page_walk_hook)(IOMMUTLBEntry *entry, void *private);
+typedef int (*vtd_page_walk_hook)(IOMMUTLBEvent *event, void *private);
 
 /**
  * Constant information used during page walking
@@ -1094,11 +1094,12 @@ typedef struct {
     uint16_t domain_id;
 } vtd_page_walk_info;
 
-static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *info)
+static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
 {
     VTDAddressSpace *as = info->as;
     vtd_page_walk_hook hook_fn = info->hook_fn;
     void *private = info->private;
+    IOMMUTLBEntry *entry = &event->entry;
     DMAMap target = {
         .iova = entry->iova,
         .size = entry->addr_mask,
@@ -1107,7 +1108,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *info)
     };
     DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
 
-    if (entry->perm == IOMMU_NONE && !info->notify_unmap) {
+    if (event->type == IOMMU_NOTIFIER_UNMAP && !info->notify_unmap) {
         trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
         return 0;
     }
@@ -1115,7 +1116,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *info)
     assert(hook_fn);
 
     /* Update local IOVA mapped ranges */
-    if (entry->perm) {
+    if (event->type == IOMMU_NOTIFIER_MAP) {
         if (mapped) {
             /* If it's exactly the same translation, skip */
             if (!memcmp(mapped, &target, sizeof(target))) {
@@ -1141,19 +1142,21 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *info)
                 int ret;
 
                 /* Emulate an UNMAP */
+                event->type = IOMMU_NOTIFIER_UNMAP;
                 entry->perm = IOMMU_NONE;
                 trace_vtd_page_walk_one(info->domain_id,
                                         entry->iova,
                                         entry->translated_addr,
                                         entry->addr_mask,
                                         entry->perm);
-                ret = hook_fn(entry, private);
+                ret = hook_fn(event, private);
                 if (ret) {
                     return ret;
                 }
                 /* Drop any existing mapping */
                 iova_tree_remove(as->iova_tree, &target);
-                /* Recover the correct permission */
+                /* Recover the correct type */
+                event->type = IOMMU_NOTIFIER_MAP;
                 entry->perm = cache_perm;
             }
         }
@@ -1170,7 +1173,7 @@ static int vtd_page_walk_one(IOMMUTLBEntry *entry, vtd_page_walk_info *info)
     trace_vtd_page_walk_one(info->domain_id, entry->iova,
                             entry->translated_addr, entry->addr_mask,
                             entry->perm);
-    return hook_fn(entry, private);
+    return hook_fn(event, private);
 }
 
 /**
@@ -1191,7 +1194,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
     uint32_t offset;
     uint64_t slpte;
     uint64_t subpage_size, subpage_mask;
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     uint64_t iova = start;
     uint64_t iova_next;
     int ret = 0;
@@ -1245,13 +1248,15 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
              *
              * In either case, we send an IOTLB notification down.
              */
-            entry.target_as = &address_space_memory;
-            entry.iova = iova & subpage_mask;
-            entry.perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
-            entry.addr_mask = ~subpage_mask;
+            event.entry.target_as = &address_space_memory;
+            event.entry.iova = iova & subpage_mask;
+            event.entry.perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
+            event.entry.addr_mask = ~subpage_mask;
             /* NOTE: this is only meaningful if entry_valid == true */
-            entry.translated_addr = vtd_get_slpte_addr(slpte, info->aw);
-            ret = vtd_page_walk_one(&entry, info);
+            event.entry.translated_addr = vtd_get_slpte_addr(slpte, info->aw);
+            event.type = event.entry.perm ? IOMMU_NOTIFIER_MAP :
+                                            IOMMU_NOTIFIER_UNMAP;
+            ret = vtd_page_walk_one(&event, info);
         }
 
         if (ret < 0) {
@@ -1430,10 +1435,10 @@ static int vtd_dev_to_context_entry(IntelIOMMUState *s, uint8_t bus_num,
     return 0;
 }
 
-static int vtd_sync_shadow_page_hook(IOMMUTLBEntry *entry,
+static int vtd_sync_shadow_page_hook(IOMMUTLBEvent *event,
                                      void *private)
 {
-    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry);
+    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *event);
     return 0;
 }
 
@@ -1993,14 +1998,17 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                  * page tables.  We just deliver the PSI down to
                  * invalidate caches.
                  */
-                IOMMUTLBEntry entry = {
-                    .target_as = &address_space_memory,
-                    .iova = addr,
-                    .translated_addr = 0,
-                    .addr_mask = size - 1,
-                    .perm = IOMMU_NONE,
+                IOMMUTLBEvent event = {
+                    .type = IOMMU_NOTIFIER_UNMAP,
+                    .entry = {
+                        .target_as = &address_space_memory,
+                        .iova = addr,
+                        .translated_addr = 0,
+                        .addr_mask = size - 1,
+                        .perm = IOMMU_NONE,
+                    },
                 };
-                memory_region_notify_iommu(&vtd_as->iommu, 0, entry);
+                memory_region_notify_iommu(&vtd_as->iommu, 0, event);
             }
         }
     }
@@ -2412,7 +2420,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
                                           VTDInvDesc *inv_desc)
 {
     VTDAddressSpace *vtd_dev_as;
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     struct VTDBus *vtd_bus;
     hwaddr addr;
     uint64_t sz;
@@ -2460,12 +2468,13 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
         sz = VTD_PAGE_SIZE;
     }
 
-    entry.target_as = &vtd_dev_as->as;
-    entry.addr_mask = sz - 1;
-    entry.iova = addr;
-    entry.perm = IOMMU_NONE;
-    entry.translated_addr = 0;
-    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, entry);
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &vtd_dev_as->as;
+    event.entry.addr_mask = sz - 1;
+    event.entry.iova = addr;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.translated_addr = 0;
+    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, event);
 
 done:
     return true;
@@ -3486,19 +3495,20 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
     size = remain = end - start + 1;
 
     while (remain >= VTD_PAGE_SIZE) {
-        IOMMUTLBEntry entry;
+        IOMMUTLBEvent event;
         uint64_t mask = get_naturally_aligned_size(start, remain, s->aw_bits);
 
         assert(mask);
 
-        entry.iova = start;
-        entry.addr_mask = mask - 1;
-        entry.target_as = &address_space_memory;
-        entry.perm = IOMMU_NONE;
+        event.type = IOMMU_NOTIFIER_UNMAP;
+        event.entry.iova = start;
+        event.entry.addr_mask = mask - 1;
+        event.entry.target_as = &address_space_memory;
+        event.entry.perm = IOMMU_NONE;
         /* This field is meaningless for unmap */
-        entry.translated_addr = 0;
+        event.entry.translated_addr = 0;
 
-        memory_region_notify_iommu_one(n, &entry);
+        memory_region_notify_iommu_one(n, &event);
 
         start += mask;
         remain -= mask;
@@ -3534,9 +3544,9 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
     vtd_switch_address_space_all(s);
 }
 
-static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
+static int vtd_replay_hook(IOMMUTLBEvent *event, void *private)
 {
-    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one((IOMMUNotifier *)private, event);
     return 0;
 }
 
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 98f151237f..30481e1c90 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -82,8 +82,10 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
     /* Called when the LUT word at lutidx has changed from oldlut to newlut;
      * must call the IOMMU notifiers for the changed blocks.
      */
-    IOMMUTLBEntry entry = {
-        .addr_mask = s->blocksize - 1,
+    IOMMUTLBEvent event = {
+        .entry = {
+            .addr_mask = s->blocksize - 1,
+        }
     };
     hwaddr addr = lutidx * s->blocksize * 32;
     int i;
@@ -100,26 +102,28 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
         block_is_ns = newlut & (1 << i);
 
         trace_tz_mpc_iommu_notify(addr);
-        entry.iova = addr;
-        entry.translated_addr = addr;
+        event.entry.iova = addr;
+        event.entry.translated_addr = addr;
 
-        entry.perm = IOMMU_NONE;
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+        event.type = IOMMU_NOTIFIER_UNMAP;
+        event.entry.perm = IOMMU_NONE;
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, event);
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, event);
 
-        entry.perm = IOMMU_RW;
+        event.type = IOMMU_NOTIFIER_MAP;
+        event.entry.perm = IOMMU_RW;
         if (block_is_ns) {
-            entry.target_as = &s->blocked_io_as;
+            event.entry.target_as = &s->blocked_io_as;
         } else {
-            entry.target_as = &s->downstream_as;
+            event.entry.target_as = &s->downstream_as;
         }
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, event);
         if (block_is_ns) {
-            entry.target_as = &s->downstream_as;
+            event.entry.target_as = &s->downstream_as;
         } else {
-            entry.target_as = &s->blocked_io_as;
+            event.entry.target_as = &s->blocked_io_as;
         }
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, event);
     }
 }
 
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 0fecabc135..8bc3cff05d 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -445,7 +445,7 @@ static void spapr_tce_reset(DeviceState *dev)
 static target_ulong put_tce_emu(SpaprTceTable *tcet, target_ulong ioba,
                                 target_ulong tce)
 {
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     hwaddr page_mask = IOMMU_PAGE_MASK(tcet->page_shift);
     unsigned long index = (ioba - tcet->bus_offset) >> tcet->page_shift;
 
@@ -457,12 +457,13 @@ static target_ulong put_tce_emu(SpaprTceTable *tcet, target_ulong ioba,
 
     tcet->table[index] = tce;
 
-    entry.target_as = &address_space_memory,
-    entry.iova = (ioba - tcet->bus_offset) & page_mask;
-    entry.translated_addr = tce & page_mask;
-    entry.addr_mask = ~page_mask;
-    entry.perm = spapr_tce_iommu_access_flags(tce);
-    memory_region_notify_iommu(&tcet->iommu, 0, entry);
+    event.entry.target_as = &address_space_memory,
+    event.entry.iova = (ioba - tcet->bus_offset) & page_mask;
+    event.entry.translated_addr = tce & page_mask;
+    event.entry.addr_mask = ~page_mask;
+    event.entry.perm = spapr_tce_iommu_access_flags(tce);
+    event.type = entry.perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMAP;
+    memory_region_notify_iommu(&tcet->iommu, 0, event);
 
     return H_SUCCESS;
 }
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 22c5f564d1..8a56707169 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -70,11 +70,11 @@ typedef enum {
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : 0))
 
 struct IOMMUTLBEntry {
-    AddressSpace    *target_as;
-    hwaddr           iova;
-    hwaddr           translated_addr;
-    hwaddr           addr_mask;  /* 0xfff = 4k translation */
-    IOMMUAccessFlags perm;
+    AddressSpace            *target_as;
+    hwaddr                   iova;
+    hwaddr                   translated_addr;
+    hwaddr                   addr_mask;  /* 0xfff = 4k translation */
+    IOMMUAccessFlags         perm;
 };
 
 /*
@@ -106,6 +106,11 @@ struct IOMMUNotifier {
 };
 typedef struct IOMMUNotifier IOMMUNotifier;
 
+typedef struct IOMMUTLBEvent {
+    IOMMUTLBEntry entry;
+    IOMMUNotifierFlag type;
+} IOMMUTLBEvent;
+
 /* RAM is pre-allocated and passed into qemu_ram_alloc_from_ptr */
 #define RAM_PREALLOC   (1 << 0)
 
@@ -1265,13 +1270,13 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr);
  *
  * @iommu_mr: the memory region that was changed
  * @iommu_idx: the IOMMU index for the translation table which has changed
- * @entry: the new entry in the IOMMU translation table.  The entry
- *         replaces all old entries for the same virtual I/O address range.
- *         Deleted entries have .@perm == 0.
+ * @event: TLB event with the new entry in the IOMMU translation table.
+ *         The entry replaces all old entries for the same virtual I/O address
+ *         range.
  */
 void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 int iommu_idx,
-                                IOMMUTLBEntry entry);
+                                IOMMUTLBEvent event);
 
 /**
  * memory_region_notify_iommu_one: notify a change in an IOMMU translation
@@ -1281,12 +1286,12 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  * notifies a specific notifier, not all of them.
  *
  * @notifier: the notifier to be notified
- * @entry: the new entry in the IOMMU translation table.  The entry
- *         replaces all old entries for the same virtual I/O address range.
- *         Deleted entries have .@perm == 0.
+ * @event: TLB event with the new entry in the IOMMU translation table.
+ *         The entry replaces all old entries for the same virtual I/O address
+ *         range.
  */
 void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry);
+                                    IOMMUTLBEvent *event);
 
 /**
  * memory_region_register_iommu_notifier: register a notifier for changes to
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 961c25b42f..09b3443eac 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1891,9 +1891,9 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
 }
 
 void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
-                                    IOMMUTLBEntry *entry)
+                                    IOMMUTLBEvent *event)
 {
-    IOMMUNotifierFlag request_flags;
+    IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
 
     /*
@@ -1906,20 +1906,14 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 
     assert(entry->iova >= notifier->start && entry_end <= notifier->end);
 
-    if (entry->perm & IOMMU_RW) {
-        request_flags = IOMMU_NOTIFIER_MAP;
-    } else {
-        request_flags = IOMMU_NOTIFIER_UNMAP;
-    }
-
-    if (notifier->notifier_flags & request_flags) {
+    if (event->type & notifier->notifier_flags) {
         notifier->notify(notifier, entry);
     }
 }
 
 void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 int iommu_idx,
-                                IOMMUTLBEntry entry)
+                                IOMMUTLBEvent event)
 {
     IOMMUNotifier *iommu_notifier;
 
@@ -1927,7 +1921,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_iommu_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &event);
         }
     }
 }
-- 
2.18.1


