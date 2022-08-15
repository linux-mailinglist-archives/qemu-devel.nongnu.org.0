Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31A5942D3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 00:41:37 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNim6-0007Iz-Dp
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 18:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNikB-0005eU-L9; Mon, 15 Aug 2022 18:39:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46388
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNijy-0004k0-IX; Mon, 15 Aug 2022 18:39:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FLxbEO005334;
 Mon, 15 Aug 2022 22:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Qj92w7y4I+LIKVOQ1mDO50Al6B9RytohEeDaVDrRmPw=;
 b=gJjkFEV6IN9ZtaktkgCUVXv8smde6ata+ZjMXGzsP9ZVG3Mqb/2rFKWlJGQDeIab3iwe
 UnMBkBntGmDOJ3FT8e5G3v1OvHarYxrr2t8QNq3ErmR+a3vRwVtE8ZkNN2jDn6vav7zH
 bpm7UWRIo7yBWTGf6kDgopCYWT1tMYli4knmA1EaXJ8Cca4T2E72+T9hEFt1kl3BYZUO
 zg3ZeXHODn5wQDEYbXNwbIeMMQH6o8Tz2AMacfSAtThm9LF9amhincr5lDCxR0nErIcy
 b1o9i6p/cGgJ019xftS+amnsiJqbwJ6pLpnA7aoUR0DONSo8yiZoYv5JjKeAVh+XleX0 jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyxhy0pbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 22:39:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27FMTBEx011807;
 Mon, 15 Aug 2022 22:39:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyxhy0pb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 22:39:10 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27FMamuT004688;
 Mon, 15 Aug 2022 22:39:09 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3hx3k96h7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 22:39:09 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27FMd9ld1442422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Aug 2022 22:39:09 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4971AAC068;
 Mon, 15 Aug 2022 22:39:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2079AC067;
 Mon, 15 Aug 2022 22:39:08 +0000 (GMT)
Received: from localhost (unknown [9.160.104.128])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Aug 2022 22:39:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 05/13] target/ppc: create an interrupt masking
 method for POWER9/POWER10
In-Reply-To: <20220815162020.2420093-6-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-6-matheus.ferst@eldorado.org.br>
Date: Mon, 15 Aug 2022 19:39:07 -0300
Message-ID: <87y1vp5dys.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hHBufbXIBG8azQWS_hFY4RV04XR4HaTV
X-Proofpoint-ORIG-GUID: MVVDeZTGdG50ww90WbGiAkMNqfqfj12l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150087
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Create an interrupt masking method for the POWER9 and POWER10
> processors. The new method is based on cpu_has_work_POWER{9,10} and
> ppc_pending_interrupt_legacy.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/excp_helper.c | 160 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 59981efd16..2ca6a917b2 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1678,6 +1678,163 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>      powerpc_excp(cpu, cs->exception_index);
>  }
>  
> +static int ppc_pending_interrupt_p9(CPUPPCState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    bool async_deliver = false;

I would suggest this to disentangle the PM stuff from MSR_EE:

  if (cs->halted) {
     if (env->spr[SPR_PSSCR] & PSSCR_EC) {
         return p9_interrupt_powersave();
     } else {
         /*
          * If EC is clear, any system-caused exception exits
          * power-saving mode.
          */
          ignore_msr_ee = true;
     }
  }
  
  RESET    (keep it duplicated)
  MCHECK
  
  if (!MSR_EE && !ignore_msr_ee) {
     return 0;
  }
  
  MSR_EE interrupts
---

> +
> +    /* External reset */
> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> +        return PPC_INTERRUPT_RESET;
> +    }
> +
> +    if (cs->halted) {
> +        uint64_t psscr = env->spr[SPR_PSSCR];
> +
> +        if (!(psscr & PSSCR_EC)) {
> +            /* If EC is clear, return any system-caused interrupt */
> +            async_deliver = true;

This doesn't look correct, look at what the ISA says:

  EC=0
  
  Hardware will exit power-saving mode when the exception corresponding
  to any system-caused interrupt occurs. Power-saving mode is exited
  either at the instruction following the stop (if MSR_EE=0) or in the
  corresponding interrupt handler (if MSR_EE=1).

So with MSR_EE=0 we should *not* deliver any interrupts, but return to NIP+4.

> +        } else {
> +            /* External Exception */
> +            if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> +                (env->spr[SPR_LPCR] & LPCR_EEE)) {
> +                bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
> +                if (!heic || !FIELD_EX64_HV(env->msr) ||
> +                    FIELD_EX64(env->msr, MSR, PR)) {
> +                    return PPC_INTERRUPT_EXT;
> +                }
> +            }
> +            /* Decrementer Exception */
> +            if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> +                (env->spr[SPR_LPCR] & LPCR_DEE)) {
> +                return PPC_INTERRUPT_DECR;
> +            }
> +            /* Machine Check or Hypervisor Maintenance Exception */
> +            if (env->spr[SPR_LPCR] & LPCR_OEE) {
> +                if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
> +                    return PPC_INTERRUPT_MCK;
> +                }
> +                if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
> +                    return PPC_INTERRUPT_HMI;
> +                }
> +            }
> +            /* Privileged Doorbell Exception */
> +            if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
> +                (env->spr[SPR_LPCR] & LPCR_PDEE)) {
> +                return PPC_INTERRUPT_DOORBELL;
> +            }
> +            /* Hypervisor Doorbell Exception */
> +            if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
> +                (env->spr[SPR_LPCR] & LPCR_HDEE)) {
> +                return PPC_INTERRUPT_HDOORBELL;
> +            }
> +            /* Hypervisor virtualization exception */
> +            if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
> +                (env->spr[SPR_LPCR] & LPCR_HVEE)) {
> +                return PPC_INTERRUPT_HVIRT;
> +            }
> +            return 0;
> +        }
> +    }
> +
> +    /* Machine check exception */
> +    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
> +        return PPC_INTERRUPT_MCK;
> +    }
> +
> +    /*
> +     * For interrupts that gate on MSR:EE, we need to do something a
> +     * bit more subtle, as we need to let them through even when EE is
> +     * clear when coming out of some power management states (in order
> +     * for them to become a 0x100).
> +     */
> +    async_deliver |= FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
> +
> +    /* Hypervisor decrementer exception */
> +    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
> +        /* LPCR will be clear when not supported so this will work */
> +        bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
> +        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
> +            /* HDEC clears on delivery */
> +            return PPC_INTERRUPT_HDECR;
> +        }
> +    }
> +
> +    /* Hypervisor virtualization interrupt */
> +    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
> +        /* LPCR will be clear when not supported so this will work */
> +        bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
> +        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
> +            return PPC_INTERRUPT_HVIRT;
> +        }
> +    }
> +
> +    /* External interrupt can ignore MSR:EE under some circumstances */
> +    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
> +        bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> +        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
> +        /* HEIC blocks delivery to the hypervisor */
> +        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
> +            !FIELD_EX64(env->msr, MSR, PR))) ||
> +            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
> +            return PPC_INTERRUPT_EXT;
> +        }
> +    }
> +    if (FIELD_EX64(env->msr, MSR, CE)) {
> +        /* External critical interrupt */
> +        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
> +            return PPC_INTERRUPT_CEXT;
> +        }
> +    }
> +    if (async_deliver != 0) {
> +        /* Watchdog timer on embedded PowerPC */
> +        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
> +            return PPC_INTERRUPT_WDT;
> +        }
> +        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
> +            return PPC_INTERRUPT_CDOORBELL;
> +        }
> +        /* Fixed interval timer on embedded PowerPC */
> +        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
> +            return PPC_INTERRUPT_FIT;
> +        }
> +        /* Programmable interval timer on embedded PowerPC */
> +        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
> +            return PPC_INTERRUPT_PIT;
> +        }
> +        /* Decrementer exception */
> +        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
> +            return PPC_INTERRUPT_DECR;
> +        }
> +        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
> +            return PPC_INTERRUPT_DOORBELL;
> +        }
> +        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
> +            return PPC_INTERRUPT_HDOORBELL;
> +        }
> +        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
> +            return PPC_INTERRUPT_PERFM;
> +        }
> +        /* Thermal interrupt */
> +        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
> +            return PPC_INTERRUPT_THERM;
> +        }
> +        /* EBB exception */
> +        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
> +            /*
> +             * EBB exception must be taken in problem state and
> +             * with BESCR_GE set.
> +             */
> +            if (FIELD_EX64(env->msr, MSR, PR) &&
> +                (env->spr[SPR_BESCR] & BESCR_GE)) {
> +                return PPC_INTERRUPT_EBB;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int ppc_pending_interrupt_legacy(CPUPPCState *env)
>  {
>      bool async_deliver;
> @@ -1793,6 +1950,9 @@ static int ppc_pending_interrupt_legacy(CPUPPCState *env)
>  static int ppc_pending_interrupt(CPUPPCState *env)
>  {
>      switch (env->excp_model) {
> +    case POWERPC_EXCP_POWER9:
> +    case POWERPC_EXCP_POWER10:
> +        return ppc_pending_interrupt_p9(env);
>      default:
>          return ppc_pending_interrupt_legacy(env);
>      }

