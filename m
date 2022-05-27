Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EE5366E9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:28:30 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuehJ-0003Vj-UL
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYT-0006S4-B5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:21 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYR-0003XA-1q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id c14so4992741pfn.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjiBcNkbgiDPbsJwQ/GjdDeJI1JzDFSHbGcvlgr0qS0=;
 b=zt76yIUlaBHi5K5h2EdcuWDvqzEvtPIHOr6UozJfEfUJWHxOc0eAhX+8WgSa234jFR
 wdRYIz8Vp+SsB9HfpOPp0NnAF3XsJ06tplFF3Wh+SEkyUtsNnmJn3xnaGrMVKKm3r/vb
 YWKe2PM7XzkWxsleYAsLa+54mIqhl1F4B1Wenvwx6lPArXE5foLwWSseLEtw7TSVnNnx
 8wEJhUEfNN6NvCidF6eHryY4PEg59lmZVo22h8cWKE3xVEjD543HhINQAmcWXXvll4Vd
 s3SmQ03CXMfY6TKil8Wl6v3l+GwiC8GHczkp4zFrxlrd3r1VW+cIFEngFthamRTnvGy4
 423g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LjiBcNkbgiDPbsJwQ/GjdDeJI1JzDFSHbGcvlgr0qS0=;
 b=Bx5WKZp7XfwZbway5f/td/LoEhfaeU5eVN0d15jkY4zPjQKa8SB3FJt0pf3mF0mcq2
 DaIi0GtmtdWoD+q5htDqlo0gNzZW6AOoda2C3JT9Gd5L/LVqCJzAi7MkNKEYS2vxNt8I
 gpRao3guLCyjX5rgQjrN9tqik2LpZ0gSBVqKTcLlMNgOMPlg/xNroQ6fye4hduOEJ9b4
 i0XvI4pKCroHJCEKjhhsKe8iFVX42YUY4e5JVayGUWS4UCnsovSqS52iUuXn1ydLy1PK
 rFa18nOh4AesQPD+cyfp6mjgwZHgkhewr3ojs9SIxK+56bFpZKwqxS90NpCNzyOqxTfu
 URGg==
X-Gm-Message-State: AOAM532OPCPswuv+M4Q7s9+TVVH57ODJwxKDnLl15fxoLcPgqcHH9Ej8
 NI932w/g4eWtBCoUfkj1W43+awtHdzGhog==
X-Google-Smtp-Source: ABdhPJxvmW4VjbNDH+ky2x/ngQbM9gvE43Wb7hx1Ef5hMTVXi5ar85FBPm8EOfETH9140VmzrM+u5Q==
X-Received: by 2002:a05:6a00:724:b0:4fa:a35f:8e0f with SMTP id
 4-20020a056a00072400b004faa35f8e0fmr44796945pfm.25.1653675556657; 
 Fri, 27 May 2022 11:19:16 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 008/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzzz
Date: Fri, 27 May 2022 11:17:21 -0700
Message-Id: <20220527181907.189259-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 102 ++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 64 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6ec996e7f2..5aaef5b18f 100644
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
2.34.1


