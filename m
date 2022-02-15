Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C899A4B741D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:34:33 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1ii-0001rq-KW
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK1dS-0007AY-Pv
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:29:06 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:51145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK1dP-0003h6-18
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:29:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 39996E01A63E;
 Tue, 15 Feb 2022 18:28:50 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 18:28:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00304c2e584-513b-4282-855b-38277409f809,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5892f53e-10df-2a69-63c6-5f5901384bb8@kaod.org>
Date: Tue, 15 Feb 2022 18:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/9] target/ppc: Introduce a vhyp framework for nested HV
 support
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-9-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-9-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ade69b48-d75f-4ee4-8826-18065cd99689
X-Ovh-Tracer-Id: 16344126001143057315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
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
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   hw/ppc/pegasos2.c        |  6 ++++
>   hw/ppc/spapr.c           |  6 ++++
>   target/ppc/cpu.h         |  2 ++
>   target/ppc/excp_helper.c | 76 ++++++++++++++++++++++++++++++++++------
>   target/ppc/mmu-radix64.c | 15 ++++++--
>   5 files changed, 92 insertions(+), 13 deletions(-)
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


I don't think you need to worry about the pegasos2 machine as it only
implements a few of the PPCVirtualHypervisorClass handlers and it can
not run any of these virtualization features. I would drop this part.


> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 1892a29e2d..3a5cf92c94 100644
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
> index c79ae74f10..d8cc956c97 100644
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
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 778eb4f3b0..ecff7654cb 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1279,6 +1279,22 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>       powerpc_set_excp_state(cpu, vector, new_msr);
>   }

a helper such as :

   static bool inline books_vhyp_cpu_in_nested(PowerPCCPU *cpu)
   {
       return PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp)->cpu_in_nested(cpu);
   }

would help to reduce the routines below.


> +/*
> + * When running a nested HV guest under vhyp, external interrupts are
> + * delivered as HVIRT.
> + */
> +static bool vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)

You seem to have choosen the 'books_vhyp_' prefix. I am not sure of the
naming yet but, for now, it's the better to keep it consistent.

> +{
> +    if (cpu->vhyp) {
> +        PPCVirtualHypervisorClass *vhc;
> +        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        if (vhc->cpu_in_nested(cpu)) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>   #ifdef TARGET_PPC64
>   /*
>    * When running under vhyp, hcalls are always intercepted and sent to the
> @@ -1287,7 +1303,29 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>   static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
>   {
>       if (cpu->vhyp) {
> -        return true;
> +        PPCVirtualHypervisorClass *vhc;
> +        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        if (!vhc->cpu_in_nested(cpu)) {
> +            return true;
> +        }
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
> +        PPCVirtualHypervisorClass *vhc;
> +        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        if (vhc->cpu_in_nested(cpu)) {
> +            return true;
> +        }
>       }
>       return false;
>   }
> @@ -1540,12 +1578,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           break;
>       }
>   
> -    /* Sanity check */
> -    if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
> -        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> -                  "no HV support\n", excp);
> -    }
>
>       /*
>        * Sort out endianness of interrupt, this differs depending on the
>        * CPU, the HV mode, etc...
> @@ -1564,10 +1596,26 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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
> @@ -1687,7 +1735,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           /* HEIC blocks delivery to the hypervisor */
>           if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>               (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
> -            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            if (vhyp_promotes_external_to_hvirt(cpu)) {
> +                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
> +            } else {
> +                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            }
>               return;
>           }
>       }
> @@ -1797,6 +1849,8 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>           msr |= (1ULL << MSR_LE);
>       }
>   
> +    /* Anything for nested required here? MSR[HV] bit? */
> +
>       powerpc_set_excp_state(cpu, vector, msr);
>   }
>   
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 3b6d75a292..9b7a6a7f11 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -355,12 +355,23 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
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
> +        PPCVirtualHypervisorClass *vhc;
> +        vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        if (!vhc->cpu_in_nested(cpu)) {
> +            return true;
> +        }
>       }
>       return false;
>   }


