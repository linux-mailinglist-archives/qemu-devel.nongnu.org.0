Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEF312987
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:48:04 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xWt-0000dx-Ta
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZM-0003lc-O4
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:32 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZK-0008Vk-7b
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:32 -0500
Received: by mail-pf1-x435.google.com with SMTP id m6so8791367pfk.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PQ/mcK25Lt7IM0FgKHVU+2fV9f7uyIn3mrXWXKeuLCM=;
 b=Fc0Rs/m8TFs4eglQumk06SmI4IpqsgTYYOVSlzN6UXaC0TXVj9eTDhalBJzNa3toCY
 c8v7kGCfhZcUgdV4P5YUJ3Dga+CV5aEIUho2cbYe6w0KOwavkx65VqxFosdoA/AhUY9E
 EKu1WxHWcD3nqrzkt8EhEUY+qvMAV1R/evfI9ZJ2nbOv6DUoz3WIw4qPx4AS7szKAXEt
 LPUXJvthFBxud19oVLLWTs6dEl0SGBHfSufmn2fd8C4wYrGlmLz6Tlz9ZkSmYnnmHbEM
 ctYhk7fc81WlmWCERJSN+TsGuOf+qjH1Zsak4oKcPX7W/Hqvzho8x2rsbEuhfzVZFBLQ
 Jsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQ/mcK25Lt7IM0FgKHVU+2fV9f7uyIn3mrXWXKeuLCM=;
 b=jgKRyVgt1ix2trw1YYJrWkIJftY4AVNZo70r0Ixk3LNdbFLEmXx4AsMHuHKVlWVu4u
 jdL6+ZCTrE1qwpgRDPDtqUBwutBDVHVz/qv894RV2E3/nqqpWhqJTrSW2IEX0PK351jl
 /M7JvtucvIF9nn1/7Qv3it+A0TG75nXCN7CMvt527Rb/QdIlNlIHHvglIkB6/vSvdny4
 nHBazK+oDEMGW57GL2m3cZ10awwtuir/3yQKnDdlQ8++RYPb7zoWl1JM3+vU2Ah1tiw1
 XVzSQ3t733tIUNxAlSaY+ig4MoCR5cA5Mj3anXeCElVJyPifTN3jnhLF7CGFGJBSbBX6
 Rn1Q==
X-Gm-Message-State: AOAM530yAw7Ep7pDv9CuwWl40tsVWiFgcl8vo6tPVezjJ+slIoQcWHsq
 P0rqxGimNtakVviYcocCeLJhzmV8t63y7A==
X-Google-Smtp-Source: ABdhPJyJmrCSMA56pJPeAfpgmEtFcocp0B/dJGZTcEPYL0x7iUbPfmbRNXtKmDs5IB5e4iJlsiBnlg==
X-Received: by 2002:a63:2001:: with SMTP id g1mr14787435pgg.83.1612752388642; 
 Sun, 07 Feb 2021 18:46:28 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] tcg/arm: Add host vector framework
Date: Sun,  7 Feb 2021 18:46:12 -0800
Message-Id: <20210208024625.271018-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Add registers and function stubs.  The functionality
is disabled via use_neon_instructions defined to 0.

We must still include results for the mandatory opcodes in
tcg_target_op_def, as all opcodes are checked during tcg init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |   4 ++
 tcg/arm/tcg-target-con-str.h |   1 +
 tcg/arm/tcg-target.h         |  48 ++++++++++++--
 tcg/arm/tcg-target.opc.h     |  12 ++++
 tcg/arm/tcg-target.c.inc     | 124 ++++++++++++++++++++++++++++++-----
 5 files changed, 165 insertions(+), 24 deletions(-)
 create mode 100644 tcg/arm/tcg-target.opc.h

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index ab63e089c2..27aced5391 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -13,11 +13,14 @@ C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, rIN)
 C_O0_I2(s, s)
+C_O0_I2(w, r)
 C_O0_I3(s, s, s)
 C_O0_I4(r, r, rI, rI)
 C_O0_I4(s, s, s, s)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
+C_O1_I1(w, r)
+C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, l, l)
 C_O1_I2(r, r, r)
@@ -26,6 +29,7 @@ C_O1_I2(r, r, rIK)
 C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
+C_O1_I2(w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index a0ab7747db..255a1ae0e2 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -11,6 +11,7 @@
 REGS('r', ALL_GENERAL_REGS)
 REGS('l', ALL_QLOAD_REGS)
 REGS('s', ALL_QSTORE_REGS)
+REGS('w', ALL_VECTOR_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 8d1fee6327..a9dc09bd08 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -78,19 +78,38 @@ typedef enum {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_PC,
+
+    TCG_REG_Q0,
+    TCG_REG_Q1,
+    TCG_REG_Q2,
+    TCG_REG_Q3,
+    TCG_REG_Q4,
+    TCG_REG_Q5,
+    TCG_REG_Q6,
+    TCG_REG_Q7,
+    TCG_REG_Q8,
+    TCG_REG_Q9,
+    TCG_REG_Q10,
+    TCG_REG_Q11,
+    TCG_REG_Q12,
+    TCG_REG_Q13,
+    TCG_REG_Q14,
+    TCG_REG_Q15,
+
+    TCG_AREG0 = TCG_REG_R6,
+    TCG_REG_CALL_STACK = TCG_REG_R13,
 } TCGReg;
 
-#define TCG_TARGET_NB_REGS 16
+#define TCG_TARGET_NB_REGS 32
 
 #ifdef __ARM_ARCH_EXT_IDIV__
 #define use_idiv_instructions  1
 #else
 extern bool use_idiv_instructions;
 #endif
-
+#define use_neon_instructions  0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R13
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_ALIGN_ARGS	1
 #define TCG_TARGET_CALL_STACK_OFFSET	0
@@ -128,9 +147,26 @@ extern bool use_idiv_instructions;
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
-enum {
-    TCG_AREG0 = TCG_REG_R6,
-};
+#define TCG_TARGET_HAS_v64              use_neon_instructions
+#define TCG_TARGET_HAS_v128             use_neon_instructions
+#define TCG_TARGET_HAS_v256             0
+
+#define TCG_TARGET_HAS_andc_vec         0
+#define TCG_TARGET_HAS_orc_vec          0
+#define TCG_TARGET_HAS_not_vec          0
+#define TCG_TARGET_HAS_neg_vec          0
+#define TCG_TARGET_HAS_abs_vec          0
+#define TCG_TARGET_HAS_roti_vec         0
+#define TCG_TARGET_HAS_rots_vec         0
+#define TCG_TARGET_HAS_rotv_vec         0
+#define TCG_TARGET_HAS_shi_vec          0
+#define TCG_TARGET_HAS_shs_vec          0
+#define TCG_TARGET_HAS_shv_vec          0
+#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_sat_vec          0
+#define TCG_TARGET_HAS_minmax_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
diff --git a/tcg/arm/tcg-target.opc.h b/tcg/arm/tcg-target.opc.h
new file mode 100644
index 0000000000..7a4578e9b4
--- /dev/null
+++ b/tcg/arm/tcg-target.opc.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2019 Linaro
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ *
+ * See the COPYING file in the top-level directory for details.
+ *
+ * Target-specific opcodes for host vector expansion.  These will be
+ * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
+ * consider these to be UNSPEC with names.
+ */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index eb4f42e53d..9bb354abce 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -40,22 +40,10 @@ bool use_idiv_instructions;
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-    "%r0",
-    "%r1",
-    "%r2",
-    "%r3",
-    "%r4",
-    "%r5",
-    "%r6",
-    "%r7",
-    "%r8",
-    "%r9",
-    "%r10",
-    "%r11",
-    "%r12",
-    "%r13",
-    "%r14",
-    "%pc",
+    "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
+    "%r8",  "%r9",  "%r10", "%r11", "%r12", "%sp",  "%r14", "%pc",
+    "%q0",  "%q1",  "%q2",  "%q3",  "%q4",  "%q5",  "%q6",  "%q7",
+    "%q8",  "%q9",  "%q10", "%q11", "%q12", "%q13", "%q14", "%q15",
 };
 #endif
 
@@ -75,6 +63,23 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R3,
     TCG_REG_R12,
     TCG_REG_R14,
+
+    TCG_REG_Q0,
+    TCG_REG_Q1,
+    TCG_REG_Q2,
+    TCG_REG_Q3,
+    TCG_REG_Q4,
+    TCG_REG_Q5,
+    TCG_REG_Q6,
+    TCG_REG_Q7,
+    TCG_REG_Q8,
+    TCG_REG_Q9,
+    TCG_REG_Q10,
+    TCG_REG_Q11,
+    TCG_REG_Q12,
+    TCG_REG_Q13,
+    TCG_REG_Q14,
+    TCG_REG_Q15,
 };
 
 static const int tcg_target_call_iarg_regs[4] = {
@@ -85,6 +90,7 @@ static const int tcg_target_call_oarg_regs[2] = {
 };
 
 #define TCG_REG_TMP  TCG_REG_R12
+#define TCG_VEC_TMP  TCG_REG_Q15
 
 enum arm_cond_code_e {
     COND_EQ = 0x0,
@@ -238,6 +244,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_ZERO 0x800
 
 #define ALL_GENERAL_REGS  0xffffu
+#define ALL_VECTOR_REGS   0xffff0000u
 
 /*
  * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
@@ -2117,6 +2124,22 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_st_i64:
         return TARGET_LONG_BITS == 32 ? C_O0_I3(s, s, s) : C_O0_I4(s, s, s, s);
 
+    case INDEX_op_st_vec:
+        return C_O0_I2(w, r);
+    case INDEX_op_ld_vec:
+    case INDEX_op_dupm_vec:
+        return C_O1_I1(w, r);
+    case INDEX_op_dup_vec:
+        return C_O1_I1(w, wr);
+    case INDEX_op_dup2_vec:
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
+    case INDEX_op_xor_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_and_vec:
+    case INDEX_op_cmp_vec:
+        return C_O1_I2(w, w, w);
+
     default:
         g_assert_not_reached();
     }
@@ -2126,12 +2149,18 @@ static void tcg_target_init(TCGContext *s)
 {
     /* Only probe for the platform and capabilities if we havn't already
        determined maximum values at compile time.  */
-#ifndef use_idiv_instructions
+#if !defined(use_idiv_instructions) || !defined(use_neon_instructions)
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+#ifndef use_idiv_instructions
         use_idiv_instructions = (hwcap & HWCAP_ARM_IDIVA) != 0;
+#endif
+#ifndef use_neon_instructions
+        use_neon_instructions = (hwcap & HWCAP_ARM_NEON) != 0;
+#endif
     }
 #endif
+
     if (__ARM_ARCH < 7) {
         const char *pl = (const char *)qemu_getauxval(AT_PLATFORM);
         if (pl != NULL && pl[0] == 'v' && pl[1] >= '4' && pl[1] <= '9') {
@@ -2139,7 +2168,7 @@ static void tcg_target_init(TCGContext *s)
         }
     }
 
-    tcg_target_available_regs[TCG_TYPE_I32] = 0xffff;
+    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R0);
@@ -2149,10 +2178,33 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R12);
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R14);
 
+    if (use_neon_instructions) {
+        tcg_target_available_regs[TCG_TYPE_V64]  = ALL_VECTOR_REGS;
+        tcg_target_available_regs[TCG_TYPE_V128] = ALL_VECTOR_REGS;
+
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q0);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q1);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q2);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q3);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q4);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q5);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q6);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q7);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q8);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q9);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q10);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q11);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q12);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q13);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q14);
+        tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_Q15);
+    }
+
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_PC);
+    tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
 }
 
 static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
@@ -2186,6 +2238,42 @@ static inline void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
+                            TCGReg rd, TCGReg rs)
+{
+    g_assert_not_reached();
+}
+
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg rd, TCGReg base, intptr_t offset)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg rd, int64_t v64)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                           unsigned vecl, unsigned vece,
+                           const TCGArg *args, const int *const_args)
+{
+    g_assert_not_reached();
+}
+
+int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
+{
+    return 0;
+}
+
+void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
+                       TCGArg a0, ...)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
-- 
2.25.1


