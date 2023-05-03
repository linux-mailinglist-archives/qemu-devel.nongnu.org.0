Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361216F4E37
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:41:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0Xs-0001Sv-Ji; Tue, 02 May 2023 20:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0Xl-0001SW-DN; Tue, 02 May 2023 20:40:30 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XZ-0006sb-Cq; Tue, 02 May 2023 20:40:28 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so5049469b3a.2; 
 Tue, 02 May 2023 17:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683074415; x=1685666415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5NFS1fVCAm/mEFup1s90e24VASPd4jO2sawzEioSiA=;
 b=Dc+g4ieYPTQXJLMFDUrtAciO1xeJm+myj0sJ6bxGFZQzxim5xLTZY1JBX34YdNELjs
 3nJFLC4B0wyRkSsYJsiSpQOCy4gZVRzF6CwctFZcRnhhhErubqoneCr62JpMFfNbv7Nw
 BL2u+QKyRv7vJDc4QKaa3kBbKUrXmOZgnRn9zSmbz7QnFbH7xPb1C1H+vGkZlOA664O5
 aNPhAOPagjG17tvb0vDMlrU+7uemI+PEQ8JoIdF+ViWZZ3tDAspV/nFBLgrxXzpmptAv
 U4HrlU2XrPpMUr8Vft12Om35Yv8wA0jtAEiM8RZKmTQNG1xPG5p/hMmJnvfXKvCN4opR
 j+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683074415; x=1685666415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5NFS1fVCAm/mEFup1s90e24VASPd4jO2sawzEioSiA=;
 b=cSipDxjZF1uCX5Ya6TRHnLBwdHPx9ZakPpH0Wwu1JhTM79kp9lHMsO6JKBTjzy8/7/
 wEr1yD1PnLoUbtu4XnmGzohoRV/CH/AxeIk+ZKLT0xybnrHRLwH8LpZf/K1uNeE5dVyF
 V8qX/LC/wdc1ex4fnqLcw1kXg2dyCu64l+3UreqWWNT1T3Cf37S2w+4ZUnX515nTXcqp
 Hjv4i0Hu3Mqvlm/zIWiMfwX3gViKKY1hPjmDbgitgjn2lwmTfjgfo7DLuBfYdnJ8cz5b
 GQosStZrHfDu6Lv+is3mfqpKU/8BRRi5zLpFmMF6FaPcdZxSEDw/fEbr5XtNwXMyI7A8
 nX/Q==
X-Gm-Message-State: AC+VfDwMK+nX7zElLKqAyeGmiZqUWgRXDm5DXAUiH0ww9ioh1EHKy+qC
 10g/zIJPmYEBxw2/kayvAXaMpXBZwGPzrQ==
X-Google-Smtp-Source: ACHHUZ6wd8JBsK3mw7XX3aP3KPKDoDbjHfYH0SCtyGogy3m6AHJOqj97xyiiqG771xiCWRwSijm8dw==
X-Received: by 2002:a05:6a20:1442:b0:f3:b7:b10a with SMTP id
 a2-20020a056a20144200b000f300b7b10amr24310907pzi.15.1683074414661; 
 Tue, 02 May 2023 17:40:14 -0700 (PDT)
Received: from wheely.local0.net (118-208-214-188.tpgi.com.au.
 [118.208.214.188]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63db0d000000b0050f7208b4bcsm19332338pgg.89.2023.05.02.17.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:40:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Subject: [RFC PATCH 4/4] spapr: Move spapr nested HV to a new file
Date: Wed,  3 May 2023 10:39:54 +1000
Message-Id: <20230503003954.128188-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503003954.128188-1-npiggin@gmail.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Create spapr_nested.c for the nested HV implementation (modulo small
pieces in MMU and exception handling).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/meson.build     |   1 +
 hw/ppc/spapr_hcall.c   | 429 +----------------------------------
 hw/ppc/spapr_nested.c  | 496 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  61 +----
 4 files changed, 499 insertions(+), 488 deletions(-)
 create mode 100644 hw/ppc/spapr_nested.c

diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index c927337da0..a313d4b964 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -15,6 +15,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_vio.c',
   'spapr_events.c',
   'spapr_hcall.c',
+  'spapr_nested.c',
   'spapr_iommu.c',
   'spapr_rtas.c',
   'spapr_pci.c',
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 783a06ba98..dbdcbb0e9d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1496,444 +1496,17 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
 }
 
 #ifdef CONFIG_TCG
-#define PRTS_MASK      0x1f
-
-static target_ulong h_set_ptbl(PowerPCCPU *cpu,
-                               SpaprMachineState *spapr,
-                               target_ulong opcode,
-                               target_ulong *args)
-{
-    target_ulong ptcr = args[0];
-
-    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
-        return H_FUNCTION;
-    }
-
-    if ((ptcr & PRTS_MASK) + 12 - 4 > 12) {
-        return H_PARAMETER;
-    }
-
-    spapr->nested_ptcr = ptcr; /* Save new partition table */
-
-    return H_SUCCESS;
-}
-
-static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
-                                     SpaprMachineState *spapr,
-                                     target_ulong opcode,
-                                     target_ulong *args)
-{
-    /*
-     * The spapr virtual hypervisor nested HV implementation retains no L2
-     * translation state except for TLB. And the TLB is always invalidated
-     * across L1<->L2 transitions, so nothing is required here.
-     */
-
-    return H_SUCCESS;
-}
-
-static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
-                                        SpaprMachineState *spapr,
-                                        target_ulong opcode,
-                                        target_ulong *args)
-{
-    /*
-     * This HCALL is not required, L1 KVM will take a slow path and walk the
-     * page tables manually to do the data copy.
-     */
-    return H_FUNCTION;
-}
-
-struct nested_ppc_state {
-    uint64_t gpr[32];
-    uint64_t lr;
-    uint64_t ctr;
-    uint64_t cfar;
-    uint64_t msr;
-    uint64_t nip;
-    uint32_t cr;
-
-    uint64_t xer;
-
-    uint64_t lpcr;
-    uint64_t lpidr;
-    uint64_t pidr;
-    uint64_t pcr;
-    uint64_t dpdes;
-    uint64_t hfscr;
-    uint64_t srr0;
-    uint64_t srr1;
-    uint64_t sprg0;
-    uint64_t sprg1;
-    uint64_t sprg2;
-    uint64_t sprg3;
-    uint64_t ppr;
-
-    int64_t tb_offset;
-};
-
-static void nested_save_state(struct nested_ppc_state *save, PowerPCCPU *cpu)
-{
-    CPUPPCState *env = &cpu->env;
-    uint32_t cr;
-    int i;
-
-    memcpy(save->gpr, env->gpr, sizeof(save->gpr));
-
-    save->lr = env->lr;
-    save->ctr = env->ctr;
-    save->cfar = env->cfar;
-    save->msr = env->msr;
-    save->nip = env->nip;
-
-    cr = 0;
-    for (i = 0; i < 8; i++) {
-        cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
-    save->cr = cr;
-
-    save->xer = cpu_read_xer(env);
-
-    save->lpcr = env->spr[SPR_LPCR];
-    save->lpidr = env->spr[SPR_LPIDR];
-    save->pcr = env->spr[SPR_PCR];
-    save->dpdes = env->spr[SPR_DPDES];
-    save->hfscr = env->spr[SPR_HFSCR];
-    save->srr0 = env->spr[SPR_SRR0];
-    save->srr1 = env->spr[SPR_SRR1];
-    save->sprg0 = env->spr[SPR_SPRG0];
-    save->sprg1 = env->spr[SPR_SPRG1];
-    save->sprg2 = env->spr[SPR_SPRG2];
-    save->sprg3 = env->spr[SPR_SPRG3];
-    save->pidr = env->spr[SPR_BOOKS_PID];
-    save->ppr = env->spr[SPR_PPR];
-
-    save->tb_offset = env->tb_env->tb_offset;
-}
-
-static void nested_load_state(PowerPCCPU *cpu, struct nested_ppc_state *load)
-{
-    CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
-    uint32_t cr;
-    int i;
-
-    memcpy(env->gpr, load->gpr, sizeof(env->gpr));
-
-    env->lr = load->lr;
-    env->ctr = load->ctr;
-    env->cfar = load->cfar;
-    env->msr = load->msr;
-    env->nip = load->nip;
-
-    cr = load->cr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
-
-    cpu_write_xer(env, load->xer);
-
-    env->spr[SPR_LPCR] = load->lpcr;
-    env->spr[SPR_LPIDR] = load->lpidr;
-    env->spr[SPR_PCR] = load->pcr;
-    env->spr[SPR_DPDES] = load->dpdes;
-    env->spr[SPR_HFSCR] = load->hfscr;
-    env->spr[SPR_SRR0] = load->srr0;
-    env->spr[SPR_SRR1] = load->srr1;
-    env->spr[SPR_SPRG0] = load->sprg0;
-    env->spr[SPR_SPRG1] = load->sprg1;
-    env->spr[SPR_SPRG2] = load->sprg2;
-    env->spr[SPR_SPRG3] = load->sprg3;
-    env->spr[SPR_BOOKS_PID] = load->pidr;
-    env->spr[SPR_PPR] = load->ppr;
-
-    env->tb_env->tb_offset = load->tb_offset;
-
-    /*
-     * MSR updated, compute hflags and possible interrupts.
-     */
-    hreg_compute_hflags(env);
-    ppc_maybe_interrupt(env);
-
-    /*
-     * Nested HV does not tag TLB entries between L1 and L2, so must
-     * flush on transition.
-     */
-    tlb_flush(cs);
-    env->reserve_addr = -1; /* Reset the reservation */
-}
-
-/*
- * When this handler returns, the environment is switched to the L2 guest
- * and TCG begins running that. spapr_exit_nested() performs the switch from
- * L2 back to L1 and returns from the H_ENTER_NESTED hcall.
- */
-static target_ulong h_enter_nested(PowerPCCPU *cpu,
-                                   SpaprMachineState *spapr,
-                                   target_ulong opcode,
-                                   target_ulong *args)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
-    struct nested_ppc_state l2_state;
-    target_ulong hv_ptr = args[0];
-    target_ulong regs_ptr = args[1];
-    target_ulong hdec, now = cpu_ppc_load_tbl(env);
-    target_ulong lpcr, lpcr_mask;
-    struct kvmppc_hv_guest_state *hvstate;
-    struct kvmppc_hv_guest_state hv_state;
-    struct kvmppc_pt_regs *regs;
-    hwaddr len;
-
-    if (spapr->nested_ptcr == 0) {
-        return H_NOT_AVAILABLE;
-    }
-
-    len = sizeof(*hvstate);
-    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, false,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (len != sizeof(*hvstate)) {
-        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, false);
-        return H_PARAMETER;
-    }
-
-    memcpy(&hv_state, hvstate, len);
-
-    address_space_unmap(CPU(cpu)->as, hvstate, len, len, false);
-
-    /*
-     * We accept versions 1 and 2. Version 2 fields are unused because TCG
-     * does not implement DAWR*.
-     */
-    if (hv_state.version > HV_GUEST_STATE_VERSION) {
-        return H_PARAMETER;
-    }
-
-    if (hv_state.lpid == 0) {
-        return H_PARAMETER;
-    }
-
-    spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
-    if (!spapr_cpu->nested_host_state) {
-        return H_NO_MEM;
-    }
-
-    assert(env->spr[SPR_LPIDR] == 0);
-    assert(env->spr[SPR_DPDES] == 0);
-    nested_save_state(spapr_cpu->nested_host_state, cpu);
-
-    len = sizeof(*regs);
-    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, false,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (!regs || len != sizeof(*regs)) {
-        address_space_unmap(CPU(cpu)->as, regs, len, 0, false);
-        g_free(spapr_cpu->nested_host_state);
-        return H_P2;
-    }
-
-    len = sizeof(l2_state.gpr);
-    assert(len == sizeof(regs->gpr));
-    memcpy(l2_state.gpr, regs->gpr, len);
-
-    l2_state.lr = regs->link;
-    l2_state.ctr = regs->ctr;
-    l2_state.xer = regs->xer;
-    l2_state.cr = regs->ccr;
-    l2_state.msr = regs->msr;
-    l2_state.nip = regs->nip;
-
-    address_space_unmap(CPU(cpu)->as, regs, len, len, false);
-
-    l2_state.cfar = hv_state.cfar;
-    l2_state.lpidr = hv_state.lpid;
-
-    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
-    lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
-    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
-    lpcr &= ~LPCR_LPES0;
-    l2_state.lpcr = lpcr & pcc->lpcr_mask;
-
-    l2_state.pcr = hv_state.pcr;
-    /* hv_state.amor is not used */
-    l2_state.dpdes = hv_state.dpdes;
-    l2_state.hfscr = hv_state.hfscr;
-    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
-    l2_state.srr0 = hv_state.srr0;
-    l2_state.srr1 = hv_state.srr1;
-    l2_state.sprg0 = hv_state.sprg[0];
-    l2_state.sprg1 = hv_state.sprg[1];
-    l2_state.sprg2 = hv_state.sprg[2];
-    l2_state.sprg3 = hv_state.sprg[3];
-    l2_state.pidr = hv_state.pidr;
-    l2_state.ppr = hv_state.ppr;
-    l2_state.tb_offset = env->tb_env->tb_offset + hv_state.tb_offset;
-
-    /*
-     * Switch to the nested guest environment and start the "hdec" timer.
-     */
-    nested_load_state(cpu, &l2_state);
-
-    hdec = hv_state.hdec_expiry - now;
-    cpu_ppc_hdecr_init(env);
-    cpu_ppc_store_hdecr(env, hdec);
-
-    /*
-     * The hv_state.vcpu_token is not needed. It is used by the KVM
-     * implementation to remember which L2 vCPU last ran on which physical
-     * CPU so as to invalidate process scope translations if it is moved
-     * between physical CPUs. For now TLBs are always flushed on L1<->L2
-     * transitions so this is not a problem.
-     *
-     * Could validate that the same vcpu_token does not attempt to run on
-     * different L1 vCPUs at the same time, but that would be a L1 KVM bug
-     * and it's not obviously worth a new data structure to do it.
-     */
-
-    spapr_cpu->in_nested = true;
-
-    /*
-     * The spapr hcall helper sets env->gpr[3] to the return value, but at
-     * this point the L1 is not returning from the hcall but rather we
-     * start running the L2, so r3 must not be clobbered, so return env->gpr[3]
-     * to leave it unchanged.
-     */
-    return env->gpr[3];
-}
-
-void spapr_exit_nested(PowerPCCPU *cpu, int excp)
-{
-    CPUPPCState *env = &cpu->env;
-    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
-    struct nested_ppc_state l2_state;
-    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
-    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
-    target_ulong hsrr0, hsrr1, hdar, asdr, hdsisr;
-    struct kvmppc_hv_guest_state *hvstate;
-    struct kvmppc_pt_regs *regs;
-    hwaddr len;
-
-    assert(spapr_cpu->in_nested);
-
-    nested_save_state(&l2_state, cpu);
-    hsrr0 = env->spr[SPR_HSRR0];
-    hsrr1 = env->spr[SPR_HSRR1];
-    hdar = env->spr[SPR_HDAR];
-    hdsisr = env->spr[SPR_HDSISR];
-    asdr = env->spr[SPR_ASDR];
-
-    /*
-     * Switch back to the host environment (including for any error).
-     */
-    assert(env->spr[SPR_LPIDR] != 0);
-    nested_load_state(cpu, spapr_cpu->nested_host_state);
-    env->gpr[3] = env->excp_vectors[excp]; /* hcall return value */
-
-    cpu_ppc_hdecr_exit(env);
-
-    spapr_cpu->in_nested = false;
-
-    g_free(spapr_cpu->nested_host_state);
-    spapr_cpu->nested_host_state = NULL;
-
-    len = sizeof(*hvstate);
-    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (len != sizeof(*hvstate)) {
-        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
-        env->gpr[3] = H_PARAMETER;
-	return;
-    }
-
-    hvstate->cfar = l2_state.cfar;
-    hvstate->lpcr = l2_state.lpcr;
-    hvstate->pcr = l2_state.pcr;
-    hvstate->dpdes = l2_state.dpdes;
-    hvstate->hfscr = l2_state.hfscr;
-
-    if (excp == POWERPC_EXCP_HDSI) {
-        hvstate->hdar = hdar;
-        hvstate->hdsisr = hdsisr;
-        hvstate->asdr = asdr;
-    } else if (excp == POWERPC_EXCP_HISI) {
-        hvstate->asdr = asdr;
-    }
-
-    /* HEIR should be implemented for HV mode and saved here. */
-    hvstate->srr0 = l2_state.srr0;
-    hvstate->srr1 = l2_state.srr1;
-    hvstate->sprg[0] = l2_state.sprg0;
-    hvstate->sprg[1] = l2_state.sprg1;
-    hvstate->sprg[2] = l2_state.sprg2;
-    hvstate->sprg[3] = l2_state.sprg3;
-    hvstate->pidr = l2_state.pidr;
-    hvstate->ppr = l2_state.ppr;
-
-    /* Is it okay to specify write length larger than actual data written? */
-    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
-
-    len = sizeof(*regs);
-    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (!regs || len != sizeof(*regs)) {
-        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
-        env->gpr[3] = H_P2;
-	return;
-    }
-
-    len = sizeof(env->gpr);
-    assert(len == sizeof(regs->gpr));
-    memcpy(regs->gpr, l2_state.gpr, len);
-
-    regs->link = l2_state.lr;
-    regs->ctr = l2_state.ctr;
-    regs->xer = l2_state.xer;
-    regs->ccr = l2_state.cr;
-
-    if (excp == POWERPC_EXCP_MCHECK ||
-        excp == POWERPC_EXCP_RESET ||
-        excp == POWERPC_EXCP_SYSCALL) {
-        regs->nip = l2_state.srr0;
-        regs->msr = l2_state.srr1 & env->msr_mask;
-    } else {
-        regs->nip = hsrr0;
-        regs->msr = hsrr1 & env->msr_mask;
-    }
-
-    /* Is it okay to specify write length larger than actual data written? */
-    address_space_unmap(CPU(cpu)->as, regs, len, len, true);
-}
-
-static void hypercall_register_nested(void)
-{
-    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
-    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
-    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
-    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
-}
-
 static void hypercall_register_softmmu(void)
 {
     /* DO NOTHING */
 }
 #else
-void spapr_exit_nested(PowerPCCPU *cpu, int excp)
-{
-    g_assert_not_reached();
-}
-
 static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             target_ulong opcode, target_ulong *args)
 {
     g_assert_not_reached();
 }
 
-static void hypercall_register_nested(void)
-{
-    /* DO NOTHING */
-}
-
 static void hypercall_register_softmmu(void)
 {
     /* hcall-pft */
@@ -2003,7 +1576,7 @@ static void hypercall_register_types(void)
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
 
-    hypercall_register_nested();
+    spapr_register_nested();
 }
 
 type_init(hypercall_register_types)
diff --git a/hw/ppc/spapr_nested.c b/hw/ppc/spapr_nested.c
new file mode 100644
index 0000000000..c06dd8903c
--- /dev/null
+++ b/hw/ppc/spapr_nested.c
@@ -0,0 +1,496 @@
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "exec/exec-all.h"
+#include "helper_regs.h"
+#include "hw/ppc/ppc.h"
+#include "hw/ppc/spapr.h"
+#include "hw/ppc/spapr_cpu_core.h"
+
+/*
+ * Register state for entering a nested guest with H_ENTER_NESTED.
+ * New member must be added at the end.
+ */
+struct kvmppc_hv_guest_state {
+    uint64_t version;      /* version of this structure layout, must be first */
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
+
+#ifdef CONFIG_TCG
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
+struct nested_ppc_state {
+    uint64_t gpr[32];
+    uint64_t lr;
+    uint64_t ctr;
+    uint64_t cfar;
+    uint64_t msr;
+    uint64_t nip;
+    uint32_t cr;
+
+    uint64_t xer;
+
+    uint64_t lpcr;
+    uint64_t lpidr;
+    uint64_t pidr;
+    uint64_t pcr;
+    uint64_t dpdes;
+    uint64_t hfscr;
+    uint64_t srr0;
+    uint64_t srr1;
+    uint64_t sprg0;
+    uint64_t sprg1;
+    uint64_t sprg2;
+    uint64_t sprg3;
+    uint64_t ppr;
+
+    int64_t tb_offset;
+};
+
+static void nested_save_state(struct nested_ppc_state *save, PowerPCCPU *cpu)
+{
+    CPUPPCState *env = &cpu->env;
+    uint32_t cr;
+    int i;
+
+    memcpy(save->gpr, env->gpr, sizeof(save->gpr));
+
+    save->lr = env->lr;
+    save->ctr = env->ctr;
+    save->cfar = env->cfar;
+    save->msr = env->msr;
+    save->nip = env->nip;
+
+    cr = 0;
+    for (i = 0; i < 8; i++) {
+        cr |= (env->crf[i] & 15) << (4 * (7 - i));
+    }
+    save->cr = cr;
+
+    save->xer = cpu_read_xer(env);
+
+    save->lpcr = env->spr[SPR_LPCR];
+    save->lpidr = env->spr[SPR_LPIDR];
+    save->pcr = env->spr[SPR_PCR];
+    save->dpdes = env->spr[SPR_DPDES];
+    save->hfscr = env->spr[SPR_HFSCR];
+    save->srr0 = env->spr[SPR_SRR0];
+    save->srr1 = env->spr[SPR_SRR1];
+    save->sprg0 = env->spr[SPR_SPRG0];
+    save->sprg1 = env->spr[SPR_SPRG1];
+    save->sprg2 = env->spr[SPR_SPRG2];
+    save->sprg3 = env->spr[SPR_SPRG3];
+    save->pidr = env->spr[SPR_BOOKS_PID];
+    save->ppr = env->spr[SPR_PPR];
+
+    save->tb_offset = env->tb_env->tb_offset;
+}
+
+static void nested_load_state(PowerPCCPU *cpu, struct nested_ppc_state *load)
+{
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    uint32_t cr;
+    int i;
+
+    memcpy(env->gpr, load->gpr, sizeof(env->gpr));
+
+    env->lr = load->lr;
+    env->ctr = load->ctr;
+    env->cfar = load->cfar;
+    env->msr = load->msr;
+    env->nip = load->nip;
+
+    cr = load->cr;
+    for (i = 7; i >= 0; i--) {
+        env->crf[i] = cr & 15;
+        cr >>= 4;
+    }
+
+    cpu_write_xer(env, load->xer);
+
+    env->spr[SPR_LPCR] = load->lpcr;
+    env->spr[SPR_LPIDR] = load->lpidr;
+    env->spr[SPR_PCR] = load->pcr;
+    env->spr[SPR_DPDES] = load->dpdes;
+    env->spr[SPR_HFSCR] = load->hfscr;
+    env->spr[SPR_SRR0] = load->srr0;
+    env->spr[SPR_SRR1] = load->srr1;
+    env->spr[SPR_SPRG0] = load->sprg0;
+    env->spr[SPR_SPRG1] = load->sprg1;
+    env->spr[SPR_SPRG2] = load->sprg2;
+    env->spr[SPR_SPRG3] = load->sprg3;
+    env->spr[SPR_BOOKS_PID] = load->pidr;
+    env->spr[SPR_PPR] = load->ppr;
+
+    env->tb_env->tb_offset = load->tb_offset;
+
+    /*
+     * MSR updated, compute hflags and possible interrupts.
+     */
+    hreg_compute_hflags(env);
+    ppc_maybe_interrupt(env);
+
+    /*
+     * Nested HV does not tag TLB entries between L1 and L2, so must
+     * flush on transition.
+     */
+    tlb_flush(cs);
+    env->reserve_addr = -1; /* Reset the reservation */
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
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    struct nested_ppc_state l2_state;
+    target_ulong hv_ptr = args[0];
+    target_ulong regs_ptr = args[1];
+    target_ulong hdec, now = cpu_ppc_load_tbl(env);
+    target_ulong lpcr, lpcr_mask;
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_hv_guest_state hv_state;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
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
+    if (hv_state.lpid == 0) {
+        return H_PARAMETER;
+    }
+
+    spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
+    if (!spapr_cpu->nested_host_state) {
+        return H_NO_MEM;
+    }
+
+    assert(env->spr[SPR_LPIDR] == 0);
+    assert(env->spr[SPR_DPDES] == 0);
+    nested_save_state(spapr_cpu->nested_host_state, cpu);
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
+    len = sizeof(l2_state.gpr);
+    assert(len == sizeof(regs->gpr));
+    memcpy(l2_state.gpr, regs->gpr, len);
+
+    l2_state.lr = regs->link;
+    l2_state.ctr = regs->ctr;
+    l2_state.xer = regs->xer;
+    l2_state.cr = regs->ccr;
+    l2_state.msr = regs->msr;
+    l2_state.nip = regs->nip;
+
+    address_space_unmap(CPU(cpu)->as, regs, len, len, false);
+
+    l2_state.cfar = hv_state.cfar;
+    l2_state.lpidr = hv_state.lpid;
+
+    lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
+    lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
+    lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
+    lpcr &= ~LPCR_LPES0;
+    l2_state.lpcr = lpcr & pcc->lpcr_mask;
+
+    l2_state.pcr = hv_state.pcr;
+    /* hv_state.amor is not used */
+    l2_state.dpdes = hv_state.dpdes;
+    l2_state.hfscr = hv_state.hfscr;
+    /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
+    l2_state.srr0 = hv_state.srr0;
+    l2_state.srr1 = hv_state.srr1;
+    l2_state.sprg0 = hv_state.sprg[0];
+    l2_state.sprg1 = hv_state.sprg[1];
+    l2_state.sprg2 = hv_state.sprg[2];
+    l2_state.sprg3 = hv_state.sprg[3];
+    l2_state.pidr = hv_state.pidr;
+    l2_state.ppr = hv_state.ppr;
+    l2_state.tb_offset = env->tb_env->tb_offset + hv_state.tb_offset;
+
+    /*
+     * Switch to the nested guest environment and start the "hdec" timer.
+     */
+    nested_load_state(cpu, &l2_state);
+
+    hdec = hv_state.hdec_expiry - now;
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
+    spapr_cpu->in_nested = true;
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
+    CPUPPCState *env = &cpu->env;
+    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    struct nested_ppc_state l2_state;
+    target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
+    target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
+    target_ulong hsrr0, hsrr1, hdar, asdr, hdsisr;
+    struct kvmppc_hv_guest_state *hvstate;
+    struct kvmppc_pt_regs *regs;
+    hwaddr len;
+
+    assert(spapr_cpu->in_nested);
+
+    nested_save_state(&l2_state, cpu);
+    hsrr0 = env->spr[SPR_HSRR0];
+    hsrr1 = env->spr[SPR_HSRR1];
+    hdar = env->spr[SPR_HDAR];
+    hdsisr = env->spr[SPR_HDSISR];
+    asdr = env->spr[SPR_ASDR];
+
+    /*
+     * Switch back to the host environment (including for any error).
+     */
+    assert(env->spr[SPR_LPIDR] != 0);
+    nested_load_state(cpu, spapr_cpu->nested_host_state);
+    env->gpr[3] = env->excp_vectors[excp]; /* hcall return value */
+
+    cpu_ppc_hdecr_exit(env);
+
+    spapr_cpu->in_nested = false;
+
+    g_free(spapr_cpu->nested_host_state);
+    spapr_cpu->nested_host_state = NULL;
+
+    len = sizeof(*hvstate);
+    hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (len != sizeof(*hvstate)) {
+        address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
+        env->gpr[3] = H_PARAMETER;
+	return;
+    }
+
+    hvstate->cfar = l2_state.cfar;
+    hvstate->lpcr = l2_state.lpcr;
+    hvstate->pcr = l2_state.pcr;
+    hvstate->dpdes = l2_state.dpdes;
+    hvstate->hfscr = l2_state.hfscr;
+
+    if (excp == POWERPC_EXCP_HDSI) {
+        hvstate->hdar = hdar;
+        hvstate->hdsisr = hdsisr;
+        hvstate->asdr = asdr;
+    } else if (excp == POWERPC_EXCP_HISI) {
+        hvstate->asdr = asdr;
+    }
+
+    /* HEIR should be implemented for HV mode and saved here. */
+    hvstate->srr0 = l2_state.srr0;
+    hvstate->srr1 = l2_state.srr1;
+    hvstate->sprg[0] = l2_state.sprg0;
+    hvstate->sprg[1] = l2_state.sprg1;
+    hvstate->sprg[2] = l2_state.sprg2;
+    hvstate->sprg[3] = l2_state.sprg3;
+    hvstate->pidr = l2_state.pidr;
+    hvstate->ppr = l2_state.ppr;
+
+    /* Is it okay to specify write length larger than actual data written? */
+    address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
+
+    len = sizeof(*regs);
+    regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, true,
+                                MEMTXATTRS_UNSPECIFIED);
+    if (!regs || len != sizeof(*regs)) {
+        address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
+        env->gpr[3] = H_P2;
+	return;
+    }
+
+    len = sizeof(env->gpr);
+    assert(len == sizeof(regs->gpr));
+    memcpy(regs->gpr, l2_state.gpr, len);
+
+    regs->link = l2_state.lr;
+    regs->ctr = l2_state.ctr;
+    regs->xer = l2_state.xer;
+    regs->ccr = l2_state.cr;
+
+    if (excp == POWERPC_EXCP_MCHECK ||
+        excp == POWERPC_EXCP_RESET ||
+        excp == POWERPC_EXCP_SYSCALL) {
+        regs->nip = l2_state.srr0;
+        regs->msr = l2_state.srr1 & env->msr_mask;
+    } else {
+        regs->nip = hsrr0;
+        regs->msr = hsrr1 & env->msr_mask;
+    }
+
+    /* Is it okay to specify write length larger than actual data written? */
+    address_space_unmap(CPU(cpu)->as, regs, len, len, true);
+}
+
+void spapr_register_nested(void)
+{
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+}
+#else
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+
+void spapr_register_nested(void)
+{
+    /* DO NOTHING */
+}
+#endif
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 5c8aabd444..84cdde75da 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -619,66 +619,6 @@ struct SpaprMachineState {
 #define SVM_H_TPM_COMM              0xEF10
 #define SVM_HCALL_MAX               SVM_H_TPM_COMM
 
-/*
- * Register state for entering a nested guest with H_ENTER_NESTED.
- * New member must be added at the end.
- */
-struct kvmppc_hv_guest_state {
-    uint64_t version;      /* version of this structure layout, must be first */
-    uint32_t lpid;
-    uint32_t vcpu_token;
-    /* These registers are hypervisor privileged (at least for writing) */
-    uint64_t lpcr;
-    uint64_t pcr;
-    uint64_t amor;
-    uint64_t dpdes;
-    uint64_t hfscr;
-    int64_t tb_offset;
-    uint64_t dawr0;
-    uint64_t dawrx0;
-    uint64_t ciabr;
-    uint64_t hdec_expiry;
-    uint64_t purr;
-    uint64_t spurr;
-    uint64_t ic;
-    uint64_t vtb;
-    uint64_t hdar;
-    uint64_t hdsisr;
-    uint64_t heir;
-    uint64_t asdr;
-    /* These are OS privileged but need to be set late in guest entry */
-    uint64_t srr0;
-    uint64_t srr1;
-    uint64_t sprg[4];
-    uint64_t pidr;
-    uint64_t cfar;
-    uint64_t ppr;
-    /* Version 1 ends here */
-    uint64_t dawr1;
-    uint64_t dawrx1;
-    /* Version 2 ends here */
-};
-
-/* Latest version of hv_guest_state structure */
-#define HV_GUEST_STATE_VERSION  2
-
-/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
-struct kvmppc_pt_regs {
-    uint64_t gpr[32];
-    uint64_t nip;
-    uint64_t msr;
-    uint64_t orig_gpr3;    /* Used for restarting system calls */
-    uint64_t ctr;
-    uint64_t link;
-    uint64_t xer;
-    uint64_t ccr;
-    uint64_t softe;        /* Soft enabled/disabled */
-    uint64_t trap;         /* Reason for being here */
-    uint64_t dar;          /* Fault registers */
-    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
-    uint64_t result;       /* Result of a system call */
-};
-
 typedef struct SpaprDeviceTreeUpdateHeader {
     uint32_t version_id;
 } SpaprDeviceTreeUpdateHeader;
@@ -696,6 +636,7 @@ void spapr_register_hypercall(target_ulong opcode, spapr_hcall_fn fn);
 target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
                              target_ulong *args);
 
+void spapr_register_nested(void);
 void spapr_exit_nested(PowerPCCPU *cpu, int excp);
 
 target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu, SpaprMachineState *spapr,
-- 
2.40.1


