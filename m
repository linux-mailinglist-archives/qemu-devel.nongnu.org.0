Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4E93A8576
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:54:03 +0200 (CEST)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBO6-00043J-G6
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFH-0006UZ-EI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEl-0000zb-O0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id z8so18868938wrp.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fmoe88j2BjlAkr54G4AmGKFzL0Fblx4LyHgbg6kEfmg=;
 b=hauI+NrPzUsTqwpevBB++V/IxbRY1W2JnQoPIRVpwSOJhrJYd9RCXbvhfzpDbt9/PY
 iuDD2qfRfiDq3dGN0yUFrhLAJJkmY2NlVk+K+qUlA2kTXDCA0o5vrB//1HuThltmwYq1
 asJ2Gcf3Bm8vuy+bj91ySIxnCAxPTfewo7Tfok+6ajvz8EFFdye4fefGu9XnzD4zrNVI
 xfGYkhzSxSE++n4JOwnFWbrstdRfA+OeEL5Yw67YEWhsVgeK7P8GNmNTjPT0l7nr+1rr
 2V41v34Pml6LPSkZKpVmNm519P5JnVgqTzjIdgyJnTSJcoOKdcT3QamyhT0DIY5APlk8
 SJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmoe88j2BjlAkr54G4AmGKFzL0Fblx4LyHgbg6kEfmg=;
 b=FW4pWBdjNQ4EmSkYVCg3gZ8xAsHCEClxryvmLZDTwIgoUFFNGqGSEvciHrXkwNgDbD
 dQ1W2jqcV8GnBv0Bt08/ThYBh0x4A6vOl82/oZOIEYh7AaztxEHWs6KRR5UdTuY/Tizo
 MPat2byzA2kWG/C3gPPk61Km110dn57aCZzh2xAaSBHF1Us+F1UEXH9DXIzH9OUX8eW8
 jnLUeo0/5QMV8iGolQS5uyGxFaeEpWM4Rk741Do1rd6xjUZ60XPchZOxsyOdfkEmBj0c
 2Qmz8ORmjgR5rZxwSUd5AL/HARypZeZrt+8IQWU648kMVIPJ5SZpY+qOP/SyIk/Y2Pis
 VLDQ==
X-Gm-Message-State: AOAM5316vpd/8Bk1iFPfh9QFEkhIMFrO5j7QLhAUOqSsLtfBTqlGEZGT
 hBziAcmom9H38UKrZ18T4lelFtL8JgEhLA==
X-Google-Smtp-Source: ABdhPJwUPHhSiyGZItPiEsW3ktPQCvDcFe5dEwhEg6yU1vj8vHAdpcSE1C8YW0o1HxXRgJafHtVaAw==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr25864084wru.341.1623771862116; 
 Tue, 15 Jun 2021 08:44:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] target/arm: Add handling for PSR.ECI/ICI
Date: Tue, 15 Jun 2021 16:43:56 +0100
Message-Id: <20210615154405.21399-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On A-profile, PSR bits [15:10][26:25] are always the IT state bits.
On M-profile, some of the reserved encodings of the IT state are used
to instead indicate partial progress through instructions that were
interrupted partway through by an exception and can be resumed.

These resumable instructions fall into two categories:

(1) load/store multiple instructions, where these bits are called
"ICI" and specify the register in the ldm/stm list where execution
should resume.  (Specifically: LDM, STM, VLDM, VSTM, VLLDM, VLSTM,
CLRM, VSCCLRM.)

(2) MVE instructions subject to beatwise execution, where these bits
are called "ECI" and specify which beats in this and possibly also
the following MVE insn have been executed.

There are also a few insns (LE, LETP, and BKPT) which do not use the
ICI/ECI bits but must leave them alone.

Otherwise, we should raise an INVSTATE UsageFault for any attempt to
execute an insn with non-zero ICI/ECI bits.

So far we have been able to ignore ECI/ICI, because the architecture
allows the IMPDEF choice of "always restart load/store multiple from
the beginning regardless of ICI state", so the only thing we have
been missing is that we don't raise the INVSTATE fault for bad guest
code.  However, MVE requires that we honour ECI bits and do not
rexecute beats of an insn that have already been executed.

Add the support in the decoder for handling ECI/ICI:
 * identify the ECI/ICI case in the CONDEXEC TB flags
 * when a load/store multiple insn succeeds, it updates the ECI/ICI
   state (both in DisasContext and in the CPU state), and sets a flag
   to say that the ECI/ICI state was handled
 * if we find that the insn we just decoded did not handle the
   ECI/ICI state, we delete all the code that we just generated for
   it and instead emit the code to raise the INVFAULT.  This allows
   us to avoid having to update every non-MVE non-LDM/STM insn to
   make it check for "is ECI/ICI set?".

We continue with our existing IMPDEF choice of not caring about the
ICI state for the load/store multiples and simply restarting them
from the beginning.  Because we don't allow interrupts in the middle
of an insn, the only way we would see this state is if the guest set
ICI manually on return from an exception handler, so it's a corner
case which doesn't merit optimisation.

ICI update for LDM/STM is simple -- it always zeroes the state.  ECI
update for MVE beatwise insns will be a little more complex, since
the ECI state may include information for the following insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-5-peter.maydell@linaro.org
---
 target/arm/translate-a32.h    |   1 +
 target/arm/translate.h        |   9 +++
 target/arm/translate-m-nocp.c |  11 ++++
 target/arm/translate-vfp.c    |   6 ++
 target/arm/translate.c        | 111 ++++++++++++++++++++++++++++++++--
 5 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index c997f4e3216..c946ac440ce 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -44,6 +44,7 @@ long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
 long neon_element_offset(int reg, int element, MemOp memop);
 void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
+void clear_eci_state(DisasContext *s);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 12c28b0d32c..2821b325e33 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -21,6 +21,15 @@ typedef struct DisasContext {
     /* Thumb-2 conditional execution bits.  */
     int condexec_mask;
     int condexec_cond;
+    /* M-profile ECI/ICI exception-continuable instruction state */
+    int eci;
+    /*
+     * trans_ functions for insns which are continuable should set this true
+     * after decode (ie after any UNDEF checks)
+     */
+    bool eci_handled;
+    /* TCG op to rewind to if this turns out to be an invalid ECI state */
+    TCGOp *insn_eci_rewind;
     int thumb;
     int sctlr_b;
     MemOp be_data;
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index 365810e582d..09b3be4ed31 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -75,8 +75,12 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
         unallocated_encoding(s);
         return true;
     }
+
+    s->eci_handled = true;
+
     /* If no fpu, NOP. */
     if (!dc_isar_feature(aa32_vfp, s)) {
+        clear_eci_state(s);
         return true;
     }
 
@@ -88,6 +92,8 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     }
     tcg_temp_free_i32(fptr);
 
+    clear_eci_state(s);
+
     /* End the TB, because we have updated FP control bits */
     s->base.is_jmp = DISAS_UPDATE_EXIT;
     return true;
@@ -110,8 +116,11 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
         return true;
     }
 
+    s->eci_handled = true;
+
     if (!dc_isar_feature(aa32_vfp_simd, s)) {
         /* NOP if we have neither FP nor MVE */
+        clear_eci_state(s);
         return true;
     }
 
@@ -177,6 +186,8 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
         TCGv_i32 z32 = tcg_const_i32(0);
         store_cpu_field(z32, v7m.vpr);
     }
+
+    clear_eci_state(s);
     return true;
 }
 
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 49f44347ad9..2e12c694edc 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -1562,6 +1562,8 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
         return false;
     }
 
+    s->eci_handled = true;
+
     if (!vfp_access_check(s)) {
         return true;
     }
@@ -1611,6 +1613,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
         tcg_temp_free_i32(addr);
     }
 
+    clear_eci_state(s);
     return true;
 }
 
@@ -1645,6 +1648,8 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
         return false;
     }
 
+    s->eci_handled = true;
+
     if (!vfp_access_check(s)) {
         return true;
     }
@@ -1701,6 +1706,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
         tcg_temp_free_i32(addr);
     }
 
+    clear_eci_state(s);
     return true;
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8e0e55c1e0f..f1c2074fa4a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -309,6 +309,19 @@ static inline bool is_singlestepping(DisasContext *s)
     return s->base.singlestep_enabled || s->ss_active;
 }
 
+void clear_eci_state(DisasContext *s)
+{
+    /*
+     * Clear any ECI/ICI state: used when a load multiple/store
+     * multiple insn executes.
+     */
+    if (s->eci) {
+        TCGv_i32 tmp = tcg_const_i32(0);
+        store_cpu_field(tmp, condexec_bits);
+        s->eci = 0;
+    }
+}
+
 static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 {
     TCGv_i32 tmp1 = tcg_temp_new_i32();
@@ -6203,6 +6216,8 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (!ENABLE_ARCH_5) {
         return false;
     }
+    /* BKPT is OK with ECI set and leaves it untouched */
+    s->eci_handled = true;
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled() &&
 #ifndef CONFIG_USER_ONLY
@@ -7767,6 +7782,8 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         return true;
     }
 
+    s->eci_handled = true;
+
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
 
@@ -7793,6 +7810,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
     }
 
     op_addr_block_post(s, a, addr, n);
+    clear_eci_state(s);
     return true;
 }
 
@@ -7847,6 +7865,8 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         return true;
     }
 
+    s->eci_handled = true;
+
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
     loaded_base = false;
@@ -7897,6 +7917,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
     }
+    clear_eci_state(s);
     return true;
 }
 
@@ -7952,6 +7973,8 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
         return false;
     }
 
+    s->eci_handled = true;
+
     zero = tcg_const_i32(0);
     for (i = 0; i < 15; i++) {
         if (extract32(a->list, i, 1)) {
@@ -7969,6 +7992,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
         tcg_temp_free_i32(maskreg);
     }
     tcg_temp_free_i32(zero);
+    clear_eci_state(s);
     return true;
 }
 
@@ -8150,6 +8174,9 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         return false;
     }
 
+    /* LE/LETP is OK with ECI set and leaves it untouched */
+    s->eci_handled = true;
+
     if (!a->f) {
         /* Not loop-forever. If LR <= 1 this is the last loop: do nothing. */
         arm_gen_condlabel(s);
@@ -8775,8 +8802,28 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->thumb = EX_TBFLAG_AM32(tb_flags, THUMB);
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     condexec = EX_TBFLAG_AM32(tb_flags, CONDEXEC);
-    dc->condexec_mask = (condexec & 0xf) << 1;
-    dc->condexec_cond = condexec >> 4;
+    /*
+     * the CONDEXEC TB flags are CPSR bits [15:10][26:25]. On A-profile this
+     * is always the IT bits. On M-profile, some of the reserved encodings
+     * of IT are used instead to indicate either ICI or ECI, which
+     * indicate partial progress of a restartable insn that was interrupted
+     * partway through by an exception:
+     *  * if CONDEXEC[3:0] != 0b0000 : CONDEXEC is IT bits
+     *  * if CONDEXEC[3:0] == 0b0000 : CONDEXEC is ICI or ECI bits
+     * In all cases CONDEXEC == 0 means "not in IT block or restartable
+     * insn, behave normally".
+     */
+    dc->eci = dc->condexec_mask = dc->condexec_cond = 0;
+    dc->eci_handled = false;
+    dc->insn_eci_rewind = NULL;
+    if (condexec & 0xf) {
+        dc->condexec_mask = (condexec & 0xf) << 1;
+        dc->condexec_cond = condexec >> 4;
+    } else {
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            dc->eci = condexec >> 4;
+        }
+    }
 
     core_mmu_idx = EX_TBFLAG_ANY(tb_flags, MMUIDX);
     dc->mmu_idx = core_to_arm_mmu_idx(env, core_mmu_idx);
@@ -8898,10 +8945,19 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
+    /*
+     * The ECI/ICI bits share PSR bits with the IT bits, so we
+     * need to reconstitute the bits from the split-out DisasContext
+     * fields here.
+     */
+    uint32_t condexec_bits;
 
-    tcg_gen_insn_start(dc->base.pc_next,
-                       (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
-                       0);
+    if (dc->eci) {
+        condexec_bits = dc->eci << 4;
+    } else {
+        condexec_bits = (dc->condexec_cond << 4) | (dc->condexec_mask >> 1);
+    }
+    tcg_gen_insn_start(dc->base.pc_next, condexec_bits, 0);
     dc->insn_start = tcg_last_op();
 }
 
@@ -9067,6 +9123,40 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
     dc->insn = insn;
 
+    if (dc->eci) {
+        /*
+         * For M-profile continuable instructions, ECI/ICI handling
+         * falls into these cases:
+         *  - interrupt-continuable instructions
+         *     These are the various load/store multiple insns (both
+         *     integer and fp). The ICI bits indicate the register
+         *     where the load/store can resume. We make the IMPDEF
+         *     choice to always do "instruction restart", ie ignore
+         *     the ICI value and always execute the ldm/stm from the
+         *     start. So all we need to do is zero PSR.ICI if the
+         *     insn executes.
+         *  - MVE instructions subject to beat-wise execution
+         *     Here the ECI bits indicate which beats have already been
+         *     executed, and we must honour this. Each insn of this
+         *     type will handle it correctly. We will update PSR.ECI
+         *     in the helper function for the insn (some ECI values
+         *     mean that the following insn also has been partially
+         *     executed).
+         *  - Special cases which don't advance ECI
+         *     The insns LE, LETP and BKPT leave the ECI/ICI state
+         *     bits untouched.
+         *  - all other insns (the common case)
+         *     Non-zero ECI/ICI means an INVSTATE UsageFault.
+         *     We place a rewind-marker here. Insns in the previous
+         *     three categories will set a flag in the DisasContext.
+         *     If the flag isn't set after we call disas_thumb_insn()
+         *     or disas_thumb2_insn() then we know we have a "some other
+         *     insn" case. We will rewind to the marker (ie throwing away
+         *     all the generated code) and instead emit "take exception".
+         */
+        dc->insn_eci_rewind = tcg_last_op();
+    }
+
     if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
         uint32_t cond = dc->condexec_cond;
 
@@ -9095,6 +9185,17 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         }
     }
 
+    if (dc->eci && !dc->eci_handled) {
+        /*
+         * Insn wasn't valid for ECI/ICI at all: undo what we
+         * just generated and instead emit an exception
+         */
+        tcg_remove_ops_after(dc->insn_eci_rewind);
+        dc->condjmp = 0;
+        gen_exception_insn(dc, dc->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                           default_exception_el(dc));
+    }
+
     arm_post_translate_insn(dc);
 
     /* Thumb is a variable-length ISA.  Stop translation when the next insn
-- 
2.20.1


