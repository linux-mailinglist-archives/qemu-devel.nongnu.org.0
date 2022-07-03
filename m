Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8656466D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:32:06 +0200 (CEST)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vxU-0007E6-99
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzP-0001Bi-UT
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzO-0006iK-FE
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id m14so6034713plg.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFacPIEDusd1hE7rtQmwmoagq5wzcnFBcC4AqTaOWD4=;
 b=rI43nmAv8FKAGO74g/+4inYLf8AMbBUR5jA9m6gi3h2SBv1sc0QKicyPKe2PEN+jSI
 lc8DCPbKOXtnIcJxAqff2KTk9fXdAfosMoUEMmpw67MymbnKKlnvAgMr9i1pt10VLnp9
 wHUx8zAwCGkY5xbuLs1hORXajB5rzdQiJRvNg2p2BeTMjMlklrp1N96y8RlgPREV1ssq
 l527MWQZ8kDvPg4rbrY6KNquU2N/t8PbGvvg7uSFlUKVMrUITFIZ6huoYkbY3MZT3x1N
 2ZPHZPUfDFgDWWiYAODAACDAGAkpzt7ZOszi/N6yWtgQAF7GAzGcn3i2JARTufcUIJQh
 Sipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFacPIEDusd1hE7rtQmwmoagq5wzcnFBcC4AqTaOWD4=;
 b=49JuQ4Ozwmhh4eMpOLum5GQwFrPi71SIGyONVFRu+7KHsEdYPkcJ9HjF0KNvuK/qJV
 fiUgQSBm5x7jaoPVPTmrsZT47uiWrYzxJZeV5xMfG3NSdNqDkEIBa3kFlFqSM0F3SADC
 bhwteYI3iC3SjSWXYqt1mBrC7FpZgkyoeNwoJopBzDln6o02xicZ3Uzk9LRnGQcLCFY/
 md99LsoD8aL+4EvVCrFDb0+YdnHdotaT94C7AXMEFcJvJ1R3e+AP8Q7vnXlLJ+2RLF0G
 VIupqTEt5dyuas5q2HRU2dscfxnDiPhLFstd+rKiOmcJ3fdJXReZNBI2C/px5dT6oGye
 y1yg==
X-Gm-Message-State: AJIora+a7BnXq+Df3BG7ZR+/GxMetsc0U2aATDKFGTMAShWzDw/fBH0n
 eG0862iOPK5H1+nGEWeaivE4P4wp5Sp9upTZ
X-Google-Smtp-Source: AGRyM1uYJzSjUGtkUoq3PeOkNbAttOx2pPjjXZPwfC3VCos9PieDWAi1gvEA7tT+tIthiPROQfhEzg==
X-Received: by 2002:a17:902:c402:b0:16a:5204:3066 with SMTP id
 k2-20020a170902c40200b0016a52043066mr30085987plk.126.1656836997241; 
 Sun, 03 Jul 2022 01:29:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 49/62] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Sun,  3 Jul 2022 13:54:06 +0530
Message-Id: <20220703082419.770989-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 993f015904..a2c441d947 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2376,7 +2376,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                     fi->type = ARMFault_AddressSize;
                     fi->level = 0;
                     fi->stage2 = false;
-                    return 1;
+                    return true;
                 }
 
                 /*
@@ -2397,7 +2397,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->cacheattrs.is_s2_format = false;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
@@ -2408,7 +2408,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
+    bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx;
@@ -2486,7 +2486,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                   (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
         }
     }
-    return 0;
+    return false;
 }
 
 /**
-- 
2.34.1


