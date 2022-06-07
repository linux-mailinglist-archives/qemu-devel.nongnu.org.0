Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA653F463
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:17:35 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPin-00067G-W3
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPGA-0007O0-93
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:58 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG8-0000KW-Le
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:57 -0400
Received: by mail-pg1-x535.google.com with SMTP id 129so14560156pgc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DResuf4yvFSsZX3asYb/x0WdRbn6myIqroBLohdXR6s=;
 b=T1iGVGo//xSotjD6+Dq6ruzGkNWUpbqCm0ZzIwPVfGh9qz5pykd7UBic/emjHfpD2v
 uSdPEpDxf25fUGeWpaDYqyT/smhqIPAdwi4FW3jZ+jnNRVrRlOWcMQa++7EqH7WlKlJE
 MWAEbmH+hfDBKTClcxJNN69IKYPMMooHaF4r6W9uvL3Nsac6jakv4+p9fHdj/bX2OS7V
 dOLpf8pujV68G+dccUjt+SzRurQ1TY3NOMZQMaHecctSU56FxNbNV35ivxvQ0RjtAZGv
 bhrkr2r3H3XaiqRc/LQyon0HMK3EbGJdS2yMDhQUEWGLyAphHuV+G74lzwfiKBZDkF4r
 D43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DResuf4yvFSsZX3asYb/x0WdRbn6myIqroBLohdXR6s=;
 b=p7g6CD5ts/zN1225K9JTzql2flS/ZtzqddJEKkjphiatU78RsZE+LpvTs4pB8um/YB
 eonD6mtBc/AHWTcEt/1Vz5FAK3ypv5DprJvxX+VMTAo4rS9MHkTFjpDnDzVfF6EAHs3N
 24LQ9OE1sLdEcNo/24n6A26IIxHaeEMGsYqX11XeTYluX8+eqF9coziqiWMVqILd/IZV
 NwtsMuPCtP7M0hbI5q3rkR038MdD6f7v/fxT477wlIuNK6OiLqDdDynLO6Jyec419dFU
 z8XCdEFV6qk5g/7RXb0m3TiMpLDXk80mEQoErDKlCeycNYrZCTDR+s7BKsKyv7Tw4Ya9
 k+Ig==
X-Gm-Message-State: AOAM531jIP5OvMAOOgBVVF0PWOyj6w75iEpxmLSOAqTuqJo+dpQWETP/
 55aipuw06DV7HzvQ3M804HTV9gBQtrRZIg==
X-Google-Smtp-Source: ABdhPJyRutMRxZwejtxi+0Fojz5JlQZKTJZVmBB5f6C6Pyv4G7wP6mtFeRMCLtazqJrjCMvuVh3ROg==
X-Received: by 2002:a05:6a00:1344:b0:51b:e3b5:54e2 with SMTP id
 k4-20020a056a00134400b0051be3b554e2mr19648969pfu.6.1654570075809; 
 Mon, 06 Jun 2022 19:47:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 23/25] target/arm: Move arm_debug_target_el to
 debug_helper.c
Date: Mon,  6 Jun 2022 19:47:32 -0700
Message-Id: <20220607024734.541321-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 21 ---------------------
 target/arm/debug_helper.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5224dc2c85..5bc6382fce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2967,27 +2967,6 @@ typedef enum ARMASIdx {
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


