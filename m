Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AC564616
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:07:04 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vZH-0001th-4h
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzK-0000rM-7a
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzI-0006hQ-Jq
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:53 -0400
Received: by mail-pf1-x436.google.com with SMTP id a15so6326921pfv.13
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vebk4kjBIMxCcXUePIuYSzzVW8J2WXPtrvs+wC4TX+s=;
 b=DEhuURVFVp7EJy07GV+ATk5or0qjnXLt86dCkaD+KMmloXjISNYIWkk7YxjN7VnCu8
 3XFCoUKNcoYPrOCAm/4+Hf3lc5a5se4B9DXNsliokfGzqsATDty1uHTCmg/jHormOrHp
 xvfoe/oy37lWZ38vRSZDCGdeqgdx/CxZCzkuogwofxFcP4U1Z07Ri8g8WKvSDLcrFRnb
 NMc2RCuzrBU2mm/TCEeI2DBBi/zDhgkv8rh408CdUFqBQ1grpkO1JBiY21t/oHb+exPG
 qfXjRbRFhNzidMHmQjnP2RDQIpXrlHoAgCrfAj4FV0zS4L+c6Ht6Q4ELF3su/0nxNQ6o
 pB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vebk4kjBIMxCcXUePIuYSzzVW8J2WXPtrvs+wC4TX+s=;
 b=fvf2vY9R918D7KBJW59J8f8Oy07JrUvAYZQ6V8Ejak4Bd49kA1Npux969KNtp91hkf
 qUCDHBkUW3+G1u0BFYdfdZWEBbrvzhbMTYWEMBf+VxkW22cVxEI5ydA99GBWMN4Eqplt
 FQHqXlU2sbzaZm6jdNC4zzrjiiy61TPqP6HS9VVosU1PliA4UjhFNcdXacae8YcveIe6
 C0YYH/apN6RzP25anL4JKwZJ4ymEKdI+oprRLRikDE/dvxiSMTsdXXEBYOLl9twc0Ohn
 06YjpECfA+HdbSupyTWqE76Q1lMONkrwM8br56OCHU5VVT1xkmME+vlVDUu6B1t0ODqX
 l8Xg==
X-Gm-Message-State: AJIora8qZx7YzLZdlY2LazmKUfG4OSiyujJ9XCZwnFO006GSoKrOvnzg
 c0YmShg6lQyxGGmvNnDVKz/9aBj0myv8DS4T
X-Google-Smtp-Source: AGRyM1tXjiiR/3/k53iROAs6aMdwdF6NaE/Px8o6zFzIv2MLI4glCiYxpfDHBzY1FH7nMQeV2SPNzQ==
X-Received: by 2002:a05:6a00:1ac7:b0:525:4ef2:175 with SMTP id
 f7-20020a056a001ac700b005254ef20175mr30316801pfv.50.1656836991312; 
 Sun, 03 Jul 2022 01:29:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 47/62] target/arm: Hoist check for disabled stage2 translation.
Date: Sun,  3 Jul 2022 13:54:04 +0530
Message-Id: <20220703082419.770989-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

If stage2 translation is disabled, E1&0 translation is
just a single stage.  Use the complete single stage path
rather than breaking out of the middle of the two stage path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ed25f4b91e..84d72ac249 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2433,9 +2433,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
+         * translations if mmu_idx is a two-stage regime, and stage2 enabled.
          */
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
             hwaddr ipa;
             int s1_prot;
             int ret;
@@ -2448,9 +2449,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
 
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
+            /* If S1 fails, return early.  */
+            if (ret) {
                 return ret;
             }
 
-- 
2.34.1


