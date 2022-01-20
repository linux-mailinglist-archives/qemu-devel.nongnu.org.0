Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B414494D82
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:59:22 +0100 (CET)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAW65-00037A-45
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nAUIj-0006j6-5l
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:04:20 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:32934
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nAUIg-0002xH-EZ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:04:16 -0500
HMM_SOURCE_IP: 172.18.0.48:40214.1503667029
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id DDD522800BB;
 Thu, 20 Jan 2022 18:03:46 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 8c23bd836787411cb6b075650a79aa8b for
 peterx@redhat.com; Thu, 20 Jan 2022 18:04:03 CST
X-Transaction-ID: 8c23bd836787411cb6b075650a79aa8b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <53783d89-ee0c-0704-5bf2-a2552376bfec@chinatelecom.cn>
Date: Thu, 20 Jan 2022 18:03:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
 <Yekqn90HOtFMWupM@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Yekqn90HOtFMWupM@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
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



在 2022/1/20 17:25, Peter Xu 写道:
> On Thu, Jan 20, 2022 at 04:26:09PM +0800, Hyman Huang wrote:
>> Hi，Peter. I'm working on this problem and found the reason is kind of the
>> same as i metioned in cover letter of v10, the following is what i posted:
>>
>>    2. The new implementaion of throttle algo enlightened by Peter
>>       responds faster and consume less cpu resource than the older,
>>       we make a impressed progress.
>>
>>       And there is a viewpoint may be discussed, it is that the new
>>       throttle logic is "passive", vcpu sleeps only after dirty ring,
>>       is full, unlike the "auto-converge" which will kick vcpu instead
>>       in a fixed slice time. If the vcpu is memory-write intensive
>>       and the ring size is large, it will produce dirty memory during
>>       the dirty ring full time and the throttle works not so good, it
>>       means the throttle depends on the dirty ring size.
>>
>>       I actually tested the new algo in two case:
>>
>>       case 1: dirty-ring-size: 4096, dirtyrate: 1170MB/s
>>       result: minimum quota dirtyrate is 25MB/s or even less
>>               minimum vcpu util is 6%
>>
>>       case 2: dirty-ring-size: 65536, dirtyrate: 1170MB/s
>>       result: minimum quota dirtyrate is 256MB/s
>>               minimum vcpu util is 24%
>>
>>       I post this just for discussion, i think this is not a big deal
>>       beacase if we set the dirty-ring-size to the maximum value(65536),
>>       we assume the server's bandwidth is capable of handling it.
> 
> My memory is that I tested your v10 (which has this wait-at-ring-full logic)
> already and at that time it worked well.
> 
> It's possible that I just got lucky with v10, so that can happen with some
> random conditions and so far we still don't know how to hit it.
Uh, sorry for not explaining the reason clearly. I think the reason of 
failing to throttle is "vcpu loss chance to sleep", i trace the 
kvm_dirty_ring_full event and found that when throttling a vcpu works 
bad, the kvm_dirty_ring_full event do no arise and sleep never happens 
correspondingly.

Two case lead to this result:
case 1: dirty-ring-size is large and the ring full time is long, not all 
            dirty ring of vcpu get full at one time, so there must be 
some vcpus that miss the chance to sleep.

case 2: guest has many vcpus, not all dirty ring of vcpu get full at one 
time. So miss the chance of sleeping too as above.
> 
> However..
> 
>>
>> Currently, Qemu handle the vcpu KVM_EXIT_DIRTY_RING_FULL exit as the
>> following:
>>
>> 1. If one of the dirty-ring on a vcpu is full, vcpu thread returns to user
>> space and qemu handle it.
>>
>> 2. Qemu get the kvm_slots_lock and reap dirty-ring of all vcpus once for all
>> by calling kvm_dirty_ring_reap, fill the dirty page bitmap of slot and reset
>> dirty ring. Release the kvm_slots_lock finally.
>>
>> The logic *reap and reset dirty ring of all vcpu after one vcpu's dirty ring
>> is full* works fine and efficiently.
>>
>> But this is not what dirtylimit want becasue some of the vcpu may loss
>> chance to sleep and could not be throttled, though vcpu's dirty ring was
>> full.
>>
>> The latest test environment of you used a larger guest(20G, 40 cores),
>> increasing the chances of missing sleep for vcpus and the throttle works not
>> good as before.
>>
>> I try a simple modification make the throttle works better as before:
>>
>> +static void kvm_dirty_ring_reset_one(KVMState *s, CPUState *cpu)
>> +{
>> +    int ret;
>> +    uint64_t total = 0;
>> +
>> +    kvm_slots_lock();
>> +    total = kvm_dirty_ring_reap_one(s, cpu);
>> +
>> +    if (total) {
>> +        ret = kvm_vm_ioctl(s, KVM_RESET_DIRTY_RINGS);
>> +        assert(ret == total);
>> +    }
>> +
>> +    kvm_slots_unlock();
>> +}
>> +
>>   static void do_kvm_cpu_synchronize_kick(CPUState *cpu, run_on_cpu_data arg)
>>   {
>>       /* No need to do anything */
>> @@ -2309,6 +2327,11 @@ bool kvm_dirty_ring_enabled(void)
>>       return kvm_state->kvm_dirty_ring_size ? true : false;
>>   }
>>
>>   static int kvm_init(MachineState *ms)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> @@ -2955,9 +2978,8 @@ int kvm_cpu_exec(CPUState *cpu)
>>                * still full.  Got kicked by KVM_RESET_DIRTY_RINGS.
>>                */
>>               trace_kvm_dirty_ring_full(cpu->cpu_index);
>> -            qemu_mutex_lock_iothread();
>> -            kvm_dirty_ring_reap(kvm_state);
>> -            qemu_mutex_unlock_iothread();
>> +            kvm_dirty_ring_reset_one(kvm_state, cpu);
>> +            dirtylimit_vcpu_execute(cpu);
>>               ret = 0;
>>               break;
>>           case KVM_EXIT_SYSTEM_EVENT:
>>
>> I drop the BQL to reduce the overhead of KVM_EXIT_DIRTY_RING_FULL exit
>> handle. May be kvm_state could be protected by BQL, but i wonder if there
>> can be a finer granularity lock.
>>
>> How about this?
> 
> ... I think what you explained makes sense to me.
> 
> Note that there's also the reaper thread running in the background that can
> reap all the cores too.
> 
> It only runs once per second so it shouldn't bring a lot of differences, but
> I'm also wondering whether we should also turn that temporarily off too when
> dirtylimit is enabled - we can simply let it keep sleeping if dirtylimit is in
> service.
> 
> Dropping BQL may not be safe, as it serializes the reaping with other possible
> kvm memslot updates.  I don't know whether it's a must in the future to use BQL
> for reaping the rings, but so far I'd say we can still stick with it.
> 
> Note that even if you don't take BQL you'll still need the slots_lock and so
> far that's also global, so I don't see how it can help on vcpu concurrency
> anyway even if we dropped one of them.
> 
> If to do this, could you not introduce kvm_dirty_ring_reset_one() but just let
> it take one more CPUState* parameter?  Most of the codes you added should be
> similar to kvm_dirty_ring_reap_locked(), and I wanted to keep the trace point
> there (trace_kvm_dirty_ring_reap, though that needs another parameter too).
> 
> And that patch can be done on top of this patch, so it can be reviewed easier
> outside of dirtylimit details.
> 
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

