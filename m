Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE39545674
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:26:15 +0200 (CEST)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPfS-0006V9-6Q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmU-0004Dr-6s
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmR-0008VF-JM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id 123so12497620pgb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHr3GvWpnhlYyxP8wVfL31GtOWGiQW1hytUXYczR5lk=;
 b=FXddmIt9cI7ADeTK9+lMTP4ZfbBamYEfScDKvaQZzcWtszHXPVjPCF4W2w2HS31jtd
 EJFEn4szy7KevR/F4+67Nfai5j1MOKC46hEpvjGTpw7wZ/MCnHg5QF0sZ+9inFTBx3Yc
 Ozuo++dicgV72mPNp7VxHoYb9eOB7TNKqXQaAAQmSbtruabF/i3bWD5LicNEgcr5HGFK
 hltWKmbg7EFbtf77PWTLcPhxO2iqVXW+MkyA7vMFkHBJaGTxwZtMPGM5ZzDICyS01Nqz
 56vznTe8/+Kq/qdNB2vPt2A4hPML4zPeDMtRqEccV8JlDTEH/F33sYv7OjvkVUlQfAB/
 hY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHr3GvWpnhlYyxP8wVfL31GtOWGiQW1hytUXYczR5lk=;
 b=61xCcfml5WoiUriCfQ6pbtLs5l3/UsiKbMb+QP+NO9pjxYrSzvMIxoUOBdOV5VUFgV
 6+mxv8x5RGBHvd76O2QRhCtBBB9ky1dMKQleFjfjM1pDW8Yxmr5gv1M3QI14zMblLOeY
 RLWfxqYETkT+Air0aCVECiGUwC4tVDvArZ92bGdROP0M7fJG+yPZ5vwIuKv1gQ8PRsoO
 8a1MZtzveFVpKVlZA7tgN6HR9fdxF5rmayZ7OvDd9+jfoGx8XmAJwLHD5SHo4n1mHYlI
 oGhqnLxbtNMTZwYQ42k1VCJW0FXzIJSZvQu49pNPlZ/OYikI243mFeDmj9n4d8aCYMx8
 b3cQ==
X-Gm-Message-State: AOAM5308HpvHpZ2scSKnR0dKvnAMunx0bmjVvFt6uPVftKhzeaS5HXSl
 31PwpjO13dD+gwuQbkQMfJq2jkUBYMPSEQ==
X-Google-Smtp-Source: ABdhPJzKfZB8t9ylSf/87Inv8e3V8ieEoKvU/dXFIlV7FPifQ8PC1ATJpD2x4Zdv5kmkjTV0Jhc2Zw==
X-Received: by 2002:a05:6a00:1956:b0:51c:3a0:49d2 with SMTP id
 s22-20020a056a00195600b0051c03a049d2mr27029295pfk.29.1654806562544; 
 Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 22/23] target/arm: Move arm_debug_target_el to
 debug_helper.c
Date: Thu,  9 Jun 2022 13:29:00 -0700
Message-Id: <20220609202901.1177572-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

This function is no longer used outside debug_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 21 ---------------------
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 719613ad9e..161ac9fa2e 100644
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
index 26004df99b..b18a6bd3a2 100644
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
2.34.1


