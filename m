Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B3410E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:48:27 +0200 (CEST)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9M2-0008Gw-A7
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iu-0005DC-Ur
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Ir-0008DI-RI
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so14907846pff.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOM7VdjppvOQio1FebUdQG/S4ihUXuMBVVoQ3T4V5Ts=;
 b=pHdUM4kyoVpVHqV8W3Nx2y52gXeyp1b3385iG9og4GNlqIj5Ug9DacpXVoC/0nQzQ4
 0RdsbQaXCuBXJ9Nhe9dlPC7gbQgzvNVWLGkUHQJ/xEiTkhPkksFvHSSs01SlVYZXlpd5
 1yHWSa4oPE0t28OBQvxA2+utpqAPD4BO8FOaOYS7i0Oo58WwIV2UELrK3vvgEFwaEqiU
 /89V0YSsSJtv2Xj8eErHq52GeRQGTY/CPnCuxks6Ja5m+aSufx84TP+F4zALmwSAKubJ
 CPbdhOGiUMoqcRCQWrKlnFLqOzeWcJbcnPfij++VdMFwM77JbSmlRrkCtPVChpBep8t9
 vjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOM7VdjppvOQio1FebUdQG/S4ihUXuMBVVoQ3T4V5Ts=;
 b=AAwHc5YY7CcSwDY8YSi/wvpichh8jMm0TrPG/NjZAsrqjVEBoQRJ81szPBaanVwEiV
 EcRnSliomIedoc7wkIE0rahd+iXCu2WGR1CmowH/cF4BT+jmkCQgENAYpi4lXnOhl5mE
 +bQoCJrnVLXgOu5rgr+Ufb1rewrKX+pUYPC8FvrIYsjIJMzod3kb81kDK5Jeau35uGhL
 Y7b0laGSgyzLxE7ayK+Pysxhgw7cNLCzRZreFzU79YVLF2Qo9/ipeT5kUt2o3XXCNwUo
 CBpv/eKv6o4efPlGbNFig2eq3g+VOHJKVxLc+DeuDg5Lok9kPo8DO62el/JRbGaRuShP
 4j7g==
X-Gm-Message-State: AOAM5301k9CYZlQfUdtBQX83If3+RcrRPs3GRzJEjOv0BoEy12nuQCYN
 PvASDnh9ghBoVDtnD20RhA0Jeavfn5UhpQ==
X-Google-Smtp-Source: ABdhPJw1r+Ybt4obf4oAyCJUQl3nNiEucr9UNgNkid1RJ+tviRpDmCma5k7A/ztv4uhIZJp8uYLpYA==
X-Received: by 2002:a63:7405:: with SMTP id p5mr21257119pgc.426.1632105908468; 
 Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] target/arm: Take an exception if PC is misaligned
Date: Sun, 19 Sep 2021 19:45:01 -0700
Message-Id: <20210920024504.625965-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 target/arm/translate-a64.c | 23 +++++++++++++++++++---
 target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
 5 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 448a86edfd..b463d9343b 100644
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
index f30f4130a2..8cde8e7243 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -282,4 +282,9 @@ static inline uint32_t syn_illegalstate(void)
     return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_pcalignment(void)
+{
+    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index dc5860180f..1a50927bd6 100644
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
index ab6b346e35..8c72e37de3 100644
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
-    insn = arm_ldl_code(env, &s->base, s->base.pc_next, s->sctlr_b);
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
+    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
     s->insn = insn;
-    s->base.pc_next += 4;
+    s->base.pc_next = pc + 4;
 
     s->fp_access_checked = false;
     s->sve_access_checked = false;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index caefb1e1a1..62c396b880 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9497,7 +9497,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_kernelpage(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
     /* Intercept jump to the magic kernel page.  */
@@ -9509,7 +9509,11 @@ static bool arm_pre_translate_insn(DisasContext *dc)
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
@@ -9543,17 +9547,38 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
-    insn = arm_ldl_code(env, &dc->base, dc->base.pc_next, dc->sctlr_b);
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
+    insn = arm_ldl_code(env, &dc->base, pc, dc->sctlr_b);
     dc->insn = insn;
-    dc->base.pc_next += 4;
+    dc->base.pc_next = pc + 4;
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
@@ -9615,7 +9640,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next += 2;
         return;
     }
-- 
2.25.1


