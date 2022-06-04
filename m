Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4B53D599
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:53:24 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLmt-00015o-NV
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3c-00007v-FF
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3Y-0000CN-LM
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso8506084pjg.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8FrJXaj9IkZtQ3fkmfO7j242cR+2ACwn4iIRM1nBdE=;
 b=xvjVy75q9PU5G+jZOXybpnCGXgr8n8KCgaCqpnnAN0zKCuSBtUy7OaWLqGW8zlOQBa
 ew6AQPbq9ndXlBUyziw5k7qVfx2jFVpTc1EbcDLDpF48Ftwb2Pf/0yuZk71COmtM5n0M
 V55eZtBKSHUlKXB9s1vqc8RhhkuM3JH7AfSrK5SnqrsSpmcavxEWYrSGp6MmvWmOzIXy
 f6xiyrD1Fs/DckW7z3r3hTDfyGSKQ9vBna+5cDR8Itf1EmVIvbpWBySIu4epTwSi5rT6
 5tebjaEmmNuIgk6/zAgVTjdxehSDVTRPzYEMv6SIkI0nmPpGgQ87OEUHsvZFjllXHFdi
 XYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8FrJXaj9IkZtQ3fkmfO7j242cR+2ACwn4iIRM1nBdE=;
 b=Y7V0uk6ltXjzwMG64P3D3Eysw990Tm2WoXec0k7ge8c+YQzH1GmvpOnosdoR7Y967x
 wFoS8U37wvfKLNYjRtzKOl/s3sCpyxlGshHW6HNOqmkH6cAH+176tTea3fn+ZRZUtbC6
 NSNPfPfSnP53qjth7B+EjwfovU9oVQvP0aPS5Ki9toJsBWozGZbJwQQtS/uPdD2jBm2v
 ZR5L2QJw1y5/TECmxt51BuyC58k7OQTCy5oEA1O7TcdtAN4wgViRMg+K2ssa1aoTZYyl
 L+lJJd2TuWen6KIDtqWv0xZkJciIPLmfzkoyAUoUmODC584j+/Vtr+lyjqXZ7dojBmyH
 cuLA==
X-Gm-Message-State: AOAM533K/0phcfSOJ1RiEZNvZeTjxv2/MuniGCyNhtXG7XKs8pyr5/DA
 0fyT9UVSwcMzkl94CRgxcQ4H47HZFHJKNA==
X-Google-Smtp-Source: ABdhPJxoRb864T2mkbXjcP3PS+/NtoPuzyDvC4oJ57htrTwBMkaDKclFvaNikmfWjHT8wMCubbsebA==
X-Received: by 2002:a17:903:2d1:b0:156:7ceb:b56f with SMTP id
 s17-20020a17090302d100b001567cebb56fmr13016010plk.11.1654315591426; 
 Fri, 03 Jun 2022 21:06:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/28] target/arm: Move regime_ttbr to ptw.c
Date: Fri,  3 Jun 2022 21:06:03 -0700
Message-Id: <20220604040607.269301-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 16 ----------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 3d3061a435..ed152ddaf4 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -12,7 +12,6 @@
 #ifndef CONFIG_USER_ONLY
 
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 568e02c5dc..07b4f7bcc5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10439,22 +10439,6 @@ bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db4b5edf1..dc559e6bdf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,6 +75,22 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TTBR associated with this translation regime */
+static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.34.1


