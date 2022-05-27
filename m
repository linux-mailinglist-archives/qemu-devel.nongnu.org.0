Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA42536710
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:45:01 +0200 (CEST)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuexI-0007uX-69
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYS-0006Pq-OX
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:20 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYQ-0003Wi-0s
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:20 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so4969647pfh.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sa4c1z3lV/9O9QNNkKmSfjVo0j0yLNVxaFKY7v1KjVM=;
 b=pFNUf8/aK4q4Cl6A4yXfFUAM20U8TU4xHbX+vXOVA9SHHgeYVAAzA6x39CJMENYLt9
 6feCxMxFgfAMv+J+haM5jefxnfSr9aFf7VbzVLDy3FZmZASfd2BGKvHYopOYF2P3lOpj
 JpLvuqHFHKq1LtVLur80yyC9a4Uj2Jc4I5CMgxlNeGD3hyGRkubl4/PecqqBWQ9lVy4w
 0oS1QDvU4Ss9CALa1yotrMyp4pndRt0ChDCfOjMIlUXHX4RUGrGmTa2bBiXSk5pMBanV
 bUDlup94xH5gKaCCFgt6Jc49apxtqo2tnayxadEkBhBVwlt4dzFhjwU9bEWoQ2awjJzr
 +8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sa4c1z3lV/9O9QNNkKmSfjVo0j0yLNVxaFKY7v1KjVM=;
 b=p+qxQheGbWN5VfDgfDRy5HSb8PtGCVaRLND51UEe4Yfr5gunAQJT/EewCdgJedOT8E
 wpTvLuaRk+ItVXBcyiHoFnKEG4RKBsOeqjU2HvS3YHvWDSyZis2RjCJEt3ZKe9H6FIiC
 tghqzPhiL6xsf/NwQvvhBGYb4H5PlfUZhdpLls3UPOWnzjyVLHTxx1uQu+JY/W7HMWut
 vh9UZmT26EtN8yhhU6j0KsjaBS9naHYpdY03gJ9jbO6ojgtBWGoVpmoeSuJu2LDn4CpF
 2ayl7OPPwT40R5tEW7ALcovH6+Kv1XhlXEvnvvCSsjdNbgTjxPajOlE3tLTtVGOgInDZ
 xi+g==
X-Gm-Message-State: AOAM533BpdfXX2jMzwvH7zmZpkCxlueQGJ++6SVZNfP62wmdW05QpXnh
 ytOSciWjiTK+3UoEUK+fngxxDZ4/WShi8Q==
X-Google-Smtp-Source: ABdhPJxmiMikt43JUu/jIbjh6aav1KIukYAN18aQanQQgIO9vCI1UwSuAoSMqRpNqBE/Bo4JyLcrRQ==
X-Received: by 2002:a63:4723:0:b0:3fa:c20d:2e26 with SMTP id
 u35-20020a634723000000b003fac20d2e26mr15007946pga.278.1653675555632; 
 Fri, 27 May 2022 11:19:15 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 007/114] target/arm: Use TRANS_FEAT for do_sve2_zzz_ool
Date: Fri, 27 May 2022 11:17:20 -0700
Message-Id: <20220527181907.189259-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Convert SVE translation functions using do_sve2_zzz_ool
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 88 ++++++++++++++------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c89c25166c..6ec996e7f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6617,55 +6617,36 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
-                            gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
-}
+static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
+    gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
+    gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
+};
+TRANS_FEAT(SMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           smulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
-        gen_helper_gvec_smulh_s, gen_helper_gvec_smulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const umulh_zzz_fns[4] = {
+    gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
+    gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
+};
+TRANS_FEAT(UMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           umulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_UMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_gvec_umulh_b, gen_helper_gvec_umulh_h,
-        gen_helper_gvec_umulh_s, gen_helper_gvec_umulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+TRANS_FEAT(PMUL_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           gen_helper_gvec_pmul_b, a, 0)
 
-static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
-}
+static gen_helper_gvec_3 * const sqdmulh_zzz_fns[4] = {
+    gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+    gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+};
+TRANS_FEAT(SQDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqdmulh_zzz_fns[a->esz], a, 0)
 
-static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
-        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
-
-static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
-        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
-    };
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const sqrdmulh_zzz_fns[4] = {
+    gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+    gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+};
+TRANS_FEAT(SQRDMULH_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqrdmulh_zzz_fns[a->esz], a, 0)
 
 /*
  * SVE2 Integer - Predicated
@@ -7964,14 +7945,12 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
 }
 
 #define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
-{                                                                         \
-    static gen_helper_gvec_3 * const fns[4] = {                           \
+    static gen_helper_gvec_3 * const name##_fns[4] = {                    \
         NULL,                       gen_helper_sve2_##name##_h,           \
         gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
     };                                                                    \
-    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
-}
+    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_arg_zzz,                     \
+               name##_fns[a->esz], a, 0)
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
@@ -8016,13 +7995,8 @@ static bool trans_HISTCNT(DisasContext *s, arg_rprr_esz *a)
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 2]);
 }
 
-static bool trans_HISTSEG(DisasContext *s, arg_rrr_esz *a)
-{
-    if (a->esz != 0) {
-        return false;
-    }
-    return do_sve2_zzz_ool(s, a, gen_helper_sve2_histseg);
-}
+TRANS_FEAT(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
+           a->esz == 0 ? gen_helper_sve2_histseg : NULL, a, 0)
 
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
-- 
2.34.1


