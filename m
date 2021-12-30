Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD82481E3A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:38:38 +0100 (CET)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2yRo-00061X-Mk
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:38:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n2yQM-0005EW-Ej
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:37:06 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:59928
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n2yQI-0004Ct-2g
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:37:06 -0500
HMM_SOURCE_IP: 172.18.0.48:38478.2138721387
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.65 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D38F1280029;
 Fri, 31 Dec 2021 00:36:42 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2b1325991ad24155ad5e9d16d5e7f25e for
 peterx@redhat.com; Fri, 31 Dec 2021 00:36:48 CST
X-Transaction-ID: 2b1325991ad24155ad5e9d16d5e7f25e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
Date: Fri, 31 Dec 2021 00:36:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YcVWzuPDawXtXGIX@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) NICE_REPLY_A=-3.024, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/24 13:12, Peter Xu 写道:
> On Tue, Dec 14, 2021 at 07:07:33PM +0800, huangy81@chinatelecom.cn wrote:
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
>>   accel/kvm/kvm-all.c           |  11 ++
>>   include/hw/core/cpu.h         |   6 +
>>   include/sysemu/cpu-throttle.h |  77 +++++++++
>>   include/sysemu/kvm.h          |   2 +
>>   qapi/migration.json           |  19 +++
>>   softmmu/cpu-throttle.c        | 371 ++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/trace-events          |   6 +
>>   7 files changed, 492 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index eecd803..cba5fed 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -45,6 +45,7 @@
>>   #include "qemu/guest-random.h"
>>   #include "sysemu/hw_accel.h"
>>   #include "kvm-cpus.h"
>> +#include "sysemu/cpu-throttle.h"
>>   
>>   #include "hw/boards.h"
>>   
>> @@ -2303,6 +2304,11 @@ bool kvm_dirty_ring_enabled(void)
>>       return kvm_state->kvm_dirty_ring_size ? true : false;
>>   }
>>   
>> +uint32_t kvm_dirty_ring_size(void)
>> +{
>> +    return kvm_state->kvm_dirty_ring_size;
>> +}
>> +
>>   static int kvm_init(MachineState *ms)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> @@ -2933,6 +2939,11 @@ int kvm_cpu_exec(CPUState *cpu)
>>               qemu_mutex_lock_iothread();
>>               kvm_dirty_ring_reap(kvm_state);
>>               qemu_mutex_unlock_iothread();
>> +            if (dirtylimit_in_service() &&
>> +                dirtylimit_is_enabled(cpu->cpu_index) &&
>> +                cpu->throttle_us_per_full) {
>> +                usleep(cpu->throttle_us_per_full);
>> +            }
> 
> Looks good, but perhaps put it into a dirty limit exported helper?
> 
>>               ret = 0;
>>               break;
>>           case KVM_EXIT_SYSTEM_EVENT:
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index e948e81..be80fe2 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -411,6 +411,12 @@ struct CPUState {
>>        */
>>       bool throttle_thread_scheduled;
>>   
>> +    /*
>> +     * Sleep throttle_us_per_full microseconds once dirty ring is full
>> +     * when dirty page limit is enabled.
>> +     */
>> +    int64_t throttle_us_per_full;
>> +
>>       bool ignore_memory_transaction_failures;
>>   
>>       struct hax_vcpu_state *hax_vcpu;
>> diff --git a/include/sysemu/cpu-throttle.h b/include/sysemu/cpu-throttle.h
>> index d65bdef..d4973a5 100644
>> --- a/include/sysemu/cpu-throttle.h
>> +++ b/include/sysemu/cpu-throttle.h
>> @@ -65,4 +65,81 @@ bool cpu_throttle_active(void);
>>    */
>>   int cpu_throttle_get_percentage(void);
>>   
>> +/**
>> + * dirtylimit_is_enabled
>> + *
>> + * Returns: %true if dirty page rate limit on specified virtual CPU is enabled,
>> + *          %false otherwise.
>> + */
>> +bool dirtylimit_is_enabled(int cpu_index);
>> +
>> +/**
>> + * dirtylimit_in_service
>> + *
>> + * Returns: %true if dirty page rate limit thread is running, %false otherwise.
>> + */
>> +bool dirtylimit_in_service(void);
>> +
>> +/**
>> + * dirtylimit_stop
>> + *
>> + * stop dirty page rate limit thread.
>> + */
>> +void dirtylimit_stop(void);
>> +
>> +/**
>> + * dirtylimit_is_vcpu_index_valid
>> + *
>> + * Returns: %true if cpu index valid, %false otherwise.
>> + */
>> +bool dirtylimit_is_vcpu_index_valid(int cpu_index);
>> +
>> +/**
>> + * dirtylimit_state_init
>> + *
>> + * initialize golobal state for dirty page rate limit.
>> + */
>> +void dirtylimit_state_init(int max_cpus);
>> +
>> +/**
>> + * dirtylimit_state_finalize
>> + *
>> + * finalize golobal state for dirty page rate limit.
>> + */
>> +void dirtylimit_state_finalize(void);
>> +
>> +/**
>> + * dirtylimit_vcpu
>> + *
>> + * setup dirty page rate limit on specified virtual CPU with quota.
>> + */
>> +void dirtylimit_vcpu(int cpu_index, uint64_t quota);
>> +
>> +/**
>> + * dirtylimit_all
>> + *
>> + * setup dirty page rate limit on all virtual CPU with quota.
>> + */
>> +void dirtylimit_all(uint64_t quota);
>> +
>> +/**
>> + * dirtylimit_query_all
>> + *
>> + * Returns: dirty page limit information of all virtual CPU enabled.
>> + */
>> +struct DirtyLimitInfoList *dirtylimit_query_all(void);
>> +
>> +/**
>> + * dirtylimit_cancel_vcpu
>> + *
>> + * cancel dirtylimit for the specified virtual CPU.
>> + */
>> +void dirtylimit_cancel_vcpu(int cpu_index);
>> +
>> +/**
>> + * dirtylimit_cancel_all
>> + *
>> + * cancel dirtylimit for all virtual CPU enabled.
>> + */
>> +void dirtylimit_cancel_all(void);
>>   #endif /* SYSEMU_CPU_THROTTLE_H */
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index 7b22aeb..e5a9a28 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -548,4 +548,6 @@ bool kvm_cpu_check_are_resettable(void);
>>   bool kvm_arch_cpu_check_are_resettable(void);
>>   
>>   bool kvm_dirty_ring_enabled(void);
>> +
>> +uint32_t kvm_dirty_ring_size(void);
>>   #endif
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index bbfd48c..ac5fa56 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1850,6 +1850,25 @@
>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>   
>>   ##
>> +# @DirtyLimitInfo:
>> +#
>> +# Dirty page rate limit information of virtual CPU.
>> +#
>> +# @cpu-index: index of virtual CPU.
>> +#
>> +# @limit-rate: upper limit of dirty page rate for virtual CPU.
>> +#
>> +# @current-rate: current dirty page rate for virtual CPU.
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'DirtyLimitInfo',
>> +  'data': { 'cpu-index': 'int',
>> +            'limit-rate': 'int64',
>> +            'current-rate': 'int64' } }
>> +
>> +##
>>   # @snapshot-save:
>>   #
>>   # Save a VM snapshot
>> diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
>> index 8c2144a..4472ab3 100644
>> --- a/softmmu/cpu-throttle.c
>> +++ b/softmmu/cpu-throttle.c
>> @@ -29,6 +29,10 @@
>>   #include "qemu/main-loop.h"
>>   #include "sysemu/cpus.h"
>>   #include "sysemu/cpu-throttle.h"
>> +#include "sysemu/dirtylimit.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/qapi-commands-migration.h"
>> +#include "trace.h"
>>   
>>   /* vcpu throttling controls */
>>   static QEMUTimer *throttle_timer;
>> @@ -38,6 +42,373 @@ static unsigned int throttle_percentage;
>>   #define CPU_THROTTLE_PCT_MAX 99
>>   #define CPU_THROTTLE_TIMESLICE_NS 10000000
>>   
>> +#define DIRTYLIMIT_TOLERANCE_RANGE  25      /* 25MB/s */
>> +#define DIRTYLIMIT_THROTTLE_PCT_WATERMARK   50
>> +
>> +typedef struct DirtyLimitState {
>> +    int cpu_index;
>> +    bool enabled;
>> +    uint64_t quota;     /* quota dirtyrate MB/s */
>> +    int unfit_cnt;
> 
> What is this?
> 
> Thanks for documenting all the exported functions in the headers.  It's just
> that IMHO it still misses some nice documents on the ones we need, like this
> one, or DIRTYLIMIT_TOLERANCE_RANGE && DIRTYLIMIT_THROTTLE_PCT_WATERMARK above.
> 
>> +} DirtyLimitState;
> 
> How about name per-vcpu structures to be something like VcpuDirtyLimitState?
> Otherwise it has merely the same naming for the global structure right below,
> it can be confusing.
> 
>> +
>> +struct {
>> +    DirtyLimitState *states;
>> +    int max_cpus;
>> +    unsigned long *bmap; /* running thread bitmap */
>> +    unsigned long nr;
>> +    QemuThread thread;
>> +} *dirtylimit_state;
>> +
>> +static bool dirtylimit_quit = true;
> 
> Again, I think "quit" is not a good wording to show "whether dirtylimit is in
> service".  How about "dirtylimit_global_enabled"?
> 
> You can actually use "dirtylimit_state" to show whether it's enabled already
> (then drop the global value) since it's a pointer.  It shouldn't need to be
> init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
> globally, and destroy it (and reset it to NULL) when globally disabled.
> 
> Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
Yes, checking pointer is fairly straightforword, but since dirtylimit 
thread also access the dirtylimit_state when doing the limit, if we free 
dirtylimit_state after last limited vcpu be canceled, dirtylimit thread 
would crash when reference null pointer. And this method turn out to 
introduce a mutex lock to protect dirtylimit_state, comparing with 
qatomic operation, which is better ?
> 
>> +
>> +bool dirtylimit_is_enabled(int cpu_index)
>> +{
>> +    return qatomic_read(&dirtylimit_state->states[cpu_index].enabled);
>> +}
>> +
>> +static inline void dirtylimit_enable(int cpu_index)
>> +{
>> +    qatomic_set(&dirtylimit_state->states[cpu_index].enabled, 1);
>> +}
>> +
>> +static inline void dirtylimit_disable(int cpu_index)
>> +{
>> +    qatomic_set(&dirtylimit_state->states[cpu_index].enabled, 0);
>> +}
>> +
>> +bool dirtylimit_in_service(void)
>> +{
>> +    return !qatomic_read(&dirtylimit_quit);
>> +}
>> +
>> +void dirtylimit_stop(void)
>> +{
>> +    qatomic_set(&dirtylimit_quit, 1);
>> +    if (qemu_mutex_iothread_locked()) {
>> +        qemu_mutex_unlock_iothread();
>> +        qemu_thread_join(&dirtylimit_state->thread);
>> +        qemu_mutex_lock_iothread();
>> +    } else {
>> +        qemu_thread_join(&dirtylimit_state->thread);
> 
> Again, I'm confused, this function is always called with BQL, right?
Yes, i added locked check just in case this function is called without 
BQL, but after checking, only qmp command may call this function and 
it's always called with BQL in Qemu main thread, i'll remove this.
> 
>> +    }
>> +}
>> +
>> +static void dirtylimit_start(void)
>> +{
>> +    qatomic_set(&dirtylimit_quit, 0);
>> +}
>> +
>> +bool dirtylimit_is_vcpu_index_valid(int cpu_index)
>> +{
>> +    return !(cpu_index < 0 ||
>> +             cpu_index >= dirtylimit_state->max_cpus);
> 
> After/If you agree to free dirtylimit_state when disabled, we'd better not
> check state->max_cpus but the MachineState one - smp.max_cpus, just in case the
> state is not initialized.
Ok.
> 
>> +}
>> +
>> +static inline void dirtylimit_set_quota(int cpu_index, uint64_t quota)
>> +{
>> +    dirtylimit_state->states[cpu_index].quota = quota;
>> +}
>> +
>> +static inline uint64_t dirtylimit_quota(int cpu_index)
>> +{
>> +    return dirtylimit_state->states[cpu_index].quota;
>> +}
>> +
>> +static int64_t dirtylimit_current(int cpu_index)
>> +{
>> +    return dirtylimit_calc_current(cpu_index);
>> +}
>> +
>> +static inline int dirtylimit_unfit_cnt(int cpu_index)
>> +{
>> +    return dirtylimit_state->states[cpu_index].unfit_cnt;
>> +}
>> +
>> +static inline int dirtylimit_unfit_cnt_inc(int cpu_index)
>> +{
>> +    return ++dirtylimit_state->states[cpu_index].unfit_cnt;
>> +}
>> +
>> +static inline void dirtylimit_set_unfit_cnt(int cpu_index, int count)
>> +{
>> +    dirtylimit_state->states[cpu_index].unfit_cnt = count;
>> +}
> 
> I tend to drop most of these accesors and instead provide:
> 
> static inline DirtyLimitState *dirtylimit_vcpu_get(int cpu_index)
> {
>      return &dirtylimit_state->states[cpu_index];
> }
> 
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
>> +static inline bool dirtylimit_hit(uint64_t quota,
>> +                                  uint64_t current)
>> +{
>> +    uint64_t min, max;
>> +
>> +    min = MIN(quota, current);
>> +    max = MAX(quota, current);
>> +
>> +    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
>> +}
>> +
>> +static inline bool dirtylimit_turbo(uint64_t quota,
>> +                                    uint64_t current)
>> +{
>> +    uint64_t min, max, pct;
>> +
>> +    min = MIN(quota, current);
>> +    max = MAX(quota, current);
>> +
>> +    pct = (max - min) * 100 / max;
>> +
>> +    return pct > DIRTYLIMIT_THROTTLE_PCT_WATERMARK;
>> +}
>> +
>> +static void dirtylimit_throttle_init(CPUState *cpu,
>> +                                     uint64_t quota,
>> +                                     uint64_t current)
>> +{
>> +    uint64_t pct = 0;
>> +    int64_t throttle_us;
>> +
>> +    if (quota >= current || (current == 0)) {
>> +        cpu->throttle_us_per_full = 0;
>> +    } else {
>> +        pct = (current - quota) * 100 / current;
>> +        pct = MIN(pct, DIRTYLIMIT_THROTTLE_PCT_WATERMARK);
>> +        pct = (double)pct / 100;
>> +
>> +        throttle_us = dirtylimit_dirty_ring_full_time(current) / (1 - pct);
>> +        cpu->throttle_us_per_full = throttle_us;
>> +    }
>> +}
>> +
>> +static void dirtylimit_throttle(CPUState *cpu)
>> +{
>> +    int64_t ring_full_time_us = 0;
>> +    uint64_t quota = 0;
>> +    uint64_t current = 0;
>> +    uint64_t sleep_pct = 0;
>> +    uint64_t throttle_us = 0;
>> +
>> +    quota = dirtylimit_quota(cpu->cpu_index);
>> +    current = dirtylimit_current(cpu->cpu_index);
>> +
>> +    if (current == 0 &&
>> +        dirtylimit_unfit_cnt(cpu->cpu_index) == 0) {
> 
> Until here, there're already 3 helpers to access the same object.  How about
> fetching dirtylimit_state->states[cpu_index] once and remove these helpers?  We
> can directly reference the fields.  The helpers make nothing better but just
> less efficient by looking up cpu_index every time..
ok, thanks for the advice.
> 
>> +        cpu->throttle_us_per_full = 0;
>> +        goto end;
>> +    } else if (cpu->throttle_us_per_full == 0) {
>> +        dirtylimit_throttle_init(cpu, quota, current);
> 
> Why we need to init() if us_per_full==0?  What if we just have a valid
> us_per_full==0 value during throttling simply because the vcpu doesn't write at
> all so we reduced it to zero?
> 
> Can we simply init throttle_us_per_full to zero when enable?  If we can't
> access CPUState* during enablement, we can have a cached throttle_us in
> DirtyLimitState and init it there.  Then at the end of dirtylimit_throttle() we
> apply that to the one in CPUState.
> 
>> +        goto end;
>> +    } else if (dirtylimit_hit(quota, current)) {
> 
> This is the only "undertandable" code to me, until so far.. :)
> 
>> +        goto end;
>> +    } else if (dirtylimit_unfit_cnt_inc(cpu->cpu_index) < 2) {
> 
> Could you help define "unfit_cnt" first with some comment?
> 
> Why choose 2?  Have you tried 4/8/...?
Unfit_cnt means how many times we detect the quota dirtyrate does not 
match current dirtyrate, if we do the throttle once we detect the 
unmatched case, we may misjudge cause the throttle we impose may take 
effect after a little while.
> 
>> +        goto end;
>> +    }
>> +
>> +    dirtylimit_set_unfit_cnt(cpu->cpu_index, 0);
>> +
>> +    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
>> +    if (dirtylimit_turbo(quota, current)) {
>> +        if (quota < current) {
>> +            sleep_pct = (current - quota) * 100 / current;
>> +            throttle_us =
>> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
>> +            cpu->throttle_us_per_full += throttle_us;
>> +        } else {
>> +            sleep_pct = (quota - current) * 100 / quota;
>> +            throttle_us =
>> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
>> +            cpu->throttle_us_per_full -= throttle_us;
>> +        }
>> +
>> +        trace_dirtylimit_throttle_pct(cpu->cpu_index,
>> +                                      sleep_pct,
>> +                                      throttle_us);
>> +    } else {
>> +        if (quota < current) {
>> +            cpu->throttle_us_per_full += ring_full_time_us / 10;
>> +        } else {
>> +            cpu->throttle_us_per_full -= ring_full_time_us / 10;
>> +        }
>> +    }
> 
> So you chose to record the "global max dirty rate per-vcpu" and use it as a
> baseline for every vcpu, that looks okay.
> 
> The rest is a linear plus a differential feedback, responses farely fast, looks
> good too, mostly.  Hope it won't go into oscillation in some special case...
> 
>> +
>> +    cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
>> +        ring_full_time_us * CPU_THROTTLE_PCT_MAX);
>> +
>> +    cpu->throttle_us_per_full = MAX(cpu->throttle_us_per_full, 0);
>> +
>> +end:
>> +    trace_dirtylimit_throttle(cpu->cpu_index,
>> +                              quota, current,
>> +                              cpu->throttle_us_per_full);
>> +    return;
>> +}
>> +
>> +static void *dirtylimit_thread(void *opaque)
>> +{
>> +    CPUState *cpu;
>> +
>> +    rcu_register_thread();
>> +
>> +    while (dirtylimit_in_service()) {
>> +        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);
>> +        CPU_FOREACH(cpu) {
>> +            if (!dirtylimit_is_enabled(cpu->cpu_index)) {
>> +                continue;
>> +            }
>> +            dirtylimit_throttle(cpu);
>> +        }
>> +    }
>> +
>> +    rcu_unregister_thread();
>> +
>> +    return NULL;
>> +}
>> +
>> +static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
>> +{
>> +    DirtyLimitInfo *info = NULL;
>> +
>> +    info = g_malloc0(sizeof(*info));
>> +    info->cpu_index = cpu_index;
>> +    info->limit_rate = dirtylimit_quota(cpu_index);
>> +    info->current_rate = dirtylimit_current(cpu_index);
>> +
>> +    return info;
>> +}
>> +
>> +struct DirtyLimitInfoList *dirtylimit_query_all(void)
>> +{
>> +    int i, index;
>> +    DirtyLimitInfo *info = NULL;
>> +    DirtyLimitInfoList *head = NULL, **tail = &head;
>> +
>> +    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
>> +        index = dirtylimit_state->states[i].cpu_index;
>> +        if (dirtylimit_is_enabled(index)) {
>> +            info = dirtylimit_query_vcpu(index);
>> +            QAPI_LIST_APPEND(tail, info);
>> +        }
>> +    }
>> +
>> +    return head;
>> +}
>> +
>> +static int dirtylimit_nvcpus(void)
>> +{
>> +    int i;
>> +    int nr = 0;
>> +    for (i = 0; i < dirtylimit_state->nr; i++) {
>> +        unsigned long temp = dirtylimit_state->bmap[i];
>> +        nr += ctpopl(temp);
>> +    }
>> +
>> +   return nr;
> 
> This is IMHO not necessary, not only the function but the whole bitmap, because
> IIUC the bitmap is only used for counting this..
> 
> Instead we can have a counter shows how many vcpu is throttled.  Check that
> should work already and much easier..
That's a good advice. :)
> 
>> +}
>> +
>> +void dirtylimit_cancel_vcpu(int cpu_index)
>> +{
>> +    if (!dirtylimit_is_enabled(cpu_index)) {
>> +        return;
>> +    }
>> +
>> +    dirtylimit_set_quota(cpu_index, 0);
>> +    dirtylimit_disable(cpu_index);
>> +    bitmap_test_and_clear_atomic(dirtylimit_state->bmap, cpu_index, 1);
>> +
>> +    if (dirtylimit_nvcpus() == 0) {
>> +        dirtylimit_stop();
> 
> Here we stopped the dirtyrate thread, while the rest cleanup is done in
> qmp_vcpu_dirty_limit(), iiuc.
> 
> Can we merge them into one place so we cleanup everything?
Sure.
> 
>> +    }
>> +}
>> +
>> +void dirtylimit_cancel_all(void)
>> +{
>> +    int i, index;
>> +
>> +    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
>> +        index = dirtylimit_state->states[i].cpu_index;
>> +        if (dirtylimit_is_enabled(index)) {
>> +            dirtylimit_cancel_vcpu(index);
>> +        }
>> +    }
>> +}
>> +
>> +void dirtylimit_vcpu(int cpu_index, uint64_t quota)
>> +{
>> +    trace_dirtylimit_vcpu(cpu_index, quota);
>> +
>> +    dirtylimit_set_quota(cpu_index, quota);
>> +    dirtylimit_enable(cpu_index);
>> +    bitmap_set_atomic(dirtylimit_state->bmap, cpu_index, 1);
>> +
>> +    if (dirtylimit_in_service()) {
>> +        goto end;
> 
> return
> 
>> +    }
>> +
>> +    dirtylimit_start();
>> +    qemu_thread_create(&dirtylimit_state->thread,
>> +                       "dirtylimit",
>> +                       dirtylimit_thread,
>> +                       NULL,
>> +                       QEMU_THREAD_JOINABLE);
>> +end:
>> +    return;
> 
> These can be dropped.
> 
>> +}
>> +
>> +void dirtylimit_all(uint64_t quota)
>> +{
>> +    int i, index;
>> +
>> +    for (i = 0; i < dirtylimit_state->max_cpus; i++) {
>> +        index = dirtylimit_state->states[i].cpu_index;
>> +        dirtylimit_vcpu(index, quota);
>> +    }
>> +}
>> +
>> +void dirtylimit_state_init(int max_cpus)
>> +{
>> +    int i;
>> +
>> +    dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
>> +
>> +    dirtylimit_state->states =
>> +            g_malloc0(sizeof(DirtyLimitState) * max_cpus);
>> +
>> +    for (i = 0; i < max_cpus; i++) {
>> +        dirtylimit_state->states[i].cpu_index = i;
>> +    }
>> +
>> +    dirtylimit_state->max_cpus = max_cpus;
>> +    dirtylimit_state->bmap = bitmap_new(max_cpus);
>> +    bitmap_clear(dirtylimit_state->bmap, 0, max_cpus);
>> +    dirtylimit_state->nr = BITS_TO_LONGS(max_cpus);
>> +
>> +    trace_dirtylimit_state_init(max_cpus);
>> +}
>> +
>> +void dirtylimit_state_finalize(void)
>> +{
>> +    free(dirtylimit_state->states);
>> +    dirtylimit_state->states = NULL;
>> +
>> +    free(dirtylimit_state->bmap);
>> +    dirtylimit_state->bmap = NULL;
>> +
>> +    free(dirtylimit_state);
>> +    dirtylimit_state = NULL;
>> +}
>> +
>>   static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
>>   {
>>       double pct;
>> diff --git a/softmmu/trace-events b/softmmu/trace-events
>> index 9c88887..f19acf8 100644
>> --- a/softmmu/trace-events
>> +++ b/softmmu/trace-events
>> @@ -31,3 +31,9 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
>>   system_wakeup_request(int reason) "reason=%d"
>>   qemu_system_shutdown_request(int reason) "reason=%d"
>>   qemu_system_powerdown_request(void) ""
>> +
>> +#cpu-throttle.c
>> +dirtylimit_state_init(int max_cpus) "dirtylimit state init: max cpus %d"
>> +dirtylimit_throttle(int cpu_index, uint64_t quota, uint64_t current, int64_t time_us) "CPU[%d] throttle: quota %" PRIu64 ", current %" PRIu64 ", throttle %"PRIi64 " us"
>> +dirtylimit_throttle_pct(int cpu_index, uint64_t pct, int64_t time_us) "CPU[%d] throttle percent: %" PRIu64 ", throttle adjust time %"PRIi64 " us"
>> +dirtylimit_vcpu(int cpu_index, uint64_t quota) "CPU[%d] set dirty page rate limit %"PRIu64
>> -- 
>> 1.8.3.1
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

