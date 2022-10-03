Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D675F5F32EF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:54:41 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofNmC-0004Dj-E8
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNe7-0007oH-BY; Mon, 03 Oct 2022 11:46:19 -0400
Received: from [200.168.210.66] (port=54643 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNe4-0003Yz-4I; Mon, 03 Oct 2022 11:46:19 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Oct 2022 12:46:14 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 16B248002C5;
 Mon,  3 Oct 2022 12:46:14 -0300 (-03)
Message-ID: <a6523c11-0c79-6dd5-be7f-2b3e24ebd136@eldorado.org.br>
Date: Mon, 3 Oct 2022 12:46:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v2 11/29] target/ppc: add power-saving interrupt
 masking logic to p9_next_unmasked_interrupt
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-12-matheus.ferst@eldorado.org.br>
 <87o7uw672y.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87o7uw672y.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 03 Oct 2022 15:46:14.0576 (UTC)
 FILETIME=[44DE4B00:01D8D73F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2022 15:38, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Export p9_interrupt_powersave and use it in p9_next_unmasked_interrupt.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> Temporarily putting the prototype in internal.h for lack of a better place,
>> we will un-export p9_interrupt_powersave in future patches.
>> ---
>>   target/ppc/cpu_init.c    |  2 +-
>>   target/ppc/excp_helper.c | 46 ++++++++++++++++++++++++++++------------
>>   target/ppc/internal.h    |  4 ++++
>>   3 files changed, 38 insertions(+), 14 deletions(-)
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 1f8f6c6ef2..7889158c52 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6351,7 +6351,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>>       return false;
>>   }
>>
>> -static int p9_interrupt_powersave(CPUPPCState *env)
>> +int p9_interrupt_powersave(CPUPPCState *env)
>>   {
>>       /* External Exception */
>>       if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 67e73f30ab..5a0d2c11a2 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1686,28 +1686,39 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>>
>>   static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>   {
>> -    bool async_deliver;
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    CPUState *cs = CPU(cpu);
>> +    /* Ignore MSR[EE] when coming out of some power management states */
>> +    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>>
>>       assert((env->pending_interrupts & P9_UNUSED_INTERRUPTS) == 0);
>>
>> +    if (cs->halted) {
>> +        if (env->spr[SPR_PSSCR] & PSSCR_EC) {
>> +            /*
>> +             * When PSSCR[EC] is set, LPCR[PECE] controls which interrupts can
>> +             * wakeup the processor
>> +             */
>> +            return p9_interrupt_powersave(env);
>> +        } else {
>> +            /*
>> +             * When it's clear, any system-caused exception exits power-saving
>> +             * mode, even the ones that gate on MSR[EE].
>> +             */
>> +            msr_ee = true;
>> +        }
>> +    }
>> +
>>       /* Machine check exception */
>>       if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
>>           return PPC_INTERRUPT_MCK;
>>       }
>>
>> -    /*
>> -     * For interrupts that gate on MSR:EE, we need to do something a
>> -     * bit more subtle, as we need to let them through even when EE is
>> -     * clear when coming out of some power management states (in order
>> -     * for them to become a 0x100).
>> -     */
>> -    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>> -
> 
> You could simplify the code below if you bail early here when !msr_ee.
> 

The next interrupts have checks in the form

if (MSR[EE] && some_condition) || (!MSR[HV] && some_other_condition)

so we cannot return yet. We could check twice for these interrupts, e.g.

if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
     (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
     return PPC_INTERRUPT_EXT;
}

/* ... */

if (!msr_ee) {
     return 0;
}

/* ... */

if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
     !(heic && FIELD_EX64_HV(env->msr) && !FIELD_EX64(env->msr, MSR, PR))) {
     return PPC_INTERRUPT_EXT;
}

But I'm not sure if it'd be better.

>>       /* Hypervisor decrementer exception */
>>       if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
>>           /* LPCR will be clear when not supported so this will work */
>>           bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
>> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
>> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hdice) {
>>               /* HDEC clears on delivery */
>>               return PPC_INTERRUPT_HDECR;
>>           }
>> @@ -1717,7 +1728,7 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>       if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
>>           /* LPCR will be clear when not supported so this will work */
>>           bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
>> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hvice) {
>>               return PPC_INTERRUPT_HVIRT;
>>           }
>>       }
>> @@ -1727,13 +1738,13 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>           bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>>           bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>>           /* HEIC blocks delivery to the hypervisor */
>> -        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
>> +        if ((msr_ee && !(heic && FIELD_EX64_HV(env->msr) &&
>>               !FIELD_EX64(env->msr, MSR, PR))) ||
>>               (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
>>               return PPC_INTERRUPT_EXT;
>>           }
>>       }
>> -    if (async_deliver != 0) {
>> +    if (msr_ee != 0) {
>>           /* Decrementer exception */
>>           if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>>               return PPC_INTERRUPT_DECR;
>> @@ -1895,6 +1906,15 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>>       PowerPCCPU *cpu = env_archcpu(env);
>>       CPUState *cs = env_cpu(env);
>>
>> +    if (cs->halted && !(env->spr[SPR_PSSCR] & PSSCR_EC) &&
>> +        !FIELD_EX64(env->msr, MSR, EE)) {
>> +        /*
>> +         * A pending interrupt took us out of power-saving, but MSR[EE] says
>> +         * that we should return to NIP+4 instead of delivering it.
>> +         */
>> +        return;
> 
> How will the NIP be advanced in this case?
> 

It's already incremented by the translation code. ppc_tr_translate_insn 
increments ctx->base.pc_next before calling decode_{insn{32,64},legacy}, 
and methods that put the CPU to sleep will use gen_exception_nip with 
this value as the last argument.

>> +    }
>> +
>>       switch (interrupt) {
>>       case PPC_INTERRUPT_MCK: /* Machine check exception */
>>           env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>> index 337a362205..41e79adfdb 100644
>> --- a/target/ppc/internal.h
>> +++ b/target/ppc/internal.h
>> @@ -306,4 +306,8 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
>>       return msk;
>>   }
>>
>> +#if defined(TARGET_PPC64)
>> +int p9_interrupt_powersave(CPUPPCState *env);
>> +#endif
>> +
>>   #endif /* PPC_INTERNAL_H */

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

