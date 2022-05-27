Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF7536806
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:25:43 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugWk-0002z4-Om
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefs-0002GA-Bk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:01 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefn-0005S0-B8
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id f4so4574921pgf.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iRB9zqiBDmIMwvdpN9Oxo+M+PjL4KnG73fH2hb110Y=;
 b=sVa/c8i++obrINc4MexX+XftzaOWD9/JxJYOBVg2HXgZdDa1SCtysMWlTD35uFQskG
 awXM6gOuiZmFPWzn/DC6ivlG1gffW6MJ5L+5DRHfy+7NakY5mptt5VYvQgniRHdJQ1VR
 NP+IdRjQ25q4Yl3h2E59zDMD5E264F6KyMFiIg81onX07NSXd36qswbaCIM/ksFmM4fF
 VJ3lh1cDoPWKiiiPAVv/wMK9MPVod/arPFWD3f4nk3nwU8caBpb0xk/xWJV82DnxflCH
 DW6xFbhfw2Q0uDyza/VqIapA+Q1FolpufmnDFukZ0qiuKVs/3ky1EnHoT/MbsoTdhM/u
 O6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iRB9zqiBDmIMwvdpN9Oxo+M+PjL4KnG73fH2hb110Y=;
 b=5cz3c7kQ9yNUDk5x2l4X6ZDT11ZlxHaWVlpZRzaoNGmdyVaCFOA4giv23vvJJj+gfC
 lcQMV6BVWhIWNE6UWV7MorU/ZKHvWQOLfYJ3HR5I7V8nZGVTJI5y3oqB4xz+vdUciJNb
 eHH3PWPQSqj/vid5ZKjToK9NH+NHga7/8c+v13phRZ35d9i3cIWd4M1zhWjMMmzojXvy
 EdLXF/PH6YaD5pwFV+uG7MPKx/KiyeUbA+BPtCz5YamhZTYi/qDIzEK3idl5r5mUs51I
 LMpZkrbF8UysBK3SNfFyigWh+iTRMabMF+CwxDWt6DHoJlXkxJW9jKKAQeU7rzWf2dDP
 znNA==
X-Gm-Message-State: AOAM531hYN9CSvgjiieQ58+aBYXUgG74/A5rEPTh7bEyDdad+bbyvxjs
 X7s1GDV9piCS7KzcLpxIS8ciSSqQA3IsjQ==
X-Google-Smtp-Source: ABdhPJxzfUQzprGJGtx5qegXMcN0bLrp3pKBI3+dhcYPg2w0xmS5e+mlGWWoUHopg9aW1pYAITob0A==
X-Received: by 2002:a05:6a00:1411:b0:4fd:e594:fac0 with SMTP id
 l17-20020a056a00141100b004fde594fac0mr45062056pfu.79.1653676012438; 
 Fri, 27 May 2022 11:26:52 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 110/114] target/arm: Use TRANS_FEAT for do_shr_narrow
Date: Fri, 27 May 2022 11:19:03 -0700
Message-Id: <20220527181907.189259-111-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Rename from do_sve2_shr_narrow and hoist the sve2
check into the TRANS_FEAT macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 470 +++++++++++++++++--------------------
 1 file changed, 211 insertions(+), 259 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0fb118f6ef..44af7530b6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6552,10 +6552,10 @@ static const GVecGen2 sqxtunt_ops[3] = {
 };
 TRANS_FEAT(SQXTUNT, aa64_sve2, do_narrow_extract, a, sqxtunt_ops)
 
-static bool do_sve2_shr_narrow(DisasContext *s, arg_rri_esz *a,
-                               const GVecGen2i ops[3])
+static bool do_shr_narrow(DisasContext *s, arg_rri_esz *a,
+                          const GVecGen2i ops[3])
 {
-    if (a->esz < 0 || a->esz > MO_32 || !dc_isar_feature(aa64_sve2, s)) {
+    if (a->esz < 0 || a->esz > MO_32) {
         return false;
     }
     assert(a->imm > 0 && a->imm <= (8 << a->esz));
@@ -6604,28 +6604,25 @@ static void gen_shrnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = { INDEX_op_shri_vec, 0 };
-    static const GVecGen2i ops[3] = {
-        { .fni8 = gen_shrnb16_i64,
-          .fniv = gen_shrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_shrnb_h,
-          .vece = MO_16 },
-        { .fni8 = gen_shrnb32_i64,
-          .fniv = gen_shrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_shrnb_s,
-          .vece = MO_32 },
-        { .fni8 = gen_shrnb64_i64,
-          .fniv = gen_shrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_shrnb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode shrnb_vec_list[] = { INDEX_op_shri_vec, 0 };
+static const GVecGen2i shrnb_ops[3] = {
+    { .fni8 = gen_shrnb16_i64,
+      .fniv = gen_shrnb_vec,
+      .opt_opc = shrnb_vec_list,
+      .fno = gen_helper_sve2_shrnb_h,
+      .vece = MO_16 },
+    { .fni8 = gen_shrnb32_i64,
+      .fniv = gen_shrnb_vec,
+      .opt_opc = shrnb_vec_list,
+      .fno = gen_helper_sve2_shrnb_s,
+      .vece = MO_32 },
+    { .fni8 = gen_shrnb64_i64,
+      .fniv = gen_shrnb_vec,
+      .opt_opc = shrnb_vec_list,
+      .fno = gen_helper_sve2_shrnb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SHRNB, aa64_sve2, do_shr_narrow, a, shrnb_ops)
 
 static void gen_shrnt_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int shr)
 {
@@ -6666,51 +6663,42 @@ static void gen_shrnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = { INDEX_op_shli_vec, 0 };
-    static const GVecGen2i ops[3] = {
-        { .fni8 = gen_shrnt16_i64,
-          .fniv = gen_shrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_shrnt_h,
-          .vece = MO_16 },
-        { .fni8 = gen_shrnt32_i64,
-          .fniv = gen_shrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_shrnt_s,
-          .vece = MO_32 },
-        { .fni8 = gen_shrnt64_i64,
-          .fniv = gen_shrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_shrnt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode shrnt_vec_list[] = { INDEX_op_shli_vec, 0 };
+static const GVecGen2i shrnt_ops[3] = {
+    { .fni8 = gen_shrnt16_i64,
+      .fniv = gen_shrnt_vec,
+      .opt_opc = shrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_shrnt_h,
+      .vece = MO_16 },
+    { .fni8 = gen_shrnt32_i64,
+      .fniv = gen_shrnt_vec,
+      .opt_opc = shrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_shrnt_s,
+      .vece = MO_32 },
+    { .fni8 = gen_shrnt64_i64,
+      .fniv = gen_shrnt_vec,
+      .opt_opc = shrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_shrnt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SHRNT, aa64_sve2, do_shr_narrow, a, shrnt_ops)
 
-static bool trans_RSHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_rshrnb_h },
-        { .fno = gen_helper_sve2_rshrnb_s },
-        { .fno = gen_helper_sve2_rshrnb_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i rshrnb_ops[3] = {
+    { .fno = gen_helper_sve2_rshrnb_h },
+    { .fno = gen_helper_sve2_rshrnb_s },
+    { .fno = gen_helper_sve2_rshrnb_d },
+};
+TRANS_FEAT(RSHRNB, aa64_sve2, do_shr_narrow, a, rshrnb_ops)
 
-static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_rshrnt_h },
-        { .fno = gen_helper_sve2_rshrnt_s },
-        { .fno = gen_helper_sve2_rshrnt_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i rshrnt_ops[3] = {
+    { .fno = gen_helper_sve2_rshrnt_h },
+    { .fno = gen_helper_sve2_rshrnt_s },
+    { .fno = gen_helper_sve2_rshrnt_d },
+};
+TRANS_FEAT(RSHRNT, aa64_sve2, do_shr_narrow, a, rshrnt_ops)
 
 static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
@@ -6726,27 +6714,24 @@ static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQSHRUNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_sqshrunb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrunb_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqshrunb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrunb_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqshrunb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrunb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode sqshrunb_vec_list[] = {
+    INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+};
+static const GVecGen2i sqshrunb_ops[3] = {
+    { .fniv = gen_sqshrunb_vec,
+      .opt_opc = sqshrunb_vec_list,
+      .fno = gen_helper_sve2_sqshrunb_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqshrunb_vec,
+      .opt_opc = sqshrunb_vec_list,
+      .fno = gen_helper_sve2_sqshrunb_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqshrunb_vec,
+      .opt_opc = sqshrunb_vec_list,
+      .fno = gen_helper_sve2_sqshrunb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQSHRUNB, aa64_sve2, do_shr_narrow, a, sqshrunb_ops)
 
 static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
@@ -6764,51 +6749,42 @@ static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQSHRUNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_shli_vec, INDEX_op_sari_vec,
-        INDEX_op_smax_vec, INDEX_op_umin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_sqshrunt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrunt_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqshrunt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrunt_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqshrunt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrunt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode sqshrunt_vec_list[] = {
+    INDEX_op_shli_vec, INDEX_op_sari_vec,
+    INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+};
+static const GVecGen2i sqshrunt_ops[3] = {
+    { .fniv = gen_sqshrunt_vec,
+      .opt_opc = sqshrunt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrunt_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqshrunt_vec,
+      .opt_opc = sqshrunt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrunt_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqshrunt_vec,
+      .opt_opc = sqshrunt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrunt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQSHRUNT, aa64_sve2, do_shr_narrow, a, sqshrunt_ops)
 
-static bool trans_SQRSHRUNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_sqrshrunb_h },
-        { .fno = gen_helper_sve2_sqrshrunb_s },
-        { .fno = gen_helper_sve2_sqrshrunb_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i sqrshrunb_ops[3] = {
+    { .fno = gen_helper_sve2_sqrshrunb_h },
+    { .fno = gen_helper_sve2_sqrshrunb_s },
+    { .fno = gen_helper_sve2_sqrshrunb_d },
+};
+TRANS_FEAT(SQRSHRUNB, aa64_sve2, do_shr_narrow, a, sqrshrunb_ops)
 
-static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_sqrshrunt_h },
-        { .fno = gen_helper_sve2_sqrshrunt_s },
-        { .fno = gen_helper_sve2_sqrshrunt_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i sqrshrunt_ops[3] = {
+    { .fno = gen_helper_sve2_sqrshrunt_h },
+    { .fno = gen_helper_sve2_sqrshrunt_s },
+    { .fno = gen_helper_sve2_sqrshrunt_d },
+};
+TRANS_FEAT(SQRSHRUNT, aa64_sve2, do_shr_narrow, a, sqrshrunt_ops)
 
 static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
@@ -6828,27 +6804,24 @@ static void gen_sqshrnb_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQSHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_smin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_sqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrnb_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrnb_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_sqshrnb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode sqshrnb_vec_list[] = {
+    INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+};
+static const GVecGen2i sqshrnb_ops[3] = {
+    { .fniv = gen_sqshrnb_vec,
+      .opt_opc = sqshrnb_vec_list,
+      .fno = gen_helper_sve2_sqshrnb_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqshrnb_vec,
+      .opt_opc = sqshrnb_vec_list,
+      .fno = gen_helper_sve2_sqshrnb_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqshrnb_vec,
+      .opt_opc = sqshrnb_vec_list,
+      .fno = gen_helper_sve2_sqshrnb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQSHRNB, aa64_sve2, do_shr_narrow, a, sqshrnb_ops)
 
 static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
                              TCGv_vec n, int64_t shr)
@@ -6869,51 +6842,42 @@ static void gen_sqshrnt_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_SQSHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_shli_vec, INDEX_op_sari_vec,
-        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_sqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrnt_h,
-          .vece = MO_16 },
-        { .fniv = gen_sqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrnt_s,
-          .vece = MO_32 },
-        { .fniv = gen_sqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_sqshrnt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode sqshrnt_vec_list[] = {
+    INDEX_op_shli_vec, INDEX_op_sari_vec,
+    INDEX_op_smax_vec, INDEX_op_smin_vec, 0
+};
+static const GVecGen2i sqshrnt_ops[3] = {
+    { .fniv = gen_sqshrnt_vec,
+      .opt_opc = sqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrnt_h,
+      .vece = MO_16 },
+    { .fniv = gen_sqshrnt_vec,
+      .opt_opc = sqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrnt_s,
+      .vece = MO_32 },
+    { .fniv = gen_sqshrnt_vec,
+      .opt_opc = sqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_sqshrnt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(SQSHRNT, aa64_sve2, do_shr_narrow, a, sqshrnt_ops)
 
-static bool trans_SQRSHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_sqrshrnb_h },
-        { .fno = gen_helper_sve2_sqrshrnb_s },
-        { .fno = gen_helper_sve2_sqrshrnb_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i sqrshrnb_ops[3] = {
+    { .fno = gen_helper_sve2_sqrshrnb_h },
+    { .fno = gen_helper_sve2_sqrshrnb_s },
+    { .fno = gen_helper_sve2_sqrshrnb_d },
+};
+TRANS_FEAT(SQRSHRNB, aa64_sve2, do_shr_narrow, a, sqrshrnb_ops)
 
-static bool trans_SQRSHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_sqrshrnt_h },
-        { .fno = gen_helper_sve2_sqrshrnt_s },
-        { .fno = gen_helper_sve2_sqrshrnt_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i sqrshrnt_ops[3] = {
+    { .fno = gen_helper_sve2_sqrshrnt_h },
+    { .fno = gen_helper_sve2_sqrshrnt_s },
+    { .fno = gen_helper_sve2_sqrshrnt_d },
+};
+TRANS_FEAT(SQRSHRNT, aa64_sve2, do_shr_narrow, a, sqrshrnt_ops)
 
 static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
@@ -6927,27 +6891,24 @@ static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_UQSHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_shri_vec, INDEX_op_umin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_uqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_uqshrnb_h,
-          .vece = MO_16 },
-        { .fniv = gen_uqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_uqshrnb_s,
-          .vece = MO_32 },
-        { .fniv = gen_uqshrnb_vec,
-          .opt_opc = vec_list,
-          .fno = gen_helper_sve2_uqshrnb_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode uqshrnb_vec_list[] = {
+    INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+};
+static const GVecGen2i uqshrnb_ops[3] = {
+    { .fniv = gen_uqshrnb_vec,
+      .opt_opc = uqshrnb_vec_list,
+      .fno = gen_helper_sve2_uqshrnb_h,
+      .vece = MO_16 },
+    { .fniv = gen_uqshrnb_vec,
+      .opt_opc = uqshrnb_vec_list,
+      .fno = gen_helper_sve2_uqshrnb_s,
+      .vece = MO_32 },
+    { .fniv = gen_uqshrnb_vec,
+      .opt_opc = uqshrnb_vec_list,
+      .fno = gen_helper_sve2_uqshrnb_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(UQSHRNB, aa64_sve2, do_shr_narrow, a, uqshrnb_ops)
 
 static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
                             TCGv_vec n, int64_t shr)
@@ -6963,50 +6924,41 @@ static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
     tcg_temp_free_vec(t);
 }
 
-static bool trans_UQSHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const TCGOpcode vec_list[] = {
-        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_umin_vec, 0
-    };
-    static const GVecGen2i ops[3] = {
-        { .fniv = gen_uqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqshrnt_h,
-          .vece = MO_16 },
-        { .fniv = gen_uqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqshrnt_s,
-          .vece = MO_32 },
-        { .fniv = gen_uqshrnt_vec,
-          .opt_opc = vec_list,
-          .load_dest = true,
-          .fno = gen_helper_sve2_uqshrnt_d,
-          .vece = MO_64 },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const TCGOpcode uqshrnt_vec_list[] = {
+    INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+};
+static const GVecGen2i uqshrnt_ops[3] = {
+    { .fniv = gen_uqshrnt_vec,
+      .opt_opc = uqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqshrnt_h,
+      .vece = MO_16 },
+    { .fniv = gen_uqshrnt_vec,
+      .opt_opc = uqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqshrnt_s,
+      .vece = MO_32 },
+    { .fniv = gen_uqshrnt_vec,
+      .opt_opc = uqshrnt_vec_list,
+      .load_dest = true,
+      .fno = gen_helper_sve2_uqshrnt_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(UQSHRNT, aa64_sve2, do_shr_narrow, a, uqshrnt_ops)
 
-static bool trans_UQRSHRNB(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_uqrshrnb_h },
-        { .fno = gen_helper_sve2_uqrshrnb_s },
-        { .fno = gen_helper_sve2_uqrshrnb_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i uqrshrnb_ops[3] = {
+    { .fno = gen_helper_sve2_uqrshrnb_h },
+    { .fno = gen_helper_sve2_uqrshrnb_s },
+    { .fno = gen_helper_sve2_uqrshrnb_d },
+};
+TRANS_FEAT(UQRSHRNB, aa64_sve2, do_shr_narrow, a, uqrshrnb_ops)
 
-static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
-{
-    static const GVecGen2i ops[3] = {
-        { .fno = gen_helper_sve2_uqrshrnt_h },
-        { .fno = gen_helper_sve2_uqrshrnt_s },
-        { .fno = gen_helper_sve2_uqrshrnt_d },
-    };
-    return do_sve2_shr_narrow(s, a, ops);
-}
+static const GVecGen2i uqrshrnt_ops[3] = {
+    { .fno = gen_helper_sve2_uqrshrnt_h },
+    { .fno = gen_helper_sve2_uqrshrnt_s },
+    { .fno = gen_helper_sve2_uqrshrnt_d },
+};
+TRANS_FEAT(UQRSHRNT, aa64_sve2, do_shr_narrow, a, uqrshrnt_ops)
 
 #define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
     static gen_helper_gvec_3 * const name##_fns[4] = {                    \
-- 
2.34.1


