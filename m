Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0526F4E34
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0XY-0001Qm-FG; Tue, 02 May 2023 20:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XV-0001Px-Pv; Tue, 02 May 2023 20:40:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XS-0006qq-V3; Tue, 02 May 2023 20:40:12 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso1205336b3a.0; 
 Tue, 02 May 2023 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683074408; x=1685666408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOuhY3YPJJR0IGEC1BhBx91yO8bKpC7oEQwLePGz9J8=;
 b=sHV/63RsPEAkvTJEmEJjT/BFwFmyuLcP7qn4AQTc/6VNYIrTb7Zzk6MR7WxbdxDxSs
 +oR08cbMGEjGimebdwN4A1x14EA0JNd+RAl2lOn4lsOkIhkb5YBwDqaRAs3csHk7uAfX
 V+p/CWRJ69tmnETg/dZSfdTChMsPX/sJ/BqDdYsYzuiGLuebudUl0rnPtasCkmHM3CAm
 nrf/FH5JZ/sV4SzfhwWC3v0DXsCiwq8OvjGFNytVnJPaX50QccjkVXqYk6ta3MnIclDa
 tkVJJpmdKHyeCLBtTKXNyfSHQN3g0mYQh4ZH6cLHOaKQmLvsNRPQ3hupyfrOTNYL+xjA
 +NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683074408; x=1685666408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOuhY3YPJJR0IGEC1BhBx91yO8bKpC7oEQwLePGz9J8=;
 b=IrsPBtZ+9W4+FIVAzXYcaH0h5mYx8/btbrmLWokqzxCYW+mTKtZ2bycMILZrWofbVh
 i0IQxogQZZ5FrChxvllQ3db5tmE7y7czsmPSB4r9JBHo+iwWgrDg6JTwrac30FLlBNjt
 L06q35JELgizjiKhwt3XF+mLmQcx4QWoX3o0+GIVTLXPQAW+x2jKkuCrPZLb86chV2SD
 Gj5soXoRvCoDllimb0voCDNx0PPq0aJFb8VWXtORlbO/KsJTV3nwfNBVQZmA91t0C32n
 LMGXYO3o3u0HZhYv6XHPbw1v3zELGybhCIpSj+zoATTBRUDJW5WAQrAO0bmjsOVkhwsW
 SxsA==
X-Gm-Message-State: AC+VfDz99jdYHPm+E0e7AA6+6/1luY33xRLcnoxDkCIjq5/7UzEcpTne
 DXM8Ct52NtU7Sh2K6MxRuDMqEtPgLKgK1A==
X-Google-Smtp-Source: ACHHUZ6Z5Rv/HnFeA/9MxmzS7l/NnM+Q2FE2kxByHssqiQmJlVm1iyjROgyKbPMl/QP2itk7zZJxWg==
X-Received: by 2002:a05:6a20:7f99:b0:f3:8fc6:6579 with SMTP id
 d25-20020a056a207f9900b000f38fc66579mr448648pzj.10.1683074408158; 
 Tue, 02 May 2023 17:40:08 -0700 (PDT)
Received: from wheely.local0.net (118-208-214-188.tpgi.com.au.
 [118.208.214.188]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63db0d000000b0050f7208b4bcsm19332338pgg.89.2023.05.02.17.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:40:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Subject: [RFC PATCH 2/4] spapr: Add a nested state struct
Date: Wed,  3 May 2023 10:39:52 +1000
Message-Id: <20230503003954.128188-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503003954.128188-1-npiggin@gmail.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
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

Rather than use a copy of CPUPPCState to store the host state while
the environment has been switched to the L2, use a new struct for
this purpose.

Have helper functions to save and load this host state.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c            | 164 ++++++++++++++++++++++++--------
 include/hw/ppc/spapr_cpu_core.h |   5 +-
 2 files changed, 129 insertions(+), 40 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index be225adaf6..6679150ac7 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1544,6 +1544,126 @@ static target_ulong h_copy_tofrom_guest(PowerPCCPU *cpu,
     return H_FUNCTION;
 }
 
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
 /*
  * When this handler returns, the environment is switched to the L2 guest
  * and TCG begins running that. spapr_exit_nested() performs the switch from
@@ -1593,12 +1713,14 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
         return H_PARAMETER;
     }
 
-    spapr_cpu->nested_host_state = g_try_new(CPUPPCState, 1);
+    spapr_cpu->nested_host_state = g_try_new(struct nested_ppc_state, 1);
     if (!spapr_cpu->nested_host_state) {
         return H_NO_MEM;
     }
 
-    memcpy(spapr_cpu->nested_host_state, env, sizeof(CPUPPCState));
+    assert(env->spr[SPR_LPIDR] == 0);
+    assert(env->spr[SPR_DPDES] == 0);
+    nested_save_state(spapr_cpu->nested_host_state, cpu);
 
     len = sizeof(*regs);
     regs = address_space_map(CPU(cpu)->as, regs_ptr, &len, false,
@@ -1644,7 +1766,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     env->spr[SPR_DPDES] = hv_state.dpdes;
     env->spr[SPR_HFSCR] = hv_state.hfscr;
     hdec = hv_state.hdec_expiry - now;
-    spapr_cpu->nested_tb_offset = hv_state.tb_offset;
     /* TCG does not implement DAWR*, CIABR, PURR, SPURR, IC, VTB, HEIR SPRs*/
     env->spr[SPR_SRR0] = hv_state.srr0;
     env->spr[SPR_SRR1] = hv_state.srr1;
@@ -1670,7 +1791,7 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
      * and it's not obviously worth a new data structure to do it.
      */
 
-    env->tb_env->tb_offset += spapr_cpu->nested_tb_offset;
+    env->tb_env->tb_offset += hv_state.tb_offset;
     spapr_cpu->in_nested = true;
 
     hreg_compute_hflags(env);
@@ -1689,7 +1810,6 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
 
 void spapr_exit_nested(PowerPCCPU *cpu, int excp)
 {
-    CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
     target_ulong r3_return = env->excp_vectors[excp]; /* hcall return value */
@@ -1778,34 +1898,8 @@ void spapr_exit_nested(PowerPCCPU *cpu, int excp)
     address_space_unmap(CPU(cpu)->as, regs, len, len, true);
 
 out_restore_l1:
-    memcpy(env->gpr, spapr_cpu->nested_host_state->gpr, sizeof(env->gpr));
-    env->lr = spapr_cpu->nested_host_state->lr;
-    env->ctr = spapr_cpu->nested_host_state->ctr;
-    memcpy(env->crf, spapr_cpu->nested_host_state->crf, sizeof(env->crf));
-    env->cfar = spapr_cpu->nested_host_state->cfar;
-    env->xer = spapr_cpu->nested_host_state->xer;
-    env->so = spapr_cpu->nested_host_state->so;
-    env->ca = spapr_cpu->nested_host_state->ca;
-    env->ov = spapr_cpu->nested_host_state->ov;
-    env->ov32 = spapr_cpu->nested_host_state->ov32;
-    env->ca32 = spapr_cpu->nested_host_state->ca32;
-    env->msr = spapr_cpu->nested_host_state->msr;
-    env->nip = spapr_cpu->nested_host_state->nip;
-
     assert(env->spr[SPR_LPIDR] != 0);
-    env->spr[SPR_LPCR] = spapr_cpu->nested_host_state->spr[SPR_LPCR];
-    env->spr[SPR_LPIDR] = spapr_cpu->nested_host_state->spr[SPR_LPIDR];
-    env->spr[SPR_PCR] = spapr_cpu->nested_host_state->spr[SPR_PCR];
-    env->spr[SPR_DPDES] = 0;
-    env->spr[SPR_HFSCR] = spapr_cpu->nested_host_state->spr[SPR_HFSCR];
-    env->spr[SPR_SRR0] = spapr_cpu->nested_host_state->spr[SPR_SRR0];
-    env->spr[SPR_SRR1] = spapr_cpu->nested_host_state->spr[SPR_SRR1];
-    env->spr[SPR_SPRG0] = spapr_cpu->nested_host_state->spr[SPR_SPRG0];
-    env->spr[SPR_SPRG1] = spapr_cpu->nested_host_state->spr[SPR_SPRG1];
-    env->spr[SPR_SPRG2] = spapr_cpu->nested_host_state->spr[SPR_SPRG2];
-    env->spr[SPR_SPRG3] = spapr_cpu->nested_host_state->spr[SPR_SPRG3];
-    env->spr[SPR_BOOKS_PID] = spapr_cpu->nested_host_state->spr[SPR_BOOKS_PID];
-    env->spr[SPR_PPR] = spapr_cpu->nested_host_state->spr[SPR_PPR];
+    nested_load_state(cpu, spapr_cpu->nested_host_state);
 
     /*
      * Return the interrupt vector address from H_ENTER_NESTED to the L1
@@ -1813,14 +1907,8 @@ out_restore_l1:
      */
     env->gpr[3] = r3_return;
 
-    env->tb_env->tb_offset -= spapr_cpu->nested_tb_offset;
     spapr_cpu->in_nested = false;
 
-    hreg_compute_hflags(env);
-    ppc_maybe_interrupt(env);
-    tlb_flush(cs);
-    env->reserve_addr = -1; /* Reset the reservation */
-
     g_free(spapr_cpu->nested_host_state);
     spapr_cpu->nested_host_state = NULL;
 }
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index b560514560..69a52e39b8 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -41,6 +41,8 @@ void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
                                target_ulong r1, target_ulong r3,
                                target_ulong r4);
 
+struct nested_ppc_state;
+
 typedef struct SpaprCpuState {
     uint64_t vpa_addr;
     uint64_t slb_shadow_addr, slb_shadow_size;
@@ -51,8 +53,7 @@ typedef struct SpaprCpuState {
 
     /* Fields for nested-HV support */
     bool in_nested; /* true while the L2 is executing */
-    CPUPPCState *nested_host_state; /* holds the L1 state while L2 executes */
-    int64_t nested_tb_offset; /* L1->L2 TB offset */
+    struct nested_ppc_state *nested_host_state; /* holds the L1 state while L2 executes */
 } SpaprCpuState;
 
 static inline SpaprCpuState *spapr_cpu_state(PowerPCCPU *cpu)
-- 
2.40.1


