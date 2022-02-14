Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BE4B54C2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:27:23 +0100 (CET)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdG6-0002xJ-Ms
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJcPD-0002MX-UX; Mon, 14 Feb 2022 09:32:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJcP9-00007E-Kn; Mon, 14 Feb 2022 09:32:43 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ED1DFU017807; 
 Mon, 14 Feb 2022 14:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=+8hl5pOV605yXiClfnW1nI9A83Icpw06Ku8xEo+m9ss=;
 b=KgAMSOrE9JaO4ndSNoJxQthrNp0YICFXxMGm2/iEiahPlnSTmG19i6aeYjFkrUZIwllv
 1kU3YvCFoWbO2Thg/Xxs7KEio0LFfPul4fdVjmk11wfHe6x1TuVtwo+HYsnMrLE8zd//
 SuJtv4tCvlHLdKafY+zXsxYv+vplZMyfeyrC0M38qgo/1B77FvEQCiuDBG820Q3pfvHG
 xQq/acPj7Jn2u44d0BVubtUJ0LOR4cHNUARB1IHAukQDcYKC5tXD7tbVXbYACEaUl8hA
 cUli456EZ+DoMpodYtnP3yB0cv9HKbn0m7taKKhh6kvs6dqVWPk23g8Xei4KtNGP09ls ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt17auv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:32:29 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EDeHms008328;
 Mon, 14 Feb 2022 14:32:29 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e6rt17aud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:32:29 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EESrBh008494;
 Mon, 14 Feb 2022 14:32:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3e64ha17fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:32:27 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EEWQIB14942500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 14:32:26 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA5A8112062;
 Mon, 14 Feb 2022 14:32:26 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8AB112061;
 Mon, 14 Feb 2022 14:32:25 +0000 (GMT)
Received: from localhost (unknown [9.211.47.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Feb 2022 14:32:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH 3/3] spapr: implement nested-hv support for the TCG
 virtual hypervisor
In-Reply-To: <20220210065340.1276367-4-npiggin@gmail.com>
References: <20220210065340.1276367-1-npiggin@gmail.com>
 <20220210065340.1276367-4-npiggin@gmail.com>
Date: Mon, 14 Feb 2022 11:32:21 -0300
Message-ID: <87k0dxldsa.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uDQSlUDNiBLUhqhRIqYhEPDyu68HuCQ4
X-Proofpoint-ORIG-GUID: wEuCN03S_ssfWeqJRaoGYeSYccO28JRn
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140088
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This implements the nested-hv hcall API for spapr under TCG.
> It's still a bit rough around the edges, concept seems to work.
>
> Some HV exceptions can be raised now in the TCG spapr machine when
> running a nested guest. The main ones are the lev==1 syscall, the
> hdecr, hdsi and hisi, and h_virt external interrupts. These are
> dealt with in the interrupt delivery code by noticing MSR[HV] raised
> and instead of switching the machine to HV mode, it exits the
> H_ENTER_NESTED hcall with the interrupt vector as return value as
> required by the hcall API.
>
> Address translation is provided by the 2-level page table walker
> that is implemented for the pnv machine. The partition scope page
> table is pointed to the L1's partition scope, and a few tests have
> to take into account that nested-hv translations are 2-level. This
> could perhaps be tidied up a bit e.g., with a 'bool two_level = ...'
> but it's surprisingly little code.
>
> There is no TLB tagging between L1 and L2 translations at the moment
> so the TLB is flushed on any L1<->L2 transition (hcall entry and exit).
>
> XXX: stop doing atomic RC on page table walks (not for nested but in general)
>
> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Hi Nick,

Sorry it took me so long to get to this. It think overall it looks
good. I have some comments about code structure that you probably
already know about.

I don't have answers to your XXX questions but I think it's ok to handle
them later individually as they come up, after this is merged.

> ---
>  hw/ppc/ppc.c               |  20 +++
>  hw/ppc/spapr.c             |  16 ++
>  hw/ppc/spapr_caps.c        |   5 +-
>  hw/ppc/spapr_hcall.c       | 316 +++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/ppc.h       |   3 +
>  include/hw/ppc/spapr.h     |  75 ++++++++-
>  target/ppc/cpu.h           |   6 +
>  target/ppc/excp_helper.c   |  60 ++++---
>  target/ppc/helper_regs.c   |   1 +
>  target/ppc/mmu-book3s-v3.c |  20 ++-
>  target/ppc/mmu-radix64.c   |  15 +-
>  11 files changed, 499 insertions(+), 38 deletions(-)
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index a7c262db93..135900a6f4 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>      return &cpu_ppc_set_tb_clk;
>  }
>  
> +void cpu_ppc_hdecr_init (CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +
> +    assert(env->tb_env->hdecr_timer == NULL);
> +
> +    env->tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
> +                                                 cpu);
> +}
> +
> +void cpu_ppc_hdecr_exit (CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +
> +    timer_free(env->tb_env->hdecr_timer);
> +    env->tb_env->hdecr_timer = NULL;
> +
> +    cpu_ppc_hdecr_lower(cpu);
> +}
> +
>  /* Specific helpers for POWER & PowerPC 601 RTC */
>  void cpu_ppc601_store_rtcu (CPUPPCState *env, uint32_t value)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3d6ec309dd..f0c3f726f2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1273,6 +1273,8 @@ static void emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
>      if (msr_pr) {
>          hcall_dprintf("Hypercall made with MSR[PR]=1\n");
>          env->gpr[3] = H_PRIVILEGE;
> +    } else if (env->gpr[3] == KVMPPC_H_ENTER_NESTED) {
> +        spapr_enter_nested(cpu);

This looks like it could be plumbed along with spapr_hypercall below.

>      } else {
>          env->gpr[3] = spapr_hypercall(cpu, env->gpr[3], &env->gpr[4]);
>      }
> @@ -4465,6 +4467,17 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
>      return NULL;
>  }
>  
> +static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
> +{
> +    return cpu->in_spapr_nested;
> +}
> +
> +static target_ulong spapr_get_nested_ptcr(PowerPCCPU *cpu, target_ulong lpid)
> +{
> +        SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> +        return spapr->nested_ptcr;
> +}
> +
>  static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>  {
>      SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> @@ -4573,6 +4586,9 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      fwc->get_dev_path = spapr_get_fw_dev_path;
>      nc->nmi_monitor_handler = spapr_nmi;
>      smc->phb_placement = spapr_phb_placement;
> +    vhc->cpu_in_nested = spapr_cpu_in_nested;
> +    vhc->get_nested_ptcr = spapr_get_nested_ptcr;
> +    vhc->exit_nested = spapr_exit_nested;
>      vhc->hypercall = emulate_spapr_hypercall;
>      vhc->hpt_mask = spapr_hpt_mask;
>      vhc->map_hptes = spapr_map_hptes;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index ed7c077a0d..a665245f6f 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -450,10 +450,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
>          return;
>      }
>  
> -    if (tcg_enabled()) {
> -        error_setg(errp, "No Nested KVM-HV support in TCG");
> -        error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
> -    } else if (kvm_enabled()) {
> +    if (!tcg_enabled()) {
>          if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
>                                spapr->max_compat_pvr)) {
>              error_setg(errp, "Nested KVM-HV only supported on POWER9");
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 222c1b6bbd..8ffb13ada0 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -9,6 +9,7 @@
>  #include "qemu/error-report.h"
>  #include "exec/exec-all.h"
>  #include "helper_regs.h"
> +#include "hw/ppc/ppc.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_cpu_core.h"
>  #include "mmu-hash64.h"
> @@ -1497,6 +1498,317 @@ static void hypercall_register_softmmu(void)
>  }
>  #endif
>  
> +/* TCG only */
> +#define PRTS_MASK      0x1f
> +
> +static target_ulong h_set_ptbl(PowerPCCPU *cpu,
> +                               SpaprMachineState *spapr,
> +                               target_ulong opcode,
> +                               target_ulong *args)
> +{
> +    target_ulong ptcr = args[0];
> +
> +    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
> +        return H_FUNCTION;
> +    }
> +
> +    if ((ptcr & PRTS_MASK) + 12 - 4 > 12) {
> +        return H_PARAMETER;
> +    }
> +
> +    spapr->nested_ptcr = ptcr; /* Save new partition table */
> +
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
> +                               SpaprMachineState *spapr,
> +                               target_ulong opcode,
> +                               target_ulong *args)
> +{
> +    CPUState *cs = CPU(cpu);
> +
> +    /*
> +     * The spapr virtual hypervisor nested HV implementation retains no
> +     * translation state except for TLB. This might be optimised to
> +     * invalidate fewer entries, but at the moment it's not important
> +     * because L1<->L2 transitions always flush the entire TLB for now.
> +     */
> +    tlb_flush(cs);
> +
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
> +                               SpaprMachineState *spapr,
> +                               target_ulong opcode,
> +                               target_ulong *args)
> +{
> +    /*
> +     * This HCALL is not required, L1 KVM will take a slow path and walk the
> +     * page tables manually to do the data copy.
> +     */

Kind of unrelated to the patch itself but I thought the point of this
hcall was less about performance and more about Ln not having access to
the KVM memslots for the Ln+2.

KVM accesses a guest address space by using the GFN to find the memory
slot and from there the userspace address that is part of the
memslot. Accesses from Ln -> Ln+1 can use that mechanism because any Ln
will have slots registered for its guests.

For L0 -> L2, we can go via radix quadrants because the L0 is the real
HV (that's how L0 handles this hcall after all).

For L1 -> L3, we need the hcall since L1 cannot access quadrants 1 and 2
and it does not have the memslot so it cannot use the QEMU address.

Does that make sense?

> +    return H_FUNCTION;
> +}
> +
> +void spapr_enter_nested(PowerPCCPU *cpu)
> +{
> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
> +    target_ulong hv_ptr = env->gpr[4];
> +    target_ulong regs_ptr = env->gpr[5];
> +    target_ulong hdec, now = cpu_ppc_load_tbl(env);
> +    struct kvmppc_hv_guest_state *hvstate;
> +    struct kvmppc_hv_guest_state hv_state;
> +    struct kvmppc_pt_regs *regs;
> +    hwaddr len;
> +    uint32_t cr;
> +    int i;
> +
> +    if (cpu->in_spapr_nested) {
> +        env->gpr[3] = H_FUNCTION;
> +        return;
> +    }
> +    if (spapr->nested_ptcr == 0) {
> +        env->gpr[3] = H_NOT_AVAILABLE;
> +        return;
> +    }
> +
> +    len = sizeof(*hvstate);
> +    hvstate = cpu_physical_memory_map(hv_ptr, &len, true);
> +    if (!hvstate || len != sizeof(*hvstate)) {
> +        env->gpr[3] = H_PARAMETER;
> +        return;
> +    }
> +
> +    memcpy(&hv_state, hvstate, len);
> +
> +    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access len */);
> +
> +    if (hv_state.version != HV_GUEST_STATE_VERSION) {

KVM uses > here. Should we do the same? Daniel and I have been
discussing if we need some sort of version negotiation for nested KVM
since recently someone tried to use an L0 version 1 with an L1 version
2:

https://gitlab.com/qemu-project/qemu/-/issues/860

> +        env->gpr[3] = H_PARAMETER;
> +        return;
> +    }
> +

<snip>

> +/* 64-bit powerpc pt_regs struct used by nested HV */
> +struct kvmppc_pt_regs {
> +    uint64_t gpr[32];
> +    uint64_t nip;
> +    uint64_t msr;
> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
> +    uint64_t ctr;
> +    uint64_t link;
> +    uint64_t xer;
> +    uint64_t ccr;
> +    uint64_t softe;        /* Soft enabled/disabled */
> +    uint64_t trap;         /* Reason for being here */
> +    uint64_t dar;          /* Fault registers */
> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */

There's no 4xx/booke support for spapr nested.

> +    uint64_t result;       /* Result of a system call */
> +};
>  
>  typedef struct SpaprDeviceTreeUpdateHeader {
>      uint32_t version_id;
> @@ -604,6 +673,10 @@ typedef target_ulong (*spapr_hcall_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
>  void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
>  target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
>                               target_ulong *args);
> +
> +void spapr_enter_nested(PowerPCCPU *cpu);
> +void spapr_exit_nested(PowerPCCPU *cpu, int excp);
> +
>  target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                           target_ulong shift);
>  target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu, SpaprMachineState *spapr,
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index dcd83b503c..1806a8e776 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1306,6 +1306,9 @@ struct PowerPCCPU {
>      bool pre_2_10_migration;
>      bool pre_3_0_migration;
>      int32_t mig_slb_nr;
> +
> +    bool in_spapr_nested;
> +    CPUPPCState *nested_host_state;
>  };
>  
>  
> @@ -1316,6 +1319,9 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
>  #ifndef CONFIG_USER_ONLY
>  struct PPCVirtualHypervisorClass {
>      InterfaceClass parent;
> +    bool (*cpu_in_nested)(PowerPCCPU *cpu);
> +    target_ulong (*get_nested_ptcr)(PowerPCCPU *cpu, target_ulong lpid);
> +    void (*exit_nested)(PowerPCCPU *cpu, int excp);
>      void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
>      hwaddr (*hpt_mask)(PPCVirtualHypervisor *vhyp);
>      const ppc_hash_pte64_t *(*map_hptes)(PPCVirtualHypervisor *vhyp,
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index c107953dec..239c253dbc 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -361,8 +361,8 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>  #endif
>  }
>  
> -static void powerpc_set_excp_state(PowerPCCPU *cpu,
> -                                          target_ulong vector, target_ulong msr)
> +static void powerpc_set_excp_state(PowerPCCPU *cpu, int excp,
> +                                   target_ulong vector, target_ulong msr)
>  {
>      CPUState *cs = CPU(cpu);
>      CPUPPCState *env = &cpu->env;
> @@ -375,9 +375,17 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
>       * will prevent setting of the HV bit which some exceptions might need
>       * to do.
>       */
> -    env->msr = msr & env->msr_mask;
> -    hreg_compute_hflags(env);
> -    env->nip = vector;
> +    if (cpu->vhyp && cpu->in_spapr_nested && (msr & MSR_HVB)) {
> +        PPCVirtualHypervisorClass *vhc =
> +            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        // Deliver interrupt to L1 by returning from the H_ENTER_NESTED call
> +        vhc->exit_nested(cpu, excp);
> +    } else {
> +        env->nip = vector;
> +        env->msr = msr & env->msr_mask;
> +        hreg_compute_hflags(env);
> +    }
> +

All of this should fit better at the end of powerpc_excp_books. Even if
we need to duplicate it for fwnmi_machine_check.

>      /* Reset exception state */
>      cs->exception_index = POWERPC_EXCP_NONE;
>      env->error_code = 0;
> @@ -548,7 +556,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>      /* Save MSR */
>      env->spr[srr1] = msr;
>  
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>  }
>  
>  static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
> @@ -742,7 +750,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>      /* Save MSR */
>      env->spr[SPR_SRR1] = msr;
>  
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>  }
>  
>  #ifdef TARGET_PPC64
> @@ -916,7 +924,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>          env->nip += 4;
>  
>          /* "PAPR mode" built-in hypercall emulation */
> -        if ((lev == 1) && cpu->vhyp) {
> +        if ((lev == 1) && cpu->vhyp && !cpu->in_spapr_nested) {
>              PPCVirtualHypervisorClass *vhc =
>                  PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>              vhc->hypercall(cpu->vhyp, cpu);
> @@ -1004,18 +1012,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>          break;
>      }
>  
> -    /* Sanity check */
> -    if (!(env->msr_mask & MSR_HVB)) {
> -        if (new_msr & MSR_HVB) {
> -            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
> -                      "no HV support\n", excp);
> -        }
> -        if (srr0 == SPR_HSRR0) {
> -            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> -                      "no HV support\n", excp);
> -        }
> -    }
> -
>      /*
>       * Sort out endianness of interrupt, this differs depending on the
>       * CPU, the HV mode, etc...
> @@ -1037,7 +1033,19 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>      /* This can update new_msr and vector if AIL applies */
>      ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
>  
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
> +
> +    /* Sanity check */
> +    if (!(env->msr_mask & MSR_HVB)) {
> +        if (env->msr & MSR_HVB) {
> +            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
> +                      "no HV support\n", excp);
> +        }

FYI, this doesn't exist anymore.

> +        if (0 && srr0 == SPR_HSRR0) {
> +            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
> +                      "no HV support\n", excp);
> +        }

msr_mask should have MSR_HVB independently of MSR_HV being actually set,
so this shouldn't be causing any problems. Is it?

> +    }
>  }
>  #else
>  static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
> @@ -1517,7 +1525,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
>      /* This can update new_msr and vector if AIL applies */
>      ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
>  
> -    powerpc_set_excp_state(cpu, vector, new_msr);
> +    powerpc_set_excp_state(cpu, excp, vector, new_msr);
>  }
>  
>  static void powerpc_excp(PowerPCCPU *cpu, int excp)
> @@ -1613,7 +1621,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>          /* HEIC blocks delivery to the hypervisor */
>          if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>              (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
> -            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            if (cpu->in_spapr_nested) {
> +                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
> +            } else {
> +                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
> +            }

This function affects other CPUs, so it's better to leave this as it
were and change the exception inside powerpc_excp_books, like we do for
HV_EMUL.

>              return;
>          }
>      }
> @@ -1723,7 +1735,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>          msr |= (1ULL << MSR_LE);
>      }
>  
> -    powerpc_set_excp_state(cpu, vector, msr);
> +    powerpc_set_excp_state(cpu, POWERPC_EXCP_MCHECK, vector, msr);
>  }
>  
>  bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 5b12cb03c9..7f92606522 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -163,6 +163,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>          immu_idx |= msr & (1 << MSR_IS) ? 2 : 0;
>          dmmu_idx |= msr & (1 << MSR_DS) ? 2 : 0;
>      } else {
> +        /* Could have nested IDX instead of HV to avoid tlb flush on nested enter/exit? */

Sounds like a good idea. However I don't know enough about softmmu stuff
to point a direction here.

>          dmmu_idx |= msr & (1ull << MSR_HV) ? 4 : 0;
>          immu_idx = dmmu_idx;
>          immu_idx |= msr & (1 << MSR_IR) ? 0 : 2;

