Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D956465C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:16:41 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7via-0006W8-Vg
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzS-0001O1-OK
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzR-0006it-4h
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y141so6343913pfb.7
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbIrVuD695ihfGEi7s3Q8RXV9zhlhUlzREnUxvNfINo=;
 b=KIWcNY28+3vKor2IVOk2aqpth0VSI+bnjY2HxJ+/8WhEPB7mSOPTdpWv8LWUjBfIc2
 GeQclk9nWaVZc1OPV9maH9GTBYR9Cf+o218g1SmVDAgO0nRVyexs4Vu0rM0lgDgT4lPJ
 n4FT46PigOq2Q4VrsEHgGKwfX4P9Va6bpCDDj6HCIvKOw5XcNLHHBlO2YWUoDXHdT9C2
 tfF2q2PC8eC13PzB0FTBi9sTYIDtsdtCMTirS5AR9BxJrS714/xWrd/u/Y9AWVY4MDix
 Br+u1Io3Wj/c8zDxanx5lqv9psqEd67yjuAMPCHS0itj0CyqXk7nDgf226/Z9p41QZUE
 0vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbIrVuD695ihfGEi7s3Q8RXV9zhlhUlzREnUxvNfINo=;
 b=uGRaixYqNo73CqnGE0FnqO1422hOAk0jApml2uGoTJyAfgP5do40YOCVujhVdI2+yP
 VJM3A2cv9xEzgXnxiOmiB3GCvVzCUuGf+vjdo0FY09UsGsg/nGtfDIEJkZhDqZq8OsSz
 HyVkMdRviB52mcsz27ISDEk25d4vdi5KQwe5juOOoaqApo/eLDGMkw+FCypwnO07TZm5
 9U1wvKt6iiK7DUZKEo2y9LUov3W/qX589BHyPTDaHyUBagh0Is2OFTm34r4NpvtyxcLY
 zMPMxlsiluatRfsIsLV5VTcg1MNLDya7pCdCZrgvib+7EsJ/2IhFTxXtzcwhAoUoAsL8
 hXUg==
X-Gm-Message-State: AJIora89yAYtqDL+fcJqIKkGlZGzBMrikGc1UzQG7kkdZERE0uwJlWJc
 OsVzGuEOlLQCPTcU4vDQgOWTmL0p2WHGoZy3
X-Google-Smtp-Source: AGRyM1sU92o/Gzd5aqE7gPDG+5Z+QhLfvnUUyrE9RAKc5WUYZzMggBkDVEgc1G90OvgpL/HsG9EJAA==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr29033198pfl.40.1656836999819; 
 Sun, 03 Jul 2022 01:29:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 50/62] target/arm: Only use ARMMMUIdx_Stage1* for two-stage
 translation
Date: Sun,  3 Jul 2022 13:54:07 +0530
Message-Id: <20220703082419.770989-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

If stage2 is disabled, we do not need to adjust mmu_idx.
Below, we'll use get_phys_addr_lpae and not recurse.
Adjust regime_is_user so that it can be used for E10_0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a2c441d947..e42286b4c1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -90,6 +90,7 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
@@ -99,10 +100,6 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
     }
 }
 
@@ -2530,10 +2527,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
-        /*
-         * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-         */
-        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1


