Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4D8256E1B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 15:36:06 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCNV7-00025N-Va
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 09:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kCNU4-0001bP-KI
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 09:35:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:54638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kCNU1-000290-1Z
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 09:35:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 715A2AC82;
 Sun, 30 Aug 2020 13:35:28 +0000 (UTC)
Subject: Re: [RFC v3 2/8] cpus: prepare new CpusAccel cpu accelerator interface
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20200803090533.7410-1-cfontana@suse.de>
 <20200803090533.7410-3-cfontana@suse.de>
 <d65ff2d0-0859-ae68-6186-6fa6e5e63370@suse.de>
Message-ID: <2eee7264-efa8-08a7-d1df-0afb30deec3c@suse.de>
Date: Sun, 30 Aug 2020 15:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d65ff2d0-0859-ae68-6186-6fa6e5e63370@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 02:56:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.207,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Colin Xu <colin.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ciao Paolo,

just a ping on this one, it would seem that qemu_clock_get_ns needs to be called before
any accelerator is initialized, before ticks are enabled, as part of qcow2 initialization.

I could add a check specifically for this and a comment in the cpus_get_virtual_clock(), but do you have any thoughts?

Thanks,

Claudio


On 8/20/20 10:17 AM, Claudio Fontana wrote:
> Hi Paolo and all,
> 
> back in RFC v3 I introduced cpus_get_virtual_clock in this patch.
> 
> I observed an issue when adding the get_virtual_clock to the CpusAccel interface, ie
> it seems that qemu_clock_get_ns() is called in some io-tests before the accelerator is initialized,
> which seems to collide with the idea to make it part of the CpusAccel interface:
> 
> (gdb) bt
> #0  0x00005555558e6af0 in cpus_get_virtual_clock () at /home/claudio/git/qemu-pristine/qemu/softmmu/cpus.c:219
> #1  0x0000555555c5099c in qemu_clock_get_ns (type=type@entry=QEMU_CLOCK_VIRTUAL)
>     at /home/claudio/git/qemu-pristine/qemu/util/qemu-timer.c:638
> #2  0x0000555555b6077a in qemu_clock_get_ms (type=QEMU_CLOCK_VIRTUAL) at /home/claudio/git/qemu-pristine/qemu/include/qemu/timer.h:118
> #3  0x0000555555b6077a in cache_clean_timer_init (bs=bs@entry=0x5555568381a0, context=0x555556821930)
>     at /home/claudio/git/qemu-pristine/qemu/block/qcow2.c:846
> #4  0x0000555555b63012 in qcow2_update_options_commit (bs=bs@entry=0x5555568381a0, r=r@entry=0x7fffd6a45e10)
>     at /home/claudio/git/qemu-pristine/qemu/block/qcow2.c:1221
> #5  0x0000555555b657ea in qcow2_update_options
>     (bs=bs@entry=0x5555568381a0, options=options@entry=0x55555683d600, flags=flags@entry=139266, errp=errp@entry=0x7fffffffd580)
>     at /home/claudio/git/qemu-pristine/qemu/block/qcow2.c:1248
> #6  0x0000555555b671a2 in qcow2_do_open (bs=0x5555568381a0, options=0x55555683d600, flags=139266, errp=0x7fffffffd580)
>     at /home/claudio/git/qemu-pristine/qemu/block/qcow2.c:1579
> #7  0x0000555555b67e62 in qcow2_open_entry (opaque=0x7fffffffd520) at /home/claudio/git/qemu-pristine/qemu/block/qcow2.c:1867
> #8  0x0000555555c4854c in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
>     at /home/claudio/git/qemu-pristine/qemu/util/coroutine-ucontext.c:173
> #9  0x00007fffed3779c0 in __start_context () at /lib64/libc.so.6
> #10 0x00007fffffffcd90 in  ()
> #11 0x0000000000000000 in  ()
> 
> (gdb) p *current_machine
> $3 = {parent_obj = {class = 0x5555567a2090, free = 0x7ffff72d9840 <g_free>, Python Exception <class 'gdb.error'> There is no member named keys.: 
> properties = 0x55555681c580, ref = 2, 
>     parent = 0x55555682aa90}, sysbus_notifier = {notify = 0x555555990130 <machine_init_notify>, node = {le_next = 
>     0x5555564e1130 <chardev_machine_done_notify>, le_prev = 0x5555565079f0 <machine_init_done_notifiers>}}, dtb = 0x0, dumpdtb = 0x0, 
>   phandle_start = 0, dt_compatible = 0x0, dump_guest_core = true, mem_merge = true, usb = false, usb_disabled = false, firmware = 0x0, 
>   iommu = false, suppress_vmdesc = false, enforce_config_section = false, enable_graphics = true, memory_encryption = 0x0, 
>   ram_memdev_id = 0x0, ram = 0x0, device_memory = 0x0, ram_size = 0, maxram_size = 0, ram_slots = 0, boot_order = 0x0, 
>   kernel_filename = 0x0, kernel_cmdline = 0x0, initrd_filename = 0x0, cpu_type = 0x0, accelerator = 0x0, possible_cpus = 0x0, smp = {
>     cpus = 1, cores = 1, threads = 1, sockets = 1, max_cpus = 1}, nvdimms_state = 0x555556822850, numa_state = 0x555556822be0}
> 
> 
> The affected tests are:
> 
> Failures: 030 040 041 060 099 120 127 140 156 161 172 181 191 192 195 203 229 249 256 267
> 
> Are the tests wrong here, to trigger this call stack before the accel is set,
> or should the get virtual clock functionality be taken out of the interface, or ...?
> 
> Thanks for any advice,
> 
> Ciao,
> 
> Claudio  
> 
> 
> On 8/3/20 11:05 AM, Claudio Fontana wrote:
>> The new interface starts unused, will start being used by the
>> next patches.
>>
>> It provides methods for each accelerator to start a vcpu, kick a vcpu,
>> synchronize state, get cpu virtual clock and elapsed ticks.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  hw/core/cpu.c                  |   1 +
>>  hw/i386/x86.c                  |   2 +-
>>  include/sysemu/cpu-timers.h    |   9 +-
>>  include/sysemu/cpus.h          |  36 ++++++++
>>  include/sysemu/hw_accel.h      |  69 ++-------------
>>  softmmu/cpu-timers.c           |   9 +-
>>  softmmu/cpus.c                 | 194 ++++++++++++++++++++++++++++++++---------
>>  stubs/Makefile.objs            |   2 +
>>  stubs/cpu-synchronize-state.c  |  15 ++++
>>  stubs/cpus-get-virtual-clock.c |   8 ++
>>  util/qemu-timer.c              |   8 +-
>>  11 files changed, 231 insertions(+), 122 deletions(-)
>>  create mode 100644 stubs/cpu-synchronize-state.c
>>  create mode 100644 stubs/cpus-get-virtual-clock.c
>>
>> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
>> index 594441a150..b389a312df 100644
>> --- a/hw/core/cpu.c
>> +++ b/hw/core/cpu.c
>> @@ -33,6 +33,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "trace-root.h"
>>  #include "qemu/plugin.h"
>> +#include "sysemu/hw_accel.h"
>>  
>>  CPUInterruptHandler cpu_interrupt_handler;
>>  
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 58cf2229d5..00c35bad7e 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -264,7 +264,7 @@ static long get_file_size(FILE *f)
>>  /* TSC handling */
>>  uint64_t cpu_get_tsc(CPUX86State *env)
>>  {
>> -    return cpu_get_ticks();
>> +    return cpus_get_elapsed_ticks();
>>  }
>>  
>>  /* IRQ handling */
>> diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
>> index 07d724672f..cb83cc5584 100644
>> --- a/include/sysemu/cpu-timers.h
>> +++ b/include/sysemu/cpu-timers.h
>> @@ -64,9 +64,8 @@ void cpu_enable_ticks(void);
>>  void cpu_disable_ticks(void);
>>  
>>  /*
>> - * return the time elapsed in VM between vm_start and vm_stop.  Unless
>> - * icount is active, cpu_get_ticks() uses units of the host CPU cycle
>> - * counter.
>> + * return the time elapsed in VM between vm_start and vm_stop.
>> + * cpu_get_ticks() uses units of the host CPU cycle counter.
>>   */
>>  int64_t cpu_get_ticks(void);
>>  
>> @@ -78,4 +77,8 @@ int64_t cpu_get_clock(void);
>>  
>>  void qemu_timer_notify_cb(void *opaque, QEMUClockType type);
>>  
>> +/* get the VIRTUAL clock and VM elapsed ticks via the cpus accel interface */
>> +int64_t cpus_get_virtual_clock(void);
>> +int64_t cpus_get_elapsed_ticks(void);
>> +
>>  #endif /* SYSEMU_CPU_TIMERS_H */
>> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
>> index 149de000a0..db196dd96f 100644
>> --- a/include/sysemu/cpus.h
>> +++ b/include/sysemu/cpus.h
>> @@ -4,7 +4,43 @@
>>  #include "qemu/timer.h"
>>  
>>  /* cpus.c */
>> +
>> +/* CPU execution threads */
>> +
>> +typedef struct CpusAccel {
>> +    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY */
>> +    void (*kick_vcpu_thread)(CPUState *cpu);
>> +
>> +    void (*synchronize_post_reset)(CPUState *cpu);
>> +    void (*synchronize_post_init)(CPUState *cpu);
>> +    void (*synchronize_state)(CPUState *cpu);
>> +    void (*synchronize_pre_loadvm)(CPUState *cpu);
>> +
>> +    int64_t (*get_virtual_clock)(void);
>> +    int64_t (*get_elapsed_ticks)(void);
>> +} CpusAccel;
>> +
>> +/* register accel-specific cpus interface implementation */
>> +void cpus_register_accel(CpusAccel *i);
>> +
>> +/* interface available for cpus accelerator threads */
>> +
>> +/* For temporary buffers for forming a name */
>> +#define VCPU_THREAD_NAME_SIZE 16
>> +
>> +void cpus_kick_thread(CPUState *cpu);
>> +bool cpu_work_list_empty(CPUState *cpu);
>> +bool cpu_thread_is_idle(CPUState *cpu);
>>  bool all_cpu_threads_idle(void);
>> +bool cpu_can_run(CPUState *cpu);
>> +void qemu_wait_io_event_common(CPUState *cpu);
>> +void qemu_wait_io_event(CPUState *cpu);
>> +void cpu_thread_signal_created(CPUState *cpu);
>> +void cpu_thread_signal_destroyed(CPUState *cpu);
>> +void cpu_handle_guest_debug(CPUState *cpu);
>> +
>> +/* end interface for cpus accelerator threads */
>> +
>>  bool qemu_in_vcpu_thread(void);
>>  void qemu_init_cpu_loop(void);
>>  void resume_all_vcpus(void);
>> diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
>> index e128f8b06b..ffed6192a3 100644
>> --- a/include/sysemu/hw_accel.h
>> +++ b/include/sysemu/hw_accel.h
>> @@ -1,5 +1,5 @@
>>  /*
>> - * QEMU Hardware accelertors support
>> + * QEMU Hardware accelerators support
>>   *
>>   * Copyright 2016 Google, Inc.
>>   *
>> @@ -17,68 +17,9 @@
>>  #include "sysemu/hvf.h"
>>  #include "sysemu/whpx.h"
>>  
>> -static inline void cpu_synchronize_state(CPUState *cpu)
>> -{
>> -    if (kvm_enabled()) {
>> -        kvm_cpu_synchronize_state(cpu);
>> -    }
>> -    if (hax_enabled()) {
>> -        hax_cpu_synchronize_state(cpu);
>> -    }
>> -    if (hvf_enabled()) {
>> -        hvf_cpu_synchronize_state(cpu);
>> -    }
>> -    if (whpx_enabled()) {
>> -        whpx_cpu_synchronize_state(cpu);
>> -    }
>> -}
>> -
>> -static inline void cpu_synchronize_post_reset(CPUState *cpu)
>> -{
>> -    if (kvm_enabled()) {
>> -        kvm_cpu_synchronize_post_reset(cpu);
>> -    }
>> -    if (hax_enabled()) {
>> -        hax_cpu_synchronize_post_reset(cpu);
>> -    }
>> -    if (hvf_enabled()) {
>> -        hvf_cpu_synchronize_post_reset(cpu);
>> -    }
>> -    if (whpx_enabled()) {
>> -        whpx_cpu_synchronize_post_reset(cpu);
>> -    }
>> -}
>> -
>> -static inline void cpu_synchronize_post_init(CPUState *cpu)
>> -{
>> -    if (kvm_enabled()) {
>> -        kvm_cpu_synchronize_post_init(cpu);
>> -    }
>> -    if (hax_enabled()) {
>> -        hax_cpu_synchronize_post_init(cpu);
>> -    }
>> -    if (hvf_enabled()) {
>> -        hvf_cpu_synchronize_post_init(cpu);
>> -    }
>> -    if (whpx_enabled()) {
>> -        whpx_cpu_synchronize_post_init(cpu);
>> -    }
>> -}
>> -
>> -static inline void cpu_synchronize_pre_loadvm(CPUState *cpu)
>> -{
>> -    if (kvm_enabled()) {
>> -        kvm_cpu_synchronize_pre_loadvm(cpu);
>> -    }
>> -    if (hax_enabled()) {
>> -        hax_cpu_synchronize_pre_loadvm(cpu);
>> -    }
>> -    if (hvf_enabled()) {
>> -        hvf_cpu_synchronize_pre_loadvm(cpu);
>> -    }
>> -    if (whpx_enabled()) {
>> -        whpx_cpu_synchronize_pre_loadvm(cpu);
>> -    }
>> -}
>> +void cpu_synchronize_state(CPUState *cpu);
>> +void cpu_synchronize_post_reset(CPUState *cpu);
>> +void cpu_synchronize_post_init(CPUState *cpu);
>> +void cpu_synchronize_pre_loadvm(CPUState *cpu);
>>  
>>  #endif /* QEMU_HW_ACCEL_H */
>> diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
>> index 64addb315d..3e1da79735 100644
>> --- a/softmmu/cpu-timers.c
>> +++ b/softmmu/cpu-timers.c
>> @@ -61,18 +61,13 @@ static int64_t cpu_get_ticks_locked(void)
>>  }
>>  
>>  /*
>> - * return the time elapsed in VM between vm_start and vm_stop.  Unless
>> - * icount is active, cpu_get_ticks() uses units of the host CPU cycle
>> - * counter.
>> + * return the time elapsed in VM between vm_start and vm_stop.
>> + * cpu_get_ticks() uses units of the host CPU cycle counter.
>>   */
>>  int64_t cpu_get_ticks(void)
>>  {
>>      int64_t ticks;
>>  
>> -    if (icount_enabled()) {
>> -        return icount_get();
>> -    }
>> -
>>      qemu_spin_lock(&timers_state.vm_clock_lock);
>>      ticks = cpu_get_ticks_locked();
>>      qemu_spin_unlock(&timers_state.vm_clock_lock);
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index 54fdb2761c..bad6302ca3 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -87,7 +87,7 @@ bool cpu_is_stopped(CPUState *cpu)
>>      return cpu->stopped || !runstate_is_running();
>>  }
>>  
>> -static inline bool cpu_work_list_empty(CPUState *cpu)
>> +bool cpu_work_list_empty(CPUState *cpu)
>>  {
>>      bool ret;
>>  
>> @@ -97,7 +97,7 @@ static inline bool cpu_work_list_empty(CPUState *cpu)
>>      return ret;
>>  }
>>  
>> -static bool cpu_thread_is_idle(CPUState *cpu)
>> +bool cpu_thread_is_idle(CPUState *cpu)
>>  {
>>      if (cpu->stop || !cpu_work_list_empty(cpu)) {
>>          return false;
>> @@ -215,6 +215,11 @@ void hw_error(const char *fmt, ...)
>>      abort();
>>  }
>>  
>> +/*
>> + * The chosen accelerator is supposed to register this.
>> + */
>> +static CpusAccel *cpus_accel;
>> +
>>  void cpu_synchronize_all_states(void)
>>  {
>>      CPUState *cpu;
>> @@ -251,6 +256,102 @@ void cpu_synchronize_all_pre_loadvm(void)
>>      }
>>  }
>>  
>> +void cpu_synchronize_state(CPUState *cpu)
>> +{
>> +    if (cpus_accel && cpus_accel->synchronize_state) {
>> +        cpus_accel->synchronize_state(cpu);
>> +    }
>> +    if (kvm_enabled()) {
>> +        kvm_cpu_synchronize_state(cpu);
>> +    }
>> +    if (hax_enabled()) {
>> +        hax_cpu_synchronize_state(cpu);
>> +    }
>> +    if (whpx_enabled()) {
>> +        whpx_cpu_synchronize_state(cpu);
>> +    }
>> +}
>> +
>> +void cpu_synchronize_post_reset(CPUState *cpu)
>> +{
>> +    if (cpus_accel && cpus_accel->synchronize_post_reset) {
>> +        cpus_accel->synchronize_post_reset(cpu);
>> +    }
>> +    if (kvm_enabled()) {
>> +        kvm_cpu_synchronize_post_reset(cpu);
>> +    }
>> +    if (hax_enabled()) {
>> +        hax_cpu_synchronize_post_reset(cpu);
>> +    }
>> +    if (whpx_enabled()) {
>> +        whpx_cpu_synchronize_post_reset(cpu);
>> +    }
>> +}
>> +
>> +void cpu_synchronize_post_init(CPUState *cpu)
>> +{
>> +    if (cpus_accel && cpus_accel->synchronize_post_init) {
>> +        cpus_accel->synchronize_post_init(cpu);
>> +    }
>> +    if (kvm_enabled()) {
>> +        kvm_cpu_synchronize_post_init(cpu);
>> +    }
>> +    if (hax_enabled()) {
>> +        hax_cpu_synchronize_post_init(cpu);
>> +    }
>> +    if (whpx_enabled()) {
>> +        whpx_cpu_synchronize_post_init(cpu);
>> +    }
>> +}
>> +
>> +void cpu_synchronize_pre_loadvm(CPUState *cpu)
>> +{
>> +    if (cpus_accel && cpus_accel->synchronize_pre_loadvm) {
>> +        cpus_accel->synchronize_pre_loadvm(cpu);
>> +    }
>> +    if (kvm_enabled()) {
>> +        kvm_cpu_synchronize_pre_loadvm(cpu);
>> +    }
>> +    if (hax_enabled()) {
>> +        hax_cpu_synchronize_pre_loadvm(cpu);
>> +    }
>> +    if (hvf_enabled()) {
>> +        hvf_cpu_synchronize_pre_loadvm(cpu);
>> +    }
>> +    if (whpx_enabled()) {
>> +        whpx_cpu_synchronize_pre_loadvm(cpu);
>> +    }
>> +}
>> +
>> +int64_t cpus_get_virtual_clock(void)
>> +{
>> +    if (cpus_accel && cpus_accel->get_virtual_clock) {
>> +        return cpus_accel->get_virtual_clock();
>> +    }
>> +    if (icount_enabled()) {
>> +        return icount_get();
>> +    } else if (qtest_enabled()) { /* for qtest_clock_warp */
>> +        return qtest_get_virtual_clock();
>> +    }
>> +    return cpu_get_clock();
>> +}
>> +
>> +/*
>> + * return the time elapsed in VM between vm_start and vm_stop.  Unless
>> + * icount is active, cpu_get_ticks() uses units of the host CPU cycle
>> + * counter.
>> + */
>> +int64_t cpus_get_elapsed_ticks(void)
>> +{
>> +    if (cpus_accel && cpus_accel->get_elapsed_ticks) {
>> +        return cpus_accel->get_elapsed_ticks();
>> +    }
>> +    if (icount_enabled()) {
>> +        return icount_get();
>> +    }
>> +    return cpu_get_ticks();
>> +}
>> +
>>  static int do_vm_stop(RunState state, bool send_stop)
>>  {
>>      int ret = 0;
>> @@ -279,7 +380,7 @@ int vm_shutdown(void)
>>      return do_vm_stop(RUN_STATE_SHUTDOWN, false);
>>  }
>>  
>> -static bool cpu_can_run(CPUState *cpu)
>> +bool cpu_can_run(CPUState *cpu)
>>  {
>>      if (cpu->stop) {
>>          return false;
>> @@ -290,7 +391,7 @@ static bool cpu_can_run(CPUState *cpu)
>>      return true;
>>  }
>>  
>> -static void cpu_handle_guest_debug(CPUState *cpu)
>> +void cpu_handle_guest_debug(CPUState *cpu)
>>  {
>>      gdb_set_stop_cpu(cpu);
>>      qemu_system_debug_request();
>> @@ -396,7 +497,7 @@ static void qemu_cpu_stop(CPUState *cpu, bool exit)
>>      qemu_cond_broadcast(&qemu_pause_cond);
>>  }
>>  
>> -static void qemu_wait_io_event_common(CPUState *cpu)
>> +void qemu_wait_io_event_common(CPUState *cpu)
>>  {
>>      atomic_mb_set(&cpu->thread_kicked, false);
>>      if (cpu->stop) {
>> @@ -421,7 +522,7 @@ static void qemu_tcg_rr_wait_io_event(void)
>>      }
>>  }
>>  
>> -static void qemu_wait_io_event(CPUState *cpu)
>> +void qemu_wait_io_event(CPUState *cpu)
>>  {
>>      bool slept = false;
>>  
>> @@ -437,7 +538,8 @@ static void qemu_wait_io_event(CPUState *cpu)
>>      }
>>  
>>  #ifdef _WIN32
>> -    /* Eat dummy APC queued by qemu_cpu_kick_thread.  */
>> +    /* Eat dummy APC queued by qemu_cpu_kick_thread. */
>> +    /* NB!!! Should not this be if (hax_enabled)? Is this wrong for whpx? */
>>      if (!tcg_enabled()) {
>>          SleepEx(0, TRUE);
>>      }
>> @@ -467,8 +569,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
>>      kvm_init_cpu_signals(cpu);
>>  
>>      /* signal CPU creation */
>> -    cpu->created = true;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      do {
>> @@ -482,8 +583,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
>>      } while (!cpu->unplug || cpu_can_run(cpu));
>>  
>>      qemu_kvm_destroy_vcpu(cpu);
>> -    cpu->created = false;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_destroyed(cpu);
>>      qemu_mutex_unlock_iothread();
>>      rcu_unregister_thread();
>>      return NULL;
>> @@ -511,8 +611,7 @@ static void *qemu_dummy_cpu_thread_fn(void *arg)
>>      sigaddset(&waitset, SIG_IPI);
>>  
>>      /* signal CPU creation */
>> -    cpu->created = true;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      do {
>> @@ -660,8 +759,7 @@ static void deal_with_unplugged_cpus(void)
>>      CPU_FOREACH(cpu) {
>>          if (cpu->unplug && !cpu_can_run(cpu)) {
>>              qemu_tcg_destroy_vcpu(cpu);
>> -            cpu->created = false;
>> -            qemu_cond_signal(&qemu_cpu_cond);
>> +            cpu_thread_signal_destroyed(cpu);
>>              break;
>>          }
>>      }
>> @@ -688,9 +786,8 @@ static void *qemu_tcg_rr_cpu_thread_fn(void *arg)
>>      qemu_thread_get_self(cpu->thread);
>>  
>>      cpu->thread_id = qemu_get_thread_id();
>> -    cpu->created = true;
>>      cpu->can_do_io = 1;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      /* wait for initial kick-off after machine start */
>> @@ -800,11 +897,9 @@ static void *qemu_hax_cpu_thread_fn(void *arg)
>>      qemu_thread_get_self(cpu->thread);
>>  
>>      cpu->thread_id = qemu_get_thread_id();
>> -    cpu->created = true;
>>      current_cpu = cpu;
>> -
>>      hax_init_vcpu(cpu);
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      do {
>> @@ -843,8 +938,7 @@ static void *qemu_hvf_cpu_thread_fn(void *arg)
>>      hvf_init_vcpu(cpu);
>>  
>>      /* signal CPU creation */
>> -    cpu->created = true;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      do {
>> @@ -858,8 +952,7 @@ static void *qemu_hvf_cpu_thread_fn(void *arg)
>>      } while (!cpu->unplug || cpu_can_run(cpu));
>>  
>>      hvf_vcpu_destroy(cpu);
>> -    cpu->created = false;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_destroyed(cpu);
>>      qemu_mutex_unlock_iothread();
>>      rcu_unregister_thread();
>>      return NULL;
>> @@ -884,8 +977,7 @@ static void *qemu_whpx_cpu_thread_fn(void *arg)
>>      }
>>  
>>      /* signal CPU creation */
>> -    cpu->created = true;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      do {
>> @@ -902,8 +994,7 @@ static void *qemu_whpx_cpu_thread_fn(void *arg)
>>      } while (!cpu->unplug || cpu_can_run(cpu));
>>  
>>      whpx_destroy_vcpu(cpu);
>> -    cpu->created = false;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_destroyed(cpu);
>>      qemu_mutex_unlock_iothread();
>>      rcu_unregister_thread();
>>      return NULL;
>> @@ -936,10 +1027,9 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
>>      qemu_thread_get_self(cpu->thread);
>>  
>>      cpu->thread_id = qemu_get_thread_id();
>> -    cpu->created = true;
>>      cpu->can_do_io = 1;
>>      current_cpu = cpu;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_created(cpu);
>>      qemu_guest_random_seed_thread_part2(cpu->random_seed);
>>  
>>      /* process any pending work */
>> @@ -980,14 +1070,13 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
>>      } while (!cpu->unplug || cpu_can_run(cpu));
>>  
>>      qemu_tcg_destroy_vcpu(cpu);
>> -    cpu->created = false;
>> -    qemu_cond_signal(&qemu_cpu_cond);
>> +    cpu_thread_signal_destroyed(cpu);
>>      qemu_mutex_unlock_iothread();
>>      rcu_unregister_thread();
>>      return NULL;
>>  }
>>  
>> -static void qemu_cpu_kick_thread(CPUState *cpu)
>> +void cpus_kick_thread(CPUState *cpu)
>>  {
>>  #ifndef _WIN32
>>      int err;
>> @@ -1017,7 +1106,10 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
>>  void qemu_cpu_kick(CPUState *cpu)
>>  {
>>      qemu_cond_broadcast(cpu->halt_cond);
>> -    if (tcg_enabled()) {
>> +
>> +    if (cpus_accel && cpus_accel->kick_vcpu_thread) {
>> +        cpus_accel->kick_vcpu_thread(cpu);
>> +    } else if (tcg_enabled()) {
>>          if (qemu_tcg_mttcg_enabled()) {
>>              cpu_exit(cpu);
>>          } else {
>> @@ -1031,14 +1123,14 @@ void qemu_cpu_kick(CPUState *cpu)
>>               */
>>              cpu->exit_request = 1;
>>          }
>> -        qemu_cpu_kick_thread(cpu);
>> +        cpus_kick_thread(cpu);
>>      }
>>  }
>>  
>>  void qemu_cpu_kick_self(void)
>>  {
>>      assert(current_cpu);
>> -    qemu_cpu_kick_thread(current_cpu);
>> +    cpus_kick_thread(current_cpu);
>>  }
>>  
>>  bool qemu_cpu_is_self(CPUState *cpu)
>> @@ -1088,6 +1180,21 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
>>      qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
>>  }
>>  
>> +/* signal CPU creation */
>> +void cpu_thread_signal_created(CPUState *cpu)
>> +{
>> +    cpu->created = true;
>> +    qemu_cond_signal(&qemu_cpu_cond);
>> +}
>> +
>> +/* signal CPU destruction */
>> +void cpu_thread_signal_destroyed(CPUState *cpu)
>> +{
>> +    cpu->created = false;
>> +    qemu_cond_signal(&qemu_cpu_cond);
>> +}
>> +
>> +
>>  static bool all_vcpus_paused(void)
>>  {
>>      CPUState *cpu;
>> @@ -1163,9 +1270,6 @@ void cpu_remove_sync(CPUState *cpu)
>>      qemu_mutex_lock_iothread();
>>  }
>>  
>> -/* For temporary buffers for forming a name */
>> -#define VCPU_THREAD_NAME_SIZE 16
>> -
>>  static void qemu_tcg_init_vcpu(CPUState *cpu)
>>  {
>>      char thread_name[VCPU_THREAD_NAME_SIZE];
>> @@ -1286,6 +1390,13 @@ static void qemu_whpx_start_vcpu(CPUState *cpu)
>>  #endif
>>  }
>>  
>> +void cpus_register_accel(CpusAccel *ca)
>> +{
>> +    assert(ca != NULL);
>> +    assert(ca->create_vcpu_thread != NULL); /* mandatory */
>> +    cpus_accel = ca;
>> +}
>> +
>>  static void qemu_dummy_start_vcpu(CPUState *cpu)
>>  {
>>      char thread_name[VCPU_THREAD_NAME_SIZE];
>> @@ -1316,7 +1427,10 @@ void qemu_init_vcpu(CPUState *cpu)
>>          cpu_address_space_init(cpu, 0, "cpu-memory", cpu->memory);
>>      }
>>  
>> -    if (kvm_enabled()) {
>> +    if (cpus_accel) {
>> +        /* accelerator already implements the CpusAccel interface */
>> +        cpus_accel->create_vcpu_thread(cpu);
>> +    } else if (kvm_enabled()) {
>>          qemu_kvm_start_vcpu(cpu);
>>      } else if (hax_enabled()) {
>>          qemu_hax_start_vcpu(cpu);
>> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
>> index e97ad407fa..16345eec43 100644
>> --- a/stubs/Makefile.objs
>> +++ b/stubs/Makefile.objs
>> @@ -1,6 +1,7 @@
>>  stub-obj-y += blk-commit-all.o
>>  stub-obj-y += cmos.o
>>  stub-obj-y += cpu-get-clock.o
>> +stub-obj-y += cpus-get-virtual-clock.o
>>  stub-obj-y += qemu-timer-notify-cb.o
>>  stub-obj-y += icount.o
>>  stub-obj-y += dump.o
>> @@ -28,6 +29,7 @@ stub-obj-y += trace-control.o
>>  stub-obj-y += vmgenid.o
>>  stub-obj-y += vmstate.o
>>  stub-obj-$(CONFIG_SOFTMMU) += win32-kbd-hook.o
>> +stub-obj-y += cpu-synchronize-state.o
>>  
>>  #######################################################################
>>  # code used by both qemu system emulation and qemu-img
>> diff --git a/stubs/cpu-synchronize-state.c b/stubs/cpu-synchronize-state.c
>> new file mode 100644
>> index 0000000000..3112fe439d
>> --- /dev/null
>> +++ b/stubs/cpu-synchronize-state.c
>> @@ -0,0 +1,15 @@
>> +#include "qemu/osdep.h"
>> +#include "sysemu/hw_accel.h"
>> +
>> +void cpu_synchronize_state(CPUState *cpu)
>> +{
>> +}
>> +void cpu_synchronize_post_reset(CPUState *cpu)
>> +{
>> +}
>> +void cpu_synchronize_post_init(CPUState *cpu)
>> +{
>> +}
>> +void cpu_synchronize_pre_loadvm(CPUState *cpu)
>> +{
>> +}
>> diff --git a/stubs/cpus-get-virtual-clock.c b/stubs/cpus-get-virtual-clock.c
>> new file mode 100644
>> index 0000000000..fd447d53f3
>> --- /dev/null
>> +++ b/stubs/cpus-get-virtual-clock.c
>> @@ -0,0 +1,8 @@
>> +#include "qemu/osdep.h"
>> +#include "sysemu/cpu-timers.h"
>> +#include "qemu/main-loop.h"
>> +
>> +int64_t cpus_get_virtual_clock(void)
>> +{
>> +    return cpu_get_clock();
>> +}
>> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
>> index db51e68f25..50b325c65b 100644
>> --- a/util/qemu-timer.c
>> +++ b/util/qemu-timer.c
>> @@ -635,13 +635,7 @@ int64_t qemu_clock_get_ns(QEMUClockType type)
>>          return get_clock();
>>      default:
>>      case QEMU_CLOCK_VIRTUAL:
>> -        if (icount_enabled()) {
>> -            return icount_get();
>> -        } else if (qtest_enabled()) { /* for qtest_clock_warp */
>> -            return qtest_get_virtual_clock();
>> -        } else {
>> -            return cpu_get_clock();
>> -        }
>> +        return cpus_get_virtual_clock();
>>      case QEMU_CLOCK_HOST:
>>          return REPLAY_CLOCK(REPLAY_CLOCK_HOST, get_clock_realtime());
>>      case QEMU_CLOCK_VIRTUAL_RT:
>>
> 
> 


