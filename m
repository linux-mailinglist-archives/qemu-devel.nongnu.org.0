Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C847332E0F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:18:22 +0100 (CET)
Received: from localhost ([::1]:60574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgw1-00046S-LD
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8D-0000hJ-EW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:49 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:43016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7x-0002qS-M9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:49 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id x19so3164881ooj.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebb1J4U0PlPdNLq+xM9aspyyU60NgXV87zexXZC7NNM=;
 b=RQBvFspD+gvwA1XfZNvOAMkIjd3qJEb0rUBQkZ8Fx8mnSkTFHgnz7wEHSruq1VHoC8
 +0kVGGf5sVhB0iwNqUI7M2gNv1hee8JhPTUVUnOWj8RQbx/Jg25X4vMDAEL1J5TP6v2R
 93hiROeVudEj7IEF/hcYR53KPwYQeZlmnu7kIb/sOzdL9J/8u6+FdpWmGhHkqbTKjN65
 48MYQzQ0i3OMAeUrrHC8py6Iv0rvvHaPV3RxcItqB/ks4MxWWTe+k///bVeJV7VBVTUQ
 iHOpvxE/NDYgyEW7X+U3tRUn/ZLSqv+5QLzJRdmD69t8WdjeAihw/Cyu+Bu4krQ3ZTHF
 hGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebb1J4U0PlPdNLq+xM9aspyyU60NgXV87zexXZC7NNM=;
 b=JFAnEJFrWwm4E8sdclP4TpJ1+5UMStyPMuMU/pAxh6NFvpiDYDSSf27tpmiYmbvN9o
 FhR8M7mGQL1U09GkTvC2Qa6Im5vZbcMJr9J3lPCVg+KQzj2uAvboWVlC+Njunh1uGs2t
 ASVkiEn+A6tIVOfkrRe1UrObfBruVWIj/BWllYrqH/ZmuptcBnyMUOxRc2tnCjdYDcMe
 TKXEh7+Kd6zFEugOlZUtQECTgiwpXvm1mwRCDH0ols0rJKTUiYNCXWob/Vsml6LUIZOt
 CrfDO9SJCzLvWOAIj+OJL9RStocRW3cA9vEkI5LoPsNTmAHBhxAKfXZR2UKFR3UaoztP
 Z/FA==
X-Gm-Message-State: AOAM532qWvxQhMXgqbjSo1xdBJ0BAen1LH94XoYZzGsZWGD21a3wc2px
 YiRKN+Zre6+mK39IcAhtDluDtu6PqtgosDqR
X-Google-Smtp-Source: ABdhPJxoMK0Oe8jbCN2VxLOLjxzKqOtuazWrWx9hoIheY3+usv34B4qli5fXLWR9AAGMJb8BE0MwMA==
X-Received: by 2002:a05:6820:3c8:: with SMTP id
 s8mr22820856ooj.49.1615306946483; 
 Tue, 09 Mar 2021 08:22:26 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 64/78] target/arm: Implement SVE2 crypto unary operations
Date: Tue,  9 Mar 2021 08:20:27 -0800
Message-Id: <20210309162041.23124-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6c4002de60..b161334e93 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1551,3 +1551,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 23ffad33b0..f61e6ff6ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8123,3 +8123,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1


