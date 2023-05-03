Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A649E6F4E36
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0Xc-0001RD-3K; Tue, 02 May 2023 20:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XZ-0001Qp-Br; Tue, 02 May 2023 20:40:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XV-0006rm-TO; Tue, 02 May 2023 20:40:16 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b70f0b320so5111634b3a.1; 
 Tue, 02 May 2023 17:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683074411; x=1685666411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+N4uJmmAeCawXEvswruqVixPwsAF2D12g8eyp3la1Q=;
 b=dtiCjqlSDqHrPJD50XCqCz5bK7C5Cz6PpbCxbDlsMDJAJqX6wHZsRQX9Wju2F0Ksea
 d41AlJFUoZBti/G/26/sAvAKyyYQ6q57ABjQsq0bxDTkFHoFjVWKAmbGHyJlBk6AmLqA
 oCPVwGadS6dyUMqJbnVwubna2RHgGNgOq/oVAZkTTBJGDGriZ6m8hhaeeDzu86QZqEUb
 hca6rQ5/QJAvz3j1T1rOkbVq0F0TxyUs21thOhykOcVjfb4SJ3KZpStF1nHlBPd/4dX6
 0rZ6I6RkdT0vSwGUEfcjYT3fKRm4s1Y7uxmhgElgNEsETGm8iucmECAlx3ajw/bcJoa4
 YyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683074411; x=1685666411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+N4uJmmAeCawXEvswruqVixPwsAF2D12g8eyp3la1Q=;
 b=TBwCrsHRkLSrITZli6SbEgEbU5ZiYBZN7NCcFR8WWvkQttL8bMDa4foVtfAVacN2Qw
 LWNTGrt+1TwCtePHzaBrhczGxLZt46tx1FeYjW/KRflwIm0+TkVDFTn4eAiaTy7HUN7y
 TpKrogk8NYn4fVWq8r4s448BxYTOtzhsrlTAN0KGUo0novxaFAFSnbA37RzmyQ53nIDd
 eSp1d2CMhK5KUVbol176rspD0RMzi2CVYruHneHroNYBoxGzI6V95z3EVBHlGAJUNEvM
 ucVN5wDQxGgLNlEqr3GytMKLk1A/wKx8xQomMINLLpJRgPRDo3EroQq1/F/oAyTQcEMr
 owVw==
X-Gm-Message-State: AC+VfDzcJjBgMzrlcgSLpwdrBA9uYHaBPWuNlAdqe1Btsj4VhX9bIqjf
 KjmmRd+3fp2wiooja3+wUPqG0mMrnq1LvA==
X-Google-Smtp-Source: ACHHUZ472dLXGm0Zr8zpIgnvh0apfEXpjM7QazP1TfcGjC9sGeAJOTHAkvEffDjcfXzhwbqNeNho+Q==
X-Received: by 2002:a05:6a20:42a0:b0:f2:64f8:b214 with SMTP id
 o32-20020a056a2042a000b000f264f8b214mr26510978pzj.13.1683074411345; 
 Tue, 02 May 2023 17:40:11 -0700 (PDT)
Received: from wheely.local0.net (118-208-214-188.tpgi.com.au.
 [118.208.214.188]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63db0d000000b0050f7208b4bcsm19332338pgg.89.2023.05.02.17.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:40:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Subject: [RFC PATCH 3/4] spapr: load and store l2 state with helper functions
Date: Wed,  3 May 2023 10:39:53 +1000
Message-Id: <20230503003954.128188-4-npiggin@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Arguably this is just shuffling around register accesses, but one nice
thing it does is allow the exit to save away the L2 state then switch
the environment to the L1 before copying L2 data back to the L1, which
logically flows more naturally and simplifies the error paths.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c | 178 +++++++++++++++++++++----------------------
 1 file changed, 85 insertions(+), 93 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 6679150ac7..783a06ba98 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1675,9 +1675,9 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
                                    target_ulong *args)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
+    struct nested_ppc_state l2_state;
     target_ulong hv_ptr = args[0];
     target_ulong regs_ptr = args[1];
     target_ulong hdec, now = cpu_ppc_load_tbl(env);
@@ -1686,8 +1686,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     struct kvmppc_hv_guest_state hv_state;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     if (spapr->nested_ptcr == 0) {
         return H_NOT_AVAILABLE;
@@ -1713,6 +1711,10 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
         return H_PARAMETER;
     }
 
+    if (hv_state.lpid == 0) {
+        return H_PARAMETER;
+    }
+
     spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
     if (!spapr_cpu->nested_host_state) {
         return H_NO_MEM;
@@ -1731,51 +1733,49 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
         return H_P2;
     }
 
-    len = sizeof(env->gpr);
+    len = sizeof(l2_state.gpr);
     assert(len == sizeof(regs->gpr));
-    memcpy(env->gpr, regs->gpr, len);
+    memcpy(l2_state.gpr, regs->gpr, len);
 
-    env->lr = regs->link;
-    env->ctr = regs->ctr;
-    cpu_write_xer(env, regs->xer);
-
-    cr = regs->ccr;
-    for (i = 7; i >= 0; i--) {
-        env->crf[i] = cr & 15;
-        cr >>= 4;
-    }
-
-    env->msr = regs->msr;
-    env->nip = regs->nip;
+    l2_state.lr = regs->link;
+    l2_state.ctr = regs->ctr;
+    l2_state.xer = regs->xer;
+    l2_state.cr = regs->ccr;
+    l2_state.msr = regs->msr;
+    l2_state.nip = regs->nip;
 
     address_space_unmap(CPU(cpu)->as, regs, len, len, false);
 
-    env->cfar = hv_state.cfar;
-
-    assert(env->spr[SPR_LPIDR] == 0);
-    env->spr[SPR_LPIDR] = hv_state.lpid;
+    l2_state.cfar = hv_state.cfar;
+    l2_state.lpidr = hv_state.lpid;
 
     lpcr_mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER;
     lpcr = (env->spr[SPR_LPCR] & ~lpcr_mask) | (hv_state.lpcr & lpcr_mask);
     lpcr |= LPCR_HR | LPCR_UPRT | LPCR_GTSE | LPCR_HVICE | LPCR_HDICE;
     lpcr &= ~LPCR_LPES0;
-    env->spr[SPR_LPCR] = lpcr & pcc->lpcr_mask;
+    l2_state.lpcr = lpcr & pcc->lpcr_mask;
 
-    env->spr[SPR_PCR] = hv_state.pcr;
+    l2_state.pcr = hv_state.pcr;
     /* hv_state.amor is not used */
-    env->spr[SPR_DPDES] = hv_state.dpdes;
-    env->spr[SPR_HFSCR] = hv_state.hfscr;
-    hdec = hv_state.hdec_expiry - now;
+    l2_state.dpdes = hv_state.dpdes;
+    l2_state.hfscr = hv_state.hfscr;
     /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
-    env->spr[SPR_SRR0] = hv_state.srr0;
-    env->spr[SPR_SRR1] = hv_state.srr1;
-    env->spr[SPR_SPRG0] = hv_state.sprg[0];
-    env->spr[SPR_SPRG1] = hv_state.sprg[1];
-    env->spr[SPR_SPRG2] = hv_state.sprg[2];
-    env->spr[SPR_SPRG3] = hv_state.sprg[3];
-    env->spr[SPR_BOOKS_PID] = hv_state.pidr;
-    env->spr[SPR_PPR] = hv_state.ppr;
+    l2_state.srr0 = hv_state.srr0;
+    l2_state.srr1 = hv_state.srr1;
+    l2_state.sprg0 = hv_state.sprg[0];
+    l2_state.sprg1 = hv_state.sprg[1];
+    l2_state.sprg2 = hv_state.sprg[2];
+    l2_state.sprg3 = hv_state.sprg[3];
+    l2_state.pidr = hv_state.pidr;
+    l2_state.ppr = hv_state.ppr;
+    l2_state.tb_offset = env->tb_env->tb_offset + hv_state.tb_offset;
 
+    /*
+     * Switch to the nested guest environment and start the "hdec" timer.
+     */
+    nested_load_state(cpu, &l2_state);
+
+    hdec = hv_state.hdec_expiry - now;
     cpu_ppc_hdecr_init(env);
     cpu_ppc_store_hdecr(env, hdec);
 
@@ -1791,14 +1791,8 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
      * and it's not obviously worth a new data structure to do it.
      */
 
-    env->tb_env->tb_offset += hv_state.tb_offset;
     spapr_cpu->in_nested = true;
 
-    hreg_compute_hflags(env);
-    ppc_maybe_interrupt(env);
-    tlb_flush(cs);
-    env->reserve_addr = -1; /* Reset the reservation */
-
     /*
      * The spapr hcall helper sets env->gpr[3] to the return value, but at
      * this point the L1 is not returning from the hcall but rather we
@@ -1812,51 +1806,69 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
 {
     CPUPPCState *env = &cpu->env;
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
-    target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
+    struct nested_ppc_state l2_state;
     target_ulong hv_ptr = spapr_cpu->nested_host_state->gpr[4];
     target_ulong regs_ptr = spapr_cpu->nested_host_state->gpr[5];
+    target_ulong hsrr0, hsrr1, hdar, asdr, hdsisr;
     struct kvmppc_hv_guest_state *hvstate;
     struct kvmppc_pt_regs *regs;
     hwaddr len;
-    uint64_t cr;
-    int i;
 
     assert(spapr_cpu->in_nested);
 
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
     cpu_ppc_hdecr_exit(env);
 
+    spapr_cpu->in_nested = false;
+
+    g_free(spapr_cpu->nested_host_state);
+    spapr_cpu->nested_host_state = NULL;
+
     len = sizeof(*hvstate);
     hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
                                 MEMTXATTRS_UNSPECIFIED);
     if (len != sizeof(*hvstate)) {
         address_space_unmap(CPU(cpu)->as, hvstate, len, 0, true);
-        r3_return = H_PARAMETER;
-        goto out_restore_l1;
+        env->gpr[3] = H_PARAMETER;
+	return;
     }
 
-    hvstate->cfar = env->cfar;
-    hvstate->lpcr = env->spr[SPR_LPCR];
-    hvstate->pcr = env->spr[SPR_PCR];
-    hvstate->dpdes = env->spr[SPR_DPDES];
-    hvstate->hfscr = env->spr[SPR_HFSCR];
+    hvstate->cfar = l2_state.cfar;
+    hvstate->lpcr = l2_state.lpcr;
+    hvstate->pcr = l2_state.pcr;
+    hvstate->dpdes = l2_state.dpdes;
+    hvstate->hfscr = l2_state.hfscr;
 
     if (excp == POWERPC_EXCP_HDSI) {
-        hvstate->hdar = env->spr[SPR_HDAR];
-        hvstate->hdsisr = env->spr[SPR_HDSISR];
-        hvstate->asdr = env->spr[SPR_ASDR];
+        hvstate->hdar = hdar;
+        hvstate->hdsisr = hdsisr;
+        hvstate->asdr = asdr;
     } else if (excp == POWERPC_EXCP_HISI) {
-        hvstate->asdr = env->spr[SPR_ASDR];
+        hvstate->asdr = asdr;
     }
 
     /* HEIR should be implemented for HV mode and saved here. */
-    hvstate->srr0 = env->spr[SPR_SRR0];
-    hvstate->srr1 = env->spr[SPR_SRR1];
-    hvstate->sprg[0] = env->spr[SPR_SPRG0];
-    hvstate->sprg[1] = env->spr[SPR_SPRG1];
-    hvstate->sprg[2] = env->spr[SPR_SPRG2];
-    hvstate->sprg[3] = env->spr[SPR_SPRG3];
-    hvstate->pidr = env->spr[SPR_BOOKS_PID];
-    hvstate->ppr = env->spr[SPR_PPR];
+    hvstate->srr0 = l2_state.srr0;
+    hvstate->srr1 = l2_state.srr1;
+    hvstate->sprg[0] = l2_state.sprg0;
+    hvstate->sprg[1] = l2_state.sprg1;
+    hvstate->sprg[2] = l2_state.sprg2;
+    hvstate->sprg[3] = l2_state.sprg3;
+    hvstate->pidr = l2_state.pidr;
+    hvstate->ppr = l2_state.ppr;
 
     /* Is it okay to specify write length larger than actual data written? */
     address_space_unmap(CPU(cpu)->as, hvstate, len, len, true);
@@ -1866,51 +1878,31 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
                                 MEMTXATTRS_UNSPECIFIED);
     if (!regs || len != sizeof(*regs)) {
         address_space_unmap(CPU(cpu)->as, regs, len, 0, true);
-        r3_return = H_P2;
-        goto out_restore_l1;
+        env->gpr[3] = H_P2;
+	return;
     }
 
     len = sizeof(env->gpr);
     assert(len == sizeof(regs->gpr));
-    memcpy(regs->gpr, env->gpr, len);
+    memcpy(regs->gpr, l2_state.gpr, len);
 
-    regs->link = env->lr;
-    regs->ctr = env->ctr;
-    regs->xer = cpu_read_xer(env);
-
-    cr = 0;
-    for (i = 0; i < 8; i++) {
-        cr |= (env->crf[i] & 15) << (4 * (7 - i));
-    }
-    regs->ccr = cr;
+    regs->link = l2_state.lr;
+    regs->ctr = l2_state.ctr;
+    regs->xer = l2_state.xer;
+    regs->ccr = l2_state.cr;
 
     if (excp == POWERPC_EXCP_MCHECK ||
         excp == POWERPC_EXCP_RESET ||
         excp == POWERPC_EXCP_SYSCALL) {
-        regs->nip = env->spr[SPR_SRR0];
-        regs->msr = env->spr[SPR_SRR1] & env->msr_mask;
+        regs->nip = l2_state.srr0;
+        regs->msr = l2_state.srr1 & env->msr_mask;
     } else {
-        regs->nip = env->spr[SPR_HSRR0];
-        regs->msr = env->spr[SPR_HSRR1] & env->msr_mask;
+        regs->nip = hsrr0;
+        regs->msr = hsrr1 & env->msr_mask;
     }
 
     /* Is it okay to specify write length larger than actual data written? */
     address_space_unmap(CPU(cpu)->as, regs, len, len, true);
-
-out_restore_l1:
-    assert(env->spr[SPR_LPIDR] != 0);
-    nested_load_state(cpu, spapr_cpu->nested_host_state);
-
-    /*
-     * Return the interrupt vector address from H_ENTER_NESTED to the L1
-     * (or error code).
-     */
-    env->gpr[3] = r3_return;
-
-    spapr_cpu->in_nested = false;
-
-    g_free(spapr_cpu->nested_host_state);
-    spapr_cpu->nested_host_state = NULL;
 }
 
 static void hypercall_register_nested(void)
-- 
2.40.1


