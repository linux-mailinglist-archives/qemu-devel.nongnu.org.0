Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47674497C21
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:39:18 +0100 (CET)
Received: from localhost ([::1]:42880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvoj-0000u1-4O
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nBvmt-0007zB-RT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:37:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:39623
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nBvmj-00007I-CE
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:37:23 -0500
HMM_SOURCE_IP: 172.18.0.188:40476.641325321
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 9FDD92800DA;
 Mon, 24 Jan 2022 17:36:48 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 3e450e5aced340ff832ca8412bec42af for
 peterx@redhat.com; Mon, 24 Jan 2022 17:36:52 CST
X-Transaction-ID: 3e450e5aced340ff832ca8412bec42af
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <df5ecc84-546e-aee9-fd8e-9265a3130c96@chinatelecom.cn>
Date: Mon, 24 Jan 2022 17:36:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 1/4] migration/dirtyrate: refactor dirty page rate
 calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <7cc032ae98e29471de57c00d3c0bd0fc5129ae23.1641316375.git.huangy81@chinatelecom.cn>
 <YeTSIh2Osx7Yrjle@xz-m1.local>
 <bbfa9f72-c673-255c-73b6-d17406d54374@chinatelecom.cn>
 <Ye4YRsXDfvjuoPsh@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Ye4YRsXDfvjuoPsh@xz-m1.local>
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



在 2022/1/24 11:08, Peter Xu 写道:
> On Sat, Jan 22, 2022 at 11:22:37AM +0800, Hyman Huang wrote:
>>
>>
>> 在 2022/1/17 10:19, Peter Xu 写道:
>>> On Wed, Jan 05, 2022 at 01:14:06AM +0800, huangy81@chinatelecom.cn wrote:
>>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>>
>>>> +
>>>> +static void vcpu_dirty_stat_collect(VcpuStat *stat,
>>>> +                                    DirtyPageRecord *records,
>>>> +                                    bool start)
>>>> +{
>>>> +    CPUState *cpu;
>>>> +
>>>> +    CPU_FOREACH(cpu) {
>>>> +        if (!start && cpu->cpu_index >= stat->nvcpu) {
>>>> +            /*
>>>> +             * Never go there unless cpu is hot-plugged,
>>>> +             * just ignore in this case.
>>>> +             */
>>>> +            continue;
>>>> +        }
>>>
>>> As commented before, I think the only way to do it right is does not allow cpu
>>> plug/unplug during measurement..
>>>
>>> Say, even if index didn't get out of range, an unplug even should generate very
>>> stange output of the unplugged cpu.  Please see more below.
>>>
>>>> +        record_dirtypages(records, cpu, start);
>>>> +    }
>>>> +}
>>>> +
>>>> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
>>>> +                                 int64_t init_time_ms,
>>>> +                                 VcpuStat *stat,
>>>> +                                 unsigned int flag,
>>>> +                                 bool one_shot)
>>>> +{
>>>> +    DirtyPageRecord *records;
>>>> +    int64_t duration;
>>>> +    int64_t dirtyrate;
>>>> +    int i = 0;
>>>> +
>>>> +    cpu_list_lock();
>>>> +    records = vcpu_dirty_stat_alloc(stat);
>>>> +    vcpu_dirty_stat_collect(stat, records, true);
>>>> +    cpu_list_unlock();
>>>
>>> Continue with above - then I'm wondering whether we should just keep taking the
>>> lock until vcpu_dirty_stat_collect().
>>>
>>> Yes we could be taking the lock for a long time because of the sleep, but the
>>> main thread plug thread will just wait for it to complete and it is at least
>>> not a e.g. deadlock.
>>>
>>> The other solution is we do cpu_list_unlock() like this, but introduce another
>>> cpu_list_generation_id and boost it after any plug/unplug of cpu, aka, when cpu
>>> list changes.
>>>
>>> Then we record cpu generation ID at the entry of this function and retry the
>>> whole measurement if at some point we found generation ID changed (we need to
>>> fetch the gen ID after having the lock, of course).  That could avoid us taking
>>> the cpu list lock during dirty_stat_wait(), but it'll start to complicate cpu
>>> list locking rules.
>>>
>>> The simpler way is still just to take the lock, imho.
>>>
>> Hi, Peter, i'm working on this as you suggetion, and keep taking the
>> cpu_list_lock during dirty page rate calculation. I found the deadlock when
>> testing hotplug scenario, the logic is as the following:
>>
>> calc thread				qemu main thread
>> 1. take qemu_cpu_list_lock
>> 					1. take the BQL
>> 2. collect dirty page and wait		2. cpu hotplug
>> 					3. take qemu_cpu_list_lock
>> 3. take the BQL
>>
>> 4. sync dirty log			
>>
>> 5. release the BQL
>>
>> I just recall that is one of the reasons why i handle the plug/unplug
>> scenario(another is cpu plug may wait a little bit long time when dirtylimit
>> in service).
> 
> Ah I should have noticed the bql dependency with cpu list lock before..
> 
> I think having the cpu plug waiting for one sec is fine, because the mgmt app
> should be aware of both so it shouldn't even happen in practise (not good
> timing to plug during pre-migration).  However bql is definitely another
> story..  which I agree.
> 
>>
>> It seems that we have two strategies, one is just keep this logic untouched
>> in v12 and add "cpu_list_generation_id" implementaion in TODO list(once this
>> patchset been merged, i'll try that out)， another is introducing the
>> "cpu_list_generation_id" right now.
>>
>> What strategy do you prefer to?
> 
> I prefer having the gen_id patch.  The thing is it should be less than 10 lines
> and the logic should be fairly straightforward.  While if without it, it seems
> always on risk to use this new feature.
> 
> I hope I didn't overlook any existing mechanism to block cpu plug/unplug for
> some period, though, or we should use it.
> 
>>
>> Uh... I think the "unmatched_cnt" also kind of like this too, becauce once
>> we remove the "unmatched count" logic, the throttle algo is more likely to
>> oscillate and i prefer to add the "unmatched_cnt" in TODO list as above.
> 
> Could we tune the differential factor to make it less possible to oscillate?
> Uh... From certain angles, yes. When current dirty pate rate is nearly 
close to quota when dirtylimit in service, throttle achieve balance. 
Once the current dirty page rate arise a slight fluctuation(not much
oscillation), sleep time be adjusted which actually can be ignored.
> I still can't say I like "unmatched cnt" idea a lot..  From a PID pov (partial,
> integral, differential) you've already got partial + differential, and IMHO
> that "unmatched cnt" solution was trying to mimic an "integral" delta.  Instead
> of doing an mean value calculation (as in most integral system does) the
> "unmatched cnt" solution literally made it an array of 2 and it dropped the 1st
> element..  Hence a decision was made only from the 2nd data you collected.
> 
>  From that POV I think it's cleaner you add a real (but simple) integral algo
> into it?  It can be e.g. an array of 3, then when you do the math you use the
> average of the three dirty rates.  Would that work (and also look a bit
> cleaner)?
Yes, IMHO this is a more complete algo and we can try it out. So, let's 
see the v12 test result and decide whether above work should added to 
TODO list. :)
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

