Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6F538663
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:53:46 +0200 (CEST)
Received: from localhost ([::1]:48798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvieI-0000lt-0c
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0003P8-GU
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0007Hl-M6
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so9674574wrb.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pIS9pWdjzE/HjRYIN1kdzWU0wWVjZc9Zg3HiRm8QkgY=;
 b=o3gqsXMmr+9mE6LYj3DJ8KPLBGEmHcve1FkSTFFLiGeuxQXLOdpUV0ZACJAqd5D0KU
 sULO0Jp1on4hCV14UrqxlQ47SeRXJ76+IQeVNH8/jVVgfPtFG7XRLc9VdD6Bwi9yjOAF
 S3M9vTSajLK3w2E9lAoVbNEDpnImKbSYg4kmpg2MCVt/iDfixk4+jX9cks7OIfa1wfG9
 LnYk71o9Cfxa8xBloLIWW0px6Q2/gEAakwzlAeSGI1+WIwtoEi91DvKvHJsg/lBERH0o
 kc+5FSQXpmjjuqqcwEIDYdld5l2AvLWerpS1antWeBVvBQUn6rZOLo2pOJB2m4hOI+e1
 GZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIS9pWdjzE/HjRYIN1kdzWU0wWVjZc9Zg3HiRm8QkgY=;
 b=OO4AH+kmAKBP0+NK0UA0q2fusNQWzwQsHxqJuXZndNeC/eTLy0C+UPLjVb4LgWvpEz
 hP1lGdbUFMlFvSEi5ZT2EuD0AAS2TAS5aBSdcMzAc4/U6odXtTH4IG4RTILQExatDR7A
 3iUCnN4+AAF4jKSM12WabCpAjVp9XcVOqbwLhUJ7Rl6NbtUYykzkQ0CLHQLrNOsjyy6x
 kL2r4PgQ3EZJEIV5eVXXspDLQ0s42ZRvXW6jnkSRvmw77M+O8c88ATPWOO5BHkFrGkog
 oGSwLNa0u8/qSvHQykiA19AAV5QC/HDJ7WeQNAcjpZamXQbdIkpXjPdXdL54p+zO00VH
 Hi6A==
X-Gm-Message-State: AOAM530OI494hiOQGOtg7BDGW71YuCtxoCh8OBn7Sk7Fbr+0RVbDxYUe
 EXdxT8KTI5kR7A/nY4nEm9UtxbdatXFwkQ==
X-Google-Smtp-Source: ABdhPJzuGmOf2pbKiurIe24Y5wZI8QGmP1Otf2VZhtFtdPPFHe1XmpAEDLORJy3lzmwqG++m3DCRsw==
X-Received: by 2002:a05:6000:1b8d:b0:20c:d372:f07c with SMTP id
 r13-20020a0560001b8d00b0020cd372f07cmr47051604wru.607.1653926859124; 
 Mon, 30 May 2022 09:07:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 036/117] target/arm: Use TRANS_FEAT for gen_gvec_fn_arg_zzz
Date: Mon, 30 May 2022 17:05:47 +0100
Message-Id: <20220530160708.726466-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Convert SVE translation functions directly using
gen_gvec_fn_arg_zzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-34-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 66 +++++++-------------------------------
 1 file changed, 11 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2dbf2961283..ddb34cad8e9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -376,25 +376,10 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
-static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_and, a);
-}
-
-static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_or, a);
-}
-
-static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_xor, a);
-}
-
-static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_andc, a);
-}
+TRANS_FEAT(AND_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_and, a)
+TRANS_FEAT(ORR_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_or, a)
+TRANS_FEAT(EOR_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_xor, a)
+TRANS_FEAT(BIC_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_andc, a)
 
 static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
 {
@@ -706,35 +691,12 @@ static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
  *** SVE Integer Arithmetic - Unpredicated Group
  */
 
-static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_add, a);
-}
-
-static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sub, a);
-}
-
-static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ssadd, a);
-}
-
-static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sssub, a);
-}
-
-static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_usadd, a);
-}
-
-static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ussub, a);
-}
+TRANS_FEAT(ADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_add, a)
+TRANS_FEAT(SUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_sub, a)
+TRANS_FEAT(SQADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ssadd, a)
+TRANS_FEAT(SQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_sssub, a)
+TRANS_FEAT(UQADD_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_usadd, a)
+TRANS_FEAT(UQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ussub, a)
 
 /*
  *** SVE Integer Arithmetic - Binary Predicated Group
@@ -6420,13 +6382,7 @@ static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
  * SVE2 Integer Multiply - Unpredicated
  */
 
-static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_mul, a);
-}
+TRANS_FEAT(MUL_zzz, aa64_sve2, gen_gvec_fn_arg_zzz, tcg_gen_gvec_mul, a)
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
     gen_helper_gvec_smulh_b, gen_helper_gvec_smulh_h,
-- 
2.25.1


