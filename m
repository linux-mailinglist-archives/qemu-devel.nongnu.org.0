Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31405645D1
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:33:10 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v2T-0002bX-TE
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uug-0007G3-Ut
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuf-0005vK-Da
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d17so6333427pfq.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUX/T+NgNmJyoR8c7y7Ykrkjzc0XpAd0yqj7+G4mSDc=;
 b=MLeyEX3bvuIRSodVh3W4TXgmS7Xa41t6nbaVA/Zw3/Tv7gCe9kiYOdhpc88Te6jpaB
 wHGdpu/o60zKjuyJmM3otYt4wqWd25HSfX54jgKURYlMMQglH3GpWhV0aj6F9Cq6WEO5
 fjGrCUNN89YGAuCzmIMAgFTUYqMZ+BPYZ8yFpnLjZLJj3EL1vLGCxrHPIEJFUTueZc+d
 qK5GFaZ+7laH31g5Bx/i6+07/kWg6K9lyUj9Nzz87lvcFWkCh9ecD2hShFryObnTpmLw
 REzfP8OQlvc/cuacCULLYymeQk9pARfjaDoMmEDUsNS2FHUwpOHehVZ7IdDmwPaWJCBw
 Fy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUX/T+NgNmJyoR8c7y7Ykrkjzc0XpAd0yqj7+G4mSDc=;
 b=vUiCi2SEsaF+SVJnkUsQhmAQL1XNwWvKk5fMt3Gfwh/tZbzHJKIP04Sz8eEgHL2GcS
 gEiHJdR8/pVQc03ShEqw2ZQFMABpYmMcfACZhoYpLlkLtdKe3O+hPVrkk+h+US6bm29J
 Q1ZJiworSAtc6ix2OfvYiQ9988+MZQxIJVk5izOLpostcWNRJY1sRdARU2VjRYiGhi3w
 f03vSkoWCBOKyT8Hrh2gOkLscp0DrPu6ZkELFnOO/dT84Q3yHyzHn+e0ARGNwqGvnngh
 SneDY4DgU5gYOTOGhWQs0tMobV5KwPGnmyP9WL3mxkdYKW8FRV+EXe3HyjmZ8yqBiF27
 DY1Q==
X-Gm-Message-State: AJIora8vFUbVkLRRJdXakH6qqXbL9a6Ifyi1XH6C2tJ6oTMvuzjNKfsM
 dQZc73bmti+t919DlIy+0+H0YZBpR01q9744
X-Google-Smtp-Source: AGRyM1tSXimoud4X7g+9VRHpzz3tyUIBo1DweOjiSCh/oYaFF6IXLe8bPSnAUutjQWhYqr2x8oY2tg==
X-Received: by 2002:a05:6a00:1901:b0:4fa:fa9e:42e6 with SMTP id
 y1-20020a056a00190100b004fafa9e42e6mr29346784pfi.1.1656836704153; 
 Sun, 03 Jul 2022 01:25:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav5
Date: Sun,  3 Jul 2022 13:53:30 +0530
Message-Id: <20220703082419.770989-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 target/arm/ptw.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 490a57ec5a..f2e429574d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1347,7 +1347,7 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
@@ -1357,12 +1357,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx)) {
         /* MPU disabled.  */
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->phys = address;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return false;
     }
 
-    *phys_ptr = address;
+    result->phys = address;
     for (n = 7; n >= 0; n--) {
         base = env->cp15.c6_region[n];
         if ((base & 1) == 0) {
@@ -1398,16 +1398,16 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 2:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         if (!is_user) {
-            *prot |= PAGE_WRITE;
+            result->prot |= PAGE_WRITE;
         }
         break;
     case 3:
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 5:
         if (is_user) {
@@ -1415,10 +1415,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     case 6:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     default:
         /* Bad permission.  */
@@ -1426,7 +1426,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         fi->level = 1;
         return true;
     }
-    *prot |= PAGE_EXEC;
+    result->prot |= PAGE_EXEC;
     return false;
 }
 
@@ -2421,7 +2421,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot, fi);
+                                       result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1


