Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DC536717
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:48:55 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuf15-0004pg-0T
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYR-0006Lk-Nn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:19 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYO-0003WF-1d
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:19 -0400
Received: by mail-pg1-x52b.google.com with SMTP id x12so4553021pgj.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZqP9zYtpRqV34OynQcsQDt54YpeUjGNeRtaiqprcIM=;
 b=YiYsagaMtzfeLYQuBcQzHjFYoAvunAISk/Xz2vBK+xlXXcH1Qyxx16SnPdVbRcI8aJ
 i9TEtknID8xoYUd3iQ45QTZqptWJwRfBggsl8dy498WUc2TnCnGWaveacge1udU+I6mF
 yg399J6keN+Zuti2CD/CijFeHBpaWHo1jAYdUmY+yvqfIhJov1EO3rIMmPFeojXCnc1J
 tpzenSJ2Tu196ogm684gP+G4bGYUxP96snqq5Q5mosZyTpW/6e+Nztpxm9Lj94s8H3y0
 aqtAejHQPRiG1X5tv4Pf/rkEkBq871h1UmK3AqabhvnXWViV/5JcY4iy52Lq/xkkXmSn
 qWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZqP9zYtpRqV34OynQcsQDt54YpeUjGNeRtaiqprcIM=;
 b=bT4lu4bEy4cURa+GYcKAV04rI0mZ2nj5q9RmRnr2e2yXCQZazbIRyZSuBBwJjRBZSd
 KCCWvUrA9uK4Z8+AWYOov+skSjuIL8ejQ3eodliZeVczSGQz91QaJn3/u+K4UNfJkto7
 sx40oCVkc3o1TH1wXl6uwyLQYMkHk7t92f4YoIGZ8Es0zFy7/URoRyb81qC62XEVEiGn
 WNjdJu6oSX11HpQWL142ax+d8kqWQt/tFu1usqyKkZdnwVzCggUHjbPfIlvmL6ApAqQI
 1cXk2xK6zPkbY9jLymMduL+vQOHv4EpRzRwZaNC/dVnUR7AxjgWVoo86ep+PM4TOtKIq
 W7Mw==
X-Gm-Message-State: AOAM5302W1vcCQtzrTAuU6ilHDx7vznXuaCKC9oBjT8vLTvoDmHs1myk
 GnB8NAVN3+u/NafRuDWg9T4uRiXrW8SrDg==
X-Google-Smtp-Source: ABdhPJz+cYF58zXtdI49hnR9kF3buiUZDeRoix5PXkcCJRARvw3h21UFCdl6f5iP45SSvwNIxkSs5g==
X-Received: by 2002:a62:ce41:0:b0:519:35cc:3a7a with SMTP id
 y62-20020a62ce41000000b0051935cc3a7amr5033898pfg.22.1653675554692; 
 Fri, 27 May 2022 11:19:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 006/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
Date: Fri, 27 May 2022 11:17:19 -0700
Message-Id: <20220527181907.189259-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Convert SVE translation functions using
gen_gvec_ool_arg_zzz to TRANS_FEAT.

Remove trivial wrappers do_aese, do_sm4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 165 ++++++++++---------------------------
 1 file changed, 45 insertions(+), 120 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 37343fb2f0..c89c25166c 100644
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
2.34.1


