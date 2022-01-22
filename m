Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F43E49698F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 04:24:30 +0100 (CET)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB70u-0002ER-SL
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 22:24:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nB6zJ-0001Wk-L2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 22:22:49 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:49251
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nB6zG-0008HQ-LF
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 22:22:49 -0500
HMM_SOURCE_IP: 172.18.0.188:41106.987070388
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.59 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 1027B28008E;
 Sat, 22 Jan 2022 11:22:35 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 4ba2d3a69d304b26987b65724aaa1a81 for
 peterx@redhat.com; Sat, 22 Jan 2022 11:22:39 CST
X-Transaction-ID: 4ba2d3a69d304b26987b65724aaa1a81
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <bbfa9f72-c673-255c-73b6-d17406d54374@chinatelecom.cn>
Date: Sat, 22 Jan 2022 11:22:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 1/4] migration/dirtyrate: refactor dirty page rate
 calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <7cc032ae98e29471de57c00d3c0bd0fc5129ae23.1641316375.git.huangy81@chinatelecom.cn>
 <YeTSIh2Osx7Yrjle@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YeTSIh2Osx7Yrjle@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2022/1/17 10:19, Peter Xu 写道:
> On Wed, Jan 05, 2022 at 01:14:06AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> +
>> +static void vcpu_dirty_stat_collect(VcpuStat *stat,
>> +                                    DirtyPageRecord *records,
>> +                                    bool start)
>> +{
>> +    CPUState *cpu;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        if (!start && cpu->cpu_index >= stat->nvcpu) {
>> +            /*
>> +             * Never go there unless cpu is hot-plugged,
>> +             * just ignore in this case.
>> +             */
>> +            continue;
>> +        }
> 
> As commented before, I think the only way to do it right is does not allow cpu
> plug/unplug during measurement..
> 
> Say, even if index didn't get out of range, an unplug even should generate very
> stange output of the unplugged cpu.  Please see more below.
> 
>> +        record_dirtypages(records, cpu, start);
>> +    }
>> +}
>> +
>> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
>> +                                 int64_t init_time_ms,
>> +                                 VcpuStat *stat,
>> +                                 unsigned int flag,
>> +                                 bool one_shot)
>> +{
>> +    DirtyPageRecord *records;
>> +    int64_t duration;
>> +    int64_t dirtyrate;
>> +    int i = 0;
>> +
>> +    cpu_list_lock();
>> +    records = vcpu_dirty_stat_alloc(stat);
>> +    vcpu_dirty_stat_collect(stat, records, true);
>> +    cpu_list_unlock();
> 
> Continue with above - then I'm wondering whether we should just keep taking the
> lock until vcpu_dirty_stat_collect().
> 
> Yes we could be taking the lock for a long time because of the sleep, but the
> main thread plug thread will just wait for it to complete and it is at least
> not a e.g. deadlock.
> 
> The other solution is we do cpu_list_unlock() like this, but introduce another
> cpu_list_generation_id and boost it after any plug/unplug of cpu, aka, when cpu
> list changes.
> 
> Then we record cpu generation ID at the entry of this function and retry the
> whole measurement if at some point we found generation ID changed (we need to
> fetch the gen ID after having the lock, of course).  That could avoid us taking
> the cpu list lock during dirty_stat_wait(), but it'll start to complicate cpu
> list locking rules.
> 
> The simpler way is still just to take the lock, imho.
> 
Hi, Peter, i'm working on this as you suggetion, and keep taking the 
cpu_list_lock during dirty page rate calculation. I found the deadlock 
when testing hotplug scenario, the logic is as the following:

calc thread				qemu main thread
1. take qemu_cpu_list_lock
					1. take the BQL
2. collect dirty page and wait		2. cpu hotplug
					3. take qemu_cpu_list_lock
3. take the BQL

4. sync dirty log			

5. release the BQL

I just recall that is one of the reasons why i handle the plug/unplug 
scenario(another is cpu plug may wait a little bit long time when 
dirtylimit in service).

It seems that we have two strategies, one is just keep this logic 
untouched in v12 and add "cpu_list_generation_id" implementaion in TODO 
list(once this patchset been merged, i'll try that out)， another is 
introducing the "cpu_list_generation_id" right now.

What strategy do you prefer to?

Uh... I think the "unmatched_cnt" also kind of like this too, becauce 
once we remove the "unmatched count" logic, the throttle algo is more 
likely to oscillate and i prefer to add the "unmatched_cnt" in TODO list 
as above.

> The rest looks good, thanks.
> 
>> +
>> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
>> +
>> +    global_dirty_log_sync(flag, one_shot);
>> +
>> +    cpu_list_lock();
>> +    vcpu_dirty_stat_collect(stat, records, false);
>> +    cpu_list_unlock();
>> +
>> +    for (i = 0; i < stat->nvcpu; i++) {
>> +        dirtyrate = do_calculate_dirtyrate(records[i], duration);
>> +
>> +        stat->rates[i].id = i;
>> +        stat->rates[i].dirty_rate = dirtyrate;
>> +
>> +        trace_dirtyrate_do_calculate_vcpu(i, dirtyrate);
>> +    }
>> +
>> +    g_free(records);
>> +
>> +    return duration;
>> +}
>> +
>>   static bool is_sample_period_valid(int64_t sec)
>>   {
>>       if (sec < MIN_FETCH_DIRTYRATE_TIME_SEC ||
>> @@ -396,44 +518,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
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
>> -static void dirtyrate_global_dirty_log_start(void)
>> -{
>> -    qemu_mutex_lock_iothread();
>> -    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
>> -    qemu_mutex_unlock_iothread();
>> -}
>> -
>> -static void dirtyrate_global_dirty_log_stop(void)
>> -{
>> -    qemu_mutex_lock_iothread();
>> -    memory_global_dirty_log_sync();
>> -    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
>> -    qemu_mutex_unlock_iothread();
>> -}
>> -
>> -static int64_t do_calculate_dirtyrate_vcpu(DirtyPageRecord dirty_pages)
>> -{
>> -    uint64_t memory_size_MB;
>> -    int64_t time_s;
>> -    uint64_t increased_dirty_pages =
>> -        dirty_pages.end_pages - dirty_pages.start_pages;
>> -
>> -    memory_size_MB = (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
>> -    time_s = DirtyStat.calc_time;
>> -
>> -    return memory_size_MB / time_s;
>> -}
>> -
>>   static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
>>                                               bool start)
>>   {
>> @@ -444,11 +528,6 @@ static inline void record_dirtypages_bitmap(DirtyPageRecord *dirty_pages,
>>       }
>>   }
>>   
>> -static void do_calculate_dirtyrate_bitmap(DirtyPageRecord dirty_pages)
>> -{
>> -    DirtyStat.dirty_rate = do_calculate_dirtyrate_vcpu(dirty_pages);
>> -}
>> -
>>   static inline void dirtyrate_manual_reset_protect(void)
>>   {
>>       RAMBlock *block = NULL;
>> @@ -492,71 +571,52 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
>>       DirtyStat.start_time = start_time / 1000;
>>   
>>       msec = config.sample_period_seconds * 1000;
>> -    msec = set_sample_page_period(msec, start_time);
>> +    msec = dirty_stat_wait(msec, start_time);
>>       DirtyStat.calc_time = msec / 1000;
>>   
>>       /*
>> -     * dirtyrate_global_dirty_log_stop do two things.
>> +     * do two things.
>>        * 1. fetch dirty bitmap from kvm
>>        * 2. stop dirty tracking
>>        */
>> -    dirtyrate_global_dirty_log_stop();
>> +    global_dirty_log_sync(GLOBAL_DIRTY_DIRTY_RATE, true);
>>   
>>       record_dirtypages_bitmap(&dirty_pages, false);
>>   
>> -    do_calculate_dirtyrate_bitmap(dirty_pages);
>> +    DirtyStat.dirty_rate = do_calculate_dirtyrate(dirty_pages, msec);
>>   }
>>   

-- 
Best regard

Hyman Huang(黄勇)

