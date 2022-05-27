Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E652536725
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:54:31 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf6U-0004g7-Fv
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYa-0006p1-0r
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYX-0003ah-LO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:27 -0400
Received: by mail-pl1-x636.google.com with SMTP id m1so4811994plx.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MswYk1Z7xVoGi1wpBMVzNhC43L1YQ2MydliGMB/AnKI=;
 b=HAZtJl7cSjhJJrnpaf7RUQd2JQ42e1sxC99DlBurJJFvSXBhvdfAiElOjzXrSFPD2z
 3NPUf23GoDRhhoEOtK9ZQAIewsclHIO4y8zcpgdIGuyV0Vlhe6HtK8a9rCn3VuoDelE4
 pK8clfUVMauGhbINq6xe2WOOpEV1NeEZqDo/+ViaMgOtDo0T99Y20J7i/x45p6wqzczf
 eM1AD8Kz7HwkqhBbZPEAKKyEOtBxuGTbA4ywkb4BmdcsVXWF0tnNtE/K3KXa7BQauMFy
 uywxsKUXBbbU7LQev0OrUQsBf3sWK8LPsczTQX2lq7wuKIrMlUizxGUjUcGs//Yg/TgD
 6VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MswYk1Z7xVoGi1wpBMVzNhC43L1YQ2MydliGMB/AnKI=;
 b=lTKKCroOLfnsfnCtc+sLGmRgzOHVkC9GcN59kMcPNg/uwJIpHykryqNgM0rW1sv3Fl
 seAV7ws6ivCQ4GrE2KlahUQgytcXAiumJfKk3A/mQaDhxTtlNJW5IGZC90BbKJFyvfZr
 VdSvMfYV80pIqrO8DUgmT3UPljk7MEgCQghZWuQ0TRz4fbFNele/v1SXCk8J/FWKBHVy
 XI/89iFRn+9Z4QxIzwH60ZeI55s45DJf5su/XFb05xuEWBTBsql7/lElNPQ/mYsRL6cM
 Tj+YqC7qYbSExiG5PGLdObVfJvX70Zol/FuAktDuniPNDA5n+1uW9AxPkFJpNAS3Gcca
 tF9Q==
X-Gm-Message-State: AOAM532mUN33fu+JyVPqUl8woGnSD7M/+zPAc9YqLMk+LoFvIUu8wMMX
 iUxvolxbRlqcx12ckohcZVSxIdS56YEzUA==
X-Google-Smtp-Source: ABdhPJxXIW+L92jv9Ga0urmQYQvCVQrLmxFSvXp71JEe9Uc84O8L0wRwQqsx7J3G6vl+D0OkGAtoog==
X-Received: by 2002:a17:90b:17c4:b0:1df:a60b:1e28 with SMTP id
 me4-20020a17090b17c400b001dfa60b1e28mr9586705pjb.31.1653675564216; 
 Fri, 27 May 2022 11:19:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 016/114] target/arm: Use TRANS_FEAT for do_sve2_zzzz_data
Date: Fri, 27 May 2022 11:17:29 -0700
Message-Id: <20220527181907.189259-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Convert SVE translation functions using do_sve2_zzzz_data
to use TRANS_FEAT and gen_gvec_ool_{zzzz,zzxz}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 106 ++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 65 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ac76705da6..c345399ace 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3879,90 +3879,66 @@ DO_SVE2_RRX_TB(UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
 
 #undef DO_SVE2_RRX_TB
 
-static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
-                              int data, gen_helper_gvec_4 *fn)
-{
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           vec_full_reg_offset(s, rm),
-                           vec_full_reg_offset(s, ra),
-                           vsz, vsz, data, fn);
-    }
-    return true;
-}
-
 #define DO_SVE2_RRXR(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra, a->index, FUNC); }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_arg_zzxz, FUNC, a)
 
-DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
-DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
-DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+DO_SVE2_RRXR(MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
 
-DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
-DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
-DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+DO_SVE2_RRXR(MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
 
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
-DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
+DO_SVE2_RRXR(SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
 
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
-DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
+DO_SVE2_RRXR(SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 
 #undef DO_SVE2_RRXR
 
 #define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)          \
-    {                                                           \
-        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->rd, \
-                                 (a->index << 1) | TOP, FUNC);  \
-    }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzzz, FUNC,        \
+               a->rd, a->rn, a->rm, a->ra, (a->index << 1) | TOP)
 
-DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
+DO_SVE2_RRXR_TB(SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
+DO_SVE2_RRXR_TB(SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
+DO_SVE2_RRXR_TB(SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
+DO_SVE2_RRXR_TB(SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
+DO_SVE2_RRXR_TB(SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
+DO_SVE2_RRXR_TB(SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
+DO_SVE2_RRXR_TB(SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
+DO_SVE2_RRXR_TB(SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
+DO_SVE2_RRXR_TB(SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
+DO_SVE2_RRXR_TB(SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
+DO_SVE2_RRXR_TB(SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
+DO_SVE2_RRXR_TB(SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
-DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
-DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
-DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
+DO_SVE2_RRXR_TB(UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
+DO_SVE2_RRXR_TB(UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
+DO_SVE2_RRXR_TB(UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
+DO_SVE2_RRXR_TB(UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
+DO_SVE2_RRXR_TB(SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
+DO_SVE2_RRXR_TB(SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
+DO_SVE2_RRXR_TB(SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
+DO_SVE2_RRXR_TB(SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
 
-DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
-DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
-DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
-DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
+DO_SVE2_RRXR_TB(UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
+DO_SVE2_RRXR_TB(UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
+DO_SVE2_RRXR_TB(UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
+DO_SVE2_RRXR_TB(UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
 
 #undef DO_SVE2_RRXR_TB
 
 #define DO_SVE2_RRXR_ROT(NAME, FUNC) \
-    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)       \
-    {                                                              \
-        return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra,    \
-                                 (a->index << 2) | a->rot, FUNC);  \
-    }
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzzz, FUNC,           \
+               a->rd, a->rn, a->rm, a->ra, (a->index << 2) | a->rot)
 
 DO_SVE2_RRXR_ROT(CMLA_zzxz_h, gen_helper_sve2_cmla_idx_h)
 DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
-- 
2.34.1


