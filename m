Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82153676F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:23:50 +0200 (CEST)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufYp-0007iw-M6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYw-00086v-CF
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:50 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYq-0003cY-3L
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:50 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so4555744pgc.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ddC0elGr/QDnxmXod6FDDIqXwo1Gj/CGqn13XsVZPs=;
 b=WQ8wjFSrhmInER70qXl8XBwiH+fa6GRGIanlATGFju/AUiusPKzPZUvnFBm4PYLUu4
 eoXOjxVBzwHfTjyK5OYl9PUtigcWP+l3IPLTjbNqz2ErpKB/vKmZMfH589qGVg79ibZr
 p9y08pxH1t0ZSwkmTer51FeVsRq3sCei6xNa0ceuGa0liLjhf7UEe3mZyaQs2T26QKIa
 fEVbW57gNzT6bu+dfx+9Nt9Zkri4gDUXwX34DFI2SsYxUwnZqrEm36fFpPM3NwwZEKXt
 zBgjSX366/PcMseuDqOD2XuIGL/DyzU150a+J9ktGNhu0wlFqKQb2szdJF+ThbyQ0EA9
 Va8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ddC0elGr/QDnxmXod6FDDIqXwo1Gj/CGqn13XsVZPs=;
 b=eTSR0bXS7WSRQnICAT1l5+p520ne0/kGe9WlSht0Hk1GNfkaLn/MP2u4gZNhhkQsvv
 /pCQFaZSoQOfYFJIyJyvDAJWv6AKNtav08Kap7egbv3Q4CuC66fQhKq1EV6PXLgue9uy
 AkhXtYHjtWAgruDqA7EvqO5Co/VNT19T+gR/AWhRbfbL9JzKsuelnThv5D+aJK7DImI2
 M6JaRse7iYJtAYgjvxYvBvCpr19Aq4ZeuPhePg2oJ5jCVm+CVm0VEaLTQtAJUEqS0c27
 n4erzBXfvapVcwiweFrea2l1u0E8PRx8PRKrWGYLEEHUxKxk1fdwFISAu941ZKmYTIVE
 847w==
X-Gm-Message-State: AOAM5308bRXPex7+MIvNyA60yHh4gLcMVnikr1+8r2ZM/QjA1ax5KkNN
 QgSFQABSUy3isvRou4oLy9EpQQbiSmSTKg==
X-Google-Smtp-Source: ABdhPJx2s/hVjLxdXrZCpHCATM7rXHDSyjozQHxkEYtDk8cb2Bza0jPqXnm4oioYynmF0OADQIdhjw==
X-Received: by 2002:a05:6a00:2345:b0:518:929b:ce8b with SMTP id
 j5-20020a056a00234500b00518929bce8bmr30116271pfj.5.1653675583265; 
 Fri, 27 May 2022 11:19:43 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 037/114] target/arm: Use TRANS_FEAT for do_sve2_zzzz_fn
Date: Fri, 27 May 2022 11:17:50 -0700
Message-Id: <20220527181907.189259-38-richard.henderson@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Convert SVE translation functions using do_sve2_zzzz_fn
to use TRANS_FEAT and gen_gvec_fn_arg_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 38 ++++++--------------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e0b083f861..f89c78a23e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -491,14 +491,6 @@ static bool trans_XAR(DisasContext *s, arg_rrri_esz *a)
     return true;
 }
 
-static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzzz(s, fn, a);
-}
-
 static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
     tcg_gen_xor_i64(d, n, m);
@@ -525,10 +517,7 @@ static void gen_eor3(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_EOR3(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_eor3);
-}
+TRANS_FEAT(EOR3, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_eor3, a)
 
 static void gen_bcax_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -556,10 +545,7 @@ static void gen_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BCAX(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bcax);
-}
+TRANS_FEAT(BCAX, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bcax, a)
 
 static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
@@ -568,10 +554,7 @@ static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_bitsel(vece, d, a, n, m, oprsz, maxsz);
 }
 
-static bool trans_BSL(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl);
-}
+TRANS_FEAT(BSL, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl, a)
 
 static void gen_bsl1n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -606,10 +589,7 @@ static void gen_bsl1n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BSL1N(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl1n);
-}
+TRANS_FEAT(BSL1N, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl1n, a)
 
 static void gen_bsl2n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -653,10 +633,7 @@ static void gen_bsl2n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_BSL2N(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_bsl2n);
-}
+TRANS_FEAT(BSL2N, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_bsl2n, a)
 
 static void gen_nbsl_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
 {
@@ -685,10 +662,7 @@ static void gen_nbsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
-static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sve2_zzzz_fn(s, a, gen_nbsl);
-}
+TRANS_FEAT(NBSL, aa64_sve2, gen_gvec_fn_arg_zzzz, gen_nbsl, a)
 
 /*
  *** SVE Integer Arithmetic - Unpredicated Group
-- 
2.34.1


