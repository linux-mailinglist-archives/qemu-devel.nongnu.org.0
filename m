Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81DC38F212
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE8S-0006Tp-VA
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004o6-8d
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004Mx-Fs
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id s22so42584297ejv.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kzAGXdJzBdfA3QG0wpa3vohEalvQkpe/xDroTVz8aI=;
 b=m4VYHkNWf8V1fOQeRGRoLFRDX+xyleSXvdn332JefXMcL7MsYXdWQ05gqWoNS6Bycm
 OWFAakcLKKeHifBJPVdLJZyFwM/M/n13ODF13+SJsNCqIhBBG9fux99keaxpxztsIUlg
 dwlQVQUh9vIovJtWhn/cfCK/ApfIwKMCzEa+lNP9lZt9vWAbW1hzAoMDBXQtWdNndeFl
 fQWj/8ZFVpKJ+AJFpgmi+YyAIkZ4zY+cOgR8+MS6QwJ3sRdBcqrDX6W+EqnS6Wwzc/ip
 PvVN8C+6S0FSPg9MxIDM2YLN2fkiN4AltEWY+nNAXHpP5oqgIpSvA1B6WJ/hdJLi3r+g
 hVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0kzAGXdJzBdfA3QG0wpa3vohEalvQkpe/xDroTVz8aI=;
 b=DbHziv4xlAoicoGvVXQNxMghLWJmVqJMwoDDSaxLTnIXQbjCMdlYVRmg682qRL1qjt
 DVQ+GbxTwUd1AyCh/nikSlT5Em86jAnOihJTvy/EgzoX4BV27kdjo07IXTcFMvAztXJ7
 wws017nT5Pbm1h34n0GU6NPXDCE46C+7sMp+O86bTjj02tTwqHJ2FUQTfXpMn6rkkrcF
 +QtDPsran+bLtIFoyITJqzfNeRgUJfKDqpL+VDZ/vBsXcqia/Uii+o9U42dTa/R+cAMH
 5lWGofQbHDoSF18IavpGpWxvv1m2dDZLi4+B5bKivon9DOWEtV0W6CGmrtZp0YMFAMSH
 Thfw==
X-Gm-Message-State: AOAM532hWS+EuCxdSifMZ6q7JxcBy8I7e81XQPAquELNr76JW6ZDTRfL
 S+XDrsp+gR8Ei1WHtRK+a/+TgZxKz1lx+w==
X-Google-Smtp-Source: ABdhPJxeeeFBxCcNMhtc70ciE3hIGrVEIa5LLimpEuoYJue9S2UIgbOqI4aERyoqYfTZM4xGOYjLDg==
X-Received: by 2002:a17:906:40d1:: with SMTP id
 a17mr24109509ejk.43.1621874501589; 
 Mon, 24 May 2021 09:41:41 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] KVM: Provide helper to sync dirty bitmap from slot to
 ramblock
Date: Mon, 24 May 2021 18:41:16 +0200
Message-Id: <20210524164131.383778-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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



