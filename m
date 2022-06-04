Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AF53D52A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:14:18 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLB3-0000dT-Gx
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3L-0007ek-ER
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3H-0008WA-LU
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i1so8113218plg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfCuj2+ZK81PcqSyuUrPk3wYk32Me+jVf6nfUPCq22M=;
 b=SRkuTUTOOdU1xaCN0L5a3BKpyG39z4DEbvKtyBu8PsNLUMtg4HMn1b4j2lnfp8j4o4
 xPfVh0fj0ihFP3idEeTS6KxIsPsg3of0RMUrNIK+8pj+v6IstFp7klxzgi3LSyye0ON2
 1zoWFRjGS/ye8S+o9OrI2KMkIdaDJapUE7zZODRZw4D0Cz6qcCsjOqg00h37SwW5PG9V
 ulICrrWK81ZLCskWv3g06d3gSe+ovcrYYy1V3AqmOAMLqIl6KiCIULnP1mPZpm6xb8/t
 SD8UZP2s/OfgQjAAMk1ARWhftE5c5rtXC0BpmWsI/R0rlyP8KZtRoFdgfMVGHDY5BDCZ
 IMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfCuj2+ZK81PcqSyuUrPk3wYk32Me+jVf6nfUPCq22M=;
 b=0bdXS8g9eU/Z+JyVKWD8adTrRxnbObNJ8xBmCPlufTn2vgrwORrnvpWnOMKaF05HHS
 h3SQLhN62/jPdD2vevsBDjiax6HKErO+CADzuz8tIXGpUoKGqz4qVQzBljd3gkA4Uf/S
 JDUJKORY5GzwH/b2YUH9srZ+rW2fKfWxecLldoqRhb+QC3Nm2OnR7IYkSe+UxOMTwqGV
 jEaLGQ5LunZtw+Lp10ou6ER3/bXXXUgNLkPWivE7pALadl4SXam4PEw0WB7T2qAWfJLi
 sWLzXD+nJxWGmeme0hmdov9d3ddMitEFAORWMTiwy+oW7ktNk1Guc4T4bsqlAXSuLnA1
 fjhA==
X-Gm-Message-State: AOAM530YH4zfKczhvXZDHPpBBUO6iB3FWG5EO5Osb1r2xhWV2kE5aYn4
 OQI+vXfO39vNlxKo4TFinHQe5V6PedOtdg==
X-Google-Smtp-Source: ABdhPJzEaGlm+aj0lr1F4U+XhkNd1BZJC1m3ueMlw62NKE1w7UIvSwGjOY+ljMgtN8Lec8Dz6ABFrQ==
X-Received: by 2002:a17:90a:fa5:b0:1e2:ee1b:8f85 with SMTP id
 34-20020a17090a0fa500b001e2ee1b8f85mr14118200pjz.216.1654315574322; 
 Fri, 03 Jun 2022 21:06:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/28] target/arm: Move get_phys_addr_pmsav5 to ptw.c
Date: Fri,  3 Jun 2022 21:05:44 -0700
Message-Id: <20220604040607.269301-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 target/arm/ptw.h    |  4 ---
 target/arm/helper.c | 85 ---------------------------------------------
 target/arm/ptw.c    | 85 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 89 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 349b842d3c..324a9dde14 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,10 +33,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          ARMMMUFaultInfo *fi);
 bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fab91f823a..31abcf6fc9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12238,91 +12238,6 @@ bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     return ret;
 }
 
-bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          ARMMMUFaultInfo *fi)
-{
-    int n;
-    uint32_t mask;
-    uint32_t base;
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    if (regime_translation_disabled(env, mmu_idx)) {
-        /* MPU disabled.  */
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return false;
-    }
-
-    *phys_ptr = address;
-    for (n = 7; n >= 0; n--) {
-        base = env->cp15.c6_region[n];
-        if ((base & 1) == 0) {
-            continue;
-        }
-        mask = 1 << ((base >> 1) & 0x1f);
-        /* Keep this shift separate from the above to avoid an
-           (undefined) << 32.  */
-        mask = (mask << 1) - 1;
-        if (((base ^ address) & ~mask) == 0) {
-            break;
-        }
-    }
-    if (n < 0) {
-        fi->type = ARMFault_Background;
-        return true;
-    }
-
-    if (access_type == MMU_INST_FETCH) {
-        mask = env->cp15.pmsav5_insn_ap;
-    } else {
-        mask = env->cp15.pmsav5_data_ap;
-    }
-    mask = (mask >> (n * 4)) & 0xf;
-    switch (mask) {
-    case 0:
-        fi->type = ARMFault_Permission;
-        fi->level = 1;
-        return true;
-    case 1:
-        if (is_user) {
-            fi->type = ARMFault_Permission;
-            fi->level = 1;
-            return true;
-        }
-        *prot = PAGE_READ | PAGE_WRITE;
-        break;
-    case 2:
-        *prot = PAGE_READ;
-        if (!is_user) {
-            *prot |= PAGE_WRITE;
-        }
-        break;
-    case 3:
-        *prot = PAGE_READ | PAGE_WRITE;
-        break;
-    case 5:
-        if (is_user) {
-            fi->type = ARMFault_Permission;
-            fi->level = 1;
-            return true;
-        }
-        *prot = PAGE_READ;
-        break;
-    case 6:
-        *prot = PAGE_READ;
-        break;
-    default:
-        /* Bad permission.  */
-        fi->type = ARMFault_Permission;
-        fi->level = 1;
-        return true;
-    }
-    *prot |= PAGE_EXEC;
-    return false;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6a1f4b549d..5c32648a16 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -289,6 +289,91 @@ do_fault:
     return true;
 }
 
+static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, int *prot,
+                                 ARMMMUFaultInfo *fi)
+{
+    int n;
+    uint32_t mask;
+    uint32_t base;
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    if (regime_translation_disabled(env, mmu_idx)) {
+        /* MPU disabled.  */
+        *phys_ptr = address;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return false;
+    }
+
+    *phys_ptr = address;
+    for (n = 7; n >= 0; n--) {
+        base = env->cp15.c6_region[n];
+        if ((base & 1) == 0) {
+            continue;
+        }
+        mask = 1 << ((base >> 1) & 0x1f);
+        /* Keep this shift separate from the above to avoid an
+           (undefined) << 32.  */
+        mask = (mask << 1) - 1;
+        if (((base ^ address) & ~mask) == 0) {
+            break;
+        }
+    }
+    if (n < 0) {
+        fi->type = ARMFault_Background;
+        return true;
+    }
+
+    if (access_type == MMU_INST_FETCH) {
+        mask = env->cp15.pmsav5_insn_ap;
+    } else {
+        mask = env->cp15.pmsav5_data_ap;
+    }
+    mask = (mask >> (n * 4)) & 0xf;
+    switch (mask) {
+    case 0:
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
+        return true;
+    case 1:
+        if (is_user) {
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
+            return true;
+        }
+        *prot = PAGE_READ | PAGE_WRITE;
+        break;
+    case 2:
+        *prot = PAGE_READ;
+        if (!is_user) {
+            *prot |= PAGE_WRITE;
+        }
+        break;
+    case 3:
+        *prot = PAGE_READ | PAGE_WRITE;
+        break;
+    case 5:
+        if (is_user) {
+            fi->type = ARMFault_Permission;
+            fi->level = 1;
+            return true;
+        }
+        *prot = PAGE_READ;
+        break;
+    case 6:
+        *prot = PAGE_READ;
+        break;
+    default:
+        /* Bad permission.  */
+        fi->type = ARMFault_Permission;
+        fi->level = 1;
+        return true;
+    }
+    *prot |= PAGE_EXEC;
+    return false;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


