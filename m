Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB15FA0B8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:57:08 +0200 (CEST)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuDK-0003zn-Dj
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl9-0006V7-BI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl7-0005X6-Md
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u10so17326670wrq.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uYAkUC1FMKDAZVTYLTGfkDMxAgY5msooi2W/EbleAk8=;
 b=a5toCK5D90RjDRU5Rtffi+lIWAIcjGH1vveQqSn4DXu3eVLmb7b4aed8aYQ+uXRhpA
 759lL5qO8iVS3k356LiWLVRi1o4OmWyAEV0y3UnJ8AHSsrfu7hFsi+ozJ1FguYdNsIFK
 vNlljongbT7JVaYWxYwFSbuQkA1kwZDc+EY6iWpewyJ97I3stLinz/k5NAhW0g84LEV2
 Ke7FJ6bQimgOxAKZvEZySJgR3Uad5FOYYVOR9i17uLm81hG1ReSU+FGTKG8eoPE65Axs
 VkRRCc1lpoTyp/NUMWuuwSNaW9yrmnlOzyre8wRiucxKauPll085BqyESsifKKHKI4Gi
 aRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYAkUC1FMKDAZVTYLTGfkDMxAgY5msooi2W/EbleAk8=;
 b=mpIUdFu8h/uACn6WxjRLR/ZNwuPvRKU38QJV0Z0ZJqAuqf6DfLs+S8q//FqcTZZCxN
 7rGPHUZApzlIhEG/PY5ugeKrwfB9Q8few8qcsg9mY7Ka3JYTzNddaU62xOQQirc7//LY
 jnr7ARFlglAQ8Zoj0xmCxHkRru8bjbzCQtHvGSnKKBaQEsjMv2Iu0Iz5nvPrWx+RPX/5
 Sg/v4SuFXVN9pFYcTsz29pSl9Tld951RdIxK+Cj60k8G/cOpSZ41FqOh2sUJb++V+H1z
 Po/WAulNFBfd328dJdsSS7q27OYNkmji1OysIQhHiqnDNWqATucQOj75N+OjrH/vjHIY
 DISQ==
X-Gm-Message-State: ACrzQf26REInijkElCXaeFh4Q7aQNNQlUUwPikVISXE3UcbeHxC+51iP
 c2Y0HjR7YdQeNFhoO8bzySP9XbaUAVT1cw==
X-Google-Smtp-Source: AMsMyM6Qth4reBi+qM92vPoeIFwN/O/mJRDNGUM1A7bLX6N2sKEnSTjmjazdnJEZfLHHdQ/BWlRwfg==
X-Received: by 2002:adf:f14b:0:b0:22e:f162:f728 with SMTP id
 y11-20020adff14b000000b0022ef162f728mr9053710wro.681.1665412076338; 
 Mon, 10 Oct 2022 07:27:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] target/arm: Fix cacheattr in get_phys_addr_disabled
Date: Mon, 10 Oct 2022 15:27:25 +0100
Message-Id: <20221010142730.502083-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Do not apply memattr or shareability for Stage2 translations.
Make sure to apply HCR_{DC,DCT} only to Regime_EL10, per the
pseudocode in AArch64.S1DisabledOutput.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221001162318.153420-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 96ab99c7b6f..15c37b52c97 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2282,11 +2282,12 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
-    uint64_t hcr;
-    uint8_t memattr;
+    uint8_t memattr = 0x00;    /* Device nGnRnE */
+    uint8_t shareability = 0;  /* non-sharable */
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
         int r_el = regime_el(env, mmu_idx);
+
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
@@ -2314,32 +2315,33 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
              */
             address = extract64(address, 0, 52);
         }
+
+        /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
+        if (r_el == 1) {
+            uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+            if (hcr & HCR_DC) {
+                if (hcr & HCR_DCT) {
+                    memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
+                } else {
+                    memattr = 0xff;  /* Normal, WB, RWA */
+                }
+            }
+        }
+        if (memattr == 0 && access_type == MMU_INST_FETCH) {
+            if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
+                memattr = 0xee;  /* Normal, WT, RA, NT */
+            } else {
+                memattr = 0x44;  /* Normal, NC, No */
+            }
+            shareability = 2; /* outer sharable */
+        }
+        result->cacheattrs.is_s2_format = false;
     }
 
     result->phys = address;
     result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     result->page_size = TARGET_PAGE_SIZE;
-
-    /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-    result->cacheattrs.shareability = 0;
-    result->cacheattrs.is_s2_format = false;
-    if (hcr & HCR_DC) {
-        if (hcr & HCR_DCT) {
-            memattr = 0xf0;  /* Tagged, Normal, WB, RWA */
-        } else {
-            memattr = 0xff;  /* Normal, WB, RWA */
-        }
-    } else if (access_type == MMU_INST_FETCH) {
-        if (regime_sctlr(env, mmu_idx) & SCTLR_I) {
-            memattr = 0xee;  /* Normal, WT, RA, NT */
-        } else {
-            memattr = 0x44;  /* Normal, NC, No */
-        }
-        result->cacheattrs.shareability = 2; /* outer sharable */
-    } else {
-        memattr = 0x00;      /* Device, nGnRnE */
-    }
+    result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
     return 0;
 }
-- 
2.25.1


