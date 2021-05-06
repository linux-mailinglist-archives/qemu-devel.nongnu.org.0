Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A328375879
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:31:35 +0200 (CEST)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leguU-0003X3-8v
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW6-0004bB-QI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1legW3-0003fY-SH
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620317177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVh0xAoOOMX/NGM3qPIyw+U3h4B6uYQ5rF/MtNkkk4g=;
 b=OpqO5utFU1DtQt2vXegswBHgVjU+FcgmD75eV2VkqvSJWyFqYTJ29K3msJGjhzTyw+0e23
 9IjczV5FePGKtM9aMmuPo7nRl5V+IRKJSD/D4TqW7vLzjv6woEL4Qgf82jtq+VOocPVAw8
 u/PqrTcssosjBRHHsCSGF7dDRMWSn+s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-hLw0z3VENEePhv8TeMtRiA-1; Thu, 06 May 2021 12:06:16 -0400
X-MC-Unique: hLw0z3VENEePhv8TeMtRiA-1
Received: by mail-qv1-f72.google.com with SMTP id
 a18-20020a0cca920000b02901d3c6996bb7so4497356qvk.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVh0xAoOOMX/NGM3qPIyw+U3h4B6uYQ5rF/MtNkkk4g=;
 b=ivR2KMrqdYC3uhumwpBXThAzINQAPYh5jvRma389QgCxtgepBUZtcuAO4V/HKqQWc0
 NLZ+1kINXIb+hhg/Ajo816A5aLSXgpW/Jzwbq/zXe8X8/WL55/bDHJ2A95Qk6JsAz/Ku
 KBk99P3Dv27+DC5pMd5I1QOOTX3akVKYD+m2nefGRfPFwL4Hf3s4z8OMouw0t3/m3WAM
 Bp1r6F+xdeZXaqD2oPdCZ58gRKAqFDzvnYMJPhpzayDpRfOpVV7li5emzwjDy8hLviPL
 ztKRgTrcLnygwAonoIIfxUw9OfUhWmfwFogMfAMGrTS9nqiQmX6Ma+LJoG0bo/qcQKkJ
 Hf1Q==
X-Gm-Message-State: AOAM533DaDOSOthAk9HtQGMfNNvP6e0+vfhSsaxKaLkEQe75tSVOP4lS
 01QN6EQOT+uBojB+Q9sJ3X0Vqxsk4mN6VPilsn/dkHML9HYqZnt1AWYYI6lyZHwv/5BA1Dhe9FV
 ioWhbp1DMMNYfWmOiK0XbdCKpW3CzLJkG0b3/nOV7ik4KCrMcGj5UBBCWOUurRM3b
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr5013301qvb.16.1620317174533; 
 Thu, 06 May 2021 09:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYertuHb3u4xdt1Wkyb7WUqgGdA1Fhirn7FKintJSZUAl2+qvezb7j2kFdOwNJyvrzHPWs8g==
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr5013239qvb.16.1620317173923; 
 Thu, 06 May 2021 09:06:13 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id y84sm2194131qkb.134.2021.05.06.09.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 09:06:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/10] KVM: Dirty ring support
Date: Thu,  6 May 2021 12:05:49 -0400
Message-Id: <20210506160549.130416-11-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
References: <20210506160549.130416-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM dirty ring is a new interface to pass over dirty bits from kernel to the
userspace.  Instead of using a bitmap for each memory region, the dirty ring
contains an array of dirtied GPAs to fetch (in the form of offset in slots).
For each vcpu there will be one dirty ring that binds to it.

kvm_dirty_ring_reap() is the major function to collect dirty rings.  It can be
called either by a standalone reaper thread that runs in the background,
collecting dirty pages for the whole VM.  It can also be called directly by any
thread that has BQL taken.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c    | 339 ++++++++++++++++++++++++++++++++++++++++-
 accel/kvm/trace-events |   7 +
 include/hw/core/cpu.h  |   7 +
 3 files changed, 350 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2404c941784..fd8ce2e0b2c 100644
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
@@ -129,6 +149,7 @@ struct KVMState
     bool kvm_dirty_ring_enabled;    /* Whether KVM dirty ring is enabled */
     uint64_t kvm_dirty_ring_size;   /* Size of the per-vcpu dirty ring */
     uint32_t kvm_dirty_gfn_count;   /* Number of dirty GFNs per ring */
+    struct KVMDirtyRingReaper reaper;
 };
 
 KVMState *kvm_state;
@@ -390,6 +411,13 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
@@ -466,6 +494,19 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
             (void *)cpu->kvm_run + s->coalesced_mmio * PAGE_SIZE;
     }
 
+    if (s->kvm_dirty_ring_enabled) {
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
@@ -584,6 +625,11 @@ static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
     cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
 }
 
+static void kvm_slot_reset_dirty_pages(KVMSlot *slot)
+{
+    memset(slot->dirty_bmap, 0, slot->dirty_bmap_size);
+}
+
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
 
 /* Allocate the dirty bitmap for a slot  */
@@ -640,6 +686,171 @@ static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
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
+    uint32_t gfn_count = s->kvm_dirty_gfn_count;
+    uint32_t count = 0, fetch = cpu->kvm_fetch_index;
+
+    assert(dirty_gfns && gfn_count);
+    trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
+
+    while (true) {
+        cur = &dirty_gfns[fetch % gfn_count];
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
@@ -1165,7 +1376,24 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
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
+                if (kvm_state->kvm_dirty_ring_enabled) {
+                    kvm_dirty_ring_reap_locked(kvm_state);
+                } else {
+                    kvm_slot_get_dirty_log(kvm_state, mem);
+                }
                 kvm_slot_sync_dirty_pages(mem);
             }
 
@@ -1213,6 +1441,51 @@ out:
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
@@ -1241,6 +1514,36 @@ static void kvm_log_sync(MemoryListener *listener,
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
@@ -1346,10 +1649,15 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
     kml->listener.region_del = kvm_region_del;
     kml->listener.log_start = kvm_log_start;
     kml->listener.log_stop = kvm_log_stop;
-    kml->listener.log_sync = kvm_log_sync;
-    kml->listener.log_clear = kvm_log_clear;
     kml->listener.priority = 10;
 
+    if (s->kvm_dirty_ring_enabled) {
+        kml->listener.log_sync_global = kvm_log_sync_global;
+    } else {
+        kml->listener.log_sync = kvm_log_sync;
+        kml->listener.log_clear = kvm_log_clear;
+    }
+
     memory_listener_register(&kml->listener, as);
 
     for (i = 0; i < s->nr_as; ++i) {
@@ -2173,6 +2481,12 @@ static int kvm_init(MachineState *ms)
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
     if (!s->kvm_dirty_ring_enabled) {
         dirty_log_manual_caps =
@@ -2275,6 +2589,14 @@ static int kvm_init(MachineState *ms)
         ret = ram_block_discard_disable(true);
         assert(!ret);
     }
+
+    if (s->kvm_dirty_ring_enabled) {
+        ret = kvm_dirty_ring_reaper_init(s);
+        if (ret) {
+            goto err;
+        }
+    }
+
     return 0;
 
 err:
@@ -2587,6 +2909,17 @@ int kvm_cpu_exec(CPUState *cpu)
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
index e15ae8980d3..72a01320a1a 100644
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
index c68bc3ba8af..19f4528c841 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -323,6 +323,10 @@ struct qemu_work_item;
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
@@ -394,9 +398,12 @@ struct CPUState {
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
2.31.1


