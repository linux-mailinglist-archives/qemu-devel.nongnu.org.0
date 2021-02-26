Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A754325C56
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:07:35 +0100 (CET)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUPe-0001hB-2h
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTl9-0003oT-2p
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:45 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTl5-0003AE-Vr
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id d11so4554842plo.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yjJB5BkNmAEKA1QHGVUpq4CSuPHrTxE4reKwCdXXjEc=;
 b=GF3tYXitlMELPrtyAZCpF0b/r4NwjF391nlUKYWOIQHWLrtwEcCFv0j++AUsHfcNt2
 3O4+soQQFBD8SEiYvm9IMA9FPsWxoa2/bWSuN30s2WAZht+moz2RHF6+OqpZzaUUzsF0
 nZGjIgr9/1BLuRuGxFXfIw1jM9kcgNPEaUrmevUsZ18AOzMh/aeaasErCjL1VBcHGWRg
 UNnJw4fv5eqGtdN9okV9fsN/il/Lk3bPE0LFCZwX7uldHdVipWxavDP9UYM9alYVzD4N
 w0JWtl69Wa4Ba8D14J5tKLuU0SS7RrQNtvSZdMK1UVPqV0cJuLr7LPkqQAV1Z7RZHSVV
 R/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yjJB5BkNmAEKA1QHGVUpq4CSuPHrTxE4reKwCdXXjEc=;
 b=m9rdVUe7klcCQsDx+RW59Y54pbBmErQpGjSbu+Wurvju7wkIWsW7cJqr05GY4UhfNm
 KHEzVa1qfn/JEkRwG3hh9dOnDo4IJyevi8FWkRQXbO5uSzISUCS0Ufxs+MACqy7CD033
 yAuV8qQxubpS/ph8ITd/Xkk8vQY8L/L27/3ln8QYaC858Pr1cV8aaTvX+lN5VWuQ7J0P
 xHqKXB1NVFOZJFZUphKzsk9p9dNFPMxts+u+jC7zJ9hUAHRGGWMJLv9RK14ln4yWtiWC
 mTsLw6r3ojo4sNF5vqQMRR6NftranFXabL4Do0cCHTQgt0Js7a1qisKKZe6CF+pwlyM6
 XjMg==
X-Gm-Message-State: AOAM532G/5aQYWbUi8Z4PCNDlSbqerM7XUlxDa56cQi5zsrKfCTrUHMO
 WOyrX1rmGuREKNsCgskVk7/mN9zDaH1ROw==
X-Google-Smtp-Source: ABdhPJz4XbmKPrz6eZ6nvDlalvFWzTJ/ae3LWSARgpqpyOgSfjoeQp1cAT0RtvZ96/By4j1C85Cbew==
X-Received: by 2002:a17:90a:9310:: with SMTP id
 p16mr1177185pjo.211.1614309938027; 
 Thu, 25 Feb 2021 19:25:38 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 70/75] target/riscv: rvv-1.0: floating-point reciprocal
 estimate instruction
Date: Fri, 26 Feb 2021 11:18:54 +0800
Message-Id: <20210226031902.23656-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implement the floating-point reciprocal estimate to 7 bits instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 target/riscv/vector_helper.c            | 191 ++++++++++++++++++++++++
 4 files changed, 197 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1be95ebd0aa..6dffd9be45d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -886,6 +886,10 @@ DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
 
+DEF_HELPER_5(vfrec7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c1e896f6b84..916367703f1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -536,6 +536,7 @@ vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
+vfrec7_v        010011 . ..... 00101 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ca290469e23..120b32367e5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2639,6 +2639,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
 
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrec7_v, opfv_check, RISCV_FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 471b07f4388..fc6834c1ec4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3821,6 +3821,197 @@ GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
 
+/*
+ * Vector Floating-Point Reciprocal Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.cc:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.cc
+ */
+static uint64_t frec7(uint64_t f, int exp_size, int frac_size,
+                      float_status *s)
+{
+    bool sign = extract64(f, frac_size + exp_size, 1);
+    uint64_t exp = extract64(f, frac_size, exp_size);
+    uint64_t frac = extract64(f, 0, frac_size);
+
+    const uint8_t lookup_table[] = {
+        127, 125, 123, 121, 119, 117, 116, 114,
+        112, 110, 109, 107, 105, 104, 102, 100,
+        99, 97, 96, 94, 93, 91, 90, 88,
+        87, 85, 84, 83, 81, 80, 79, 77,
+        76, 75, 74, 72, 71, 70, 69, 68,
+        66, 65, 64, 63, 62, 61, 60, 59,
+        58, 57, 56, 55, 54, 53, 52, 51,
+        50, 49, 48, 47, 46, 45, 44, 43,
+        42, 41, 40, 40, 39, 38, 37, 36,
+        35, 35, 34, 33, 32, 31, 31, 30,
+        29, 28, 28, 27, 26, 25, 25, 24,
+        23, 23, 22, 21, 21, 20, 19, 19,
+        18, 17, 17, 16, 15, 15, 14, 14,
+        13, 12, 12, 11, 11, 10, 9, 9,
+        8, 8, 7, 7, 6, 5, 5, 4,
+        4, 3, 3, 2, 2, 1, 1, 0
+    };
+    const int precision = 7;
+
+    if (exp == 0 && frac != 0) { /* subnormal */
+        /* Normalize the subnormal. */
+        while (extract64(frac, frac_size - 1, 1) == 0) {
+            exp--;
+            frac <<= 1;
+        }
+
+        frac = (frac << 1) & MAKE_64BIT_MASK(0, frac_size);
+
+        if (exp != 0 && exp != UINT64_MAX) {
+            /*
+             * Overflow to inf or max value of same sign,
+             * depending on sign and rounding mode.
+             */
+            s->float_exception_flags |= (float_flag_inexact |
+                                         float_flag_overflow);
+
+            if ((s->float_rounding_mode == float_round_to_zero) ||
+                ((s->float_rounding_mode == float_round_down) && !sign) ||
+                ((s->float_rounding_mode == float_round_up) && sign)) {
+                /* Return greatest/negative finite value. */
+                return (sign << (exp_size + frac_size)) |
+                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
+            } else {
+                /* Return +-inf. */
+                return (sign << (exp_size + frac_size)) |
+                    MAKE_64BIT_MASK(frac_size, exp_size);
+            }
+        }
+    }
+
+    int idx = frac >> (frac_size - precision);
+    uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
+                            (frac_size - precision);
+    uint64_t out_exp = 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
+
+    if (out_exp == 0 || out_exp == UINT64_MAX) {
+        /*
+         * The result is subnormal, but don't raise the underflow exception,
+         * because there's no additional loss of precision.
+         */
+        out_frac = (out_frac >> 1) | MAKE_64BIT_MASK(frac_size - 1, 1);
+        if (out_exp == UINT64_MAX) {
+            out_frac >>= 1;
+            out_exp = 0;
+        }
+    }
+
+    uint64_t val = 0;
+    val = deposit64(val, 0, frac_size, out_frac);
+    val = deposit64(val, frac_size, exp_size, out_exp);
+    val = deposit64(val, frac_size + exp_size, 1, sign);
+    return val;
+}
+
+static float16 frec7_h(float16 f, float_status *s)
+{
+    int exp_size = 5, frac_size = 10;
+    bool sign = float16_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float16_is_infinity(f)) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float16_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float16(val);
+}
+
+static float32 frec7_s(float32 f, float_status *s)
+{
+    int exp_size = 8, frac_size = 23;
+    bool sign = float32_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float32_is_infinity(f)) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float32_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float32(val);
+}
+
+static float64 frec7_d(float64 f, float_status *s)
+{
+    int exp_size = 11, frac_size = 52;
+    bool sign = float64_is_neg(f);
+
+    /* frec7(+-inf) = +-0 */
+    if (float64_is_infinity(f)) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* frec7(+-0) = +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |= float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frec7(sNaN) = canonical NaN */
+    if (float64_is_signaling_nan(f, s)) {
+        s->float_exception_flags |= float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frec7(qNaN) = canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val = frec7(f, exp_size, frac_size, s);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
+RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
+RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
+GEN_VEXT_V_ENV(vfrec7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrec7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrec7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
-- 
2.17.1


