Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC90382BD9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:11:48 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lic67-0003Zu-5f
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libJE-0008KT-2O
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libJA-0006xH-HM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jN2Pf3RbH+yUCNlJcOmXgXPvk1OEDE9ZNG53yLXR2h8=;
 b=RXRwAHzyUSXuLC/73t1kJM/Bk72o2WZqpiiZwLzlL67Hbjx7fRdf2VpmXugG5fSwKh3mNC
 2HwG5ilOIWVixxAS0XmAGSEg4DUrqE6EuQ2YZEaHF8skCV+EotPXTIX2d6X7aVnScRv4x2
 sKKN+uzSxWBngA2oH3ItG/JRMgc2QT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-yFltl7JiPfS72lzNsvRCZQ-1; Mon, 17 May 2021 07:21:10 -0400
X-MC-Unique: yFltl7JiPfS72lzNsvRCZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474B68049C5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:21:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 998A3100AE43;
 Mon, 17 May 2021 11:21:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] KVM: Dirty ring support
Date: Mon, 17 May 2021 07:20:01 -0400
Message-Id: <20210517112001.2564006-21-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

KVM dirty ring is a new interface to pass over dirty bits from kernel to the
userspace.  Instead of using a bitmap for each memory region, the dirty ring
contains an array of dirtied GPAs to fetch (in the form of offset in slots).
For each vcpu there will be one dirty ring that binds to it.

kvm_dirty_ring_reap() is the major function to collect dirty rings.  It can be
called either by a standalone reaper thread that runs in the background,
collecting dirty pages for the whole VM.  It can also be called directly by any
thread that has BQL taken.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-11-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c    | 374 ++++++++++++++++++++++++++++++++++++++++-
 accel/kvm/trace-events |   7 +
 include/hw/core/cpu.h  |   7 +
 3 files changed, 385 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e1a6c7c89b..3f16901950 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include <sys/ioctl.h>
+#include <poll.h>
 
 #include <linux/kvm.h>
 
@@ -78,6 +79,25 @@ struct KVMParkedVcpu {
     QLIST_ENTRY(KVMParkedVcpu) node;
 };
 
+enum KVMDirtyRingReaperState {
+    KVM_DIRTY_RING_REAPER_NONE = 0,
+    /* The reaper is sleeping */
+    KVM_DIRTY_RING_REAPER_WAIT,
+    /* The reaper is reaping for dirty pages */
+    KVM_DIRTY_RING_REAPER_REAPING,
+};
+
+/*
+ * KVM reaper instance, responsible for collecting the KVM dirty bits
+ * via the dirty ring.
+ */
+struct KVMDirtyRingReaper {
+    /* The reaper thread */
+    QemuThread reaper_thr;
+    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
+    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
+};
+
 struct KVMState
 {
     AccelState parent_obj;
@@ -128,6 +148,7 @@ struct KVMState
     } *as;
     uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    struct KVMDirtyRingReaper reaper;
 };
 
 KVMState *kvm_state;
@@ -389,6 +410,13 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
         goto err;
     }
 
+    if (cpu->kvm_dirty_gfns) {
+        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_size);
+        if (ret < 0) {
+            goto err;
+        }
+    }
+
     vcpu = g_malloc0(sizeof(*vcpu));
     vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
     vcpu->kvm_fd = cpu->kvm_fd;
@@ -465,6 +493,19 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
             (void *)cpu->kvm_run + s->coalesced_mmio * PAGE_SIZE;
     }
 
+    if (s->kvm_dirty_ring_size) {
+        /* Use MAP_SHARED to share pages with the kernel */
+        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_size,
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   cpu->kvm_fd,
+                                   PAGE_SIZE * KVM_DIRTY_LOG_PAGE_OFFSET);
+        if (cpu->kvm_dirty_gfns == MAP_FAILED) {
+            ret = -errno;
+            DPRINTF("mmap'ing vcpu dirty gfns failed: %d\n", ret);
+            goto err;
+        }
+    }
+
     ret = kvm_arch_init_vcpu(cpu);
     if (ret < 0) {
         error_setg_errno(errp, -ret,
@@ -583,6 +624,11 @@ static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
     cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
 }
 
+static void kvm_slot_reset_dirty_pages(KVMSlot *slot)
+{
+    memset(slot->dirty_bmap, 0, slot->dirty_bmap_size);
+}
+
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
 
 /* Allocate the dirty bitmap for a slot  */
@@ -639,6 +685,171 @@ static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
     return ret == 0;
 }
 
+/* Should be with all slots_lock held for the address spaces. */
+static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
+                                     uint32_t slot_id, uint64_t offset)
+{
+    KVMMemoryListener *kml;
+    KVMSlot *mem;
+
+    if (as_id >= s->nr_as) {
+        return;
+    }
+
+    kml = s->as[as_id].ml;
+    mem = &kml->slots[slot_id];
+
+    if (!mem->memory_size || offset >=
+        (mem->memory_size / qemu_real_host_page_size)) {
+        return;
+    }
+
+    set_bit(offset, mem->dirty_bmap);
+}
+
+static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
+{
+    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
+}
+
+static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
+{
+    gfn->flags = KVM_DIRTY_GFN_F_RESET;
+}
+
+/*
+ * Should be with all slots_lock held for the address spaces.  It returns the
+ * dirty page we've collected on this dirty ring.
+ */
+static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
+{
+    struct kvm_dirty_gfn *dirty_gfns = cpu->kvm_dirty_gfns, *cur;
+    uint32_t ring_size = s->kvm_dirty_ring_size;
+    uint32_t count = 0, fetch = cpu->kvm_fetch_index;
+
+    assert(dirty_gfns && ring_size);
+    trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
+
+    while (true) {
+        cur = &dirty_gfns[fetch % ring_size];
+        if (!dirty_gfn_is_dirtied(cur)) {
+            break;
+        }
+        kvm_dirty_ring_mark_page(s, cur->slot >> 16, cur->slot & 0xffff,
+                                 cur->offset);
+        dirty_gfn_set_collected(cur);
+        trace_kvm_dirty_ring_page(cpu->cpu_index, fetch, cur->offset);
+        fetch++;
+        count++;
+    }
+    cpu->kvm_fetch_index = fetch;
+
+    return count;
+}
+
+/* Must be with slots_lock held */
+static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
+{
+    int ret;
+    CPUState *cpu;
+    uint64_t total = 0;
+    int64_t stamp;
+
+    stamp = get_clock();
+
+    CPU_FOREACH(cpu) {
+        total += kvm_dirty_ring_reap_one(s, cpu);
+    }
+
+    if (total) {
+        ret = kvm_vm_ioctl(s, KVM_RESET_DIRTY_RINGS);
+        assert(ret == total);
+    }
+
+    stamp = get_clock() - stamp;
+
+    if (total) {
+        trace_kvm_dirty_ring_reap(total, stamp / 1000);
+    }
+
+    return total;
+}
+
+/*
+ * Currently for simplicity, we must hold BQL before calling this.  We can
+ * consider to drop the BQL if we're clear with all the race conditions.
+ */
+static uint64_t kvm_dirty_ring_reap(KVMState *s)
+{
+    uint64_t total;
+
+    /*
+     * We need to lock all kvm slots for all address spaces here,
+     * because:
+     *
+     * (1) We need to mark dirty for dirty bitmaps in multiple slots
+     *     and for tons of pages, so it's better to take the lock here
+     *     once rather than once per page.  And more importantly,
+     *
+     * (2) We must _NOT_ publish dirty bits to the other threads
+     *     (e.g., the migration thread) via the kvm memory slot dirty
+     *     bitmaps before correctly re-protect those dirtied pages.
+     *     Otherwise we can have potential risk of data corruption if
+     *     the page data is read in the other thread before we do
+     *     reset below.
+     */
+    kvm_slots_lock();
+    total = kvm_dirty_ring_reap_locked(s);
+    kvm_slots_unlock();
+
+    return total;
+}
+
+static void do_kvm_cpu_synchronize_kick(CPUState *cpu, run_on_cpu_data arg)
+{
+    /* No need to do anything */
+}
+
+/*
+ * Kick all vcpus out in a synchronized way.  When returned, we
+ * guarantee that every vcpu has been kicked and at least returned to
+ * userspace once.
+ */
+static void kvm_cpu_synchronize_kick_all(void)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        run_on_cpu(cpu, do_kvm_cpu_synchronize_kick, RUN_ON_CPU_NULL);
+    }
+}
+
+/*
+ * Flush all the existing dirty pages to the KVM slot buffers.  When
+ * this call returns, we guarantee that all the touched dirty pages
+ * before calling this function have been put into the per-kvmslot
+ * dirty bitmap.
+ *
+ * This function must be called with BQL held.
+ */
+static void kvm_dirty_ring_flush(void)
+{
+    trace_kvm_dirty_ring_flush(0);
+    /*
+     * The function needs to be serialized.  Since this function
+     * should always be with BQL held, serialization is guaranteed.
+     * However, let's be sure of it.
+     */
+    assert(qemu_mutex_iothread_locked());
+    /*
+     * First make sure to flush the hardware buffers by kicking all
+     * vcpus out in a synchronous way.
+     */
+    kvm_cpu_synchronize_kick_all();
+    kvm_dirty_ring_reap(kvm_state);
+    trace_kvm_dirty_ring_flush(1);
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -1164,7 +1375,24 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_slot_get_dirty_log(kvm_state, mem);
+                /*
+                 * NOTE: We should be aware of the fact that here we're only
+                 * doing a best effort to sync dirty bits.  No matter whether
+                 * we're using dirty log or dirty ring, we ignored two facts:
+                 *
+                 * (1) dirty bits can reside in hardware buffers (PML)
+                 *
+                 * (2) after we collected dirty bits here, pages can be dirtied
+                 * again before we do the final KVM_SET_USER_MEMORY_REGION to
+                 * remove the slot.
+                 *
+                 * Not easy.  Let's cross the fingers until it's fixed.
+                 */
+                if (kvm_state->kvm_dirty_ring_size) {
+                    kvm_dirty_ring_reap_locked(kvm_state);
+                } else {
+                    kvm_slot_get_dirty_log(kvm_state, mem);
+                }
                 kvm_slot_sync_dirty_pages(mem);
             }
 
@@ -1212,6 +1440,51 @@ out:
     kvm_slots_unlock();
 }
 
+static void *kvm_dirty_ring_reaper_thread(void *data)
+{
+    KVMState *s = data;
+    struct KVMDirtyRingReaper *r = &s->reaper;
+
+    rcu_register_thread();
+
+    trace_kvm_dirty_ring_reaper("init");
+
+    while (true) {
+        r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
+        trace_kvm_dirty_ring_reaper("wait");
+        /*
+         * TODO: provide a smarter timeout rather than a constant?
+         */
+        sleep(1);
+
+        trace_kvm_dirty_ring_reaper("wakeup");
+        r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
+
+        qemu_mutex_lock_iothread();
+        kvm_dirty_ring_reap(s);
+        qemu_mutex_unlock_iothread();
+
+        r->reaper_iteration++;
+    }
+
+    trace_kvm_dirty_ring_reaper("exit");
+
+    rcu_unregister_thread();
+
+    return NULL;
+}
+
+static int kvm_dirty_ring_reaper_init(KVMState *s)
+{
+    struct KVMDirtyRingReaper *r = &s->reaper;
+
+    qemu_thread_create(&r->reaper_thr, "kvm-reaper",
+                       kvm_dirty_ring_reaper_thread,
+                       s, QEMU_THREAD_JOINABLE);
+
+    return 0;
+}
+
 static void kvm_region_add(MemoryListener *listener,
                            MemoryRegionSection *section)
 {
@@ -1240,6 +1513,36 @@ static void kvm_log_sync(MemoryListener *listener,
     kvm_slots_unlock();
 }
 
+static void kvm_log_sync_global(MemoryListener *l)
+{
+    KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
+    KVMState *s = kvm_state;
+    KVMSlot *mem;
+    int i;
+
+    /* Flush all kernel dirty addresses into KVMSlot dirty bitmap */
+    kvm_dirty_ring_flush();
+
+    /*
+     * TODO: make this faster when nr_slots is big while there are
+     * only a few used slots (small VMs).
+     */
+    kvm_slots_lock();
+    for (i = 0; i < s->nr_slots; i++) {
+        mem = &kml->slots[i];
+        if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+            kvm_slot_sync_dirty_pages(mem);
+            /*
+             * This is not needed by KVM_GET_DIRTY_LOG because the
+             * ioctl will unconditionally overwrite the whole region.
+             * However kvm dirty ring has no such side effect.
+             */
+            kvm_slot_reset_dirty_pages(mem);
+        }
+    }
+    kvm_slots_unlock();
+}
+
 static void kvm_log_clear(MemoryListener *listener,
                           MemoryRegionSection *section)
 {
@@ -1345,10 +1648,15 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
     kml->listener.region_del = kvm_region_del;
     kml->listener.log_start = kvm_log_start;
     kml->listener.log_stop = kvm_log_stop;
-    kml->listener.log_sync = kvm_log_sync;
-    kml->listener.log_clear = kvm_log_clear;
     kml->listener.priority = 10;
 
+    if (s->kvm_dirty_ring_size) {
+        kml->listener.log_sync_global = kvm_log_sync_global;
+    } else {
+        kml->listener.log_sync = kvm_log_sync;
+        kml->listener.log_clear = kvm_log_clear;
+    }
+
     memory_listener_register(&kml->listener, as);
 
     for (i = 0; i < s->nr_as; ++i) {
@@ -2131,12 +2439,53 @@ static int kvm_init(MachineState *ms)
     s->coalesced_pio = s->coalesced_mmio &&
                        kvm_check_extension(s, KVM_CAP_COALESCED_PIO);
 
+    /*
+     * Enable KVM dirty ring if supported, otherwise fall back to
+     * dirty logging mode
+     */
+    if (s->kvm_dirty_ring_size > 0) {
+        uint64_t ring_bytes;
+
+        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
+
+        /* Read the max supported pages */
+        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+        if (ret > 0) {
+            if (ring_bytes > ret) {
+                error_report("KVM dirty ring size %" PRIu32 " too big "
+                             "(maximum is %ld).  Please use a smaller value.",
+                             s->kvm_dirty_ring_size,
+                             (long)ret / sizeof(struct kvm_dirty_gfn));
+                ret = -EINVAL;
+                goto err;
+            }
+
+            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+            if (ret) {
+                error_report("Enabling of KVM dirty ring failed: %s. "
+                             "Suggested mininum value is 1024.", strerror(-ret));
+                goto err;
+            }
+
+            s->kvm_dirty_ring_bytes = ring_bytes;
+        }
+    } else {
+        warn_report("KVM dirty ring not available, using bitmap method");
+        s->kvm_dirty_ring_size = 0;
+    }
+
     /*
      * KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is not needed when dirty ring is
      * enabled.  More importantly, KVM_DIRTY_LOG_INITIALLY_SET will assume no
      * page is wr-protected initially, which is against how kvm dirty ring is
      * usage - kvm dirty ring requires all pages are wr-protected at the very
      * beginning.  Enabling this feature for dirty ring causes data corruption.
+     *
+     * TODO: Without KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 and kvm clear dirty log,
+     * we may expect a higher stall time when starting the migration.  In the
+     * future we can enable KVM_CLEAR_DIRTY_LOG to work with dirty ring too:
+     * instead of clearing dirty bit, it can be a way to explicitly wr-protect
+     * guest pages.
      */
     if (!s->kvm_dirty_ring_size) {
         dirty_log_manual_caps =
@@ -2239,6 +2588,14 @@ static int kvm_init(MachineState *ms)
         ret = ram_block_discard_disable(true);
         assert(!ret);
     }
+
+    if (s->kvm_dirty_ring_size) {
+        ret = kvm_dirty_ring_reaper_init(s);
+        if (ret) {
+            goto err;
+        }
+    }
+
     return 0;
 
 err:
@@ -2551,6 +2908,17 @@ int kvm_cpu_exec(CPUState *cpu)
         case KVM_EXIT_INTERNAL_ERROR:
             ret = kvm_handle_internal_error(cpu, run);
             break;
+        case KVM_EXIT_DIRTY_RING_FULL:
+            /*
+             * We shouldn't continue if the dirty ring of this vcpu is
+             * still full.  Got kicked by KVM_RESET_DIRTY_RINGS.
+             */
+            trace_kvm_dirty_ring_full(cpu->cpu_index);
+            qemu_mutex_lock_iothread();
+            kvm_dirty_ring_reap(kvm_state);
+            qemu_mutex_unlock_iothread();
+            ret = 0;
+            break;
         case KVM_EXIT_SYSTEM_EVENT:
             switch (run->system_event.type) {
             case KVM_SYSTEM_EVENT_SHUTDOWN:
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index e15ae8980d..72a01320a1 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -18,4 +18,11 @@ kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t
 kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
 kvm_clear_dirty_log(uint32_t slot, uint64_t start, uint32_t size) "slot#%"PRId32" start 0x%"PRIx64" size 0x%"PRIx32
 kvm_resample_fd_notify(int gsi) "gsi %d"
+kvm_dirty_ring_full(int id) "vcpu %d"
+kvm_dirty_ring_reap_vcpu(int id) "vcpu %d"
+kvm_dirty_ring_page(int vcpu, uint32_t slot, uint64_t offset) "vcpu %d fetch %"PRIu32" offset 0x%"PRIx64
+kvm_dirty_ring_reaper(const char *s) "%s"
+kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
+kvm_dirty_ring_reaper_kick(const char *reason) "%s"
+kvm_dirty_ring_flush(int finished) "%d"
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d45f78290e..753ca90668 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -329,6 +329,10 @@ struct qemu_work_item;
  * @ignore_memory_transaction_failures: Cached copy of the MachineState
  *    flag of the same name: allows the board to suppress calling of the
  *    CPU do_transaction_failed hook function.
+ * @kvm_dirty_gfns: Points to the KVM dirty ring for this CPU when KVM dirty
+ *    ring is enabled.
+ * @kvm_fetch_index: Keeps the index that we last fetched from the per-vCPU
+ *    dirty ring structure.
  *
  * State of one CPU core or thread.
  */
@@ -400,9 +404,12 @@ struct CPUState {
      */
     uintptr_t mem_io_pc;
 
+    /* Only used in KVM */
     int kvm_fd;
     struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
+    struct kvm_dirty_gfn *kvm_dirty_gfns;
+    uint32_t kvm_fetch_index;
 
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
-- 
2.27.0


