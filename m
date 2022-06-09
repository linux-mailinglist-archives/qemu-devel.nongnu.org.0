Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B953544875
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:14:52 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFBj-0000Qm-B9
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE78-0001Xj-DK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE76-0005v7-GQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id u8so27137454wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EUZ/tNvP5WO5oV5qgdTYHUfZb+lkPxFhWBi0KRDzQ54=;
 b=OpoQr7bAeWcoudBuNJFoIyB0bBeEnTOXTh5O2Oo/GSnqeByeknfak96HCpU5qNLrVa
 mCNy+IMhwcj5NUs5vs2VD/bBNlIEM7k197t+JGt2fd9jEoqbDYhYlTV7hOoq6B83WuAt
 26NCs/NVhF7VW2un4XXQT2A53kyhtXtmDxV0//YhxpEPYDNw/9f+ca3WUrzp49jyufLX
 EhYgNP/4ScZlFjVd8KD7pViHdwyh8YNQuPvH0k3+lf6U6GViuiKpn+Kb+9iivTfXbIZE
 DUZQEvqnJ7GbHUkJGppHZfynaeNRsUB+1L9PoBFJUXgSQ2QQ4ivF/R9FtMdQ6yS5KWIW
 /0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUZ/tNvP5WO5oV5qgdTYHUfZb+lkPxFhWBi0KRDzQ54=;
 b=ZLAp3AJX/4h3k0bb1ToU+9rOeT20QUyXFKg0/aurqQ5HV4fj38PJFYy7ZwnxzoPnQX
 nCBVQMJS52spn+gamLBvnU7GiGSfi8grZVm62YGbV2j7Scfc7bGNuk9qgoueuTfzNdx6
 MtEyN+ZTGfz5WfeH+uFTRLutltVhbcIcN0t3DzhCmZ72CT98/N24up7UlE44GhM4IOWQ
 Sag6HgrnQ+CfIwUO+uOysnK8CpTgPBrQFOvFe6mdAz4Dz8X3JJ2sKKig2JHB7dh4969z
 01IehT9T4Kh6ysnFtExhTSRtyJMoiqzqRFrJcnhyAltqBQ97IWNwH3dl2jlBpz/TPOWK
 fCBQ==
X-Gm-Message-State: AOAM530U5h4xuGZMQPMOqgfbD86kegzVkdQwrW+A+3GX+V2rBebkhzy4
 4sIBtJBelf+j4ZeI/Y0et2EvtdCLhjY3ng==
X-Google-Smtp-Source: ABdhPJwWyn3iyr/30BUKubxVyG/qD9HsTxn2XcVHmC+tuG78udBbjiq76PjIy0Ae/nQbFov8AdZGag==
X-Received: by 2002:a5d:620b:0:b0:210:11d9:770 with SMTP id
 y11-20020a5d620b000000b0021011d90770mr37269450wru.11.1654765559590; 
 Thu, 09 Jun 2022 02:05:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/55] target/arm: Move pmsav7_use_background_region to ptw.c
Date: Thu,  9 Jun 2022 10:04:59 +0100
Message-Id: <20220609090537.1971756-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-11-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 19 -------------------
 target/arm/ptw.c    | 21 +++++++++++++++++++++
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 8d2e2397147..d2d27119082 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -36,8 +36,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 bool m_is_ppb_region(CPUARMState *env, uint32_t address);
 bool m_is_system_region(CPUARMState *env, uint32_t address);
 
-bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
-
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cb23413d8e5..62e48f0925c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11678,25 +11678,6 @@ do_fault:
     return true;
 }
 
-bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user)
-{
-    /* Return true if we should use the default memory map as a
-     * "background" region if there are no hits against any MPU regions.
-     */
-    CPUARMState *env = &cpu->env;
-
-    if (is_user) {
-        return false;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
-    } else {
-        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
-    }
-}
-
 bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 989e783cce9..b82638b5a06 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -415,6 +415,27 @@ static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+                                         bool is_user)
+{
+    /*
+     * Return true if we should use the default memory map as a
+     * "background" region if there are no hits against any MPU regions.
+     */
+    CPUARMState *env = &cpu->env;
+
+    if (is_user) {
+        return false;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
+            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+    } else {
+        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
+    }
+}
+
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot,
-- 
2.25.1


