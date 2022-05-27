Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BA5367FE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:22:36 +0200 (CEST)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugTj-0005Oc-IV
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefq-0002AZ-6n
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:58 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefk-0005MB-Ck
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:57 -0400
Received: by mail-pg1-x536.google.com with SMTP id j21so4555595pga.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeE4LCersjyoSBxyapAtgYoEXswo+I9z7WVTm9hYedU=;
 b=fk+F3F71AnUiBCCqndgDaiRxWBIN/h0ebVJJWgyN7U2K61ESRnpzkBa6KFNgiyXLQW
 QseAU+JF1qHfSnNeoPkkdMjgwYHTIbHVcocgWkKiru5ve1tJGyTUKIbYNFVhUkJm3/WJ
 Ss6174PfyDXdpeR5Rxbsecat1gWXlzSlibWBhD/Egu2xxvwQmKayZz+PzcmQjkdJABWR
 Apfkoz/0s1pnv1yx2H1gFeN8J+ccIm7139u2UTwlWousaQ4kU/Y6CUn0IuU+TrxjRnG8
 u0YAXjJh17aKZLshnC6MpTMHdKjSTOchF7i0Fz96XkWwQwgeLBl7Ofv5+XzGR7/QOZxr
 ZWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeE4LCersjyoSBxyapAtgYoEXswo+I9z7WVTm9hYedU=;
 b=ci4kXSD8yWuG7twXJyEIM9ZrE9D8jSnqL7U3+rDrboNLY/igmMvAChPSjJtvuLF15D
 7mwLZxva4pVgGPMjWoompLiE4k/a692PJrgpEjQnISLJsC7VyhCPS4I+qjAGViEGXlrF
 Vz3pI6HoCNFe7KxPHb2KXrk6O3yn8Aimj2kwv4tlA9TFy6VCy+2E4NHGYBs+Lg6Bk1nu
 jZxGOdksLg/JOQZQ5doOI37EPjoXuqciTJgzXaiOf760yNnDlKq+WHcXCLEi79epA/3F
 cCwd7njRyUwfKLuoA94X5aHq7LFLswPN+VkXiuro4PAcJOKe81hrwOG+ThP57RfAY6Nj
 j9ag==
X-Gm-Message-State: AOAM531J/mSK5O6nPDobAxR64DWYhSQ7ov4yszG/jpYYS5/4Sgqsm3SL
 jSe4KshT81xbVQDicE7TKK6lGUPyk+ATHg==
X-Google-Smtp-Source: ABdhPJx+r/v4zy5HQuLEJWnN6KOj4z0EeT8Dfl1c7MDb8IVlJu1pw3cfuFvxKAaKZTYIHjmnpwvDtA==
X-Received: by 2002:a63:89c1:0:b0:3fb:a75e:d523 with SMTP id
 v184-20020a6389c1000000b003fba75ed523mr4033535pgd.313.1653676011215; 
 Fri, 27 May 2022 11:26:51 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 109/114] target/arm: Use TRANS_FEAT for do_shll_tb
Date: Fri, 27 May 2022 11:19:02 -0700
Message-Id: <20220527181907.189259-110-richard.henderson@linaro.org>
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

Rename from do_sve2_shll_tb and hoist the sve2
check into the TRANS_FEAT macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 102 ++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 57 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8e7f8308c7..0fb118f6ef 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6194,46 +6194,11 @@ static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
     }
 }
 
-static bool do_sve2_shll_tb(DisasContext *s, arg_rri_esz *a,
-                            bool sel, bool uns)
+static bool do_shll_tb(DisasContext *s, arg_rri_esz *a,
+                       const GVecGen2i ops[3], bool sel)
 {
-    static const TCGOpcode sshll_list[] = {
-        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
-    };
-    static const TCGOpcode ushll_list[] = {
-        INDEX_op_shli_vec, INDEX_op_shri_vec, 0
-    };
-    static const GVecGen2i ops[2][3] = {
-        { { .fniv = gen_sshll_vec,
-            .opt_opc = sshll_list,
-            .fno = gen_helper_sve2_sshll_h,
-            .vece = MO_16 },
-          { .fniv = gen_sshll_vec,
-            .opt_opc = sshll_list,
-            .fno = gen_helper_sve2_sshll_s,
-            .vece = MO_32 },
-          { .fniv = gen_sshll_vec,
-            .opt_opc = sshll_list,
-            .fno = gen_helper_sve2_sshll_d,
-            .vece = MO_64 } },
-        { { .fni8 = gen_ushll16_i64,
-            .fniv = gen_ushll_vec,
-            .opt_opc = ushll_list,
-            .fno = gen_helper_sve2_ushll_h,
-            .vece = MO_16 },
-          { .fni8 = gen_ushll32_i64,
-            .fniv = gen_ushll_vec,
-            .opt_opc = ushll_list,
-            .fno = gen_helper_sve2_ushll_s,
-            .vece = MO_32 },
-          { .fni8 = gen_ushll64_i64,
-            .fniv = gen_ushll_vec,
-            .opt_opc = ushll_list,
-            .fno = gen_helper_sve2_ushll_d,
-            .vece = MO_64 } },
-    };
 
-    if (a->esz < 0 || a->esz > 2 || !dc_isar_feature(aa64_sve2, s)) {
+    if (a->esz < 0 || a->esz > 2) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -6241,30 +6206,53 @@ static bool do_sve2_shll_tb(DisasContext *s, arg_rri_esz *a,
         tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
                         vec_full_reg_offset(s, a->rn),
                         vsz, vsz, (a->imm << 1) | sel,
-                        &ops[uns][a->esz]);
+                        &ops[a->esz]);
     }
     return true;
 }
 
-static bool trans_SSHLLB(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_shll_tb(s, a, false, false);
-}
+static const TCGOpcode sshll_list[] = {
+    INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+};
+static const GVecGen2i sshll_ops[3] = {
+    { .fniv = gen_sshll_vec,
+      .opt_opc = sshll_list,
+      .fno = gen_helper_sve2_sshll_h,
+      .vece = MO_16 },
+    { .fniv = gen_sshll_vec,
+      .opt_opc = sshll_list,
+      .fno = gen_helper_sve2_sshll_s,
+      .vece = MO_32 },
+    { .fniv = gen_sshll_vec,
+      .opt_opc = sshll_list,
+      .fno = gen_helper_sve2_sshll_d,
+      .vece = MO_64 }
+};
+TRANS_FEAT(SSHLLB, aa64_sve2, do_shll_tb, a, sshll_ops, false)
+TRANS_FEAT(SSHLLT, aa64_sve2, do_shll_tb, a, sshll_ops, true)
 
-static bool trans_SSHLLT(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_shll_tb(s, a, true, false);
-}
-
-static bool trans_USHLLB(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_shll_tb(s, a, false, true);
-}
-
-static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_shll_tb(s, a, true, true);
-}
+static const TCGOpcode ushll_list[] = {
+    INDEX_op_shli_vec, INDEX_op_shri_vec, 0
+};
+static const GVecGen2i ushll_ops[3] = {
+    { .fni8 = gen_ushll16_i64,
+      .fniv = gen_ushll_vec,
+      .opt_opc = ushll_list,
+      .fno = gen_helper_sve2_ushll_h,
+      .vece = MO_16 },
+    { .fni8 = gen_ushll32_i64,
+      .fniv = gen_ushll_vec,
+      .opt_opc = ushll_list,
+      .fno = gen_helper_sve2_ushll_s,
+      .vece = MO_32 },
+    { .fni8 = gen_ushll64_i64,
+      .fniv = gen_ushll_vec,
+      .opt_opc = ushll_list,
+      .fno = gen_helper_sve2_ushll_d,
+      .vece = MO_64 },
+};
+TRANS_FEAT(USHLLB, aa64_sve2, do_shll_tb, a, ushll_ops, false)
+TRANS_FEAT(USHLLT, aa64_sve2, do_shll_tb, a, ushll_ops, true)
 
 static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
-- 
2.34.1


