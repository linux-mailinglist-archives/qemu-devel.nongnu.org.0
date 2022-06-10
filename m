Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A57546AC3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:48:18 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzho0-00045W-Ru
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBO-0008VF-59
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007Ff-69
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id e5so7265806wma.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WzmjP0NWAAiVZmZ3LYlHBh+gxVfzWJ2IVCk/mMqQN68=;
 b=riYgo4Fit9tZ2GxaOyrVH5gXh8VW4nSHBqKUSYHG4j1XLVzo6bthyRBll9Ki7rJp6m
 j2wv3vzuHWtxTqrdJ9jtgmp3o8nkoka2J9ku2FGillvwzjXPcOIMKJdD3TeXFI7UvXNZ
 G4qD/nbCT+/f0kZb7/lQoz9RuxG+r9P5dMtl9+0stfd49DwRaEEILSVU2g7DgD8eeK4X
 FclpIiY6Wb//zZvTS46q08pah+4r3mv1FPrbxPwtVdFCnXJdOs7rVTsG3a5oCi/pTNeS
 E2iegPu6klBLxzw7mPS9CnPmnZCVl0lYr7Gq/h9z9NUlPQtWfPqRje3rvDlqVjsrl5n4
 3K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzmjP0NWAAiVZmZ3LYlHBh+gxVfzWJ2IVCk/mMqQN68=;
 b=GUjF/SAynI2/1rXMcpT5544If0dvS3k4/UPtyDbNZgV3++Hwl2asxE3oYrVAwlTmT9
 IN7HTjK4m2cwvzuUxYTV0A5iUkTPf31V6ZOQbWDPz/f20RKObM8Hmf/Zxygh99wBpL3L
 xJop21nTNoXiVTC3o6b8t4U5gP5NMyTQ8gD6BStH1g6uX5Dsc8gh9ELUcTho175VVkhI
 eHtZz7fJoSC6uDyYenGy8OKVMF4FgTFrclHkvlPz7fkapMfN85E/VSDehsFsrmQbMAtE
 4ZkplM0cRVF4WAyEzjNPOKp1SBh0q8mGaNOilfCWA6q+yZXQkIDmGXxvDNUAyIY8+SGY
 YD1Q==
X-Gm-Message-State: AOAM530apm8GfVQpWyi5FDdp0Ini2dg2fnb2a+YwyoiT+9CrnbtJn5FV
 moWaDh2wKzcuEwDj2lI3NdgaYxzap1h62g==
X-Google-Smtp-Source: ABdhPJzpQTOq52X55JGWnHxCJmLf098utrblbOOm68g9JtdWrqGB5xBuV7t7HtbXU6rpsGtYYTcNyw==
X-Received: by 2002:a7b:c758:0:b0:39c:44ce:f00f with SMTP id
 w24-20020a7bc758000000b0039c44cef00fmr454944wmk.167.1654877279824; 
 Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] target/arm: Move arm_debug_target_el to debug_helper.c
Date: Fri, 10 Jun 2022 17:07:32 +0100
Message-Id: <20220610160738.2230762-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This function is no longer used outside debug_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 21 ---------------------
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 719613ad9ee..161ac9fa2ee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2986,27 +2986,6 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
-/* Return the Exception Level targeted by debug exceptions. */
-static inline int arm_debug_target_el(CPUARMState *env)
-{
-    bool secure = arm_is_secure(env);
-    bool route_to_el2 = false;
-
-    if (arm_is_el2_enabled(env)) {
-        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & MDCR_TDE;
-    }
-
-    if (route_to_el2) {
-        return 2;
-    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
-               !arm_el_is_aa64(env, 3) && secure) {
-        return 3;
-    } else {
-        return 1;
-    }
-}
-
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 26004df99ba..b18a6bd3a23 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,6 +12,27 @@
 #include "exec/helper-proto.h"
 
 
+/* Return the Exception Level targeted by debug exceptions. */
+static int arm_debug_target_el(CPUARMState *env)
+{
+    bool secure = arm_is_secure(env);
+    bool route_to_el2 = false;
+
+    if (arm_is_el2_enabled(env)) {
+        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
+                       env->cp15.mdcr_el2 & MDCR_TDE;
+    }
+
+    if (route_to_el2) {
+        return 2;
+    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
+               !arm_el_is_aa64(env, 3) && secure) {
+        return 3;
+    } else {
+        return 1;
+    }
+}
+
 /*
  * Raise an exception to the debug target el.
  * Modify syndrome to indicate when origin and target EL are the same.
-- 
2.25.1


