Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674934464F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:56:16 +0100 (CET)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOL2V-00061x-5C
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOKkV-0003ry-3Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:37:39 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lOKkP-0007Jr-Ci
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:37:38 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F3wVQ0MQDz92XR;
 Mon, 22 Mar 2021 21:35:26 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Mar 2021 21:37:20 +0800
Subject: Re: [PATCH v5 10/10] KVM: Dirty ring support
To: Peter Xu <peterx@redhat.com>, <qemu-devel@nongnu.org>
References: <20210310203301.194842-1-peterx@redhat.com>
 <20210310203301.194842-11-peterx@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <deeb1fcb-bfad-ec47-49d0-fec7bf4d4391@huawei.com>
Date: Mon, 22 Mar 2021 21:37:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210310203301.194842-11-peterx@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/3/11 4:33, Peter Xu wrote:
> KVM dirty ring is a new interface to pass over dirty bits from kernel to the
> userspace.  Instead of using a bitmap for each memory region, the dirty ring
> contains an array of dirtied GPAs to fetch (in the form of offset in slots).
> For each vcpu there will be one dirty ring that binds to it.
> 
> kvm_dirty_ring_reap() is the major function to collect dirty rings.  It can be
> called either by a standalone reaper thread that runs in the background,
> collecting dirty pages for the whole VM.  It can also be called directly by any
> thread that has BQL taken.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  accel/kvm/kvm-all.c    | 332 ++++++++++++++++++++++++++++++++++++++++-
>  accel/kvm/trace-events |   7 +
>  include/hw/core/cpu.h  |   8 +
>  3 files changed, 344 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ae9393266b2..bf2b21f038b 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -15,6 +15,7 @@
>  
>  #include "qemu/osdep.h"
>  #include <sys/ioctl.h>
> +#include <poll.h>
>  
>  #include <linux/kvm.h>
>  
> @@ -80,6 +81,25 @@ struct KVMParkedVcpu {
>      QLIST_ENTRY(KVMParkedVcpu) node;
>  };
>  
> +enum KVMDirtyRingReaperState {
> +    KVM_DIRTY_RING_REAPER_NONE = 0,
> +    /* The reaper is sleeping */
> +    KVM_DIRTY_RING_REAPER_WAIT,
> +    /* The reaper is reaping for dirty pages */
> +    KVM_DIRTY_RING_REAPER_REAPING,
> +};
> +
> +/*
> + * KVM reaper instance, responsible for collecting the KVM dirty bits
> + * via the dirty ring.
> + */
> +struct KVMDirtyRingReaper {
> +    /* The reaper thread */
> +    QemuThread reaper_thr;
> +    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
> +    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
> +};
> +
>  struct KVMState
>  {
>      AccelState parent_obj;
> @@ -131,6 +151,7 @@ struct KVMState
>      bool kvm_dirty_ring_enabled;    /* Whether KVM dirty ring is enabled */
>      uint64_t kvm_dirty_ring_size;   /* Size of the per-vcpu dirty ring */
>      uint32_t kvm_dirty_gfn_count;   /* Number of dirty GFNs per ring */
> +    struct KVMDirtyRingReaper reaper;
>  };
>  
>  KVMState *kvm_state;
> @@ -392,6 +413,13 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
>          goto err;
>      }
>  
> +    if (cpu->kvm_dirty_gfns) {
> +        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_size);
> +        if (ret < 0) {
> +            goto err;
> +        }
> +    }
> +
>      vcpu = g_malloc0(sizeof(*vcpu));
>      vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>      vcpu->kvm_fd = cpu->kvm_fd;
> @@ -468,6 +496,19 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>              (void *)cpu->kvm_run + s->coalesced_mmio * PAGE_SIZE;
>      }
>  
> +    if (s->kvm_dirty_ring_enabled) {
> +        /* Use MAP_SHARED to share pages with the kernel */
> +        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_size,
> +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> +                                   cpu->kvm_fd,
> +                                   PAGE_SIZE * KVM_DIRTY_LOG_PAGE_OFFSET);
> +        if (cpu->kvm_dirty_gfns == MAP_FAILED) {
> +            ret = -errno;
> +            DPRINTF("mmap'ing vcpu dirty gfns failed: %d\n", ret);
> +            goto err;
> +        }
> +    }
> +
>      ret = kvm_arch_init_vcpu(cpu);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret,
> @@ -586,6 +627,11 @@ static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
>      cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
>  }
>  
> +static void kvm_slot_reset_dirty_pages(KVMSlot *slot)
> +{
> +    memset(slot->dirty_bmap, 0, slot->dirty_bmap_size);
> +}
> +
>  #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
>  
>  /* Allocate the dirty bitmap for a slot  */
> @@ -642,6 +688,170 @@ static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
>      return ret == 0;
>  }
>  
> +/* Should be with all slots_lock held for the address spaces. */
> +static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
> +                                     uint32_t slot_id, uint64_t offset)
> +{
> +    KVMMemoryListener *kml;
> +    KVMSlot *mem;
> +
> +    if (as_id >= s->nr_as) {
> +        return;
> +    }
> +
> +    kml = s->as[as_id].ml;
> +    mem = &kml->slots[slot_id];
> +
> +    if (!mem->memory_size || offset >= (mem->memory_size / TARGET_PAGE_SIZE)) {
It seems that TARGET_PAGE_SIZE should be qemu_real_host_page_size.


> +        return;
> +    }
> +
> +    set_bit(offset, mem->dirty_bmap);
> +}
> +
> +static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
> +{
> +    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
> +}
> +
> +static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
> +{
> +    gfn->flags = KVM_DIRTY_GFN_F_RESET;
> +}
> +
> +/*
> + * Should be with all slots_lock held for the address spaces.  It returns the
> + * dirty page we've collected on this dirty ring.
> + */
> +static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
> +{
> +    struct kvm_dirty_gfn *dirty_gfns = cpu->kvm_dirty_gfns, *cur;
> +    uint32_t gfn_count = s->kvm_dirty_gfn_count;
> +    uint32_t count = 0, fetch = cpu->kvm_fetch_index;
> +
> +    assert(dirty_gfns && gfn_count);
> +    trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
> +
> +    while (true) {
> +        cur = &dirty_gfns[fetch % gfn_count];
> +        if (!dirty_gfn_is_dirtied(cur)) {
> +            break;
> +        }
> +        kvm_dirty_ring_mark_page(s, cur->slot >> 16, cur->slot & 0xffff,
> +                                 cur->offset);
> +        dirty_gfn_set_collected(cur);
> +        trace_kvm_dirty_ring_page(cpu->cpu_index, fetch, cur->offset);
> +        fetch++;
> +        count++;
> +    }
> +    cpu->kvm_fetch_index = fetch;
> +
> +    return count;
> +}
> +
> +/* Must be with slots_lock held */
> +static uint64_t kvm_dirty_ring_reap_locked(KVMState *s)
> +{
> +    int ret;
> +    CPUState *cpu;
> +    uint64_t total = 0;
> +    int64_t stamp;
> +
> +    stamp = get_clock();
> +
> +    CPU_FOREACH(cpu) {
> +        total += kvm_dirty_ring_reap_one(s, cpu);
> +    }
> +
> +    if (total) {
> +        ret = kvm_vm_ioctl(s, KVM_RESET_DIRTY_RINGS);
> +        assert(ret == total);
> +    }
> +
> +    stamp = get_clock() - stamp;
> +
> +    if (total) {
> +        trace_kvm_dirty_ring_reap(total, stamp / 1000);
> +    }
> +
> +    return total;
> +}
> +
> +/*
> + * Currently for simplicity, we must hold BQL before calling this.  We can
> + * consider to drop the BQL if we're clear with all the race conditions.
> + */
> +static uint64_t kvm_dirty_ring_reap(KVMState *s)
> +{
> +    uint64_t total;
> +
> +    /*
> +     * We need to lock all kvm slots for all address spaces here,
> +     * because:
> +     *
> +     * (1) We need to mark dirty for dirty bitmaps in multiple slots
> +     *     and for tons of pages, so it's better to take the lock here
> +     *     once rather than once per page.  And more importantly,
> +     *
> +     * (2) We must _NOT_ publish dirty bits to the other threads
> +     *     (e.g., the migration thread) via the kvm memory slot dirty
> +     *     bitmaps before correctly re-protect those dirtied pages.
> +     *     Otherwise we can have potential risk of data corruption if
> +     *     the page data is read in the other thread before we do
> +     *     reset below.
> +     */
> +    kvm_slots_lock();
> +    total = kvm_dirty_ring_reap_locked(s);
> +    kvm_slots_unlock();
> +
> +    return total;
> +}
> +
> +static void do_kvm_cpu_synchronize_kick(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    /* No need to do anything */
> +}
> +
> +/*
> + * Kick all vcpus out in a synchronized way.  When returned, we
> + * guarantee that every vcpu has been kicked and at least returned to
> + * userspace once.
> + */
> +static void kvm_cpu_synchronize_kick_all(void)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        run_on_cpu(cpu, do_kvm_cpu_synchronize_kick, RUN_ON_CPU_NULL);
> +    }
> +}
> +
> +/*
> + * Flush all the existing dirty pages to the KVM slot buffers.  When
> + * this call returns, we guarantee that all the touched dirty pages
> + * before calling this function have been put into the per-kvmslot
> + * dirty bitmap.
> + *
> + * This function must be called with BQL held.
> + */
> +static void kvm_dirty_ring_flush(struct KVMDirtyRingReaper *r)
The argument is not used.

> +{
> +    trace_kvm_dirty_ring_flush(0);
> +    /*
> +     * The function needs to be serialized.  Since this function
> +     * should always be with BQL held, serialization is guaranteed.
> +     * However, let's be sure of it.
> +     */
> +    assert(qemu_mutex_iothread_locked());
> +    /*
> +     * First make sure to flush the hardware buffers by kicking all
> +     * vcpus out in a synchronous way.
> +     */
> +    kvm_cpu_synchronize_kick_all();
Can we make this function to be architecture specific?
It seems that kick out vCPU is an architecture specific way to flush hardware buffers
to dirty ring (for x86 PML).

> +    kvm_dirty_ring_reap(kvm_state);
> +    trace_kvm_dirty_ring_flush(1);
> +}
> +
>  /**
>   * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
>   *
> @@ -1174,7 +1384,24 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>                  goto out;
>              }
>              if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
> -                kvm_slot_get_dirty_log(kvm_state, mem);
> +                /*
> +                 * NOTE: We should be aware of the fact that here we're only
> +                 * doing a best effort to sync dirty bits.  No matter whether
> +                 * we're using dirty log or dirty ring, we ignored two facts:
> +                 *
> +                 * (1) dirty bits can reside in hardware buffers (PML)
> +                 *
> +                 * (2) after we collected dirty bits here, pages can be dirtied
> +                 * again before we do the final KVM_SET_USER_MEMORY_REGION to
> +                 * remove the slot.
> +                 *
> +                 * Not easy.  Let's cross the fingers until it's fixed.
> +                 */
> +                if (kvm_state->kvm_dirty_ring_enabled) {
> +                    kvm_dirty_ring_reap_locked(kvm_state);
> +                } else {
> +                    kvm_slot_get_dirty_log(kvm_state, mem);
> +                }
>                  kvm_slot_sync_dirty_pages(mem);
>              }
>  
> @@ -1222,6 +1449,51 @@ out:
>      kvm_slots_unlock();
>  }
>  
> +static void *kvm_dirty_ring_reaper_thread(void *data)
> +{
> +    KVMState *s = data;
> +    struct KVMDirtyRingReaper *r = &s->reaper;
> +
> +    rcu_register_thread();
> +
> +    trace_kvm_dirty_ring_reaper("init");
> +
> +    while (true) {
> +        r->reaper_state = KVM_DIRTY_RING_REAPER_WAIT;
> +        trace_kvm_dirty_ring_reaper("wait");
> +        /*
> +         * TODO: provide a smarter timeout rather than a constant?
> +         */
> +        sleep(1);
> +
> +        trace_kvm_dirty_ring_reaper("wakeup");
> +        r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
> +
> +        qemu_mutex_lock_iothread();
> +        kvm_dirty_ring_reap(s);
> +        qemu_mutex_unlock_iothread();
> +
> +        r->reaper_iteration++;
> +    }
I don't know when does this iteration exit?
And I see that we start this reaper_thread in kvm_init(), maybe it's better to start it
when start dirty log and stop it when stop dirty log.

> +
> +    trace_kvm_dirty_ring_reaper("exit");
> +
> +    rcu_unregister_thread();
> +
> +    return NULL;
> +}
> +
> +static int kvm_dirty_ring_reaper_init(KVMState *s)
> +{
> +    struct KVMDirtyRingReaper *r = &s->reaper;
> +
> +    qemu_thread_create(&r->reaper_thr, "kvm-reaper",
> +                       kvm_dirty_ring_reaper_thread,
> +                       s, QEMU_THREAD_JOINABLE);
> +
> +    return 0;
> +}
> +
>  static void kvm_region_add(MemoryListener *listener,
>                             MemoryRegionSection *section)
>  {
> @@ -1250,6 +1522,36 @@ static void kvm_log_sync(MemoryListener *listener,
>      kvm_slots_unlock();
>  }
>  
> +static void kvm_log_sync_global(MemoryListener *l)
> +{
> +    KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
> +    KVMState *s = kvm_state;
> +    KVMSlot *mem;
> +    int i;
> +
> +    /* Flush all kernel dirty addresses into KVMSlot dirty bitmap */
> +    kvm_dirty_ring_flush(&s->reaper);
> +
> +    /*
> +     * TODO: make this faster when nr_slots is big while there are
> +     * only a few used slots (small VMs).
> +     */
> +    kvm_slots_lock();
> +    for (i = 0; i < s->nr_slots; i++) {
> +        mem = &kml->slots[i];
> +        if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
> +            kvm_slot_sync_dirty_pages(mem);
> +            /*
> +             * This is not needed by KVM_GET_DIRTY_LOG because the
> +             * ioctl will unconditionally overwrite the whole region.
> +             * However kvm dirty ring has no such side effect.
> +             */
> +            kvm_slot_reset_dirty_pages(mem);
> +        }
> +    }
> +    kvm_slots_unlock();
> +}
> +
>  static void kvm_log_clear(MemoryListener *listener,
>                            MemoryRegionSection *section)
>  {
> @@ -1356,10 +1658,15 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>      kml->listener.region_del = kvm_region_del;
>      kml->listener.log_start = kvm_log_start;
>      kml->listener.log_stop = kvm_log_stop;
> -    kml->listener.log_sync = kvm_log_sync;
> -    kml->listener.log_clear = kvm_log_clear;
>      kml->listener.priority = 10;
>  
> +    if (s->kvm_dirty_ring_enabled) {
> +        kml->listener.log_sync_global = kvm_log_sync_global;
> +    } else {
> +        kml->listener.log_sync = kvm_log_sync;
> +        kml->listener.log_clear = kvm_log_clear;
> +    }
> +
>      memory_listener_register(&kml->listener, as);
>  
>      for (i = 0; i < s->nr_as; ++i) {
> @@ -2281,6 +2588,14 @@ static int kvm_init(MachineState *ms)
>          ret = ram_block_discard_disable(true);
>          assert(!ret);
>      }
> +
> +    if (s->kvm_dirty_ring_enabled) {
> +        ret = kvm_dirty_ring_reaper_init(s);
> +        if (ret) {
> +            goto err;
> +        }
> +    }
> +
>      return 0;
>  
>  err:
> @@ -2593,6 +2908,17 @@ int kvm_cpu_exec(CPUState *cpu)
>          case KVM_EXIT_INTERNAL_ERROR:
>              ret = kvm_handle_internal_error(cpu, run);
>              break;
> +        case KVM_EXIT_DIRTY_RING_FULL:
> +            /*
> +             * We shouldn't continue if the dirty ring of this vcpu is
> +             * still full.  Got kicked by KVM_RESET_DIRTY_RINGS.
> +             */
> +            trace_kvm_dirty_ring_full(cpu->cpu_index);
> +            qemu_mutex_lock_iothread();
> +            kvm_dirty_ring_reap(kvm_state);
> +            qemu_mutex_unlock_iothread();
> +            ret = 0;
> +            break;
>          case KVM_EXIT_SYSTEM_EVENT:
>              switch (run->system_event.type) {
>              case KVM_SYSTEM_EVENT_SHUTDOWN:
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index e15ae8980d3..72a01320a1a 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -18,4 +18,11 @@ kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t
>  kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
>  kvm_clear_dirty_log(uint32_t slot, uint64_t start, uint32_t size) "slot#%"PRId32" start 0x%"PRIx64" size 0x%"PRIx32
>  kvm_resample_fd_notify(int gsi) "gsi %d"
> +kvm_dirty_ring_full(int id) "vcpu %d"
> +kvm_dirty_ring_reap_vcpu(int id) "vcpu %d"
> +kvm_dirty_ring_page(int vcpu, uint32_t slot, uint64_t offset) "vcpu %d fetch %"PRIu32" offset 0x%"PRIx64
> +kvm_dirty_ring_reaper(const char *s) "%s"
> +kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
> +kvm_dirty_ring_reaper_kick(const char *reason) "%s"
> +kvm_dirty_ring_flush(int finished) "%d"
>  
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c68bc3ba8af..2f0991d93f7 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -323,6 +323,11 @@ struct qemu_work_item;
>   * @ignore_memory_transaction_failures: Cached copy of the MachineState
>   *    flag of the same name: allows the board to suppress calling of the
>   *    CPU do_transaction_failed hook function.
> + * @kvm_dirty_ring_full:
> + *   Whether the kvm dirty ring of this vcpu is soft-full.
> + * @kvm_dirty_ring_avail:
> + *   Semaphore to be posted when the kvm dirty ring of the vcpu is
> + *   available again.
The doc does not match code.

>   *
>   * State of one CPU core or thread.
>   */
> @@ -394,9 +399,12 @@ struct CPUState {
>       */
>      uintptr_t mem_io_pc;
>  
> +    /* Only used in KVM */
>      int kvm_fd;
>      struct KVMState *kvm_state;
>      struct kvm_run *kvm_run;
> +    struct kvm_dirty_gfn *kvm_dirty_gfns;
> +    uint32_t kvm_fetch_index;
>  
>      /* Used for events with 'vcpu' and *without* the 'disabled' properties */
>      DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
> 

Thanks,
Keqian

