Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091214B8625
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:49:07 +0100 (CET)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHru-0007dS-5F
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKHhf-0002lD-BS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:38:31 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKHhY-0007EO-4z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:38:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6E722E057A6E;
 Wed, 16 Feb 2022 11:38:21 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 11:38:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0066884af03-2d33-46fb-9adb-05435615dc78,
 A1B2BD187F74F0B5B5C68C97B98B37E493FE0AD5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <163ab233-ed5f-a2f1-a258-8eea38b7f647@kaod.org>
Date: Wed, 16 Feb 2022 11:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 8/9] target/ppc: Introduce a vhyp framework for nested
 HV support
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220216102545.1808018-1-npiggin@gmail.com>
 <20220216102545.1808018-9-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220216102545.1808018-9-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9944fe33-4e20-4eb8-8b9d-fcf39e1009b2
X-Ovh-Tracer-Id: 15284372711729236899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 11:25, Nicholas Piggin wrote:
> Introduce virtual hypervisor methods that can support a "Nested KVM HV"
> implementation using the bare metal 2-level radix MMU, and using HV
> exceptions to return from H_ENTER_NESTED (rather than cause interrupts).
> 
> HV exceptions can now be raised in the TCG spapr machine when running a
> nested KVM HV guest. The main ones are the lev==1 syscall, the hdecr,
> hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.
> 
> HV exceptions are intercepted in the exception handler code and instead
> of causing interrupts in the guest and switching the machine to HV mode,
> they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
> interrupt vector numer as return value as required by the hcall API.
> 
> Address translation is provided by the 2-level page table walker that is
> implemented for the bare metal radix MMU. The partition scope page table
> is pointed to the L1's partition scope by the get_pate vhc method.
> 
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/pegasos2.c        |  6 ++++
>   hw/ppc/spapr.c           |  6 ++++
>   target/ppc/cpu.h         |  7 +++++
>   target/ppc/excp_helper.c | 64 +++++++++++++++++++++++++++++++++-------
>   target/ppc/mmu-radix64.c | 11 +++++--
>   5 files changed, 81 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 298e6b93e2..d45008ac71 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -449,6 +449,11 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
>       }
>   }
>   
> +static bool pegasos2_cpu_in_nested(PowerPCCPU *cpu)
> +{
> +    return false;
> +}
> +
>   static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>   {
>       Pegasos2MachineState *pm = PEGASOS2_MACHINE(vhyp);
> @@ -504,6 +509,7 @@ static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_id = "pegasos2.ram";
>       mc->default_ram_size = 512 * MiB;
>   
> +    vhc->cpu_in_nested = pegasos2_cpu_in_nested;
>       vhc->hypercall = pegasos2_hypercall;
>       vhc->cpu_exec_enter = vhyp_nop;
>       vhc->cpu_exec_exit = vhyp_nop;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2c95a09d25..6fab70767f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4470,6 +4470,11 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
>       return NULL;
>   }
>   
> +static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
> +{
> +    return false;
> +}
> +
>   static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>   {
>       SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> @@ -4578,6 +4583,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>       fwc->get_dev_path = spapr_get_fw_dev_path;
>       nc->nmi_monitor_handler = spapr_nmi;
>       smc->phb_placement = spapr_phb_placement;
> +    vhc->cpu_in_nested = spapr_cpu_in_nested;
>       vhc->hypercall = emulate_spapr_hypercall;
>       vhc->hpt_mask = spapr_hpt_mask;
>       vhc->map_hptes = spapr_map_hptes;
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index c79ae74f10..2baa750729 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1311,6 +1311,8 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
>   #ifndef CONFIG_USER_ONLY
>   struct PPCVirtualHypervisorClass {
>       InterfaceClass parent;
> +    bool (*cpu_in_nested)(PowerPCCPU *cpu);
> +    void (*deliver_hv_excp)(PowerPCCPU *cpu, int excp);
>       void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
>       hwaddr (*hpt_mask)(PPCVirtualHypervisor *vhyp);
>       const ppc_hash_pte64_t *(*map_hptes)(PPCVirtualHypervisor *vhyp,
> @@ -1330,6 +1332,11 @@ struct PPCVirtualHypervisorClass {
>   #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
>   DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
>                        PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
> +
> +static inline bool vhyp_cpu_in_nested(PowerPCCPU *cpu)
> +{
> +    return PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp)->cpu_in_nested(cpu);
> +}
>   #endif /* CONFIG_USER_ONLY */
>   
>   void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 778eb4f3b0..a78d06d648 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1279,6 +1279,18 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>       powerpc_set_excp_state(cpu, vector, new_msr);
>   }
>   
> +/*
> + * When running a nested HV guest under vhyp, external interrupts are
> + * delivered as HVIRT.
> + */
> +static bool books_vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)
> +{
> +    if (cpu->vhyp) {
> +        return vhyp_cpu_in_nested(cpu);
> +    }
> +    return false;
> +}
> +
>   #ifdef TARGET_PPC64
>   /*
>    * When running under vhyp, hcalls are always intercepted and sent to the
> @@ -1287,7 +1299,21 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>   static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
>   {
>       if (cpu->vhyp) {
> -        return true;
> +        return !vhyp_cpu_in_nested(cpu);
> +    }
> +    return false;
> +}
> +
> +/*
> + * When running a nested KVM HV guest under vhyp, HV exceptions are not
> + * delivered to the guest (because there is no concept of HV support), but
> + * rather they are sent tothe vhyp to exit from the L2 back to the L1 and
> + * return from the H_ENTER_NESTED hypercall.
> + */
> +static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
> +{
> +    if (cpu->vhyp) {
> +        return vhyp_cpu_in_nested(cpu);
>       }
>       return false;
>   }
> @@ -1540,12 +1566,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           break;
>       }
>   
> -    /* Sanity check */
> -    if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
> -        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> -                  "no HV support\n", excp);
> -    }
> -
>       /*
>        * Sort out endianness of interrupt, this differs depending on the
>        * CPU, the HV mode, etc...
> @@ -1564,10 +1584,26 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           env->spr[srr1] = msr;
>       }
>   
> -    /* This can update new_msr and vector if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
> +    if ((new_msr & MSR_HVB) && books_vhyp_handles_hv_excp(cpu)) {
> +        PPCVirtualHypervisorClass *vhc =
> +            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        /* Deliver interrupt to L1 by returning from the H_ENTER_NESTED call */
> +        vhc->deliver_hv_excp(cpu, excp);
>   
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +        powerpc_reset_excp_state(cpu);
> +
> +    } else {
> +        /* Sanity check */
> +        if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
> +            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> +                      "no HV support\n", excp);
> +        }
> +
> +        /* This can update new_msr and vector if AIL applies */
> +        ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
> +
> +        powerpc_set_excp_state(cpu, vector, new_msr);
> +    }
>   }
>   #else
>   static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
> @@ -1687,7 +1723,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           /* HEIC blocks delivery to the hypervisor */
>           if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>               (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
> -            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            if (books_vhyp_promotes_external_to_hvirt(cpu)) {
> +                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
> +            } else {
> +                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            }
>               return;
>           }
>       }
> @@ -1797,6 +1837,8 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>           msr |= (1ULL << MSR_LE);
>       }
>   
> +    /* Anything for nested required here? MSR[HV] bit? */
> +
>       powerpc_set_excp_state(cpu, vector, msr);
>   }
>   
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 3b6d75a292..b951b310c1 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -355,12 +355,19 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>   }
>   
>   /*
> - * The spapr vhc has a flat partition scope provided by qemu memory.
> + * The spapr vhc has a flat partition scope provided by qemu memory when
> + * not nested.
> + *
> + * When running a nested guest, the addressing is 2-level radix on top of the
> + * vhc memory, so it works practically identically to the bare metal 2-level
> + * radix. So that code is selected directly. A cleaner and more flexible nested
> + * hypervisor implementation would allow the vhc to provide a ->nested_xlate()
> + * function but that is not required for the moment.
>    */
>   static bool vhyp_flat_addressing(PowerPCCPU *cpu)
>   {
>       if (cpu->vhyp) {
> -        return true;
> +        return !vhyp_cpu_in_nested(cpu);
>       }
>       return false;
>   }


