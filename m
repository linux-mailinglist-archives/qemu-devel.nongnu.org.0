Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F331389FBF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:26:07 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje0M-0008IM-7U
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0005NW-FC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxX-0001X3-BN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2020668wmq.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kzAGXdJzBdfA3QG0wpa3vohEalvQkpe/xDroTVz8aI=;
 b=cbKVhyGtK43alYsCZFGvsWIKWH8VqYgKH8ocJRjAmlndhWGxxCiVYIPU1SCKFxlzXg
 YdTrxr+KofRyUSJ/P7ekCpXF7hCkaTLqLCeafokn8DYLBDmKqF2mqOuFHgCKbmx1l4ef
 m4HWAxmBboeR/DvVZPTJTGN1FLw+0D70PLA1GR+pYwOPRxGghWipyAFeuLm0TOtocVj0
 YpCsO/56GbWM8aLKOM5yBdTl6t8YCGxGZSS4M16qFcw0o2WgzJ1rywWLO1P71ZRabQC+
 xi2HVMOsMypKL93JvFxnDtBhEDabFYmD6sI7xju5C3wEaInzHpPqC/kiKVrcNa44hpH6
 M07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0kzAGXdJzBdfA3QG0wpa3vohEalvQkpe/xDroTVz8aI=;
 b=RizCu750q+aW8L4//qOcueh10FZ0bLjfp5Wzi+EqzD3WBcWdUx5souqioVej3XlKyW
 eNnuUhLzq/clWt/tO0KX3Pz/H0moZfIghoi09dHlOYSqVx5XkfSIJCY9HMz46TdO9Cq5
 Tvb0hQIRZkyIZIupU5Q2Ky3dLq5E65MOl/yBK5mOqhUoW4KWlnlvnkFhZoUtjFXyHrcX
 LXjDS3OljV7Aldcbg1qlmuldjedw0KIkY3BGADlTFLc2YTeUNnNNebWVGU9M9660JaNM
 r/MgGxE7rdiBJ5838KEfE5RGFmyY3EJYQwvouhcibQCUG5lnFrGllRX9ZqS8N2M7JdzK
 Hh4A==
X-Gm-Message-State: AOAM530A2YvaaA5EOQg8ndsKjCBbMbRm32agu8IlEYupgRHt1edpAVao
 ZzaQERmgJaLxx+ampZU8mMn4t6ZsfoHzBQ==
X-Google-Smtp-Source: ABdhPJw0oSvdRr2EPcCNbtVUU7uJ580dAnL6go8hzpxEIz0EmdpdwAwrPbksldHyKiTWEPQB41ZvAg==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr2428979wmp.164.1621498987759; 
 Thu, 20 May 2021 01:23:07 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] KVM: Provide helper to sync dirty bitmap from slot to
 ramblock
Date: Thu, 20 May 2021 10:22:45 +0200
Message-Id: <20210520082257.187061-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
2.31.1



