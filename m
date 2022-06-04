Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857453D522
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:09:45 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxL6e-0002Br-8x
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3I-0007XS-Br
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3F-0008VL-Sa
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id t2so8119464pld.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=piEshlp2jFC/OdebizTApyzI+JWPnaYL97UZKb5EMwo=;
 b=ZOVyZY3zM+X0gWHSRF36liR71y5ocMuRMXEoxov7pwXvBW5rwnUjnIkufJNfNPyJ0e
 wZUZTCWQ+7TQ8CrJdl/lBAjuZGRNjA1NWIkJtD0oO9sRk7I+VAlW3ICwqvSl808Qpnra
 G1Wde5zN0Js0uhaZH13EO/ohFFdYPT/R8zPXPrhoMjDi6Ke2vmCdwFfGYa9ya2z49H2W
 NZcD97jyd881E0EV/Qr6E/D+omTaVmcmyvOvLct833Tq6CmwAj4Qq0Ywh5uBPXRBgWNg
 tOyZt8kz/reiPnXHbSVU272e9K5jvzdkbe3aWG6sltcLoswldXHNZVIg7A9oLiYT4hk5
 pwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piEshlp2jFC/OdebizTApyzI+JWPnaYL97UZKb5EMwo=;
 b=5kQgCXdVG3ST61QCIS37QR/iS2WMpuPHkoDTezTIKMeqRi0kEHlSDWrpPHnq/eKE+4
 AF1/zPHVx8p3vtMlKO/EVhlMZ/qOU7LSNUqzt/a589qOjyD1aesSqS5OK8NigmeMrAcx
 LSYLyHVBXzuoZzLFxyW0mLB3NNrXQIcHm7V1psac4WqiUFqV+g4DgZ/29yV3Fir5xmdY
 Lgc3bX9ncATG9jBj1CA2zN0PxziOTa2EkQkqX7rXiclc5xfPFXbCZ/XShEzowxypzado
 HqWyg+awjE8LQyrxVrN85TXT0UkzD3CPu0ZZiPyV4Fhv++5oILEv2a4yMp5gDkoCfqeb
 AFXA==
X-Gm-Message-State: AOAM5312tzeKo135bDiJrJHvSI7e/xHQPcPeoFHpOZpRb6GlBgQD54Sx
 71qSlxOOWNnNUbTtos2S/dPxAr1c7wcONw==
X-Google-Smtp-Source: ABdhPJz9tMaaBeKSOyb1U0SxhMt9ADCWpENVc+rEKJLZoqtCBX8QkSHUKHlEU9U0jz0nIUQ9HLTeiQ==
X-Received: by 2002:a17:90a:680d:b0:1e2:ff55:da6 with SMTP id
 p13-20020a17090a680d00b001e2ff550da6mr31346548pjj.133.1654315572447; 
 Fri, 03 Jun 2022 21:06:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/28] target/arm: Move get_phys_addr_v5 to ptw.c
Date: Fri,  3 Jun 2022 21:05:42 -0700
Message-Id: <20220604040607.269301-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  15 +++--
 target/arm/helper.c | 137 +++-----------------------------------------
 target/arm/ptw.c    | 123 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+), 135 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index e2023ae750..2dbd97b8cb 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,16 +11,21 @@
 
 #ifndef CONFIG_USER_ONLY
 
+uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
+
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                  ARMCacheAttrs s1, ARMCacheAttrs s2);
 
-bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, int *prot,
-                      target_ulong *page_size,
-                      ARMMMUFaultInfo *fi);
+bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint32_t *table, uint32_t address);
+int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
+                  int ap, int domain_prot);
+
 bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, int *prot,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7015ce4efc..48294cb87c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10542,8 +10542,7 @@ bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
  * @ap:          The 3-bit access permissions (AP[2:0])
  * @domain_prot: The 2-bit domain access permissions
  */
-static inline int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                int ap, int domain_prot)
+int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap, int domain_prot)
 {
     bool is_user = regime_is_user(env, mmu_idx);
 
@@ -10746,8 +10745,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                     uint32_t *table, uint32_t address)
+bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                              uint32_t *table, uint32_t address)
 {
     /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
     TCR *tcr = regime_tcr(env, mmu_idx);
@@ -10846,8 +10845,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10875,8 +10874,8 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                     ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10904,128 +10903,6 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
-                      MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                      hwaddr *phys_ptr, int *prot,
-                      target_ulong *page_size,
-                      ARMMMUFaultInfo *fi)
-{
-    CPUState *cs = env_cpu(env);
-    int level = 1;
-    uint32_t table;
-    uint32_t desc;
-    int type;
-    int ap;
-    int domain = 0;
-    int domain_prot;
-    hwaddr phys_addr;
-    uint32_t dacr;
-
-    /* Pagetable walk.  */
-    /* Lookup l1 descriptor.  */
-    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
-        /* Section translation fault if page walk is disabled by PD0 or PD1 */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
-    if (fi->type != ARMFault_None) {
-        goto do_fault;
-    }
-    type = (desc & 3);
-    domain = (desc >> 5) & 0x0f;
-    if (regime_el(env, mmu_idx) == 1) {
-        dacr = env->cp15.dacr_ns;
-    } else {
-        dacr = env->cp15.dacr_s;
-    }
-    domain_prot = (dacr >> (domain * 2)) & 3;
-    if (type == 0) {
-        /* Section translation fault.  */
-        fi->type = ARMFault_Translation;
-        goto do_fault;
-    }
-    if (type != 2) {
-        level = 2;
-    }
-    if (domain_prot == 0 || domain_prot == 2) {
-        fi->type = ARMFault_Domain;
-        goto do_fault;
-    }
-    if (type == 2) {
-        /* 1Mb section.  */
-        phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-        ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
-    } else {
-        /* Lookup l2 entry.  */
-        if (type == 1) {
-            /* Coarse pagetable.  */
-            table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        } else {
-            /* Fine pagetable.  */
-            table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
-        }
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
-        if (fi->type != ARMFault_None) {
-            goto do_fault;
-        }
-        switch (desc & 3) {
-        case 0: /* Page translation fault.  */
-            fi->type = ARMFault_Translation;
-            goto do_fault;
-        case 1: /* 64k page.  */
-            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
-            ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
-            break;
-        case 2: /* 4k page.  */
-            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-            ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
-            break;
-        case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
-            if (type == 1) {
-                /* ARMv6/XScale extended small page format */
-                if (arm_feature(env, ARM_FEATURE_XSCALE)
-                    || arm_feature(env, ARM_FEATURE_V6)) {
-                    phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
-                } else {
-                    /* UNPREDICTABLE in ARMv5; we choose to take a
-                     * page translation fault.
-                     */
-                    fi->type = ARMFault_Translation;
-                    goto do_fault;
-                }
-            } else {
-                phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
-            }
-            ap = (desc >> 4) & 3;
-            break;
-        default:
-            /* Never happens, but compiler isn't smart enough to tell.  */
-            g_assert_not_reached();
-        }
-    }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
-        /* Access permission fault.  */
-        fi->type = ARMFault_Permission;
-        goto do_fault;
-    }
-    *phys_ptr = phys_addr;
-    return false;
-do_fault:
-    fi->domain = domain;
-    fi->level = level;
-    return true;
-}
-
 bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
                       hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 318000f6d9..09c4472628 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -13,6 +13,129 @@
 #include "ptw.h"
 
 
+static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             hwaddr *phys_ptr, int *prot,
+                             target_ulong *page_size,
+                             ARMMMUFaultInfo *fi)
+{
+    CPUState *cs = env_cpu(env);
+    int level = 1;
+    uint32_t table;
+    uint32_t desc;
+    int type;
+    int ap;
+    int domain = 0;
+    int domain_prot;
+    hwaddr phys_addr;
+    uint32_t dacr;
+
+    /* Pagetable walk.  */
+    /* Lookup l1 descriptor.  */
+    if (!get_level1_table_address(env, mmu_idx, &table, address)) {
+        /* Section translation fault if page walk is disabled by PD0 or PD1 */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                       mmu_idx, fi);
+    if (fi->type != ARMFault_None) {
+        goto do_fault;
+    }
+    type = (desc & 3);
+    domain = (desc >> 5) & 0x0f;
+    if (regime_el(env, mmu_idx) == 1) {
+        dacr = env->cp15.dacr_ns;
+    } else {
+        dacr = env->cp15.dacr_s;
+    }
+    domain_prot = (dacr >> (domain * 2)) & 3;
+    if (type == 0) {
+        /* Section translation fault.  */
+        fi->type = ARMFault_Translation;
+        goto do_fault;
+    }
+    if (type != 2) {
+        level = 2;
+    }
+    if (domain_prot == 0 || domain_prot == 2) {
+        fi->type = ARMFault_Domain;
+        goto do_fault;
+    }
+    if (type == 2) {
+        /* 1Mb section.  */
+        phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
+        ap = (desc >> 10) & 3;
+        *page_size = 1024 * 1024;
+    } else {
+        /* Lookup l2 entry.  */
+        if (type == 1) {
+            /* Coarse pagetable.  */
+            table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
+        } else {
+            /* Fine pagetable.  */
+            table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
+        }
+        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+                           mmu_idx, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        switch (desc & 3) {
+        case 0: /* Page translation fault.  */
+            fi->type = ARMFault_Translation;
+            goto do_fault;
+        case 1: /* 64k page.  */
+            phys_addr = (desc & 0xffff0000) | (address & 0xffff);
+            ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
+            *page_size = 0x10000;
+            break;
+        case 2: /* 4k page.  */
+            phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+            ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
+            *page_size = 0x1000;
+            break;
+        case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
+            if (type == 1) {
+                /* ARMv6/XScale extended small page format */
+                if (arm_feature(env, ARM_FEATURE_XSCALE)
+                    || arm_feature(env, ARM_FEATURE_V6)) {
+                    phys_addr = (desc & 0xfffff000) | (address & 0xfff);
+                    *page_size = 0x1000;
+                } else {
+                    /*
+                     * UNPREDICTABLE in ARMv5; we choose to take a
+                     * page translation fault.
+                     */
+                    fi->type = ARMFault_Translation;
+                    goto do_fault;
+                }
+            } else {
+                phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
+                *page_size = 0x400;
+            }
+            ap = (desc >> 4) & 3;
+            break;
+        default:
+            /* Never happens, but compiler isn't smart enough to tell.  */
+            g_assert_not_reached();
+        }
+    }
+    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    *prot |= *prot ? PAGE_EXEC : 0;
+    if (!(*prot & (1 << access_type))) {
+        /* Access permission fault.  */
+        fi->type = ARMFault_Permission;
+        goto do_fault;
+    }
+    *phys_ptr = phys_addr;
+    return false;
+do_fault:
+    fi->domain = domain;
+    fi->level = level;
+    return true;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


