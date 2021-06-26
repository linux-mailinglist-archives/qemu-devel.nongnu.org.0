Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5163B4CC0
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:08:25 +0200 (CEST)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0YK-0003bR-1R
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TM-0006rk-6Z
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:16 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TH-0008DQ-Qy
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:15 -0400
Received: by mail-pf1-x431.google.com with SMTP id g192so9127602pfb.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HI71YspAl1Jx0wr1OoLasphGq250eOZ/+r/m038xuek=;
 b=HkDkrUfmojETXIQhaa8EoHMYfPopXit+imU5XsTLEJMeTcThpJi3tJthGQXGeIvbVc
 273XuvFcCE6FFH5w2+zLJ6kmqi4mqfovXFxmQs3kKtwrAys5eFGA4arfu3L5Jd68rAxO
 0sLDdPX2A3qPsPPKhh9XwEZBQ9cN45KSfDwMz2VvA6R+vAdsGLqacPt9XLDUXiaqAuoD
 RwKs4QKmaAaN1ToKIu4BwIWs9neDDrn/wR5gKYHv+hi2A8yLFIHF/2BgSWzMtY/YfoTf
 PA8wFtmn0O6NrUwIUCuw2z6cADmL1vxOUOk1boG15v427JQZ07lMkct63vLCA+62UncE
 KYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HI71YspAl1Jx0wr1OoLasphGq250eOZ/+r/m038xuek=;
 b=shMvP09rfVzcfLWopEX2ZazfNjPJl39Te52G7G3Fon3DSaMI5Y7Q8VfLrFj6yqNRuW
 inq/gSggLetPF8rbnSCqeaI+tH/oD8nQiaU9eWqia+U8yztVh11gKScczKyPWsW25RB1
 u+SawLfuZidXn0StGaZ26rOb//zcYU+fBDzmxK4OUN2s2/tstfJsLR67wmyLwVYEVJoF
 IBVz557XmdJPf1AAZRZ+GsVJvZbjC25/dEpHfxwIjbKwhg/bVWpaAE6Rujs6Ykx/uxeT
 bCsDFrZHqYa1BKxt3mgu0BWI3QrXiYwk6bRB125PK5QM3ls4UFKtaliEIr9e006JjAd8
 n8/w==
X-Gm-Message-State: AOAM531goBDvUXbrlpWKmNtAkKEXpWgnFo+NmXpLWtwuAlPMBY8DO1J2
 IGC3r7VTB0ZW9ygBfEhnqydkZlAiCfrywA==
X-Google-Smtp-Source: ABdhPJzpSRs1lx2xcJfZl/+cheuvnJTIc5B/cbw3aXOfPnBAZgOZOQvw1S7aOzcboDP29AgoXq9URg==
X-Received: by 2002:a65:4244:: with SMTP id d4mr12727479pgq.83.1624683790470; 
 Fri, 25 Jun 2021 22:03:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/16] tcg/s390x: Add host vector framework
Date: Fri, 25 Jun 2021 22:02:55 -0700
Message-Id: <20210626050307.2408505-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add registers and function stubs.  The functionality
is disabled via squashing s390_facilities[2] to 0.

We must still include results for the mandatory opcodes in
tcg_target_op_def, as all opcodes are checked during tcg init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   4 +
 tcg/s390x/tcg-target-con-str.h |   1 +
 tcg/s390x/tcg-target.h         |  35 ++++++++-
 tcg/s390x/tcg-target.opc.h     |  12 +++
 tcg/s390x/tcg-target.c.inc     | 137 ++++++++++++++++++++++++++++++++-
 5 files changed, 184 insertions(+), 5 deletions(-)
 create mode 100644 tcg/s390x/tcg-target.opc.h

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 31985e4903..ce9432cfe3 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -13,13 +13,17 @@ C_O0_I1(r)
 C_O0_I2(L, L)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
+C_O0_I2(v, r)
 C_O1_I1(r, L)
 C_O1_I1(r, r)
+C_O1_I1(v, r)
+C_O1_I1(v, vr)
 C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
+C_O1_I2(v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(b, a, 0, r)
diff --git a/tcg/s390x/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
index 892d8f8c06..8bb0358ae5 100644
--- a/tcg/s390x/tcg-target-con-str.h
+++ b/tcg/s390x/tcg-target-con-str.h
@@ -10,6 +10,7 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+REGS('v', ALL_VECTOR_REGS)
 /*
  * A (single) even/odd pair for division.
  * TODO: Add something to the register allocator to allow
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index eb17657994..db54266da0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -37,11 +37,20 @@ typedef enum TCGReg {
     TCG_REG_R8,  TCG_REG_R9,  TCG_REG_R10, TCG_REG_R11,
     TCG_REG_R12, TCG_REG_R13, TCG_REG_R14, TCG_REG_R15,
 
+    TCG_REG_V0 = 32, TCG_REG_V1,  TCG_REG_V2,  TCG_REG_V3,
+    TCG_REG_V4,  TCG_REG_V5,  TCG_REG_V6,  TCG_REG_V7,
+    TCG_REG_V8,  TCG_REG_V9,  TCG_REG_V10, TCG_REG_V11,
+    TCG_REG_V12, TCG_REG_V13, TCG_REG_V14, TCG_REG_V15,
+    TCG_REG_V16, TCG_REG_V17, TCG_REG_V18, TCG_REG_V19,
+    TCG_REG_V20, TCG_REG_V21, TCG_REG_V22, TCG_REG_V23,
+    TCG_REG_V24, TCG_REG_V25, TCG_REG_V26, TCG_REG_V27,
+    TCG_REG_V28, TCG_REG_V29, TCG_REG_V30, TCG_REG_V31,
+
     TCG_AREG0 = TCG_REG_R10,
     TCG_REG_CALL_STACK = TCG_REG_R15
 } TCGReg;
 
-#define TCG_TARGET_NB_REGS 16
+#define TCG_TARGET_NB_REGS 64
 
 /* A list of relevant facilities used by this translator.  Some of these
    are required for proper operation, and these are checked at startup.  */
@@ -54,8 +63,9 @@ typedef enum TCGReg {
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
+#define FACILITY_VECTOR               129
 
-extern uint64_t s390_facilities[1];
+extern uint64_t s390_facilities[3];
 
 #define HAVE_FACILITY(X) \
     ((s390_facilities[FACILITY_##X / 64] >> (63 - FACILITY_##X % 64)) & 1)
@@ -129,6 +139,27 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
+#define TCG_TARGET_HAS_v64            HAVE_FACILITY(VECTOR)
+#define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
+#define TCG_TARGET_HAS_v256           0
+
+#define TCG_TARGET_HAS_andc_vec       0
+#define TCG_TARGET_HAS_orc_vec        0
+#define TCG_TARGET_HAS_not_vec        0
+#define TCG_TARGET_HAS_neg_vec        0
+#define TCG_TARGET_HAS_abs_vec        0
+#define TCG_TARGET_HAS_roti_vec       0
+#define TCG_TARGET_HAS_rots_vec       0
+#define TCG_TARGET_HAS_rotv_vec       0
+#define TCG_TARGET_HAS_shi_vec        0
+#define TCG_TARGET_HAS_shs_vec        0
+#define TCG_TARGET_HAS_shv_vec        0
+#define TCG_TARGET_HAS_mul_vec        0
+#define TCG_TARGET_HAS_sat_vec        0
+#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_bitsel_vec     0
+#define TCG_TARGET_HAS_cmpsel_vec     0
+
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
diff --git a/tcg/s390x/tcg-target.opc.h b/tcg/s390x/tcg-target.opc.h
new file mode 100644
index 0000000000..67afc82a93
--- /dev/null
+++ b/tcg/s390x/tcg-target.opc.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2021 Linaro
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
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 76630aafc4..18233c628d 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -43,6 +43,8 @@
 #define TCG_CT_CONST_ZERO  0x800
 
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 16)
+#define ALL_VECTOR_REGS      MAKE_64BIT_MASK(32, 32)
+
 /*
  * For softmmu, we need to avoid conflicts with the first 3
  * argument registers to perform the tlb lookup, and to call
@@ -268,8 +270,13 @@ typedef enum S390Opcode {
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
-    "%r0", "%r1", "%r2", "%r3", "%r4", "%r5", "%r6", "%r7",
-    "%r8", "%r9", "%r10" "%r11" "%r12" "%r13" "%r14" "%r15"
+    "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
+    "%r8",  "%r9",  "%r10", "%r11", "%r12", "%r13", "%r14", "%r15",
+    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+    "%v0",  "%v1",  "%v2",  "%v3",  "%v4",  "%v5",  "%v6",  "%v7",
+    "%v8",  "%v9",  "%v10", "%v11", "%v12", "%v13", "%v14", "%v15",
+    "%v16", "%v17", "%v18", "%v19", "%v20", "%v21", "%v22", "%v23",
+    "%v24", "%v25", "%v26", "%v27", "%v28", "%v29", "%v30", "%v31",
 };
 #endif
 
@@ -295,6 +302,32 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R4,
     TCG_REG_R3,
     TCG_REG_R2,
+
+    /* V8-V15 are call saved, and omitted. */
+    TCG_REG_V0,
+    TCG_REG_V1,
+    TCG_REG_V2,
+    TCG_REG_V3,
+    TCG_REG_V4,
+    TCG_REG_V5,
+    TCG_REG_V6,
+    TCG_REG_V7,
+    TCG_REG_V16,
+    TCG_REG_V17,
+    TCG_REG_V18,
+    TCG_REG_V19,
+    TCG_REG_V20,
+    TCG_REG_V21,
+    TCG_REG_V22,
+    TCG_REG_V23,
+    TCG_REG_V24,
+    TCG_REG_V25,
+    TCG_REG_V26,
+    TCG_REG_V27,
+    TCG_REG_V28,
+    TCG_REG_V29,
+    TCG_REG_V30,
+    TCG_REG_V31,
 };
 
 static const int tcg_target_call_iarg_regs[] = {
@@ -377,7 +410,7 @@ static void * const qemu_st_helpers[16] = {
 #endif
 
 static const tcg_insn_unit *tb_ret_addr;
-uint64_t s390_facilities[1];
+uint64_t s390_facilities[3];
 
 static bool patch_reloc(tcg_insn_unit *src_rw, int type,
                         intptr_t value, intptr_t addend)
@@ -2271,6 +2304,42 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     }
 }
 
+static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
+                            TCGReg dst, TCGReg src)
+{
+    g_assert_not_reached();
+}
+
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg dst, TCGReg base, intptr_t offset)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg dst, int64_t val)
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
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 {
     switch (op) {
@@ -2411,11 +2480,34 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 ? C_O2_I4(r, r, 0, 1, rA, r)
                 : C_O2_I4(r, r, 0, 1, r, r));
 
+    case INDEX_op_st_vec:
+        return C_O0_I2(v, r);
+    case INDEX_op_ld_vec:
+    case INDEX_op_dupm_vec:
+        return C_O1_I1(v, r);
+    case INDEX_op_dup_vec:
+        return C_O1_I1(v, vr);
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
+    case INDEX_op_and_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_xor_vec:
+    case INDEX_op_cmp_vec:
+        return C_O1_I2(v, v, v);
+
     default:
         g_assert_not_reached();
     }
 }
 
+/*
+ * Mainline glibc added HWCAP_S390_VX before it was kernel abi.
+ * Some distros have fixed this up locally, others have not.
+ */
+#ifndef HWCAP_S390_VXRS
+#define HWCAP_S390_VXRS 2048
+#endif
+
 static void query_s390_facilities(void)
 {
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
@@ -2430,6 +2522,16 @@ static void query_s390_facilities(void)
         asm volatile(".word 0xb2b0,0x1000"
                      : "=r"(r0) : "r"(r0), "r"(r1) : "memory", "cc");
     }
+
+    /*
+     * Use of vector registers requires os support beyond the facility bit.
+     * If the kernel does not advertise support, disable the facility bits.
+     * There is nothing else we currently care about in the 3rd word, so
+     * disable VECTOR with one store.
+     */
+    if (1 || !(hwcap & HWCAP_S390_VXRS)) {
+        s390_facilities[2] = 0;
+    }
 }
 
 static void tcg_target_init(TCGContext *s)
@@ -2438,6 +2540,10 @@ static void tcg_target_init(TCGContext *s)
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffff;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffff;
+    if (HAVE_FACILITY(VECTOR)) {
+        tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
+        tcg_target_available_regs[TCG_TYPE_V128] = 0xffffffff00000000ull;
+    }
 
     tcg_target_call_clobber_regs = 0;
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R0);
@@ -2452,6 +2558,31 @@ static void tcg_target_init(TCGContext *s)
     /* The return register can be considered call-clobbered.  */
     tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_R14);
 
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V0);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V1);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V2);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V3);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V4);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V5);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V6);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V7);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V16);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V17);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V18);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V19);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V20);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V21);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V22);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V23);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V24);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V25);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V26);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V27);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V28);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V29);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V30);
+    tcg_regset_set_reg(tcg_target_call_clobber_regs, TCG_REG_V31);
+
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_TMP0);
     /* XXX many insns can't be used with R0, so we better avoid it for now */
-- 
2.25.1


