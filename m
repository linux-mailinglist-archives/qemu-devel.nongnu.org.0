Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5D53D586
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:38:50 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLYn-0005Z2-HU
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3c-0000DB-SU
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3b-0000E3-9Z
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:36 -0400
Received: by mail-pf1-x430.google.com with SMTP id z17so8536601pff.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sl9gLz55OAPAQErBGvbxfcLL/+qUiy1+18KidfepAw=;
 b=Ohr6uolozazipRZkgiFIlqcuoqIDCbB+Ip7jhAALyY5xZlHUMmK8WsZvfcT9kQCabD
 b8FQ0+BW4ZDFnat7GcuhuyLx+iEY6pKeS2LPJOvhHtXQNu6NqgbRniAvwi4t09yVu6be
 /2PtnwFP4gRBuTD9f6w+Q2KMIHOs42U3aC2x0/KiCXrUpHa3ZTZ5UpDoF7PLOJmMAe1g
 bgf0BmxwnUB6J980DjXYvBGfgJkBKauZ+fJK1FUUmfSVvBU1yysVAYYEHgqabLMM/pfU
 DSrN21C56GpKYQa5S2SyjSjKER8msAVZReIZeYdyytZlu4z4pWN/BUHXl6l/flUEQ3rZ
 yYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sl9gLz55OAPAQErBGvbxfcLL/+qUiy1+18KidfepAw=;
 b=mMed2ImcDYbZBJqTKgyRYXSwMddohE8Bm5FC/d7QPKSKw873ckodvcMI4vHZ9QLK8A
 xfSncNFxrVI+hd2rrFU08PHAlHPpUYNUX9EueMsYElos6uDDsEPRVyhkfGT77CS2Hyts
 u5Ilc4lWX48R1XcP2vsIlW0LFIB9QfSh7deilnMYgB/9gueIxkigBT6avJkWiHx/5u3R
 8f46nRZbzuxYMigsgC1lKQKiLiN0PQbvHUEc+GiGft2FXQN9Vlj5Hezic2QTEfJNml20
 XHwzIrFjgtofFZ6h7/YuN5ydylKkIyVdb1EWMOgvjlVUD6AIVjUsnEfsMd0BNvAdTUmC
 m+lQ==
X-Gm-Message-State: AOAM533YAQ0vId2mxqI9i450W2tYYDHWSIG3ATco71mHzRsXedliwJtf
 osZIX5qVCREHrlZJTf53LuUXwjmkf8rCPQ==
X-Google-Smtp-Source: ABdhPJyObY6GDeeH4On3nLBo4728OIOe0U/+85dXk+tGzfWOifqxCPafO+VDMWMy0oMSimOMuYhSug==
X-Received: by 2002:a62:db81:0:b0:51b:ed38:c409 with SMTP id
 f123-20020a62db81000000b0051bed38c409mr3585873pfg.37.1654315593937; 
 Fri, 03 Jun 2022 21:06:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/28] target/arm: Move stage_1_mmu_idx,
 arm_stage1_mmu_idx to ptw.c
Date: Fri,  3 Jun 2022 21:06:06 -0700
Message-Id: <20220604040607.269301-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 target/arm/helper.c | 32 --------------------------------
 target/arm/ptw.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1c75962a3b..1018cd24eb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10391,31 +10391,6 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     return env->cp15.sctlr_el[el];
 }
 
-#ifndef CONFIG_USER_ONLY
-/* Convert a possible stage1+2 MMU index into the appropriate
- * stage 1 MMU index
- */
-ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-        return ARMMMUIdx_Stage1_SE0;
-    case ARMMMUIdx_SE10_1:
-        return ARMMMUIdx_Stage1_SE1;
-    case ARMMMUIdx_SE10_1_PAN:
-        return ARMMMUIdx_Stage1_SE1_PAN;
-    case ARMMMUIdx_E10_0:
-        return ARMMMUIdx_Stage1_E0;
-    case ARMMMUIdx_E10_1:
-        return ARMMMUIdx_Stage1_E1;
-    case ARMMMUIdx_E10_1_PAN:
-        return ARMMMUIdx_Stage1_E1_PAN;
-    default:
-        return mmu_idx;
-    }
-}
-#endif /* !CONFIG_USER_ONLY */
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
@@ -11045,13 +11020,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-#ifndef CONFIG_USER_ONLY
-ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
-{
-    return stage_1_mmu_idx(arm_mmu_idx(env));
-}
-#endif
-
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
                                            ARMMMUIdx mmu_idx,
                                            CPUARMTBFlags flags)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e9f6870d0a..49e9a1d108 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -47,6 +47,34 @@ unsigned int arm_pamax(ARMCPU *cpu)
     return pamax_map[parange];
 }
 
+/*
+ * Convert a possible stage1+2 MMU index into the appropriate stage 1 MMU index
+ */
+ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+        return ARMMMUIdx_Stage1_SE0;
+    case ARMMMUIdx_SE10_1:
+        return ARMMMUIdx_Stage1_SE1;
+    case ARMMMUIdx_SE10_1_PAN:
+        return ARMMMUIdx_Stage1_SE1_PAN;
+    case ARMMMUIdx_E10_0:
+        return ARMMMUIdx_Stage1_E0;
+    case ARMMMUIdx_E10_1:
+        return ARMMMUIdx_Stage1_E1;
+    case ARMMMUIdx_E10_1_PAN:
+        return ARMMMUIdx_Stage1_E1_PAN;
+    default:
+        return mmu_idx;
+    }
+}
+
+ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
+{
+    return stage_1_mmu_idx(arm_mmu_idx(env));
+}
+
 static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
-- 
2.34.1


