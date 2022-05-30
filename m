Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5C353864E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:48:34 +0200 (CEST)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviZF-0001Iw-6i
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvg-0003K9-S5
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhve-0007H9-7Q
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h5so7196950wrb.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BCieSjS8+a/J7cWka53sN9O7+JxVvA/2MoUQVCW5Hmk=;
 b=Hzkjj20GkvBgjmrseff1arTr5jUjBcMv/JUZMIPPuCMR5VTuoqd49lAvOe9X9xKPno
 4ruADi0Si+CrqoptZ5X4F62OEjbS+mPNdROPe4ccFmVQfwSh1Uc8MCaAkfZNd5NENz4V
 rGKSiEyBbWtFV4lPWc3e2B4672tjPPalcfLPB6EQ1pHYm0TIN/5U9IlbwM7jphm6ppDo
 hPOU2YtWzwigiyN/p6IS3SdOiIyiAGNOnhvcswc13TGIbVJhOVtlfWM99wkgitOMxxNx
 A8/sePjpVEKD8KN9Ze93ewqEKCyxJuCANR7BZ9HX07UVjHyps14+yYE7RvBecG28y+9k
 LGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCieSjS8+a/J7cWka53sN9O7+JxVvA/2MoUQVCW5Hmk=;
 b=teyw18GjxVG69v9lDjW+PJkEWP5Lf3Iy16UMNf9KAjIRKGIFtSPlmdJKQ7GIrYPeq6
 X+WLt5wvV5CtrDi7oeuhs0dnO80acwZayNJZkWJUrCAPwz+weqM6F4qe4OCZDNnU25Kt
 NRnG9iHsCTMzzbDv4BZQXx2YP27zU1ndmYDsuYj7s1X3A9PJkjfysZ7VqNhTaTQ4GOim
 AU7/GYuu1dp/PgrpYFB4JzY1LzCyljHe6YkT/MJyf5Hur3xzna5n/u3iWCbbmY/1x5e/
 28ZF6sJQqlQW5HtPU11kLafSaiVhpVHbOOCZz5/W4RLGQBChXIWxopSq3Vk6ElhoWEyX
 3VCA==
X-Gm-Message-State: AOAM532lUeGgxfiHG2I9iMOP7GzPh3zMVaecSWHytCRhGyeRnPspGTl/
 V2f59hA46uS8k5VYMrkgJE+uODOpamoDQg==
X-Google-Smtp-Source: ABdhPJzCPx+UuWSvjflxu2D/p4FXuSOCEmEq/G3zzEbOvcvMqHJY2v2n+TrOZ1oNxUodZONSfYIeLg==
X-Received: by 2002:a5d:6487:0:b0:210:11c5:b10e with SMTP id
 o7-20020a5d6487000000b0021011c5b10emr17231552wri.657.1653926856761; 
 Mon, 30 May 2022 09:07:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 033/117] target/arm: Move null function and sve check into
 gen_gvec_fn_zzz
Date: Mon, 30 May 2022 17:05:44 +0100
Message-Id: <20220530160708.726466-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-id: 20220527181907.189259-31-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5ab9de46a71..3af4626e58a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -259,13 +259,19 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
 }
 
 /* Invoke a vector expander on three Zregs.  */
-static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
+static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn),
-            vec_full_reg_offset(s, rm), vsz, vsz);
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn),
+                vec_full_reg_offset(s, rm), vsz, vsz);
+    }
+    return true;
 }
 
 /* Invoke a vector expander on four Zregs.  */
@@ -366,10 +372,7 @@ const uint64_t pred_esz_masks[4] = {
 
 static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
 }
 
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -6421,10 +6424,7 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
 }
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
@@ -6945,10 +6945,7 @@ static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
 }
 
 static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
@@ -7880,10 +7877,7 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2_sha3, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
 }
 
 static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
-- 
2.25.1


