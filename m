Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904815366E5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:24:15 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuedC-0004Iq-LY
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-00074D-25
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYa-0003Uk-MB
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id 202so5019713pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHzf7f1Jof2ZrWRypNY/8bOSixU6sqwto2Tj3rN5pqs=;
 b=upQSPe0787JHiFnxrcXRiMU3u1PgH/CCGy5pJZ6QC3M8pv2E/hFoNv6VRFNA3mu84K
 YicDQDkDh8jpI+KQ3kIoXjk9Nz27Ar97iF4C+UrUdJ4RQdhVKmyZUEpACAN6yOxR6zv0
 dHJGoqFf9NMG37DLzgmABMcf3Dglmj8sewDFceE1KPLn3FVRbhjNvK78HH8EtwvnYLQ7
 sZCNM0HCHrsa4H4IS+1DKcLQ+DEph0TUodFeaC5dTHjDaGumfDubBanD62/INDQNw8YR
 0ZW7YJvou/96hWHsQ5RDBzqrlj5+6VHXE1DOgvrdkvEF99MB251CJ2pX8kpZkAq8syJu
 hP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHzf7f1Jof2ZrWRypNY/8bOSixU6sqwto2Tj3rN5pqs=;
 b=B7Dm2FnFtHGvbzmnTc0MXW3bG2St41HeZFHegjHVTOa9eRZw+HfGFJFN1gTlrEq850
 BY8jubO5nPGq25igloSimh0ZBSOaJE1Ht6Gu4sYI5spGYKVxJCIRRodrahDGUOsvqQQ4
 fIg9ROLpkAxupSlDeMFWQLlHDvNHE832ia9gZ/qczuxecdoLhQZeW2B0demylSu2N0JY
 NFp0g9hrY+oJiKrVxsJjUfaNEOjd8iwDL6yRyRorlXwnJ7sIL35gsI+Pu/7jJTqr6mU7
 sXJknIkxE5UipiYcysQ9apNAJDCAq0dP0kcHdfcA8LXneTy4K1KlUeP3/hPEFFG2We2g
 OfLQ==
X-Gm-Message-State: AOAM532Fuz1pwYHjP6VHq74N9xNKU1bFdMHO9RmfF7K/W3nNk352G5ff
 /a5cD+Myi+txRMRPegilKzByjVe4cjOb/g==
X-Google-Smtp-Source: ABdhPJyGSsHdrWT/MNWeQvRL464wZkEopgsIGZYcnovol1S8tvx6SG67pvlYiM9p8i/rW1zsUmslwg==
X-Received: by 2002:a65:57c5:0:b0:3fb:a60e:9b32 with SMTP id
 q5-20020a6557c5000000b003fba60e9b32mr4216724pgr.553.1653675567884; 
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 020/114] target/arm: Introduce gen_gvec_ool_arg_zpz
Date: Fri, 27 May 2022 11:17:33 -0700
Message-Id: <20220527181907.189259-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Use gen_gvec_ool_arg_zpz instead of gen_gvec_ool_zzp
when the arguments come from arg_rpr_esz.
Replaces do_zpz_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e81c2de37f..be426db6a9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -222,6 +222,13 @@ static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zpz(DisasContext *s, gen_helper_gvec_3 *fn,
+                                 arg_rpr_esz *a, int data)
+{
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, data);
+}
+
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -805,11 +812,6 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
 
-static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-}
-
 #define DO_ZPZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
 {                                                                   \
@@ -817,7 +819,7 @@ static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,       \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,       \
     };                                                              \
-    return do_zpz_ool(s, a, fns[a->esz]);                           \
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);              \
 }
 
 DO_ZPZ(CLS, cls)
@@ -836,7 +838,7 @@ static bool trans_FABS(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fabs_s,
         gen_helper_sve_fabs_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
@@ -847,7 +849,7 @@ static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fneg_s,
         gen_helper_sve_fneg_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
@@ -858,7 +860,7 @@ static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxtb_s,
         gen_helper_sve_sxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
@@ -869,7 +871,7 @@ static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxtb_s,
         gen_helper_sve_uxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
@@ -879,7 +881,7 @@ static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxth_s,
         gen_helper_sve_sxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
@@ -889,17 +891,19 @@ static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxth_s,
         gen_helper_sve_uxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_sxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_sxtw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_UXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_uxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_uxtw_d
+                                : NULL, a, 0);
 }
 
 #undef DO_ZPZ
@@ -2659,7 +2663,7 @@ static bool trans_COMPACT(DisasContext *s, arg_rpr_esz *a)
     static gen_helper_gvec_3 * const fns[4] = {
         NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
@@ -3008,7 +3012,7 @@ static bool trans_REVB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revb_s,
         gen_helper_sve_revb_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
@@ -3019,12 +3023,13 @@ static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revh_s,
         gen_helper_sve_revh_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_revw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_revw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
@@ -3035,7 +3040,7 @@ static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_rbit_s,
         gen_helper_sve_rbit_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
@@ -6624,7 +6629,7 @@ static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpz_ool(s, a, fn);
+    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
 }
 
 static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1


