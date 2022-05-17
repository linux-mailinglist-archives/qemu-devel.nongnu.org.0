Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3D52AB15
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:44:08 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Aq-0006bC-1Q
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr25D-0003Xa-7N; Tue, 17 May 2022 14:38:11 -0400
Received: from [187.72.171.209] (port=26849 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr25A-00064z-OY; Tue, 17 May 2022 14:38:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 15:37:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 85507800603;
 Tue, 17 May 2022 15:37:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3 4/8] target/ppc: Implemented xvf*ger*
Date: Tue, 17 May 2022 15:37:31 -0300
Message-Id: <20220517183735.110342-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 18:37:37.0731 (UTC)
 FILETIME=[2EAFF930:01D86A1D]
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
 target/ppc/cpu.h                    |   4 +
 target/ppc/fpu_helper.c             | 193 +++++++++++++++++++++++++++-
 target/ppc/helper.h                 |  10 ++
 target/ppc/insn32.decode            |  13 ++
 target/ppc/translate/vsx-impl.c.inc |  12 ++
 5 files changed, 230 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c8a12a3985..bdedf4138e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2641,6 +2641,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrSF(i) f32[i]
+#define VsrDF(i) f64[i]
 #else
 #define VsrB(i) u8[15 - (i)]
 #define VsrSB(i) s8[15 - (i)]
@@ -2650,6 +2652,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrSF(i) f32[3 - (i)]
+#define VsrDF(i) f64[1 - (i)]
 #endif
 
 static inline int vsr64_offset(int i, bool high)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 8592727792..8451de628b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -414,7 +414,7 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
     ppc_store_fpscr(env, val);
 }
 
-void helper_fpscr_check_status(CPUPPCState *env)
+static void do_fpscr_check_status(CPUPPCState *env, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
     target_ulong fpscr = env->fpscr;
@@ -455,13 +455,19 @@ void helper_fpscr_check_status(CPUPPCState *env)
     }
     cs->exception_index = POWERPC_EXCP_PROGRAM;
     env->error_code = error | POWERPC_EXCP_FP;
+    env->fpscr |= error ? FP_FEX : 0;
     /* Deferred floating-point exception after target FPSCR update */
     if (fp_exceptions_enabled(env)) {
         raise_exception_err_ra(env, cs->exception_index,
-                               env->error_code, GETPC());
+                               env->error_code, raddr);
     }
 }
 
+void helper_fpscr_check_status(CPUPPCState *env)
+{
+    do_fpscr_check_status(env, GETPC());
+}
+
 static void do_float_check_status(CPUPPCState *env, bool change_fi,
                                   uintptr_t raddr)
 {
@@ -3469,3 +3475,186 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
     *xt = t;
     do_float_check_status(env, true, GETPC());
 }
+
+static inline void vsxger_excp(CPUPPCState *env, uintptr_t retaddr)
+{
+    /*
+     * XV*GER instructions execute and set the FPSCR as if exceptions
+     * are disabled and only at the end throw an exception
+     */
+    target_ulong enable;
+    enable = env->fpscr & (FP_ENABLES | FP_FI | FP_FR);
+    env->fpscr &= ~(FP_ENABLES | FP_FI | FP_FR);
+    int status = get_float_exception_flags(&env->fp_status);
+    if (unlikely(status & float_flag_invalid)) {
+        if (status & float_flag_invalid_snan) {
+            float_invalid_op_vxsnan(env, 0);
+        }
+        if (status & float_flag_invalid_imz) {
+            float_invalid_op_vximz(env, false, 0);
+        }
+        if (status & float_flag_invalid_isi) {
+            float_invalid_op_vxisi(env, false, 0);
+        }
+    }
+    do_float_check_status(env, false, retaddr);
+    env->fpscr |= enable;
+    do_fpscr_check_status(env, retaddr);
+}
+
+typedef void vsxger_zero(ppc_vsr_t *at, int, int);
+
+typedef void vsxger_muladd_f(ppc_vsr_t *, ppc_vsr_t *, ppc_vsr_t *, int, int,
+                             int flags, float_status *s);
+
+static void vsxger_muladd32(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
+                            int j, int flags, float_status *s)
+{
+    at[i].VsrSF(j) = float32_muladd(a->VsrSF(i), b->VsrSF(j),
+                                    at[i].VsrSF(j), flags, s);
+}
+
+static void vsxger_mul32(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
+                         int j, int flags, float_status *s)
+{
+    at[i].VsrSF(j) = float32_mul(a->VsrSF(i), b->VsrSF(j), s);
+}
+
+static void vsxger_zero32(ppc_vsr_t *at, int i, int j)
+{
+    at[i].VsrSF(j) = float32_zero;
+}
+
+static void vsxger_muladd64(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
+                            int j, int flags, float_status *s)
+{
+    if (j >= 2) {
+        j -= 2;
+        at[i].VsrDF(j) = float64_muladd(a[i / 2].VsrDF(i % 2), b->VsrDF(j),
+                                        at[i].VsrDF(j), flags, s);
+    }
+}
+
+static void vsxger_mul64(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
+                         int j, int flags, float_status *s)
+{
+    if (j >= 2) {
+        j -= 2;
+        at[i].VsrDF(j) = float64_mul(a[i / 2].VsrDF(i % 2), b->VsrDF(j), s);
+    }
+}
+
+static void vsxger_zero64(ppc_vsr_t *at, int i, int j)
+{
+    if (j >= 2) {
+        j -= 2;
+        at[i].VsrDF(j) = float64_zero;
+    }
+}
+
+static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
+                   uint32_t mask, bool acc, bool neg_mul, bool neg_acc,
+                   vsxger_muladd_f mul, vsxger_muladd_f muladd, vsxger_zero zero)
+{
+    int i, j, xmsk_bit, ymsk_bit, op_flags;
+    uint8_t xmsk = mask & 0x0F;
+    uint8_t ymsk = (mask >> 4) & 0x0F;
+    float_status *excp_ptr = &env->fp_status;
+    op_flags = (neg_acc ^ neg_mul) ? float_muladd_negate_c : 0;
+    op_flags |= (neg_mul) ? float_muladd_negate_result : 0;
+    helper_reset_fpstatus(env);
+    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
+        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
+            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
+                if (acc) {
+                    muladd(at, a, b, i, j, op_flags, excp_ptr);
+                } else {
+                    mul(at, a, b, i, j, op_flags, excp_ptr);
+                }
+            } else {
+                    zero(at, i, j);
+            }
+        }
+    }
+    vsxger_excp(env, GETPC());
+}
+
+QEMU_FLATTEN
+void helper_XVF32GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, false, false, false, vsxger_mul32,
+           vsxger_muladd32, vsxger_zero32);
+}
+
+QEMU_FLATTEN
+void helper_XVF32GERPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, false, false, vsxger_mul32,
+           vsxger_muladd32, vsxger_zero32);
+}
+
+QEMU_FLATTEN
+void helper_XVF32GERPN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, false, true, vsxger_mul32,
+           vsxger_muladd32, vsxger_zero32);
+}
+
+QEMU_FLATTEN
+void helper_XVF32GERNP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, true, false, vsxger_mul32,
+           vsxger_muladd32, vsxger_zero32);
+}
+
+QEMU_FLATTEN
+void helper_XVF32GERNN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, true, true, vsxger_mul32,
+           vsxger_muladd32, vsxger_zero32);
+}
+
+QEMU_FLATTEN
+void helper_XVF64GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, false, false, false, vsxger_mul64,
+           vsxger_muladd64, vsxger_zero64);
+}
+
+QEMU_FLATTEN
+void helper_XVF64GERPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, false, false, vsxger_mul64,
+           vsxger_muladd64, vsxger_zero64);
+}
+
+QEMU_FLATTEN
+void helper_XVF64GERPN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, false, true, vsxger_mul64,
+           vsxger_muladd64, vsxger_zero64);
+}
+
+QEMU_FLATTEN
+void helper_XVF64GERNP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, true, false, vsxger_mul64,
+           vsxger_muladd64, vsxger_zero64);
+}
+
+QEMU_FLATTEN
+void helper_XVF64GERNN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger(env, a, b, at, mask, true, true, true, vsxger_mul64,
+           vsxger_muladd64, vsxger_zero64);
+}
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 29354276f0..054d25f3b0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -550,6 +550,16 @@ DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF32GERNP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF32GERNN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF64GER, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF64GERPP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF64GERPN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF64GERNP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF64GERNN, void, env, vsr, vsr, acc, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 899a04bf77..c561a17c7d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -173,6 +173,7 @@
 # 32 bit GER instructions have all mask bits considered 1
 &MMIRR_XX3      xa xb xt pmsk xmsk ymsk
 %xx_at          23:3
+%xx_xa_pair     2:1 17:4 !function=times_2
 @XX3_at         ...... ... .. ..... ..... ........ ...          &MMIRR_XX3 xt=%xx_at xb=%xx_xb \
                                                                 pmsk=255 xmsk=15 ymsk=15
 
@@ -737,3 +738,15 @@ XVI16GER2PP     111011 ... -- ..... ..... 01101011 ..-  @XX3_at xa=%xx_xa
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
index c9ed898bb6..76747956bb 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2869,6 +2869,18 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
 TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
 TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
 
+TRANS(XVF32GER, do_ger, gen_helper_XVF32GER)
+TRANS(XVF32GERPP, do_ger, gen_helper_XVF32GERPP)
+TRANS(XVF32GERPN, do_ger, gen_helper_XVF32GERPN)
+TRANS(XVF32GERNP, do_ger, gen_helper_XVF32GERNP)
+TRANS(XVF32GERNN, do_ger, gen_helper_XVF32GERNN)
+
+TRANS(XVF64GER, do_ger, gen_helper_XVF64GER)
+TRANS(XVF64GERPP, do_ger, gen_helper_XVF64GERPP)
+TRANS(XVF64GERPN, do_ger, gen_helper_XVF64GERPN)
+TRANS(XVF64GERNP, do_ger, gen_helper_XVF64GERNP)
+TRANS(XVF64GERNN, do_ger, gen_helper_XVF64GERNN)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


