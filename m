Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB6597025
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:48:23 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJPC-0003Ot-CP
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJJf-00065x-9j; Wed, 17 Aug 2022 09:42:39 -0400
Received: from [200.168.210.66] (port=59547 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJJb-00062V-UM; Wed, 17 Aug 2022 09:42:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 10:42:28 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id DDAB1800134;
 Wed, 17 Aug 2022 10:42:27 -0300 (-03)
Message-ID: <d8908f90-fa5b-66bc-bbc2-7164ee819a7d@eldorado.org.br>
Date: Wed, 17 Aug 2022 10:42:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 03/13] target/ppc: move interrupt masking out of
 ppc_hw_interrupt
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-4-matheus.ferst@eldorado.org.br>
 <87a6856zh0.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <87a6856zh0.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 17 Aug 2022 13:42:28.0277 (UTC)
 FILETIME=[3108BE50:01D8B23F]
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

On 15/08/2022 17:09, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Move the interrupt masking logic to a new method, ppc_pending_interrupt,
>> and only handle the interrupt processing in ppc_hw_interrupt.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/excp_helper.c | 228 ++++++++++++++++++++++++---------------
>>   1 file changed, 141 insertions(+), 87 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> 
> <snip>
> 
>> @@ -1884,15 +1915,38 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>   {
>>       PowerPCCPU *cpu = POWERPC_CPU(cs);
>>       CPUPPCState *env = &cpu->env;
>> +    int pending_interrupt;
> 
> I would give this a simpler name to avoid confusion with the other two
> pending_interrupt terms.
> 
>>
>> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
>> -        ppc_hw_interrupt(env);
>> -        if (env->pending_interrupts == 0) {
>> -            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
>> -        }
>> -        return true;
>> +    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
>> +        return false;
>>       }
>> -    return false;
>> +
> 
> It seems we're assuming that after this point we certainly have some
> pending interrupt...
> 
>> +    pending_interrupt = ppc_pending_interrupt(env);
>> +    if (pending_interrupt == 0) {
> 
> ...but how then is this able to return 0?

At this point in the patch series, raising interrupts with ppc_set_irq 
always sets CPU_INTERRUPT_HARD, so it is possible that all interrupts 
are masked, and then ppc_pending_interrupt would return zero.

> Could the function's name be
> made a bit clearer? Maybe interrupt = ppc_next_pending_interrupt or
> something to that effect.
> 

Maybe ppc_next_unmasked_interrupt?

>> +        if (env->resume_as_sreset) {
>> +            /*
>> +             * This is a bug ! It means that has_work took us out of halt
>> +             * without anything to deliver while in a PM state that requires
>> +             * getting out via a 0x100
>> +             *
>> +             * This means we will incorrectly execute past the power management
>> +             * instruction instead of triggering a reset.
>> +             *
>> +             * It generally means a discrepancy between the wakeup conditions in
>> +             * the processor has_work implementation and the logic in this
>> +             * function.
>> +             */
>> +            cpu_abort(env_cpu(env),
>> +                      "Wakeup from PM state but interrupt Undelivered");
> 
> This condition is BookS only. Perhaps it would be better to move it
> inside each of the processor-specific functions. And since you're
> merging has_work with pending_interrupts, can't you solve that issue
> earlier? Specifically the "has_work tooks us out of halt..." part.
> 

This condition would not be an error in ppc_pending_interrupt because 
we'll call this method from other places in the following patches, like 
ppc_set_irq. Maybe we should move it to a "case 0:" in ppc_hw_interrupt?

>> +        }
>> +        return false;
>> +    }
>> +
>> +    ppc_hw_interrupt(env, pending_interrupt);
> 
> Some verbs would be nice. ppc_deliver_interrupt?

Agreed. Should we also make processor-specific versions of this method? 
That way, we could get rid of the calls to ppc_decr_clear_on_delivery 
and is_book3s_arch2x.

> 
>> +    if (env->pending_interrupts == 0) {
>> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>> +    }
>> +    return true;
>>   }
>>
>>   #endif /* !CONFIG_USER_ONLY */

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

