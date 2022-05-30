Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5400A53861C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:27:46 +0200 (CEST)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviF7-0004mV-ES
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvP-0002hX-6g
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvM-0007BT-OT
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 129-20020a1c0287000000b003974edd7c56so5306756wmc.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+av7Nfa96shW5223AokMt8Y0sDU9JlT7w2ffhuy9fI8=;
 b=q8Zen59gph0Zzk/+t92brDvop774TFMFUlcnNMtnIsx66kozf2jNe7T5YoQyBEqGqn
 RJsCEpUTdccGnURT3Wr3jUoN1KK9wwBHuNqvgpxIcgpZQF/LZgsim/+luvfVV+Do2VKL
 jkIP3O3fCM+2xt7NV/4y9bPWcrPP7fsgZA+wC5bNUy2fP8AgGpXZl1nk2FJ9cC0S1MWg
 imVGAX8dSOphkcqcgcZlS5GJ52DtF9K/5lEkbThBMOydjhbBS9pz1UdGPVBhvNWX29KY
 dIq1mZVM/eAQswB9DPPrR/QphhLMHa/gvD5GgD14Q0VSJ+FZD4pnMDosXrs4wSsipjlW
 LLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+av7Nfa96shW5223AokMt8Y0sDU9JlT7w2ffhuy9fI8=;
 b=CNmXHv1tjCYaCevYnqd287g01+XXtftFAYeEp5q2bqsznX9YBEMVWDQPR/30ylyRKJ
 8cvvbvKRSWOdZ4LhUANfx4cNaGJleyFp66TUjZVE8gNA7j0v13autlqjEfjs3jEn8UlG
 gvJcNwxOVdrhWnMk6H5sIGqHahiinmRTudGXgK5InLdXq6uzKhgpkizg/cEZh6Ljg8wx
 lBjBVZzJ2QuWbmzj99nQDKgLXnK8JTrM1Ov+cU5cdMuTKIGsT0Z0350zmGRlMFBtBvru
 6Hd2n++U23lmXX3aNT2V8uUl9yGasxojywdxhjkfeU3sver8Y0r2bBr7/2zRGLze3lnU
 Hzcw==
X-Gm-Message-State: AOAM532dz/eQNT8y9HP0tEVJ2FCinIlY1SSVBqDOc1jqpHrHHf1i7hh5
 +DU6xVEIvc6igS73BtbHnRUQdRs3vTQQcQ==
X-Google-Smtp-Source: ABdhPJyZyP6srtnpD4mwnWlYE00TA2Q8IWDaIwR/XxuI2tIwkqvtRbQvHA9B3XpLfLsUAGC206HqcA==
X-Received: by 2002:a7b:c00a:0:b0:397:475b:1ad7 with SMTP id
 c10-20020a7bc00a000000b00397475b1ad7mr20025824wmb.42.1653926839235; 
 Mon, 30 May 2022 09:07:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 011/117] target/arm: Move null function and sve check into
 gen_gvec_ool_zzzz
Date: Mon, 30 May 2022 17:05:22 +0100
Message-Id: <20220530160708.726466-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-9-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 102 ++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 64 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6ec996e7f2c..5aaef5b18f6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -176,15 +176,21 @@ static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
 }
 
 /* Invoke an out-of-line helper on 4 Zregs. */
-static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+static bool gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       vec_full_reg_offset(s, ra),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
@@ -2421,11 +2427,8 @@ static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
-                          (a->rn + 1) % 32, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             (a->rn + 1) % 32, a->rm, 0);
 }
 
 static gen_helper_gvec_3 * const tbx_fns[4] = {
@@ -3813,11 +3816,8 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
         { gen_helper_gvec_sdot_b, gen_helper_gvec_sdot_h },
         { gen_helper_gvec_udot_b, gen_helper_gvec_udot_h }
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->u][a->sz],
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 /*
@@ -3827,13 +3827,7 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
 #define DO_RRXR(NAME, FUNC) \
@@ -7122,13 +7116,10 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
                              gen_helper_gvec_4 *fn, int data)
 {
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
 static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
@@ -8215,24 +8206,21 @@ static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_CDOT_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
 {
-    if (!dc_isar_feature(aa64_sve2, s) || a->esz < MO_32) {
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL, NULL, gen_helper_sve2_cdot_zzzz_s, gen_helper_sve2_cdot_zzzz_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_helper_gvec_4 *fn = (a->esz == MO_32
-                                 ? gen_helper_sve2_cdot_zzzz_s
-                                 : gen_helper_sve2_cdot_zzzz_d);
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
@@ -8245,10 +8233,8 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                             a->rm, a->ra, a->rot);
 }
 
 static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
@@ -8452,10 +8438,7 @@ static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
     if (!dc_isar_feature(aa64_sve_i8mm, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
 }
 
 static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
@@ -8478,11 +8461,8 @@ static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
-                          a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
@@ -8490,11 +8470,8 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
-                          a->rd, a->rn, a->rm, a->ra, a->index);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
+                             a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
 static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
@@ -8502,11 +8479,8 @@ static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
     if (!dc_isar_feature(aa64_sve_bf16, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
-                          a->rd, a->rn, a->rm, a->ra, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfmmla,
+                             a->rd, a->rn, a->rm, a->ra, 0);
 }
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-- 
2.25.1


