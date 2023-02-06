Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF168C9A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5M-0001pn-8p; Mon, 06 Feb 2023 17:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA58-0001jj-Ci
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:28 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA56-0004Rt-Oj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so11895300wrj.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A95YCGa6JM5usJ8r5LH9ThRro8jldDCk7TyXyCW7Wr0=;
 b=r/yrr937Nb9XGVEVXlDO8JoLMkqy5W+rWgGSuxz6xwh92VT16Iy9LFmvKr5QPhl2hS
 l7oib5TBVPahjANY+zFcuYFKsjYIdP58B3L+I3YPnmWNZ0JSJqTJ0DvEA6QaNCKfpotT
 0gChsHDcI2avLSKsa7OZRD0gTFKOf9m/2+njh/mbsxeoyrQowtTQAog/CztxLeOU49Vw
 mivHUKJt7j0BkcicVLgnmLs+5WplDbIcB4aANjhqV3Q9VKLHeRmxZxxhHSUOVFQfYwln
 9AUAqApUBSgAqwRluLRSGkleQdu7fDaJZCCpaTNsPRfUaj3lUcMGTUiaimqOm6Sa5O02
 la9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A95YCGa6JM5usJ8r5LH9ThRro8jldDCk7TyXyCW7Wr0=;
 b=j3rW9bmpaAe57u/HIuO9wRT3XwZH+tC37O8KbSy5kRA+YMl2uDU2gyAsObnRvt/EQE
 cNdO9pTntmKCBa8faP5TgiL2NIVLqlC1Dt8kvtfOvYj2gN+CuLb+0CJn0sM0uZOoSaou
 /hWS1l3bA3i7fiO8wniHg04SCzIIUWhcUQXQd6+pIqzts4e5mKOBI4vJJJ7vfGWmkiD5
 woSPgt3uwKFMzibV0o/WSq9mx+xepSu7AIYZwamQJ4155wIpOqveqrSrn821uB2YmUsO
 Syxs84+fiwdAZHlquzccIJd33MKrc+MUZ9Q2t92+aDIvgQUefZxtVEVBgsiRFGC2OHBM
 2Rdg==
X-Gm-Message-State: AO0yUKX0COzJUwbuntG19rLyNzUEC2xXHdIzxBksjQyqWMlnvFpl6rje
 1vVxSqpFhM/LX6MhaNbbcAgoTN5iUCzK79vA
X-Google-Smtp-Source: AK7set+wR9140/pIwm4oP1pfcUpyq9tgs1JXvBJbSjfZmc1WxkyZId253Jq+AVoY2z7LuVzdP0M5fA==
X-Received: by 2002:a5d:6307:0:b0:2c3:e993:9d81 with SMTP id
 i7-20020a5d6307000000b002c3e9939d81mr622961wru.66.1675722921371; 
 Mon, 06 Feb 2023 14:35:21 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a5d688c000000b002b9b9445149sm9797132wru.54.2023.02.06.14.35.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/11] target/arm: Reduce
 arm_v7m_mmu_idx_[all/for_secstate_and_priv]() scope
Date: Mon,  6 Feb 2023 23:34:54 +0100
Message-Id: <20230206223502.25122-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

arm_v7m_mmu_idx_all() and arm_v7m_mmu_idx_for_secstate_and_priv()
are only used for system emulation in m_helper.c.
Move the definitions to avoid prototype forward declarations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 14 --------
 target/arm/m_helper.c  | 74 +++++++++++++++++++++---------------------
 2 files changed, 37 insertions(+), 51 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1e018da46..759b70c646 100644
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
index 76239c9abe..b4964dca8a 100644
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
2.38.1


