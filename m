Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A33A43CE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:08:30 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhpl-0007RG-8J
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lrhnE-0005DC-7c
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:05:52 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:46733
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lrhn9-0007ru-GV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:05:51 -0400
HMM_SOURCE_IP: 172.18.0.48:45910.1211675007
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-124.205.116.130?logid-0841687217cc42bbb54dc8891439807c
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 40A01280029;
 Fri, 11 Jun 2021 22:05:26 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 0841687217cc42bbb54dc8891439807c for
 zhengchuan@huawei.com; Fri Jun 11 22:05:30 2021
X-Transaction-ID: 0841687217cc42bbb54dc8891439807c
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v3 7/7] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <a930f410178862fda49ae2c613a0757c7e07e006.1623027729.git.huangy81@chinatelecom.cn>
 <YL5nNYXmrqMlXF3v@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <8401d4fe-2395-67f4-ba33-2c388ac246d9@chinatelecom.cn>
Date: Fri, 11 Jun 2021 22:05:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YL5nNYXmrqMlXF3v@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/8 2:36, Peter Xu 写道:
> On Mon, Jun 07, 2021 at 09:15:20AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> use dirty ring feature to implement dirtyrate calculation.
>> to enable it, set vcpu option as true in calc-dirty-rate.
>>
>> add per_vcpu as mandatory option in calc_dirty_rate, to calculate
>> dirty rate for vcpu, and use hmp cmd:
>> (qemu) calc_dirty_rate 1 on
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   hmp-commands.hx        |   7 +-
>>   migration/dirtyrate.c  | 226 ++++++++++++++++++++++++++++++++++++++---
>>   migration/trace-events |   5 +
>>   3 files changed, 220 insertions(+), 18 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 84dcc3aae6..cc24ab2ab1 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1736,8 +1736,9 @@ ERST
>>   
>>       {
>>           .name       = "calc_dirty_rate",
>> -        .args_type  = "second:l,sample_pages_per_GB:l?",
>> -        .params     = "second [sample_pages_per_GB]",
>> -        .help       = "start a round of guest dirty rate measurement",
>> +        .args_type  = "second:l,per_vcpu:b,sample_pages_per_GB:l?",
> 
> How about "dirty-ring:-r"?  Then it's: "(qemu) calc_dirty_rate -r 10".  It can
> still be a bool in HMP even if it's a "*mode" in qmp.  We can further make "-l"
> for dirty logging (if we want that at last) and make two flags exclusive.
> 
>> +        .params     = "second on|off [sample_pages_per_GB]",
>> +        .help       = "start a round of guest dirty rate measurement, "
>> +                      "calculate for vcpu use on|off",
>>           .cmd        = hmp_calc_dirty_rate,
>>       },
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index 055145c24c..e432118f49 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -16,6 +16,9 @@
>>   #include "cpu.h"
>>   #include "exec/ramblock.h"
>>   #include "qemu/rcu_queue.h"
>> +#include "qemu/main-loop.h"
>> +#include "sysemu/kvm.h"
>> +#include "sysemu/runstate.h"
>>   #include "qapi/qapi-commands-migration.h"
>>   #include "ram.h"
>>   #include "trace.h"
>> @@ -23,9 +26,38 @@
>>   #include "monitor/hmp.h"
>>   #include "monitor/monitor.h"
>>   #include "qapi/qmp/qdict.h"
>> +#include "exec/memory.h"
>> +
>> +typedef enum {
>> +    CALC_NONE = 0,
>> +    CALC_DIRTY_RING,
>> +    CALC_SAMPLE_PAGES,
>> +} CalcMethod;
>> +
>> +typedef struct DirtyPageRecord {
>> +    int64_t start_pages;
>> +    int64_t end_pages;
> 
> Why not uint64_t?  Note that we can also detect overflows using end_pages <
> start_pages when needed, but imho we don't even need to worry about it - since
> even if overflowed, "end - start" will still generate the right value..
yeah, it's more efficient. i'll change the type next version.
> 
>> +} DirtyPageRecord;
>> +
>> +static DirtyPageRecord *dirty_pages;
>>   
>>   static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>>   static struct DirtyRateStat DirtyStat;
>> +static CalcMethod last_method = CALC_NONE;
> 
> How about simply name it "dirty_rate_method" as it's "current" not "last"?
yeah !
> 
>> +bool register_powerdown_callback = false;
>> +
>> +static void dirtyrate_powerdown_req(Notifier *n, void *opaque)
>> +{
>> +    if (last_method == CALC_DIRTY_RING) {
>> +        g_free(DirtyStat.method.vcpu.rates);
>> +        DirtyStat.method.vcpu.rates = NULL;
>> +    }
>> +    trace_dirtyrate_powerdown_callback();
>> +}
> 
> In the cover letter, you did mention this as "add memory free callback to
> prevent memory leaking" but I didn't really follow..
> 
> If VM quits, QEMU quits, things got freed anyways (by OS)?
ok, i add this callback just ensure the qemu do free the struct 
logically. but it seems that this can't be done in many scenarios like 
qemu process has been killed, and the callback can't be triggered.
so letting the OS handle the free work is a wise decision.
> 
>> +
>> +static Notifier dirtyrate_powerdown_notifier = {
>> +    .notify = dirtyrate_powerdown_req
>> +};
>>   
>>   static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>>   {
>> @@ -72,6 +104,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>>   {
>>       int64_t dirty_rate = DirtyStat.dirty_rate;
>>       struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
>> +    DirtyRateVcpuList *head = NULL, **tail = &head;
>>   
>>       if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
>>           info->has_dirty_rate = true;
>> @@ -81,7 +114,22 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>>       info->status = CalculatingState;
>>       info->start_time = DirtyStat.start_time;
>>       info->calc_time = DirtyStat.calc_time;
>> -    info->sample_pages = DirtyStat.sample_pages;
>> +
>> +    if (last_method == CALC_DIRTY_RING) {
>> +        int i = 0;
>> +        info->per_vcpu = true;
>> +        info->has_vcpu_dirty_rate = true;
>> +        for (i = 0; i < DirtyStat.method.vcpu.nvcpu; i++) {
> 
> I would also suggest not use "vcpu" as name of field, maybe also "dirty_ring"?
> 
> And I think we can omit the "method" too and compilers should know it (same to
> the other places)?  Then it can be written as DirtyState.dirty_ring.nvcpu.
> 
>> +            DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
>> +            rate->id = DirtyStat.method.vcpu.rates[i].id;
>> +            rate->dirty_rate = DirtyStat.method.vcpu.rates[i].dirty_rate;
>> +            QAPI_LIST_APPEND(tail, rate);
>> +        }
>> +        info->vcpu_dirty_rate = head;
>> +    } else {
>> +        info->has_sample_pages = true;
>> +        info->sample_pages = DirtyStat.sample_pages;
>> +    }
>>   
>>       trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>>   
>> @@ -94,15 +142,37 @@ static void init_dirtyrate_stat(int64_t start_time,
>>       DirtyStat.dirty_rate = -1;
>>       DirtyStat.start_time = start_time;
>>       DirtyStat.calc_time = config.sample_period_seconds;
>> -    DirtyStat.sample_pages = config.sample_pages_per_gigabytes;
>> -
>> -    if (config.per_vcpu) {
>> -        DirtyStat.method.vcpu.nvcpu = -1;
>> -        DirtyStat.method.vcpu.rates = NULL;
>> -    } else {
>> -        DirtyStat.method.vm.total_dirty_samples = 0;
>> -        DirtyStat.method.vm.total_sample_count = 0;
>> -        DirtyStat.method.vm.total_block_mem_MB = 0;
>> +    DirtyStat.sample_pages =
>> +        config.per_vcpu ? -1 : config.sample_pages_per_gigabytes;
>> +
>> +    if (unlikely(!register_powerdown_callback)) {
>> +        qemu_register_powerdown_notifier(&dirtyrate_powerdown_notifier);
>> +        register_powerdown_callback = true;
>> +    }
>> +
>> +    switch (last_method) {
>> +    case CALC_NONE:
>> +    case CALC_SAMPLE_PAGES:
>> +        if (config.per_vcpu) {
>> +            DirtyStat.method.vcpu.nvcpu = -1;
>> +            DirtyStat.method.vcpu.rates = NULL;
>> +        } else {
>> +            DirtyStat.method.vm.total_dirty_samples = 0;
>> +            DirtyStat.method.vm.total_sample_count = 0;
>> +            DirtyStat.method.vm.total_block_mem_MB = 0;
>> +        }
>> +        break;
>> +    case CALC_DIRTY_RING:
>> +        if (!config.per_vcpu) {
>> +            g_free(DirtyStat.method.vcpu.rates);
>> +            DirtyStat.method.vcpu.rates = NULL;
>> +            DirtyStat.method.vm.total_dirty_samples = 0;
>> +            DirtyStat.method.vm.total_sample_count = 0;
>> +            DirtyStat.method.vm.total_block_mem_MB = 0;
>> +        }
> 
> I'm a bit confused; why it's CALC_DIRTY_RING but per_vcpu not set?  Why we need
> to care about "last_method" at all?..
this two method share the union, the sample method use the local 
variable of SampleVMStat type, the dirty ring method should alloc rates 
of DirtyRateVcpu type every time qmp calc_dirty_rate called in case of 
add vcpu, once rates has been store dirty rate value, it can't be freed 
until the next time of executing calc_dirty_rate, because info dirty 
rate may access the rates struct, so the rates struct can only be freed 
before calc_dirty_rate with sample.
> 
>> +        break;
>> +    default:
> 
> We can abort() here.
> 
>> +        break;
>>       }
>>   }
>>   
>> @@ -316,7 +386,7 @@ find_block_matched(RAMBlock *block, int count,
>>   }
>>   
>>   static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>> -                                  int block_count)
>> +                                   int block_count)
>>   {
>>       struct RamblockDirtyInfo *block_dinfo = NULL;
>>       RAMBlock *block = NULL;
>> @@ -340,14 +410,125 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>>       return true;
>>   }
>>   
>> -static void calculate_dirtyrate(struct DirtyRateConfig config)
>> +static void record_dirtypages(CPUState *cpu, bool start)
>> +{
>> +    if (start) {
>> +        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
>> +    } else {
>> +        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
>> +    }
>> +}
>> +
>> +static void dirtyrate_global_dirty_log_start(void)
>> +{
>> +    /* dirty logging is enabled already */
>> +    if (global_dirty_log) {
>> +        return;
>> +    }
> 
> If it's a bitmask already, then we'd want to drop this..
> 
>> +
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
>> +    qemu_mutex_unlock_iothread();
>> +    trace_dirtyrate_dirty_log_start();
> 
> How about moving this trace into memory_global_dirty_log_start() of the other
> patch, dumps the bitmask?
it's a good idea.
> 
>> +}
>> +
>> +static void dirtyrate_global_dirty_log_stop(void)
>> +{
>> +    /* migration is in process, do not stop dirty logging,
>> +     * just clear the GLOBAL_DIRTY_DIRTY_RATE bit */
>> +    if (global_dirty_log & GLOBAL_DIRTY_MIGRATION) {
>> +        global_dirty_log &= ~(GLOBAL_DIRTY_DIRTY_RATE);
>> +        return;
>> +    }
> 
> IIUC we don't need this either..
> 
> memory_global_dirty_log_start|stop() will make sure all things work already, we
> should only use these apis and stop caring about migration at all.
> 
> Or did I miss something?
> 
>> +
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
>> +    qemu_mutex_unlock_iothread();
>> +    trace_dirtyrate_dirty_log_stop();
> 
> Same question here; maybe better to move into memory_global_dirty_log_stop()?
> Can make it trace_global_dirty_changed(bitmask) and call at start/stop.
> 
>> +}
>> +
>> +static int64_t do_calculate_dirtyrate_vcpu(int idx)
>> +{
>> +    uint64_t memory_size_MB;
>> +    int64_t time_s;
>> +    uint64_t start_pages = dirty_pages[idx].start_pages;
>> +    uint64_t end_pages = dirty_pages[idx].end_pages;
>> +    uint64_t dirty_pages = 0;
>> +
>> +    /* uint64_t over the INT64_MAX */
>> +    if (unlikely(end_pages < start_pages)) {
>> +        dirty_pages = INT64_MAX - start_pages + end_pages + 1;
>> +    } else {
>> +        dirty_pages = end_pages - start_pages;
>> +    }
> 
> As mentioned above, IMHO this would be enough:
> 
>             dirty_pages = end_pages - start_pages;
> 
> even if rare overflowed happened.
yeah, i'll drop the old algorithm
> 
>> +
>> +    memory_size_MB = (dirty_pages * TARGET_PAGE_SIZE) >> 20;
>> +    time_s = DirtyStat.calc_time;
>> +
>> +    trace_dirtyrate_do_calculate_vcpu(idx, dirty_pages, time_s);
>> +
>> +    return memory_size_MB / time_s;
>> +}
>> +
>> +static void calculate_dirtyrate_vcpu(struct DirtyRateConfig config)
>> +{
>> +    CPUState *cpu;
>> +    int64_t msec = 0;
>> +    int64_t start_time;
>> +    uint64_t dirtyrate = 0;
>> +    uint64_t dirtyrate_sum = 0;
>> +    int nvcpu = 0;
>> +    int i = 0;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        nvcpu++;
>> +    }
>> +
>> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) * nvcpu);
>> +
>> +    dirtyrate_global_dirty_log_start();
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(cpu, true);
>> +    }
>> +
>> +    DirtyStat.method.vcpu.nvcpu = nvcpu;
>> +    if (last_method != CALC_DIRTY_RING) {
>> +        DirtyStat.method.vcpu.rates =
>> +            g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
>> +    }
> 
> I don't see a strong need to optimize malloc() for continuous dirty rate
> measurements.  Can we simply malloc() for every measurement we need?
> 
> If we really want this, it would be nice to make it a follow up patch, but we'd
> better justify why it helps...
> 
> Btw, I think it's better the malloc()s happen before measuring starts, e.g.:
> 
>    cpu_foreach { nvcpu++ }
>    rates = malloc(...)
>    dirty_pages = malloc(...)
> 
>    global_dirty_log_start(DIRTY_RATE)
>    cpu_foreach { record_dirtypages() }
>    ...
> 
ok, adjust it next version.
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    DirtyStat.start_time = start_time / 1000;
>> +
>> +    msec = config.sample_period_seconds * 1000;
>> +    msec = set_sample_page_period(msec, start_time);
>> +    DirtyStat.calc_time = msec / 1000;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(cpu, false);
>> +    }
>> +
>> +    dirtyrate_global_dirty_log_stop();
>> +
>> +    for (i = 0; i < DirtyStat.method.vcpu.nvcpu; i++) {
>> +        dirtyrate = do_calculate_dirtyrate_vcpu(i);
>> +        DirtyStat.method.vcpu.rates[i].id = i;
>> +        DirtyStat.method.vcpu.rates[i].dirty_rate = dirtyrate;
>> +        dirtyrate_sum += dirtyrate;
>> +    }
>> +
>> +    DirtyStat.dirty_rate = dirtyrate_sum / DirtyStat.method.vcpu.nvcpu;
>> +    g_free(dirty_pages);
>> +}
>> +
>> +static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
>>   {
>>       struct RamblockDirtyInfo *block_dinfo = NULL;
>>       int block_count = 0;
>>       int64_t msec = 0;
>>       int64_t initial_time;
>>   
>> -    rcu_register_thread();
> 
> Better to make this a separate patch.
> 
> Thanks,
> 
>>       rcu_read_lock();
>>       initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>>       if (!record_ramblock_hash_info(&block_dinfo, config, &block_count)) {
>> @@ -364,13 +545,24 @@ static void calculate_dirtyrate(struct DirtyRateConfig config)
>>       if (!compare_page_hash_info(block_dinfo, block_count)) {
>>           goto out;
>>       }
>> -
>>       update_dirtyrate(msec);
>>   
>>   out:
>>       rcu_read_unlock();
>>       free_ramblock_dirty_info(block_dinfo, block_count);
>> -    rcu_unregister_thread();
>> +}
>> +
>> +static void calculate_dirtyrate(struct DirtyRateConfig config)
>> +{
>> +    if (config.per_vcpu) {
>> +        calculate_dirtyrate_vcpu(config);
>> +        last_method = CALC_DIRTY_RING;
>> +    } else {
>> +        calculate_dirtyrate_sample_vm(config);
>> +        last_method = CALC_SAMPLE_PAGES;
>> +    }
>> +
>> +    trace_dirtyrate_calculate(DirtyStat.dirty_rate);
>>   }
>>   
>>   void *get_dirtyrate_thread(void *arg)
>> @@ -379,6 +571,8 @@ void *get_dirtyrate_thread(void *arg)
>>       int ret;
>>       int64_t start_time;
>>   
>> +    rcu_register_thread();
>> +
>>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>>                                 DIRTY_RATE_STATUS_MEASURING);
>>       if (ret == -1) {
>> @@ -396,6 +590,8 @@ void *get_dirtyrate_thread(void *arg)
>>       if (ret == -1) {
>>           error_report("change dirtyrate state failed.");
>>       }
>> +
>> +    rcu_unregister_thread();
>>       return NULL;
>>   }
>>   
>> diff --git a/migration/trace-events b/migration/trace-events
>> index 860c4f4025..4c5a658665 100644
>> --- a/migration/trace-events
>> +++ b/migration/trace-events
>> @@ -330,6 +330,11 @@ get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock n
>>   calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
>>   skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
>>   find_page_matched(const char *idstr) "ramblock %s addr or size changed"
>> +dirtyrate_calculate(int64_t dirtyrate) "dirty rate: %" PRIi64
>> +dirtyrate_do_calculate_vcpu(int idx, uint64_t pages, int64_t seconds) "vcpu[%d]: dirty %"PRIu64 " pages in %"PRIi64 " seconds"
>> +dirtyrate_powerdown_callback(void) ""
>> +dirtyrate_dirty_log_start(void) ""
>> +dirtyrate_dirty_log_stop(void) ""
>>   
>>   # block.c
>>   migration_block_init_shared(const char *blk_device_name) "Start migration for %s with shared base image"
>> -- 
>> 2.18.2
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

