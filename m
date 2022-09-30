Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE65F0F62
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:58:15 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIP0-0000ak-6D
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeIN9-0007NL-JE; Fri, 30 Sep 2022 11:56:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6530
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeIN7-0004jH-4S; Fri, 30 Sep 2022 11:56:19 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UFonYa004436;
 Fri, 30 Sep 2022 15:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=sTx6ifex173AYEMzEDBvFk0iLRWjHnOfaOaQWveyL2Q=;
 b=Gd3eJCEpVZYf23dUhhUdcgMKOwJoqvYVg7NJm2ROMFGckr+C/VWWZS6Od+s8ffSnha2U
 RDyCgJbgfjxH1sWlwOedXKjvg347y2PsizmXSfVyjyknqL60IUSCYDoOIXRJA3JTZ/Wg
 MRUhruJoT0nakPmh2+Us97h5R/kha2QZiQSXlPoDakqOrzGbYm8KnUP9pBeIAz6FQR1N
 2T+dGvbqLx4N1RFy4NInJ5NxwdCV5uPvO4KHEdcwMkbQxsIMovcc+gJmqFP6H7kBxG3Q
 kY9hhACD5mLgEBtJ+aYHN7zaLXZt5VRPBS9aXGXdbglSJjkQX3SsCYX2f7rbHZlrVzvf Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx3f5g4a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 15:55:58 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UFstiK022224;
 Fri, 30 Sep 2022 15:55:57 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx3f5g49r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 15:55:57 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UFpO3h019832;
 Fri, 30 Sep 2022 15:55:57 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3jssha9bvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 15:55:57 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28UFttha3277382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 15:55:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA9E758055;
 Fri, 30 Sep 2022 15:55:55 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A8AE5804E;
 Fri, 30 Sep 2022 15:55:55 +0000 (GMT)
Received: from localhost (unknown [9.160.76.206])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Sep 2022 15:55:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 03/29] target/ppc: split interrupt masking and
 delivery from ppc_hw_interrupt
In-Reply-To: <20220927201544.4088567-4-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-4-matheus.ferst@eldorado.org.br>
Date: Fri, 30 Sep 2022 12:55:52 -0300
Message-ID: <87tu4o6elz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1ksFxukfUoUXt31w7iy_4KWj0RSzYZSA
X-Proofpoint-ORIG-GUID: 7YdSnGakhYfQS8G-T5ZospvG5Unhuzbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Split ppc_hw_interrupt into an interrupt masking method,
> ppc_next_unmasked_interrupt, and an interrupt processing method,
> ppc_deliver_interrupt.
>

<snip>

> @@ -1822,20 +1782,106 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>               */
>              if (FIELD_EX64(env->msr, MSR, PR) &&
>                  (env->spr[SPR_BESCR] & BESCR_GE)) {
> -                env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
> -
> -                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
> -                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
> -                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
> -                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
> -                }
> -
> -                return;
> +                return PPC_INTERRUPT_EBB;
>              }
>          }
>      }
>  
> -    if (env->resume_as_sreset) {
> +    return 0;
> +}
> +
> +static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    CPUState *cs = env_cpu(env);
> +
> +    switch (interrupt) {
> +    case PPC_INTERRUPT_RESET: /* External reset */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
> +        powerpc_excp(cpu, POWERPC_EXCP_RESET);
> +        break;
> +    case PPC_INTERRUPT_MCK: /* Machine check exception */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
> +        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
> +        break;
> +#if 0 /* TODO */
> +    case PPC_INTERRUPT_DEBUG: /* External debug exception */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
> +        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
> +        break;
> +#endif
> +
> +    case PPC_INTERRUPT_HDECR: /* Hypervisor decrementer exception */
> +        /* HDEC clears on delivery */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
> +        powerpc_excp(cpu, POWERPC_EXCP_HDECR);
> +        break;
> +    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
> +        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
> +        break;
> +
> +    case PPC_INTERRUPT_EXT:
> +        if (books_vhyp_promotes_external_to_hvirt(cpu)) {
> +            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
> +        } else {
> +            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +        }
> +        break;
> +    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
> +        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
> +        break;
> +
> +    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
> +        powerpc_excp(cpu, POWERPC_EXCP_WDT);
> +        break;
> +    case PPC_INTERRUPT_CDOORBELL:
> +        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
> +        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
> +        break;
> +    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
> +        powerpc_excp(cpu, POWERPC_EXCP_FIT);
> +        break;
> +    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded PowerPC */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
> +        powerpc_excp(cpu, POWERPC_EXCP_PIT);
> +        break;
> +    case PPC_INTERRUPT_DECR: /* Decrementer exception */
> +        if (ppc_decr_clear_on_delivery(env)) {
> +            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
> +        }
> +        powerpc_excp(cpu, POWERPC_EXCP_DECR);
> +        break;
> +    case PPC_INTERRUPT_DOORBELL:
> +        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
> +        if (is_book3s_arch2x(env)) {
> +            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
> +        } else {
> +            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
> +        }
> +        break;
> +    case PPC_INTERRUPT_HDOORBELL:
> +        env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
> +        powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
> +        break;
> +    case PPC_INTERRUPT_PERFM:
> +        env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
> +        powerpc_excp(cpu, POWERPC_EXCP_PERFM);
> +        break;
> +    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
> +        powerpc_excp(cpu, POWERPC_EXCP_THERM);
> +        break;
> +    case PPC_INTERRUPT_EBB: /* EBB exception */
> +        env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
> +        if (env->spr[SPR_BESCR] & BESCR_PMEO) {
> +            powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
> +        } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
> +            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
> +        }
> +        break;
> +    case 0:
>          /*
>           * This is a bug ! It means that has_work took us out of halt without
>           * anything to deliver while in a PM state that requires getting
> @@ -1847,8 +1893,10 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           * It generally means a discrepancy between the wakeup conditions in the
>           * processor has_work implementation and the logic in this function.
>           */
> -        cpu_abort(env_cpu(env),
> -                  "Wakeup from PM state but interrupt Undelivered");
> +        assert(env->resume_as_sreset != 0);

This should be: assert(!env->resume_as_sreset);

> +        break;
> +    default:
> +        cpu_abort(cs, "Invalid PowerPC interrupt %d. Aborting\n", interrupt);
>      }
>  }
>  
> @@ -1884,15 +1932,22 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
> +    int interrupt;
>  
> -    if (interrupt_request & CPU_INTERRUPT_HARD) {
> -        ppc_hw_interrupt(env);
> -        if (env->pending_interrupts == 0) {
> -            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
> -        }
> -        return true;
> +    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
> +        return false;
>      }
> -    return false;
> +
> +    interrupt = ppc_next_unmasked_interrupt(env);
> +    if (interrupt == 0) {
> +        return false;
> +    }
> +
> +    ppc_deliver_interrupt(env, interrupt);
> +    if (env->pending_interrupts == 0) {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +    return true;
>  }
>  
>  #endif /* !CONFIG_USER_ONLY */

