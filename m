Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75096536741
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:57:41 +0200 (CEST)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf9Y-0002BQ-F1
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYc-0006y1-Ew
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYW-0003aJ-L1
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f21so4985746pfa.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVh+ysx/XJ2HaFQarq0ZODircWC5hqhYfLiphUA9Ke8=;
 b=YU6Dnm6ZmQtzn1/IaZZAnESDAJwAexlsi1FiR+bkgMDpUiRytlus8NkIHtzKL5GxXa
 sXKjdwknhi8oWQNq9PfXgb1pG9RlQ2l8c+pE5mTcEuElVOaXG3TN7EIyWUXIYxLp8CN6
 oYYgYdfLQu3FKCHsOZc0L/mJZ01pA86yTvfRB93AB+NCgo0uvS27T8OMapGuY5ubEp2h
 HVksY17Fh6nau3CQoogWMqrtalZLkQhezFEbXunOmVIrbZ68E0BnE6eixvL5cL+rBQPR
 bcd0DnwCkUEGT7pQ21LNUSaCo7m/EcoKTZmKD2M2hWdp8ci/hUS8dZGQr8ufpqi0OW0D
 LVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVh+ysx/XJ2HaFQarq0ZODircWC5hqhYfLiphUA9Ke8=;
 b=Vb8SuB4YhsccmLcJpqLUEeKdqO6Ka0bloyJeBAOUdFK6MB1OPVIh2lQLzSWSda1+M8
 0xt0atMHfazTHjHclTAftWRBlb9Z6PrmXk3v+Lxgs9xUw+H6hHnonj8VWxyeYZAeaD3C
 6A8CZ69x94YOafSfOXT09ESMZeenen4aC6DH91lyXD5jzcc7i0Pb5qw/vG3PbIDWE8Ha
 +fNe+paPLr1aHp8Np3ureWv7QNoQjDxsjcUO7SH5b2/aNh+vK9o1vy7bAR3ugBf7K4Jf
 QXvjWg1Ra3C9uaWVy6AvOxm+DXoeobryeKBPl5Gr3suuKkTQcBS90K4By3FRiBYSI/3e
 KKqw==
X-Gm-Message-State: AOAM531KiJC+jeNzk8iLPsO5rVgOhx9bD9AdgtmbifnYoOPCgZWr2M9P
 Xk/n3W/hNqMcNtkY7Z6c+y5gF4Pg0pH+Qw==
X-Google-Smtp-Source: ABdhPJyRvAHrXFG7baftGZUMC97YDIIWYhg0ss+b+qdlBfZzdfbar7r/8B8sO0Cgeqn8G/JB1PJCWw==
X-Received: by 2002:a63:314b:0:b0:3f5:dc43:3b81 with SMTP id
 x72-20020a63314b000000b003f5dc433b81mr38180148pgx.456.1653675563234; 
 Fri, 27 May 2022 11:19:23 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 015/114] target/arm: Use TRANS_FEAT for do_sve2_zzz_data
Date: Fri, 27 May 2022 11:17:28 -0700
Message-Id: <20220527181907.189259-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Convert SVE translation functions using do_sve2_zzz_data
to use TRANS_FEAT and gen_gvec_ool_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 69 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b097b44d9f..ac76705da6 100644
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
2.34.1


