Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C50481977
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 06:03:17 +0100 (CET)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2nat-00062s-V4
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 00:03:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n2nZL-0005Gl-9f
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 00:01:39 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:54589
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n2nZG-0004eO-PB
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 00:01:38 -0500
HMM_SOURCE_IP: 172.18.0.188:39350.874950176
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.65 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 73F7228008F;
 Thu, 30 Dec 2021 13:01:08 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 18ad83430a6947c5bc3c5f8175e6bd4b for
 peterx@redhat.com; Thu, 30 Dec 2021 13:01:12 CST
X-Transaction-ID: 18ad83430a6947c5bc3c5f8175e6bd4b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <511005c6-b9ce-6673-0529-e0b7d18bfead@chinatelecom.cn>
Date: Thu, 30 Dec 2021 13:01:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
To: Peter Xu <peterx@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <dd69e3b37bb9b3fd9cd1fa6d6bf10b8faf461c83.1639479557.git.huangy81@chinatelecom.cn>
 <YcRZpy1zecHd9jMh@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YcRZpy1zecHd9jMh@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
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



在 2021/12/23 19:12, Peter Xu 写道:
> Hi, Yong,
> 
> On Tue, Dec 14, 2021 at 07:07:32PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
>> tracking for calculate dirtyrate periodly for dirty restraint.
>>
>> Implement thread for calculate dirtyrate periodly, which will
>> be used for dirty page limit.
>>
>> Add dirtylimit.h to introduce the util function for dirty
>> limit implementation.
> 
> Sorry to be late on reading it, my apologies.
> 
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   include/exec/memory.h       |   5 +-
>>   include/sysemu/dirtylimit.h |  51 ++++++++++++++
>>   migration/dirtyrate.c       | 160 +++++++++++++++++++++++++++++++++++++++++---
>>   migration/dirtyrate.h       |   2 +
>>   4 files changed, 207 insertions(+), 11 deletions(-)
>>   create mode 100644 include/sysemu/dirtylimit.h
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 20f1b27..606bec8 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -69,7 +69,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
>>   /* Dirty tracking enabled because measuring dirty rate */
>>   #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
>>   
>> -#define GLOBAL_DIRTY_MASK  (0x3)
>> +/* Dirty tracking enabled because dirty limit */
>> +#define GLOBAL_DIRTY_LIMIT      (1U << 2)
>> +
>> +#define GLOBAL_DIRTY_MASK  (0x7)
>>   
>>   extern unsigned int global_dirty_tracking;
>>   
>> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
>> new file mode 100644
>> index 0000000..34e48f8
>> --- /dev/null
>> +++ b/include/sysemu/dirtylimit.h
>> @@ -0,0 +1,51 @@
>> +/*
>> + * dirty limit helper functions
>> + *
>> + * Copyright (c) 2021 CHINA TELECOM CO.,LTD.
>> + *
>> + * Authors:
>> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#ifndef QEMU_DIRTYRLIMIT_H
>> +#define QEMU_DIRTYRLIMIT_H
>> +
>> +#define DIRTYLIMIT_CALC_TIME_MS         1000    /* 1000ms */
>> +
>> +/**
>> + * dirtylimit_calc_current
>> + *
>> + * get current dirty page rate for specified virtual CPU.
>> + */
>> +int64_t dirtylimit_calc_current(int cpu_index);
>> +
>> +/**
>> + * dirtylimit_calc_start
>> + *
>> + * start dirty page rate calculation thread.
>> + */
>> +void dirtylimit_calc_start(void);
>> +
>> +/**
>> + * dirtylimit_calc_quit
>> + *
>> + * quit dirty page rate calculation thread.
>> + */
>> +void dirtylimit_calc_quit(void);
>> +
>> +/**
>> + * dirtylimit_calc_state_init
>> + *
>> + * initialize dirty page rate calculation state.
>> + */
>> +void dirtylimit_calc_state_init(int max_cpus);
>> +
>> +/**
>> + * dirtylimit_calc_state_finalize
>> + *
>> + * finalize dirty page rate calculation state.
>> + */
>> +void dirtylimit_calc_state_finalize(void);
>> +#endif
> 
> Since dirtylimit and dirtyrate looks so alike, not sure it's easier to just
> reuse dirtyrate.h; after all you reused dirtyrate.c.
I'm working on this, and i find it's fine to just reuse dirtyrate.h, but 
the origin dirtyrate.h didn't export any function to other qemu module, 
so we should add a new file include/sysemu/dirtyrate.h to export the 
dirty page rage caluculation util function, how do you think about this?

I'm doing the code review and i find that it is more reasonable to 
implement the dirtylimit just in a standalone file such as 
softmmu/dirtylimit.c, since the implementation of dirtylimit in v10 has 
nothing to do with throttle algo in softmmu/cpu-throttle.c. If we merge 
the two implemenation into one file, it is weired. Is this ok?
> 
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index d65e744..e8d4e4a 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -27,6 +27,7 @@
>>   #include "qapi/qmp/qdict.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/runstate.h"
>> +#include "sysemu/dirtylimit.h"
>>   #include "exec/memory.h"
>>   
>>   /*
>> @@ -46,6 +47,155 @@ static struct DirtyRateStat DirtyStat;
>>   static DirtyRateMeasureMode dirtyrate_mode =
>>                   DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
>>   
>> +struct {
>> +    DirtyRatesData data;
>> +    bool quit;
>> +    QemuThread thread;
>> +} *dirtylimit_calc_state;
>> +
>> +static void dirtylimit_global_dirty_log_start(void)
>> +{
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_start(GLOBAL_DIRTY_LIMIT);
>> +    qemu_mutex_unlock_iothread();
>> +}
>> +
>> +static void dirtylimit_global_dirty_log_stop(void)
>> +{
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_LIMIT);
>> +    qemu_mutex_unlock_iothread();
>> +}
> 
> This is merely dirtyrate_global_dirty_log_start/stop but with a different flag.
> 
> Let's introduce global_dirty_log_change() with BQL?
> 
>    global_dirty_log_change(flag, onoff)
>    {
>      qemu_mutex_lock_iothread();
>      if (start) {
>          memory_global_dirty_log_start(flag);
>      } else {
>          memory_global_dirty_log_stop(flag);
>      }
>      qemu_mutex_unlock_iothread();
>    }
> 
> Then we merge 4 functions into one.
> 
> We can also have a BQL-version of global_dirty_log_sync() in the same patch if
> you think above helpful.
> 
>> +
>> +static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
>> +                                     CPUState *cpu, bool start)
>> +{
>> +    if (start) {
>> +        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
>> +    } else {
>> +        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
>> +    }
>> +}
>> +
>> +static void dirtylimit_calc_func(void)
> 
> Would you still consider merging this with calculate_dirtyrate_dirty_ring?
> 
> I still don't see why it can't.
> 
> Maybe it cannot be directly reused, but the whole logic is really, really
> similar: alloc an array of DirtyPageRecord, take notes, sleep, take some other
> notes, calculate per-vcpu dirty rates.
> 
> There's some trivial details that are different (whether start/stop logging,
> whether use sync), but they can be abstracted.
> 
> At least it can be changed into something like:
> 
>    dirtylimit_calc_func(DirtyRateVcpu *stat)
>    {
>        // never race against cpu hotplug/unplug
>        cpu_list_lock();
> 
>        // this should include allocate buffers and record initial values for all cores
>        record = vcpu_dirty_stat_alloc();
>        // do the sleep
>        duration = vcpu_dirty_stat_wait(records)
> 
>        // the "difference"..
>        global_dirty_log_sync();
> 
>        // collect end timestamps, calculates
>        vcpu_dirty_stat_collect(stat, records);
>        vcpu_dirty_stat_free(stat);
> 
>        cpu_list_unlock();
> 
>        return stat;
>    }
> 
> It may miss something but just to show what I meant..
I think this work is refactor and i do this in a standalone commit 
before the dirtylimit commits. Is this ok?
> 
>> +{
>> +    CPUState *cpu;
>> +    DirtyPageRecord *dirty_pages;
>> +    int64_t start_time, end_time, calc_time;
>> +    DirtyRateVcpu rate;
>> +    int i = 0;
>> +
>> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
>> +        dirtylimit_calc_state->data.nvcpu);
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(dirty_pages, cpu, true);
>> +    }
> 
> Note that I used cpu_list_lock() above and I think we need it.
> 
> Initially I thought rcu read lock is fine too (which is missing! btw) but I
> don't really think it'll work, because rcu assignment won't wait for a grace
> period when add/remove cpus into global cpu list.  So I don't see a good way to
> do this safely with cpu plug/unplug but to take the cpu list lock, otherwise be
> prepared to crash qemu when it happens..
> 
> I don't know whether the cpu list is doing the right thing on RCU assignment,
> but I know the mutex should work..
> 
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    g_usleep(DIRTYLIMIT_CALC_TIME_MS * 1000);
>> +    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    calc_time = end_time - start_time;
>> +
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_sync();
>> +    qemu_mutex_unlock_iothread();
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(dirty_pages, cpu, false);
>> +    }
>> +
>> +    for (i = 0; i < dirtylimit_calc_state->data.nvcpu; i++) {
>> +        uint64_t increased_dirty_pages =
>> +            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
>> +        uint64_t memory_size_MB =
>> +            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
>> +        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
>> +
>> +        rate.id = i;
>> +        rate.dirty_rate  = dirtyrate;
>> +        dirtylimit_calc_state->data.rates[i] = rate;
>> +
>> +        trace_dirtyrate_do_calculate_vcpu(i,
>> +            dirtylimit_calc_state->data.rates[i].dirty_rate);
>> +    }
>> +
>> +    free(dirty_pages);
>> +}
>> +
>> +static void *dirtylimit_calc_thread(void *opaque)
>> +{
>> +    rcu_register_thread();
>> +
>> +    dirtylimit_global_dirty_log_start();
>> +
>> +    while (!qatomic_read(&dirtylimit_calc_state->quit)) {
>> +        dirtylimit_calc_func();
>> +    }
>> +
>> +    dirtylimit_global_dirty_log_stop();
>> +
>> +    rcu_unregister_thread();
>> +    return NULL;
>> +}
>> +
>> +int64_t dirtylimit_calc_current(int cpu_index)
> 
> It's not "calculating" but "fetching", maybe simply call it
> vcpu_get_dirty_rate()?
> 
>> +{
>> +    DirtyRateVcpu *rates = dirtylimit_calc_state->data.rates;
>> +
>> +    return qatomic_read(&rates[cpu_index].dirty_rate);
>> +}
>> +
>> +void dirtylimit_calc_start(void)
>> +{
>> +    if (!qatomic_read(&dirtylimit_calc_state->quit)) {
> 
> If we can have a "running", then we should check "running==true" instead.
> Please see below on...
> 
>> +        goto end;
> 
> "return" would work.
> 
>> +    }
>> +
>> +    qatomic_set(&dirtylimit_calc_state->quit, 0);
> 
> Same here, set running=true, then clear it when thread quits.
> 
>> +    qemu_thread_create(&dirtylimit_calc_state->thread,
>> +                       "dirtylimit-calc",
>> +                       dirtylimit_calc_thread,
>> +                       NULL,
>> +                       QEMU_THREAD_JOINABLE);
>> +end:
>> +    return;
> 
> No need for both of them..
> 
>> +}
>> +
>> +void dirtylimit_calc_quit(void)
>> +{
>> +    qatomic_set(&dirtylimit_calc_state->quit, 1);
>> +
>> +    if (qemu_mutex_iothread_locked()) {
> 
> Ideally I think this should already with BQL so not necessary?  I'll check
> later patches, just leave a mark.
> 
>> +        qemu_mutex_unlock_iothread();
>> +        qemu_thread_join(&dirtylimit_calc_state->thread);
>> +        qemu_mutex_lock_iothread();
>> +    } else {
>> +        qemu_thread_join(&dirtylimit_calc_state->thread);
>> +    }
>> +}
>> +
>> +void dirtylimit_calc_state_init(int max_cpus)
>> +{
>> +    dirtylimit_calc_state =
>> +        g_malloc0(sizeof(*dirtylimit_calc_state));
>> +
>> +    dirtylimit_calc_state->data.nvcpu = max_cpus;
>> +    dirtylimit_calc_state->data.rates =
>> +        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
>> +
>> +    dirtylimit_calc_state->quit = true;
> 
> Instead of using "quit", I'd rather use "running".  It'll be false by default
> and only set when thread runs.
> 
> Setting "quit" by default just reads weird.. or let's keep both "quit" or
> "running", I think it'll be cleaner, then here we should make running=false and
> quit=false too.
> 
>> +}
>> +
>> +void dirtylimit_calc_state_finalize(void)
>> +{
>> +    free(dirtylimit_calc_state->data.rates);
>> +    dirtylimit_calc_state->data.rates = NULL;
>> +
>> +    free(dirtylimit_calc_state);
>> +    dirtylimit_calc_state = NULL;
>> +}
>> +
>>   static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>>   {
>>       int64_t current_time;
>> @@ -396,16 +546,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>>       return true;
>>   }
>>   
>> -static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
>> -                                     CPUState *cpu, bool start)
>> -{
>> -    if (start) {
>> -        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
>> -    } else {
>> -        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
>> -    }
>> -}
>> -
>>   static void dirtyrate_global_dirty_log_start(void)
>>   {
>>       qemu_mutex_lock_iothread();
>> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
>> index 69d4c5b..e96acdc 100644
>> --- a/migration/dirtyrate.h
>> +++ b/migration/dirtyrate.h
>> @@ -70,6 +70,8 @@ typedef struct VcpuStat {
>>       DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
>>   } VcpuStat;
>>   
>> +typedef struct VcpuStat DirtyRatesData;
>> +
>>   /*
>>    * Store calculation statistics for each measure.
>>    */
>> -- 
>> 1.8.3.1
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

