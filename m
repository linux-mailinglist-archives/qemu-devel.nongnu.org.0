Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B81D45DA1E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:33:06 +0100 (CET)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDw1-0006oA-2r
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mqDuZ-0005Nv-AU
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:31:35 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:43462
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mqDuV-000186-8v
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:31:34 -0500
HMM_SOURCE_IP: 172.18.0.188:39780.153161248
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5349628008E;
 Thu, 25 Nov 2021 20:31:09 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id e807c88ea7ad4c46acf3c2d43885832b for
 armbru@redhat.com; Thu, 25 Nov 2021 20:31:19 CST
X-Transaction-ID: e807c88ea7ad4c46acf3c2d43885832b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <6d07f6a4-8ec8-706c-45b1-35aefabb7ad3@chinatelecom.cn>
Date: Thu, 25 Nov 2021 20:31:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 3/3] cpus-common: implement dirty limit on vCPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1637759139.git.huangy81@chinatelecom.cn>
 <cover.1637759139.git.huangy81@chinatelecom.cn>
 <5b05962093b000b2e9d417d9de41d2cd6f272073.1637759139.git.huangy81@chinatelecom.cn>
 <87r1b5tvom.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87r1b5tvom.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
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



在 2021/11/24 23:33, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle vCPU until it reachs the quota
>> dirtyrate given by user.
>>
>> Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>> set/cancel dirty limit on vCPU.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
>>   include/hw/core/cpu.h |  9 +++++++++
>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/vl.c          |  1 +
>>   4 files changed, 94 insertions(+)
>>
>> diff --git a/cpus-common.c b/cpus-common.c
>> index 6e73d3e..43b0078 100644
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
>> +    if (!kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
> 
> "not enabled"
> 
> What is a "dirty restraint"?
> 
> Drop the exclamation point, please.  See error.h:
> 
>   * The resulting message should be a single phrase, with no newline or
>   * trailing punctuation.
> 
> What about "setting a dirty page limit requires ...".
Ok, sound good
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
>> +    if (!kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
>> +        return;
>> +    }
>> +
>> +    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {
>> +        dirtylimit_calc_quit();
>> +    }
>> +}
>> +
>> +void dirtylimit_setup(int max_cpus)
>> +{
>> +    if (!kvm_dirty_ring_enabled()) {
> 
> This crashes unless the accelerator is kvm.  Reproducer:
> 
>      $ qemu-system-x86_64 -display none -accel tcg
>      Segmentation fault (core dumped)
>
Thanks very much for finding this issue, i'll fix it next version

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
>> index bbfd48c..42b260e 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1850,6 +1850,49 @@
>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>   
>>   ##
>> +# @set-dirty-limit:
>> +#
>> +# Set the upper limit of dirty page rate for the interested vCPU.
> 
> "for a vCPU"
> 
>> +#
>> +# This command could be used to cap the vCPU memory load, which is also
>> +# refered as "dirty page rate". Users can use set-dirty-limit unconditionally,
>> +# but if one want to know which vCPU is in high memory load and which vCPU
>> +# should be limited, "calc-dirty-rate" with "dirty-ring" mode maybe an
>> +# availiable method.
> 
> I think you should mention that the command fails unless dirty ring is
> enabled, and a pointer to its documentation.
> 
Emm, it seems that there's no documentation about dirty ring in qemu，
should i metion the commit b4420f19 "KVM: Dirty ring support" for 
dirty-ring?
>> +#
>> +# @idx: vCPU index to set dirtylimit.
> 
> Please rename to @cpu-index for consistency with query-cpus-fast.  Same
> for cancel-dirty-limit below.
> 
>> +#
>> +# @dirtyrate: upper limit for the specified vCPU's dirty page rate (MB/s)
> 
> In QMP, we separate words with hyphens, like @dirty-rate.  Please
> rename.
> 
>> +#
>> +# Since: 6.3
> 
> 7.0
> 
>> +#
>> +# Example:
>> +#   {"execute": "set-dirty-limit"}
>> +#    "arguments": { "idx": 0,
>> +#                   "dirtyrate": 200 } }
>> +#
>> +##
>> +{ 'command': 'set-dirty-limit',
>> +  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
>> +
>> +##
>> +# @cancel-dirty-limit:
>> +#
>> +# Cancel the dirtylimit for the vCPU which has been set with set-dirty-limit.
> 
> "the dirty page limit"
> 
>> +#
>> +# @idx: vCPU index to canceled the dirtylimit
>> +#
>> +# Since: 6.3
> 
> 7.0
> 
>> +#
>> +# Example:
>> +#   {"execute": "cancel-dirty-limit"}
>> +#    "arguments": { "idx": 0 } }
>> +#
>> +##
>> +{ 'command': 'cancel-dirty-limit',
>> +  'data': { 'idx': 'int' } }
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

-- 
Best regard

Hyman Huang(黄勇)

