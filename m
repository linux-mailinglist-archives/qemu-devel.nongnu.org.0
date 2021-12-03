Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5EC466F10
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 02:21:50 +0100 (CET)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msxGn-0002vg-8d
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 20:21:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1msxEu-00029N-QJ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:19:52 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:37361
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1msxEr-0005jb-WA
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:19:52 -0500
HMM_SOURCE_IP: 172.18.0.218:46996.361547428
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C3E2B2800A8;
 Fri,  3 Dec 2021 09:19:25 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id eda206683c1242249fb69f808adc885a for
 armbru@redhat.com; Fri, 03 Dec 2021 09:19:38 CST
X-Transaction-ID: eda206683c1242249fb69f808adc885a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <df626c22-82bc-63a9-eb0a-1f48db765e52@chinatelecom.cn>
Date: Fri, 3 Dec 2021 09:19:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v7 3/3] cpus-common: implement dirty page limit on vCPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1638267778.git.huangy81@chinatelecom.cn>
 <cover.1638267948.git.huangy81@chinatelecom.cn>
 <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
 <877dcn5729.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <877dcn5729.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/3 0:02, Markus Armbruster 写道:
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
>>   cpus-common.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/core/cpu.h |  9 +++++++++
>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/vl.c          |  1 +
>>   4 files changed, 101 insertions(+)
>>
>> diff --git a/cpus-common.c b/cpus-common.c
>> index 6e73d3e..86c7712 100644
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
>> @@ -352,3 +357,46 @@ void process_queued_cpu_work(CPUState *cpu)
>>       qemu_mutex_unlock(&cpu->work_mutex);
>>       qemu_cond_broadcast(&qemu_work_cond);
>>   }
>> +
>> +void qmp_set_dirty_limit(int64_t idx,
>> +                         uint64_t dirtyrate,
>> +                         Error **errp)
>> +{
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "setting a dirty page limit requires KVM with"
>> +                   " accelerator property 'dirty-ring-size' set'");
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
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "KVM with accelerator property 'dirty-ring-size'"
>> +                   " not set, abort canceling a dirty page limit");
>> +        return;
>> +    }
> 
> Is this check actually needed?  It's not when !dirtylimit_enabled(idx).
The logic never go there if user follows the enable/disable step, but 
just in case one call the qmp "cancel-dirty-limit" only.
Anyway, the set/cancel has been merged into one in latest version. And 
we do check before doing anything in both case.
> 
>> +
>> +    if (!dirtylimit_enabled(idx)) {
>> +        error_setg(errp, "dirty page limit for the CPU %ld not set", idx);
> 
> "for CPU"
> 
>> +        return;
>> +    }
>> +
>> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {
> 
> I don't think unlikely() matters here.
Ok, i dropped the compilation syntax in latest version.
> 
>> +        dirtylimit_calc_quit();
>> +    }
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
>> index bbfd48c..57c9a63 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1850,6 +1850,49 @@
>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>   
>>   ##
>> +# @set-dirty-limit:
>> +#
>> +# Set the upper limit of dirty page rate for a virtual CPU.
>> +#
>> +# Requires KVM with accelerator property "dirty-ring-size" set.
>> +# A virtual CPU's dirty page rate is a measure of its memory load.
>> +# To observe dirty page rates, use @calc-dirty-rate.
>> +#
>> +# @cpu-index: index of the virtual CPU.
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
>> +# @cpu-index: index of the virtual CPU to cancel the dirty page limit
> 
> I'd go with
> 
>     # @cpu-index: index of the virtual CPU.
Ok.
> 
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
> QAPI schema:
> Acked-by: Markus Armbruster <armbru@redhat.com>
Thanks Markus very much for reviewing the code, :)
> 

-- 
Best regard

Hyman Huang(黄勇)

