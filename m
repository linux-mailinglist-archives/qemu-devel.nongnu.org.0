Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D856B814C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnO9-0001cq-1Q; Mon, 13 Mar 2023 14:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnO2-0001bp-CW
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:59:10 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnO0-0003X6-PZ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:59:10 -0400
Received: by mail-oi1-x231.google.com with SMTP id bi17so10184732oib.3
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678733946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTMJ+SrhxZD4DKXmnrOsTcVGLhAtWwxOjLuwczOyqDU=;
 b=cCvYtFLbFts8HhwVpsz0wVhGEpdonvapAu64bNoZUPXYcR1AFghs/QpldkgDdJLm+x
 mT2W6Y6IyO2trR43fOSWREf+Uk9gkHS9WSTl7AForemh82ASB3W5IJ+7LgGPzvZI6fPl
 f7+PuoOcGlk1mf/zEHRoCb6aFK34oomsROnt0ZPY9RTSf4XK00Shbce6eGQaxzNTFfDl
 3FoapUFTv/p08+uLj3H2pieydPuYKblDsJGz48jqEKMgY+uJZBhFaTTRMq/++qZIEGKO
 IWHwynWsUvTOeW7T0+RKqBRFqGqyCqcTHGrrpiEfAwuRR6gRcUkAzzglC1tE1gF+9+Wk
 23mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678733946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTMJ+SrhxZD4DKXmnrOsTcVGLhAtWwxOjLuwczOyqDU=;
 b=MXWCWI5bX+UYd27dhiAYTuzKJIQGqhXyurCFcSztp9vMC8fOgj4LOZEgAA+pHhuYWv
 Ndorh8j8L1VEbyWaRamgEM1DHAph1m5t7K+FzqIvIAEmFpAdyv0ZhVVoKBJTrIP0Jxm/
 fWq42VnQ6Tt6Fji2Km2NHuZL0OIXA48/u0dCNrpla5EObVabiZCykh2owwsd0QO9O10W
 yqlRXxI4ebRdSyEwk78wJwHH5j8KVw9oM+VKcr8k+RYr2E6G/wHE8SuRCrRYbkQ2DdnR
 26sJ0oYqeX8PdjCsqGLfjeWS9FZsDs/Ez+52TgisVB7UyebT2bnuM6CV3NSFUEy0l4wf
 9MjQ==
X-Gm-Message-State: AO0yUKVgOLGPKo6nPak4WxWQqD0B2aqUuApxJowjGm4ESfP8HrXT0kX9
 Nlfj2VEqhWpPySbx/EGSF8evjtKnXmfj20S3Pp4=
X-Google-Smtp-Source: AK7set//XSYbKLjEBY+OZR62kiLOr+GztVAsCbx4aBjX3o+KwEC4WTBKmx03VbODFR0wKJ8ntyRYqg==
X-Received: by 2002:a54:4005:0:b0:384:10dd:41c with SMTP id
 x5-20020a544005000000b0038410dd041cmr15747467oie.49.1678733946689; 
 Mon, 13 Mar 2023 11:59:06 -0700 (PDT)
Received: from stoup.. ([50.232.40.61]) by smtp.gmail.com with ESMTPSA id
 i30-20020a4a6f5e000000b00525ccc4caadsm245044oof.4.2023.03.13.11.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 11:59:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 73/91] target/arm: Improve trans_BFCI
Date: Mon, 13 Mar 2023 11:59:03 -0700
Message-Id: <20230313185903.400351-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313185903.400351-1-richard.henderson@linaro.org>
References: <20230313185903.400351-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b70b628000..2cb9368b1b 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,14 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
+    store_reg(s, a->rd, t_rd);
     return true;
 }
 
-- 
2.34.1


