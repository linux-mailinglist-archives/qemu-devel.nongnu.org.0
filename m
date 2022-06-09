Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E7E545620
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:05:56 +0200 (CEST)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPLn-0000Ua-CA
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmX-0004Hk-19
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:29 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmS-00007y-Tu
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:26 -0400
Received: by mail-pf1-x42a.google.com with SMTP id j6so22008061pfe.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odSylXA2XRBD0oTe2Ed3JfqFz439C4lE/Ju+M7CRV9E=;
 b=s3WJ8EPB6vmK1cLVlBRzxg1KDbZ1KIK9Wav1PynJGapIlLproIJwNOK39qR3M2PNZX
 0Zou14sdBtRNK2el+iZ8VU4EQ0fSA0m5/iHBVl9W2fTJyd2ojpfnNIenhjHLoGAA+4V5
 WqGbkvvO8PnZoihF+f0Ip50XT+L1gaT/mQMoqeonQ8SVUCjJkOD1scKS39PPhv/IZazc
 pMygNIkGTSc/3dh4J8S3kuEsxwWh/A8M+7rLrqA3xJBrB1emzfi4kL9jk3KngEXKciqH
 pgfv8PkfNzR31C5JV73l806rGyrv+pAoMP6/kWz2ORhP3kqclEnBCixXcCJ0sgaJV9TJ
 qWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odSylXA2XRBD0oTe2Ed3JfqFz439C4lE/Ju+M7CRV9E=;
 b=CUfyo/U4Aj7+urUiUkgTEzMb+vXm2xPsVIychYSt++LTlVvgATp0DTkvJpwnK/zx9D
 5K1AP20ayH971H4JBGK7JLTfilRvJk2qaEbPVsyuE+yBrSKNRQyRCvkeFL+3olt3E87Z
 48SI0Nj17u8jBu2LsWpo5H2OhBmLAxZRDWhfCr1slGkmsuLFjNFrz1uCAB4GznY4F9vJ
 vklTcWBW9sXgSGKIeh2ubLru615oZJ6S50XGKnxDuIh5+BDicWAx8Cx/SieusIkoyHVb
 uOCTqkL18zjBaR9F5QzaphnUXkULWEnOUi7mCn3b+MAO7rzqwzh/sAdeRpyOhcjmDDcg
 TGFA==
X-Gm-Message-State: AOAM530/8sjOeOzKdqmtWT+Tkf5093YMRdxTIP7pFdzksZSYNwtaJAYR
 3FgfIahLgaN+gbij8XVlSY5GFlrhXmRDQw==
X-Google-Smtp-Source: ABdhPJzNIAJucNwoF7LXhj7KDw8FhJbULBy0V+/XRLRQz0l8B209N/SwiPywj1fZIXcvWXAPyvOdKA==
X-Received: by 2002:a65:644b:0:b0:3fd:d5d5:8c7e with SMTP id
 s11-20020a65644b000000b003fdd5d58c7emr18319992pgv.590.1654806563562; 
 Thu, 09 Jun 2022 13:29:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 23/23] target/arm: Fix Secure PL1 tests in fp_exception_el
Date: Thu,  9 Jun 2022 13:29:01 -0700
Message-Id: <20220609202901.1177572-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
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

We were using arm_is_secure and is_a64, which are
tests against the current EL, as opposed to
arm_el_is_aa64 and arm_is_secure_below_el3, which
can be applied to a different EL than current.
Consolidate the two tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2b2c1998fd..b95aa53474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10879,27 +10879,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         int fpen = FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, FPEN);
 
         switch (fpen) {
+        case 1:
+            if (cur_el != 0) {
+                break;
+            }
+            /* fall through */
         case 0:
         case 2:
-            if (cur_el == 0 || cur_el == 1) {
-                /* Trap to PL1, which might be EL1 or EL3 */
-                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
-                    return 3;
-                }
-                return 1;
-            }
-            if (cur_el == 3 && !is_a64(env)) {
-                /* Secure PL1 running at EL3 */
+            /* Trap from Secure PL0 or PL1 to Secure PL1. */
+            if (!arm_el_is_aa64(env, 3)
+                && (cur_el == 3 || arm_is_secure_below_el3(env))) {
                 return 3;
             }
-            break;
-        case 1:
-            if (cur_el == 0) {
+            if (cur_el <= 1) {
                 return 1;
             }
             break;
-        case 3:
-            break;
         }
     }
 
-- 
2.34.1


