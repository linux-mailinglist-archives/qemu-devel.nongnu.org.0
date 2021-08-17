Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000353EF021
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:22:25 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1r7-0003OP-2z
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1q8-0002Vt-00
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:21:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1q6-0002Gv-4L
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 12:21:23 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f5so29432437wrm.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HkTlNHSIPAIX74t2l5NVRwQupFxsN9vScryo2WGuL+Q=;
 b=qoZcIOVOSTXcitVaI56SM5MqbnCFLGnpJnODT/1Fs7mc/6rcSCYSp8HfBya12yknkX
 WGXVhU40eYlk2tr5ScCDvlY5hMcDp4FVhE0d5bhG0oMvsmKW/4jeFINDzS5ZgpcDvVBS
 tPUvMK3zoiZo8WNz8SdervzUxJ+78x1XUtv+DCxYc7W8JUzS/ujZcTzINev6xLJ3v5da
 6OmqC39BbDdsjIPWmXJ/nFEc7PwYe5Opfymn4t7Kxne57PLz0WwTxkU7tpTdENUayk2i
 ho5T9+7VkeXwpuUVhheb75QhOmJ8iZ8D0H9rPkvSSqppE5kDzXXGkCAafxY9a+YEO4Vl
 Ra2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HkTlNHSIPAIX74t2l5NVRwQupFxsN9vScryo2WGuL+Q=;
 b=Gi3otEA4Py110VU9HJV5x6fjPc2lnlJK8lfOB4g2/CIbWwo1EuwWqI/YLDaYlb61EJ
 ed56ipfDIA5fzpLrRI/zb9LObBIf4m/aCoMM+PmpiTT0hVroBwyrFJceiyHwd8qqG466
 kXBWWCD/wqhjJtye3qNlG+kd0H6isyvvLAre2Q4AxkjExJl591oSl91hl+YsLRTn0NpH
 Y/9Pt6M29kMPf54lIsyOvFjmruY6tB6pedrXdLPhB+9j4Up1bG+ONnha6iaj2mSnhzeV
 7drm3CGIF6GVOWutuJklo8DfyeAz2VWPn2+MSjFyo/eTsfLGePg4TBNQu9O/c7QWoW/j
 NnKA==
X-Gm-Message-State: AOAM532QzVUpNTrxFQXCsf6SWTmNvXlixo8WogHCwpgt4HFNGNVBBipZ
 JboQmgid9DksqkJI1eWkJZV7XFq9SuhopA==
X-Google-Smtp-Source: ABdhPJzix0+fbx1kkX421E2EZWCEW+sTAW+WXO9egg4RCp4nly5I5KneVB+BelEZ31nCF/+znTcGUg==
X-Received: by 2002:a5d:4d03:: with SMTP id z3mr5309345wrt.229.1629217280562; 
 Tue, 17 Aug 2021 09:21:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z126sm2666665wmc.11.2021.08.17.09.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 09:21:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Take an exception if PSTATE.IL is set
Date: Tue, 17 Aug 2021 17:21:18 +0100
Message-Id: <20210817162118.24319-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

In v8A, the PSTATE.IL bit is set for various kinds of illegal
exception return or mode-change attempts.  We already set PSTATE.IL
(or its AArch32 equivalent CPSR.IL) in all those cases, but we
weren't implementing the part of the behaviour where attempting to
execute an instruction with PSTATE.IL takes an immediate exception
with an appropriate syndrome value.

Add a new TB flags bit tracking PSTATE.IL/CPSR.IL, and generate code
to take an exception instead of whatever the instruction would have
been.

PSTATE.IL and CPSR.IL change only on exception entry, attempted
exception exit, and various AArch32 mode changes via cpsr_write().
These places generally already rebuild the hflags, so the only place
we need an extra rebuild_hflags call is in the illegal-return
codepath of the AArch64 exception_return helper.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Obviously correct guest code is never going to set PSTATE.IL, but
it's pretty confusing to debug bugs in guest OSes if we just plough
on executing code rather than taking the illegal-state exception.  We
had a user point this bug out to us earlier this year I think
(probably on IRC since I can't find anything about it in my email).
---
 target/arm/cpu.h           |  1 +
 target/arm/syndrome.h      |  5 +++++
 target/arm/translate.h     |  2 ++
 target/arm/helper-a64.c    |  1 +
 target/arm/helper.c        |  8 ++++++++
 target/arm/translate-a64.c | 10 ++++++++++
 target/arm/translate.c     | 19 +++++++++++++++++++
 7 files changed, 46 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d50..be557bf5d83 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3441,6 +3441,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
 FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
+FIELD(TBFLAG_ANY, PSTATE__IL, 13, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 39a31260f2d..c590a109da9 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -270,4 +270,9 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
            (cv << 24) | (cond << 20) | ti;
 }
 
+static inline uint32_t syn_illegalstate(void)
+{
+    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 241596c5bda..af1b6fa03c9 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -98,6 +98,8 @@ typedef struct DisasContext {
     bool hstr_active;
     /* True if memory operations require alignment */
     bool align_mem;
+    /* True if PSTATE.IL is set */
+    bool pstate_il;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 26f79f9141a..19445b3c947 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1071,6 +1071,7 @@ illegal_return:
     if (!arm_singlestep_active(env)) {
         env->pstate &= ~PSTATE_SS;
     }
+    helper_rebuild_hflags_a64(env, cur_el);
     qemu_log_mask(LOG_GUEST_ERROR, "Illegal exception return at EL%d: "
                   "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf2399..201ecf8c67f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13408,6 +13408,10 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
+    if (env->uncached_cpsr & CPSR_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -13502,6 +13506,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (env->pstate & PSTATE_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
         /*
          * Set MTE_ACTIVE if any access may be Checked, and leave clear
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 422e2ac0c96..7ff922d4302 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14662,6 +14662,15 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     s->fp_access_checked = false;
     s->sve_access_checked = false;
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+    }
+
     if (dc_isar_feature(aa64_bti, s)) {
         if (s->base.num_insns == 1) {
             /*
@@ -14780,6 +14789,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f0..5dffbe4260b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9045,6 +9045,15 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+    }
+
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
@@ -9313,6 +9322,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
@@ -9576,6 +9586,15 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
     dc->insn = insn;
 
+    if (dc->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(dc));
+    }
+
     if (dc->eci) {
         /*
          * For M-profile continuable instructions, ECI/ICI handling
-- 
2.20.1


