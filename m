Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05F5E6A8B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:19:49 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQnc-0005DE-Oy
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAy-0002Ak-VP
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAx-0005Nr-6Q
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id g3so16366499wrq.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=SNRGCqngHXuTKJa6F6FQoKgAN+UbaO3r3THYthr1idQ=;
 b=Lzs6ulw0bcOQ4VInqi9YoNw3PIoeYWmHYjQ6xpo8m/DaHeU5zOr7kDAMhBJqj3lVvh
 p7W9WD0zwOKBswwjpKsmbEDobYAIB2IsuxYyPOvsTfOGeWPI8YKguxNpD3zMbs5aKGYp
 S94iQ1sWM2NUw978crdLw5Yf7E/G8fwXrkQLo7qPzjOFeNaOVRqpSWyx8v+7Rm1HX+dx
 9Wn13xa1i8CCoyvD/5s4cqQBScm6LeY5wX8nYq0+v5BCJ1S28LMSDxNyyhiwx6wNGanj
 bNjrxT1lSArfUgzXUdm6Sm2eUZBtECLQW6YRa4zxgCCF3UxjXuDnkrsshDFfDWkTLjXe
 QTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SNRGCqngHXuTKJa6F6FQoKgAN+UbaO3r3THYthr1idQ=;
 b=ECoFbgCIhitxwo289TD30XWOex5p9bpcqDU1GVVL3oWA3xV3DU9+NAJCuEJAdtxq7H
 64q1FF84HbXkwA31WslaawolUiGP3OjyqJbw16dvtZz+pKd9Qcy33IdtY06wHxJweCQh
 54neCgnrGKi5mU31olIia6UMkIExCfz4IXs57Lll7oN753xU3zTzKqdX4Ra74XPMoGg7
 Lu/hTnU6WeZRq3SXktYy565al568XMXrLkvkMiYFre0HF/MrzahfzSZAPYpzeoA0/+Bu
 o5XZdNIfLC2dBCjZgYPFxJLsS5iyBevl4ULPvf0b27IPOfnpBoSORhmHhtFKFuS3ardK
 zKfg==
X-Gm-Message-State: ACrzQf1rdYWG9Zl+Wjl+zjkwfDae/K2mtaPpNbofLPAblPMBc2t+aznG
 WlmXoip69JtZ+9gVDVfAAaVshjaXc26nzg==
X-Google-Smtp-Source: AMsMyM70BPB+PBfE/3itWPttzyS6Yxrnn3JncYCJEQ7tO9VuNRNK1JbuoL06y1m4hg8MwH8Aeci3sA==
X-Received: by 2002:a5d:598f:0:b0:22a:f74d:ae24 with SMTP id
 n15-20020a5d598f000000b0022af74dae24mr2684061wri.544.1663864546380; 
 Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/39] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
Date: Thu, 22 Sep 2022 17:35:08 +0100
Message-Id: <20220922163536.1096175-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

This can be made redundant with result->page_size, by moving the basic
set of page_size from get_phys_addr_pmsav8.  We still need to overwrite
page_size when v8m_security_lookup signals a subpage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-11-richard.henderson@linaro.org
[PMM: Update a comment that used to refer to is_subpage]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  4 ++--
 target/arm/m_helper.c  |  3 +--
 target/arm/ptw.c       | 23 ++++++++++++-----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 103ae743a75..f8b22d3ab0b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1152,8 +1152,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
+                       uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 69d4a63fa6d..01263990dc3 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2806,11 +2806,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     if (arm_current_el(env) != 0 || alt) {
         GetPhysAddrResult res = {};
         ARMMMUFaultInfo fi = {};
-        bool is_subpage;
 
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &res, &is_subpage, &fi, &mregion);
+                          &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d6890048f13..bb3c709f8f5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
+                       uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1710,8 +1710,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * mregion is (if not NULL) set to the region number which matched,
      * or -1 if no region number is returned (MPU off, address did not
      * hit a region, address hit in multiple regions).
-     * We set is_subpage to true if the region hit doesn't cover the
-     * entire TARGET_PAGE the address is within.
+     * If the region hit doesn't cover the entire TARGET_PAGE the address
+     * is within, then we set the result page_size to 1 to force the
+     * memory system to use a subpage.
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
@@ -1722,7 +1723,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
-    *is_subpage = false;
+    result->page_size = TARGET_PAGE_SIZE;
     result->phys = address;
     result->prot = 0;
     if (mregion) {
@@ -1774,13 +1775,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                     ranges_overlap(base, limit - base + 1,
                                    addr_page_base,
                                    TARGET_PAGE_SIZE)) {
-                    *is_subpage = true;
+                    result->page_size = 1;
                 }
                 continue;
             }
 
             if (base > addr_page_base || limit < addr_page_limit) {
-                *is_subpage = true;
+                result->page_size = 1;
             }
 
             if (matchregion != -1) {
@@ -1972,7 +1973,6 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
-    bool mpu_is_subpage;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
@@ -2035,9 +2035,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            result, &mpu_is_subpage, fi, NULL);
-    result->page_size =
-        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+                            result, fi, NULL);
+    if (sattrs.subpage) {
+        result->page_size = 1;
+    }
     return ret;
 }
 
-- 
2.25.1


