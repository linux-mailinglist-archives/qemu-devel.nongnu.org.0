Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACD59C429
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:31:58 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQALE-00058a-V7
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LG-0007AV-Am
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:54 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LC-0000gS-4P
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:53 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v4so9665853pgi.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hqvGmlmcNGpOKQjb7JM1JdOHnWL1WKCnMBq1zvwuxw0=;
 b=mJlAxr1vdNSA2Fgz1Gannvue66ZxuX7Fk7SXnbeZLMEytqXaAIKSPUCsYKGzc9agjF
 qOHQpV2rgB/wW02b5nzW7yCU6Z7zqx+uQzsKMm7IJrM0loN1MZP1yOoDJPFTt2RLzdvp
 l+WRaPEkPOITCunCvZBqx+EiFvx7Y6PIMo2GsPf81fkdYpx2pmHfYVEl4Vlb/iNwgiG4
 Qt+/zSP5qN3gyerGRu/5Uq20jXUiSgJcW3OCvTLnnDiE+JkWnspUsBrEPaoAM767mN3Q
 MCuVfw+oR9xbxSNDwsXeaDB7gnVhokRu6Na2p80s2eVnJl5a8aOKohlNn/MQMin/Gj5W
 av9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hqvGmlmcNGpOKQjb7JM1JdOHnWL1WKCnMBq1zvwuxw0=;
 b=I4Y3BwGHd3lMud6cgw13mtC3e+3Lqsshu1PxAh9vQezXqtyYe5A/QelUL+TxcsQtVv
 ftKsh5kGeCVrx9GfqpkxXW9gATJft+qyYWlAelur05Q3r1CkrH0mJFyCDA0Je5NH9P1c
 TzcYX5FS64n/gNvRNBXKwyd3Oq6gXDV3R3Uk2zwaU8NjSKtdxZLPURtVfX6hCGKN79U5
 FvxU1VyH82mKgs7iXw/vYjmTzFnZGz2QpbOebMjVNLqblw5DW8otE6bd3jDVWg9tt72e
 x9icIeFdFtuOVqRJTTUREqU+Vn0jF483RfN3ra6RPiuMZynqCbaT6QOjmnhQNdm5YXzl
 khhw==
X-Gm-Message-State: ACgBeo1Oqn6P3osBzgvf5vbjccVS91sF1dKFfs551UjP1UOWMIn00iNS
 fiaZO5NhNy+nbgEUYBohFmwVUHRrfkEFLg==
X-Google-Smtp-Source: AA6agR6mh6XC5KB5msSCRt6DZ2wyxWvmSqIahLE22zGumjJmHcJ0mN7L0q1UakbrQpJZ7dslsxv95w==
X-Received: by 2002:a62:188f:0:b0:536:ee23:e3ed with SMTP id
 137-20020a62188f000000b00536ee23e3edmr366121pfy.33.1661182068505; 
 Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 07/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav7
Date: Mon, 22 Aug 2022 08:26:42 -0700
Message-Id: <20220822152741.1617527-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 15d152432f..3dd6708eee 100644
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
@@ -2420,8 +2419,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
2.34.1


