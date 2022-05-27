Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0B53675B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:11:10 +0200 (CEST)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufMb-000050-68
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYn-0007aX-43
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYh-0003eW-DR
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id bo5so4993072pfb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHNpAw9EjAAEi6vEkKb3dOiSHgbppKaP06mHfmvGup8=;
 b=srjFzTpTZZTc9FLhIJhFO2xDvNLjWqskWVoKz1P47MJ1AvIO0bpOrTvPzQ382ylyRV
 dRFuMKdEW1+FClEVlcBVx97F9S+PwBWJcx81ODI2kxstc6/o4u+UIG4J+284cL8Wp9WQ
 Y2qCTlsQfNWII7XfShp8P7Gm/Df6VU6nuDhfYaczojnxwozj6TllofD7k7unGIMzlSpE
 AJ7JLwxLMVYAi3mGyTCvui1CU63Czjdq9Jhj6DJxtOjjj0s42vtoUFz5XGvO9wGz7DFw
 hDUFSMFhJtrgL2TkPXLvTCdOJhiXHpYLSwfOc5VE6xq/Ueve7ZhP4tWHm9CWPEiVZNUm
 dHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHNpAw9EjAAEi6vEkKb3dOiSHgbppKaP06mHfmvGup8=;
 b=Cp1pqv+o7AOVYpwKqVeIYswn4EeBIcW5C1sfkJcj2GQ3BTXTTfTaRjlSOeg2CAeAnS
 p2SU7+jQrJWA6Y7DUGQlCD5ycMMyDE+NanGg4vgHuW8fRmQvoal4TWi4haqk/yd52JCS
 wDXs/jTs0h/RtBDAAf1iwhdIWFhIKiZIOmf9VNCJPue3fc/dLNEPOPjYXby6DosFvbel
 IHOyo/nv7LJViH9g+A94HaPmip+RwBJrCApoVbZSgoRTUMHM27WDl3UZdJtBecRN9FCK
 zb9hicBGaaYCk/+1qKII/WVb0XZdQZOgsYxkO+Tp2h7GrED5kNDmbFVCoGRCNC/McHae
 qDJg==
X-Gm-Message-State: AOAM533CdwDdREv9Ujx4nK8jp1stGiQCTyrgJ4BOxaZi1vRYiHmaipyO
 zmzK6uH3jYuJLzpKN4ZgmPeAEmE4dURCXg==
X-Google-Smtp-Source: ABdhPJxLt7+vcKZuyv4OGiRYewroNZMEy4dJcgUJz30qKpUwXlTPcuqqhwg2lL6g04jBpqfdHr/Usw==
X-Received: by 2002:a63:1163:0:b0:3fa:5e1c:f86f with SMTP id
 35-20020a631163000000b003fa5e1cf86fmr21997725pgr.543.1653675574164; 
 Fri, 27 May 2022 11:19:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 027/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
Date: Fri, 27 May 2022 11:17:40 -0700
Message-Id: <20220527181907.189259-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Convert SVE translation functions directly using
gen_gvec_ool_arg_zpzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d63099c5b7..f8277eeb7c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -755,54 +755,46 @@ static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
     gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
 }
 
-#define DO_ZPZZ(NAME, name) \
-static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[4] = {                           \
-        gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
-        gen_helper_sve_##name##_zpzz_s, gen_helper_sve_##name##_zpzz_d,   \
+#define DO_ZPZZ(NAME, FEAT, name) \
+    static gen_helper_gvec_4 * const name##_zpzz_fns[4] = {               \
+        gen_helper_##name##_zpzz_b, gen_helper_##name##_zpzz_h,           \
+        gen_helper_##name##_zpzz_s, gen_helper_##name##_zpzz_d,           \
     };                                                                    \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME, FEAT, gen_gvec_ool_arg_zpzz,                         \
+               name##_zpzz_fns[a->esz], a, 0)
 
-DO_ZPZZ(AND, and)
-DO_ZPZZ(EOR, eor)
-DO_ZPZZ(ORR, orr)
-DO_ZPZZ(BIC, bic)
+DO_ZPZZ(AND_zpzz, aa64_sve, sve_and)
+DO_ZPZZ(EOR_zpzz, aa64_sve, sve_eor)
+DO_ZPZZ(ORR_zpzz, aa64_sve, sve_orr)
+DO_ZPZZ(BIC_zpzz, aa64_sve, sve_bic)
 
-DO_ZPZZ(ADD, add)
-DO_ZPZZ(SUB, sub)
+DO_ZPZZ(ADD_zpzz, aa64_sve, sve_add)
+DO_ZPZZ(SUB_zpzz, aa64_sve, sve_sub)
 
-DO_ZPZZ(SMAX, smax)
-DO_ZPZZ(UMAX, umax)
-DO_ZPZZ(SMIN, smin)
-DO_ZPZZ(UMIN, umin)
-DO_ZPZZ(SABD, sabd)
-DO_ZPZZ(UABD, uabd)
+DO_ZPZZ(SMAX_zpzz, aa64_sve, sve_smax)
+DO_ZPZZ(UMAX_zpzz, aa64_sve, sve_umax)
+DO_ZPZZ(SMIN_zpzz, aa64_sve, sve_smin)
+DO_ZPZZ(UMIN_zpzz, aa64_sve, sve_umin)
+DO_ZPZZ(SABD_zpzz, aa64_sve, sve_sabd)
+DO_ZPZZ(UABD_zpzz, aa64_sve, sve_uabd)
 
-DO_ZPZZ(MUL, mul)
-DO_ZPZZ(SMULH, smulh)
-DO_ZPZZ(UMULH, umulh)
+DO_ZPZZ(MUL_zpzz, aa64_sve, sve_mul)
+DO_ZPZZ(SMULH_zpzz, aa64_sve, sve_smulh)
+DO_ZPZZ(UMULH_zpzz, aa64_sve, sve_umulh)
 
-DO_ZPZZ(ASR, asr)
-DO_ZPZZ(LSR, lsr)
-DO_ZPZZ(LSL, lsl)
+DO_ZPZZ(ASR_zpzz, aa64_sve, sve_asr)
+DO_ZPZZ(LSR_zpzz, aa64_sve, sve_lsr)
+DO_ZPZZ(LSL_zpzz, aa64_sve, sve_lsl)
 
-static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const sdiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
+};
+TRANS_FEAT(SDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, sdiv_fns[a->esz], a, 0)
 
-static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const udiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
+};
+TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 {
@@ -1068,17 +1060,12 @@ TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
  */
 
 #define DO_ZPZW(NAME, name) \
-static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[3] = {                           \
+    static gen_helper_gvec_4 * const name##_zpzw_fns[4] = {               \
         gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
-        gen_helper_sve_##name##_zpzw_s,                                   \
+        gen_helper_sve_##name##_zpzw_s, NULL                              \
     };                                                                    \
-    if (a->esz < 0 || a->esz >= 3) {                                      \
-        return false;                                                     \
-    }                                                                     \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME##_zpzw, aa64_sve, gen_gvec_ool_arg_zpzz,              \
+               a->esz < 0 ? NULL : name##_zpzw_fns[a->esz], a, 0)
 
 DO_ZPZW(ASR, asr)
 DO_ZPZW(LSR, lsr)
-- 
2.34.1


