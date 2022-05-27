Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F5536785
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:34:08 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufil-0006iY-9w
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003c4-Ts
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004RL-Gf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id x12so4560796pgj.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOVNnulMY9/cI7p7C/1byK8K0DnOS+U6K67oQeWaeLQ=;
 b=ikO8/36AV7pPnNzZCIXZObumHQrq24CqYwtqsuNR5guYElIIBKyVT76YiiKnqazcaU
 odDJg4N9qseBzQb/JeA+SrZO3FkkQxBDKO0IFNik7PjTD9GeoouhSsiJMgwel+buANpM
 n5JsW82rwDy2NPgb2aAx+92vOaI/qZNWNc/Gw52OON5ONXHGiAvCQL6mgxbqqmYZh6Lc
 awH8/gf8eU18ATaK/WiCH0dk4AtSo5i75Zj5e5b1BsDwA4paPBZccQPd47MJPHN0dSr6
 Cb4YlGer0K9FcqFL0+bAkOPkxU2UzVwI5mkJsV+W21y6lnx5RqkHU8NwGQDc2ANCVh9k
 qPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOVNnulMY9/cI7p7C/1byK8K0DnOS+U6K67oQeWaeLQ=;
 b=hi0A8igCq06YQGTiLEYLlTqaGGbSS5EzbuF7xtiazoMd+kOP2fJsQ/zpZlJXOv+Ppy
 n02rwLi27LSTq0Mth1C4Eon/uonX52ejGtFMFx3M/Lm8tej11Qwi4LCdysSb/q+Jhvky
 ShYfC0+6NbaXSiZnCDXO9Svgk3kDOVT3T0LPMFtv7NuHgV/AeTvxC6tPNrXaLOiihGbp
 /JZCstgq0f3/Cx9tHA1fXRRvXnRXvyqiliC6Hg+VkRT7qKboMfDPdJcQWBx4RuyV0OsG
 J8qAVbJEmfVzBm7IyQ3V50CJhFOU+/s4qlK6q7/bXkLGuBOZH979ZN5u1c+xLEvFwpRF
 33aw==
X-Gm-Message-State: AOAM532+BBRwZSE9WRnrleD14KpK8kGGHyApfuqzvNPwHRp9gPfSjYKa
 TSRib9FqqTYN3VHromh+tBhmQPM52QjD2w==
X-Google-Smtp-Source: ABdhPJydE2lnOXAWSKW289QWAaSv5QzSrfh0OEOdGjmoDF26oKqQXhzoISefOj9y1/hn2jm9Urt0yQ==
X-Received: by 2002:a05:6a00:14c8:b0:518:7789:d33b with SMTP id
 w8-20020a056a0014c800b005187789d33bmr35640010pfu.36.1653675784707; 
 Fri, 27 May 2022 11:23:04 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 060/114] target/arm: Use TRANS_FEAT for do_clast_vector
Date: Fri, 27 May 2022 11:18:13 -0700
Message-Id: <20220527181907.189259-61-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7c9deb267f..5135866798 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2492,15 +2492,8 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, false);
-}
-
-static bool trans_CLASTB_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, true);
-}
+TRANS_FEAT(CLASTA_z, aa64_sve, do_clast_vector, a, false)
+TRANS_FEAT(CLASTB_z, aa64_sve, do_clast_vector, a, true)
 
 /* Compute CLAST for a scalar.  */
 static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
-- 
2.34.1


