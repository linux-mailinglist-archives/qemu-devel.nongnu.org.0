Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FC689B9F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5P-0007Ph-V9; Fri, 03 Feb 2023 09:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4h-0006tK-HU
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4f-00059a-IY
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso6131861wmp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l0u5UibgcI5qnW9GrxT+wU1ixlLChLWV7gMBX8MNisg=;
 b=NIX3HPCcyhL1s/JRKSFZatiTI0/FkQsTH2xtnHnUeHI8zm3XsdmP0J7eKWy9oiWEHM
 WvF4YlY188KyBd+3IASUswUQeIMWa2jIHQrPJBif/yI0bkv+a8OslDr/U4S8mTlEgi78
 3a1oZ8Hhc6dmli6LF2I9qaX8vxVdBcg7KbMis+VVxf68ZG4XuikXxQjn2aJzO2bkLE95
 xJ6Gf+HZVgH/3NVZPKhhrfm84//WsX/7o2njAETOnTUav+3CxPgFWUCaWZttcMWJYbCB
 /4uvdd42uGJQRB0fCoev7xt63iq1mzHuamChsja7a3VBZ4eLUG0addZS5avmtGrznfq/
 rCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0u5UibgcI5qnW9GrxT+wU1ixlLChLWV7gMBX8MNisg=;
 b=fttKeYRZ4qlDvimXDWIwMnlE7/0C+9LpD9wLeZrNjARmxUQDohNen6WrAzLAT9GMlm
 hhbbPQA9d3/PUp044SrXGi+DLTuuN/HMLPk0kQ2bDcQl2006hgaC6sEuUjZZMq9Yio65
 BRHP4p9M5lAqgRcvxE5zLZ6vNWRzjILV7qA1/NDyxuN/w6jPiiYbgj7eJd+JNPspPkB3
 rl8WtTTzhIqS7AGlRHR45wf6mzyQ0G+MwsKncF1BwqeiG4kqkQSfHTiiageHODM7xGKo
 0dqNEqDFFn4Hgzs6sPxgciCRoUYi0Nbo4uXpljMKgMHe7d+GemGTkUccEL2l7IV6CPkr
 A/FA==
X-Gm-Message-State: AO0yUKVSgEUsq1OIA3kcG1GsDOSOjDYnDK1GhOPbJBUJqL4n7R3Yob66
 OmsDadJI9UpIOJmB47slNw/K0Npp8NgulJWO
X-Google-Smtp-Source: AK7set/t0G7d2VvGLlXGyQTQHvFxJ2sd7olfu7ekECLS4zcVXekf8LmSbtasnMsRt4jRmv56WAx9TA==
X-Received: by 2002:a05:600c:a297:b0:3dc:42e7:f626 with SMTP id
 hu23-20020a05600ca29700b003dc42e7f626mr9618890wmb.26.1675434595402; 
 Fri, 03 Feb 2023 06:29:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1
 traps
Date: Fri,  3 Feb 2023 14:29:25 +0000
Message-Id: <20230203142927.834793-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 fine-grained traps.
These trap execution of the SVC instruction from AArch32 and AArch64.
(As usual, AArch32 can only trap from EL0, as fine grained traps are
disabled with an AArch32 EL1.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-22-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-22-peter.maydell@linaro.org
---
 target/arm/cpu.h           |  1 +
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 20 ++++++++++++++++++++
 target/arm/translate-a64.c |  9 ++++++++-
 target/arm/translate.c     | 12 +++++++++---
 5 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ec2a7716ce7..7bc97fece97 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3171,6 +3171,7 @@ FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 FIELD(TBFLAG_ANY, ALIGN_MEM, 10, 1)
 FIELD(TBFLAG_ANY, PSTATE__IL, 11, 1)
 FIELD(TBFLAG_ANY, FGT_ACTIVE, 12, 1)
+FIELD(TBFLAG_ANY, FGT_SVC, 13, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 62a7706eabd..3717824b754 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -134,6 +134,8 @@ typedef struct DisasContext {
     bool fgt_active;
     /* True if fine-grained trap on ERET is enabled */
     bool fgt_eret;
+    /* True if fine-grained trap on SVC is enabled */
+    bool fgt_svc;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6151c775053..c62ed05c122 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11842,6 +11842,20 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
+static inline bool fgt_svc(CPUARMState *env, int el)
+{
+    /*
+     * Assuming fine-grained-traps are active, return true if we
+     * should be trapping on SVC instructions. Only AArch64 can
+     * trap on an SVC at EL1, but we don't need to special-case this
+     * because if this is AArch32 EL1 then arm_fgt_active() is false.
+     * We also know el is 0 or 1.
+     */
+    return el == 0 ?
+        FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL0) :
+        FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, SVC_EL1);
+}
+
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
@@ -11927,6 +11941,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 
     if (arm_fgt_active(env, el)) {
         DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
+        if (fgt_svc(env, el)) {
+            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
+        }
     }
 
     if (env->uncached_cpsr & CPSR_IL) {
@@ -12068,6 +12085,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, ERET)) {
             DP_TBFLAG_A64(flags, FGT_ERET, 1);
         }
+        if (fgt_svc(env, el)) {
+            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
+        }
     }
 
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 11bfa3f717a..bbfadb7c2e8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2179,6 +2179,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
+    uint32_t syndrome;
 
     switch (opc) {
     case 0:
@@ -2189,8 +2190,13 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          */
         switch (op2_ll) {
         case 1:                                                     /* SVC */
+            syndrome = syn_aa64_svc(imm16);
+            if (s->fgt_svc) {
+                gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
+                break;
+            }
             gen_ss_advance(s);
-            gen_exception_insn(s, 4, EXCP_SWI, syn_aa64_svc(imm16));
+            gen_exception_insn(s, 4, EXCP_SWI, syndrome);
             break;
         case 2:                                                     /* HVC */
             if (s->current_el == 0) {
@@ -14751,6 +14757,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_svc = EX_TBFLAG_ANY(tb_flags, FGT_SVC);
     dc->fgt_eret = EX_TBFLAG_A64(tb_flags, FGT_ERET);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3f51dc6a6bf..c23a3462bfc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8834,9 +8834,14 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
-        gen_update_pc(s, curr_insn_len(s));
-        s->svc_imm = a->imm;
-        s->base.is_jmp = DISAS_SWI;
+        if (s->fgt_svc) {
+            uint32_t syndrome = syn_aa32_svc(a->imm, s->thumb);
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
+        } else {
+            gen_update_pc(s, curr_insn_len(s));
+            s->svc_imm = a->imm;
+            s->base.is_jmp = DISAS_SWI;
+        }
     }
     return true;
 }
@@ -9417,6 +9422,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_svc = EX_TBFLAG_ANY(tb_flags, FGT_SVC);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.34.1


