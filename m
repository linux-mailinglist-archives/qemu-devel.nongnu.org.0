Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248835645EC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:49:06 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vHt-00079w-83
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uul-0007Pu-E1
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:11 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuj-0005wL-Jk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id g4so6272437pgc.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KbpdzE3nKTc1cc74Wpw4Q3gP7yLnp7bGPdrHmKMb7w=;
 b=Eui8nRM13or8jkwApwHK0qE+NRBVEbV7DP4XsAeCFSFsQforfewttezRTK1jbS+Wkc
 9eUdxld5EECvarwStryciV8VayvYQIXDFmOVKAE0zblYgDTgONfe3NgoXSSfIO3vvBVu
 wTMv7G+J8LcVqRqD1OyIxwc1zHT0mXNdBdCI3W09blSjp4uSb/gcc1HlXpoMt7T2oMXH
 VeHEwu1WVLoNqJCwml2L7sp4ISnQPFKOJozHfcITynbcUvUjVmVsJj9GRoUHt5g6nNDc
 aTkgX0sCifdJthL7FriNr5VJUf0uxCSH6qyscqtw0eqGNQivEVsd0PBBzu2nwOk2Ykpg
 c7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KbpdzE3nKTc1cc74Wpw4Q3gP7yLnp7bGPdrHmKMb7w=;
 b=zrBH3eHNAO/NEJR2ylRxfShSivg+qXITczXnSaXiWGuDMtXxilm6EvUQpmG9sg6a4S
 l2QTkJjwTKydBke1fC2n1BZgMMppzsCBcD5wsk1HELDzHdsBIEUWnU3PTZhRJyLQKlxg
 vL3ZEknmz+ckS2cHyFz0a5qvGE2mNLVUFhPt1WHUXEcPSNHpdjRVE6HgdEJHx45EbNGL
 /buWvJlm5bbVs+8YlzNotCM/f1XlHggyFIT6kbmWHVUbi8hR1n9xyVCyH+Aw1TQToQPo
 NLTdxjLPMdk7NSFAgw+9G971EALt97/N6F3CupMrEnPpf6sl/KFe4610uR2+uP1ANMyN
 D5tQ==
X-Gm-Message-State: AJIora+7Yuyn0r7LJ/uQjkN6xELMli3NhwPunDLc/arJ+F87Mm9ZIh3A
 hJGoCosJzqyOzeub69AryDLvjZze0V7xmhjT
X-Google-Smtp-Source: AGRyM1vtZwSytEF3ew1d+Azw2WX7Q9Kv9rvk219G4bVWQzNtxIlQd2sN/6QIbIijuDxBKsh4sQ4uiQ==
X-Received: by 2002:a63:87c8:0:b0:411:69bd:60f6 with SMTP id
 i191-20020a6387c8000000b0041169bd60f6mr19461504pge.524.1656836708275; 
 Sun, 03 Jul 2022 01:25:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/62] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav7
Date: Sun,  3 Jul 2022 13:53:31 +0530
Message-Id: <20220703082419.770989-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/ptw.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f2e429574d..4b69ecb1b9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1509,17 +1509,16 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
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
@@ -1531,7 +1530,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
          * which always does a direct read using address_space_ldl(), rather
          * than going via this function, so we don't need to check that here.
          */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
@@ -1573,7 +1572,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 if (ranges_overlap(base, rmask,
                                    address & TARGET_PAGE_MASK,
                                    TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
+                    result->page_size = 1;
                 }
                 continue;
             }
@@ -1611,7 +1610,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 continue;
             }
             if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
+                result->page_size = 1 << rsize;
             }
             break;
         }
@@ -1622,7 +1621,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_Background;
                 return true;
             }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
             uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
@@ -1639,16 +1638,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
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
@@ -1664,16 +1663,16 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
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
@@ -1686,14 +1685,14 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
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
@@ -2416,8 +2415,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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


