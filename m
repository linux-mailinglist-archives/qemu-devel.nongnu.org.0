Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D975A49DBC7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:41:10 +0100 (CET)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzP3-0000R9-3X
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMz-00046W-JK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:35:01 -0500
Received: from [2607:f8b0:4864:20::1033] (port=39636
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMo-0005jF-By
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so6576739pjj.4
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HwDFJsijN3KKV3amxkEWOLWADJe1maxxFGeKyIOR3PU=;
 b=V1p00VeweS5Uc25Ad+3Wyy6haEL+ELgetSOoQ/vE2U+hHCGLkfqgzl2yyRm0Olhanv
 tqeqpX8ykPgUYBzmTZAGheH2iwFgcCqSoBubwOu45eys0c5G48Gr54hVq8tRBbWGZu2u
 Z1zew06GdwO+Gfjx/ct2gtLeXGp9jwkTWEowqW6UdqIpd/oMj8+J+qbQaWHu35VTV7k/
 2PdQDx5YKzzvdpBWKTBi32Dl3A3YS0TTCQxKHw8ywryLKVy6rrvBs4KVt5g5efe8zDTr
 P9FSwLuvB2/CYMCRPsgb111fJkcFN6Kbos+jNuW4YekdO/VP+QKDhkd8z/m5Hgxnc+SD
 yBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HwDFJsijN3KKV3amxkEWOLWADJe1maxxFGeKyIOR3PU=;
 b=sWS2goHXz5fHtmcJs6o7rxLofQ/wTY0Uy+u5nyGjfha8xmMIkQPl7jB6iL3Z8fvoIi
 fzCSvZdkkBzSZzOPa6o/W5eGjh01x1gKmrSQDTwd/jG4uA+Ir/WJYI75Lv4d9+oAh3rh
 6s+lDSFhFIFB0HImrke4BT+sZcB8W5RKmkvJuXmIk8+RQS6XyeHnqrlx6jxeK/rINWSt
 +GbGdyBfg6eVotwSrd0JvQAvBaVYSV3CpBzq4DTFxjwwQ7XJ37nMvg+N3Eqrq0bMSnd3
 9xvaX/ganOPf1PcWRfYwOLTWJXnh647EtwoVqy5aUznBPF0ijI8fpTanG8Lzamli4XFQ
 rtyg==
X-Gm-Message-State: AOAM533PBADZu7rbJVhSgUtVkt3XX9H+9bfUEwB948Bj5Loh0HZfKZ83
 HykatyZkgzuxgMzveGizus2kiVpVrsNEnOQY
X-Google-Smtp-Source: ABdhPJz0o9ofx5/lFnsE1a4CtbXOKyNL3TwpvVaia1UzXuRyHVa17jJ+pRn9cv/sPOBLe0sVWqVdsg==
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr3718066pjb.136.1643265281039; 
 Wed, 26 Jan 2022 22:34:41 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y20sm4231855pfi.78.2022.01.26.22.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:34:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Fix {fp,
 sve}_exception_el for VHE mode running
Date: Thu, 27 Jan 2022 17:34:27 +1100
Message-Id: <20220127063428.30212-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127063428.30212-1-richard.henderson@linaro.org>
References: <20220127063428.30212-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When HCR_EL2.E2H is set, the format of CPTR_EL2 changes to
look more like CPACR_EL1, with ZEN and FPEN fields instead
of TZ and TFP fields.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 77 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cd48560786..ca916139e8 100644
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
 
@@ -12909,6 +12935,8 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
+    uint64_t hcr_el2;
+
     /* CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
@@ -12932,13 +12960,15 @@ int fp_exception_el(CPUARMState *env, int cur_el)
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
@@ -12979,15 +13009,28 @@ int fp_exception_el(CPUARMState *env, int cur_el)
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


