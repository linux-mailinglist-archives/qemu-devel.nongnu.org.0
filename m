Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CC50FDEC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:58:09 +0200 (CEST)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKlc-0000Ct-59
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeh-0004Ya-Hy; Tue, 26 Apr 2022 08:50:59 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKef-00005X-Nr; Tue, 26 Apr 2022 08:50:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 803A8801008;
 Tue, 26 Apr 2022 09:50:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 5/7] target/ppc: Implemented xvf16ger*
Date: Tue, 26 Apr 2022 09:50:26 -0300
Message-Id: <20220426125028.18844-6-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:37.0787 (UTC)
 FILETIME=[3A5BE2B0:01D8596C]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
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
 include/fpu/softfloat.h             |  9 ++++
 target/ppc/cpu.h                    |  3 ++
 target/ppc/fpu_helper.c             | 65 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  6 +++
 target/ppc/translate/vsx-impl.c.inc |  6 +++
 6 files changed, 90 insertions(+)

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
index b5d7b35dda..91167f8cc0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -225,6 +225,7 @@ typedef union _ppc_vsr_t {
     int16_t s16[8];
     int32_t s32[4];
     int64_t s64[2];
+    float16 f16[8];
     float32 f32[4];
     float64 f64[2];
     float128 f128;
@@ -2652,6 +2653,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrHF(i) f16[i]
 #define VsrSF(i) f32[i]
 #define VsrDF(i) f64[i]
 #else
@@ -2663,6 +2665,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrHF(i) f16[7 - (i)]
 #define VsrSF(i) f32[3 - (i)]
 #define VsrDF(i) f64[1 - (i)]
 #endif
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6b03666d09..c3aead642a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3478,6 +3478,67 @@ static inline bool ger_neg_acc_flag(uint32_t flag)
     return flag & 0x4;
 }
 
+#define float16_to_float32(A, PTR) float16_to_float32(A, true, PTR)
+
+#define GET_VSR(VSR, A, I, SRC_T, TARGET_T)                             \
+    SRC_T##_to_##TARGET_T(A->VSR(I), excp_ptr)
+
+#define VSXGER16(NAME, ORIG_T, OR_EL)                                   \
+    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,             \
+              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)     \
+    {                                                                   \
+        ppc_vsr_t *at;                                                  \
+        float32 psum, aux_acc, va, vb, vc, vd;                          \
+        int i, j, xmsk_bit, ymsk_bit;                                   \
+        uint8_t xmsk = mask & 0x0F;                                     \
+        uint8_t ymsk = (mask >> 4) & 0x0F;                              \
+        uint8_t pmsk = (mask >> 8) & 0x3;                               \
+        ppc_vsr_t *b = cpu_vsr_ptr(env, b_r);                           \
+        ppc_vsr_t *a = cpu_vsr_ptr(env, a_r);                           \
+        float_status *excp_ptr = &env->fp_status;                       \
+        bool acc = ger_acc_flag(packed_flags);                          \
+        bool neg_acc = ger_neg_acc_flag(packed_flags);                  \
+        bool neg_mul = ger_neg_mul_flag(packed_flags);                  \
+        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {    \
+            at = cpu_vsr_ptr(env, at_r + i);                            \
+            for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {\
+                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {           \
+                    va = !(pmsk & 2) ? float32_zero :                   \
+                                       GET_VSR(Vsr##OR_EL, a,           \
+                                               2 * i, ORIG_T, float32); \
+                    vb = !(pmsk & 2) ? float32_zero :                   \
+                                       GET_VSR(Vsr##OR_EL, b,           \
+                                               2 * j, ORIG_T, float32); \
+                    vc = !(pmsk & 1) ? float32_zero :                   \
+                                       GET_VSR(Vsr##OR_EL, a,           \
+                                            2 * i + 1, ORIG_T, float32);\
+                    vd = !(pmsk & 1) ? float32_zero :                   \
+                                       GET_VSR(Vsr##OR_EL, b,           \
+                                            2 * j + 1, ORIG_T, float32);\
+                    psum = float32_mul(va, vb, excp_ptr);               \
+                    psum = float32_muladd(vc, vd, psum, 0, excp_ptr);   \
+                    if (acc) {                                          \
+                        if (neg_mul) {                                  \
+                            psum = float32_neg(psum);                   \
+                        }                                               \
+                        if (neg_acc) {                                  \
+                            aux_acc = float32_neg(at->VsrSF(j));        \
+                        } else {                                        \
+                            aux_acc = at->VsrSF(j);                     \
+                        }                                               \
+                        at->VsrSF(j) = float32_add(psum, aux_acc,       \
+                                                   excp_ptr);           \
+                    } else {                                            \
+                        at->VsrSF(j) = psum;                            \
+                    }                                                   \
+                } else {                                                \
+                    at->VsrSF(j) = 0;                                   \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        do_float_check_status(env, GETPC());                            \
+    }
+
 #define VSXGER(NAME, TYPE, EL)                                          \
     void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,             \
               uint32_t  at_r, uint32_t mask, uint32_t packed_flags)     \
@@ -3522,7 +3583,11 @@ static inline bool ger_neg_acc_flag(uint32_t flag)
         do_float_check_status(env, GETPC());                            \
     }
 
+VSXGER16(helper_XVF16GER2, float16, HF)
 VSXGER(helper_XVF32GER, float32, SF)
 VSXGER(helper_XVF64GER, float64, DF)
 
+#undef VSXGER16
 #undef VSXGER
+#undef GET_VSR
+#undef float16_to_float32
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7d725292b1..cc59a3b71d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -540,6 +540,7 @@ DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_6(XVI4GER8, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI8GER4, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI16GER2, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVF16GER2, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVF32GER, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVF64GER, void, env, i32, i32, i32, i32, i32)
 
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9652ca286c..a204730d1d 100644
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
index b1fb0f31f3..9285e27159 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2917,6 +2917,12 @@ TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, GER_SPP, gen_helper_XVI16GER2)
 #define GER_PN ger_pack_flags_xvf(true, false, true)
 #define GER_NN ger_pack_flags_xvf(true, true, true)
 
+TRANS(XVF16GER2, do_ger_XX3, GER_NOP, gen_helper_XVF16GER2)
+TRANS(XVF16GER2PP, do_ger_XX3, GER_PP, gen_helper_XVF16GER2)
+TRANS(XVF16GER2PN, do_ger_XX3, GER_PN, gen_helper_XVF16GER2)
+TRANS(XVF16GER2NP, do_ger_XX3, GER_NP, gen_helper_XVF16GER2)
+TRANS(XVF16GER2NN, do_ger_XX3, GER_NN, gen_helper_XVF16GER2)
+
 TRANS(XVF32GER, do_ger_XX3, GER_NOP, gen_helper_XVF32GER)
 TRANS(XVF32GERPP, do_ger_XX3, GER_PP, gen_helper_XVF32GER)
 TRANS(XVF32GERPN, do_ger_XX3, GER_PN, gen_helper_XVF32GER)
-- 
2.31.1


