Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF468BB5E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:23:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzaU-00053N-Kb; Mon, 06 Feb 2023 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaR-0004zl-0v
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaP-0003XM-71
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pBZkvwO/MSacYruR8vBHavjUuE24O9czHcjOtXLm1A=;
 b=Q1Czvk/7vagchrxbSnhgWCIoyK5Suq8AkFWKnnIr4XaIDmahcGaEbm0Ni6jtoR7Nx2dfQU
 eSOutn+TkFwZfSeQ82sEVrinjJHyKzVulayolZNFhKR09B0HcEZpDMRBeG3gnGOkfy0SJx
 xkFp/XeJe6Qd+pckEr3cKVe768YOc5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-l4xcpkjLNuORLG3vQhMfmw-1; Mon, 06 Feb 2023 06:21:22 -0500
X-MC-Unique: l4xcpkjLNuORLG3vQhMfmw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D65A41875041;
 Mon,  6 Feb 2023 11:21:21 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F04E2492B21;
 Mon,  6 Feb 2023 11:21:10 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 4/8] kvm: Introduce secondary dirty bitmap
Date: Mon,  6 Feb 2023 19:20:06 +0800
Message-Id: <20230206112010.99871-5-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When dirty ring is enabled on ARM64, the backup bitmap may be used
to track the dirty pages in no-running-vcpu situations. The original
bitmap is the primary one, used for the dirty ring buffer. We need
the secondary bitmap to collect the backup bitmap for ARM64.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c      | 50 ++++++++++++++++++++++++++++++----------
 include/sysemu/kvm_int.h |  1 +
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 01a6a026af..1a93985574 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -553,13 +553,29 @@ static void kvm_log_stop(MemoryListener *listener,
     }
 }
 
+static unsigned long *kvm_slot_dirty_bitmap(KVMSlot *slot, bool primary)
+{
+    if (primary) {
+        return slot->dirty_bmap;
+    }
+
+    return slot->dirty_bmap +
+           slot->dirty_bmap_size / sizeof(slot->dirty_bmap[0]);
+}
+
 /* get kvm's dirty pages bitmap and update qemu's */
-static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
+static void kvm_slot_sync_dirty_pages(KVMSlot *slot, bool primary)
 {
+    KVMState *s = kvm_state;
+    unsigned long *bmap = kvm_slot_dirty_bitmap(slot, primary);
     ram_addr_t start = slot->ram_start_offset;
     ram_addr_t pages = slot->memory_size / qemu_real_host_page_size();
 
-    cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
+    if (!s->kvm_dirty_ring_with_bitmap && !primary) {
+        return;
+    }
+
+    cpu_physical_memory_set_dirty_lebitmap(bmap, start, pages);
 }
 
 static void kvm_slot_reset_dirty_pages(KVMSlot *slot)
@@ -572,6 +588,9 @@ static void kvm_slot_reset_dirty_pages(KVMSlot *slot)
 /* Allocate the dirty bitmap for a slot  */
 static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
 {
+    KVMState *s = kvm_state;
+    hwaddr bitmap_size, alloc_size;
+
     if (!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) || mem->dirty_bmap) {
         return;
     }
@@ -593,9 +612,11 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
      * And mem->memory_size is aligned to it (otherwise this mem can't
      * be registered to KVM).
      */
-    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size(),
-                                        /*HOST_LONG_BITS*/ 64) / 8;
-    mem->dirty_bmap = g_malloc0(bitmap_size);
+    bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size(),
+                        /*HOST_LONG_BITS*/ 64) / 8;
+    alloc_size = s->kvm_dirty_ring_with_bitmap ? 2 * bitmap_size : bitmap_size;
+
+    mem->dirty_bmap = g_malloc0(alloc_size);
     mem->dirty_bmap_size = bitmap_size;
 }
 
@@ -603,12 +624,16 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
  * Sync dirty bitmap from kernel to KVMSlot.dirty_bmap, return true if
  * succeeded, false otherwise
  */
-static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
+static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot, bool primary)
 {
     struct kvm_dirty_log d = {};
     int ret;
 
-    d.dirty_bitmap = slot->dirty_bmap;
+    if (!s->kvm_dirty_ring_with_bitmap && !primary) {
+        return false;
+    }
+
+    d.dirty_bitmap = kvm_slot_dirty_bitmap(slot, primary);
     d.slot = slot->slot | (slot->as_id << 16);
     ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
 
@@ -839,8 +864,8 @@ static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
             /* We don't have a slot if we want to trap every access. */
             return;
         }
-        if (kvm_slot_get_dirty_log(s, mem)) {
-            kvm_slot_sync_dirty_pages(mem);
+        if (kvm_slot_get_dirty_log(s, mem, true)) {
+            kvm_slot_sync_dirty_pages(mem, true);
         }
         start_addr += slot_size;
         size -= slot_size;
@@ -1353,9 +1378,9 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 if (kvm_state->kvm_dirty_ring_size) {
                     kvm_dirty_ring_reap_locked(kvm_state, NULL);
                 } else {
-                    kvm_slot_get_dirty_log(kvm_state, mem);
+                    kvm_slot_get_dirty_log(kvm_state, mem, true);
                 }
-                kvm_slot_sync_dirty_pages(mem);
+                kvm_slot_sync_dirty_pages(mem, true);
             }
 
             /* unregister the slot */
@@ -1572,7 +1597,7 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
     for (i = 0; i < s->nr_slots; i++) {
         mem = &kml->slots[i];
         if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-            kvm_slot_sync_dirty_pages(mem);
+            kvm_slot_sync_dirty_pages(mem, true);
             /*
              * This is not needed by KVM_GET_DIRTY_LOG because the
              * ioctl will unconditionally overwrite the whole region.
@@ -3701,6 +3726,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
     /* KVM dirty ring is by default off */
     s->kvm_dirty_ring_size = 0;
+    s->kvm_dirty_ring_with_bitmap = false;
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
 }
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 60b520a13e..fdd5b1bde0 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -115,6 +115,7 @@ struct KVMState
     } *as;
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    bool kvm_dirty_ring_with_bitmap;
     struct KVMDirtyRingReaper reaper;
     NotifyVmexitOption notify_vmexit;
     uint32_t notify_window;
-- 
2.23.0


