Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203F53672C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:54:41 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf6e-0004xf-JU
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-00077t-Tk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYb-0003c3-Uv
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:32 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 129so290081pgc.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrmzPXbHyHpLCgRdJlUBecbaJ1lJp9CbK+PZ+6XFhy4=;
 b=oMuXaVW/gaa6Q8jlj/duj/2UgoiEjjrlFIJ+p/Nf8qWJPXw5KlXbYXRtz0fSXut2QI
 Aaa+5WnwsHocNE6MLG3kM22GAlWF8FFIq1Y9hX3uqHpHtj1vIRIdbPp9ctEpj4X52cI8
 HwpU04hzVeSjv5E3HVMciJ2XVRqAwQO6S3p2aJhfGd5F08h4FqHX+y285DkIpuAWOJUA
 BpxNFYzVc0Ffv3CYgwif2uyJQufF8puYSH4iSBpEN6tRzUNS4FjI7uK4TD4vZ3mk/0o7
 JQ2+o3KeP9Ue3bQ7PObBnSk2R+sarPesTz7jONLlXX1qH/+MlAOEBwH5jigSGfxtqqV0
 4BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrmzPXbHyHpLCgRdJlUBecbaJ1lJp9CbK+PZ+6XFhy4=;
 b=uqAD80t5FaDx7uL4jyGbwkQ/q7/8XW93fS3T3VsZSJ0mQuf1MIiAy7dllmyG/+3bMW
 fvzScQ7UD2DyiVFHKQ9CTOf+8ANzIYF3kuMgGxDrCE9niL+3rauzjztkr8XE4wh6uzId
 QMhfAl0BoB5HTN9fbpB+4BGS13uVWYR7DaP1bM4fY4UwZUXDmYZgmNHMv3T2xTESps8U
 K+B8JjgZjErJDUNBgemKGyl5dV3CtXrK8a7L4eIy0qLZXVA96Haaw6ETIG55ZhGu38DC
 wWdhnQC9Wiv1jowHiOjyEhmNMFESBbjMVz4PDQLARVkogYJxqsMQ6/CzvTAQjpR7BWTa
 z7vg==
X-Gm-Message-State: AOAM533NXpDLNhvWUm3HR5l/yj4n+ZlMXzoZqVcSgTPwSmEUU0nF/1d+
 BOD41Wfq0+2wibJr22lP2PsoI5d5c8dnZQ==
X-Google-Smtp-Source: ABdhPJw8LIILdX3J7RUTBd5ENXcUejKEii/81Z3fpoiqsZ96LzGTuoBy7ZxC10ak1E0DuKkcMJK0ow==
X-Received: by 2002:a63:6b42:0:b0:3da:ebd8:2e38 with SMTP id
 g63-20020a636b42000000b003daebd82e38mr38830204pgc.273.1653675568613; 
 Fri, 27 May 2022 11:19:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 021/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpz
Date: Fri, 27 May 2022 11:17:34 -0700
Message-Id: <20220527181907.189259-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Convert SVE translation functions directly using
gen_gvec_ool_arg_zpz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 189 ++++++++++++-------------------------
 1 file changed, 60 insertions(+), 129 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index be426db6a9..d5a09a60af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -812,101 +812,60 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
 
-#define DO_ZPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
-{                                                                   \
-    static gen_helper_gvec_3 * const fns[4] = {                     \
-        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,       \
-        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,       \
+#define DO_ZPZ(NAME, FEAT, name) \
+    static gen_helper_gvec_3 * const name##_fns[4] = {              \
+        gen_helper_##name##_b, gen_helper_##name##_h,               \
+        gen_helper_##name##_s, gen_helper_##name##_d,               \
     };                                                              \
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);              \
-}
+    TRANS_FEAT(NAME, FEAT, gen_gvec_ool_arg_zpz, name##_fns[a->esz], a, 0)
 
-DO_ZPZ(CLS, cls)
-DO_ZPZ(CLZ, clz)
-DO_ZPZ(CNT_zpz, cnt_zpz)
-DO_ZPZ(CNOT, cnot)
-DO_ZPZ(NOT_zpz, not_zpz)
-DO_ZPZ(ABS, abs)
-DO_ZPZ(NEG, neg)
+DO_ZPZ(CLS, aa64_sve, sve_cls)
+DO_ZPZ(CLZ, aa64_sve, sve_clz)
+DO_ZPZ(CNT_zpz, aa64_sve, sve_cnt_zpz)
+DO_ZPZ(CNOT, aa64_sve, sve_cnot)
+DO_ZPZ(NOT_zpz, aa64_sve, sve_not_zpz)
+DO_ZPZ(ABS, aa64_sve, sve_abs)
+DO_ZPZ(NEG, aa64_sve, sve_neg)
+DO_ZPZ(RBIT, aa64_sve, sve_rbit)
 
-static bool trans_FABS(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_fabs_h,
-        gen_helper_sve_fabs_s,
-        gen_helper_sve_fabs_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const fabs_fns[4] = {
+    NULL,                  gen_helper_sve_fabs_h,
+    gen_helper_sve_fabs_s, gen_helper_sve_fabs_d,
+};
+TRANS_FEAT(FABS, aa64_sve, gen_gvec_ool_arg_zpz, fabs_fns[a->esz], a, 0)
 
-static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_fneg_h,
-        gen_helper_sve_fneg_s,
-        gen_helper_sve_fneg_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const fneg_fns[4] = {
+    NULL,                  gen_helper_sve_fneg_h,
+    gen_helper_sve_fneg_s, gen_helper_sve_fneg_d,
+};
+TRANS_FEAT(FNEG, aa64_sve, gen_gvec_ool_arg_zpz, fneg_fns[a->esz], a, 0)
 
-static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_sxtb_h,
-        gen_helper_sve_sxtb_s,
-        gen_helper_sve_sxtb_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const sxtb_fns[4] = {
+    NULL,                  gen_helper_sve_sxtb_h,
+    gen_helper_sve_sxtb_s, gen_helper_sve_sxtb_d,
+};
+TRANS_FEAT(SXTB, aa64_sve, gen_gvec_ool_arg_zpz, sxtb_fns[a->esz], a, 0)
 
-static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_uxtb_h,
-        gen_helper_sve_uxtb_s,
-        gen_helper_sve_uxtb_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const uxtb_fns[4] = {
+    NULL,                  gen_helper_sve_uxtb_h,
+    gen_helper_sve_uxtb_s, gen_helper_sve_uxtb_d,
+};
+TRANS_FEAT(UXTB, aa64_sve, gen_gvec_ool_arg_zpz, uxtb_fns[a->esz], a, 0)
 
-static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL, NULL,
-        gen_helper_sve_sxth_s,
-        gen_helper_sve_sxth_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const sxth_fns[4] = {
+    NULL, NULL, gen_helper_sve_sxth_s, gen_helper_sve_sxth_d
+};
+TRANS_FEAT(SXTH, aa64_sve, gen_gvec_ool_arg_zpz, sxth_fns[a->esz], a, 0)
 
-static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL, NULL,
-        gen_helper_sve_uxth_s,
-        gen_helper_sve_uxth_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const uxth_fns[4] = {
+    NULL, NULL, gen_helper_sve_uxth_s, gen_helper_sve_uxth_d
+};
+TRANS_FEAT(UXTH, aa64_sve, gen_gvec_ool_arg_zpz, uxth_fns[a->esz], a, 0)
 
-static bool trans_SXTW(DisasContext *s, arg_rpr_esz *a)
-{
-    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_sxtw_d
-                                : NULL, a, 0);
-}
-
-static bool trans_UXTW(DisasContext *s, arg_rpr_esz *a)
-{
-    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_uxtw_d
-                                : NULL, a, 0);
-}
-
-#undef DO_ZPZ
+TRANS_FEAT(SXTW, aa64_sve, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_sxtw_d : NULL, a, 0)
+TRANS_FEAT(UXTW, aa64_sve, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_uxtw_d : NULL, a, 0)
 
 /*
  *** SVE Integer Reduction Group
@@ -2658,13 +2617,10 @@ TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
  *** SVE Permute Vector - Predicated Group
  */
 
-static bool trans_COMPACT(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const compact_fns[4] = {
+    NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
+};
+TRANS_FEAT(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz, compact_fns[a->esz], a, 0)
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
  * function, scaled by the element size.  This includes the not found
@@ -3004,44 +2960,19 @@ static bool trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a)
     return true;
 }
 
-static bool trans_REVB(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_revb_h,
-        gen_helper_sve_revb_s,
-        gen_helper_sve_revb_d,
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const revb_fns[4] = {
+    NULL,                  gen_helper_sve_revb_h,
+    gen_helper_sve_revb_s, gen_helper_sve_revb_d,
+};
+TRANS_FEAT(REVB, aa64_sve, gen_gvec_ool_arg_zpz, revb_fns[a->esz], a, 0)
 
-static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        NULL,
-        gen_helper_sve_revh_s,
-        gen_helper_sve_revh_d,
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const revh_fns[4] = {
+    NULL, NULL, gen_helper_sve_revh_s, gen_helper_sve_revh_d,
+};
+TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 
-static bool trans_REVW(DisasContext *s, arg_rpr_esz *a)
-{
-    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_revw_d
-                                : NULL, a, 0);
-}
-
-static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_rbit_b,
-        gen_helper_sve_rbit_h,
-        gen_helper_sve_rbit_s,
-        gen_helper_sve_rbit_d,
-    };
-    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
-}
+TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
+           a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
 {
-- 
2.34.1


