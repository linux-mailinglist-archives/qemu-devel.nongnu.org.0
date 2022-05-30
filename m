Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F002B5386C8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:33:06 +0200 (CEST)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjGL-0002kD-Po
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0003r9-Em
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwC-0007MM-9k
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so15272110wrg.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Eb1liHNMAWKwhqUeBid/UlGEz6S97F/+Fydx9EWhKYI=;
 b=kUU2O71QXH3mhvWa1KUr6cz4zQKIzY+gVXOE2o70+yQNWzCkvlAw0DxbVhPntHQktD
 KJqYfqH9u85mIot4fw0xNH26dqLqxQPxBAnUyBG5tViGbAXHOd3hzAdsZEit7v38x6Fr
 cAWcbP320EDg6a3VaHo86aJAxlN6EV+Tgta6jKmD168asEOzd8UshhxB/7dPLBHaK4I3
 xncFPc1YVsasnZ8EoUF5ro3ULZFD+lSc1uEx+cdvJA1+NBs0v5CkcCnS37md1oCZ5IRB
 ZoloZDatz7TUzhoqiqFyn7igbxAQotimGYii6Yjqnw5fTws3rGLbIXGLo4cAZLOJPeUk
 kYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eb1liHNMAWKwhqUeBid/UlGEz6S97F/+Fydx9EWhKYI=;
 b=jajR7anAhWB8J7tbZF/DxujSwAYbZJx9TbhBz6PtfbhTnN2idfuzRAXAtrYxG1k1n0
 wuzBA1T0aJ7SP1NBlMzk+yX27aKEnHv5okmr70wen20iOWisk5iK5VLgPEkImJfsVbMW
 2sHYRZpzV3Jp0QZUAGPH9C0RGaJHjKpRVzkREZzRF9BntKG4xRV9ovYfvgiS9FM+voCR
 GHnV4H+QLGcTY78OrswVDd6PIyKYBG85WjNkaPBhNRExEUNCbCPEd79pagZvko4IfbJR
 1e+fXRMF+ovAStLENxC1eb5j0+2HPLG0GWgE5Qk6jMWl2AcVNPoFdKCem7Jb3AWsLvlG
 TGSA==
X-Gm-Message-State: AOAM530CNSfqq8lV8ZCDZIgQu1XWXr+DyiASZBxAcTj83R0S+MBJvUg4
 R8CZScOmSjC6IkGWa6mxF/Cs+w3vEthjQA==
X-Google-Smtp-Source: ABdhPJxg80Yd5DmXY4Mrc5dvLCm3LL9U3eizDxoHmmg8BozyAzRaebqcnVJN26d74i2LGUglJuD4Bw==
X-Received: by 2002:a5d:5847:0:b0:20f:dc2d:d6c8 with SMTP id
 i7-20020a5d5847000000b0020fdc2dd6c8mr32475893wrf.644.1653926890250; 
 Mon, 30 May 2022 09:08:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 062/117] target/arm: Use TRANS_FEAT for do_zip, do_zip_q
Date: Mon, 30 May 2022 17:06:13 +0100
Message-Id: <20220530160708.726466-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Convert SVE translation functions using do_zip*
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-60-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 54 +++++++++-----------------------------
 1 file changed, 13 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75c52d8ce1e..7c9deb267fa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2287,48 +2287,20 @@ TRANS_FEAT(PUNPKHI, aa64_sve, do_perm_pred2, a, 1, gen_helper_sve_punpk_p)
  *** SVE Permute - Interleaving Group
  */
 
-static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_zip_b, gen_helper_sve_zip_h,
-        gen_helper_sve_zip_s, gen_helper_sve_zip_d,
-    };
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? vsz / 2 : 0;
+static gen_helper_gvec_3 * const zip_fns[4] = {
+    gen_helper_sve_zip_b, gen_helper_sve_zip_h,
+    gen_helper_sve_zip_s, gen_helper_sve_zip_d,
+};
+TRANS_FEAT(ZIP1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, 0)
+TRANS_FEAT(ZIP2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           zip_fns[a->esz], a, vec_full_reg_size(s) / 2)
 
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, high_ofs);
-}
-
-static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, false);
-}
-
-static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip(s, a, true);
-}
-
-static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
-
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_zip_q, a, high_ofs);
-}
-
-static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, false);
-}
-
-static bool trans_ZIP2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_zip_q(s, a, true);
-}
+TRANS_FEAT(ZIP1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a, 0)
+TRANS_FEAT(ZIP2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_zip_q, a,
+           QEMU_ALIGN_DOWN(vec_full_reg_size(s), 32) / 2)
 
 static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
-- 
2.25.1


