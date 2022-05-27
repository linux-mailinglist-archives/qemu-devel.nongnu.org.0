Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A2536702
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:43:11 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuevW-0005hd-9k
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYW-0006eC-Sc
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:24 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYT-0003YH-2Q
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id f18so4842962plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wBAvOi2H2aIOEj63Ke1Il3yEi3IVpupbG2NDNvYEwvc=;
 b=PQG7LFtUusX7FZCTgPcreRXjkSim+ZjD7wxHRwJUToIFrZnRhCvRfO4AsRQ9tEz2eW
 KMDdZk56pBDgVizxglXzoQrDo3acDXP8KrmqTMnR3l9oXVq/QK1Mc+k7/Pek2w3b40Ry
 9KusY/pywBe4AuFdgwlrO+YsKtvCQpub65kxacp1scxcmT/PmPVUmYCQKrcmiY1d7XMn
 0ASb0dWvMG0HYfpMdh9sz1MUOlLk9JLbg/ICoHqrfWHkN7N/tDL7n8j4etXFJpLhsbcU
 Dj67gETnwWX4ZrzQjuY9yqWS8nW/ugYgfP6qNUfOxNz0ei4gU/iaJVKokDjnLuVBiZPn
 5FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wBAvOi2H2aIOEj63Ke1Il3yEi3IVpupbG2NDNvYEwvc=;
 b=NvWpQJqIoFAEPkbpakAfPr+KWVM8gv5XrPx7eXWWvkUL28SoHkgw1MaSiwrMBlXPC2
 ggfU6yxZ3pYPN/olW9yyIXUXrTSiC/SY8GsuknXM31tP+Wu0aiWYlzUhSVgsjky0b2Iq
 PF1IT0rNBnOqsYjzshwu/7qTH+tgRclQ4DOq0DWflJhz/fy3fD/XuTOVIUcuMkWHv92Y
 MLqNfPlE/jy/DshSmAwDl8WEuzg6UrjhuIXns58FFnSki5WRYCZZDutzemJ3JELAJe5r
 rrFggkLg8LDYudMYupgZlwM4qFXKcJbyFOZ0EG+23xyld5vxiNtWk+uoz/nGjt67Le+K
 eKeg==
X-Gm-Message-State: AOAM5328xEAfJPyVeGyvponP6MqBJ/LmnKofIfIYhYm/E9zK7fWWrhMR
 BsMW1fkykCqqkxqKpvGwa+O42QKQP35vsw==
X-Google-Smtp-Source: ABdhPJyjVCtTUaxUy6rhzv/KZolMCrg6GzXHLhpLQimXiVdlke0zATqIdNO5z9BBh67Uh8Uwsb6j6Q==
X-Received: by 2002:a17:902:eb82:b0:161:f4c5:ec2 with SMTP id
 q2-20020a170902eb8200b00161f4c50ec2mr37510715plg.8.1653675559730; 
 Fri, 27 May 2022 11:19:19 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 011/114] target/arm: Use TRANS_FEAT for do_sve2_zzzz_ool
Date: Fri, 27 May 2022 11:17:24 -0700
Message-Id: <20220527181907.189259-12-richard.henderson@linaro.org>
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

Convert SVE translation functions using do_sve2_zzzz_ool
to use TRANS_FEAT and gen_gvec_ool_arg_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 263 +++++++++++--------------------------
 1 file changed, 79 insertions(+), 184 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e795baf6f9..cae6df705a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7109,45 +7109,19 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
     return do_cadd(s, a, true, true);
 }
 
-static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
-                             gen_helper_gvec_4 *fn, int data)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
-}
+static gen_helper_gvec_4 * const sabal_fns[4] = {
+    NULL,                    gen_helper_sve2_sabal_h,
+    gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d,
+};
+TRANS_FEAT(SABALB, aa64_sve2, gen_gvec_ool_arg_zzzz, sabal_fns[a->esz], a, 0)
+TRANS_FEAT(SABALT, aa64_sve2, gen_gvec_ool_arg_zzzz, sabal_fns[a->esz], a, 1)
 
-static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[2][4] = {
-        { NULL,                    gen_helper_sve2_sabal_h,
-          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
-        { NULL,                    gen_helper_sve2_uabal_h,
-          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
-    };
-    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
-}
-
-static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, false, false);
-}
-
-static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, false, true);
-}
-
-static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, true, false);
-}
-
-static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, true, true);
-}
+static gen_helper_gvec_4 * const uabal_fns[4] = {
+    NULL,                    gen_helper_sve2_uabal_h,
+    gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d,
+};
+TRANS_FEAT(UABALB, aa64_sve2, gen_gvec_ool_arg_zzzz, uabal_fns[a->esz], a, 0)
+TRANS_FEAT(UABALT, aa64_sve2, gen_gvec_ool_arg_zzzz, uabal_fns[a->esz], a, 1)
 
 static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
@@ -7159,18 +7133,11 @@ static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
      * Note that in this case the ESZ field encodes both size and sign.
      * Split out 'subtract' into bit 1 of the data field for the helper.
      */
-    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+    return gen_gvec_ool_arg_zzzz(s, fns[a->esz & 1], a, (a->esz & 2) | sel);
 }
 
-static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_adcl(s, a, false);
-}
-
-static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_adcl(s, a, true);
-}
+TRANS_FEAT(ADCLB, aa64_sve2, do_adcl, a, false)
+TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
 static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
 {
@@ -8048,149 +8015,77 @@ static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
     return true;
 }
 
-static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
-                            bool sel1, bool sel2)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
-        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
-}
+static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
+    NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+    gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+};
+TRANS_FEAT(SQDMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SQDMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 3)
+TRANS_FEAT(SQDMLALBT, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 2)
 
-static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
-                            bool sel1, bool sel2)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
-        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
-}
+static gen_helper_gvec_4 * const sqdmlsl_zzzw_fns[] = {
+    NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+    gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+};
+TRANS_FEAT(SQDMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SQDMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 3)
+TRANS_FEAT(SQDMLSLBT, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 2)
 
-static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, false, false);
-}
+static gen_helper_gvec_4 * const sqrdmlah_fns[] = {
+    gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
+    gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
+};
+TRANS_FEAT(SQRDMLAH_zzzz, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqrdmlah_fns[a->esz], a, 0)
 
-static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, true, true);
-}
+static gen_helper_gvec_4 * const sqrdmlsh_fns[] = {
+    gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
+    gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
+};
+TRANS_FEAT(SQRDMLSH_zzzz, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqrdmlsh_fns[a->esz], a, 0)
 
-static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, false, true);
-}
+static gen_helper_gvec_4 * const smlal_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_smlal_zzzw_h,
+    gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
+};
+TRANS_FEAT(SMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlal_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, false, false);
-}
+static gen_helper_gvec_4 * const umlal_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_umlal_zzzw_h,
+    gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
+};
+TRANS_FEAT(UMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(UMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlal_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, true, true);
-}
+static gen_helper_gvec_4 * const smlsl_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_smlsl_zzzw_h,
+    gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
+};
+TRANS_FEAT(SMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlsl_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, false, true);
-}
-
-static bool trans_SQRDMLAH_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
-        gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
-}
-
-static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
-        gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
-}
-
-static bool do_smlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_smlal_zzzw_h,
-        gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_SMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlal_zzzw(s, a, false);
-}
-
-static bool trans_SMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlal_zzzw(s, a, true);
-}
-
-static bool do_umlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_umlal_zzzw_h,
-        gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_UMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlal_zzzw(s, a, false);
-}
-
-static bool trans_UMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlal_zzzw(s, a, true);
-}
-
-static bool do_smlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_smlsl_zzzw_h,
-        gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_SMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlsl_zzzw(s, a, false);
-}
-
-static bool trans_SMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlsl_zzzw(s, a, true);
-}
-
-static bool do_umlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_umlsl_zzzw_h,
-        gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_UMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlsl_zzzw(s, a, false);
-}
-
-static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlsl_zzzw(s, a, true);
-}
+static gen_helper_gvec_4 * const umlsl_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_umlsl_zzzw_h,
+    gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
+};
+TRANS_FEAT(UMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(UMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlsl_zzzw_fns[a->esz], a, 1)
 
 static gen_helper_gvec_4 * const cmla_fns[] = {
     gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
-- 
2.34.1


