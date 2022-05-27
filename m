Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667AD5366FC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:41:05 +0200 (CEST)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuetU-0002Xf-E9
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYr-0007pI-2B
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYn-0003gW-2o
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5029290pjq.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGL/qbpWEW42wbFBUTxnlT4/PGbXcUIse8q7JLAQFA4=;
 b=LgRLJHhdK4sW39fjbvKYo5COvl5FqBsno5KfXBz26yyxIl99M5mOm51KMmEh1e9o5V
 OzumRPGVNIKecdeVMj0ioDsDioBFMpnd3pw5yDbFb6vs2MCEPXXAquZV42HgPr2ljxWv
 OV5sCYm2Zr1xVGrZ+oFswDZmTkcVVhfM+HiByaKVaTQzL1HzQq05SAel8QzRmPwb0Xvf
 xzSfcOKF31OK7QX+j+iAahgHxf8Yc/r32nbI1lZU5Y0SiXwgkbl04G0H4uFeIDrFjgbd
 E1gFyBAQ6Ckvypi7W8ELHcQt5npIGrNZiegXpOfk5EfI0Gee4FHNo6NTWFLYSGwohddY
 VoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGL/qbpWEW42wbFBUTxnlT4/PGbXcUIse8q7JLAQFA4=;
 b=PIx5pXGQOxUSvkkIVf8Cg3miJR7rTA9P5xs2MBINCz4EyPHtmMZ1ETiKVCb86mPLNC
 9BRf3rs6ewm+Wdzw1kcxfvMOtpR6r06dyZynHHE+6n+uaB/HVDsZXhgjLkwUSMW5EphF
 +rU2RdRGTSzCiNbxfUh77dLAhLyAUYqaRPtJ4smKS+QWR0eH5+c+KjD86+8rNCpcM1EK
 rKXfKkXS9/jb+qN/ekTDefDo0S1cGzJ/EnkYsWHa/txXQXPdh/iTqYW8tMsmj/BcCYhQ
 Xqkq1Lm5JRAjWw4mm8CMTSIL3MAMCw/gfvfkoMwuPK/dglhBMH128kxak4uX6V3c/P0e
 pC8A==
X-Gm-Message-State: AOAM5322C1AMm8u247cFJVynx4BxFHgypV0mdkhXNgNkCLu/2TJypXrg
 2Lrm7AzKtWM532JNjos7qfwisQwm6LYGkw==
X-Google-Smtp-Source: ABdhPJwNUFxQxHDaT2Lowi7XLQKS5I49Z4nRDPo0z3+XxKljoAEFUo+ZO3F7rBm2CrtSIieuTjT24g==
X-Received: by 2002:a17:90b:1e44:b0:1e0:b640:776f with SMTP id
 pi4-20020a17090b1e4400b001e0b640776fmr9594090pjb.169.1653675579738; 
 Fri, 27 May 2022 11:19:39 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 033/114] target/arm: Use TRANS_FEAT for gen_gvec_fn_arg_zzz
Date: Fri, 27 May 2022 11:17:46 -0700
Message-Id: <20220527181907.189259-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Convert SVE translation functions directly using
gen_gvec_fn_arg_zzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 66 +++++++-------------------------------
 1 file changed, 11 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2dbf296128..ddb34cad8e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -376,25 +376,10 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
-static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_and, a);
-}
-
-static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_or, a);
-}
-
-static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_xor, a);
-}
-
-static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_andc, a);
-}
+TRANS_FEAT(AND_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_and, a)
+TRANS_FEAT(ORR_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_or, a)
+TRANS_FEAT(EOR_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_xor, a)
+TRANS_FEAT(BIC_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_andc, a)
 
 static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
 {
@@ -706,35 +691,12 @@ static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
  *** SVE Integer Arithmetic - Unpredicated Group
  */
 
-static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_add, a);
-}
-
-static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sub, a);
-}
-
-static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ssadd, a);
-}
-
-static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sssub, a);
-}
-
-static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_usadd, a);
-}
-
-static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ussub, a);
-}
+TRANS_FEAT(ADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_add, a)
+TRANS_FEAT(SUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_sub, a)
+TRANS_FEAT(SQADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ssadd, a)
+TRANS_FEAT(SQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_sssub, a)
+TRANS_FEAT(UQADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_usadd, a)
+TRANS_FEAT(UQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ussub, a)
 
 /*
  *** SVE Integer Arithmetic - Binary Predicated Group
@@ -6420,13 +6382,7 @@ static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
  * SVE2 Integer Multiply - Unpredicated
  */
 
-static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_mul, a);
-}
+TRANS_FEAT(MUL_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, tcg_gen_gvec_mul, a)
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
     gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
-- 
2.34.1


