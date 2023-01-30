Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4568190F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqU-0001Fh-GW; Mon, 30 Jan 2023 13:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqO-0001BL-Kw
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:28 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqJ-0008O3-9L
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t18so12011113wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VeFx9B0Mzz35VrXD2mipraCVegd6Rxt0nAjW/UplbN4=;
 b=A3sdf5PIuD4Pv/SyIV5fxs3BaQUCZ4p5N9i/qgbiEW9jdqvYZaACf6SWA+bIVwf4aZ
 Da6kg+VYWu++RcD2mCliEXXT2h7KsXQ3WHR1QwkRnixG8RgLj5w9sAFfKkbMQWlP1qeY
 ZxSBz97vOgThfunKwQJswoOGSmVzcvgg8sKFjUHDbjtSXYyM4NVMMwM6STmotcFc7Dsb
 u6FI86NeRfqu8xZGG3jajRwRIl6A0EKoROOk72QAH/4o207QIt/P4XoW/FBAnWhpuWji
 9+iIbfkGl1qH4qQegCSsSCMnN548IFLu7Mz2SxoJBZV7w1pogDMEhud7pVKhi02lWJY/
 qzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VeFx9B0Mzz35VrXD2mipraCVegd6Rxt0nAjW/UplbN4=;
 b=flDIIXKRmq3hX7KPblP/pdnc2yHPg+BLjY+NliHlf4BODQkSCqecL/l5fVFP4zw7vB
 SkR7cUT3TIEs7GtG77pcaxLbkV7XiNR9sIfnebN4u+VT2DzE75o6nRJCPgr8GwrKXyt9
 8OhGOOaolZgU/2WZPUpNM7+y0m0VhWaBSkJgnOQH/q1GQAC7yRI3sTZYXpk0QneAbdjE
 YafU1InQY8rqpqoWnXq7iV/9GOhu5c77F8wIt8tsox6m4wAiIhHUAnHVZg9eqGKdO8H2
 Gly2R4kQNCbNNcJV2FkmAnKVAtlSBkfdH3UBwJYjvkjVNWc3LrpwiocIE3LYJ9EOxuhG
 yhpQ==
X-Gm-Message-State: AO0yUKV0vdOv0FU+l1b3RzTlHUtkzUvpP0QXsuu2jMpiP3nJX949I7AX
 1wNkEAn1xb/oi8rV2199XHHzzFN+d0EJtC9K
X-Google-Smtp-Source: AK7set+k3mDKQbLzLKfCNCTEoLO09cNacMeZH/6962EonFWx3LQhcnWHvRPubFts8hZQWX4Ah4fokA==
X-Received: by 2002:adf:9790:0:b0:2bf:d425:11ba with SMTP id
 s16-20020adf9790000000b002bfd42511bamr484301wrb.22.1675103122521; 
 Mon, 30 Jan 2023 10:25:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/23] target/arm: Implement the HFGITR_EL2.SVC_EL0 and
 SVC_EL1 traps
Date: Mon, 30 Jan 2023 18:24:57 +0000
Message-Id: <20230130182459.3309057-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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


