Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB82699AF8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnB-0007uu-PW; Thu, 16 Feb 2023 12:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn9-0007sC-69
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn7-0007oV-Dp
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id bu23so2524223wrb.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1bJSQcpdAE5XdmRoJPsx4gO+dGl9PnbwqH6SWwJRQ6s=;
 b=K1TsMCXd1zSsK2X5ajZmaTo2zuhDohQWAa7L5SpP3ziv5qQCS+fEOM8+b669GDIMl3
 KHtGo73SHBsE1BdWDg34Mqe0ia5qU6cB4Nqyj8jdJPAJ3nq/I2NUDIgVDbeFgvnZD8S0
 mj0nf1NlXA+mstw2l7r/VJEzWoz8Rpcq39Kp5fHMmPrYrh9dDgeAIx4I7DvXM9hdhc47
 oHVs3eEUs9dRBba7ubgIeFkW6FySmq5olZb/5Z9VukZIoLTVNDYmG502buYP2A2Lzej1
 JgtQA259xFOikD5p7sbN8Jy9Jr1pgCULoLe6VTCt8G4w9p40VgXbNtCDMTHJj1ylYfRr
 uPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bJSQcpdAE5XdmRoJPsx4gO+dGl9PnbwqH6SWwJRQ6s=;
 b=AfXW8W9AMYlWGhFij/MVIdgLI28o7Q2Up6H+0qxJds8bxpYC345Vg6eth4AVhBxcEw
 cE/QS6C0Ag6WLtTIZilfNxY5yRuQEx7jigv4B5tKu5RnLfcWKwavS+KaGDWXGcbmotBz
 bWKemmn/x7TGk7d9pPE5R51bLjQ25Oyzj2lLea122qTd4nDwvFzTuQi5lMnK7TAgAtLV
 IpNM7Gu52LQ429c9yPeTLOgV1N+tjxJTjNtWUqxMhRIHC99G16Dx/yHIZpWClVmpXRio
 jr8ofK1oxhtu9gJ1SieotMXBwwhGDkN/Xzf7sqXazAh2d+kf5T3TR2lJkrCF9+OBYudJ
 39Jw==
X-Gm-Message-State: AO0yUKU2yP/PoHpHLGox8OLSxc/9o7Y6aOQ5mUkju5X0PJF38LPrxKPn
 MspUd/1RTngt6lw+DTkIka5l7sKPCHUhzUmR
X-Google-Smtp-Source: AK7set92gw3Dki3UyF2dOQN23N1/UWVqsSScaPjkuQyoETltI55mE62BKGGi37WpxjjRiAgCwCQFaQ==
X-Received: by 2002:adf:de12:0:b0:2c5:98f2:5b1d with SMTP id
 b18-20020adfde12000000b002c598f25b1dmr1164303wrm.63.1676567488075; 
 Thu, 16 Feb 2023 09:11:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] target/arm: Reduce
 arm_v7m_mmu_idx_[all/for_secstate_and_priv]() scope
Date: Thu, 16 Feb 2023 17:10:56 +0000
Message-Id: <20230216171123.2518285-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

arm_v7m_mmu_idx_all() and arm_v7m_mmu_idx_for_secstate_and_priv()
are only used for system emulation in m_helper.c.
Move the definitions to avoid prototype forward declarations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 14 --------
 target/arm/m_helper.c  | 74 +++++++++++++++++++++---------------------
 2 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1e018da463..759b70c646f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -597,20 +597,6 @@ static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
 
 int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
 
-/*
- * Return the MMU index for a v7M CPU with all relevant information
- * manually specified.
- */
-ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
-                              bool secstate, bool priv, bool negpri);
-
-/*
- * Return the MMU index for a v7M CPU in the specified security and
- * privilege state.
- */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
-                                                bool secstate, bool priv);
-
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 76239c9abe9..b4964dca8a8 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -157,6 +157,43 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
 #else /* !CONFIG_USER_ONLY */
 
+static ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
+                                     bool secstate, bool priv, bool negpri)
+{
+    ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
+
+    if (priv) {
+        mmu_idx |= ARM_MMU_IDX_M_PRIV;
+    }
+
+    if (negpri) {
+        mmu_idx |= ARM_MMU_IDX_M_NEGPRI;
+    }
+
+    if (secstate) {
+        mmu_idx |= ARM_MMU_IDX_M_S;
+    }
+
+    return mmu_idx;
+}
+
+static ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
+                                                       bool secstate, bool priv)
+{
+    bool negpri = armv7m_nvic_neg_prio_requested(env->nvic, secstate);
+
+    return arm_v7m_mmu_idx_all(env, secstate, priv, negpri);
+}
+
+/* Return the MMU index for a v7M CPU in the specified security state */
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    bool priv = arm_v7m_is_handler_mode(env) ||
+        !(env->v7m.control[secstate] & 1);
+
+    return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
+}
+
 /*
  * What kind of stack write are we doing? This affects how exceptions
  * generated during the stacking are treated.
@@ -2859,41 +2896,4 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
-                              bool secstate, bool priv, bool negpri)
-{
-    ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
-
-    if (priv) {
-        mmu_idx |= ARM_MMU_IDX_M_PRIV;
-    }
-
-    if (negpri) {
-        mmu_idx |= ARM_MMU_IDX_M_NEGPRI;
-    }
-
-    if (secstate) {
-        mmu_idx |= ARM_MMU_IDX_M_S;
-    }
-
-    return mmu_idx;
-}
-
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
-                                                bool secstate, bool priv)
-{
-    bool negpri = armv7m_nvic_neg_prio_requested(env->nvic, secstate);
-
-    return arm_v7m_mmu_idx_all(env, secstate, priv, negpri);
-}
-
-/* Return the MMU index for a v7M CPU in the specified security state */
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    bool priv = arm_v7m_is_handler_mode(env) ||
-        !(env->v7m.control[secstate] & 1);
-
-    return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
-}
-
 #endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


