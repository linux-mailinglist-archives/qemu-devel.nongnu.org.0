Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9473EF723
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 03:06:42 +0200 (CEST)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGA2T-0004Ua-OK
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 21:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wu-00049L-Ux
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:57 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wl-0001Kx-C4
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso4213833pjb.1
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 18:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MnDP8HjuwI7Ozvw8OKIQCnWMBJ/JVU5d/240T32zMU=;
 b=M3jTGXmuGe0XK8Kd+q7dwEV0cB/bME4FDl5JCMSHKQpZShWnP4PkYSSnEyIaTRUD0R
 MnT1ytiINHFeSaWhG0VU3JHJIf0kdGocUT8oH9iKgZP1B7zHPKjALJpYtHdgQkJ1gDGi
 NBFclj9LLQsIJtqDBm/QoWbCQx5lU8EGY340xwshD/sAIagIqXa1WlkcDSoYe3QNF9Ba
 e97NKBcam2dHjZ2vNyNu+XUKK0RTAkXBiV9I4JCOGlw9DXyHwoxQMg97h5BUHjfIv+xe
 BC2cSM6NVgTf+nrSV0t3gY3tAX205V9Gao8iAlwyJmQHjnKZgfjjcGnDdlzskaz/X74h
 aOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MnDP8HjuwI7Ozvw8OKIQCnWMBJ/JVU5d/240T32zMU=;
 b=DOfD0XAdHeP4AtyUbWSnZjU1D1VqBtL6Ymx+QwnYcdx7VJhxSAT9TTRj3m8V2Yr1vE
 NW5XMuhVm96rWSywkQeSBb4GmbPE9X03t0reaDg9S7OSCwcbyGjOIaIdLktvFrAAo0kp
 7J4F/wXnlOM1CZf+YQBLp2GigFyo2lzz07RQTHAe/G6ZSo9lfC3c5aX7XHCOUPy3Q3jU
 hJozRApp8qkRMdxay7sfgD7m82Cbqy14jbPDk9KcFay2k+hL0Eh4D529Qtt1ZGw7EzSM
 vd6WdX4JOocORE5i7PB1SUydSJjUAmTQcfTrE/pE9VwyHieMYWcnRYGm6JzfuMqmZL7X
 I1oQ==
X-Gm-Message-State: AOAM533ePzb5+S5Znyw2VNiRr9s9FZgR6Yt17ytmXwu0kny5JGxejLeW
 nQGhOKaKUMCA/Qm1VXvk3276gdSDLvwF4w==
X-Google-Smtp-Source: ABdhPJxBJKtyspsy2ATGVIdO5FzSJzM3uoozDMOPC3/VitcfTMgQ83sG3LP//KG75G3xDWezhmhVJw==
X-Received: by 2002:a17:90b:3718:: with SMTP id
 mg24mr6598021pjb.158.1629248445981; 
 Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Take an exception if PSTATE.IL is set
Date: Tue, 17 Aug 2021 15:00:38 -1000
Message-Id: <20210818010041.337010-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010041.337010-1-richard.henderson@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20210817162118.24319-1-peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Added missing returns.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/syndrome.h      |  5 +++++
 target/arm/translate.h     |  2 ++
 target/arm/helper-a64.c    |  1 +
 target/arm/helper.c        |  8 ++++++++
 target/arm/translate-a64.c | 11 +++++++++++
 target/arm/translate.c     | 21 +++++++++++++++++++++
 7 files changed, 49 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d5..be557bf5d8 100644
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
index 39a31260f2..c590a109da 100644
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
index 241596c5bd..af1b6fa03c 100644
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
index 26f79f9141..19445b3c94 100644
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
index 155d8bf239..201ecf8c67 100644
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
index 422e2ac0c9..230cc8d83b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14662,6 +14662,16 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     s->fp_access_checked = false;
     s->sve_access_checked = false;
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+        return;
+    }
+
     if (dc_isar_feature(aa64_bti, s)) {
         if (s->base.num_insns == 1) {
             /*
@@ -14780,6 +14790,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f..5e0fc8a0a0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9045,6 +9045,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         return;
     }
 
+    if (s->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(s));
+        return;
+    }
+
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
          * choose to UNDEF. In ARMv5 and above the space is used
@@ -9313,6 +9323,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
@@ -9576,6 +9587,16 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
     dc->insn = insn;
 
+    if (dc->pstate_il) {
+        /*
+         * Illegal execution state. This has priority over BTI
+         * exceptions, but comes after instruction abort exceptions.
+         */
+        gen_exception_insn(dc, dc->pc_curr, EXCP_UDEF,
+                           syn_illegalstate(), default_exception_el(dc));
+        return;
+    }
+
     if (dc->eci) {
         /*
          * For M-profile continuable instructions, ECI/ICI handling
-- 
2.25.1


