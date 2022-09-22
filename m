Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD215E68BB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:43:44 +0200 (CEST)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPId-0002XS-R0
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAw-0002AN-JZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAu-0005Oi-OO
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r133-20020a1c448b000000b003b494ffc00bso1729065wma.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=o5zeYSJg5vCaz9F7elm+Lb7yX0lwKPPrfwrGwePP0L0=;
 b=pClGnQWnxKSJRIXzNXziopG1TS2foJc+Ju1mUf4fmsTg7SERjUe7FeBY71TLpSW4T5
 +YO+p7Z3xXpxBnluGjylLpWWBmJNtrsXsCxSHeGxpF4iFGAzse7MERf5OJlO3wBvHyTg
 SAsjiLr6fAU/DcySJHnsTFvWFQb+CXUk/SYarxK5kMd8zoQwCZOi2dpU1peGrayPeLaY
 AIhPao8WvU3wfMOx5Bq4ST/CGjnkbVL8ccRohzXe1PACoRqRzh8py9rhyDMhxttuY9Wy
 VtYW9xQUP11Z9acy365btxPXIPlheNMD2XHxFxn8obrEr5jkT/a7u5BL2XhWhnyGZIMu
 oKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o5zeYSJg5vCaz9F7elm+Lb7yX0lwKPPrfwrGwePP0L0=;
 b=SMpGHexryiRKlC+Kqk5BNYkEDM52tCrpnnxFarlGNVHLHaIjfvOzQo9MkJUmg/SGCe
 nqjyjQhLeHLOJW8NHXRLVIJyKdEL0tYOVAUX2MBmaZxXRMLznIBo345730/Qi9Qo9vqA
 wKjTIrNt+/Kh49rECoZhw8v/DYmgYmFckdRYBpf1a/vBJUkIf+4gVcJBq2zqcgMbRr5K
 NCTcgGfKlWuphuB306XyVOEr5U/jvtRSSuSjPYJ79pRvffNz/3y56cp9cwjbW6nTfTEg
 OMdNS+dSet5Oglc0V034GueF2tuT+zJt5JPvVWa1gYkBKPjVjfRk3aAXOu9KUIlX/gwI
 BBIw==
X-Gm-Message-State: ACrzQf2yhAAoGJBy2JGdiR5mvA+EA93Gk7hFJ9u9ne+hr0lY1ku2wX6c
 kCKZAR2g1tC7uFu5dfuMQVpz8lRKt0RSyQ==
X-Google-Smtp-Source: AMsMyM6hhoQ3RSV40TLcJTGoKOi5/KNXt3ec7Tua/qfA2+VmbNw+e0ETPNrYU7cG0tzwTmWDIptn7A==
X-Received: by 2002:a05:600c:350f:b0:3b4:c5f2:4295 with SMTP id
 h15-20020a05600c350f00b003b4c5f24295mr3097609wmq.200.1663864543226; 
 Thu, 22 Sep 2022 09:35:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/39] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
Date: Thu, 22 Sep 2022 17:35:04 +0100
Message-Id: <20220922163536.1096175-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-7-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4e2476278e1..70abcce81f9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1351,7 +1351,7 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
@@ -1361,12 +1361,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
 
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
@@ -1402,16 +1402,16 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
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
@@ -1419,10 +1419,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
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
@@ -1430,7 +1430,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         fi->level = 1;
         return true;
     }
-    *prot |= PAGE_EXEC;
+    result->prot |= PAGE_EXEC;
     return false;
 }
 
@@ -2427,7 +2427,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot, fi);
+                                       result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.25.1


