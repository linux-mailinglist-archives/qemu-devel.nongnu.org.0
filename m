Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB9597042
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:55:21 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJVw-0001K4-JG
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJL6-0000nb-9Q; Wed, 17 Aug 2022 09:44:08 -0400
Received: from [200.168.210.66] (port=24774 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJL4-0006Lg-J4; Wed, 17 Aug 2022 09:44:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 10:44:04 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 943C7800134;
 Wed, 17 Aug 2022 10:44:04 -0300 (-03)
Message-ID: <3a56bdae-6fd1-852f-e3c3-f992c4eda22f@eldorado.org.br>
Date: Wed, 17 Aug 2022 10:44:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 06/13] target/ppc: remove embedded interrupts from
 ppc_pending_interrupt_p9
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-7-matheus.ferst@eldorado.org.br>
 <8735dx6w0y.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <8735dx6w0y.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Aug 2022 13:44:05.0027 (UTC)
 FILETIME=[6AB39F30:01D8B23F]
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

On 15/08/2022 18:23, Fabiano Rosas wrote:
> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
> 
>> Critical Input, Watchdog Timer, and Fixed Interval Timer are only
>> defined for embedded CPUs. The Programmable Interval Timer is 40x-only.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/excp_helper.c | 18 ------------------
>>   1 file changed, 18 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 2ca6a917b2..42b57019ba 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1780,28 +1780,10 @@ static int ppc_pending_interrupt_p9(CPUPPCState *env)
>>               return PPC_INTERRUPT_EXT;
>>           }
>>       }
>> -    if (FIELD_EX64(env->msr, MSR, CE)) {
>> -        /* External critical interrupt */
>> -        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
>> -            return PPC_INTERRUPT_CEXT;
>> -        }
>> -    }
>>       if (async_deliver != 0) {
>> -        /* Watchdog timer on embedded PowerPC */
>> -        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
>> -            return PPC_INTERRUPT_WDT;
>> -        }
>>           if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
>>               return PPC_INTERRUPT_CDOORBELL;
>>           }
> 
> This one too.
> 
> And the Thermal.

There are some other interrupts that I was not sure if we should remove:
- PPC_INTERRUPT_PERFM doesn't seem to be used anywhere else. I guess it 
will be used when we implement more PMU stuff, so I left it in all 
ppc_pending_interrupt_* methods.
- PPC_INTERRUPT_RESET was treated in cpu_has_work_POWER*, but AFAICS, 
it's only used in ppc6xx_set_irq and ppc970_set_irq, which means it can 
only be raised on 6xx, 7xx, 970, and POWER5+. Should we remove it too?

> 
>> -        /* Fixed interval timer on embedded PowerPC */
>> -        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
>> -            return PPC_INTERRUPT_FIT;
>> -        }
>> -        /* Programmable interval timer on embedded PowerPC */
>> -        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
>> -            return PPC_INTERRUPT_PIT;
>> -        }
>>           /* Decrementer exception */
>>           if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>>               return PPC_INTERRUPT_DECR;

Tḧanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

