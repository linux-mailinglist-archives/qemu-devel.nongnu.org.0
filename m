Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986104AD842
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:23:17 +0100 (CET)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPWe-0007yi-DZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-0000id-RK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::331] (port=42537
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023a-4s
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1403968wme.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=07gBIxwOWE1tZbNF3mc8srn+QlzhsQp+V7aHyDnjcfs=;
 b=vRdsyj3BbBUTuoEvqcUNU9brIM4cweGwjG44IDZPYFKzbLxv4PguQ7o854FTDDyfq2
 /dT52o8Pr/yHuDLzGvuRdV36CgBnM/mCj9iBhWGoF/C8VSVLSuo0sfqWPigz70/UuKeR
 b/1okm2CgoxarRKVpwwDeDa9Juu2KCgj0R6Buu182/P6043kq3UABO4MOwAw79qbfvHC
 teUvQngZ5UPkvyw7FANcsCR86x//ZeDdenVX0mazvt91dPUYihD87M4r/lAqU7BGaClS
 /8zkzCuGSOSoAkzpYLLixublQQTi+zQe6CqV/1OTDFdZFYmdqWGcxZTSU0rtdU2+3S6y
 /slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07gBIxwOWE1tZbNF3mc8srn+QlzhsQp+V7aHyDnjcfs=;
 b=e6iNVviAMX6gLRkvgufPZamd8xB/H64jiXWHkFX1zqIAQJSNUXxCYWtw2hIVtMCk5t
 tzqP/mNRSu55teFPL+2g73FN1RQS1Ie0d0I2u7Rn8QLkDxqNW06JcPfi5Q2Cu10LTqkQ
 O52eeAod6MAvrkYAw5v7hOVSZ2phSt9BC0e7XDHfF6Mz8rX7PJ2LNHP1/TNrJoQJaJZQ
 YyvBJooyCl6gpNSIZNMg6VEswaw37GT6ABfA7uDeGBSeN9hk1JoaX2Ohqwr/X84cnxUv
 DK5kPAaSMXrDIc5u2HgvP5/BnYJ46Yi6IbKBvQurJI00MCyO6oslvalZzA20zAUyg4uE
 b0Fw==
X-Gm-Message-State: AOAM53377RZ4386hqiE6M1idjPwkfqgeJb9qM6JS7j5U16Xho7O21j1+
 gM+kNnoQ7aaZrHegiSiGIREhNRmU5B2y3A==
X-Google-Smtp-Source: ABdhPJzRdPhU3rXb634wGKE+YbMEFHc1EE6F4hUoTrRgMD3KAWv7cNhgWrU/58KgPluKF4mQ6hfQOQ==
X-Received: by 2002:a1c:a552:: with SMTP id o79mr794000wme.40.1644320391919;
 Tue, 08 Feb 2022 03:39:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/39] target/arm: Tidy sve_exception_el for CPACR_EL1 access
Date: Tue,  8 Feb 2022 11:39:11 +0000
Message-Id: <20220208113948.3217356-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Extract entire fields for ZEN and FPEN, rather than testing specific bits.
This makes it easier to follow the code versus the ARM spec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20220127063428.30212-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 649958a727d..e474ab2e1de 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6154,30 +6154,28 @@ int sve_exception_el(CPUARMState *env, int el)
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
 
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /* The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
+        /* Check CPACR.ZEN.  */
+        switch (extract32(env->cp15.cpacr_el1, 16, 2)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
             /* route_to_el2 */
             return hcr_el2 & HCR_TGE ? 2 : 1;
         }
 
         /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
+        switch (extract32(env->cp15.cpacr_el1, 20, 2)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
             return 0;
         }
     }
-- 
2.25.1


