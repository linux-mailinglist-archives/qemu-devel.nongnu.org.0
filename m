Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB7263FC1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 10:29:22 +0200 (CEST)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGHxJ-0005LI-AU
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 04:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kGHwT-0004X3-88
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 04:28:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kGHwQ-00054o-6n
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 04:28:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E863AC68;
 Thu, 10 Sep 2020 08:28:40 +0000 (UTC)
Subject: Re: [PULL 3/5] softmmu/cpus: Only set parallel_cpus for SMP
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200903214101.1746878-1-richard.henderson@linaro.org>
 <20200903214101.1746878-4-richard.henderson@linaro.org>
 <1f573d2d-b3bb-21ab-bbcd-b759fc14ad2b@suse.de>
 <3dfae924-34c9-e36a-77bf-f3abcdeaf268@amsat.org>
 <7454d121-3ebd-623a-55a3-4ba6e7e870dc@suse.de>
 <e47376bf-8ced-57eb-93d5-a1229d258dd6@amsat.org>
 <75c313df-da09-f3c2-5d34-0bfaad4290a9@suse.de>
 <652516a1-6a63-89eb-8b04-728a95b76d5f@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1341d50a-87e7-c497-423e-fa0e618826ee@suse.de>
Date: Thu, 10 Sep 2020 10:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <652516a1-6a63-89eb-8b04-728a95b76d5f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:22:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.576,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/8/20 9:56 AM, Philippe Mathieu-Daudé wrote:
> +Laurent
> 
> On 9/8/20 9:09 AM, Claudio Fontana wrote:
>> On 9/7/20 6:49 PM, Philippe Mathieu-Daudé wrote:
>>> On 9/7/20 6:30 PM, Claudio Fontana wrote:
>>>> On 9/7/20 12:20 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 9/7/20 12:05 PM, Claudio Fontana wrote:
>>>>>> Hi Richard,
>>>>>>
>>>>>> currently rebasing on top of this one,
>>>>>> just a question, why is the patch not directly using "current_machine"?
>>>>>
>>>>> For user mode?
>>>>
>>>> In user mode I'd not expect softmmu/cpus.c to be built at all...
>>>
>>> Which is why :) current_machine is NULL in user-mode.
>>
>> Ciao Philippe,
>>
>> then why does the patch change softmmu/cpus.c in a way that accounts for user mode?
>>
>> The function that the patch changes is never called in user mode.
>>
>> The patch could instead use current_machine without any concern of it being NULL, it will always be set in vl.c .
> 
> Better send a patch to prove your point :)

Yes, I am already testing without problems the cpus-refactoring series with this applied:

commit 53f6db772f1522025650441102b16be17773bdc9
Author: Claudio Fontana <cfontana@suse.de>
Date:   Tue Sep 8 10:59:07 2020 +0200

    accel/tcg: use current_machine as it is always set for softmmu
    
    current_machine is always set before accelerators are initialized,
    so use that instead of MACHINE(qdev_get_machine()).
    
    Signed-off-by: Claudio Fontana <cfontana@suse.de>

diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
index ec7158b55e..05af1168a2 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-cpus.c
@@ -484,7 +484,7 @@ static void tcg_start_vcpu_thread(CPUState *cpu)
          * then we will have cpus running in parallel.
          */
         if (qemu_tcg_mttcg_enabled()) {
-            MachineState *ms = MACHINE(qdev_get_machine());
+            MachineState *ms = current_machine;
             if (ms->smp.max_cpus > 1) {
                 parallel_cpus = true;
             }



> 
> I have bad remember about the last time I tried to understand/modify
> that part, because IIRC the user-mode creates some fake machine to
> satisfy various QEMU generic code assumptions. Sincerely I now prefer
> stay away from this; too many unmerged patches there.


linux-user/main.c and bsd-user/main.c seem to use cpu_create() to create the cpus,
then they have their own cpu_loop(), they do not use any of the cpus.c code.

By contrast, softmmu/vl.c initializes current_machine in qemu_init(),
even before accelerator is chosen and configured.

So there is no chance currently that current_machine is not set correctly when
the accelerator vcpu startup code in is called.

Ciao,

CLaudio




> 
>>
>> Ciao,
>>
>> Claudio
>>
>>>
>>>>
>>>> Ciao,
>>>>
>>>> Claudio
>>>>
>>>>>
>>>>>>
>>>>>> Is using MACHINE(qdev_get_machine()) preferrable here?
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Claudio
>>>>>>
>>>>>> On 9/3/20 11:40 PM, Richard Henderson wrote:
>>>>>>> Do not set parallel_cpus if there is only one cpu instantiated.
>>>>>>> This will allow tcg to use serial code to implement atomics.
>>>>>>>
>>>>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>>> ---
>>>>>>>  softmmu/cpus.c | 11 ++++++++++-
>>>>>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>>>>>>> index a802e899ab..e3b98065c9 100644
>>>>>>> --- a/softmmu/cpus.c
>>>>>>> +++ b/softmmu/cpus.c
>>>>>>> @@ -1895,6 +1895,16 @@ static void qemu_tcg_init_vcpu(CPUState *cpu)
>>>>>>>      if (!tcg_region_inited) {
>>>>>>>          tcg_region_inited = 1;
>>>>>>>          tcg_region_init();
>>>>>>> +        /*
>>>>>>> +         * If MTTCG, and we will create multiple cpus,
>>>>>>> +         * then we will have cpus running in parallel.
>>>>>>> +         */
>>>>>>> +        if (qemu_tcg_mttcg_enabled()) {
>>>>>>> +            MachineState *ms = MACHINE(qdev_get_machine());
>>>>>>
>>>>>> MachineState *ms = current_machine;
>>>>>> ?
>>>>>>
>>>>>>
>>>>>>> +            if (ms->smp.max_cpus > 1) {
>>>>>>> +                parallel_cpus = true;
>>>>>>> +            }
>>>>>>> +        }
>>>>>>>      }
>>>>>>>  
>>>>>>>      if (qemu_tcg_mttcg_enabled() || !single_tcg_cpu_thread) {
>>>>>>> @@ -1904,7 +1914,6 @@ static void qemu_tcg_init_vcpu(CPUState *cpu)
>>>>>>>  
>>>>>>>          if (qemu_tcg_mttcg_enabled()) {
>>>>>>>              /* create a thread per vCPU with TCG (MTTCG) */
>>>>>>> -            parallel_cpus = true;
>>>>>>>              snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
>>>>>>>                   cpu->cpu_index);
>>>>>>>  
>>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>
>>


