Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D8660758
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:46:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDseD-0005ho-8F; Fri, 06 Jan 2023 14:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDseB-0005h3-DP
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse8-0001lL-Fz
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:44:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o21so2518076pjw.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVAOx8EXxnmbdE8Of0KWdO/UjD54zrOrDajM7zpj4CQ=;
 b=pnULn69cXipJjvjwMOM0DSESSWCimHM0J75KXhfoIblkUlNpbhSYHB4lFWz/9ki6AN
 Us/W0+18wTK9BKm+sqhTLXaU9FWcgA/w23cx7dp2XgoRQrmBgXgeEAN7FGnUzhr5J6Rd
 WWFiU5TLi1BZS8WZbc1+EW/vB+koXeuoOCPXbuZp0u9Iuw0ovqQDwQIYz+jZ3vrLzXXY
 4YOAeS0Q7UZ+1ZPX9RzRZ1sukmVUWqSfrzmSdmF+GG4jW3gwe6p0BgW2NPo4hyTcVWYR
 kgw6yJt3WVN128JlAl2FVGn8Mycj68RE//Bena79pFvF22kQsEdncZqitzXRn2PoUcPO
 z9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVAOx8EXxnmbdE8Of0KWdO/UjD54zrOrDajM7zpj4CQ=;
 b=lLWLrwF6tPPCJ+Gs/lV2lMoMNp6Xfnf4S55Lkevw5FBBgVBHCpl2dqqDORCZ2g7Bv8
 ferIuqtyGQzQcgtRercx+dwmdmTezgMX8V8JdbXaYi8j4ZwoJeNU7T2gB9QYTBPbYSHJ
 soENwYS3x5eokCY7UGvXJj464ju/jopQrOwloOWHVXVERK+cBZFRhpCbEE4TXqKZR5sr
 ZY1AQYw+GCwuHpkGP7I283COr4+R8SQDEczOHIEbCQ9PRtiikU1TAK2BfzGCx7zlWlec
 smQLBhcACbrVx9JPMqx+vF18Z96ZjfzTl2LhF+uTo4+FqdYP9j3LgBG788Mn7CXd4bIy
 CbdA==
X-Gm-Message-State: AFqh2kpftZHteP0BCntnFq/GrSJ+nDvgx/NXeSg7k7g0mSgth2iMQ6Yj
 GHC9cektEiXnefNnwNac9cUXjGMEPxKDJUvf
X-Google-Smtp-Source: AMrXdXvaF+zj7alU9pXrNXjg99jtTuQ/DcfXQ7Hyf1WliVd/iAIODPTdyVgzwIyFD/ncSUQafxFaTw==
X-Received: by 2002:a17:903:230c:b0:192:64a9:62f5 with SMTP id
 d12-20020a170903230c00b0019264a962f5mr71438197plh.29.1673034295016; 
 Fri, 06 Jan 2023 11:44:55 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b001867fdec154sm1277441plh.224.2023.01.06.11.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 11:44:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
Date: Fri,  6 Jan 2023 11:44:51 -0800
Message-Id: <20230106194451.1213153-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Do not encode the pointer as a constant in the opcode stream.
This pointer is specific to the cpu that first generated the
translation, which runs into problems with both hot-pluggable
cpus and user-only threads, as cpus are removed.

Perform the lookup in either helper_access_check_cp_reg,
or a new helper_lookup_cp_reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 11 +++++----
 target/arm/translate.h     |  7 ++++++
 target/arm/op_helper.c     | 27 ++++++++++++++------
 target/arm/translate-a64.c | 49 ++++++++++++++++++++++---------------
 target/arm/translate.c     | 50 +++++++++++++++++++++++++-------------
 5 files changed, 95 insertions(+), 49 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 92f36d9dbb..018b00ea75 100644
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
index 3cdc7dbc2f..f17f095cbe 100644
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
index 70672bcd9f..31f89db899 100644
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
index 2ee171f249..543635d6b0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1944,13 +1944,12 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
@@ -1976,8 +1975,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
 
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
@@ -1993,7 +1993,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     case 0:
         break;
     case ARM_CP_NOP:
-        return;
+        goto exit;
     case ARM_CP_NZCV:
         tcg_rt = cpu_reg(s, rt);
         if (isread) {
@@ -2001,14 +2001,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
@@ -2025,7 +2025,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
         gen_helper_dc_zva(cpu_env, tcg_rt);
-        return;
+        goto exit;
     case ARM_CP_DC_GVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -2046,7 +2046,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                 tcg_temp_free_i64(tag);
             }
         }
-        return;
+        goto exit;
     case ARM_CP_DC_GZVA:
         {
             TCGv_i64 clean_addr, tag;
@@ -2064,16 +2064,16 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
@@ -2086,16 +2086,22 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
@@ -2118,6 +2124,11 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
index a84a02964e..0f8db04bad 100644
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


