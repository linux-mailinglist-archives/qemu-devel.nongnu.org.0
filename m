Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDA382BAF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:00:52 +0200 (CEST)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libvV-0002GC-7z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIv-0007Yi-G8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIt-0006oR-Id
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KzM42Rml27dkH6iNd0m6+OsX0NfwgHAvsLBM3LPiYc=;
 b=aJptdZHzo67hNcKBpwTCSQXdnXL+ADcyLdCS5YcE/FNz9fpuri5TTVhs7aNH5+YJQe02Hv
 uJ8h35nOlvii1D73qWGgNxWojDD9bQQgoNgXUAkTI0Hd4wfbzDCpeFaE+exB7sOtPyeS/Q
 PENNCE9S8wZdUIPXN36yA+i27cvdY8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-vcqGVW3IPy-obyxcCzbELw-1; Mon, 17 May 2021 07:20:53 -0400
X-MC-Unique: vcqGVW3IPy-obyxcCzbELw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9365A107ACFA
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E325DDAD;
 Mon, 17 May 2021 11:20:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] KVM: Provide helper to sync dirty bitmap from slot to
 ramblock
Date: Mon, 17 May 2021 07:19:56 -0400
Message-Id: <20210517112001.2564006-16-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

kvm_physical_sync_dirty_bitmap() calculates the ramblock offset in an
awkward way from the MemoryRegionSection that passed in from the
caller.  The truth is for each KVMSlot the ramblock offset never
change for the lifecycle.  Cache the ramblock offset for each KVMSlot
into the structure when the KVMSlot is created.

With that, we can further simplify kvm_physical_sync_dirty_bitmap()
with a helper to sync KVMSlot dirty bitmap to the ramblock dirty
bitmap of a specific KVMSlot.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-6-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 37 +++++++++++++++++--------------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index caaa2a5c98..7031dd4250 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -573,15 +573,12 @@ static void kvm_log_stop(MemoryListener *listener,
 }
 
 /* get kvm's dirty pages bitmap and update qemu's */
-static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
-                                         unsigned long *bitmap)
+static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
 {
-    ram_addr_t start = section->offset_within_region +
-                       memory_region_get_ram_addr(section->mr);
-    ram_addr_t pages = int128_get64(section->size) / qemu_real_host_page_size;
+    ram_addr_t start = slot->ram_start_offset;
+    ram_addr_t pages = slot->memory_size / qemu_real_host_page_size;
 
-    cpu_physical_memory_set_dirty_lebitmap(bitmap, start, pages);
-    return 0;
+    cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
 }
 
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
@@ -656,26 +653,19 @@ static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
     KVMState *s = kvm_state;
     KVMSlot *mem;
     hwaddr start_addr, size;
-    hwaddr slot_size, slot_offset = 0;
+    hwaddr slot_size;
 
     size = kvm_align_section(section, &start_addr);
     while (size) {
-        MemoryRegionSection subsection = *section;
-
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
             /* We don't have a slot if we want to trap every access. */
             return;
         }
-
         if (kvm_slot_get_dirty_log(s, mem)) {
-            subsection.offset_within_region += slot_offset;
-            subsection.size = int128_make64(slot_size);
-            kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
+            kvm_slot_sync_dirty_pages(mem);
         }
-
-        slot_offset += slot_size;
         start_addr += slot_size;
         size -= slot_size;
     }
@@ -1134,7 +1124,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     int err;
     MemoryRegion *mr = section->mr;
     bool writeable = !mr->readonly && !mr->rom_device;
-    hwaddr start_addr, size, slot_size;
+    hwaddr start_addr, size, slot_size, mr_offset;
+    ram_addr_t ram_start_offset;
     void *ram;
 
     if (!memory_region_is_ram(mr)) {
@@ -1152,9 +1143,13 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         return;
     }
 
-    /* use aligned delta to align the ram address */
-    ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
-          (start_addr - section->offset_within_address_space);
+    /* The offset of the kvmslot within the memory region */
+    mr_offset = section->offset_within_region + start_addr -
+        section->offset_within_address_space;
+
+    /* use aligned delta to align the ram address and offset */
+    ram = memory_region_get_ram_ptr(mr) + mr_offset;
+    ram_start_offset = memory_region_get_ram_addr(mr) + mr_offset;
 
     kvm_slots_lock();
 
@@ -1193,6 +1188,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
+        mem->ram_start_offset = ram_start_offset;
         mem->ram = ram;
         mem->flags = kvm_mem_flags(mr);
         kvm_slot_init_dirty_bitmap(mem);
@@ -1203,6 +1199,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
             abort();
         }
         start_addr += slot_size;
+        ram_start_offset += slot_size;
         ram += slot_size;
         size -= slot_size;
     } while (size);
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index e13075f738..ab09a150e1 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -25,6 +25,8 @@ typedef struct KVMSlot
     unsigned long *dirty_bmap;
     /* Cache of the address space ID */
     int as_id;
+    /* Cache of the offset in ram address space */
+    ram_addr_t ram_start_offset;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.27.0



