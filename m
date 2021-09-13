Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C6409995
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:42:54 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPp2j-0008RJ-OF
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYv-00018Q-PF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYs-0008Fb-Gu
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so7433320wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Zz+XXnR82d1+nOU34apWR43o+z8/4Rka6z5QRXYMUMw=;
 b=io7zhc0GpMlxRX6kKQBoywkJqsUdLY6zaM9R5PMQVzE0V9u+VHAa16HPKMZg64datY
 1OhOJedclpUnfkzmi+OW5sPRdNO+bcAnFX5uSkL+j8IRfx36YAtQfTe7NvHwp0mNKpjM
 /iHk+/ClRy8KQuOc5tjiMUFoNN85BuqIPh6rcGsgBteWwjvuT886XwMQlOU4Xqfpkf7G
 7rc7r1PUgMe3VRB0i4MUgM6iFGQ1CWx0TNpcT7AsXo02DjCAj9emL1MN6DLuBapDtyHo
 muvzUy9Ay9yDflW5NBqg2pCKnFo1Kj5DUuV848ELt0R93hTkmVL+xmgNhN1/dnMmOTqC
 k0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zz+XXnR82d1+nOU34apWR43o+z8/4Rka6z5QRXYMUMw=;
 b=qIqXJuD//CkSgIbLfVVeMUUzTktJycZ/4y+R+LevChiwcvyjk9AI8/Kyd/xJQJq7Yy
 AaI0ASKMfScqW84UHW7nt8aDXwDDp8PLue1ISSJcG2gjQ1+KKcMaubYswwH+jhrPOILs
 AG++MQXwhqvLm/0tyF+uFf2DVD4ozoH8OU44pAaYNEnFhRiJYp4AqX4dYCunUCiYfsAT
 P740T43tcmrFqg1XW7iD2+80EYxjrU94jMUA1Fx6WGoGnRqnshFuOJQQ+pIF4QF2bXiX
 yA5Jd2JAwwOv7YndzNj9+JPBsgakn9GgvfwfDXWcV6p8cvusYyKFrkMxmQzMne1yjRfJ
 XTOw==
X-Gm-Message-State: AOAM5314QNUb6q2v0wwyh/IA/wCCKY89qX4dtFJ7NpQDypeX94oSdAgt
 Q4aNRS8gCMCBkglOW1R99ZkAtHmHkLYqSg==
X-Google-Smtp-Source: ABdhPJw6gZTJHjWPDCVigV5WoDssNH7f+LYuDCo7np0x6eHY+c1PPafLwSnK/ZqsTXwP7gK0gHuuEg==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr12393266wmc.180.1631549521199; 
 Mon, 13 Sep 2021 09:12:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.12.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] target/arm: Take an exception if PSTATE.IL is set
Date: Mon, 13 Sep 2021 17:11:39 +0100
Message-Id: <20210913161144.12347-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210821195958.41312-2-richard.henderson@linaro.org
Message-Id: <20210817162118.24319-1-peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Added missing returns; set IL bit in syndrome]
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
index 6a987f65e41..fb0ef1ee2c9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3455,6 +3455,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
 FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
+FIELD(TBFLAG_ANY, PSTATE__IL, 13, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 8dd88a0cb17..f30f4130a27 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -277,4 +277,9 @@ static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
            (cv << 24) | (cond << 20) | ti;
 }
 
+static inline uint32_t syn_illegalstate(void)
+{
+    return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8636c20c3b4..605d1f2e33d 100644
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
index a7ae78146d4..b210da2bc26 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13462,6 +13462,10 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
+    if (env->uncached_cpsr & CPSR_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -13556,6 +13560,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
index 422e2ac0c96..230cc8d83bf 100644
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
index 24b7f49d767..435c6597239 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9090,6 +9090,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -9358,6 +9368,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
+    dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
@@ -9621,6 +9632,16 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
2.20.1


