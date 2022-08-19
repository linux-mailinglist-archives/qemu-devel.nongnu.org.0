Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97854599D68
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 16:22:05 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP2su-0008D2-0i
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 10:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oP2pQ-0005Se-TJ; Fri, 19 Aug 2022 10:18:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oP2pO-000236-KR; Fri, 19 Aug 2022 10:18:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JDUtbf015230;
 Fri, 19 Aug 2022 14:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=GVC4C8bMv9vLI14wvQvQnZ5z40kMAA4aPIy/5ppnTQM=;
 b=W9l7jcuz3pgg8MW4h9FRzdJKeqnyMpr7E0QmoqC3Ls2WqSOtld69AzAL3ZljBXjDQi/T
 gK6exE1rlziZpfkxvW/qON9Nr2EaAOlxU661CwtFtnB1mvvKfHB97NsiZ+J4cp9GWkp2
 2o6xcULgri6JFYXzjPps+Q+23JqQmhrfap8GA7/Ije9HDqI1rTwSw1E0amAYG4eMQkni
 kM0e98muYHSVOqfDn2oDRUKDvxp6LXUBR0sBCKP3CsQgA38uY0U5uDh3zNVscWH0iInx
 9JLNZEfr+uFsyxOubYb0zHQJOPFv/8SzcYWhbbMWIbBeAALQjs15jPvmKGf7tTK6vqyw Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j2bf89efm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 14:18:06 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27JDWbKB021362;
 Fri, 19 Aug 2022 14:18:06 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j2bf89ef6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 14:18:06 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27JDokR7004223;
 Fri, 19 Aug 2022 14:18:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3hx3kapbkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 14:18:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27JEI48b1376886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Aug 2022 14:18:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43384AC059;
 Fri, 19 Aug 2022 14:18:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A27D3AC05B;
 Fri, 19 Aug 2022 14:18:03 +0000 (GMT)
Received: from localhost (unknown [9.65.248.183])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Aug 2022 14:18:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 03/13] target/ppc: move interrupt masking out of
 ppc_hw_interrupt
In-Reply-To: <d8908f90-fa5b-66bc-bbc2-7164ee819a7d@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-4-matheus.ferst@eldorado.org.br>
 <87a6856zh0.fsf@linux.ibm.com>
 <d8908f90-fa5b-66bc-bbc2-7164ee819a7d@eldorado.org.br>
Date: Fri, 19 Aug 2022 11:18:01 -0300
Message-ID: <87zgg0jp0m.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4bL2lcYgnGj9OcF1oHYyZCxX6vwypg-E
X-Proofpoint-GUID: _MMn-m58EhN7WpPT3y-a3nLSuxata10E
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190052
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 15/08/2022 17:09, Fabiano Rosas wrote:
>> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
>> 
>>> Move the interrupt masking logic to a new method, ppc_pending_interrupt,
>>> and only handle the interrupt processing in ppc_hw_interrupt.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>   target/ppc/excp_helper.c | 228 ++++++++++++++++++++++++---------------
>>>   1 file changed, 141 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> 
>> <snip>
>> 
>>> @@ -1884,15 +1915,38 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>>   {
>>>       PowerPCCPU *cpu = POWERPC_CPU(cs);
>>>       CPUPPCState *env = &cpu->env;
>>> +    int pending_interrupt;
>> 
>> I would give this a simpler name to avoid confusion with the other two
>> pending_interrupt terms.
>> 
>>>
>>> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
>>> -        ppc_hw_interrupt(env);
>>> -        if (env->pending_interrupts == 0) {
>>> -            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
>>> -        }
>>> -        return true;
>>> +    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
>>> +        return false;
>>>       }
>>> -    return false;
>>> +
>> 
>> It seems we're assuming that after this point we certainly have some
>> pending interrupt...
>> 
>>> +    pending_interrupt = ppc_pending_interrupt(env);
>>> +    if (pending_interrupt == 0) {
>> 
>> ...but how then is this able to return 0?
>
> At this point in the patch series, raising interrupts with ppc_set_irq 
> always sets CPU_INTERRUPT_HARD, so it is possible that all interrupts 
> are masked, and then ppc_pending_interrupt would return zero.
>
>> Could the function's name be
>> made a bit clearer? Maybe interrupt = ppc_next_pending_interrupt or
>> something to that effect.
>> 
>
> Maybe ppc_next_unmasked_interrupt?

Could be. Although your suggestion below of moving the pending=0 case
into ppc_hw_interrupt already clears up the confusion quite a lot.

>>> +        if (env->resume_as_sreset) {
>>> +            /*
>>> +             * This is a bug ! It means that has_work took us out of halt
>>> +             * without anything to deliver while in a PM state that requires
>>> +             * getting out via a 0x100
>>> +             *
>>> +             * This means we will incorrectly execute past the power management
>>> +             * instruction instead of triggering a reset.
>>> +             *
>>> +             * It generally means a discrepancy between the wakeup conditions in
>>> +             * the processor has_work implementation and the logic in this
>>> +             * function.
>>> +             */
>>> +            cpu_abort(env_cpu(env),
>>> +                      "Wakeup from PM state but interrupt Undelivered");
>> 
>> This condition is BookS only. Perhaps it would be better to move it
>> inside each of the processor-specific functions. And since you're
>> merging has_work with pending_interrupts, can't you solve that issue
>> earlier? Specifically the "has_work tooks us out of halt..." part.
>> 
>
> This condition would not be an error in ppc_pending_interrupt because 
> we'll call this method from other places in the following patches, like 
> ppc_set_irq. Maybe we should move it to a "case 0:" in ppc_hw_interrupt?
>

Good idea, this condition is very unlikely (impossible?) to happen so
there's no need to have it prominent in this function like this. Should
it be turned into an assert as well perhaps?

>>> +        }
>>> +        return false;
>>> +    }
>>> +
>>> +    ppc_hw_interrupt(env, pending_interrupt);
>> 
>> Some verbs would be nice. ppc_deliver_interrupt?
>
> Agreed. Should we also make processor-specific versions of this method? 
> That way, we could get rid of the calls to ppc_decr_clear_on_delivery 
> and is_book3s_arch2x.

Yes, let's see what it looks like.

What interrupts exist for a given CPU along with their implementation
specific behavior are data that's linked to the CPU/group of CPUs. In
theory we could have these decisions made at build time/CPU selection
time and just operate on the smaller subset of data at runtime.

The is_book3s_arch2x check can already be removed. After the
powerpc_excp functions were split there's nothing handling DOORI; and
SDOOR is now only handled by powerpc_books. So we would just be changing
the "exception not implemented" message from DOORI to SDOOR.

... which will probably lead to some exploration of why we are
generating exceptions in TCG code for interrupts that are never
delivered/handled.

>> 
>>> +    if (env->pending_interrupts == 0) {
>>> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>>> +    }
>>> +    return true;
>>>   }
>>>
>>>   #endif /* !CONFIG_USER_ONLY */
>
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

