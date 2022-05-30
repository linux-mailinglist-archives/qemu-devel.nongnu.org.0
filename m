Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA653864C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:47:19 +0200 (CEST)
Received: from localhost ([::1]:34374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviY2-0007RF-Fo
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0002xH-S3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0007Be-K9
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15257378wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sjtv4t0my/dHWs1YdQ1YtuTu6O5BNB6/TiEmEWputiQ=;
 b=CCKNGbvzDig9EMB1z/dpIqurM77on2ZuYPJznNDgeL/YtkGQtbPQ+Xa9WXGeQfrsgr
 TXRDEnfpJJg4iiyhVusu3A5rHWm4uiiItdyo/FgTWPHTHiRCB6x1wlI4mbn4296H4N/0
 yIGCY5H9hJ/JQozhQBuZ7LaHcNZDQl8fdrTe0zS98yaCeHYeW0k7OEyeYB1okPas063u
 icuLEwLGlqyQjK3yWvthv7Xisu1S9Dcv1pNpcMOBhAOmPjbJBdBDNl6ClZuTM39UHKBF
 Y/UTPmTcIyAxXGOxhsmy0CU9vBkvT05dXnLIe10qjiI1fcMgY3MIesAZr/4S1N+B9nWC
 FKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjtv4t0my/dHWs1YdQ1YtuTu6O5BNB6/TiEmEWputiQ=;
 b=o7FdE6ypIyRf8xWmy/u1lJO2ktnVvhUKaf1dcjhlF1qyeSgXtisrTRK+BiZPl6giso
 UC/uyjAKAB+s+6NWhPd2xp7O8YDmXv0xmc1mT3mzxh9XC+45U5OGsfn2LmKcfUmQn+oM
 j/Nk91c4ANtxveJZxDC9iuhdB/15Yi1HxaoLuzPpJjuProd3qS14um3Itr/r/PMmbs4M
 oi+I9J5nAk/VVDp+/c8qaMOBWVezOZrJjvs1dJxCb7764KI0aT3XST7f4/8saliOPBrj
 p1WbVP0UqcDtEHdCi0rdOmpHlWpRejFvX5UTUbxiEHf3KkcOA7n5jT0Ec2r+FjqDSTHK
 GLng==
X-Gm-Message-State: AOAM531fD/u8GWjk5+qvnjgz5kcV+tx7XNQ3kP7XC6CaYlD3uVkBZ8xk
 RCcrcKCy/kZSD+Z7wqnjczW6YdcRs/adyA==
X-Google-Smtp-Source: ABdhPJzPhwh5c8vY5gZMQmO3pwO5rnVnI5HK6PsN9ar0NcQxYmZtKiGBCR9OcgwjyfdcB2/2UZSRUA==
X-Received: by 2002:adf:f2cd:0:b0:20e:5bf9:8e32 with SMTP id
 d13-20020adff2cd000000b0020e5bf98e32mr46794850wrp.161.1653926849685; 
 Mon, 30 May 2022 09:07:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 024/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpz
Date: Mon, 30 May 2022 17:05:35 +0100
Message-Id: <20220530160708.726466-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Convert SVE translation functions directly using
gen_gvec_ool_arg_zpz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-22-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 189 ++++++++++++-------------------------
 1 file changed, 60 insertions(+), 129 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index be426db6a93..d5a09a60af4 100644
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
2.25.1


