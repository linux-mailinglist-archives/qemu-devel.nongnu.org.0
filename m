Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB05E6996
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:25:25 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPwy-0008J8-Cm
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAx-0002AQ-QG
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAv-0005Om-Cw
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso1687692wmq.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=7vq62INdvh89oZxGuCtLE86QHeaZAIKNvQoTb90xEPY=;
 b=etf4zzPqCOkJEHYvhSOiTkIc7xYU5aG3q1aNRl9VzRpSzvtV95bZ62g3sPAj2IZnRL
 DKKqbTuBKroUAKZaCDCPAj5YUh8f9MDSzTsao7HC21qll2pQ1h1NU593Tim4FjKLdRcX
 h0yaXW3xbOwU2lohcah4QDx0Wm2oNnuPZX+2FRwTTGpnlGLG0pDRDTwbF101Amc3ZoY/
 SsjHfjfa6t1PJxaGXbwKCmr9mZ8u4WYBTDAkV5NSTipcq5Wgm3KJps8gxd6YOSHudU9I
 8vjtdssSKEhRWfmHCWB/7Tq5m0og/dkg4tmh4SideNRwLYr2kuTnCfo4Of0DaQhDMZoX
 elxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7vq62INdvh89oZxGuCtLE86QHeaZAIKNvQoTb90xEPY=;
 b=sknXRVNHmwdG5cTd8KK4ludjvIh3CGeq/dDVIghJ5d+lXSkJ6rg+l4OqrDS44oudDm
 mip1ri8jmpCDbjEo75w4xKqw+C6U8uNzuMYOz6akOhenToQagzWVHj+pC3e97uEqpGbW
 Y4BNs2iZ3IZkws0cPpi5G0TddSawk1EeJxzd5KFIgVvqKqSQIMSFE1bOIkbJq3lDnk4L
 cQYWEYP1aQ/gBAzDV+BQjTFPAcwKyWbCnjr0SipRmbWW7BOUBsFRfjVMFYQ4ZQ55AeH3
 VrOYJV1LA0gRaw29L1TLkVH9CM2ISQhO/i6Q29FblWhVpKkfUQMZ7qbD+U+FuHei1XHX
 chYg==
X-Gm-Message-State: ACrzQf3cgwayMF9Nnh5xpA9THzu7fXC4IwlW/fBYFJN0WWfeqVAvz75X
 Y+hOBqJ9B4l5wEtNsvh4JDVzJ8knw+BEPQ==
X-Google-Smtp-Source: AMsMyM5qciVJj6dP1vxLXXa8BqZ6HJX2+CCXduc654WMSODM8EtFW28ENApNEtV5T7zwH1w0q8hasw==
X-Received: by 2002:a05:600c:3ba0:b0:3b4:8ad0:6c with SMTP id
 n32-20020a05600c3ba000b003b48ad0006cmr9997444wms.186.1663864543911; 
 Thu, 22 Sep 2022 09:35:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/39] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
Date: Thu, 22 Sep 2022 17:35:05 +0100
Message-Id: <20220922163536.1096175-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Message-id: 20220822152741.1617527-8-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 70abcce81f9..36b108907fc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1513,17 +1513,16 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
-                                 target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
     bool is_user = regime_is_user(env, mmu_idx);
 
-    *phys_ptr = address;
-    *page_size = TARGET_PAGE_SIZE;
-    *prot = 0;
+    result->phys = address;
+    result->page_size = TARGET_PAGE_SIZE;
+    result->prot = 0;
 
     if (regime_translation_disabled(env, mmu_idx) ||
         m_is_ppb_region(env, address)) {
@@ -1535,7 +1534,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
          * which always does a direct read using address_space_ldl(), rather
          * than going via this function, so we don't need to check that here.
          */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
@@ -1577,7 +1576,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 if (ranges_overlap(base, rmask,
                                    address & TARGET_PAGE_MASK,
                                    TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
+                    result->page_size = 1;
                 }
                 continue;
             }
@@ -1615,7 +1614,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 continue;
             }
             if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
+                result->page_size = 1 << rsize;
             }
             break;
         }
@@ -1626,7 +1625,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_Background;
                 return true;
             }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
             uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
@@ -1643,16 +1642,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 5:
                     break; /* no access */
                 case 3:
-                    *prot |= PAGE_WRITE;
+                    result->prot |= PAGE_WRITE;
                     /* fall through */
                 case 2:
                 case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
+                    result->prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
+                        result->prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1668,16 +1667,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 1:
                 case 2:
                 case 3:
-                    *prot |= PAGE_WRITE;
+                    result->prot |= PAGE_WRITE;
                     /* fall through */
                 case 5:
                 case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
+                    result->prot |= PAGE_READ | PAGE_EXEC;
                     break;
                 case 7:
                     /* for v7M, same as 6; for R profile a reserved value */
                     if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
+                        result->prot |= PAGE_READ | PAGE_EXEC;
                         break;
                     }
                     /* fall through */
@@ -1690,14 +1689,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
             /* execute never */
             if (xn) {
-                *prot &= ~PAGE_EXEC;
+                result->prot &= ~PAGE_EXEC;
             }
         }
     }
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
@@ -2422,8 +2421,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot,
-                                       &result->page_size, fi);
+                                       result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.25.1


