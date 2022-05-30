Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE690538618
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:25:04 +0200 (CEST)
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviCV-0000pI-VE
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvO-0002hV-PU
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvL-0007BB-Gu
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k16so10940533wrg.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VdNkyR5z0XbjA/F5PwkHevb5zlirZdP3cknohAbWffo=;
 b=BXjhKFSxdj5Vx/YDP8m0Xn9AnbQGp6oBGDLwVbwskwAdJl3PLRHDj0hTdKNAJwJcGI
 gq3nNyswWKYxkA0SbI/lGHfN+rgttjVwoMsIliKFVgWqbECcEYPlK2X7OMAzZHNYVpGD
 v2Sp0DObaTskOnyGIpPeSySde5CGwM1UxIk/tC/7pdR+ZGBtI0LEWMJHfQQj6GOZllCX
 fozM4djx74W7fZeHkHvMtcc0QmN+ZvYGUwkuLST6uSQw/aHk9RFaNUTavsd2G0guMlqg
 jJH8RFWd4G+1YZVtYO46sEFDzzS7E6tH2aINQaKc9F8u0FaeZ5ITy2OO4aDOXJTp83uC
 M61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdNkyR5z0XbjA/F5PwkHevb5zlirZdP3cknohAbWffo=;
 b=sALgk/o9exNV3VygSt5IeUdY0VmCXnjF6crlH3Qq1NJpguZtmRNkz9Be10AWA/eLl+
 nilpyoCvlSqpaFyL0kwPfe24wWfxvuU7KM3ExrIQ3rxsqhI1Mzn1Am+dYxBtggWrzySn
 QoORshKvAvve3WrGYzAdgDWSkbNaDwtKXvEM6GA84DMZOrcoJA+D3cuoQ8o6ksAOGRIm
 fO0l2K134y8iBwdpA6iAke6S4xz5bo+4KBZ2rpb2ofw8mWmjAczvXJDR6er2yHZX1u3C
 PcKAkta5zOFk3dJPeEr111s4He+jn2jbPjUFhL6bWVftnLwMgI3RbBiDgtilekbGDRPZ
 lSDA==
X-Gm-Message-State: AOAM531T75kBzuoyJPNXvE+5LaP2jsHqFmzmci3Gws3qk8TFNqg8bd1I
 AdyPa1ZaU2Eye8ZTx+jO9u4U+YfYRMhdhA==
X-Google-Smtp-Source: ABdhPJyyG7v700po/wnXhepv/Ka0rj05FZK/3ldVmfmJIy9Un91n9RjOxFAbXIqJk2rtbQ2I5uqRrw==
X-Received: by 2002:a05:6000:352:b0:210:3509:7364 with SMTP id
 e18-20020a056000035200b0021035097364mr4720781wre.82.1653926836753; 
 Mon, 30 May 2022 09:07:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 008/117] target/arm: Introduce gen_gvec_ool_arg_zzz
Date: Mon, 30 May 2022 17:05:19 +0100
Message-Id: <20220530160708.726466-9-peter.maydell@linaro.org>
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

Use gen_gvec_ool_arg_zzz instead of gen_gvec_ool_zzz
when the arguments come from arg_rrr_esz.
Replaces do_zzw_ool and do_zzz_data_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-6-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 48 +++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fd1d749c0ea..37343fb2f06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -169,6 +169,12 @@ static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
+                                 arg_rrr_esz *a, int data)
+{
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
+}
+
 /* Invoke an out-of-line helper on 4 Zregs. */
 static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
@@ -1177,11 +1183,6 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
     return do_shift_imm(s, a, false, tcg_gen_gvec_shli);
 }
 
-static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-}
-
 #define DO_ZZW(NAME, name) \
 static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
 {                                                                         \
@@ -1189,7 +1190,7 @@ static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
         gen_helper_sve_##name##_zzw_b, gen_helper_sve_##name##_zzw_h,     \
         gen_helper_sve_##name##_zzw_s, NULL                               \
     };                                                                    \
-    return do_zzw_ool(s, a, fns[a->esz]);                                 \
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);                    \
 }
 
 DO_ZZW(ASR, asr)
@@ -1387,7 +1388,7 @@ static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_ftssel_s,
         gen_helper_sve_ftssel_d,
     };
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 /*
@@ -2417,7 +2418,7 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
         gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
     };
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
@@ -2447,7 +2448,7 @@ static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
@@ -2599,12 +2600,6 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
     return true;
 }
 
-static bool do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
-                            gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
-}
-
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
 {
     return do_zip(s, a, false);
@@ -2648,12 +2643,12 @@ static gen_helper_gvec_3 * const uzp_fns[4] = {
 
 static bool trans_UZP1_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 0, uzp_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 0);
 }
 
 static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 1 << a->esz, uzp_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 1 << a->esz);
 }
 
 static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
@@ -2661,7 +2656,7 @@ static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_uzp_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 0);
 }
 
 static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
@@ -2669,7 +2664,7 @@ static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_uzp_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 16);
 }
 
 static gen_helper_gvec_3 * const trn_fns[4] = {
@@ -2679,12 +2674,12 @@ static gen_helper_gvec_3 * const trn_fns[4] = {
 
 static bool trans_TRN1_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 0, trn_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 0);
 }
 
 static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 1 << a->esz);
 }
 
 static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
@@ -2692,7 +2687,7 @@ static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_trn_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 0);
 }
 
 static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
@@ -2700,7 +2695,7 @@ static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_trn_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 16);
 }
 
 /*
@@ -6677,7 +6672,7 @@ static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
 }
 
 static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -8355,8 +8350,7 @@ static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
-                            a->rd, a->rn, a->rm, decrypt);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_crypto_aese, a, decrypt);
 }
 
 static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
@@ -8374,7 +8368,7 @@ static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
     if (!dc_isar_feature(aa64_sve2_sm4, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
 }
 
 static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-- 
2.25.1


