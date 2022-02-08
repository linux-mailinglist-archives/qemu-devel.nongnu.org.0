Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F534AE567
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:24:42 +0100 (CET)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZqj-00044z-6n
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nHZn7-00030Z-MP; Tue, 08 Feb 2022 18:20:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nHZmj-0004uj-AG; Tue, 08 Feb 2022 18:20:56 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218KgMBs027529; 
 Tue, 8 Feb 2022 23:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=vE3G2CCcaNPC8i7DJODfh3+LbyJylY8DkbSEbM8YDcA=;
 b=SxR7+1h2ygsJpH73ryeFWg/I6ilRtXr0mOy3K2XbKU4bSY3dTKlw2fhpedJ0tnSE2Ac7
 PNYNy8KFsU/cKiYI0JPC/SAvWyxVge5dHYgRvqagED8gzSI80sIopb7A3J8I2qDJ21uR
 b4kQc9S1TlnuYcNX0wMxRrj1suonUhL8tR4OAxqsxJ6zik3SjdrJUa3hQazTKsyGGMnc
 LX/+PENT3IEKVOkvPcwapUmAQxj/oEwufEutz9upU2FME5um9zi26PE/aTOMeRe9YR5g
 7yxGkQy0HfHTpVNn1m1PWNgVEJ5VK4NaFXdjjUEYoCsol20BJur2QJngwk1ZCKYBUZzE ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3vvkfcy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 23:20:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218Mr8Sf016727;
 Tue, 8 Feb 2022 23:20:20 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3vvkfcxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 23:20:20 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218N7vJo031068;
 Tue, 8 Feb 2022 23:20:18 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3e2f8ngtaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 23:20:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218NKI3346268726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 23:20:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2E54AE073;
 Tue,  8 Feb 2022 23:20:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7FBEAE06B;
 Tue,  8 Feb 2022 23:20:16 +0000 (GMT)
Received: from localhost (unknown [9.211.52.82])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Feb 2022 23:20:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 3/3] target/ppc: EBB exception implementation
In-Reply-To: <20220208194838.169257-4-danielhb413@gmail.com>
References: <20220208194838.169257-1-danielhb413@gmail.com>
 <20220208194838.169257-4-danielhb413@gmail.com>
Date: Tue, 08 Feb 2022 20:20:14 -0300
Message-ID: <87zgn1j68h.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PFJfly754oqcFWmgWyUz65MEK-TKjS_5
X-Proofpoint-ORIG-GUID: 4eecGErl-D52nf186HO6EzGjvDpESew0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080134
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> This patch adds the EBB exception support that are triggered by
> Performance Monitor alerts. This happens when a Performance Monitor
> alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.
>
> A 'ebb_excp_enabled' helper is called at the end of fire_PMC_interrupt()
> to fire the EBB exception, checking for FSCR and HFSCR support
> beforehand.
>
> In ppc_hw_interrupt() the generated EBB exception will be taken only if
> running in problem state and with BESCR_GE set. The check for BESCR_GE
> bit in this step is needed to avoid race conditions where we take an
> EBB, while the previous EBB is still inflight (BESCR_GE cleared), and
> SPR_EBBHR is not set yet. In this case we'll branch to env->nip = 0 and the
> guest will crash. The Linux kernel selftest 'lost_exception_test' is an
> example where this racing will occur.
>
> The code in powerpc_excp_books() is the default EBB handling described
> in the PowerISA v3.1: clear BESCR_GE, set BESCR_PMEO, save env->nip in
> SPR_EBBRR and redirect the execution to the address pointed by
> SPR_EBBHR. The already implemented 'rbebb' instruction is then able to
> return from the EBB by retrieving the NIP in SPR_EBBRR.
>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Now that BookS code is separate from the other CPUs, let me leave this
here:

Why do we have "interrupts" before "exceptions"? As in ppc_hw_interrupt
 calling powerpc_excp.

If anyone has a consistent mental model on how this that they could
share I'd appreciate it.

Now onto the patch:
> ---
>  target/ppc/excp_helper.c | 51 +++++++++++++++++++++++++++++++++++++---
>  target/ppc/helper.h      |  1 +
>  target/ppc/power8-pmu.c  | 12 ++++++++--
>  3 files changed, 59 insertions(+), 5 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8a49a4ab90..2a95cec39e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -19,6 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#include "hw/ppc/ppc.h"
>  #include "exec/exec-all.h"
>  #include "internal.h"
>  #include "helper_regs.h"
> @@ -990,8 +991,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>          new_msr |= (target_ulong)MSR_HVB;
>          new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>          break;
> -    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>      case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */

We would need some way to tell apart EBB from other Performance Monitor
interrupts here. Unless you want to leave that to the next person that
looks at Performance Monitor interrupts.

> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
> +        env->spr[SPR_BESCR] |= BESCR_PMEO;
> +
> +        /*
> +         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
> +         * stored in the EBB Handler SPR_EBBHR.
> +         */
> +        env->spr[SPR_EBBRR] = env->nip;
> +        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
> +
> +        /*
> +         * This exception is handled in userspace. No need to proceed.
> +         */
> +        return;
> +    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>      case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
>      case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
>      case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
> @@ -1671,8 +1686,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>              return;
>          }
>          if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
> -            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
> -            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
> +            /*
> +             * PERFM EBB must be taken in problem state and
> +             * with BESCR_GE set.
> +             */
> +            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
> +                powerpc_excp(cpu, POWERPC_EXCP_PERFM);
> +            }

This is masking other Performance Interrupts (for all CPUs). Can we move
these checks into the helper?

>              return;
>          }
>          /* Thermal interrupt */
> @@ -1915,6 +1936,30 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
>          env->spr[SPR_BESCR] &= ~BESCR_GE;
>      }
>  }
> +
> +void helper_ebb_perfm_int(CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +
> +    /*
> +     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
> +     * HFSCR.
> +     */
> +    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
> +    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
> +
> +    /*
> +     * Setting "env->pending_interrupts |= 1 << PPC_INTERRUPT_PERFM"
> +     * instead of calling "ppc_set_irq()"" works in most cases, but under
> +     * certain race conditions (e.g. lost_exception_test EBB kernel
> +     * selftest) this hits an assert when dealing with the BQL:
> +     *
> +     * tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked())
> +     *
> +     * We ended up using ppc_set_irq() because it handles the BQL.
> +     */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PERFM, 1);
> +}
>  #endif
>  
>  /*****************************************************************************/
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f2e5060910..bb26da6176 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
>  DEF_HELPER_1(rfscv, void, env)
>  DEF_HELPER_1(hrfid, void, env)
>  DEF_HELPER_2(rfebb, void, env, tl)
> +DEF_HELPER_1(ebb_perfm_int, void, env)
>  DEF_HELPER_2(store_lpcr, void, env, tl)
>  DEF_HELPER_2(store_pcr, void, env, tl)
>  DEF_HELPER_2(store_mmcr0, void, env, tl)
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index d245663158..41409e609f 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -281,6 +281,13 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>      pmc_update_overflow_timer(env, sprn);
>  }
>  
> +static bool ebb_excp_enabled(CPUPPCState *env)
> +{
> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
> +           env->spr[SPR_BESCR] & BESCR_PME &&
> +           env->spr[SPR_BESCR] & BESCR_GE;
> +}
> +
>  static void fire_PMC_interrupt(PowerPCCPU *cpu)
>  {
>      CPUPPCState *env = &cpu->env;
> @@ -307,8 +314,9 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>          env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>      }
>  
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    if (ebb_excp_enabled(env)) {
> +        helper_ebb_perfm_int(env);
> +    }
>  }
>  
>  /* This helper assumes that the PMC is running. */

