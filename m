Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE202D48CE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:20:03 +0100 (CET)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn44I-0002bz-M0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rj-0001Ju-3A
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rZ-0007dp-KH
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCZCKCuFOJBCydymGeiwWLBXi/oP0lMJNiHZPbP0zJw=;
 b=KhfjK24ovJX7R8wROO0g+j9usvIOpuRnsaJoeIbaSZjDjj9wAK13upWs4j8JnhDz8Tk20J
 CMTRjS9n8RWmWdikkbspI81yQJgnAY3qnDB+//YazaPrA5HjZ3bI7aXEgAUc0hm2GXNUIe
 8kljq+csWFe/CNwjqKXeInx1DN0kkIM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-2odBitGLOGK3-EWtT24sEA-1; Wed, 09 Dec 2020 13:06:50 -0500
X-MC-Unique: 2odBitGLOGK3-EWtT24sEA-1
Received: by mail-wm1-f70.google.com with SMTP id f12so868649wmf.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hCZCKCuFOJBCydymGeiwWLBXi/oP0lMJNiHZPbP0zJw=;
 b=bO3HX4REtXmMANEQmnBnK7cxaQFH3dt5Te8c+MIHkEyPHUTY5NfZnBlXjYnaY8jUPF
 EUKi0rd1pPVtY0QKi55lKhAuey4zJRHbSC7VapHXCXISmllCPVvx3hZEVo56HBDTBXEo
 oTZa0lIyxqBt6oJuZaR2n2hPSlGuYOy3YBk5A3xQ0beoSjc0i02Z5gDQ4A4tG3evz3K1
 LV1isdvmMpuEQq6Jvg4qyH0d2CWn9brVdt888/Wk66y6uyUzSAz/iPs/PTP5iwrGUASu
 IR6C/T6mdtbvnoNZclKE9mkeBpFJ67RwdEVymcLZXetHHSeT2s0kAQFwukO0GwhXoFbc
 oMpw==
X-Gm-Message-State: AOAM532oKFe8Ewj/nq7dj13IbajOacRL3mWRW6XneEzau4YqI4OhKezW
 Bqy/8zVbObupiMZZGgh+1v048F8KAul9MLFNf9G/eCjj9rZqzU+xPxv7Fm5VM1oOAXMCTuTgzN6
 lGaZtxjB/1iRqbJwrjSt3qPxwtjBygLZ3CXUKXOl7p2ZLi7U0W2bSYQg0Rrh3
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr3262444wrv.132.1607537209156; 
 Wed, 09 Dec 2020 10:06:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdXXWGezxAuykSVPqFJck2pt78OXdezSk1MMXjuXwc+lu8j9WGGbFkaDjUqk8bDnHh5HI8Lg==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr3262388wrv.132.1607537208853; 
 Wed, 09 Dec 2020 10:06:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id h15sm4615997wrw.15.2020.12.09.10.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:06:48 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/65] memory: Add IOMMUTLBEvent
Message-ID: <20201209180546.721296-4-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

This way we can tell between regular IOMMUTLBEntry (entry of IOMMU
hardware) and notifications.

In the notifications, we set explicitly if it is a MAPs or an UNMAP,
instead of trusting in entry permissions to differentiate them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/exec/memory.h    | 27 ++++++------
 hw/arm/smmu-common.c     | 13 +++---
 hw/arm/smmuv3.c          | 13 +++---
 hw/i386/intel_iommu.c    | 88 ++++++++++++++++++++++------------------
 hw/misc/tz-mpc.c         | 32 ++++++++-------
 hw/ppc/spapr_iommu.c     | 15 +++----
 hw/s390x/s390-pci-inst.c | 27 +++++++-----
 hw/virtio/virtio-iommu.c | 30 +++++++-------
 softmmu/memory.c         | 20 ++++-----
 9 files changed, 143 insertions(+), 122 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index d8456ccf52..e86b5e92da 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -116,6 +116,11 @@ struct IOMMUNotifier {
 };
 typedef struct IOMMUNotifier IOMMUNotifier;
 
+typedef struct IOMMUTLBEvent {
+    IOMMUNotifierFlag type;
+    IOMMUTLBEntry entry;
+} IOMMUTLBEvent;
+
 /* RAM is pre-allocated and passed into qemu_ram_alloc_from_ptr */
 #define RAM_PREALLOC   (1 << 0)
 
@@ -1326,24 +1331,18 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr);
 /**
  * memory_region_notify_iommu: notify a change in an IOMMU translation entry.
  *
- * The notification type will be decided by entry.perm bits:
- *
- * - For UNMAP (cache invalidation) notifies: set entry.perm to IOMMU_NONE.
- * - For MAP (newly added entry) notifies: set entry.perm to the
- *   permission of the page (which is definitely !IOMMU_NONE).
- *
  * Note: for any IOMMU implementation, an in-place mapping change
  * should be notified with an UNMAP followed by a MAP.
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
@@ -1353,12 +1352,12 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
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
index 273f5f7dce..bbca0e9f20 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -800,7 +800,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                uint8_t tg, uint64_t num_pages)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     uint8_t granule = tg;
 
     if (!tg) {
@@ -823,12 +823,13 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
index 067593b9e4..56180b1c43 100644
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
+    memory_region_notify_iommu(private, 0, *event);
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
@@ -3485,19 +3494,20 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
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
@@ -3533,9 +3543,9 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
     vtd_switch_address_space_all(s);
 }
 
-static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
+static int vtd_replay_hook(IOMMUTLBEvent *event, void *private)
 {
-    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one(private, event);
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
index 0790239ba5..30352df00e 100644
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
+    event.type = event.entry.perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMAP;
+    memory_region_notify_iommu(&tcet->iommu, 0, event);
 
     return H_SUCCESS;
 }
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 70bfd91bf7..d9e1e29f1e 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -602,15 +602,18 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
                                       S390IOTLBEntry *entry)
 {
     S390IOTLBEntry *cache = g_hash_table_lookup(iommu->iotlb, &entry->iova);
-    IOMMUTLBEntry notify = {
-        .target_as = &address_space_memory,
-        .iova = entry->iova,
-        .translated_addr = entry->translated_addr,
-        .perm = entry->perm,
-        .addr_mask = ~PAGE_MASK,
+    IOMMUTLBEvent event = {
+        .type = entry->perm ? IOMMU_NOTIFIER_MAP : IOMMU_NOTIFIER_UNMAP,
+        .entry = {
+            .target_as = &address_space_memory,
+            .iova = entry->iova,
+            .translated_addr = entry->translated_addr,
+            .perm = entry->perm,
+            .addr_mask = ~PAGE_MASK,
+        },
     };
 
-    if (entry->perm == IOMMU_NONE) {
+    if (event.type == IOMMU_NOTIFIER_UNMAP) {
         if (!cache) {
             goto out;
         }
@@ -623,9 +626,11 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
                 goto out;
             }
 
-            notify.perm = IOMMU_NONE;
-            memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
-            notify.perm = entry->perm;
+            event.type = IOMMU_NOTIFIER_UNMAP;
+            event.entry.perm = IOMMU_NONE;
+            memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
+            event.type = IOMMU_NOTIFIER_MAP;
+            event.entry.perm = entry->perm;
         }
 
         cache = g_new(S390IOTLBEntry, 1);
@@ -637,7 +642,7 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         dec_dma_avail(iommu);
     }
 
-    memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
+    memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
 
 out:
     return iommu->dma_limit ? iommu->dma_limit->avail : 1;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index fc5c75d693..cea8811295 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -129,7 +129,7 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                     hwaddr virt_end, hwaddr paddr,
                                     uint32_t flags)
 {
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
     IOMMUAccessFlags perm = IOMMU_ACCESS_FLAG(flags & VIRTIO_IOMMU_MAP_F_READ,
                                               flags & VIRTIO_IOMMU_MAP_F_WRITE);
 
@@ -141,19 +141,20 @@ static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr virt_start,
     trace_virtio_iommu_notify_map(mr->parent_obj.name, virt_start, virt_end,
                                   paddr, perm);
 
-    entry.target_as = &address_space_memory;
-    entry.addr_mask = virt_end - virt_start;
-    entry.iova = virt_start;
-    entry.perm = perm;
-    entry.translated_addr = paddr;
+    event.type = IOMMU_NOTIFIER_MAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.addr_mask = virt_end - virt_start;
+    event.entry.iova = virt_start;
+    event.entry.perm = perm;
+    event.entry.translated_addr = paddr;
 
-    memory_region_notify_iommu(mr, 0, entry);
+    memory_region_notify_iommu(mr, 0, event);
 }
 
 static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
-    IOMMUTLBEntry entry;
+    IOMMUTLBEvent event;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -161,13 +162,14 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     trace_virtio_iommu_notify_unmap(mr->parent_obj.name, virt_start, virt_end);
 
-    entry.target_as = &address_space_memory;
-    entry.addr_mask = virt_end - virt_start;
-    entry.iova = virt_start;
-    entry.perm = IOMMU_NONE;
-    entry.translated_addr = 0;
+    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.entry.target_as = &address_space_memory;
+    event.entry.addr_mask = virt_end - virt_start;
+    event.entry.iova = virt_start;
+    event.entry.perm = IOMMU_NONE;
+    event.entry.translated_addr = 0;
 
-    memory_region_notify_iommu(mr, 0, entry);
+    memory_region_notify_iommu(mr, 0, event);
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 44de610c72..6ca87e8d73 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1943,11 +1943,15 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
 }
 
 void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
-                                    IOMMUTLBEntry *entry)
+                                    IOMMUTLBEvent *event)
 {
-    IOMMUNotifierFlag request_flags;
+    IOMMUTLBEntry *entry = &event->entry;
     hwaddr entry_end = entry->iova + entry->addr_mask;
 
+    if (event->type == IOMMU_NOTIFIER_UNMAP) {
+        assert(entry->perm == IOMMU_NONE);
+    }
+
     /*
      * Skip the notification if the notification does not overlap
      * with registered range.
@@ -1958,20 +1962,14 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
 
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
 
@@ -1979,7 +1977,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_iommu_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &event);
         }
     }
 }
-- 
MST


