Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B03F3C62
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:07:21 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXGy-0004Rc-EO
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9z-0002B5-Ty
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9w-0004Va-I2
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id y190so11739249pfg.7
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hn7fpe16SCWF4h1OR7HYJ+ccPYtVq+eIAGolsqSBqQg=;
 b=FPkA54iO9x5uIRs0eU6ZRiQrqcJBIYj4gLFIRCAqbF96eZDS4MOlnJQqrtbZlNVs6F
 YU8nraOK3x49ZTaV1DbJIt2CCFjWOKSazSFPAYYvbk5Yroh9VCboQSTwKiycn5P+BHEL
 00kBPDaKye+51c197gCbSqqyeR7KdA3BxNkLjIW00rLGjKWAArvfrUiEHCOoa25aD+c6
 +EzkLcgdtqHHeQzA/eJusxb+OwlCx0JKY+i1mWnccaybqrW7vX310/5BvUznKq6WGhYH
 vQ+Kj0xtGkmvtfQeCiKl18cy9MMHmED0hYGCX86QdtXPj/YFNepeNg4CzNwuJUhoFcNC
 CGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hn7fpe16SCWF4h1OR7HYJ+ccPYtVq+eIAGolsqSBqQg=;
 b=rdq9YNuQQruoDGte/xJ2Kce7G/CPkLDNCz9oPaFfQ9RTLSWAtOc2HEdArkE1qQ8eVG
 2CjnW5oL2sMFSLugjScK/Sqh4wslDpEKX00QK++c5ONp/aM6TeXUEkleK+Ea2LNKqS2M
 zMUYGDKWeICH2Ax4EbhheWfeusM44s+m0q9jOKb2wa2QPa1guKjAyFtxPT6rh5nXHsEt
 mRqcYqyOi/sKHuWbMNqdUNYVv+fMvYdxYUISJZxq9cOW46T3TL5CogJ4g9OzUkwZTD59
 qPm3wGJ4xwM9MHzdApwJu7xfgxLsq+Svl1SYOp/NLErDMAYlXMB2xNvAyzvgmtOFpv7b
 jMQw==
X-Gm-Message-State: AOAM530qCPDFDUpQrB+lsk4Jt4IAdiwspe5KaRTAxti7vN8A3qYTRCWI
 FTIalcBJQZHmp9YdsfpRYCRqF134IjEEpQ==
X-Google-Smtp-Source: ABdhPJzWxVhXE+wSOa5SQmVfoLf9raUtwyn3XBOz+5jqzIMAWzcpI77X4zjzAUlFnIyLIyKjAOm6dg==
X-Received: by 2002:a65:6398:: with SMTP id h24mr24869431pgv.367.1629576002913; 
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
Date: Sat, 21 Aug 2021 12:59:55 -0700
Message-Id: <20210821195958.41312-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For A64, any input to an indirect branch can cause this.

For A32, many indirect branch paths force the branch to be aligned,
but BXWritePC does not.  This includes the BX instruction but also
other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
exception or force align the PC.

We choose to raise an exception because we have the infrastructure,
it makes the generated code for gen_bx simpler, and it has the
possibility of catching more guest bugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/syndrome.h      |  5 +++++
 target/arm/tlb_helper.c    | 24 +++++++++++++++++++++++
 target/arm/translate-a64.c | 21 ++++++++++++++++++--
 target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
 5 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 248569b0cd..d629ee6859 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 54d135897b..e9d97fac6e 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
     return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_pcalignment(void)
+{
+    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 3107f9823e..25c422976e 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/helper-proto.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
@@ -123,6 +124,29 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
+void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
+{
+    int target_el = exception_target_el(env);
+
+    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
+        /*
+         * To aarch64 and aarch32 el2, pc alignment has a
+         * special exception class.
+         */
+        env->exception.vaddress = pc;
+        env->exception.fsr = 0;
+        raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
+    } else {
+        /*
+         * To aarch32 el1, pc alignment is like data alignment
+         * except with a prefetch abort.
+         */
+        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
+        arm_deliver_fault(env_archcpu(env), pc, MMU_INST_FETCH,
+                          cpu_mmu_index(env, true), &fi);
+    }
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 333bc836b2..39c2fb8c7e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14752,8 +14752,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *s = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint64_t pc = s->base.pc_next;
     uint32_t insn;
 
+    /* Singlestep exceptions have the highest priority. */
     if (s->ss_active && !s->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -14768,13 +14770,28 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         assert(s->base.num_insns == 1);
         gen_swstep_exception(s, 0, 0);
         s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = pc + 4;
         return;
     }
 
-    s->pc_curr = s->base.pc_next;
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code.
+         * This should only be possible after an indirect branch, at the
+         * start of the TB.
+         */
+        assert(s->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        s->base.is_jmp = DISAS_NORETURN;
+        s->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
+    s->pc_curr = pc;
     insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5e0fc8a0a0..dfeaa2321d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9452,7 +9452,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_kernelpage(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
     /* Intercept jump to the magic kernel page.  */
@@ -9464,7 +9464,11 @@ static bool arm_pre_translate_insn(DisasContext *dc)
         return true;
     }
 #endif
+    return false;
+}
 
+static bool arm_check_ss_active(DisasContext *dc)
+{
     if (dc->ss_active && !dc->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -9498,17 +9502,38 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
+    uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
-    if (arm_pre_translate_insn(dc)) {
-        dc->base.pc_next += 4;
+    /* Singlestep exceptions have the highest priority. */
+    if (arm_check_ss_active(dc)) {
+        dc->base.pc_next = pc + 4;
         return;
     }
 
-    dc->pc_curr = dc->base.pc_next;
-    insn = arm_ldl_code(env, dc->base.pc_next, dc->sctlr_b);
+    if (pc & 3) {
+        /*
+         * PC alignment fault.  This has priority over the instruction abort
+         * that we would receive from a translation fault via arm_ldl_code
+         * (or the execution of the kernelpage entrypoint). This should only
+         * be possible after an indirect branch, at the start of the TB.
+         */
+        assert(dc->base.num_insns == 1);
+        gen_helper_exception_pc_alignment(cpu_env, tcg_constant_tl(pc));
+        dc->base.is_jmp = DISAS_NORETURN;
+        dc->base.pc_next = QEMU_ALIGN_UP(pc, 4);
+        return;
+    }
+
+    if (arm_check_kernelpage(dc)) {
+        dc->base.pc_next = pc + 4;
+        return;
+    }
+
+    dc->pc_curr = pc;
+    insn = arm_ldl_code(env, pc, dc->sctlr_b);
     dc->insn = insn;
-    dc->base.pc_next += 4;
+    dc->base.pc_next = pc + 4;
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
@@ -9570,7 +9595,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
     }
-- 
2.25.1


