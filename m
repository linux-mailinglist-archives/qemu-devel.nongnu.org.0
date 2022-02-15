Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16204B619B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:28:02 +0100 (CET)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoVV-0007cU-Lr
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:28:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoLA-0007NI-Li; Mon, 14 Feb 2022 22:17:20 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36410
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL7-0002jC-Ob; Mon, 14 Feb 2022 22:17:20 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1319714pjd.1; 
 Mon, 14 Feb 2022 19:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9hGl0PztDUKk/ldqillufukdnG/8A8jN1qvkcS83/I=;
 b=jW04lSFqhfrmcNgev6Th8rffzjOt+G4cLHykUYXcD+4lPjsklOTbyPHZVojvdbRIRY
 KsxaO6K/KBZum7Qp7F0HsiMuPuznIaJsuzibV5g6oTZrQoAUe1i6uTyUYeCdPsrNTvE9
 /k+dTjzPApWPMChzPrtWi6PPomjYoX9Ob8b6G4rXISufozVUnIvuYV7fUhgmW3GvOTTQ
 usPykT9FDJ7vxI0viNhxk8athKbpQWPkDkzjjKOj+xHcNqtt6ySV+tulF3e0WKSnh3cV
 xdPfFQfG0S9IT/WzUJFwCWEHkQCmX60KbSXLJqMAl3P+BoOrM71f8Giyux5Vf7UEWf47
 A6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9hGl0PztDUKk/ldqillufukdnG/8A8jN1qvkcS83/I=;
 b=fzCigYjHI9tYuiTfd37gkydZihlN+yWTc5ip7vtRMClFdPrmaPE8n5zQtUCIyGf0Yn
 NUWAucKFSH7YEqDj9CO0Mda4CQnzaUDGIptp1qVXqkzyfcKuomby6Y8FWVq3mqNEohsa
 WCICdloQIGlzXpXJgTWV31OcRbRPtgS+LoVMhbCm6dmIcAMPlHh9mHLtiYLgk0wO4SDB
 HABrUuvE5zjz4KLsja62pb1aMWcU2F0QIlM9/MfR/+XDltFSdI1zqRFJsyWtsa7Er2Mu
 PUGm3IpcZJi+hMQm6nhtij/7oEmK1ifN5i+EL2z5MtgIb3gMW1d9tHa7Y+8ULFylWtLK
 2IGA==
X-Gm-Message-State: AOAM533bV2WqbuQugUMgfR7AQuq5VH3V9kkSrQleQZq/KRqGx5GdndBE
 nOdHYuAFcJngNT5orrIG4unw2m7eSwM=
X-Google-Smtp-Source: ABdhPJyi5FAYqXo5XoiT3sa/Oo80WySVDapWutJ/ZfeEks9dJkr6bF/4jjoxanHrD9DNFVI1K6WsYA==
X-Received: by 2002:a17:902:f645:: with SMTP id
 m5mr1968144plg.56.1644895035808; 
 Mon, 14 Feb 2022 19:17:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 9/9] spapr: implement nested-hv capability for the virtual
 hypervisor
Date: Tue, 15 Feb 2022 13:16:42 +1000
Message-Id: <20220215031642.1691873-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr.c         |  32 +++-
 hw/ppc/spapr_caps.c    |  11 +-
 hw/ppc/spapr_hcall.c   | 321 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  74 +++++++++-
 target/ppc/cpu.h       |   3 +
 5 files changed, 431 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3a5cf92c94..6988e3ec76 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1314,11 +1314,32 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
 
-    assert(lpid == 0);
+    if (!cpu->in_spapr_nested) {
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
@@ -4472,7 +4493,7 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
 
 static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
 {
-    return false;
+    return cpu->in_spapr_nested;
 }
 
 static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
@@ -4584,6 +4605,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = spapr_nmi;
     smc->phb_placement = spapr_phb_placement;
     vhc->cpu_in_nested = spapr_cpu_in_nested;
+    vhc->deliver_hv_excp = spapr_exit_nested;
     vhc->hypercall = emulate_spapr_hypercall;
     vhc->hpt_mask = spapr_hpt_mask;
     vhc->map_hptes = spapr_map_hptes;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 5cc80776d0..4d8bb2ad2c 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -444,19 +444,22 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
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
+        error_setg(errp, "Nested KVM-HV only supported on POWER9 and later");
         error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
-    } else if (kvm_enabled()) {
+    }
+
+    if (kvm_enabled()) {
         if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
-            error_setg(errp, "Nested KVM-HV only supported on POWER9");
+            error_setg(errp, "Nested KVM-HV only supported on POWER9 and later");
             error_append_hint(errp,
                               "Try appending -machine max-cpu-compat=power9\n");
             return;
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 5dec056796..3129fae90d 100644
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
@@ -1500,6 +1501,321 @@ static void hypercall_register_softmmu(void)
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
+    target_ulong hv_ptr = args[0];
+    target_ulong regs_ptr = args[1];
+    target_ulong hdec, now = cpu_ppc_load_tbl(env);
+    target_ulong lpcr, lpcr_mask;
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_hv_guest_state hv_state;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+    uint32_t cr;
+    int i;
+
+    if (cpu->in_spapr_nested) {
+        return H_FUNCTION;
+    }
+    if (spapr->nested_ptcr == 0) {
+        return H_NOT_AVAILABLE;
+    }
+
+    len = sizeof(*hvstate);
+    hvstate = cpu_physical_memory_map(hv_ptr, &len, true);
+    if (!hvstate || len != sizeof(*hvstate)) {
+        return H_PARAMETER;
+    }
+
+    memcpy(&hv_state, hvstate, len);
+
+    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access len */);
+
+    /*
+     * We accept versions 1 and 2. Version 2 fields are unused because TCG
+     * does not implement DAWR*.
+     */
+    if (hv_state.version > HV_GUEST_STATE_VERSION) {
+        return H_PARAMETER;
+    }
+
+    cpu->nested_host_state = g_try_malloc(sizeof(CPUPPCState));
+    if (!cpu->nested_host_state) {
+        return H_NO_MEM;
+    }
+
+    memcpy(cpu->nested_host_state, env, sizeof(CPUPPCState));
+
+    len = sizeof(*regs);
+    regs = cpu_physical_memory_map(regs_ptr, &len, true);
+    if (!regs || len != sizeof(*regs)) {
+        g_free(cpu->nested_host_state);
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
+    cpu_physical_memory_unmap(regs, len, 0 /* read */, len /* access len */);
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
+    env->tb_env->tb_offset += hv_state.tb_offset;
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
+    cpu->in_spapr_nested = true;
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
+    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
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
+    env->tb_env->tb_offset -= hvstate->tb_offset;
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
+        regs->msr = env->spr[SPR_SRR1] & env->msr_mask;
+    } else {
+        regs->nip = env->spr[SPR_HSRR0];
+        regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
+    }
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
+    env->spr[SPR_DPDES] = 0;
+    env->spr[SPR_HFSCR] = cpu->nested_host_state->spr[SPR_HFSCR];
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
+    env->reserve_addr = -1; /* Reset the reservation */
+}
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
@@ -1555,6 +1871,11 @@ static void hypercall_register_types(void)
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
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index d8cc956c97..65c4401130 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1301,6 +1301,9 @@ struct PowerPCCPU {
     bool pre_2_10_migration;
     bool pre_3_0_migration;
     int32_t mig_slb_nr;
+
+    bool in_spapr_nested;
+    CPUPPCState *nested_host_state;
 };
 
 
-- 
2.23.0


