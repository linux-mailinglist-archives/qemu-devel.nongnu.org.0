Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3D53D53D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:22:58 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLJR-0005m2-V1
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3P-0007rL-Kx
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3N-00007F-MO
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w3so8084941plp.13
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3tM2x5Geh/0C+lNtCDw6ji3/cajAOAo6f5xAef+ZfI=;
 b=pXy8v+mODdY6WcFaeuftszjQsCRkZfg+JbZHfB+GfwWhU6GaVE4yTRS4fCt06MwQYm
 /XPK54LIeLckdnQpVokmBuiJSiqZMv2ulSuPDy7el83Equ2vH1WVNw7qWwqaRZGwUduA
 HMfp+FT0tPALxDBxkowV1FvnsCnim3SJ3yFUw/vkAsMf+zWHBqozf00TWLX2rCBOzJCr
 drwPYYGaVEjAhjUfbfBBiukFVsNVfzJMAzLZgcaYkMFVyoIi7r4iHYRYf3eJSLGyi54i
 lFqzt8UkKgwqiphI9uD91sLYgOeCDqWsMRpWjN/LYvMHxqAt++gPnaDgombqMQe44kOU
 kNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3tM2x5Geh/0C+lNtCDw6ji3/cajAOAo6f5xAef+ZfI=;
 b=I6DvQRQ+YABycOoY7YNyueehjRsM6ZYg+KvOGYEW+02D9VGyyaJZlPwZZrdXD0JMal
 qElkixsGVBsFpp3CRVeqK5Mc/aZZcL/ARswFm0z3GQOXBhrSTc71Se7ksNBJdp7L83JV
 MfchFEcai6mlGWfcd5ONVhUv30AigmhAYwgMACPbRN5tXPDSc6/4rQuhNy8JSrUyAgkJ
 WfjNyEFblZRvqk49YvQ5IlhJ9v1LU6QWVUckunlwOwwRsb41kL8TpPXwKAHBZb+Zg1vH
 OlG92Pdl9MshX/zYtuWk0SImyUTlf8FFUD53wljVytTEhXmPDMNu7F35d7N1ctCpoVlL
 IRUw==
X-Gm-Message-State: AOAM530lU8bFkD+y0rxG2bM3udNh2tXBQ7U73utcWo0zdVk1+5pLXBmV
 vXCQoEGNqLPCtBFS3ZdcIDn/tuP6ywJUvA==
X-Google-Smtp-Source: ABdhPJyL39PsM7X4cg/W8j12D7ktceivenfTf8YUpmEk0dLCufh8GEkXiJhRxgdQfgzctEGDB5Y3dg==
X-Received: by 2002:a17:902:b703:b0:158:2667:7447 with SMTP id
 d3-20020a170902b70300b0015826677447mr12871233pls.92.1654315580425; 
 Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/28] target/arm: Move m_is_{ppb,system}_region to ptw.c
Date: Fri,  3 Jun 2022 21:05:51 -0700
Message-Id: <20220604040607.269301-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 15 ---------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d2d2711908..6c47a57599 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,9 +33,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address);
-bool m_is_system_region(CPUARMState *env, uint32_t address);
-
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 52655bbdf1..937971730c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11641,21 +11641,6 @@ do_fault:
     return true;
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
-    return arm_feature(env, ARM_FEATURE_M) &&
-        extract32(address, 20, 12) == 0xe00;
-}
-
-bool m_is_system_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile system region
-     * 0xe0000000 - 0xffffffff
-     */
-    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c15fba43c3..32ba2e5e8b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -416,6 +416,22 @@ static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+static bool m_is_ppb_region(CPUARMState *env, uint32_t address)
+{
+    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
+    return arm_feature(env, ARM_FEATURE_M) &&
+        extract32(address, 20, 12) == 0xe00;
+}
+
+static bool m_is_system_region(CPUARMState *env, uint32_t address)
+{
+    /*
+     * True if address is in the M profile system region
+     * 0xe0000000 - 0xffffffff
+     */
+    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
+}
+
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                                          bool is_user)
 {
-- 
2.34.1


