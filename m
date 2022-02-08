Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DE4AD875
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:51:15 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPxd-0008Ef-4s
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-0000ic-RF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=45946
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023d-5z
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m14so30119872wrg.12
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WhWGZQdZPDMluOYmzcS+hSOKutm5iVyF+6AU+8IWoss=;
 b=jkH0Se3ci6nwLKmWnVntHkoyDnz82ywTrnyMBngT0jXHSXFdOjwScg2Ze7kA29jkfS
 roA0cD2kmNDim4qzLvbnT7QDmwWUYmZ6lsbdAm5a2UcOg1kMtOTbx6wRhjUx8ei9X9ds
 xUBvWxpFgP4WxOzwv3EXiU7RFSHS6mqyu6P+w+HoPjc3FtJIXdOkXb693Q75d9DGYcZC
 xnzxarxjIeSgtwZERBraAph8xSbm9h+tEnOWeM75EnQeEOQEpTl6U992w0vw6SqSNFcN
 v0CxAjnM3wXrUouiGSXKEUYnOUz/y007xY7DTir5ZTy6wRC5+ek3lKNDW7tv8/8gJvSG
 5JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhWGZQdZPDMluOYmzcS+hSOKutm5iVyF+6AU+8IWoss=;
 b=xFnS6inQhPJy4f5bBFjdpPkJwCYKqkdaLxtiMzHTkG2N9w/LHhdEcHcB8wSSHeCJnh
 D+H+6WS2ByBqV+K0hypCMYyRyn86/gIcNLC2sv2JeNtf/mAiEK/agFH7ArvYKGAdivP2
 or4Jxr75yCs4VZXWy/INkVGvTlAeMZDc1U/oco9/1EcQUmgcX7QuOrCc5LJ0pPVtzQS7
 LFzyqD/pIoCYfF/cOK1pDsDEUSuEox9jRWVv8qz4ad4JVNzO00ErrACuRqAbM8J2Havl
 D+r8S5SC/5CqHz4gHYyGQDc0Wt1lvHaxRLDIDh61Z/FVDSgMfr90ADn85KXbGoYz3tAX
 f1hw==
X-Gm-Message-State: AOAM53045RPCaj5MLJ+/4EpSr20cZ1/YTyaeGBV25YS7VwksOsii54sw
 tDPZvWNf8uc8zPHH2rFzJYxILkYvHCuoAQ==
X-Google-Smtp-Source: ABdhPJy/Cl1Mn8Xj+VIEYMgcY7xYS6qOUA+9vA0iSs8QItC2+buGytt6pWelK56BvTPmWfhcyPu/ww==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3310067wrr.488.1644320392558; 
 Tue, 08 Feb 2022 03:39:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/39] target/arm: Fix {fp,
 sve}_exception_el for VHE mode running
Date: Tue,  8 Feb 2022 11:39:12 +0000
Message-Id: <20220208113948.3217356-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

When HCR_EL2.E2H is set, the format of CPTR_EL2 changes to
look more like CPACR_EL1, with ZEN and FPEN fields instead
of TZ and TFP fields.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220127063428.30212-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 77 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e474ab2e1de..83bbb446e70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6180,15 +6180,41 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /* CPTR_EL2.  Since TZ and TFP are positive,
-     * they will be zero when EL2 is not present.
+    /*
+     * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
      */
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
+    if (el <= 2) {
+        if (hcr_el2 & HCR_E2H) {
+            /* Check CPTR_EL2.ZEN.  */
+            switch (extract32(env->cp15.cptr_el[2], 16, 2)) {
+            case 1:
+                if (el != 0 || !(hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 2;
+            }
+
+            /* Check CPTR_EL2.FPEN.  */
+            switch (extract32(env->cp15.cptr_el[2], 20, 2)) {
+            case 1:
+                if (el == 2 || !(hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 0;
+            }
+        } else if (arm_is_el2_enabled(env)) {
+            if (env->cp15.cptr_el[2] & CPTR_TZ) {
+                return 2;
+            }
+            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+                return 0;
+            }
         }
     }
 
@@ -12912,6 +12938,8 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
+    uint64_t hcr_el2;
+
     /* CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
@@ -12935,13 +12963,15 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         return 0;
     }
 
+    hcr_el2 = arm_hcr_el2_eff(env);
+
     /* The CPACR controls traps to EL1, or PL1 if we're 32 bit:
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
      * 3    : trap no accesses
      * This register is ignored if E2H+TGE are both set.
      */
-    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
 
         switch (fpen) {
@@ -12982,15 +13012,28 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         }
     }
 
-    /* For the CPTR registers we don't need to guard with an ARM_FEATURE
-     * check because zero bits in the registers mean "don't trap".
+    /*
+     * CPTR_EL2 is present in v7VE or v8, and changes format
+     * with HCR_EL2.E2H (regardless of TGE).
      */
-
-    /* CPTR_EL2 : present in v7VE or v8 */
-    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && arm_is_el2_enabled(env)) {
-        /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
-        return 2;
+    if (cur_el <= 2) {
+        if (hcr_el2 & HCR_E2H) {
+            /* Check CPTR_EL2.FPEN.  */
+            switch (extract32(env->cp15.cptr_el[2], 20, 2)) {
+            case 1:
+                if (cur_el != 0 || !(hcr_el2 & HCR_TGE)) {
+                    break;
+                }
+                /* fall through */
+            case 0:
+            case 2:
+                return 2;
+            }
+        } else if (arm_is_el2_enabled(env)) {
+            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+                return 2;
+            }
+        }
     }
 
     /* CPTR_EL3 : present in v8 */
-- 
2.25.1


