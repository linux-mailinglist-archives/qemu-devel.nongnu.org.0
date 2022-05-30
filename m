Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99451538646
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:43:10 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviU1-0003Wa-Lu
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0002rc-OG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvS-0007EH-9k
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k19so7097190wrd.8
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TVDQ6Or7QME3qE3tFHK0K8uOi4Oc5sDV6LTBguhqk5c=;
 b=AZeppfagrCkLPMfzldEWr//8Gflo8iWSIA0os7PqJT2z6glfPTvpQ2Qk9Th1jTDegk
 TrTXmK5r+wAfGGtGeI2CCCZv4YhcZBvDOw9mf5ugkNhm0iDWtjgRx6kmiuqZv+jyHurS
 o0fjt0JjC2N3dicULx7YAVQJ0M3mdjyHwZSvGpahERS5wc2w1UPM7iS7XGPE4eV0BOym
 cEeqQ6e6pdqRh43e00zd/Chjgh2NSgb1gGcE339Ym3oWL3izT3t007qxzashEl1yhNwG
 dza2R0ok/E2Fc35Syg/R9knEt/yV9FMvzh7YSJz2u+By00GcEIeDOFbtq58PW7T1toB5
 uh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVDQ6Or7QME3qE3tFHK0K8uOi4Oc5sDV6LTBguhqk5c=;
 b=4HPSdANxVr5EyeCV7/7O9Ne7g25AfaupEtuHJuEC2f4E7xwjtQ7JMZVQnWiwLRrDQZ
 GktibS92r6oNzHIPOMzXcJr35UM4IHTcoTYoqRBl46AgZNhD9AjlFi7WdAkBk+nNogXD
 mC9es+MJRYOzbAnBLm7waQSEOTuIyH4XK7XOCXwOarF3ga/OsAO3Fw2ovWct8NPO/FDa
 D324BBiwxtFxBXLCgTpMEh9kKxsH1ZQF6UEBRMqqTilVHAdykqIZOFExtl7t8mKDtBzG
 AXZMo3zxBDXMXlrm+mOsZpUqhgpDeziz+Ojdfs+T3R1yJRtqet01L9SUSfVCVCWWPHkU
 STRg==
X-Gm-Message-State: AOAM532dys4W8mhus1W4B2GecYwWiX1Fh2nqMPiS48IIy3gLbXzCNyj6
 bFqrE1g0awfsxThGzoKtFOBd3bfMlQvCSg==
X-Google-Smtp-Source: ABdhPJy1jWUk9/FuQqwADvQA0ndNoG4l3HcAjUm8ULAridc/CmlwFgHrm3h4E0NbsUjyzVUoFtZxbQ==
X-Received: by 2002:a5d:6847:0:b0:20f:c0b6:d783 with SMTP id
 o7-20020a5d6847000000b0020fc0b6d783mr40462102wrw.101.1653926844872; 
 Mon, 30 May 2022 09:07:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 018/117] target/arm: Use TRANS_FEAT for do_sve2_zzz_data
Date: Mon, 30 May 2022 17:05:29 +0100
Message-Id: <20220530160708.726466-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Convert SVE translation functions using do_sve2_zzz_data
to use TRANS_FEAT and gen_gvec_ool_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-16-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 69 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b097b44d9f9..ac76705da69 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3840,61 +3840,42 @@ TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
 TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_usdot_idx_b, a)
 
-static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
-                             gen_helper_gvec_3 *fn)
-{
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           vec_full_reg_offset(s, rm),
-                           vsz, vsz, data, fn);
-    }
-    return true;
-}
-
 #define DO_SVE2_RRX(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
-    { return do_sve2_zzz_data(s, a->rd, a->rn, a->rm, a->index, FUNC); }
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+               a->rd, a->rn, a->rm, a->index)
 
-DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
-DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
-DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+DO_SVE2_RRX(MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
-DO_SVE2_RRX(trans_SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
-DO_SVE2_RRX(trans_SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
-DO_SVE2_RRX(trans_SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
+DO_SVE2_RRX(SQDMULH_zzx_h, gen_helper_sve2_sqdmulh_idx_h)
+DO_SVE2_RRX(SQDMULH_zzx_s, gen_helper_sve2_sqdmulh_idx_s)
+DO_SVE2_RRX(SQDMULH_zzx_d, gen_helper_sve2_sqdmulh_idx_d)
 
-DO_SVE2_RRX(trans_SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
-DO_SVE2_RRX(trans_SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
-DO_SVE2_RRX(trans_SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
+DO_SVE2_RRX(SQRDMULH_zzx_h, gen_helper_sve2_sqrdmulh_idx_h)
+DO_SVE2_RRX(SQRDMULH_zzx_s, gen_helper_sve2_sqrdmulh_idx_s)
+DO_SVE2_RRX(SQRDMULH_zzx_d, gen_helper_sve2_sqrdmulh_idx_d)
 
 #undef DO_SVE2_RRX
 
 #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
-    static bool NAME(DisasContext *s, arg_rrx_esz *a)           \
-    {                                                           \
-        return do_sve2_zzz_data(s, a->rd, a->rn, a->rm,         \
-                                (a->index << 1) | TOP, FUNC);   \
-    }
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
+               a->rd, a->rn, a->rm, (a->index << 1) | TOP)
 
-DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
-DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
-DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
-DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
+DO_SVE2_RRX_TB(SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
+DO_SVE2_RRX_TB(SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
+DO_SVE2_RRX_TB(SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
+DO_SVE2_RRX_TB(SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
 
-DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
-DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
-DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
-DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+DO_SVE2_RRX_TB(SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
 
-DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
-DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
-DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
-DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+DO_SVE2_RRX_TB(UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
 #undef DO_SVE2_RRX_TB
 
-- 
2.25.1


