Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2C4B077C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:49:29 +0100 (CET)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI4Cl-0000vb-UL
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3L8-0005aP-Be; Thu, 10 Feb 2022 01:54:03 -0500
Received: from [2607:f8b0:4864:20::102e] (port=45819
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3L4-00049n-AX; Thu, 10 Feb 2022 01:54:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso123765pjl.4; 
 Wed, 09 Feb 2022 22:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ndrrw9aPcFDv+aHFaB0mNA/AYk6IqIA7lJX3zyKo2ug=;
 b=qfSC86YuOlWuoVo7dNFOcckFFx5n1+d1MeasNPiFAIGXRMrLYXhkI6LgmF8/931QLc
 9YIxinvaIjIR76OqWOoimI/eA3IWkPNH9F4fmwA5wDNwddcH1bp5r3VLudYUVDv5PGy9
 lNB3+nMdnlRaga7aSb/tr2eoYVcdVUvJKIGxPBjK1aXszHr9Y3E5gh5c5tloxL2v7ULr
 DWLIAWW/OqykHRhQJMnIZzMCQN2eSvyatpl2z3HMUHu5XKuqvtu2xjHj8/3gaTB0WRK7
 B5Ui0GRwt9XzqTt3TB6VZ6k6rcEkEqe/mw3CVa/7yY8q4Jat0RXbBXZDEH+3mWyBkd4/
 WSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ndrrw9aPcFDv+aHFaB0mNA/AYk6IqIA7lJX3zyKo2ug=;
 b=LoB5vkQ9ifuvAUiO3sM9LK8O1TDJX/4EtqRMSRlfOpjY8w6x2CMGYD9nR6QGz5otC3
 TfIWG+O7jdsDpV+JHKbtLqN8DaNWGQ9xY+CrYI+YrCv2Xw0tr+QYoR+Xi1VgCxI45uG9
 HdRvcmeKLKZu3i8zXA2vWSIWFoNgE6v/yPhiNqPz99+ruAGVImSiC9PFe64g0WA+CZmB
 meum+Xdu5ayghQHXx/6XK2EHlEO5vAUHpNLkvc4Aia1MuPU3cT8yRE4jB8FSWClzqgkI
 6H/YXIQBbsy6O3osfzH/6I3bsaQHEs2V0nv6mRCiHM7lc6EEyVt3pOTNhNBD9/nw36zD
 a/+A==
X-Gm-Message-State: AOAM533RPXrg64NGU+LHaZTaxgRrWBo37UdU6gcsfIPRNR4kXNk+d+lA
 4SLpwDueQGaXpvUXncaBzH6JR2iuM0A=
X-Google-Smtp-Source: ABdhPJygiwLzs59IJHhgTqMwREp3MDUv8M1Tm/Ob4NMHnRODdB1IZ4BPtdZLWprKlTgNr2tXfuRCMQ==
X-Received: by 2002:a17:902:ec83:: with SMTP id
 x3mr6044813plg.153.1644476035664; 
 Wed, 09 Feb 2022 22:53:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (121-44-67-214.tpgi.com.au. [121.44.67.214])
 by smtp.gmail.com with ESMTPSA id mw14sm1147729pjb.6.2022.02.09.22.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:53:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 3/3] spapr: implement nested-hv support for the TCG
 virtual hypervisor
Date: Thu, 10 Feb 2022 16:53:40 +1000
Message-Id: <20220210065340.1276367-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220210065340.1276367-1-npiggin@gmail.com>
References: <20220210065340.1276367-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This implements the nested-hv hcall API for spapr under TCG.
It's still a bit rough around the edges, concept seems to work.

Some HV exceptions can be raised now in the TCG spapr machine when
running a nested guest. The main ones are the lev==1 syscall, the
hdecr, hdsi and hisi, and h_virt external interrupts. These are
dealt with in the interrupt delivery code by noticing MSR[HV] raised
and instead of switching the machine to HV mode, it exits the
H_ENTER_NESTED hcall with the interrupt vector as return value as
required by the hcall API.

Address translation is provided by the 2-level page table walker
that is implemented for the pnv machine. The partition scope page
table is pointed to the L1's partition scope, and a few tests have
to take into account that nested-hv translations are 2-level. This
could perhaps be tidied up a bit e.g., with a 'bool two_level = ...'
but it's surprisingly little code.

There is no TLB tagging between L1 and L2 translations at the moment
so the TLB is flushed on any L1<->L2 transition (hcall entry and exit).

XXX: stop doing atomic RC on page table walks (not for nested but in general)

not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/ppc.c               |  20 +++
 hw/ppc/spapr.c             |  16 ++
 hw/ppc/spapr_caps.c        |   5 +-
 hw/ppc/spapr_hcall.c       | 316 +++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc.h       |   3 +
 include/hw/ppc/spapr.h     |  75 ++++++++-
 target/ppc/cpu.h           |   6 +
 target/ppc/excp_helper.c   |  60 ++++---
 target/ppc/helper_regs.c   |   1 +
 target/ppc/mmu-book3s-v3.c |  20 ++-
 target/ppc/mmu-radix64.c   |  15 +-
 11 files changed, 499 insertions(+), 38 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index a7c262db93..135900a6f4 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+void cpu_ppc_hdecr_init (CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    assert(env->tb_env->hdecr_timer == NULL);
+
+    env->tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
+                                                 cpu);
+}
+
+void cpu_ppc_hdecr_exit (CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    timer_free(env->tb_env->hdecr_timer);
+    env->tb_env->hdecr_timer = NULL;
+
+    cpu_ppc_hdecr_lower(cpu);
+}
+
 /* Specific helpers for POWER & PowerPC 601 RTC */
 void cpu_ppc601_store_rtcu (CPUPPCState *env, uint32_t value)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3d6ec309dd..f0c3f726f2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1273,6 +1273,8 @@ static void emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
     if (msr_pr) {
         hcall_dprintf("Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
+    } else if (env->gpr[3] == KVMPPC_H_ENTER_NESTED) {
+        spapr_enter_nested(cpu);
     } else {
         env->gpr[3] = spapr_hypercall(cpu, env->gpr[3], &env->gpr[4]);
     }
@@ -4465,6 +4467,17 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
     return NULL;
 }
 
+static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
+{
+    return cpu->in_spapr_nested;
+}
+
+static target_ulong spapr_get_nested_ptcr(PowerPCCPU *cpu, target_ulong lpid)
+{
+        SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+        return spapr->nested_ptcr;
+}
+
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
 {
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
@@ -4573,6 +4586,9 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     fwc->get_dev_path = spapr_get_fw_dev_path;
     nc->nmi_monitor_handler = spapr_nmi;
     smc->phb_placement = spapr_phb_placement;
+    vhc->cpu_in_nested = spapr_cpu_in_nested;
+    vhc->get_nested_ptcr = spapr_get_nested_ptcr;
+    vhc->exit_nested = spapr_exit_nested;
     vhc->hypercall = emulate_spapr_hypercall;
     vhc->hpt_mask = spapr_hpt_mask;
     vhc->map_hptes = spapr_map_hptes;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index ed7c077a0d..a665245f6f 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -450,10 +450,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
         return;
     }
 
-    if (tcg_enabled()) {
-        error_setg(errp, "No Nested KVM-HV support in TCG");
-        error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
-    } else if (kvm_enabled()) {
+    if (!tcg_enabled()) {
         if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
             error_setg(errp, "Nested KVM-HV only supported on POWER9");
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 222c1b6bbd..8ffb13ada0 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -9,6 +9,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "helper_regs.h"
+#include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "mmu-hash64.h"
@@ -1497,6 +1498,317 @@ static void hypercall_register_softmmu(void)
 }
 #endif
 
+/* TCG only */
+#define PRTS_MASK      0x1f
+
+static target_ulong h_set_ptbl(PowerPCCPU *cpu,
+                               SpaprMachineState *spapr,
+                               target_ulong opcode,
+                               target_ulong *args)
+{
+    target_ulong ptcr = args[0];
+
+    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
+        return H_FUNCTION;
+    }
+
+    if ((ptcr & PRTS_MASK) + 12 - 4 > 12) {
+        return H_PARAMETER;
+    }
+
+    spapr->nested_ptcr = ptcr; /* Save new partition table */
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
+                               SpaprMachineState *spapr,
+                               target_ulong opcode,
+                               target_ulong *args)
+{
+    CPUState *cs = CPU(cpu);
+
+    /*
+     * The spapr virtual hypervisor nested HV implementation retains no
+     * translation state except for TLB. This might be optimised to
+     * invalidate fewer entries, but at the moment it's not important
+     * because L1<->L2 transitions always flush the entire TLB for now.
+     */
+    tlb_flush(cs);
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
+                               SpaprMachineState *spapr,
+                               target_ulong opcode,
+                               target_ulong *args)
+{
+    /*
+     * This HCALL is not required, L1 KVM will take a slow path and walk the
+     * page tables manually to do the data copy.
+     */
+    return H_FUNCTION;
+}
+
+void spapr_enter_nested(PowerPCCPU *cpu)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong hv_ptr = env->gpr[4];
+    target_ulong regs_ptr = env->gpr[5];
+    target_ulong hdec, now = cpu_ppc_load_tbl(env);
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_hv_guest_state hv_state;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint32_t cr;
+    int i;
+
+    if (cpu->in_spapr_nested) {
+        env->gpr[3] = H_FUNCTION;
+        return;
+    }
+    if (spapr->nested_ptcr == 0) {
+        env->gpr[3] = H_NOT_AVAILABLE;
+        return;
+    }
+
+    len = sizeof(*hvstate);
+    hvstate = cpu_physical_memory_map(hv_ptr, &len, true);
+    if (!hvstate || len != sizeof(*hvstate)) {
+        env->gpr[3] = H_PARAMETER;
+        return;
+    }
+
+    memcpy(&hv_state, hvstate, len);
+
+    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access len */);
+
+    if (hv_state.version != HV_GUEST_STATE_VERSION) {
+        env->gpr[3] = H_PARAMETER;
+        return;
+    }
+
+    cpu->nested_host_state = g_try_malloc(sizeof(CPUPPCState));
+    if (!cpu->nested_host_state) {
+        env->gpr[3] = H_NO_MEM;
+        return;
+    }
+
+    memcpy(cpu->nested_host_state, env, sizeof(CPUPPCState));
+
+    len = sizeof(*regs);
+    regs = cpu_physical_memory_map(regs_ptr, &len, true);
+    if (!regs || len != sizeof(*regs)) {
+        g_free(cpu->nested_host_state);
+        env->gpr[3] = H_P2;
+        return;
+    }
+
+    len = sizeof(env->gpr);
+    assert(len == sizeof(regs->gpr));
+    memcpy(env->gpr, regs->gpr, len);
+
+    env->lr = regs->link;
+    env->ctr = regs->ctr;
+    cpu_write_xer(env, regs->xer);
+
+    cr = regs->ccr;
+    for (i = 7; i >= 0; i--) {
+        env->crf[i] = cr & 15;
+        cr >>= 4;
+    }
+
+    env->msr = regs->msr;
+    env->nip = regs->nip;
+
+    cpu_physical_memory_unmap(regs, len, 0 /* read */, len /* access len */);
+
+    env->cfar = hv_state.cfar;
+
+    assert(env->spr[SPR_LPIDR] == 0);
+    env->spr[SPR_LPCR] = hv_state.lpcr & pcc->lpcr_mask; // XXX any other mask?
+    env->spr[SPR_LPIDR] = hv_state.lpid;
+    env->spr[SPR_PCR] = hv_state.pcr;
+//    env->spr[SPR_AMOR] = hv_state.amor;
+    env->spr[SPR_DPDES] = hv_state.dpdes;
+    env->spr[SPR_HFSCR] = hv_state.hfscr;
+    hdec = hv_state.hdec_expiry - now;
+    env->tb_env->tb_offset += hv_state.tb_offset; // XXX how to deal?
+    // dec already set
+//  DAWRetc, CIABR, [S]PURR, IC
+    env->spr[SPR_VTB] = hv_state.vtb;
+//    env->spr[SPR_HEIR] = hv_state.heir;
+    env->spr[SPR_SRR0] = hv_state.srr0;
+    env->spr[SPR_SRR1] = hv_state.srr1;
+    env->spr[SPR_SPRG0] = hv_state.sprg[0];
+    env->spr[SPR_SPRG1] = hv_state.sprg[1];
+    env->spr[SPR_SPRG2] = hv_state.sprg[2];
+    env->spr[SPR_SPRG3] = hv_state.sprg[3];
+    env->spr[SPR_BOOKS_PID] = hv_state.pidr;
+    env->spr[SPR_PPR] = hv_state.ppr;
+
+    cpu_ppc_hdecr_init(env);
+    cpu_ppc_store_hdecr(env, hdec);
+
+    /*
+     * The hv_state.vcpu_token is not needed. It is used by the KVM
+     * implementation to remember which L2 vCPU last ran on which physical
+     * CPU so as to invalidate process scope translations if it is moved
+     * between physical CPUs. For now TLBs are always flushed on L1<->L2
+     * transitions so this is not a problem.
+     *
+     * Could validate that the same vcpu_token does not attempt to run on
+     * different L1 vCPUs at the same time, but that would be a L1 KVM bug
+     * and it's not obviously worth a new data structure to do it.
+     */
+
+    cpu->in_spapr_nested = true;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+}
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    target_ulong r3_return = env->excp_vectors[excp]; // hcall return value
+    target_ulong hv_ptr = cpu->nested_host_state->gpr[4];
+    target_ulong regs_ptr = cpu->nested_host_state->gpr[5];
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    int i;
+
+    assert(cpu->in_spapr_nested);
+    cpu->in_spapr_nested = false;
+
+    cpu_ppc_hdecr_exit(env);
+
+    len = sizeof(*hvstate);
+    hvstate = cpu_physical_memory_map(hv_ptr, &len, true);
+    if (!hvstate || len != sizeof(*hvstate)) {
+        r3_return = H_PARAMETER;
+        goto out_restore_l1;
+    }
+
+    //XXX check linux kvm nested CTRL reg bug?
+    //
+    env->tb_env->tb_offset -= hvstate->tb_offset;
+
+    hvstate->cfar = env->cfar;
+    hvstate->lpcr = env->spr[SPR_LPCR];
+    hvstate->pcr = env->spr[SPR_PCR];
+//    hvstate->amor = env->spr[SPR_AMOR];
+    hvstate->dpdes = env->spr[SPR_DPDES];
+    hvstate->hfscr = env->spr[SPR_HFSCR];
+//    hvstate-> = // dec already set
+//  DAWRetc, CIABR, [S]PURR, IC
+    hvstate->vtb = env->spr[SPR_VTB];
+
+    if (excp == POWERPC_EXCP_HDSI) {
+        hvstate->hdar = env->spr[SPR_HDAR];
+        hvstate->hdsisr = env->spr[SPR_HDSISR];
+        hvstate->asdr = env->spr[SPR_ASDR];
+    } else if (excp == POWERPC_EXCP_HISI) {
+        hvstate->asdr = env->spr[SPR_ASDR];
+    }
+
+//    hvstate->heir = env->spr[SPR_HEIR]; XXX HEIR?
+    hvstate->srr0 = env->spr[SPR_SRR0];
+    hvstate->srr1 = env->spr[SPR_SRR1];
+    hvstate->sprg[0] = env->spr[SPR_SPRG0];
+    hvstate->sprg[1] = env->spr[SPR_SPRG1];
+    hvstate->sprg[2] = env->spr[SPR_SPRG2];
+    hvstate->sprg[3] = env->spr[SPR_SPRG3];
+    hvstate->pidr = env->spr[SPR_BOOKS_PID];
+    hvstate->ppr = env->spr[SPR_PPR];
+
+    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access len */);
+
+    len = sizeof(*regs);
+    regs = cpu_physical_memory_map(regs_ptr, &len, true);
+    if (!regs || len != sizeof(*regs)) {
+        r3_return = H_P2;
+        goto out_restore_l1;
+    }
+
+    len = sizeof(env->gpr);
+    assert(len == sizeof(regs->gpr));
+    memcpy(regs->gpr, env->gpr, len);
+
+    regs->link = env->lr;
+    regs->ctr = env->ctr;
+    regs->xer = cpu_read_xer(env);
+
+    regs->ccr = 0;
+    for (i = 0; i < 8; i++) {
+        regs->ccr |= (env->crf[i] & 15) << (4 * (7 - i));
+    }
+
+    if (excp == POWERPC_EXCP_MCHECK ||
+        excp == POWERPC_EXCP_RESET ||
+        excp == POWERPC_EXCP_SYSCALL) {
+        regs->nip = env->spr[SPR_SRR0];
+        regs->msr = env->spr[SPR_SRR1];
+    } else {
+        regs->nip = env->spr[SPR_HSRR0];
+        regs->msr = env->spr[SPR_HSRR1];
+    }
+    // XXX must msr be masked?
+
+    cpu_physical_memory_unmap(regs, len, 0 /* read */, len /* access len */);
+
+out_restore_l1:
+    memcpy(env->gpr, cpu->nested_host_state->gpr, sizeof(env->gpr));
+    env->lr = cpu->nested_host_state->lr;
+    env->ctr = cpu->nested_host_state->ctr;
+    memcpy(env->crf, cpu->nested_host_state->crf, sizeof(env->crf));
+    env->cfar = cpu->nested_host_state->cfar;
+    env->xer = cpu->nested_host_state->xer;
+    env->so = cpu->nested_host_state->so;
+    env->ov = cpu->nested_host_state->ov;
+    env->ov32 = cpu->nested_host_state->ov32;
+    env->ca32 = cpu->nested_host_state->ca32;
+    env->msr = cpu->nested_host_state->msr;
+    env->nip = cpu->nested_host_state->nip;
+
+    assert(env->spr[SPR_LPIDR] != 0);
+    env->spr[SPR_LPCR] = cpu->nested_host_state->spr[SPR_LPCR];
+    env->spr[SPR_LPIDR] = cpu->nested_host_state->spr[SPR_LPIDR];
+    env->spr[SPR_PCR] = cpu->nested_host_state->spr[SPR_PCR];
+//    env->spr[SPR_AMOR] = cpu->nested_host_state->spr[SPR_AMOR];
+    env->spr[SPR_DPDES] = 0;
+    env->spr[SPR_HFSCR] = cpu->nested_host_state->spr[SPR_HFSCR];
+//  DAWRetc, CIABR, [S]PURR, IC
+    env->spr[SPR_VTB] = cpu->nested_host_state->spr[SPR_VTB];
+//    env->spr[SPR_HEIR] = hv_state.heir;
+    env->spr[SPR_SRR0] = cpu->nested_host_state->spr[SPR_SRR0];
+    env->spr[SPR_SRR1] = cpu->nested_host_state->spr[SPR_SRR1];
+    env->spr[SPR_SPRG0] = cpu->nested_host_state->spr[SPR_SPRG0];
+    env->spr[SPR_SPRG1] = cpu->nested_host_state->spr[SPR_SPRG1];
+    env->spr[SPR_SPRG2] = cpu->nested_host_state->spr[SPR_SPRG2];
+    env->spr[SPR_SPRG3] = cpu->nested_host_state->spr[SPR_SPRG3];
+    env->spr[SPR_BOOKS_PID] = cpu->nested_host_state->spr[SPR_BOOKS_PID];
+    env->spr[SPR_PPR] = cpu->nested_host_state->spr[SPR_PPR];
+
+    g_free(cpu->nested_host_state);
+    cpu->nested_host_state = NULL;
+
+    /*
+     * Return the interrupt vector address from H_ENTER_NESTED to the L1
+     * (or error code).
+     */
+    env->gpr[3] = r3_return;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+}
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
@@ -1552,6 +1864,10 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
+
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 93e614cffd..fcf9e495a0 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,9 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_hdecr_init (CPUPPCState *env);
+void cpu_ppc_hdecr_exit (CPUPPCState *env);
+
 /* Embedded PowerPC DCR management */
 typedef uint32_t (*dcr_read_cb)(void *opaque, int dcrn);
 typedef void (*dcr_write_cb)(void *opaque, int dcrn, uint32_t val);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ee7504b976..3a9fa4c024 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -197,6 +197,9 @@ struct SpaprMachineState {
     bool has_graphics;
     uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
 
+    /* Nested HV support (TCG only) */
+    uint64_t nested_ptcr;
+
     Notifier epow_notifier;
     QTAILQ_HEAD(, SpaprEventLogEntry) pending_events;
     bool use_hotplug_event_source;
@@ -577,7 +580,14 @@ struct SpaprMachineState {
 #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
 /* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
 #define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
-#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
+
+/* Platform-specific hcalls used for nested HV KVM */
+#define KVMPPC_H_SET_PARTITION_TABLE   (KVMPPC_HCALL_BASE + 0x800)
+#define KVMPPC_H_ENTER_NESTED          (KVMPPC_HCALL_BASE + 0x804)
+#define KVMPPC_H_TLB_INVALIDATE        (KVMPPC_HCALL_BASE + 0x808)
+#define KVMPPC_H_COPY_TOFROM_GUEST     (KVMPPC_HCALL_BASE + 0x80C)
+
+#define KVMPPC_HCALL_MAX        KVMPPC_H_COPY_TOFROM_GUEST
 
 /*
  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
@@ -587,6 +597,65 @@ struct SpaprMachineState {
 #define SVM_H_TPM_COMM              0xEF10
 #define SVM_HCALL_MAX               SVM_H_TPM_COMM
 
+/*
+ * Register state for entering a nested guest with H_ENTER_NESTED.
+ * New member must be added at the end.
+ */
+struct kvmppc_hv_guest_state {
+    uint64_t version;        /* version of this structure layout, must be first */
+    uint32_t lpid;
+    uint32_t vcpu_token;
+    /* These registers are hypervisor privileged (at least for writing) */
+    uint64_t lpcr;
+    uint64_t pcr;
+    uint64_t amor;
+    uint64_t dpdes;
+    uint64_t hfscr;
+    int64_t tb_offset;
+    uint64_t dawr0;
+    uint64_t dawrx0;
+    uint64_t ciabr;
+    uint64_t hdec_expiry;
+    uint64_t purr;
+    uint64_t spurr;
+    uint64_t ic;
+    uint64_t vtb;
+    uint64_t hdar;
+    uint64_t hdsisr;
+    uint64_t heir;
+    uint64_t asdr;
+    /* These are OS privileged but need to be set late in guest entry */
+    uint64_t srr0;
+    uint64_t srr1;
+    uint64_t sprg[4];
+    uint64_t pidr;
+    uint64_t cfar;
+    uint64_t ppr;
+    /* Version 1 ends here */
+    uint64_t dawr1;
+    uint64_t dawrx1;
+    /* Version 2 ends here */
+};
+
+/* Latest version of hv_guest_state structure */
+#define HV_GUEST_STATE_VERSION  2
+
+/* 64-bit powerpc pt_regs struct used by nested HV */
+struct kvmppc_pt_regs {
+    uint64_t gpr[32];
+    uint64_t nip;
+    uint64_t msr;
+    uint64_t orig_gpr3;    /* Used for restarting system calls */
+    uint64_t ctr;
+    uint64_t link;
+    uint64_t xer;
+    uint64_t ccr;
+    uint64_t softe;        /* Soft enabled/disabled */
+    uint64_t trap;         /* Reason for being here */
+    uint64_t dar;          /* Fault registers */
+    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
+    uint64_t result;       /* Result of a system call */
+};
 
 typedef struct SpaprDeviceTreeUpdateHeader {
     uint32_t version_id;
@@ -604,6 +673,10 @@ typedef target_ulong (*spapr_hcall_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
 void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
+
+void spapr_enter_nested(PowerPCCPU *cpu);
+void spapr_exit_nested(PowerPCCPU *cpu, int excp);
+
 target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                          target_ulong shift);
 target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu, SpaprMachineState *spapr,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index dcd83b503c..1806a8e776 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1306,6 +1306,9 @@ struct PowerPCCPU {
     bool pre_2_10_migration;
     bool pre_3_0_migration;
     int32_t mig_slb_nr;
+
+    bool in_spapr_nested;
+    CPUPPCState *nested_host_state;
 };
 
 
@@ -1316,6 +1319,9 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
 #ifndef CONFIG_USER_ONLY
 struct PPCVirtualHypervisorClass {
     InterfaceClass parent;
+    bool (*cpu_in_nested)(PowerPCCPU *cpu);
+    target_ulong (*get_nested_ptcr)(PowerPCCPU *cpu, target_ulong lpid);
+    void (*exit_nested)(PowerPCCPU *cpu, int excp);
     void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     hwaddr (*hpt_mask)(PPCVirtualHypervisor *vhyp);
     const ppc_hash_pte64_t *(*map_hptes)(PPCVirtualHypervisor *vhyp,
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c107953dec..239c253dbc 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -361,8 +361,8 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 #endif
 }
 
-static void powerpc_set_excp_state(PowerPCCPU *cpu,
-                                          target_ulong vector, target_ulong msr)
+static void powerpc_set_excp_state(PowerPCCPU *cpu, int excp,
+                                   target_ulong vector, target_ulong msr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -375,9 +375,17 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might need
      * to do.
      */
-    env->msr = msr & env->msr_mask;
-    hreg_compute_hflags(env);
-    env->nip = vector;
+    if (cpu->vhyp && cpu->in_spapr_nested && (msr & MSR_HVB)) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        // Deliver interrupt to L1 by returning from the H_ENTER_NESTED call
+        vhc->exit_nested(cpu, excp);
+    } else {
+        env->nip = vector;
+        env->msr = msr & env->msr_mask;
+        hreg_compute_hflags(env);
+    }
+
     /* Reset exception state */
     cs->exception_index = POWERPC_EXCP_NONE;
     env->error_code = 0;
@@ -548,7 +556,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     /* Save MSR */
     env->spr[srr1] = msr;
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_set_excp_state(cpu, excp, vector, new_msr);
 }
 
 static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
@@ -742,7 +750,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     /* Save MSR */
     env->spr[SPR_SRR1] = msr;
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_set_excp_state(cpu, excp, vector, new_msr);
 }
 
 #ifdef TARGET_PPC64
@@ -916,7 +924,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         env->nip += 4;
 
         /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
+        if ((lev == 1) && cpu->vhyp && !cpu->in_spapr_nested) {
             PPCVirtualHypervisorClass *vhc =
                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
             vhc->hypercall(cpu->vhyp, cpu);
@@ -1004,18 +1012,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1037,7 +1033,19 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     /* This can update new_msr and vector if AIL applies */
     ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_set_excp_state(cpu, excp, vector, new_msr);
+
+    /* Sanity check */
+    if (!(env->msr_mask & MSR_HVB)) {
+        if (env->msr & MSR_HVB) {
+            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
+                      "no HV support\n", excp);
+        }
+        if (0 && srr0 == SPR_HSRR0) {
+            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                      "no HV support\n", excp);
+        }
+    }
 }
 #else
 static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
@@ -1517,7 +1525,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
     /* This can update new_msr and vector if AIL applies */
     ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
 
-    powerpc_set_excp_state(cpu, vector, new_msr);
+    powerpc_set_excp_state(cpu, excp, vector, new_msr);
 }
 
 static void powerpc_excp(PowerPCCPU *cpu, int excp)
@@ -1613,7 +1621,11 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* HEIC blocks delivery to the hypervisor */
         if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
             (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
-            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            if (cpu->in_spapr_nested) {
+                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+            } else {
+                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+            }
             return;
         }
     }
@@ -1723,7 +1735,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
         msr |= (1ULL << MSR_LE);
     }
 
-    powerpc_set_excp_state(cpu, vector, msr);
+    powerpc_set_excp_state(cpu, POWERPC_EXCP_MCHECK, vector, msr);
 }
 
 bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 5b12cb03c9..7f92606522 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -163,6 +163,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
         immu_idx |= msr & (1 << MSR_IS) ? 2 : 0;
         dmmu_idx |= msr & (1 << MSR_DS) ? 2 : 0;
     } else {
+        /* Could have nested IDX instead of HV to avoid tlb flush on nested enter/exit? */
         dmmu_idx |= msr & (1ull << MSR_HV) ? 4 : 0;
         immu_idx = dmmu_idx;
         immu_idx |= msr & (1 << MSR_IR) ? 0 : 2;
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index f4985bae78..0810be3668 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -25,8 +25,23 @@
 
 bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
 {
-    uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
-    uint64_t pats = cpu->env.spr[SPR_PTCR] & PTCR_PATS;
+    uint64_t patb, pats;
+
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        target_ulong nested_ptcr;
+
+        assert(cpu->in_spapr_nested);
+
+        nested_ptcr = vhc->get_nested_ptcr(cpu, lpid);
+
+        patb = nested_ptcr & PTCR_PATB;
+        pats = nested_ptcr & PTCR_PATS;
+    } else {
+        patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
+        pats = cpu->env.spr[SPR_PTCR] & PTCR_PATS;
+    }
 
     /* Calculate number of entries */
     pats = 1ull << (pats + 12 - 4);
@@ -38,5 +53,6 @@ bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
     patb += 16 * lpid;
     entry->dw0 = ldq_phys(CPU(cpu)->as, patb);
     entry->dw1 = ldq_phys(CPU(cpu)->as, patb + 8);
+
     return true;
 }
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 54fb3ce98d..6304a23d05 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -304,7 +304,7 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     if (!(pate->dw0 & PATE0_HR)) {
         return false;
     }
-    if (lpid == 0 && !msr_hv) {
+    if (lpid == 0 && (!msr_hv && !(cpu->vhyp && cpu->in_spapr_nested))) {
         return false;
     }
     if ((pate->dw0 & PATE1_R_PRTS) < 5) {
@@ -336,6 +336,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
                   g_raddr);
 
     *h_page_size = PRTBE_R_GET_RTS(pate.dw0);
+
     /* No valid pte or access denied due to protection */
     if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
                               pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
@@ -389,7 +390,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     }
     prtbe_addr = (pate.dw1 & PATE1_R_PRTB) + offset;
 
-    if (cpu->vhyp) {
+    if (cpu->vhyp && !cpu->in_spapr_nested) {
         prtbe0 = ldq_phys(cs->as, prtbe_addr);
     } else {
         /*
@@ -415,7 +416,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     *g_page_size = PRTBE_R_GET_RTS(prtbe0);
     base_addr = prtbe0 & PRTBE_R_RPDB;
     nls = prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || cpu->vhyp) {
+    if (msr_hv || (cpu->vhyp && !cpu->in_spapr_nested)) {
         /*
          * Can treat process table addresses as real addresses
          */
@@ -519,7 +520,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     relocation = !mmuidx_real(mmu_idx);
 
     /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
+    if (!relocation && (mmuidx_hv(mmu_idx) || (cpu->vhyp && !cpu->in_spapr_nested))) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
         *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
 
@@ -553,7 +554,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     }
 
     /* Get Process Table */
-    if (cpu->vhyp) {
+    if (cpu->vhyp && !cpu->in_spapr_nested) {
         PPCVirtualHypervisorClass *vhc;
         vhc = PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
         vhc->get_pate(cpu->vhyp, &pate);
@@ -596,7 +597,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
         g_raddr = eaddr & R_EADDR_MASK;
     }
 
-    if (cpu->vhyp) {
+    if (cpu->vhyp && !cpu->in_spapr_nested) {
         *raddr = g_raddr;
     } else {
         /*
@@ -604,7 +605,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
          * quadrants 1 or 2. Translates a guest real address to a host
          * real address.
          */
-        if (lpid || !mmuidx_hv(mmu_idx)) {
+        if (lpid || !mmuidx_hv(mmu_idx) || cpu->in_spapr_nested) {
             int ret;
 
             ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
-- 
2.23.0


