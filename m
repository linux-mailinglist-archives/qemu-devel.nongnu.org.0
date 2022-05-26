Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624B5355F0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:04:56 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLbD-0008Vo-Jz
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD2-0002rg-Rv; Thu, 26 May 2022 17:39:56 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD0-0008Ez-GW; Thu, 26 May 2022 17:39:56 -0400
Received: by mail-oi1-x235.google.com with SMTP id y66so3687944oia.1;
 Thu, 26 May 2022 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ULhnsrNl22OGKloUG/+/6EM056l08OXqk689LK5MM4=;
 b=ptyOpRa/Tg5AeA2efuNWuVOaA9s0fUF9WcOnhmIloOM0WcoWNtqis5tUGB1+eWLr17
 1wD4Wq8n6r9m/rpfXUTNfTH1ZlJcxF92ixM33U30adrvmaO+oLscdUZnj++xZ1cwPWhe
 OZOFUMX/PNUNZR/VeUKyGrwKc3QxEEuaxnwabo1aDQb4N5J4fy55Msgvf9zbtmlMcFaU
 4GJdvOvCwOhC3RZxS3BOVIEtVM+iLhtXfjNIVe+JIF4zk9mJWD0oTO6maypiYA09PVph
 WUsh/zCiN5Pwsyp4DDCASs2RjMRjBL2ZLc4XzowGtOpFQgmf5BxyDD0bj8AP0fsQHTxv
 uuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ULhnsrNl22OGKloUG/+/6EM056l08OXqk689LK5MM4=;
 b=x5/Gb8uz1wbcecinoHzKiN7CltoOECUyxnxWjuDBzQ+H7clRT60fSOjIzH21tZYGZ1
 moK7518+d2ozcC1VP87fHczQ0XS4RkmnZUZB6SnalFJ7Ytpc/vzZ5D/KksG6W4PDgeib
 Yp4CSicgmPWlNsJhSlrrWCtO/zMXPC0qzAuh463OggM85aXsAsYocS+9+oJOzmhd+R3j
 KGc6HIwJvd9XiPFp9UsbTyXNgsQVUVZOdPL1XJOkEWXrH5YNwEmELQrLaspR7OgpX7Fb
 UXPIdKy3/BIOR+ECXMuIORxiVBvZq8D7IO041j3l9Wzs7lT+6EJC5yryR47K3IzewCO+
 tUPQ==
X-Gm-Message-State: AOAM532EdXs2H48tPCI6ECm5EMY4qDbA23xQJ+wFj52pJkaVM045ZCBI
 8YAc52sryAU1wlgwPlIFegS1ySKxOqA=
X-Google-Smtp-Source: ABdhPJw6cgrk0tQLF8J6n2PcwMaY+q6pGSY4jYPiSyYkY5sxwAX+MsLnZgKrzSrSkZ2VhNP9ew4sbg==
X-Received: by 2002:aca:1e04:0:b0:325:473:4038 with SMTP id
 m4-20020aca1e04000000b0032504734038mr2323930oic.159.1653601193380; 
 Thu, 26 May 2022 14:39:53 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 30/34] target/ppc: Implemented xvf*ger*
Date: Thu, 26 May 2022 18:38:11 -0300
Message-Id: <20220526213815.92701-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-5-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                    |   4 +
 target/ppc/fpu_helper.c             | 194 +++++++++++++++++++++++++++-
 target/ppc/helper.h                 |  10 ++
 target/ppc/insn32.decode            |  13 ++
 target/ppc/translate/vsx-impl.c.inc |  12 ++
 5 files changed, 231 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index dff3ca8222..40c779f246 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2643,6 +2643,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrSF(i) f32[i]
+#define VsrDF(i) f64[i]
 #else
 #define VsrB(i) u8[15 - (i)]
 #define VsrSB(i) s8[15 - (i)]
@@ -2652,6 +2654,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrSF(i) f32[3 - (i)]
+#define VsrDF(i) f64[1 - (i)]
 #endif
 
 static inline int vsr64_offset(int i, bool high)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9489e06504..712c71162c 100644
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
@@ -3468,3 +3474,187 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
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
+static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                   ppc_acc_t  *at, uint32_t mask, bool acc, bool neg_mul,
+                   bool neg_acc, vsxger_muladd_f mul, vsxger_muladd_f muladd,
+                   vsxger_zero zero)
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
+                zero(at, i, j);
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
index 1666797edf..f38cdbe1d8 100644
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
index 0e189fe2da..6b644155ec 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -178,6 +178,7 @@
 # 32 bit GER instructions have all mask bits considered 1
 &MMIRR_XX3      xa xb xt pmsk xmsk ymsk
 %xx_at          23:3
+%xx_xa_pair     2:1 17:4 !function=times_2
 @XX3_at         ...... ... .. ..... ..... ........ ...          &MMIRR_XX3 xt=%xx_at xb=%xx_xb \
                                                                 pmsk=255 xmsk=15 ymsk=15
 
@@ -761,3 +762,15 @@ XVI16GER2PP     111011 ... -- ..... ..... 01101011 ..-  @XX3_at xa=%xx_xa
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
index b10eded1da..cc754ab175 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2898,6 +2898,18 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
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
2.36.1


