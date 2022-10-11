Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5D75FAB3B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:37:06 +0200 (CEST)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi64n-00055U-Ln
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o0-0002YJ-Me
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ny-00035A-UH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id l4so12014771plb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=keRR6yp16j9BQA6bMnZFN0sAd0rexZw5HE86te+F334=;
 b=yp2y9LT3fCkE9987AaqC42D7jjLT5NB4f6cIg0JcVGw7PjLIKgXPbHg57zKskmT0J4
 3C0+Ix6vsGMnyIRHStyMeYlCoQ3bNARz4tIwdVITumzoy+PbFQWY1zX8vqSGy665inCd
 NauQ3ipTgCY5wA1Mc4AbvVkjxN+HrYFkbyL7ZtppYHxUY4URZD0HR36bRAeFPYoNdk8B
 BxhRTinOW24HlrXt9ZKKcu62D1UctqMdsAg5yRJGTDEhyejB+dpOTDXMYmaiU6PDa53y
 SYQD2fLk1bRptLhqD9mzQc4xbFCu6HCbx+KIFBAbR+qkbuo/GsdqodWkY4s8PsYvluKk
 4/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keRR6yp16j9BQA6bMnZFN0sAd0rexZw5HE86te+F334=;
 b=X1UP0SDEkQfdroovxmG5gy7gfsZEVkFhGQc+XJfQ862rA0zxYD38OzFm5pzlZtRzbN
 MvPi4dgKqUcqgcMTEmIt4HRhMo9lE90DLEC5JzPwmmTTMW1tW0QH6uBTpKnjh4tsti4E
 bDjpHGn2W4AUNqhafWAAJqPStxqLqL7Z/bPEaOuaHGNYTD6esOR1TRJr1PhowI7DADGD
 5WfAoopxQSUGlbB4gcszhIrZPtclFwH3dQ+OQqjEukI2L/GmUEREYuXtdyJOtncAYhPP
 HAfklO2RjJWB+8ySvUfHOnc8pfcZ8EGUR3Q6/tfChTAhh+s9Kid7PF/Biie2P845P0Zs
 1wgA==
X-Gm-Message-State: ACrzQf3JKzMkDN8SjtgFdUvKHTFj9Cc3MZvKzx77oLazAHbI7WoTxFIR
 lrcVlc54u60ModVznlnmrN7FciqVqwgUQA==
X-Google-Smtp-Source: AMsMyM63LOkvKkzneYAmyAIKGJCOQRaItt6rS82PwUUwhb5suq6o8aFe6It/WxV1s40byz1AqXsw2w==
X-Received: by 2002:a17:902:f644:b0:17f:7f88:5f47 with SMTP id
 m4-20020a170902f64400b0017f7f885f47mr21873347plg.123.1665458381354; 
 Mon, 10 Oct 2022 20:19:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 15/24] target/arm: Extract HA and HD in aa64_va_parameters
Date: Mon, 10 Oct 2022 20:19:02 -0700
Message-Id: <20221011031911.2408754-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..76ec7ee8cc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1041,6 +1041,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..4487957e5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10581,6 +10585,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1


