Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B095F11B8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 20:41:08 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeKwd-0006CD-CF
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 14:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeKuP-0004FG-Kf; Fri, 30 Sep 2022 14:38:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeKuM-00066V-VP; Fri, 30 Sep 2022 14:38:48 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UHFEPb013035;
 Fri, 30 Sep 2022 18:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=vSZ8Cy34SKqAVqgX9fIzge5QMYBkDb8vn7qVn+sN6hQ=;
 b=EDm+MNUr1kXvvVql1pnTU6VyQh5a4n7ZMzZxg9SqCtpqlA+hGcWCnuVxQcuZFhdq6L0+
 iwSMOgiIb8JSvvSEx4bt4s3ywHo7PsMQwy+eoi36fBplrJJtHvIygVALWl1jP+HJDVH2
 gAVqH923m2cSaihcX5KVvIvj06ipMtInGQjmXRmDU3EFZECeiEuL5WyP237NTTr02+lt
 N0wJBx4/1h5KrbBihvGw9g1uOhoGtFb6L28tYFwYv5/Whk5T0l7R3R1vzkIyI8whhaXM
 5wiAlAR4ngj3IsWivqqdRpAZQ5fTG0QryvxNnV/ulwTAzsMLEL/2v4qZttaOlRCLj7Ry iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx4pkj1bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:38:35 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UIXCLd008803;
 Fri, 30 Sep 2022 18:38:35 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx4pkj1ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:38:35 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UIabI8008473;
 Fri, 30 Sep 2022 18:38:34 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3jsshbmm8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:38:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28UIcX551507952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 18:38:33 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C99F158050;
 Fri, 30 Sep 2022 18:38:32 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E45C58045;
 Fri, 30 Sep 2022 18:38:32 +0000 (GMT)
Received: from localhost (unknown [9.160.76.206])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Sep 2022 18:38:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 11/29] target/ppc: add power-saving interrupt
 masking logic to p9_next_unmasked_interrupt
In-Reply-To: <20220927201544.4088567-12-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-12-matheus.ferst@eldorado.org.br>
Date: Fri, 30 Sep 2022 15:38:29 -0300
Message-ID: <87o7uw672y.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2sTCjqGDX8nLPku1QwIUTo5xn8sy2Gdh
X-Proofpoint-ORIG-GUID: -QIYb1HMKWv8NWuCoUf1O8eoQ4iV9DOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=582
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Export p9_interrupt_powersave and use it in p9_next_unmasked_interrupt.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> Temporarily putting the prototype in internal.h for lack of a better place,
> we will un-export p9_interrupt_powersave in future patches.
> ---
>  target/ppc/cpu_init.c    |  2 +-
>  target/ppc/excp_helper.c | 46 ++++++++++++++++++++++++++++------------
>  target/ppc/internal.h    |  4 ++++
>  3 files changed, 38 insertions(+), 14 deletions(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 1f8f6c6ef2..7889158c52 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6351,7 +6351,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>      return false;
>  }
>  
> -static int p9_interrupt_powersave(CPUPPCState *env)
> +int p9_interrupt_powersave(CPUPPCState *env)
>  {
>      /* External Exception */
>      if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 67e73f30ab..5a0d2c11a2 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1686,28 +1686,39 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>  
>  static int p9_next_unmasked_interrupt(CPUPPCState *env)
>  {
> -    bool async_deliver;
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    CPUState *cs = CPU(cpu);
> +    /* Ignore MSR[EE] when coming out of some power management states */
> +    bool msr_ee = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
>  
>      assert((env->pending_interrupts & P9_UNUSED_INTERRUPTS) == 0);
>  
> +    if (cs->halted) {
> +        if (env->spr[SPR_PSSCR] & PSSCR_EC) {
> +            /*
> +             * When PSSCR[EC] is set, LPCR[PECE] controls which interrupts can
> +             * wakeup the processor
> +             */
> +            return p9_interrupt_powersave(env);
> +        } else {
> +            /*
> +             * When it's clear, any system-caused exception exits power-saving
> +             * mode, even the ones that gate on MSR[EE].
> +             */
> +            msr_ee = true;
> +        }
> +    }
> +
>      /* Machine check exception */
>      if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
>          return PPC_INTERRUPT_MCK;
>      }
>  
> -    /*
> -     * For interrupts that gate on MSR:EE, we need to do something a
> -     * bit more subtle, as we need to let them through even when EE is
> -     * clear when coming out of some power management states (in order
> -     * for them to become a 0x100).
> -     */
> -    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
> -

You could simplify the code below if you bail early here when !msr_ee.

>      /* Hypervisor decrementer exception */
>      if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
>          /* LPCR will be clear when not supported so this will work */
>          bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hdice) {
>              /* HDEC clears on delivery */
>              return PPC_INTERRUPT_HDECR;
>          }
> @@ -1717,7 +1728,7 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>      if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
>          /* LPCR will be clear when not supported so this will work */
>          bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
> -        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
> +        if ((msr_ee || !FIELD_EX64_HV(env->msr)) && hvice) {
>              return PPC_INTERRUPT_HVIRT;
>          }
>      }
> @@ -1727,13 +1738,13 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
>          bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>          bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
>          /* HEIC blocks delivery to the hypervisor */
> -        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
> +        if ((msr_ee && !(heic && FIELD_EX64_HV(env->msr) &&
>              !FIELD_EX64(env->msr, MSR, PR))) ||
>              (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
>              return PPC_INTERRUPT_EXT;
>          }
>      }
> -    if (async_deliver != 0) {
> +    if (msr_ee != 0) {
>          /* Decrementer exception */
>          if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>              return PPC_INTERRUPT_DECR;
> @@ -1895,6 +1906,15 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>      PowerPCCPU *cpu = env_archcpu(env);
>      CPUState *cs = env_cpu(env);
>  
> +    if (cs->halted && !(env->spr[SPR_PSSCR] & PSSCR_EC) &&
> +        !FIELD_EX64(env->msr, MSR, EE)) {
> +        /*
> +         * A pending interrupt took us out of power-saving, but MSR[EE] says
> +         * that we should return to NIP+4 instead of delivering it.
> +         */
> +        return;

How will the NIP be advanced in this case?

> +    }
> +
>      switch (interrupt) {
>      case PPC_INTERRUPT_MCK: /* Machine check exception */
>          env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 337a362205..41e79adfdb 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -306,4 +306,8 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
>      return msk;
>  }
>  
> +#if defined(TARGET_PPC64)
> +int p9_interrupt_powersave(CPUPPCState *env);
> +#endif
> +
>  #endif /* PPC_INTERNAL_H */

