Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF85366F6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:34:36 +0200 (CEST)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuenC-00040g-LI
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYP-0006E7-6F
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYL-0003VK-BN
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y189so4958536pfy.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOFat1B1ryBBllWoHMJ+FJCh+hFLpauEM5Gtx+fR17c=;
 b=PwvjpARZ+RQ6Q/zChfHSxWlyzNro+iaspdBW6loT/qzAT/Xzmv0V+DdzOVliT5v/aI
 i0Z/or45BiXv+l4+JooPifW5uu4EM+vd+JqsGcknHXV/UgEUSyvytHXwdnAq6YJIPOp6
 wwTsuLjXteyGtZGai8AFvPos+JWOF7LWqhKQSbHENcVK+ODZrLMVNQ9xVTwn2OSSvcQV
 Ai/pcaGAh2gelceArWAmPhXJQYLBoUbPljaDR9aSwFHo5K9tjRFKjl7vinzNAIIOGSt0
 YtF1quG5rKfsPg5/R95P9cCUPSd8teOosYzJ8SB3XNrvCtLiYRl2MCGPlmIHEHWjMIyw
 laXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOFat1B1ryBBllWoHMJ+FJCh+hFLpauEM5Gtx+fR17c=;
 b=cT8uMC5dwpYlzxRlXux06SM8IYB+COGN+MqV/5RnMilawHlPYrFsB+Okms29BW7ytv
 x2Y4Tp2GGJIUpwHWPqXmJ4r82wQTZJafyP/2vyDmnprJTh6F0acJwfHLYxBvZiyjgRPV
 4uY1Qc03LTYIddXgQiY/TosVkEbnWnrIIJ6rgdUYFX8dYjvG4yfxugQDDr/zOhQlXeyI
 bD3GwPQ/FJ5AhWbdTHVnQG8MC7jGREifNF84x4sxhDuVu/TUaILzDCjOtdte8TAr2rhQ
 OZhhSDHOCFQjTdZ6HY2vo3oQxh3hpmqG42nNY9DkHYSUR62dspMzk6X6gwJqv8X3/OPY
 b51w==
X-Gm-Message-State: AOAM531ukG3aCIZq3WoYi+Vwo8k5qwoxQeulAWEhgapVgm41eXFIO9/z
 3s2xeMejSooa6xG6tx/luNg9Veqc39nMKg==
X-Google-Smtp-Source: ABdhPJwFVx4Rg03bLJdyiLEHHyy/E4yxrl9qKpP8QkF0DP92ddP/O25TuqEAMy33eah/kphexFhVmA==
X-Received: by 2002:a05:6a00:1502:b0:518:d3bd:c9eb with SMTP id
 q2-20020a056a00150200b00518d3bdc9ebmr18382659pfu.86.1653675552060; 
 Fri, 27 May 2022 11:19:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 003/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
Date: Fri, 27 May 2022 11:17:16 -0700
Message-Id: <20220527181907.189259-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Convert SVE translation functions using gen_gvec_ool_zz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 39 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 903514cb6a..f7e7a569b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1375,16 +1375,12 @@ static bool trans_ADR_u32(DisasContext *s, arg_rrri *a)
  *** SVE Integer Misc - Unpredicated Group
  */
 
-static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        NULL,
-        gen_helper_sve_fexpa_h,
-        gen_helper_sve_fexpa_s,
-        gen_helper_sve_fexpa_d,
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const fexpa_fns[4] = {
+    NULL,                   gen_helper_sve_fexpa_h,
+    gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
+};
+TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
+           fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -2418,14 +2414,11 @@ static bool trans_INSR_r(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        gen_helper_sve_rev_b, gen_helper_sve_rev_h,
-        gen_helper_sve_rev_s, gen_helper_sve_rev_d
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const rev_fns[4] = {
+    gen_helper_sve_rev_b, gen_helper_sve_rev_h,
+    gen_helper_sve_rev_s, gen_helper_sve_rev_d
+};
+TRANS_FEAT(REV_v, aa64_sve, gen_gvec_ool_zz, rev_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -8376,14 +8369,8 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     return true;
 }
 
-static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
-{
-    if (!dc_isar_feature(aa64_sve2_aes, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zz(s, gen_helper_crypto_aesmc,
-                           a->rd, a->rd, a->decrypt);
-}
+TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
 static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
 {
-- 
2.34.1


