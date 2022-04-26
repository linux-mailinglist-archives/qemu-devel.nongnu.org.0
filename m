Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F55104FA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:12:25 +0200 (CEST)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOjg-0004XE-Bu
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8y-0002Hl-9S
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO8w-0004MF-Nb
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:34:27 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3017781pjm.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4dw0wU4hRrzI7CX28tAX+ygbbypPvm0F9qWYTV7tlw=;
 b=YGdso500f13kwaIq+1w+dTAfJ0zbpkcaGBnGSxJR2Z4F2LzYF1QS2YFQWh02iFBACX
 pD84iY0GsQBUyIqaOODVVcSr+RM0w3f+oQB05BDOr0qpqryR29FfKJpvlxGL92xD6Rdc
 X9GaAjlcvo3ChvLSv2qJMN+054ZKSw9W9vZraSELi02qsD6LPMngH5RjSLGsop2s9IEb
 TKTJKXm2ozheC8pt/IwJK11ESS61/zY3PIzFrVXBbRv012O0H/9kQGQLGWKOx4EJ08xl
 cue+vGGAkY4sZBYONyHxjm0fX9b4LyH7I3ZUG5uIQnCtR7l4GlXNUzse6zmtIg6UMK2I
 HpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4dw0wU4hRrzI7CX28tAX+ygbbypPvm0F9qWYTV7tlw=;
 b=aPkOchiLWXUHdK5pPcDQJTAJY/DYVWfMzJHsopMFf2SxLlexRdZyi4h1O9Pind6Bm0
 c/ZxTfbrNBpsDhyRht547oX0SEwr5xhy6w4Ph7HQFuemlfOLoJUgEa6uRVMoVCePpM1A
 VUlqcNGpxl9dc6Qg4n6yfjRoRqE3S3XGl6TURuOKSprjp27yipOh5JcJOE2uH1QuGGpN
 KIBMYxBSJH2xXvozJ/j6mnhC95a7p/UGxRwAsZcHZFI2D73CPobNGk7/wX5LjcdbaN+A
 NjI5kcFY26dqBvhyDI4ZER6mAs22+FIOUvIn4LEdpXTUKIn9GE96ntYTMrNXCAXFixU2
 adbg==
X-Gm-Message-State: AOAM531WAZxjA66k6CUKaNmsPqBoyIAvG9o2fkhUJIN7NdEtsTYkskNW
 +ZnZbFg4xYydE+3G7waPi65U8l0LqJJ4JA==
X-Google-Smtp-Source: ABdhPJyuZhb35oroEauYydrMdY/n5HpLU9TQ2DYGHKZMT4pFFBKPaJVNTGT0RgxAXUZikfG9Gi3+FQ==
X-Received: by 2002:a17:902:bf0a:b0:15c:df1b:f37d with SMTP id
 bi10-20020a170902bf0a00b0015cdf1bf37dmr19018074plb.90.1650990865408; 
 Tue, 26 Apr 2022 09:34:25 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a17090acb8d00b001d953eb2412sm1132834pju.19.2022.04.26.09.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:34:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/47] target/arm: Use tcg_constant in SUBR
Date: Tue, 26 Apr 2022 09:30:39 -0700
Message-Id: <20220426163043.100432-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fcab15a6ec..92339a19e3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3830,11 +3830,9 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
                         vec_full_reg_offset(s, a->rn),
-                        vsz, vsz, c, &op[a->esz]);
-        tcg_temp_free_i64(c);
+                        vsz, vsz, tcg_constant_i64(a->imm), &op[a->esz]);
     }
     return true;
 }
-- 
2.34.1


