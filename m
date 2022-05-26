Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC753560D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:18:57 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLom-0001cM-0V
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD5-000308-PC; Thu, 26 May 2022 17:39:59 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD3-0008HI-ME; Thu, 26 May 2022 17:39:59 -0400
Received: by mail-oi1-x229.google.com with SMTP id t144so3648525oie.7;
 Thu, 26 May 2022 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mPZgyVB5RHwP3zQEB3NsfxjcF7UIrdqlsI4jSr7vvO4=;
 b=FZ3E4MwW3QeCFtmYQw/RDPoXyPKIoslKAl1ROpV+aYfntWH7NXA/CrFZHpFWfikSd1
 h42Jp1tGAdI4P7xCWOlKwGchBHS3t8nU26G41HVBC+ytGJSMXwPDDv5oEXcNl23SNFHP
 I4V1S92BjxE4ys/3SELeBE953IT+RIebHuoPGpSpEi8lzU8ZSBGgcnge8WH3lEd6ctye
 s7xEE44H+7yPU9azhN9PBmyR+IFA0VnZX0WWlZDRtzzVB1pye0negGlxFZDBb+E/rX71
 FNJb1yUMvHWzmiBqFUPdM5Gl4xnKn4QVzbH3x1AzOlhr9K1Fx+njafocbeJwQpdF77/r
 hkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mPZgyVB5RHwP3zQEB3NsfxjcF7UIrdqlsI4jSr7vvO4=;
 b=aBpdMKcA0FnRGQc39yzpAMsuchRl6X3m9zg8p3Pi9BABKSoJPfRauJeFPCv7+5h8Xp
 cagF+UiLW4ioc4QIIl0MWjRPCITFJgb0O0NRJtb2DDvcDSNUmrZz/sYfmZfgjvNxKeKb
 D2KrfYsZZBH2n7kHWEWSe9cUV4HyD129tN+x3krACJy8LWaJUlCfrCR1ia4/MALgNj9B
 Vb9HghSe3Y70IidOCiQN0dcOsr0+45/XYpUXSE0VLjEc2phFam2G6SobYHNfsZjRXfvx
 4Lqv/5jEcicCfQ2VEvQaDuy5baIczrT3d/TKZ1Hr4O8Hm6xW/8F/79PUhtH5KzQV9d45
 XZgQ==
X-Gm-Message-State: AOAM533LPri89fpABbJMxKPskrr8FipPWDiFnMJH7vFhTuA6V+siC+MV
 71YsZ/42Z9qBBtR5e+UoHtP78HhnPxg=
X-Google-Smtp-Source: ABdhPJy/UCGx6nQMZx9arh8Qw9aR0Q3T2FNTJHt8OuIkduNppMMsvlYYQmqjTv34EKjF03Q455IBEw==
X-Received: by 2002:aca:3bc1:0:b0:32b:243e:2542 with SMTP id
 i184-20020aca3bc1000000b0032b243e2542mr2228547oia.175.1653601195849; 
 Thu, 26 May 2022 14:39:55 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 31/34] target/ppc: Implemented xvf16ger*
Date: Thu, 26 May 2022 18:38:12 -0300
Message-Id: <20220526213815.92701-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-6-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                    |  3 +
 target/ppc/fpu_helper.c             | 95 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  5 ++
 target/ppc/insn32.decode            |  6 ++
 target/ppc/translate/vsx-impl.c.inc |  6 ++
 5 files changed, 115 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 40c779f246..6d78078f37 100644
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
@@ -2643,6 +2644,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrHF(i) f16[i]
 #define VsrSF(i) f32[i]
 #define VsrDF(i) f64[i]
 #else
@@ -2654,6 +2656,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrHF(i) f16[7 - (i)]
 #define VsrSF(i) f32[3 - (i)]
 #define VsrDF(i) f64[1 - (i)]
 #endif
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 712c71162c..a9b2ef370f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -36,6 +36,15 @@ static inline float128 float128_snan_to_qnan(float128 x)
 #define float32_snan_to_qnan(x) ((x) | 0x00400000)
 #define float16_snan_to_qnan(x) ((x) | 0x0200)
 
+static inline float32 bfp32_neg(float32 a)
+{
+    if (unlikely(float32_is_any_nan(a))) {
+        return a;
+    } else {
+        return float32_chs(a);
+    }
+}
+
 static inline bool fp_exceptions_enabled(CPUPPCState *env)
 {
 #ifdef CONFIG_USER_ONLY
@@ -3501,6 +3510,57 @@ static inline void vsxger_excp(CPUPPCState *env, uintptr_t retaddr)
     do_fpscr_check_status(env, retaddr);
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
+    float32 r, aux_acc;
+    float64 psum, va, vb, vc, vd;
+    int i, j, xmsk_bit, ymsk_bit;
+    uint8_t pmsk = FIELD_EX32(mask, GER_MSK, PMSK),
+            xmsk = FIELD_EX32(mask, GER_MSK, XMSK),
+            ymsk = FIELD_EX32(mask, GER_MSK, YMSK);
+    float_status *excp_ptr = &env->fp_status;
+    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
+        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
+            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
+                va = !(pmsk & 2) ? float64_zero :
+                                   extract(a->VsrHF(2 * i), excp_ptr);
+                vb = !(pmsk & 2) ? float64_zero :
+                                   extract(b->VsrHF(2 * j), excp_ptr);
+                vc = !(pmsk & 1) ? float64_zero :
+                                   extract(a->VsrHF(2 * i + 1), excp_ptr);
+                vd = !(pmsk & 1) ? float64_zero :
+                                   extract(b->VsrHF(2 * j + 1), excp_ptr);
+                psum = float64_mul(va, vb, excp_ptr);
+                psum = float64r32_muladd(vc, vd, psum, 0, excp_ptr);
+                r = float64_to_float32(psum, excp_ptr);
+                if (acc) {
+                    aux_acc = at[i].VsrSF(j);
+                    if (neg_mul) {
+                        r = bfp32_neg(r);
+                    }
+                    if (neg_acc) {
+                        aux_acc = bfp32_neg(aux_acc);
+                    }
+                    r = float32_add(r, aux_acc, excp_ptr);
+                }
+                at[i].VsrSF(j) = r;
+            } else {
+                at[i].VsrSF(j) = float32_zero;
+            }
+        }
+    }
+    vsxger_excp(env, GETPC());
+}
+
 typedef void vsxger_zero(ppc_vsr_t *at, int, int);
 
 typedef void vsxger_muladd_f(ppc_vsr_t *, ppc_vsr_t *, ppc_vsr_t *, int, int,
@@ -3579,6 +3639,41 @@ static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
     vsxger_excp(env, GETPC());
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
index f38cdbe1d8..4070c0891c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -550,6 +550,11 @@ DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF16GER2, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF16GER2PP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF16GER2PN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF16GER2NP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVF16GER2NN, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, acc, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6b644155ec..b8e317159c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -763,6 +763,12 @@ XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
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
index cc754ab175..01978a585a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2898,6 +2898,12 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
 TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
 TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
 
+TRANS(XVF16GER2, do_ger, gen_helper_XVF16GER2)
+TRANS(XVF16GER2PP, do_ger, gen_helper_XVF16GER2PP)
+TRANS(XVF16GER2PN, do_ger, gen_helper_XVF16GER2PN)
+TRANS(XVF16GER2NP, do_ger, gen_helper_XVF16GER2NP)
+TRANS(XVF16GER2NN, do_ger, gen_helper_XVF16GER2NN)
+
 TRANS(XVF32GER, do_ger, gen_helper_XVF32GER)
 TRANS(XVF32GERPP, do_ger, gen_helper_XVF32GERPP)
 TRANS(XVF32GERPN, do_ger, gen_helper_XVF32GERPN)
-- 
2.36.1


