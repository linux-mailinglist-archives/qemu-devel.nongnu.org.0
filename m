Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A638F255
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:36:33 +0200 (CEST)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEVE-00014v-53
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeU-00055X-OS
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:04 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004MS-6R
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id c20so42856068ejm.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoh7aaW0HkXExKTvgyPRoyUhprnmP0RXGSbOvZabGVI=;
 b=YxCtP9HTWQZ3fma7pN6vIk6ug7EYiPzAL3YuSQrFYYED+tb3cfmZuvaVmNDZApBJrx
 RhYL+x+QTIiXR3gPPXcmuNP1sb5xeIFhooK0ClgMoRzIRVg0fUb0aaOUtZ5cpK1M/S2V
 d5GTEi1LpQvF5TNx/0ta8owhKxUrrRpV3qc2AmV6RfaVg+lxuGzzxPPGeyv0H4CnGVcI
 pN1a0WnuBJALuH5eER+18QoAKMPZLWtJUZqEVeL5bEDatLALvLHbRgLbUna1bJySIZK/
 zqryqqEwbxVrmbc/XFX1A+SZh8RZ1awDlde0JUYdyJgut7YyEBeluOC4hsn3oDhcBp6i
 kOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yoh7aaW0HkXExKTvgyPRoyUhprnmP0RXGSbOvZabGVI=;
 b=NGxUkho1QjyBy6BGu1G7mqIhnOITQjrKyr0EMn0xtMJrabsVdDTudDeTmblrodblJm
 iNYF6lIeccwok5RNeUih6sk4WjGcroZR8HvGJUJ1ptqVOFzHDBoSl1yoVt1aepzQ1+Cq
 Oh/YkpjUoxSt68COWzXhzhM4DoKdegvuU/OIuKVCocXa86fpvGJEvcWx05NK9Ix+RQfj
 cx/f4vL7UV51yddKTeJHpVo5TS8jLVEU4xGZOUlLhoxcGxPrtsvCn8V09uYX42Y0A5uI
 0z6f2C27N+SCA2rLmyhsQAMIvQX4HlSkM+dS1URoHI9OnuEo0GwDHoARAj+l19K26wyV
 cauQ==
X-Gm-Message-State: AOAM533LGBVNKnB6S0ykqQgWJoLC9tYKN0/oLiCkLrUQs6gjjUzWaA4z
 jM4mBFoOKR8Csi6ME0iB+obPXAHRMVlBTA==
X-Google-Smtp-Source: ABdhPJytkx+Zh8Qg+KJZnYo/v6fWKB5DBpW3ui8pu6KccaaADjEGtcW2Z8IhAEfne3k31uKVYxButw==
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr23739491ejk.94.1621874500882; 
 Mon, 24 May 2021 09:41:40 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] KVM: Provide helper to get kvm dirty log
Date: Mon, 24 May 2021 18:41:15 +0200
Message-Id: <20210524164131.383778-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Provide a helper kvm_slot_get_dirty_log() to make the function
kvm_physical_sync_dirty_bitmap() clearer.  We can even cache the as_id
into KVMSlot when it is created, so that we don't even need to pass it
down every time.

Since at it, remove return value of kvm_physical_sync_dirty_bitmap()
because it should never fail.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-5-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 52 +++++++++++++++++++++++-----------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5bc40fd71b..caaa2a5c98 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -615,6 +615,30 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
 
+/*
+ * Sync dirty bitmap from kernel to KVMSlot.dirty_bmap, return true if
+ * succeeded, false otherwise
+ */
+static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
+{
+    struct kvm_dirty_log d = {};
+    int ret;
+
+    d.dirty_bitmap = slot->dirty_bmap;
+    d.slot = slot->slot | (slot->as_id << 16);
+    ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
+
+    if (ret == -ENOENT) {
+        /* kernel does not have dirty bitmap in this slot */
+        ret = 0;
+    }
+    if (ret) {
+        error_report_once("%s: KVM_GET_DIRTY_LOG failed with %d",
+                          __func__, ret);
+    }
+    return ret == 0;
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -626,15 +650,13 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
  * @kml: the KVM memory listener object
  * @section: the memory section to sync the dirty bitmap with
  */
-static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
-                                          MemoryRegionSection *section)
+static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
+                                           MemoryRegionSection *section)
 {
     KVMState *s = kvm_state;
-    struct kvm_dirty_log d = {};
     KVMSlot *mem;
     hwaddr start_addr, size;
     hwaddr slot_size, slot_offset = 0;
-    int ret = 0;
 
     size = kvm_align_section(section, &start_addr);
     while (size) {
@@ -644,19 +666,10 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
             /* We don't have a slot if we want to trap every access. */
-            goto out;
+            return;
         }
 
-        d.dirty_bitmap = mem->dirty_bmap;
-        d.slot = mem->slot | (kml->as_id << 16);
-        ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
-        if (ret == -ENOENT) {
-            /* kernel does not have dirty bitmap in this slot */
-            ret = 0;
-        } else if (ret < 0) {
-            error_report("ioctl KVM_GET_DIRTY_LOG failed: %d", errno);
-            goto out;
-        } else {
+        if (kvm_slot_get_dirty_log(s, mem)) {
             subsection.offset_within_region += slot_offset;
             subsection.size = int128_make64(slot_size);
             kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
@@ -666,8 +679,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         start_addr += slot_size;
         size -= slot_size;
     }
-out:
-    return ret;
 }
 
 /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
@@ -1179,6 +1190,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     do {
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_alloc_slot(kml);
+        mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
         mem->ram = ram;
@@ -1221,14 +1233,10 @@ static void kvm_log_sync(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
-    int r;
 
     kvm_slots_lock();
-    r = kvm_physical_sync_dirty_bitmap(kml, section);
+    kvm_physical_sync_dirty_bitmap(kml, section);
     kvm_slots_unlock();
-    if (r < 0) {
-        abort();
-    }
 }
 
 static void kvm_log_clear(MemoryListener *listener,
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1da30e1884..e13075f738 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,8 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    /* Cache of the address space ID */
+    int as_id;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.31.1



