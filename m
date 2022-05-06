Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59A51D7BE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:30:06 +0200 (CEST)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmx5w-00071g-Uw
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwvR-0006RR-3h; Fri, 06 May 2022 08:19:13 -0400
Received: from [187.72.171.209] (port=63199 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwvP-0005am-6c; Fri, 06 May 2022 08:19:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 6 May 2022 09:18:49 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9EEF68000CB;
 Fri,  6 May 2022 09:18:48 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [RFC PATCH v2 5/7] target/ppc: Implemented xvf16ger*
Date: Fri,  6 May 2022 09:18:42 -0300
Message-Id: <20220506121844.18969-6-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 May 2022 12:18:49.0134 (UTC)
 FILETIME=[70D80CE0:01D86143]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xvf16ger2:   VSX Vector 16-bit Floating-Point GER (rank-2 update)
xvf16ger2nn: VSX Vector 16-bit Floating-Point GER (rank-2 update) Negative
multiply, Negative accumulate
xvf16ger2np: VSX Vector 16-bit Floating-Point GER (rank-2 update) Negative
multiply, Positive accumulate
xvf16ger2pn: VSX Vector 16-bit Floating-Point GER (rank-2 update) Positive
multiply, Negative accumulate
xvf16ger2pp: VSX Vector 16-bit Floating-Point GER (rank-2 update) Positive
multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 include/fpu/softfloat.h             |  9 +++
 target/ppc/cpu.h                    |  3 +
 target/ppc/fpu_helper.c             | 85 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  5 ++
 target/ppc/insn32.decode            |  6 ++
 target/ppc/translate/vsx-impl.c.inc |  6 ++
 6 files changed, 114 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 3dcf20e3a2..63d7ff18f0 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -619,6 +619,15 @@ static inline float32 float32_chs(float32 a)
     return make_float32(float32_val(a) ^ 0x80000000);
 }
 
+static inline float32 float32_neg(float32 a)
+{
+    if (((a & 0x7f800000) == 0x7f800000) && (a & 0x007fffff)) {
+        return a;
+    } else {
+        return float32_chs(a);
+    }
+}
+
 static inline bool float32_is_infinity(float32 a)
 {
     return (float32_val(a) & 0x7fffffff) == 0x7f800000;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index eb50ad699e..c891a23830 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -227,6 +227,7 @@ typedef union _ppc_vsr_t {
     int16_t s16[8];
     int32_t s32[4];
     int64_t s64[2];
+    float16 f16[8];
     float32 f32[4];
     float64 f64[2];
     float128 f128;
@@ -2639,6 +2640,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrHF(i) f16[i]
 #define VsrSF(i) f32[i]
 #define VsrDF(i) f64[i]
 #else
@@ -2650,6 +2652,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrHF(i) f16[7 - (i)]
 #define VsrSF(i) f32[3 - (i)]
 #define VsrDF(i) f64[1 - (i)]
 #endif
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 138b30d08f..6857be6ccc 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3484,6 +3484,56 @@ static void set_rounding_mode_rn(CPUPPCState *env)
     }
 }
 
+typedef float64 extract_f16(float16, float_status *);
+
+static float64 extract_hf16(float16 in, float_status *fp_status)
+{
+    return float16_to_float64(in, true, fp_status);
+}
+
+static void vsxger16(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t  *at, uint32_t mask, bool acc,
+                     bool neg_mul, bool neg_acc, extract_f16 extract)
+{
+    float32 msum, aux_acc;
+    float64 psum, va, vb, vc, vd;
+    int i, j, xmsk_bit, ymsk_bit;
+    uint8_t pmsk = FIELD_EX32(mask, GER_MSK, PMSK),
+            xmsk = FIELD_EX32(mask, GER_MSK, XMSK),
+            ymsk = FIELD_EX32(mask, GER_MSK, YMSK);
+    float_status *excp_ptr = &env->fp_status;
+    set_rounding_mode_rn(env);
+    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
+        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
+            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
+                va = !(pmsk & 2) ? float64_zero : extract(a->VsrHF(2 * i), excp_ptr);
+                vb = !(pmsk & 2) ? float64_zero : extract(b->VsrHF(2 * j), excp_ptr);
+                vc = !(pmsk & 1) ? float64_zero : extract(a->VsrHF(2 * i + 1), excp_ptr);
+                vd = !(pmsk & 1) ? float64_zero : extract(b->VsrHF(2 * j + 1), excp_ptr);
+                psum = float64_mul(va, vb, excp_ptr);
+                psum = float64r32_muladd(vc, vd, psum, 0, excp_ptr);
+                msum = float64_to_float32(psum, excp_ptr);
+                if (acc) {
+                    if (neg_mul) {
+                        msum = float32_neg(msum);
+                    }
+                    if (neg_acc) {
+                        aux_acc = float32_neg(at[i].VsrSF(j));
+                    } else {
+                        aux_acc = at[i].VsrSF(j);
+                    }
+                    at[i].VsrSF(j) = float32_add(msum, aux_acc, excp_ptr);
+                } else {
+                    at[i].VsrSF(j) = msum;
+                }
+            } else {
+                at[i].VsrSF(j) = float32_zero;
+            }
+        }
+    }
+    do_float_check_status(env, GETPC());
+}
+
 typedef void vsxger_zero(ppc_vsr_t *at, int, int);
 
 typedef void vsxger_muladd_f(ppc_vsr_t *, ppc_vsr_t *, ppc_vsr_t *, int, int,
@@ -3561,6 +3611,41 @@ static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
     do_float_check_status(env, GETPC());
 }
 
+QEMU_FLATTEN
+void helper_XVF16GER2(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, false, false, false, extract_hf16);
+}
+
+QEMU_FLATTEN
+void helper_XVF16GER2PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, false, false, extract_hf16);
+}
+
+QEMU_FLATTEN
+void helper_XVF16GER2PN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, false, true, extract_hf16);
+}
+
+QEMU_FLATTEN
+void helper_XVF16GER2NP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, true, false, extract_hf16);
+}
+
+QEMU_FLATTEN
+void helper_XVF16GER2NN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, true, true, extract_hf16);
+}
+
 QEMU_FLATTEN
 void helper_XVF32GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
                      ppc_acc_t *at, uint32_t mask)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 360aa74ed1..5f2f574d30 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -546,6 +546,11 @@ DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVF16GER2, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVF16GER2PP, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVF16GER2PN, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVF16GER2NP, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVF16GER2NN, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9a3581db2f..bbd4bc80f8 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -736,6 +736,12 @@ XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
 
+XVF16GER2       111011 ... -- ..... ..... 00010011 ..-  @XX3_at xa=%xx_xa
+XVF16GER2PP     111011 ... -- ..... ..... 00010010 ..-  @XX3_at xa=%xx_xa
+XVF16GER2PN     111011 ... -- ..... ..... 10010010 ..-  @XX3_at xa=%xx_xa
+XVF16GER2NP     111011 ... -- ..... ..... 01010010 ..-  @XX3_at xa=%xx_xa
+XVF16GER2NN     111011 ... -- ..... ..... 11010010 ..-  @XX3_at xa=%xx_xa
+
 XVF32GER        111011 ... -- ..... ..... 00011011 ..-  @XX3_at xa=%xx_xa
 XVF32GERPP      111011 ... -- ..... ..... 00011010 ..-  @XX3_at xa=%xx_xa
 XVF32GERPN      111011 ... -- ..... ..... 10011010 ..-  @XX3_at xa=%xx_xa
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 764c6ded70..a8155b8bee 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2884,6 +2884,12 @@ TRANS64(PMXVI16GER2PP, do_ger_MMIRR_XX3, gen_helper_XVI16GER2PP)
 TRANS64(PMXVI16GER2S, do_ger_MMIRR_XX3, gen_helper_XVI16GER2S)
 TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, gen_helper_XVI16GER2SPP)
 
+TRANS(XVF16GER2, do_ger_XX3, gen_helper_XVF16GER2)
+TRANS(XVF16GER2PP, do_ger_XX3, gen_helper_XVF16GER2PP)
+TRANS(XVF16GER2PN, do_ger_XX3, gen_helper_XVF16GER2PN)
+TRANS(XVF16GER2NP, do_ger_XX3, gen_helper_XVF16GER2NP)
+TRANS(XVF16GER2NN, do_ger_XX3, gen_helper_XVF16GER2NN)
+
 TRANS(XVF32GER, do_ger_XX3, gen_helper_XVF32GER)
 TRANS(XVF32GERPP, do_ger_XX3, gen_helper_XVF32GERPP)
 TRANS(XVF32GERPN, do_ger_XX3, gen_helper_XVF32GERPN)
-- 
2.31.1


