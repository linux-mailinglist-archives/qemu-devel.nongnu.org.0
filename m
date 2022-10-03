Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002AD5F344D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 19:16:52 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofP3j-0006Jc-1B
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 13:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofOos-0006fR-5I; Mon, 03 Oct 2022 13:01:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofOop-00068C-NI; Mon, 03 Oct 2022 13:01:29 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293Gsmrn006281;
 Mon, 3 Oct 2022 17:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=AQREJb72ifhHbwjqiqHC4bcQBpXwa2rlW+f5s2sX6TM=;
 b=K6yo98HgBcJBKUwpgq39yQQ+v4wX7NCznKyBctali01cFrIs0cOwFHHO39bCGPioDXSu
 n2Jm729Hgb045ll6LQOkoo19tqqV8fzw/BfZ4TJaEx22dXxLTdOB80Myk4fL7uY9gjf3
 g0gtDj0ntwjGpzeCyx0nXaQU3kPJfED32NHMpvl0nXI2BbSdk3FOmTP6ZtpW+rlF6Wdo
 gU2HSKtPOqM+cUlZphdJkFMMM7wgXP1PrYXKsmJE1P2O4TtKROYaddecOAoZcDUGkVKX
 tDKmfdoZ/e7kZUCEc9IF6iZSGA3VIa5jB73UdfYmbq+Er4s77NhixGV8xQ2Ne7CgSbqI eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k03p5g4m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 17:01:10 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293Gt0Lx008401;
 Mon, 3 Oct 2022 17:01:10 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k03p5g4jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 17:01:09 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 293Goo9w014618;
 Mon, 3 Oct 2022 17:01:08 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3jxd69eg5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 17:01:08 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 293H172w65143236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Oct 2022 17:01:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C278858063;
 Mon,  3 Oct 2022 17:01:06 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0980658069;
 Mon,  3 Oct 2022 17:01:06 +0000 (GMT)
Received: from localhost (unknown [9.160.178.216])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  3 Oct 2022 17:01:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [RFC PATCH v2 11/29] target/ppc: add power-saving interrupt
 masking logic to p9_next_unmasked_interrupt
In-Reply-To: <a6523c11-0c79-6dd5-be7f-2b3e24ebd136@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-12-matheus.ferst@eldorado.org.br>
 <87o7uw672y.fsf@linux.ibm.com>
 <a6523c11-0c79-6dd5-be7f-2b3e24ebd136@eldorado.org.br>
Date: Mon, 03 Oct 2022 14:01:03 -0300
Message-ID: <87a66c6dv4.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sR68FD8vMBfk5N7X_GpzNiwQU2kGgsoy
X-Proofpoint-GUID: Qiqy_NU7ZswUz5qQq93TCnHYyMgGA6mu
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=792
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> On 30/09/2022 15:38, Fabiano Rosas wrote:
>> Matheus Ferst <matheus.ferst@eldorado.org.br> writes:
>> 
>>> Export p9_interrupt_powersave and use it in p9_next_unmasked_interrupt.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> Temporarily putting the prototype in internal.h for lack of a better place,
>>> we will un-export p9_interrupt_powersave in future patches.
>>> ---
>>>   target/ppc/cpu_init.c    |  2 +-
>>>   target/ppc/excp_helper.c | 46 ++++++++++++++++++++++++++++------------
>>>   target/ppc/internal.h    |  4 ++++
>>>   3 files changed, 38 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 1f8f6c6ef2..7889158c52 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -6351,7 +6351,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>>>       return false;
>>>   }
>>>
>>> -static int p9_interrupt_powersave(CPUPPCState *env)
>>> +int p9_interrupt_powersave(CPUPPCState *env)
>>>   {
>>>       /* External Exception */
>>>       if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 67e73f30ab..5a0d2c11a2 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1686,28 +1686,39 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>>>
>>>   static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>>   {
>>> -    bool async_deliver;
>>> +    PowerPCCPU *cpu = env_archcpu(env);
>>> +    CPUState *cs = CPU(cpu);
>>> +    /* Ignore MSR[EE] when coming out of some power management states */
>>> +    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>>>
>>>       assert((env->pending_interrupts & P9_UNUSED_INTERRUPTS) == 0);
>>>
>>> +    if (cs->halted) {
>>> +        if (env->spr[SPR_PSSCR] & PSSCR_EC) {
>>> +            /*
>>> +             * When PSSCR[EC] is set, LPCR[PECE] controls which interrupts can
>>> +             * wakeup the processor
>>> +             */
>>> +            return p9_interrupt_powersave(env);
>>> +        } else {
>>> +            /*
>>> +             * When it's clear, any system-caused exception exits power-saving
>>> +             * mode, even the ones that gate on MSR[EE].
>>> +             */
>>> +            msr_ee = true;
>>> +        }
>>> +    }
>>> +
>>>       /* Machine check exception */
>>>       if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
>>>           return PPC_INTERRUPT_MCK;
>>>       }
>>>
>>> -    /*
>>> -     * For interrupts that gate on MSR:EE, we need to do something a
>>> -     * bit more subtle, as we need to let them through even when EE is
>>> -     * clear when coming out of some power management states (in order
>>> -     * for them to become a 0x100).
>>> -     */
>>> -    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>>> -
>> 
>> You could simplify the code below if you bail early here when !msr_ee.
>> 
>
> The next interrupts have checks in the form
>
> if (MSR[EE] && some_condition) || (!MSR[HV] && some_other_condition)
>
> so we cannot return yet. We could check twice for these interrupts, e.g.

Ah, ok. Let's leave like it is then.

>
> if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>      (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
>      return PPC_INTERRUPT_EXT;
> }
>
> /* ... */
>
> if (!msr_ee) {
>      return 0;
> }
>
> /* ... */
>
> if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
>      !(heic && FIELD_EX64_HV(env->msr) && !FIELD_EX64(env->msr, MSR, PR))) {
>      return PPC_INTERRUPT_EXT;
> }
>
> But I'm not sure if it'd be better.
>
>>>       /* Hypervisor decrementer exception */
>>>       if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
>>>           /* LPCR will be clear when not supported so this will work */
>>>           bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
>>> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
>>> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hdice) {
>>>               /* HDEC clears on delivery */
>>>               return PPC_INTERRUPT_HDECR;
>>>           }
>>> @@ -1717,7 +1728,7 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>>       if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
>>>           /* LPCR will be clear when not supported so this will work */
>>>           bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>>> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
>>> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hvice) {
>>>               return PPC_INTERRUPT_HVIRT;
>>>           }
>>>       }
>>> @@ -1727,13 +1738,13 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>>>           bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>>>           bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>>>           /* HEIC blocks delivery to the hypervisor */
>>> -        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
>>> +        if ((msr_ee && !(heic && FIELD_EX64_HV(env->msr) &&
>>>               !FIELD_EX64(env->msr, MSR, PR))) ||
>>>               (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
>>>               return PPC_INTERRUPT_EXT;
>>>           }
>>>       }
>>> -    if (async_deliver != 0) {
>>> +    if (msr_ee != 0) {
>>>           /* Decrementer exception */
>>>           if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>>>               return PPC_INTERRUPT_DECR;
>>> @@ -1895,6 +1906,15 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>>>       PowerPCCPU *cpu = env_archcpu(env);
>>>       CPUState *cs = env_cpu(env);
>>>
>>> +    if (cs->halted && !(env->spr[SPR_PSSCR] & PSSCR_EC) &&
>>> +        !FIELD_EX64(env->msr, MSR, EE)) {
>>> +        /*
>>> +         * A pending interrupt took us out of power-saving, but MSR[EE] says
>>> +         * that we should return to NIP+4 instead of delivering it.
>>> +         */
>>> +        return;
>> 
>> How will the NIP be advanced in this case?
>> 
>
> It's already incremented by the translation code. ppc_tr_translate_insn 
> increments ctx->base.pc_next before calling decode_{insn{32,64},legacy}, 
> and methods that put the CPU to sleep will use gen_exception_nip with 
> this value as the last argument.
>
>>> +    }
>>> +
>>>       switch (interrupt) {
>>>       case PPC_INTERRUPT_MCK: /* Machine check exception */
>>>           env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
>>> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
>>> index 337a362205..41e79adfdb 100644
>>> --- a/target/ppc/internal.h
>>> +++ b/target/ppc/internal.h
>>> @@ -306,4 +306,8 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
>>>       return msk;
>>>   }
>>>
>>> +#if defined(TARGET_PPC64)
>>> +int p9_interrupt_powersave(CPUPPCState *env);
>>> +#endif
>>> +
>>>   #endif /* PPC_INTERNAL_H */
>
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

