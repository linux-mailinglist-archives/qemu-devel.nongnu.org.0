Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1759702D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:53:18 +0200 (CEST)
Received: from localhost ([::1]:56144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJTy-00085n-0d
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJKG-0007Hp-Ap; Wed, 17 Aug 2022 09:43:16 -0400
Received: from [200.168.210.66] (port=35437 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJKE-0006GF-4L; Wed, 17 Aug 2022 09:43:16 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 10:43:12 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 2599F800134;
 Wed, 17 Aug 2022 10:43:12 -0300 (-03)
Message-ID: <124d621d-6a54-b42f-77a3-e94053ab4ef4@eldorado.org.br>
Date: Wed, 17 Aug 2022 10:43:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 05/13] target/ppc: create an interrupt masking method
 for POWER9/POWER10
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-6-matheus.ferst@eldorado.org.br>
 <87y1vp5dys.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87y1vp5dys.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 17 Aug 2022 13:43:12.0449 (UTC)
 FILETIME=[4B5CDB10:01D8B23F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 15/08/2022 19:39, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Create an interrupt masking method for the POWER9 and POWER10
>> processors. The new method is based on cpu_has_work_POWER{9,10} and
>> ppc_pending_interrupt_legacy.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/excp_helper.c | 160 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 160 insertions(+)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 59981efd16..2ca6a917b2 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1678,6 +1678,163 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>>       powerpc_excp(cpu, cs->exception_index);
>>   }
>>
>> +static int ppc_pending_interrupt_p9(CPUPPCState *env)
>> +{
>> +    CPUState *cs = env_cpu(env);
>> +    bool async_deliver = false;
> 
> I would suggest this to disentangle the PM stuff from MSR_EE:
> 
>    if (cs->halted) {
>       if (env->spr[SPR_PSSCR] & PSSCR_EC) {
>           return p9_interrupt_powersave();
>       } else {
>           /*
>            * If EC is clear, any system-caused exception exits
>            * power-saving mode.
>            */
>            ignore_msr_ee = true;
>       }
>    }
> 
>    RESET    (keep it duplicated)
>    MCHECK
> 
>    if (!MSR_EE && !ignore_msr_ee) {
>       return 0;
>    }
> 
>    MSR_EE interrupts
> ---
> 
>> +
>> +    /* External reset */
>> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
>> +        return PPC_INTERRUPT_RESET;
>> +    }
>> +
>> +    if (cs->halted) {
>> +        uint64_t psscr = env->spr[SPR_PSSCR];
>> +
>> +        if (!(psscr & PSSCR_EC)) {
>> +            /* If EC is clear, return any system-caused interrupt */
>> +            async_deliver = true;
> 
> This doesn't look correct, look at what the ISA says:
> 
>    EC=0
> 
>    Hardware will exit power-saving mode when the exception corresponding
>    to any system-caused interrupt occurs. Power-saving mode is exited
>    either at the instruction following the stop (if MSR_EE=0) or in the
>    corresponding interrupt handler (if MSR_EE=1).
> 
> So with MSR_EE=0 we should *not* deliver any interrupts, but return to NIP+4.
> 

At first, I thought the powerpc_excp would handle that but looking again 
at the code, that's not how we return to NIP+4. We want to return true 
in cs->has_work even if no interrupt can be delivered, so 
cpu_thread_is_idle returns false, and we return from qemu_wait_io_event 
to another iteration of the loop in mttcg_cpu_thread_fn.

I think we have two options here:
i) Keep ignoring MSR[EE] here when !PSSCR[EC] and prevent the delivery 
in ppc_hw_interrupt if !MSR[EE]. That way, we can still use 
ppc_pending_interrupt to set CPU_INTERRUPT_HARD in ppc_set_irq in patch 12.
ii) Don't return interrupts that require MSR[EE] set and ignore 
CPU_INTERRUPT_HARD if cs->halted==1 in cpu_has_work_POWER*. In this 
case, we wouldn't be able to merge the cpu_has_work_* implementations in 
patch 13.

>> +        } else {
>> +            /* External Exception */
>> +            if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>> +                (env->spr[SPR_LPCR] & LPCR_EEE)) {
>> +                bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>> +                if (!heic || !FIELD_EX64_HV(env->msr) ||
>> +                    FIELD_EX64(env->msr, MSR, PR)) {
>> +                    return PPC_INTERRUPT_EXT;
>> +                }
>> +            }
>> +            /* Decrementer Exception */
>> +            if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
>> +                (env->spr[SPR_LPCR] & LPCR_DEE)) {
>> +                return PPC_INTERRUPT_DECR;
>> +            }
>> +            /* Machine Check or Hypervisor Maintenance Exception */
>> +            if (env->spr[SPR_LPCR] & LPCR_OEE) {
>> +                if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
>> +                    return PPC_INTERRUPT_MCK;
>> +                }
>> +                if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
>> +                    return PPC_INTERRUPT_HMI;
>> +                }
>> +            }
>> +            /* Privileged Doorbell Exception */
>> +            if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
>> +                (env->spr[SPR_LPCR] & LPCR_PDEE)) {
>> +                return PPC_INTERRUPT_DOORBELL;
>> +            }
>> +            /* Hypervisor Doorbell Exception */
>> +            if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
>> +                (env->spr[SPR_LPCR] & LPCR_HDEE)) {
>> +                return PPC_INTERRUPT_HDOORBELL;
>> +            }
>> +            /* Hypervisor virtualization exception */
>> +            if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
>> +                (env->spr[SPR_LPCR] & LPCR_HVEE)) {
>> +                return PPC_INTERRUPT_HVIRT;
>> +            }
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    /* Machine check exception */
>> +    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
>> +        return PPC_INTERRUPT_MCK;
>> +    }
>> +
>> +    /*
>> +     * For interrupts that gate on MSR:EE, we need to do something a
>> +     * bit more subtle, as we need to let them through even when EE is
>> +     * clear when coming out of some power management states (in order
>> +     * for them to become a 0x100).
>> +     */
>> +    async_deliver |= FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>> +
>> +    /* Hypervisor decrementer exception */
>> +    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
>> +        /* LPCR will be clear when not supported so this will work */
>> +        bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
>> +        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
>> +            /* HDEC clears on delivery */
>> +            return PPC_INTERRUPT_HDECR;
>> +        }
>> +    }
>> +
>> +    /* Hypervisor virtualization interrupt */
>> +    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
>> +        /* LPCR will be clear when not supported so this will work */
>> +        bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>> +        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
>> +            return PPC_INTERRUPT_HVIRT;
>> +        }
>> +    }
>> +
>> +    /* External interrupt can ignore MSR:EE under some circumstances */
>> +    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
>> +        bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>> +        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>> +        /* HEIC blocks delivery to the hypervisor */
>> +        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
>> +            !FIELD_EX64(env->msr, MSR, PR))) ||
>> +            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
>> +            return PPC_INTERRUPT_EXT;
>> +        }
>> +    }
>> +    if (FIELD_EX64(env->msr, MSR, CE)) {
>> +        /* External critical interrupt */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
>> +            return PPC_INTERRUPT_CEXT;
>> +        }
>> +    }
>> +    if (async_deliver != 0) {
>> +        /* Watchdog timer on embedded PowerPC */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
>> +            return PPC_INTERRUPT_WDT;
>> +        }
>> +        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
>> +            return PPC_INTERRUPT_CDOORBELL;
>> +        }
>> +        /* Fixed interval timer on embedded PowerPC */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
>> +            return PPC_INTERRUPT_FIT;
>> +        }
>> +        /* Programmable interval timer on embedded PowerPC */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
>> +            return PPC_INTERRUPT_PIT;
>> +        }
>> +        /* Decrementer exception */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>> +            return PPC_INTERRUPT_DECR;
>> +        }
>> +        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
>> +            return PPC_INTERRUPT_DOORBELL;
>> +        }
>> +        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
>> +            return PPC_INTERRUPT_HDOORBELL;
>> +        }
>> +        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
>> +            return PPC_INTERRUPT_PERFM;
>> +        }
>> +        /* Thermal interrupt */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
>> +            return PPC_INTERRUPT_THERM;
>> +        }
>> +        /* EBB exception */
>> +        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
>> +            /*
>> +             * EBB exception must be taken in problem state and
>> +             * with BESCR_GE set.
>> +             */
>> +            if (FIELD_EX64(env->msr, MSR, PR) &&
>> +                (env->spr[SPR_BESCR] & BESCR_GE)) {
>> +                return PPC_INTERRUPT_EBB;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int ppc_pending_interrupt_legacy(CPUPPCState *env)
>>   {
>>       bool async_deliver;
>> @@ -1793,6 +1950,9 @@ static int ppc_pending_interrupt_legacy(CPUPPCState *env)
>>   static int ppc_pending_interrupt(CPUPPCState *env)
>>   {
>>       switch (env->excp_model) {
>> +    case POWERPC_EXCP_POWER9:
>> +    case POWERPC_EXCP_POWER10:
>> +        return ppc_pending_interrupt_p9(env);
>>       default:
>>           return ppc_pending_interrupt_legacy(env);
>>       }

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

