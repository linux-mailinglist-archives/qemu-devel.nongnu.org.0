Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7D538622
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:30:56 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviIC-00020G-1n
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvO-0002hW-Ru
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvL-0007BE-KW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id e2so15314806wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zNyAuUTx6ihD+ndHDyTUrccqNI71FACMJ8QqtsYFuVc=;
 b=Exz8VVruC8flJi1B6aQozGecSHInkNjxYCOBbb9Yqh//kvb/c6NitrzJK/yDmUY1MK
 B8CS5kccnhSlAboJ0Ncbr8nixc96/BQUAUPwopJc70EWk1ENwtiX4lUc3jKDwcbbisQE
 HAxW19hMJGZHt3IJgDGTWAsgNRnfNZYAln2Sk+wItsAnuEn3ZSCIcDE1FYYEQ0FnNuSQ
 xtv0itFQPWI3s6goWR/zFt21DyOkz1JC/S5Pw2SRwYgQ4a8sOVKDOoLaI6B3PR4nxxPn
 5Ot8bqj58NHyxfNuDaAzJVAk7C+VIgVLWkH9/Pi26GLDUQMAB9xliufpGVJUtQH1AewK
 uoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNyAuUTx6ihD+ndHDyTUrccqNI71FACMJ8QqtsYFuVc=;
 b=ltSQmK5Z07bZBuJ74b7BHn74xFSDs7x0p215TZjJb/hWlPNdr7bD8d6GzP9SbLY8NT
 3xx25vIJT+j4Qx6LN0yoU76+cq7Q8SbP26Y2z6hqGTWEE6pYAfugKhrz5p5eMIOAx2cB
 cCzXByDsdmz2ZibogduojBoOtSEH/aExIM/C/pRXzmRU2YLL0daHmC7Yls/hiuqyaIea
 /jYeVxox1w9EN/Gd2wT7EuggVnF/cV94Y75V9M1BQIH75AFh1RCsl5M7VPOxy1+Pqm41
 kKSA1Se2yDh1Bd9RzmuzP0OeN+ybsUmX3WyusLsinIxvqImItWAgHrX7f7kA8N+ds3+e
 RSbA==
X-Gm-Message-State: AOAM532sRZ1unJdumVD+XvYETYHtRzlLP3Jrgyv2VTegu6MynBw73ctX
 TSKbWfeGN+DFb19zkwkiFuxwd27FxFH3Bg==
X-Google-Smtp-Source: ABdhPJxGsBdSusNahhSMGUemfiJ5DmSZP4Imug8hcgWSGb5IGfvCF026IFQK18xIf3qwwlYDz6H0AQ==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr8195753wrf.20.1653926837617; 
 Mon, 30 May 2022 09:07:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 009/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
Date: Mon, 30 May 2022 17:05:20 +0100
Message-Id: <20220530160708.726466-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Convert SVE translation functions using
gen_gvec_ool_arg_zzz to TRANS_FEAT.

Remove trivial wrappers do_aese, do_sm4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-7-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 165 ++++++++++---------------------------
 1 file changed, 45 insertions(+), 120 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 37343fb2f06..c89c25166c3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1184,18 +1184,16 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
 }
 
 #define DO_ZZW(NAME, name) \
-static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
-{                                                                         \
-    static gen_helper_gvec_3 * const fns[4] = {                           \
+    static gen_helper_gvec_3 * const name##_zzw_fns[4] = {                \
         gen_helper_sve_##name##_zzw_b, gen_helper_sve_##name##_zzw_h,     \
         gen_helper_sve_##name##_zzw_s, NULL                               \
     };                                                                    \
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);                    \
-}
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_arg_zzz,                      \
+               name##_zzw_fns[a->esz], a, 0)
 
-DO_ZZW(ASR, asr)
-DO_ZZW(LSR, lsr)
-DO_ZZW(LSL, lsl)
+DO_ZZW(ASR_zzw, asr)
+DO_ZZW(LSR_zzw, lsr)
+DO_ZZW(LSL_zzw, lsl)
 
 #undef DO_ZZW
 
@@ -1380,16 +1378,11 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
 TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
            fexpa_fns[a->esz], a->rd, a->rn, 0)
 
-static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        NULL,
-        gen_helper_sve_ftssel_h,
-        gen_helper_sve_ftssel_s,
-        gen_helper_sve_ftssel_d,
-    };
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const ftssel_fns[4] = {
+    NULL,                    gen_helper_sve_ftssel_h,
+    gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
+};
+TRANS_FEAT(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz, ftssel_fns[a->esz], a, 0)
 
 /*
  *** SVE Predicate Logical Operations Group
@@ -2412,14 +2405,11 @@ static gen_helper_gvec_2 * const rev_fns[4] = {
 };
 TRANS_FEAT(REV_v, aa64_sve, gen_gvec_ool_zz, rev_fns[a->esz], a->rd, a->rn, 0)
 
-static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
-        gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
-    };
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const sve_tbl_fns[4] = {
+    gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
+    gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
+};
+TRANS_FEAT(TBL, aa64_sve, gen_gvec_ool_arg_zzz, sve_tbl_fns[a->esz], a, 0)
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
 {
@@ -2438,18 +2428,11 @@ static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
-        gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
-    };
-
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_3 * const tbx_fns[4] = {
+    gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
+    gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
+};
+TRANS_FEAT(TBX, aa64_sve2, gen_gvec_ool_arg_zzz, tbx_fns[a->esz], a, 0)
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
@@ -2641,62 +2624,30 @@ static gen_helper_gvec_3 * const uzp_fns[4] = {
     gen_helper_sve_uzp_s, gen_helper_sve_uzp_d,
 };
 
-static bool trans_UZP1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 0);
-}
+TRANS_FEAT(UZP1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           uzp_fns[a->esz], a, 0)
+TRANS_FEAT(UZP2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           uzp_fns[a->esz], a, 1 << a->esz)
 
-static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 1 << a->esz);
-}
-
-static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 0);
-}
-
-static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 16);
-}
+TRANS_FEAT(UZP1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_uzp_q, a, 0)
+TRANS_FEAT(UZP2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_uzp_q, a, 16)
 
 static gen_helper_gvec_3 * const trn_fns[4] = {
     gen_helper_sve_trn_b, gen_helper_sve_trn_h,
     gen_helper_sve_trn_s, gen_helper_sve_trn_d,
 };
 
-static bool trans_TRN1_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 0);
-}
+TRANS_FEAT(TRN1_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           trn_fns[a->esz], a, 0)
+TRANS_FEAT(TRN2_z, aa64_sve, gen_gvec_ool_arg_zzz,
+           trn_fns[a->esz], a, 1 << a->esz)
 
-static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
-{
-    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 1 << a->esz);
-}
-
-static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 0);
-}
-
-static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_f64mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 16);
-}
+TRANS_FEAT(TRN1_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_trn_q, a, 0)
+TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
+           gen_helper_sve2_trn_q, a, 16)
 
 /*
  *** SVE Permute Vector - Predicated Group
@@ -8345,41 +8296,15 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
 TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
            gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
-static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
-{
-    if (!dc_isar_feature(aa64_sve2_aes, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, gen_helper_crypto_aese, a, decrypt);
-}
+TRANS_FEAT(AESE, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_aese, a, false)
+TRANS_FEAT(AESD, aa64_sve2_aes, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_aese, a, true)
 
-static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_aese(s, a, false);
-}
-
-static bool trans_AESD(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_aese(s, a, true);
-}
-
-static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2_sm4, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
-}
-
-static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sm4(s, a, gen_helper_crypto_sm4e);
-}
-
-static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
-}
+TRANS_FEAT(SM4E, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_sm4e, a, 0)
+TRANS_FEAT(SM4EKEY, aa64_sve2_sm4, gen_gvec_ool_arg_zzz,
+           gen_helper_crypto_sm4ekey, a, 0)
 
 static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
 {
-- 
2.25.1


