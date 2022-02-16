Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6A4B860C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:42:05 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHl5-0006U2-AX
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHWH-00018x-Vu; Wed, 16 Feb 2022 05:26:47 -0500
Received: from [2607:f8b0:4864:20::102a] (port=39467
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKHWC-0005MO-MT; Wed, 16 Feb 2022 05:26:44 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso6004335pjt.4; 
 Wed, 16 Feb 2022 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XiGq8dpOA34gaUybPGEUHjn1cPOX2rCrgB7/YaDMxog=;
 b=U4EToPbF5vVWd/P5fjsue4oOzYENUkrD0/0wfjfat7OkNvo31L81JJbmOqik7exkPI
 H11irBOsrXaRE6JdsNSqCPF6U8bmwBY4W83KVWvy6PAhFmyskCjGPeBvco5/oBnBgCQX
 zsGlkifA0lZOZDB5SlTqD1wj/iyB0ml7AC3NAMMoFtb7zlgdtA11OEU0GX3sN8vZfjbs
 iXVIXlzjVJ4o2YxAM34DSA79WqY9fH3FIYfL/JP25XLd7Th2//EoSJYjo2l0/paqnGTy
 /D7Jh+NETvMFHs5lGzM7+e1GX8Eg3HSZnS90QsOU4gVw2drpogACE2bYpeATykE3z/jZ
 hjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XiGq8dpOA34gaUybPGEUHjn1cPOX2rCrgB7/YaDMxog=;
 b=PxuAgpg7qDpMKMrsSOIxsFU4DJXjguu2swnYYHn2FecGo9VCGSKSOWdzB67SfDB3hO
 bWB5rd8k07YHnAQhH7e2TW1KvbKcdrEce+ykCwYd5wKINXQZrewFNiLmtwC4pO/vMXPj
 uZPlhwwjYTFvVY/TeY4/qNYd3ilk7fdv9UTpi6L4Hs/rDgycj0ma08XrbBNvQdFDXthu
 7/i/7Oe5OFEIXnazykjtGKjwbxStVc9G7wkkVXNgzeQpRtfJTPHtJAT/Lssh/axM1cy5
 cafwoVeZBFdhizmIJHZ/0eBGqXvX3lj97I2eKSDRfdpCfOeibAtOXjpP+as8MatPFCCm
 wxoA==
X-Gm-Message-State: AOAM5335dXqVimlp2OKz6OdTr3y4aqoabRtFxedyrF4Oir7BZ9JI319E
 G6QFxJ69V3f45UTvStRlEy8TRhPh2+c=
X-Google-Smtp-Source: ABdhPJyktgKZBo8JgAwqQaIzP25QfgCm3AIFsol1Ir3st9Cqjc0bW/wQHbm0ezz9kh7NU+uN0Hq3bw==
X-Received: by 2002:a17:902:ee82:b0:14e:e827:a6f1 with SMTP id
 a2-20020a170902ee8200b0014ee827a6f1mr1779357pld.42.1645007188207; 
 Wed, 16 Feb 2022 02:26:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-225-41.tpgi.com.au.
 [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id j3sm5214474pgs.0.2022.02.16.02.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:26:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 9/9] spapr: implement nested-hv capability for the virtual
 hypervisor
Date: Wed, 16 Feb 2022 20:25:45 +1000
Message-Id: <20220216102545.1808018-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216102545.1808018-1-npiggin@gmail.com>
References: <20220216102545.1808018-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements the Nested KVM HV hcall API for spapr under TCG.

The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
L1 is switched back in returned from the hcall when a HV exception
is sent to the vhyp. Register state is copied in and out according to
the nested KVM HV hcall API specification.

The hdecr timer is started when the L2 is switched in, and it provides
the HDEC / 0x980 return to L1.

The MMU re-uses the bare metal radix 2-level page table walker by
using the get_pate method to point the MMU to the nested partition
table entry. MMU faults due to partition scope errors raise HV
exceptions and accordingly are routed back to the L1.

The MMU does not tag translations for the L1 (direct) vs L2 (nested)
guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
and exit).

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c                  |  37 +++-
 hw/ppc/spapr_caps.c             |  14 +-
 hw/ppc/spapr_hcall.c            | 333 ++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h          |  74 ++++++-
 include/hw/ppc/spapr_cpu_core.h |   5 +
 5 files changed, 452 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6fab70767f..87e68da77f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1270,6 +1270,8 @@ static void emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
     /* The TCG path should also be holding the BQL at this point */
     g_assert(qemu_mutex_iothread_locked());
 
+    g_assert(!vhyp_cpu_in_nested(cpu));
+
     if (msr_pr) {
         hcall_dprintf("Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
@@ -1313,12 +1315,34 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
                            target_ulong lpid, ppc_v3_pate_t *entry)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
 
-    assert(lpid == 0);
+    if (!spapr_cpu->in_nested) {
+        assert(lpid == 0);
 
-    /* Copy PATE1:GR into PATE0:HR */
-    entry->dw0 = spapr->patb_entry & PATE0_HR;
-    entry->dw1 = spapr->patb_entry;
+        /* Copy PATE1:GR into PATE0:HR */
+        entry->dw0 = spapr->patb_entry & PATE0_HR;
+        entry->dw1 = spapr->patb_entry;
+
+    } else {
+        uint64_t patb, pats;
+
+        assert(lpid != 0);
+
+        patb = spapr->nested_ptcr & PTCR_PATB;
+        pats = spapr->nested_ptcr & PTCR_PATS;
+
+        /* Calculate number of entries */
+        pats = 1ull << (pats + 12 - 4);
+        if (pats <= lpid) {
+            return false;
+        }
+
+        /* Grab entry */
+        patb += 16 * lpid;
+        entry->dw0 = ldq_phys(CPU(cpu)->as, patb);
+        entry->dw1 = ldq_phys(CPU(cpu)->as, patb + 8);
+    }
 
     return true;
 }
@@ -4472,7 +4496,9 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
 
 static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
 {
-    return false;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+
+    return spapr_cpu->in_nested;
 }
 
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
@@ -4584,6 +4610,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = spapr_nmi;
     smc->phb_placement = spapr_phb_placement;
     vhc->cpu_in_nested = spapr_cpu_in_nested;
+    vhc->deliver_hv_excp = spapr_exit_nested;
     vhc->hypercall = emulate_spapr_hypercall;
     vhc->hpt_mask = spapr_hpt_mask;
     vhc->map_hptes = spapr_map_hptes;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index e2412aaa57..6d74345930 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -444,19 +444,23 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
 {
     ERRP_GUARD();
     PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    CPUPPCState *env = &cpu->env;
 
     if (!val) {
         /* capability disabled by default */
         return;
     }
 
-    if (tcg_enabled()) {
-        error_setg(errp, "No Nested KVM-HV support in TCG");
+    if (!(env->insns_flags2 & PPC2_ISA300)) {
+        error_setg(errp, "Nested-HV only supported on POWER9 and later");
         error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
-    } else if (kvm_enabled()) {
+        return;
+    }
+
+    if (kvm_enabled()) {
         if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
-            error_setg(errp, "Nested KVM-HV only supported on POWER9");
+            error_setg(errp, "Nested-HV only supported on POWER9 and later");
             error_append_hint(errp,
                               "Try appending -machine max-cpu-compat=power9\n");
             return;
@@ -464,7 +468,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
 
         if (!kvmppc_has_cap_nested_kvm_hv()) {
             error_setg(errp,
-                       "KVM implementation does not support Nested KVM-HV");
+                       "KVM implementation does not support Nested-HV");
             error_append_hint(errp,
                               "Try appending -machine cap-nested-hv=off\n");
         } else if (kvmppc_set_cap_nested_kvm_hv(val) < 0) {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index fa60505315..e183892287 100644
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
@@ -1499,6 +1500,333 @@ static void hypercall_register_softmmu(void)
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
+                                     SpaprMachineState *spapr,
+                                     target_ulong opcode,
+                                     target_ulong *args)
+{
+    /*
+     * The spapr virtual hypervisor nested HV implementation retains no L2
+     * translation state except for TLB. And the TLB is always invalidated
+     * across L1<->L2 transitions, so nothing is required here.
+     */
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
+                                        SpaprMachineState *spapr,
+                                        target_ulong opcode,
+                                        target_ulong *args)
+{
+    /*
+     * This HCALL is not required, L1 KVM will take a slow path and walk the
+     * page tables manually to do the data copy.
+     */
+    return H_FUNCTION;
+}
+
+/*
+ * When this handler returns, the environment is switched to the L2 guest
+ * and TCG begins running that. spapr_exit_nested() performs the switch from
+ * L2 back to L1 and returns from the H_ENTER_NESTED hcall.
+ */
+static target_ulong h_enter_nested(PowerPCCPU *cpu,
+                                   SpaprMachineState *spapr,
+                                   target_ulong opcode,
+                                   target_ulong *args)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong hv_ptr = args[0];
+    target_ulong regs_ptr = args[1];
+    target_ulong hdec, now = cpu_ppc_load_tbl(env);
+    target_ulong lpcr, lpcr_mask;
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_hv_guest_state hv_state;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint64_t cr;
+    int i;
+
+    if (spapr->nested_ptcr == 0) {
+        return H_NOT_AVAILABLE;
+    }
+
+    len = sizeof(*hvstate);
+    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (len != sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, false);
+        return H_PARAMETER;
+    }
+
+    memcpy(&hv_state, hvstate, len);
+
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, false);
+
+    /*
+     * We accept versions 1 and 2. Version 2 fields are unused because TCG
+     * does not implement DAWR*.
+     */
+    if (hv_state.version > HV_GUEST_STATE_VERSION) {
+        return H_PARAMETER;
+    }
+
+    spapr_cpu->nested_host_state = g_try_malloc(sizeof(CPUPPCState));
+    if (!spapr_cpu->nested_host_state) {
+        return H_NO_MEM;
+    }
+
+    memcpy(spapr_cpu->nested_host_state, env, sizeof(CPUPPCState));
+
+    len = sizeof(*regs);
+    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, false,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len != sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, false);
+        g_free(spapr_cpu->nested_host_state);
+        return H_P2;
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
+    address_space_unmap(CPU(cpu)->as, regs, len, len, false);
+
+    env->cfar = hv_state.cfar;
+
+    assert(env->spr[SPR_LPIDR] == 0);
+    env->spr[SPR_LPIDR] = hv_state.lpid;
+
+    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
+    lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
+    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
+    lpcr &= ~LPCR_LPES0;
+    env->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
+
+    env->spr[SPR_PCR] = hv_state.pcr;
+    /* hv_state.amor is not used */
+    env->spr[SPR_DPDES] = hv_state.dpdes;
+    env->spr[SPR_HFSCR] = hv_state.hfscr;
+    hdec = hv_state.hdec_expiry - now;
+    spapr_cpu->nested_tb_offset = hv_state.tb_offset;
+    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
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
+    env->tb_env->tb_offset += spapr_cpu->nested_tb_offset;
+    spapr_cpu->in_nested = true;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+    env->reserve_addr = -1; /* Reset the reservation */
+
+    /*
+     * The spapr hcall helper sets env->gpr[3] to the return value, but at
+     * this point the L1 is not returning from the hcall but rather we
+     * start running the L2, so r3 must not be clobbered, so return env->gpr[3]
+     * to leave it unchanged.
+     */
+    return env->gpr[3];
+}
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
+    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
+    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint64_t cr;
+    int i;
+
+    assert(spapr_cpu->in_nested);
+
+    cpu_ppc_hdecr_exit(env);
+
+    len = sizeof(*hvstate);
+    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (len != sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
+        r3_return = H_PARAMETER;
+        goto out_restore_l1;
+    }
+
+    hvstate->cfar = env->cfar;
+    hvstate->lpcr = env->spr[SPR_LPCR];
+    hvstate->pcr = env->spr[SPR_PCR];
+    hvstate->dpdes = env->spr[SPR_DPDES];
+    hvstate->hfscr = env->spr[SPR_HFSCR];
+
+    if (excp == POWERPC_EXCP_HDSI) {
+        hvstate->hdar = env->spr[SPR_HDAR];
+        hvstate->hdsisr = env->spr[SPR_HDSISR];
+        hvstate->asdr = env->spr[SPR_ASDR];
+    } else if (excp == POWERPC_EXCP_HISI) {
+        hvstate->asdr = env->spr[SPR_ASDR];
+    }
+
+    /* HEIR should be implemented for HV mode and saved here. */
+    hvstate->srr0 = env->spr[SPR_SRR0];
+    hvstate->srr1 = env->spr[SPR_SRR1];
+    hvstate->sprg[0] = env->spr[SPR_SPRG0];
+    hvstate->sprg[1] = env->spr[SPR_SPRG1];
+    hvstate->sprg[2] = env->spr[SPR_SPRG2];
+    hvstate->sprg[3] = env->spr[SPR_SPRG3];
+    hvstate->pidr = env->spr[SPR_BOOKS_PID];
+    hvstate->ppr = env->spr[SPR_PPR];
+
+    /* Is it okay to specify write length larger than actual data written? */
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+
+    len = sizeof(*regs);
+    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len != sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
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
+    cr = 0;
+    for (i = 0; i < 8; i++) {
+        cr |= (env->crf[i] & 15) << (4 * (7 - i));
+    }
+    regs->ccr = cr;
+
+    if (excp == POWERPC_EXCP_MCHECK ||
+        excp == POWERPC_EXCP_RESET ||
+        excp == POWERPC_EXCP_SYSCALL) {
+        regs->nip = env->spr[SPR_SRR0];
+        regs->msr = env->spr[SPR_SRR1] & env->msr_mask;
+    } else {
+        regs->nip = env->spr[SPR_HSRR0];
+        regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
+    }
+
+    /* Is it okay to specify write length larger than actual data written? */
+    address_space_unmap(CPU(cpu)->as, regs, len, len, true);
+
+out_restore_l1:
+    memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
+    env->lr = spapr_cpu->nested_host_state->lr;
+    env->ctr = spapr_cpu->nested_host_state->ctr;
+    memcpy(env->crf, spapr_cpu->nested_host_state->crf, sizeof(env->crf));
+    env->cfar = spapr_cpu->nested_host_state->cfar;
+    env->xer = spapr_cpu->nested_host_state->xer;
+    env->so = spapr_cpu->nested_host_state->so;
+    env->ov = spapr_cpu->nested_host_state->ov;
+    env->ov32 = spapr_cpu->nested_host_state->ov32;
+    env->ca32 = spapr_cpu->nested_host_state->ca32;
+    env->msr = spapr_cpu->nested_host_state->msr;
+    env->nip = spapr_cpu->nested_host_state->nip;
+
+    assert(env->spr[SPR_LPIDR] != 0);
+    env->spr[SPR_LPCR] = spapr_cpu->nested_host_state->spr[SPR_LPCR];
+    env->spr[SPR_LPIDR] = spapr_cpu->nested_host_state->spr[SPR_LPIDR];
+    env->spr[SPR_PCR] = spapr_cpu->nested_host_state->spr[SPR_PCR];
+    env->spr[SPR_DPDES] = 0;
+    env->spr[SPR_HFSCR] = spapr_cpu->nested_host_state->spr[SPR_HFSCR];
+    env->spr[SPR_SRR0] = spapr_cpu->nested_host_state->spr[SPR_SRR0];
+    env->spr[SPR_SRR1] = spapr_cpu->nested_host_state->spr[SPR_SRR1];
+    env->spr[SPR_SPRG0] = spapr_cpu->nested_host_state->spr[SPR_SPRG0];
+    env->spr[SPR_SPRG1] = spapr_cpu->nested_host_state->spr[SPR_SPRG1];
+    env->spr[SPR_SPRG2] = spapr_cpu->nested_host_state->spr[SPR_SPRG2];
+    env->spr[SPR_SPRG3] = spapr_cpu->nested_host_state->spr[SPR_SPRG3];
+    env->spr[SPR_BOOKS_PID] = spapr_cpu->nested_host_state->spr[SPR_BOOKS_PID];
+    env->spr[SPR_PPR] = spapr_cpu->nested_host_state->spr[SPR_PPR];
+
+    /*
+     * Return the interrupt vector address from H_ENTER_NESTED to the L1
+     * (or error code).
+     */
+    env->gpr[3] = r3_return;
+
+    env->tb_env->tb_offset -= spapr_cpu->nested_tb_offset;
+    spapr_cpu->in_nested = false;
+
+    hreg_compute_hflags(env);
+    tlb_flush(cs);
+    env->reserve_addr = -1; /* Reset the reservation */
+
+    g_free(spapr_cpu->nested_host_state);
+    spapr_cpu->nested_host_state = NULL;
+}
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
@@ -1554,6 +1882,11 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
+
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index edbf3eeed0..852fe61b36 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -199,6 +199,9 @@ struct SpaprMachineState {
     bool has_graphics;
     uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
 
+    /* Nested HV support (TCG only) */
+    uint64_t nested_ptcr;
+
     Notifier epow_notifier;
     QTAILQ_HEAD(, SpaprEventLogEntry) pending_events;
     bool use_hotplug_event_source;
@@ -579,7 +582,14 @@ struct SpaprMachineState {
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
@@ -589,6 +599,65 @@ struct SpaprMachineState {
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
+/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
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
@@ -606,6 +675,9 @@ typedef target_ulong (*spapr_hcall_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
 void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
+
+void spapr_exit_nested(PowerPCCPU *cpu, int excp);
+
 target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                          target_ulong shift);
 target_ulong softmmu_resize_hpt_commit(PowerPCCPU *cpu, SpaprMachineState *spapr,
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index dab3dfc76c..b560514560 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -48,6 +48,11 @@ typedef struct SpaprCpuState {
     bool prod; /* not migrated, only used to improve dispatch latencies */
     struct ICPState *icp;
     struct XiveTCTX *tctx;
+
+    /* Fields for nested-HV support */
+    bool in_nested; /* true while the L2 is executing */
+    CPUPPCState *nested_host_state; /* holds the L1 state while L2 executes */
+    int64_t nested_tb_offset; /* L1->L2 TB offset */
 } SpaprCpuState;
 
 static inline SpaprCpuState *spapr_cpu_state(PowerPCCPU *cpu)
-- 
2.23.0


