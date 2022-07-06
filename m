Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D903568226
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:55:08 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90oN-0004wl-KT
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kt-0005m6-F8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:39 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kp-0000JD-On
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so19584182pjl.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uvyi0DtsyHq/nwl/k8YyGUsnb+NBbEi3/k46msM+NEw=;
 b=qwNVcka4FVGyiAc2q+W+U8ElTW3KAX0EOBHeG5tOzngyVDlv1Mt5Bgy3MpHPtsgvFw
 pbclpqdq6yVSbu4uevTW/5kqVwzazzE7itqPkZVkLaiX0IgdkJFbLLB/O0b1uQMMZzmo
 f0CI08anBxdoKQnF4bt/GMruk7X/WLPA+yAT99HxF7Ics0We6dOvWdfBGLlIEk2Q3RZW
 0lkHGIAK8dKrc2EOGyVljUdIwDdRyZKqbQmlI6vKaqVc4ySbOb7otiFETW/r/qe0/BJC
 Ki5kJ4uhPaHTNeV7NfefLjcO1q4ONFwAOrsKv4UixNHnFoBlhE1MruZYhWYA8ZlKgWJc
 O6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uvyi0DtsyHq/nwl/k8YyGUsnb+NBbEi3/k46msM+NEw=;
 b=0+0/r2e0m8sf0q68IYKkzve/Au/VB8o7nkWXN80R7NWnK+q/VxBqBLl/ggxsY02+UR
 hliUkiPcB3YdjwySxfmdazfrJNAnZGOY9BHaNfyHi/t8EErpWdR6A9KXJZd/sMJHzMuk
 zr7rbND2ajD8W2nbLyHAf2/OdwKsX3lGuuvUX//OT2h5JoaOgK5bg5KFl4yuW3jPw+i/
 7doAKJeItT9HkDguBMJBa6x/vw03BQ4MdYF8k/aYP+3nkIwfCNSCCowU49CrvH6yrAOF
 1uTbi5H/pe2WHGS63SEuWT2mcTNBxsXMhiP9zuQ+RAoRxsvLhvchBOvlB4GlBy7Tc0du
 TrFw==
X-Gm-Message-State: AJIora/jpnoYuggjMASSL+b0B7LF6CM+H3GV94VmgeEEYO5gq4d//hws
 2OtMLEAI7cZnOh93SiUMy9ARiW3vR7R9Ht2M
X-Google-Smtp-Source: AGRyM1sw0n4KMJ/g2Ksa4YoY5d5ULHFmSQ1iI37mfS+/j/fwQ/UyBLfYIZG87Z2uS8kIyHsOlE6+2g==
X-Received: by 2002:a17:902:c64b:b0:16b:d51a:dc24 with SMTP id
 s11-20020a170902c64b00b0016bd51adc24mr21729950pls.48.1657095875003; 
 Wed, 06 Jul 2022 01:24:35 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Date: Wed,  6 Jul 2022 13:53:33 +0530
Message-Id: <20220706082411.1664825-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  2 --
 target/arm/translate-sve.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4f515939d9..4ff2df82e5 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,8 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
-FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
 FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
 FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae48040aa4..4ff2102fc8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6186,9 +6186,13 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
         gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
         NULL,                    gen_helper_sve2_pmull_d,
     };
-    if (a->esz == 0
-        ? !dc_isar_feature(aa64_sve2_pmull128, s)
-        : !dc_isar_feature(aa64_sve, s)) {
+
+    if (a->esz == 0) {
+        if (!dc_isar_feature(aa64_sve2_pmull128, s)) {
+            return false;
+        }
+        s->is_nonstreaming = true;
+    } else if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
@@ -7125,10 +7129,12 @@ DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
-TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
@@ -7301,8 +7307,8 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_bfmmla, a, 0)
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.34.1


