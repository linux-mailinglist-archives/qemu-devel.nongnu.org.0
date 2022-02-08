Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926204AD7B7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:45:43 +0100 (CET)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOwI-00030j-DN
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:45:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nHOZI-0001ky-Ou
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:58 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:48395
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nHOZC-0007SD-L0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:56 -0500
HMM_SOURCE_IP: 172.18.0.218:50930.421943876
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id A89B828008B;
 Tue,  8 Feb 2022 19:21:38 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 84e3a299c1e54caf9ac1e044b5c5b9c6 for
 peterx@redhat.com; Tue, 08 Feb 2022 19:21:41 CST
X-Transaction-ID: 84e3a299c1e54caf9ac1e044b5c5b9c6
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <45cd47a0-f8f8-75ff-2afd-0b8950045dab@chinatelecom.cn>
Date: Tue, 8 Feb 2022 19:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v12 4/5] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
 <d20859732c07bb052ff8ffb91f660be90861fa74.1643026714.git.huangy81@chinatelecom.cn>
 <YgIw6/rrfJd+9lQ5@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgIw6/rrfJd+9lQ5@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/2/8 16:59, Peter Xu 写道:
> On Mon, Jan 24, 2022 at 10:10:39PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Setup a negative feedback system when vCPU thread
>> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
>> throttle_us_per_full field in struct CPUState. Sleep
>> throttle_us_per_full microseconds to throttle vCPU
>> if dirtylimit is enabled.
>>
>> Start a thread to track current dirty page rates and
>> tune the throttle_us_per_full dynamically untill current
>> dirty page rate reach the quota.
>>
>> Introduce the util function in the header for dirtylimit
>> implementation.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   accel/kvm/kvm-all.c         |  13 ++
>>   accel/stubs/kvm-stub.c      |   5 +
>>   include/hw/core/cpu.h       |   6 +
>>   include/sysemu/dirtylimit.h |  16 +++
>>   include/sysemu/kvm.h        |   2 +
>>   softmmu/dirtylimit.c        | 308 ++++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/trace-events        |   8 ++
>>   7 files changed, 358 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 1a5f1d1..60f51fd 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -45,6 +45,7 @@
>>   #include "qemu/guest-random.h"
>>   #include "sysemu/hw_accel.h"
>>   #include "kvm-cpus.h"
>> +#include "sysemu/dirtylimit.h"
>>   
>>   #include "hw/boards.h"
>>   
>> @@ -476,6 +477,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>>       cpu->kvm_state = s;
>>       cpu->vcpu_dirty = true;
>>       cpu->dirty_pages = 0;
>> +    cpu->throttle_us_per_full = 0;
>>   
>>       mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
>>       if (mmap_size < 0) {
>> @@ -1469,6 +1471,11 @@ static void *kvm_dirty_ring_reaper_thread(void *data)
>>            */
>>           sleep(1);
>>   
>> +        /* keep sleeping in order to not interfere the dirtylimit */
>> +        if (dirtylimit_in_service()) {
>> +            continue;
>> +        }
>> +
>>           trace_kvm_dirty_ring_reaper("wakeup");
>>           r->reaper_state = KVM_DIRTY_RING_REAPER_REAPING;
>>   
>> @@ -2312,6 +2319,11 @@ bool kvm_dirty_ring_enabled(void)
>>       return kvm_state->kvm_dirty_ring_size ? true : false;
>>   }
>>   
>> +uint32_t kvm_dirty_ring_size(void)
>> +{
>> +    return kvm_state->kvm_dirty_ring_size;
>> +}
> 
> Please consider moving this into a small patch too along with the stub.
Ok
> 
>> +
>>   static int kvm_init(MachineState *ms)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> @@ -2961,6 +2973,7 @@ int kvm_cpu_exec(CPUState *cpu)
>>               qemu_mutex_lock_iothread();
>>               kvm_dirty_ring_reap(kvm_state, cpu);
>>               qemu_mutex_unlock_iothread();
>> +            dirtylimit_vcpu_execute(cpu);
>>               ret = 0;
>>               break;
>>           case KVM_EXIT_SYSTEM_EVENT:
>> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
>> index 5319573..1128cb2 100644
>> --- a/accel/stubs/kvm-stub.c
>> +++ b/accel/stubs/kvm-stub.c
>> @@ -152,4 +152,9 @@ bool kvm_dirty_ring_enabled(void)
>>   {
>>       return false;
>>   }
>> +
>> +uint32_t kvm_dirty_ring_size(void)
>> +{
>> +    return 0;
>> +}
>>   #endif
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 76ab3b8..dbeb31a 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -411,6 +411,12 @@ struct CPUState {
>>        */
>>       bool throttle_thread_scheduled;
>>   
>> +    /*
>> +     * Sleep throttle_us_per_full microseconds once dirty ring is full
>> +     * if dirty page rate limit is enabled.
>> +     */
>> +    int64_t throttle_us_per_full;
>> +
>>       bool ignore_memory_transaction_failures;
>>   
>>       /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
>> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
>> index da459f0..37e634b 100644
>> --- a/include/sysemu/dirtylimit.h
>> +++ b/include/sysemu/dirtylimit.h
>> @@ -19,4 +19,20 @@ void vcpu_dirty_rate_stat_start(void);
>>   void vcpu_dirty_rate_stat_stop(void);
>>   void vcpu_dirty_rate_stat_initialize(void);
>>   void vcpu_dirty_rate_stat_finalize(void);
>> +
>> +void dirtylimit_state_lock(void);
>> +void dirtylimit_state_unlock(void);
>> +void dirtylimit_state_initialize(void);
>> +void dirtylimit_state_finalize(void);
>> +void dirtylimit_thread_finalize(void);
>> +bool dirtylimit_in_service(void);
>> +bool dirtylimit_vcpu_index_valid(int cpu_index);
>> +void dirtylimit_start(void);
>> +void dirtylimit_stop(void);
>> +void dirtylimit_set_vcpu(int cpu_index,
>> +                         uint64_t quota,
>> +                         bool enable);
>> +void dirtylimit_set_all(uint64_t quota,
>> +                        bool enable);
>> +void dirtylimit_vcpu_execute(CPUState *cpu);
>>   #endif
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index 6eb39a0..bc3f0b5 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -563,4 +563,6 @@ bool kvm_cpu_check_are_resettable(void);
>>   bool kvm_arch_cpu_check_are_resettable(void);
>>   
>>   bool kvm_dirty_ring_enabled(void);
>> +
>> +uint32_t kvm_dirty_ring_size(void);
>>   #endif
>> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
>> index a10ac6f..cf20020 100644
>> --- a/softmmu/dirtylimit.c
>> +++ b/softmmu/dirtylimit.c
>> @@ -18,6 +18,32 @@
>>   #include "sysemu/dirtylimit.h"
>>   #include "exec/memory.h"
>>   #include "hw/boards.h"
>> +#include "sysemu/kvm.h"
>> +#include "trace.h"
>> +
>> +/*
>> + * Dirtylimit stop working if dirty page rate error
>> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
>> + */
>> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
>> +/*
>> + * Dirty page rate error greater than
>> + * DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK should use
>> + * linear adjustment police.
>> + */
>> +#define DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK  400  /* MB/s */
> 
> Is this magic value really useful?
> 
> Asked since it smells like a workaround to avoid oscillation, at the meantime,
> AFAICT it's never used, see [1] below.
> 
Ok, my fault, i'll remove this if it doesn't help avoiding oscillation
> Again, I really hope we use as less magic values as possible.  Piling up magic
> code (without solid proof that it'll help) is scary..
> 
>> +/*
>> + * Plus or minus vcpu sleep time linearly if dirty
>> + * page rate error value percentage over
>> + * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
>> + * Otherwise, plus or minus a fixed vcpu sleep time.
>> + */
>> +#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
>> +/*
>> + * Max vcpu sleep time percentage during a cycle
>> + * composed of dirty ring full and sleep time.
>> + */
>> +#define DIRTYLIMIT_THROTTLE_PCT_MAX 99
>>   
>>   struct {
>>       VcpuStat stat;
>> @@ -25,6 +51,31 @@ struct {
>>       QemuThread thread;
>>   } *vcpu_dirty_rate_stat;
>>   
>> +typedef struct VcpuDirtyLimitState {
>> +    int cpu_index;
>> +    bool enabled;
>> +    /*
>> +     * Quota dirty page rate, unit is MB/s
>> +     * zero if not enabled.
>> +     */
>> +    uint64_t quota;
>> +} VcpuDirtyLimitState;
>> +
>> +struct {
>> +    VcpuDirtyLimitState *states;
>> +    /* Max cpus number configured by user */
>> +    int max_cpus;
>> +    /* Number of vcpu under dirtylimit */
>> +    int limited_nvcpu;
>> +    QEMUBH *bh;
>> +} *dirtylimit_state;
>> +
>> +/* protect dirtylimit_state */
>> +static QemuMutex dirtylimit_mutex;
>> +
>> +/* dirtylimit thread quit if dirtylimit_quit is true */
>> +static bool dirtylimit_quit;
>> +
>>   static void vcpu_dirty_rate_stat_collect(void)
>>   {
>>       int64_t start_time;
>> @@ -58,6 +109,7 @@ static void *vcpu_dirty_rate_stat_thread(void *opaque)
>>   
>>       while (qatomic_read(&vcpu_dirty_rate_stat->running)) {
>>           vcpu_dirty_rate_stat_collect();
>> +        qemu_bh_schedule(dirtylimit_state->bh);
> 
> When I mentioned "a hook" previously, I meant something like a function
> pointer.  Even simpler, IMHO you could call dirtylimit code directly, assuming
> this thread only services dirty limit.
> 
> Or is this BH required for some reason?
> 
>>       }
>>   
>>       /* stop log sync */
>> @@ -118,3 +170,259 @@ void vcpu_dirty_rate_stat_finalize(void)
>>       free(vcpu_dirty_rate_stat);
>>       vcpu_dirty_rate_stat = NULL;
>>   }
>> +
>> +void dirtylimit_state_lock(void)
>> +{
>> +    qemu_mutex_lock(&dirtylimit_mutex);
>> +}
>> +
>> +void dirtylimit_state_unlock(void)
>> +{
>> +    qemu_mutex_unlock(&dirtylimit_mutex);
>> +}
>> +
>> +static void
>> +__attribute__((__constructor__)) dirtylimit_mutex_init(void)
>> +{
>> +    qemu_mutex_init(&dirtylimit_mutex);
>> +}
>> +
>> +static inline VcpuDirtyLimitState *dirtylimit_vcpu_get_state(int cpu_index)
>> +{
>> +    return &dirtylimit_state->states[cpu_index];
>> +}
>> +
>> +void dirtylimit_state_initialize(void)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    int max_cpus = ms->smp.max_cpus;
>> +    int i;
>> +
>> +    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
>> +
>> +    dirtylimit_state->states =
>> +            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
>> +
>> +    for (i = 0; i < max_cpus; i++) {
>> +        dirtylimit_state->states[i].cpu_index = i;
>> +    }
>> +
>> +    dirtylimit_state->max_cpus = max_cpus;
>> +    trace_dirtylimit_state_initialize(max_cpus);
>> +}
>> +
>> +void dirtylimit_state_finalize(void)
>> +{
>> +    free(dirtylimit_state->states);
>> +    dirtylimit_state->states = NULL;
>> +
>> +    free(dirtylimit_state);
>> +    dirtylimit_state = NULL;
>> +
>> +    trace_dirtylimit_state_finalize();
>> +}
>> +
>> +bool dirtylimit_in_service(void)
>> +{
>> +    return !!dirtylimit_state;
>> +}
>> +
>> +bool dirtylimit_vcpu_index_valid(int cpu_index)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +
>> +    return !(cpu_index < 0 ||
>> +             cpu_index >= ms->smp.max_cpus);
>> +}
>> +
>> +static inline void dirtylimit_vcpu_set_quota(int cpu_index,
>> +                                             uint64_t quota,
>> +                                             bool on)
>> +{
>> +    if (on) {
>> +        dirtylimit_state->states[cpu_index].quota = quota;
>> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
>> +            dirtylimit_state->limited_nvcpu++;
>> +        }
>> +    } else {
>> +        dirtylimit_state->states[cpu_index].quota = 0;
>> +        if (dirtylimit_state->states[cpu_index].enabled) {
>> +            dirtylimit_state->limited_nvcpu--;
>> +        }
>> +    }
>> +
>> +    dirtylimit_state->states[cpu_index].enabled = on;
>> +}
>> +
>> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
>> +{
>> +    static uint64_t max_dirtyrate;
>> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
>> +    uint64_t dirty_ring_size_meory_MB =
>> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
>> +
>> +    if (max_dirtyrate < dirtyrate) {
>> +        max_dirtyrate = dirtyrate;
>> +    }
>> +
>> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
>> +}
>> +
>> +static inline bool dirtylimit_done(uint64_t quota,
>> +                                   uint64_t current)
>> +{
>> +    uint64_t min, max;
>> +
>> +    min = MIN(quota, current);
>> +    max = MAX(quota, current);
>> +
>> +    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
>> +}
>> +
>> +static inline bool
>> +dirtylimit_need_linear_adjustment(uint64_t quota,
>> +                                  uint64_t current)
>> +{
>> +    uint64_t min, max, pct, error;
>> +
>> +    min = MIN(quota, current);
>> +    max = MAX(quota, current);
>> +
>> +    error = (max - min);
>> +
>> +    if (error < DIRTYLIMIT_LINEAR_ADJUSTMENT_WATERMARK) {
>> +        false;
> 
> [1]
> 
> I think you wanted to use "return false"... Maybe this also means the macro
> never helped at all hence it can be dropped.
Yes, :( dropping this block can be a good choice.
> 
>> +    }
>> +
>> +    pct = error * 100 / max;
>> +
>> +    return pct > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
>> +}
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

