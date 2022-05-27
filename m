Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431A536724
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:52:50 +0200 (CEST)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf4r-0002Hi-6k
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYT-0006UP-U9
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:21 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYR-0003Xc-4g
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 129so289650pgc.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BISgCZ5si8nkaQwz0BiOtyVorklPvI5PGitAoXiYROQ=;
 b=lB395XvePLmEZQaY4+sFEz7f2BN0kZNwbEu+kTaptiTXPtICisy5lFtkB4/mztk5ap
 nDrQytIQCJdzoaCgVhLA4e6LV65WCAvt8w7+fdP0CI6f5jrwgzlPXf0UquDDh7i/OU5V
 5jZ4g8x7cZvG7C0tQqwCnBiMJ8mncu7+OBAz6qAA2OoJ61zplWTk9NzC5R9bjgJwkScF
 MrY1NCM+Eg4okHQbAG68L1fY6x2ijWW3UqTASb+apL/AZNi9bmHses1NwV0pUraYUmVg
 tASLnL3DUJxrYdpC+5Kgytq5drts3yPFF3+svUuD2wsvO8d/rfmdTay+F88n5aqg4NTv
 xilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BISgCZ5si8nkaQwz0BiOtyVorklPvI5PGitAoXiYROQ=;
 b=mGS631zk8g0DDxXGKuw/sQuBCXWgyzZpzE/2cGSQNjWjsGbF3a+AA2aGhL2iqv6a/0
 g8g7N67r8r3lHcVvsH/tmTBxBJy5cfe9/wAWKlnYjkrpQffo1U9cPb04+urrlYSr9jtm
 vYIZmssU1EX5yfScqLzDuYf2LfhjT80l0SjbiNRJqIk4vJyz+QEdAO5bH2aX4zvMEpwv
 RcvYaNwIOruyPV+Ch+bAbrpajOJr7SsUQbE6HyDKYV9uc/yMs0hxKOrLM7+28iuzGdve
 I13z4iuXTmtexCekHxxMCZB+ugoia044zJ8vo+N5YVoAbp4cm3p3RFuSXRUunZwTVqGJ
 HTDg==
X-Gm-Message-State: AOAM531B0Q2SommZZpiup7Uq+4yse3QZFmNh/5i95uh+KnHui4XJ6Xq5
 Tuw7+8od7zR1Iu+INDWnhns89n2l/L7Fvg==
X-Google-Smtp-Source: ABdhPJzHO7N8fw4G5xmZ5+hDiCEP/mCgwdvpwA6XQx0iYJJ9SX8lHdvxNI6vmESrCud0WHFVl3VVsg==
X-Received: by 2002:a05:6a00:a85:b0:4e0:57a7:2d5d with SMTP id
 b5-20020a056a000a8500b004e057a72d5dmr45178072pfl.81.1653675557802; 
 Fri, 27 May 2022 11:19:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 009/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
Date: Fri, 27 May 2022 11:17:22 -0700
Message-Id: <20220527181907.189259-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
gen_gvec_ool_zzzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 89 +++++++++++++-------------------------
 1 file changed, 29 insertions(+), 60 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5aaef5b18f..823c1d0ae3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,19 +2417,12 @@ static gen_helper_gvec_3 * const sve_tbl_fns[4] = {
 };
 TRANS_FEAT(TBL, aa64_sve, gen_gvec_ool_arg_zzz, sve_tbl_fns[a->esz], a, 0)
 
-static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
-        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             (a->rn + 1) % 32, a->rm, 0);
-}
+static gen_helper_gvec_4 * const sve2_tbl_fns[4] = {
+    gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+    gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+};
+TRANS_FEAT(TBL_sve2, aa64_sve2, gen_gvec_ool_zzzz, sve2_tbl_fns[a->esz],
+           a->rd, a->rn, (a->rn + 1) % 32, a->rm, 0)
 
 static gen_helper_gvec_3 * const tbx_fns[4] = {
     gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
@@ -3810,15 +3803,12 @@ DO_ZZI(UMIN, umin)
 
 #undef DO_ZZI
 
-static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
-        { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
-    };
-    return gen_gvec_ool_zzzz(s, fns[a->u][a->sz],
-                             a->rd, a->rn, a->rm, a->ra, 0);
-}
+static gen_helper_gvec_4 * const dot_fns[2][2] = {
+    { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
+    { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
+};
+TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
+           dot_fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0)
 
 /*
  * SVE Multiply - Indexed
@@ -8196,46 +8186,25 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
     return do_umlsl_zzzw(s, a, true);
 }
 
-static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
-        gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
-    };
+static gen_helper_gvec_4 * const cmla_fns[] = {
+    gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
+    gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
+};
+TRANS_FEAT(CMLA_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cmla_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const cdot_fns[] = {
+    NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
+};
+TRANS_FEAT(CDOT_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           cdot_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
-
-static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
-        gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                             a->rm, a->ra, a->rot);
-}
+static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
+    gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
+    gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
+};
+TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
+           sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
 static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
 {
-- 
2.34.1


