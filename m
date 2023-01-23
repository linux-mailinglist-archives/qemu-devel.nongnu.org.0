Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E362677CB8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:40:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx0j-00072a-Oa; Mon, 23 Jan 2023 08:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzm-00061L-3d
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzj-0002MF-K1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso10605738wmc.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pSfx3spfZRksbaPoHAooOlaakQpNRrolJmeYWC6KI2k=;
 b=sBoFENcuAe6sLAeXbyMmf0+Tbvt6UydaiSKgLhNpquIYNRJicov9l7flRsJ8yi5pzq
 XpXcJNKTWchtla7DxNyzW286ivTaf0bjLK3wgej1/iJ9UVzHLLZAchwIHwHbTnA3FAKi
 Ugd/dB+3U6thIkUMi9RPWm+MJQVKkXoKnBXEkbJ4NLJvb3iDabXxEmH9pgfGjBZpYybZ
 WK/sGeLtnXDCFd1n7NFZ3ikufn2awVIbGnNgEN3X9epNkBv3Rw7eTSR7evLOiosxzr8r
 XqT1lk30EeRuXXIm6nMt4moxPcQzxe/kTqdaHfiwQlJaa2pU0uwRpF46II3zQprphhun
 Yjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSfx3spfZRksbaPoHAooOlaakQpNRrolJmeYWC6KI2k=;
 b=RzPxDvTSsYaolei00EoYzkf//0UxTclNCdTmXUyGTgm+jBqwssID6ClepNq0CruSPM
 wlA6/VPaAlHUFYuobcxpdJszb4wbj5slVyb8KBloLO2gSmCosZrFJtMh6A8mR8vumUnB
 tPeGUy84JsyrD5d+x4o5WW8Outg3EaU2umzaZ7zEDlStyidKwvVeCQ4LBqoIep0LOstW
 mPQfp2HF0HoDhoJu1NgfQMfPHgjhFvfKZcjsKe+WfGQIjOPZ1BrfIegOy2tdeDjOhT09
 FiWnGHOFLtckljN+6v1CNlHE906n8MiDXfTDrnscjchb9wulyAhoQAuWSAIbDivKHlml
 NGNQ==
X-Gm-Message-State: AFqh2krVfQo7jO2EkJGK3xneCIEYVcnQs9ObpYsCwk82CtqJB+se0AQI
 i6Jdi7w0xhT85/cXpaogSA1i6EddaW32Jd7j
X-Google-Smtp-Source: AMrXdXtD0YBwVfNzjmTCPvC2YqR28yQRyRrL2bLYx2csv4QLHdyGzbSqGsse66zVCnYBVWGg+KlZ6g==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id
 ip16-20020a05600ca69000b003d564bfccb8mr23568436wmb.12.1674480978614; 
 Mon, 23 Jan 2023 05:36:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] target/arm: Look up ARMCPRegInfo at runtime
Date: Mon, 23 Jan 2023 13:35:53 +0000
Message-Id: <20230123133553.2171158-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Do not encode the pointer as a constant in the opcode stream.
This pointer is specific to the cpu that first generated the
translation, which runs into problems with both hot-pluggable
cpus and user-only threads, as cpus are removed. It's also a
potential correctness issue in the theoretical case of a
slightly-heterogenous system, because if CPU 0 generates a
TB and then CPU 1 executes it, CPU 1 will end up using CPU 0's
hash table, which might have a wrong set of registers in it.
(All our current systems are either completely homogenous,
M-profile, or have CPUs sufficiently different that they
wouldn't be sharing TBs anyway because the differences would
show up in the TB flags, so the correctness issue is only
theoretical, not practical.)

Perform the lookup in either helper_access_check_cp_reg,
or a new helper_lookup_cp_reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230106194451.1213153-3-richard.henderson@linaro.org
[PMM: added note in commit message about correctness issue]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        | 11 +++++----
 target/arm/translate.h     |  7 ++++++
 target/arm/op_helper.c     | 27 ++++++++++++++------
 target/arm/translate-a64.c | 49 ++++++++++++++++++++++---------------
 target/arm/translate.c     | 50 +++++++++++++++++++++++++-------------
 5 files changed, 95 insertions(+), 49 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 92f36d9dbb7..018b00ea75b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -79,11 +79,12 @@ DEF_HELPER_2(v8m_stackcheck, void, env, i32)
 
 DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
-DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
-DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
-DEF_HELPER_2(get_cp_reg, i32, env, ptr)
-DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
-DEF_HELPER_2(get_cp_reg64, i64, env, ptr)
+DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
+DEF_HELPER_FLAGS_2(lookup_cp_reg, TCG_CALL_NO_RWG_SE, cptr, env, i32)
+DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
+DEF_HELPER_2(get_cp_reg, i32, env, cptr)
+DEF_HELPER_3(set_cp_reg64, void, env, cptr, i64)
+DEF_HELPER_2(get_cp_reg64, i64, env, cptr)
 
 DEF_HELPER_2(get_r13_banked, i32, env, i32)
 DEF_HELPER_3(set_r13_banked, void, env, i32, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3cdc7dbc2fb..f17f095cbe2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -610,6 +610,13 @@ static inline void set_disas_label(DisasContext *s, DisasLabel l)
     s->pc_save = l.pc_save;
 }
 
+static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    gen_helper_lookup_cp_reg(ret, cpu_env, tcg_constant_i32(key));
+    return ret;
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70672bcd9fc..31f89db8997 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -624,14 +624,16 @@ uint32_t HELPER(mrs_banked)(CPUARMState *env, uint32_t tgtmode, uint32_t regno)
     }
 }
 
-void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
-                                 uint32_t isread)
+const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
+                                        uint32_t syndrome, uint32_t isread)
 {
     ARMCPU *cpu = env_archcpu(env);
-    const ARMCPRegInfo *ri = rip;
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     CPAccessResult res = CP_ACCESS_OK;
     int target_el;
 
+    assert(ri != NULL);
+
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
         res = CP_ACCESS_TRAP;
@@ -663,7 +665,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         res = ri->accessfn(env, ri, isread);
     }
     if (likely(res == CP_ACCESS_OK)) {
-        return;
+        return ri;
     }
 
  fail:
@@ -705,7 +707,16 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
 }
 
-void HELPER(set_cp_reg)(CPUARMState *env, void *rip, uint32_t value)
+const void *HELPER(lookup_cp_reg)(CPUARMState *env, uint32_t key)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, key);
+
+    assert(ri != NULL);
+    return ri;
+}
+
+void HELPER(set_cp_reg)(CPUARMState *env, const void *rip, uint32_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
@@ -718,7 +729,7 @@ void HELPER(set_cp_reg)(CPUARMState *env, void *rip, uint32_t value)
     }
 }
 
-uint32_t HELPER(get_cp_reg)(CPUARMState *env, void *rip)
+uint32_t HELPER(get_cp_reg)(CPUARMState *env, const void *rip)
 {
     const ARMCPRegInfo *ri = rip;
     uint32_t res;
@@ -734,7 +745,7 @@ uint32_t HELPER(get_cp_reg)(CPUARMState *env, void *rip)
     return res;
 }
 
-void HELPER(set_cp_reg64)(CPUARMState *env, void *rip, uint64_t value)
+void HELPER(set_cp_reg64)(CPUARMState *env, const void *rip, uint64_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
@@ -747,7 +758,7 @@ void HELPER(set_cp_reg64)(CPUARMState *env, void *rip, uint64_t value)
     }
 }
 
-uint64_t HELPER(get_cp_reg64)(CPUARMState *env, void *rip)
+uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const void *rip)
 {
     const ARMCPRegInfo *ri = rip;
     uint64_t res;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 19cf371c4c8..52b1b8a1f0a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1939,13 +1939,12 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                        unsigned int op0, unsigned int op1, unsigned int op2,
                        unsigned int crn, unsigned int crm, unsigned int rt)
 {
-    const ARMCPRegInfo *ri;
+    uint32_t key = ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
+                                      crn, crm, op0, op1, op2);
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    TCGv_ptr tcg_ri = NULL;
     TCGv_i64 tcg_rt;
 
-    ri = get_arm_cp_reginfo(s->cp_regs,
-                            ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
-                                               crn, crm, op0, op1, op2));
-
     if (!ri) {
         /* Unknown register; this might be a guest error or a QEMU
          * unimplemented feature.
@@ -1971,8 +1970,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
 
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
         gen_a64_update_pc(s, 0);
-        gen_helper_access_check_cp_reg(cpu_env,
-                                       tcg_constant_ptr(ri),
+        tcg_ri = tcg_temp_new_ptr();
+        gen_helper_access_check_cp_reg(tcg_ri, cpu_env,
+                                       tcg_constant_i32(key),
                                        tcg_constant_i32(syndrome),
                                        tcg_constant_i32(isread));
     } else if (ri->type & ARM_CP_RAISES_EXC) {
@@ -1988,7 +1988,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     case 0:
         break;
     case ARM_CP_NOP:
-        return;
+        goto exit;
     case ARM_CP_NZCV:
         tcg_rt = cpu_reg(s, rt);
         if (isread) {
@@ -1996,14 +1996,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         } else {
             gen_set_nzcv(tcg_rt);
         }
-        return;
+        goto exit;
     case ARM_CP_CURRENTEL:
         /* Reads as current EL value from pstate, which is
          * guaranteed to be constant by the tb flags.
          */
         tcg_rt = cpu_reg(s, rt);
         tcg_gen_movi_i64(tcg_rt, s->current_el << 2);
-        return;
+        goto exit;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
@@ -2020,7 +2020,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
         gen_helper_dc_zva(cpu_env, tcg_rt);
-        return;
+        goto exit;
     case ARM_CP_DC_GVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -2041,7 +2041,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                 tcg_temp_free_i64(tag);
             }
         }
-        return;
+        goto exit;
     case ARM_CP_DC_GZVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -2059,16 +2059,16 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                 tcg_temp_free_i64(tag);
             }
         }
-        return;
+        goto exit;
     default:
         g_assert_not_reached();
     }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
-        return;
+        goto exit;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-        return;
+        goto exit;
     } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
-        return;
+        goto exit;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
@@ -2081,16 +2081,22 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         if (ri->type & ARM_CP_CONST) {
             tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
         } else if (ri->readfn) {
-            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tcg_constant_ptr(ri));
+            if (!tcg_ri) {
+                tcg_ri = gen_lookup_cp_reg(key);
+            }
+            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tcg_ri);
         } else {
             tcg_gen_ld_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
     } else {
         if (ri->type & ARM_CP_CONST) {
             /* If not forbidden by access permissions, treat as WI */
-            return;
+            goto exit;
         } else if (ri->writefn) {
-            gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tcg_rt);
+            if (!tcg_ri) {
+                tcg_ri = gen_lookup_cp_reg(key);
+            }
+            gen_helper_set_cp_reg64(cpu_env, tcg_ri, tcg_rt);
         } else {
             tcg_gen_st_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
@@ -2113,6 +2119,11 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          */
         s->base.is_jmp = DISAS_UPDATE_EXIT;
     }
+
+ exit:
+    if (tcg_ri) {
+        tcg_temp_free_ptr(tcg_ri);
+    }
 }
 
 /* System
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 40f9f07ea30..365e02fb0b8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4714,12 +4714,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                            int opc1, int crn, int crm, int opc2,
                            bool isread, int rt, int rt2)
 {
-    const ARMCPRegInfo *ri;
+    uint32_t key = ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2);
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    TCGv_ptr tcg_ri = NULL;
     bool need_exit_tb;
 
-    ri = get_arm_cp_reginfo(s->cp_regs,
-            ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
-
     if (!ri) {
         /*
          * Unknown register; this might be a guest error or a QEMU
@@ -4800,8 +4799,9 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
         gen_set_condexec(s);
         gen_update_pc(s, 0);
-        gen_helper_access_check_cp_reg(cpu_env,
-                                       tcg_constant_ptr(ri),
+        tcg_ri = tcg_temp_new_ptr();
+        gen_helper_access_check_cp_reg(tcg_ri, cpu_env,
+                                       tcg_constant_i32(key),
                                        tcg_constant_i32(syndrome),
                                        tcg_constant_i32(isread));
     } else if (ri->type & ARM_CP_RAISES_EXC) {
@@ -4818,15 +4818,15 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     case 0:
         break;
     case ARM_CP_NOP:
-        return;
+        goto exit;
     case ARM_CP_WFI:
         if (isread) {
             unallocated_encoding(s);
-            return;
+        } else {
+            gen_update_pc(s, curr_insn_len(s));
+            s->base.is_jmp = DISAS_WFI;
         }
-        gen_update_pc(s, curr_insn_len(s));
-        s->base.is_jmp = DISAS_WFI;
-        return;
+        goto exit;
     default:
         g_assert_not_reached();
     }
@@ -4843,9 +4843,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             if (ri->type & ARM_CP_CONST) {
                 tmp64 = tcg_constant_i64(ri->resetvalue);
             } else if (ri->readfn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
                 tmp64 = tcg_temp_new_i64();
-                gen_helper_get_cp_reg64(tmp64, cpu_env,
-                                        tcg_constant_ptr(ri));
+                gen_helper_get_cp_reg64(tmp64, cpu_env, tcg_ri);
             } else {
                 tmp64 = tcg_temp_new_i64();
                 tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
@@ -4862,8 +4864,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             if (ri->type & ARM_CP_CONST) {
                 tmp = tcg_constant_i32(ri->resetvalue);
             } else if (ri->readfn) {
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
                 tmp = tcg_temp_new_i32();
-                gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
+                gen_helper_get_cp_reg(tmp, cpu_env, tcg_ri);
             } else {
                 tmp = load_cpu_offset(ri->fieldoffset);
             }
@@ -4881,7 +4886,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         /* Write */
         if (ri->type & ARM_CP_CONST) {
             /* If not forbidden by access permissions, treat as WI */
-            return;
+            goto exit;
         }
 
         if (is64) {
@@ -4893,7 +4898,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             tcg_temp_free_i32(tmplo);
             tcg_temp_free_i32(tmphi);
             if (ri->writefn) {
-                gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tmp64);
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_set_cp_reg64(cpu_env, tcg_ri, tmp64);
             } else {
                 tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
             }
@@ -4901,7 +4909,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         } else {
             TCGv_i32 tmp = load_reg(s, rt);
             if (ri->writefn) {
-                gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
+                if (!tcg_ri) {
+                    tcg_ri = gen_lookup_cp_reg(key);
+                }
+                gen_helper_set_cp_reg(cpu_env, tcg_ri, tmp);
                 tcg_temp_free_i32(tmp);
             } else {
                 store_cpu_offset(tmp, ri->fieldoffset, 4);
@@ -4929,6 +4940,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     if (need_exit_tb) {
         gen_lookup_tb(s);
     }
+
+ exit:
+    if (tcg_ri) {
+        tcg_temp_free_ptr(tcg_ri);
+    }
 }
 
 /* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
-- 
2.34.1


