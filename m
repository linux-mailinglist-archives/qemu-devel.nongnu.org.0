Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B05366EC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:29:01 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueho-0004Bi-82
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYf-0007B4-Rb
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYc-0003cY-VE
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:33 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so4555744pgc.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOAT0W5sv/vx7YTFhV5jbZVOcZvSb23Me4MYt3wvbXw=;
 b=o+iLfHn1sEkA+dYsGq2YzMZ8pwXn9C1s9nMrRxxzQ/z8dmMpTl2HktLLnj9e+IoZgI
 P4dp/T68TsUIFUXDW30Sn1YIxDirOLCBtnfMFBo38l4N7OaEVLBtxG2WtHdjfJiKHJ8P
 o8ZXbKDI5WcjtZu7pucFnwRFNyKxcHRu3mqQM7iSsD+oJyxjJp2l4QlePOikkZayG13d
 gcyyytDa4GtNBhjru5ZXpdmnLa2fp6DQT8Vtlejpa4w3jorHXBpZrwkaXYn5RghUDKEF
 GhxPRBlyZ2Ha718bJE7NML9GcII/pv3M64WV/nRLFk3hAAUU+is3ATR+UCCU9niPudAj
 z0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOAT0W5sv/vx7YTFhV5jbZVOcZvSb23Me4MYt3wvbXw=;
 b=6JighcvCNojWt+eUuYjMeQNLjyp5cPWNOWlz3oOgZuit2Oj4Pl42Ity0HqzbYEQaiZ
 qcOjwMoXO0A+VIcr+AtrMu6fc/ZdFiBpK1HEHzYoa8f9w7lWgAD/laAhlI4ayHXOJW8V
 Z+gmhaMG5jbCxb3wju4/vUD1KXAP0Gh0Hji4ShqRl0x5ykJnFmKDJMJ4ee2+SgvTT2Q8
 0jpdRE4m8oGruQv2Fp1e+jIu8iOOt8JYd44JikyVuptaOU7op+i58Lj8taM50kj20nn6
 EGA+mhZM3CHCOBwzalkuzSsQ5388/flyHBOxRv/sRrfUTbVTJ3q6ELkfWYtfWbnk747L
 OPuQ==
X-Gm-Message-State: AOAM530dsn4Foyj2QM3ycITKsJe4dpf62SFVuducCGOQI8n/K0YJi7jf
 SPNAyUUaAIfQ/X38Y+M5gScYQ0c776vU0w==
X-Google-Smtp-Source: ABdhPJzflB3WSq4lPmSUlylES1/pEpdrOaPN+3APjKY4Ze1ooV0pcsduIpnps6PsGKxAupZRjsFy9A==
X-Received: by 2002:a63:ec56:0:b0:3fa:f7f8:c644 with SMTP id
 r22-20020a63ec56000000b003faf7f8c644mr10299466pgj.52.1653675569536; 
 Fri, 27 May 2022 11:19:29 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 022/114] target/arm: Use TRANS_FEAT for do_sve2_zpz_data
Date: Fri, 27 May 2022 11:17:35 -0700
Message-Id: <20220527181907.189259-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Convert SVE translation functions using do_sve2_zpz_data
to use TRANS_FEAT and gen_gvec_ool_arg_zpz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5a09a60af..fe11cfed6b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6554,48 +6554,23 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
  * SVE2 integer unary operations (predicated)
  */
 
-static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
-                            gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
-}
+TRANS_FEAT(URECPE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_urecpe_s : NULL, a, 0)
 
-static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
-}
+TRANS_FEAT(URSQRTE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_ursqrte_s : NULL, a, 0)
 
-static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
-}
+static gen_helper_gvec_3 * const sqabs_fns[4] = {
+    gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+    gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+};
+TRANS_FEAT(SQABS, aa64_sve2, gen_gvec_ool_arg_zpz, sqabs_fns[a->esz], a, 0)
 
-static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
-        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
-
-static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
-        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const sqneg_fns[4] = {
+    gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+    gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+};
+TRANS_FEAT(SQNEG, aa64_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 
 #define DO_SVE2_ZPZZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
-- 
2.34.1


