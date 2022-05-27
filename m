Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EA5367F6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:18:29 +0200 (CEST)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugPk-00068w-Bn
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefj-000209-Qd
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefe-0005MB-5Z
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id j21so4555595pga.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXs4KxlVAWW8+RgYn/YknaXv8pQTUABwGWD2au3w4Q4=;
 b=B7eNq6vx3uovoWiGkD0BUqqNhK+PcQ/toJlZREiuSduw8TzrI5KirGrZTToIAftV4j
 1gQro3lat4qSTAd+r7w/tkanStuv0dVchqSmHTlI4R1mH/awoYKSfBkTsfIMDdbTrhHq
 oGkHT8JzPutryZnZiLwffECh81FUDp06SUJcnIlTqoKdIwoSRN1m7+kWV2JtBhw71PQv
 XmIv+aez4HSkij++/aIYRDv2A3+nE47S88FaccTz5Grbvp6F7kCzAH+gnYMrDPeAkc22
 s/cweWP7Vso2inkrKYpuPq4UsbPnoZk/4ut2+VmF2rJyg+ZyVCS+1BIeVy+ECeiPfH04
 +RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXs4KxlVAWW8+RgYn/YknaXv8pQTUABwGWD2au3w4Q4=;
 b=thteJHf3+3p5yOWaXM7vNMzRdLkK97JFl/jNdchUD228cbbjfGaZrxLfLoy1bvYJtH
 dN/Jke60m5xMY4kz3bZZfva54Jda/vr2gIGNbi81KSq4RrV/DxC8lROwnuiP3md1SEWI
 XEYIzcjZbcCRFX1CuzdEKWMkD9s8UcC66Zkz0pDaXifTFAc/F4WUI3YE/UbP4TjV7R+6
 IHuaQ9Zw4/o9gQGHD72Eirq8VluRimzAQqy/E3OwYl/6E/BI4TxJiDP3V0jUDRL7KNN4
 ZijmW2YZSTtKyu0/ew/HUzZ6+ELYz4IudTN343TA7W3l6OQvrk+jsmtEjdLqMgwkjbzc
 0ClQ==
X-Gm-Message-State: AOAM531hO8wk/gwFavnCK9Y5ohmrde6n1o/cLEuKYA0pNLcd53KsSomm
 V7dbLf3K2y/KvK65+ReUs2D+c9r6E3lD6Q==
X-Google-Smtp-Source: ABdhPJyav3prroDNtalowr0JRKl+lPmadENowwOt+9cWiyNmZGYyI7NbvLqwN5iSYXbKJfYGrtSyPg==
X-Received: by 2002:a05:6a00:c85:b0:518:b4a7:cce1 with SMTP id
 a5-20020a056a000c8500b00518b4a7cce1mr23319115pfv.66.1653676005357; 
 Fri, 27 May 2022 11:26:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 103/114] target/arm: Move null function and sve check into
 do_fp_imm
Date: Fri, 27 May 2022 11:18:56 -0700
Message-Id: <20220527181907.189259-104-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 75854a7c6c..b47d5d7f21 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3911,33 +3911,34 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
     tcg_temp_free_ptr(t_zd);
 }
 
-static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
+static bool do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                 tcg_constant_i64(imm), fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                     tcg_constant_i64(imm), fn);
+    }
+    return true;
 }
 
 #define DO_FP_IMM(NAME, name, const0, const1) \
 static bool trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a)         \
 {                                                                         \
-    static gen_helper_sve_fp2scalar * const fns[3] = {                    \
-        gen_helper_sve_##name##_h,                                        \
+    static gen_helper_sve_fp2scalar * const fns[4] = {                    \
+        NULL, gen_helper_sve_##name##_h,                                  \
         gen_helper_sve_##name##_s,                                        \
         gen_helper_sve_##name##_d                                         \
     };                                                                    \
-    static uint64_t const val[3][2] = {                                   \
+    static uint64_t const val[4][2] = {                                   \
+        { -1, -1 },                                                       \
         { float16_##const0, float16_##const1 },                           \
         { float32_##const0, float32_##const1 },                           \
         { float64_##const0, float64_##const1 },                           \
     };                                                                    \
-    if (a->esz == 0) {                                                    \
-        return false;                                                     \
-    }                                                                     \
-    if (sve_access_check(s)) {                                            \
-        do_fp_imm(s, a, val[a->esz - 1][a->imm], fns[a->esz - 1]);        \
-    }                                                                     \
-    return true;                                                          \
+    return do_fp_imm(s, a, val[a->esz][a->imm], fns[a->esz]);             \
 }
 
 DO_FP_IMM(FADD, fadds, half, one)
-- 
2.34.1


