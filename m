Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5545F1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:25:57 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqe2u-0007BA-Gh
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:25:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mqe1l-0006OD-UZ
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:24:47 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:52211
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mqe1g-0002IF-Bd
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:24:43 -0500
HMM_SOURCE_IP: 172.18.0.188:58880.922926380
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.33 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 17603280029;
 Sat, 27 Nov 2021 00:24:18 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id b179b53e30d84d9facfa85b9b331ee9c for
 armbru@redhat.com; Sat, 27 Nov 2021 00:24:26 CST
X-Transaction-ID: b179b53e30d84d9facfa85b9b331ee9c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <9d1c90dd-8dae-6c27-a6c4-31a6a894c11b@chinatelecom.cn>
Date: Sat, 27 Nov 2021 00:24:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v6 3/3] cpus-common: implement dirty page limit on vCPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1637856472.git.huangy81@chinatelecom.cn>
 <cover.1637857372.git.huangy81@chinatelecom.cn>
 <91286fcfc24795385fe4df0d69a48c34f8eac942.1637857372.git.huangy81@chinatelecom.cn>
 <87tufzbdps.fsf@dusky.pond.sub.org>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <87tufzbdps.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/11/26 15:03, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle vCPU until it reachs the quota
>> dirty page rate given by user.
>>
>> Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>> set/cancel dirty page limit on vCPU.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/core/cpu.h |  9 +++++++++
>>   qapi/migration.json   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/vl.c          |  1 +
>>   4 files changed, 98 insertions(+)
>>
>> diff --git a/cpus-common.c b/cpus-common.c
>> index 6e73d3e..3c156b3 100644
>> --- a/cpus-common.c
>> +++ b/cpus-common.c
>> @@ -23,6 +23,11 @@
>>   #include "hw/core/cpu.h"
>>   #include "sysemu/cpus.h"
>>   #include "qemu/lockable.h"
>> +#include "sysemu/dirtylimit.h"
>> +#include "sysemu/cpu-throttle.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/error.h"
>> +#include "qapi/qapi-commands-migration.h"
>>   
>>   static QemuMutex qemu_cpu_list_lock;
>>   static QemuCond exclusive_cond;
>> @@ -352,3 +357,39 @@ void process_queued_cpu_work(CPUState *cpu)
>>       qemu_mutex_unlock(&cpu->work_mutex);
>>       qemu_cond_broadcast(&qemu_work_cond);
>>   }
>> +
>> +void qmp_set_dirty_limit(int64_t idx,
>> +                         uint64_t dirtyrate,
>> +                         Error **errp)
>> +{
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "setting a dirty page limit requires support from dirty ring");
> 
> Can we phrase the message in a way that gives the user a chance to guess
> what he needs to do to avoid it?
> > Perhaps: "setting a dirty page limit requires KVM with accelerator
> property 'dirty-ring-size' set".
Sound good, this make things more clear.
> 
>> +        return;
>> +    }
>> +
>> +    dirtylimit_calc();
>> +    dirtylimit_vcpu(idx, dirtyrate);
>> +}
>> +
>> +void qmp_cancel_dirty_limit(int64_t idx,
>> +                            Error **errp)
>> +{
> 
> Three cases:
> 
> Case 1: enable is impossible, so nothing to do.
> 
> Case 2: enable is possible and we actually enabled.
> 
> Case 3: enable is possible, but we didn't.  Nothing to do.
> 
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "no need to cancel a dirty page limit as dirty ring not enabled");
>> +        return;
> 
> This is case 1.  We error out.
> 
>> +    }
>> +
>> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {
> 
> I don't think unlikely() matters here.
> 
>> +        dirtylimit_calc_quit();
>> +    }
> 
> In case 2, dirtylimit_calc_quit() returns zero if this was the last
> limit, else non-zero.  If the former, we request the thread to stop.I am wildly guessing you misunderstood the function 
dirtylimit_cancel_vcpu, see below.
> 
> In case 3, dirtylimit_calc_quit() returns zero, and we do nothing.
In this case, we cancel the "dirtylimit thread" in function 
dirtylimit_cancel_vcpu actually, if it was the last limit thread of the 
whole vm, dirtylimit_cancel_vcpu return zero and we request the 
dirtyrate calculation thread to stop, so we call the function 
dirtylimit_calc_quit , which stop the "dirtyrate calculation thread" 
internally.
> 
> Why is case 1 and error, but case 3 isn't?
> 
> Both could silently do nothing, like case 3 does now.
> 
> Both could error out, like case 1 does now.  A possible common error
> message: "there is no dirty page limit to cancel".
> 
> I'd be okay with consistently doing nothing, and with consistently
> erroring out.
> 
>> +}
>> +
>> +void dirtylimit_setup(int max_cpus)
>> +{
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        return;
>> +    }
>> +
>> +    dirtylimit_calc_state_init(max_cpus);
>> +    dirtylimit_state_init(max_cpus);
>> +}
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index e948e81..11df012 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -881,6 +881,15 @@ void end_exclusive(void);
>>    */
>>   void qemu_init_vcpu(CPUState *cpu);
>>   
>> +/**
>> + * dirtylimit_setup:
>> + *
>> + * Initializes the global state of dirtylimit calculation and
>> + * dirtylimit itself. This is prepared for vCPU dirtylimit which
>> + * could be triggered during vm lifecycle.
>> + */
>> +void dirtylimit_setup(int max_cpus);
>> +
>>   #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
>>   #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
>>   #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index bbfd48c..2b0fe19 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1850,6 +1850,53 @@
>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>   
>>   ##
>> +# @set-dirty-limit:
>> +#
>> +# Set the upper limit of dirty page rate for a vCPU.
>> +#
>> +# This command could be used to cap the vCPU memory load, which is also
> 
> "Could be used" suggests there are other uses.  I don't think there are.
>  >> +# refered as "dirty page rate". Users can use set-dirty-limit 
unconditionally,
>> +# but if one want to know which vCPU is in high memory load and which vCPU
> 
> "one wants"
> 
>> +# should be limited, using calc-dirty-rate command with dirty-ring mode maybe
> 
> "may be"
> 
>> +# an availiable method. Note that this command requires support from dirty
> 
> "available".  Consider using a spell checker.
> 
>> +# ring, which means property "dirty-ring-size" of accelerator object "kvm"
>> +# must be set.
> 
> Please limit doc comment line length to approximately 70 characters for
> legibility.
> 
> Here's my try:
> 
>     ##
>     # @set-dirty-limit:
>     #
>     # Set the upper limit of dirty page rate for a virtual CPU.
>     #
>     # Requires KVM with accelerator property "dirty-ring-size" set.
>     # A virtual CPU's dirty page rate is a measure of its memory load.
>     # To observe dirty page rates, use @calc-dirty-rate.
> 
>> +#
>> +# @cpu-index: vCPU index to set dirty page limit.
> 
> I'd go with
> 
>     # @cpu-index: index of the virtual CPU.
> 
Indeed, this make the document more legible. Thank Markus very much for 
the careful code review, i'll pick up all this next version.
>> +#
>> +# @dirty-rate: upper limit for the specified vCPU's dirty page rate (MB/s)
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "set-dirty-limit"}
>> +#    "arguments": { "cpu-index": 0,
>> +#                   "dirty-rate": 200 } }
>> +#
>> +##
>> +{ 'command': 'set-dirty-limit',
>> +  'data': { 'cpu-index': 'int', 'dirty-rate': 'uint64' } }
>> +
>> +##
>> +# @cancel-dirty-limit:
>> +#
>> +# Cancel the dirty page limit for the vCPU which has been set with
>> +# set-dirty-limit command. Note that this command requires support from
>> +# dirty ring, same as the "set-dirty-limit" command.
>> +#
>> +# @cpu-index: vCPU index to cancel the dirty page limit
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "cancel-dirty-limit"}
>> +#    "arguments": { "cpu-index": 0 } }
>> +#
>> +##
>> +{ 'command': 'cancel-dirty-limit',
>> +  'data': { 'cpu-index': 'int' } }
>> +
>> +##
>>   # @snapshot-save:
>>   #
>>   # Save a VM snapshot
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1..0f83ce3 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>       qemu_init_displays();
>>       accel_setup_post(current_machine);
>>       os_setup_post();
>> +    dirtylimit_setup(current_machine->smp.max_cpus);
>>       resume_mux_open();
>>   }
> 

