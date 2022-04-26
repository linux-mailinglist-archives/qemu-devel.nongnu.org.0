Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376750FE41
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:05:39 +0200 (CEST)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKss-0000er-GM
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKee-0004QU-O3; Tue, 26 Apr 2022 08:50:57 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeb-00005X-Vn; Tue, 26 Apr 2022 08:50:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5335580009B;
 Tue, 26 Apr 2022 09:50:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/7] target/ppc: Implemented xvf*ger*
Date: Tue, 26 Apr 2022 09:50:25 -0300
Message-Id: <20220426125028.18844-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:37.0584 (UTC)
 FILETIME=[3A3CE900:01D8596C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xvf32ger:   VSX Vector 32-bit Floating-Point GER (rank-1 update)
xvf32gernn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
multiply, Negative accumulate
xvf32gernp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
multiply, Positive accumulate
xvf32gerpn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
multiply, Negative accumulate
xvf32gerpp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
multiply, Positive accumulate
xvf64ger:   VSX Vector 64-bit Floating-Point GER (rank-1 update)
xvf64gernn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
multiply, Negative accumulate
xvf64gernp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
multiply, Positive accumulate
xvf64gerpn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
multiply, Negative accumulate
xvf64gerpp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/cpu.h                    |  4 ++
 target/ppc/fpu_helper.c             | 64 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  2 +
 target/ppc/insn32.decode            | 13 ++++++
 target/ppc/translate/vsx-impl.c.inc | 39 ++++++++++++++++++
 5 files changed, 122 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ee55c6cfa2..b5d7b35dda 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2652,6 +2652,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrSF(i) f32[i]
+#define VsrDF(i) f64[i]
 #else
 #define VsrB(i) u8[15 - (i)]
 #define VsrSB(i) s8[15 - (i)]
@@ -2661,6 +2663,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrSF(i) f32[3 - (i)]
+#define VsrDF(i) f64[1 - (i)]
 #endif
 
 static inline int vsr64_offset(int i, bool high)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 99281cc37a..6b03666d09 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3462,3 +3462,67 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
     *xt = t;
     do_float_check_status(env, GETPC());
 }
+
+static inline bool ger_acc_flag(uint32_t flag)
+{
+    return flag & 0x1;
+}
+
+static inline bool ger_neg_mul_flag(uint32_t flag)
+{
+    return flag & 0x2;
+}
+
+static inline bool ger_neg_acc_flag(uint32_t flag)
+{
+    return flag & 0x4;
+}
+
+#define VSXGER(NAME, TYPE, EL)                                          \
+    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,             \
+              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)     \
+    {                                                                   \
+        ppc_vsr_t *a, *b, *at;                                          \
+        TYPE aux_acc, va, vb;                                           \
+        int i, j, xmsk_bit, ymsk_bit, op_flags;                         \
+        uint8_t xmsk = mask & 0x0F;                                     \
+        uint8_t ymsk = (mask >> 4) & 0x0F;                              \
+        int ymax = MIN(4, 128 / (sizeof(TYPE) * 8));                    \
+        b = cpu_vsr_ptr(env, b_r);                                      \
+        float_status *excp_ptr = &env->fp_status;                       \
+        bool acc = ger_acc_flag(packed_flags);                          \
+        bool neg_acc = ger_neg_acc_flag(packed_flags);                  \
+        bool neg_mul = ger_neg_mul_flag(packed_flags);                  \
+        helper_reset_fpstatus(env);                                     \
+        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {    \
+            a = cpu_vsr_ptr(env, a_r + i / ymax);                       \
+            at = cpu_vsr_ptr(env, at_r + i);                            \
+            for (j = 0, ymsk_bit = 1 << (ymax - 1); j < ymax;           \
+                 j++, ymsk_bit >>= 1) {                                 \
+                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {           \
+                    op_flags = (neg_acc ^ neg_mul) ?                    \
+                                          float_muladd_negate_c : 0;    \
+                    op_flags |= (neg_mul) ?                             \
+                                     float_muladd_negate_result : 0;    \
+                    va = a->Vsr##EL(i % ymax);                          \
+                    vb = b->Vsr##EL(j);                                 \
+                    aux_acc = at->Vsr##EL(j);                           \
+                    if (acc) {                                          \
+                        at->Vsr##EL(j) = TYPE##_muladd(va, vb, aux_acc, \
+                                                       op_flags,        \
+                                                       excp_ptr);       \
+                    } else {                                            \
+                        at->Vsr##EL(j) = TYPE##_mul(va, vb, excp_ptr);  \
+                    }                                                   \
+                } else {                                                \
+                    at->Vsr##EL(j) = 0;                                 \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        do_float_check_status(env, GETPC());                            \
+    }
+
+VSXGER(helper_XVF32GER, float32, SF)
+VSXGER(helper_XVF64GER, float64, DF)
+
+#undef VSXGER
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 06553517de..7d725292b1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -540,6 +540,8 @@ DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_6(XVI4GER8, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI8GER4, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI16GER2, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVF32GER, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVF64GER, void, env, i32, i32, i32, i32, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 653f50db93..9652ca286c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -171,6 +171,7 @@
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
 %xx_at          23:3 !function=times_4
+%xx_xa_pair     2:1 17:4 !function=times_2
 @XX3_at         ...... ... .. ..... ..... ........ ...          &XX3 xt=%xx_at xb=%xx_xb
 
 &XX3_dm         xt xa xb dm
@@ -734,3 +735,15 @@ XVI16GER2PP     111011 ... -- ..... ..... 01101011 ..-  @XX3_at xa=%xx_xa
 XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
+
+XVF32GER        111011 ... -- ..... ..... 00011011 ..-  @XX3_at xa=%xx_xa
+XVF32GERPP      111011 ... -- ..... ..... 00011010 ..-  @XX3_at xa=%xx_xa
+XVF32GERPN      111011 ... -- ..... ..... 10011010 ..-  @XX3_at xa=%xx_xa
+XVF32GERNP      111011 ... -- ..... ..... 01011010 ..-  @XX3_at xa=%xx_xa
+XVF32GERNN      111011 ... -- ..... ..... 11011010 ..-  @XX3_at xa=%xx_xa
+
+XVF64GER        111011 ... -- .... 0 ..... 00111011 ..-  @XX3_at xa=%xx_xa_pair
+XVF64GERPP      111011 ... -- .... 0 ..... 00111010 ..-  @XX3_at xa=%xx_xa_pair
+XVF64GERPN      111011 ... -- .... 0 ..... 10111010 ..-  @XX3_at xa=%xx_xa_pair
+XVF64GERNP      111011 ... -- .... 0 ..... 01111010 ..-  @XX3_at xa=%xx_xa_pair
+XVF64GERNN      111011 ... -- .... 0 ..... 11111010 ..-  @XX3_at xa=%xx_xa_pair
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index eb7b8cb0c6..b1fb0f31f3 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2835,6 +2835,19 @@ static uint32_t pack_flags_xvi(int acc, int sat)
     return (sat << 1) | acc;
 }
 
+/*
+ * Packed VSX Floating Point GER Flags
+ * 000 - no accumulation no saturation
+ * 001 - positive accumulate, positive multiply
+ * 011 - positive accumulate, negative multiply
+ * 101 - negative accumulate, positive multiply
+ * 111 - negative accumulate, negative multiply
+ */
+static inline uint32_t ger_pack_flags_xvf(bool acc, bool nm, bool na)
+{
+    return (acc ? 0x1 : 0) | (nm ? 0x2 : 0) | (na ? 0x4 : 0);
+}
+
 static bool do_ger_MMIRR_XX3(DisasContext *ctx, arg_MMIRR_XX3 *a, uint32_t op,
                              void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
                                             TCGv_i32, TCGv_i32, TCGv_i32))
@@ -2897,6 +2910,32 @@ TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, GER_SPP, gen_helper_XVI16GER2)
 #undef GER_SAT
 #undef GER_SPP
 
+/* To keep line size < 80 */
+#define GER_NOP ger_pack_flags_xvf(false, false, false)
+#define GER_PP ger_pack_flags_xvf(true, false, false)
+#define GER_NP ger_pack_flags_xvf(true, true, false)
+#define GER_PN ger_pack_flags_xvf(true, false, true)
+#define GER_NN ger_pack_flags_xvf(true, true, true)
+
+TRANS(XVF32GER, do_ger_XX3, GER_NOP, gen_helper_XVF32GER)
+TRANS(XVF32GERPP, do_ger_XX3, GER_PP, gen_helper_XVF32GER)
+TRANS(XVF32GERPN, do_ger_XX3, GER_PN, gen_helper_XVF32GER)
+TRANS(XVF32GERNP, do_ger_XX3, GER_NP, gen_helper_XVF32GER)
+TRANS(XVF32GERNN, do_ger_XX3, GER_NN, gen_helper_XVF32GER)
+
+TRANS(XVF64GER, do_ger_XX3, GER_NOP, gen_helper_XVF64GER)
+TRANS(XVF64GERPP, do_ger_XX3, GER_PP, gen_helper_XVF64GER)
+TRANS(XVF64GERPN, do_ger_XX3, GER_PN, gen_helper_XVF64GER)
+TRANS(XVF64GERNP, do_ger_XX3, GER_NP, gen_helper_XVF64GER)
+TRANS(XVF64GERNN, do_ger_XX3, GER_NN, gen_helper_XVF64GER)
+
+
+#undef GER_NOP
+#undef GER_PP
+#undef GER_NP
+#undef GER_PN
+#undef GER_NN
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


