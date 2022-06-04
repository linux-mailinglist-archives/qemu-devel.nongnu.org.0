Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A853D52D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:15:18 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLC1-0002No-9y
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3O-0007mk-Av
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3J-00005A-LC
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:21 -0400
Received: by mail-pl1-x629.google.com with SMTP id s12so8162795plp.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NctaESQkS6SHggf4ezkVBbUsKRRYeqf7q0h0PynyYk0=;
 b=C12WMYnxVgWf7iIBSuFZ+EpmGdJKktMSUGw88p7VWTjBmc+eMzHoTdX7miwWNCix6M
 xbgDe1v9bxgZZN4M3mKvTFgaioFu+tCWjY6U1dzTBQse8cj4CkmarGgyhXurU2cUs/FJ
 uQoADpzpdSpBW5vmYlv1bPkkPrutgND6uMOeljw1jjKivYDwWdkQlpCwS91j2sQlHiSZ
 5lxtxnplEiQDYDcQoegAjbjB4seMP0PE2huKohOvm9gXTgCewqX2Yu70sENr8crrnjbJ
 O2GotYSnnOF5uBqq6cg6EdBjGM1VgY/ZOURt/vjrx+QLCTv/rJW4Ox9Tlln1xKG2/9Y+
 QPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NctaESQkS6SHggf4ezkVBbUsKRRYeqf7q0h0PynyYk0=;
 b=IPPtWdA+qCMsSrg0eKHAYhnHJ2kJAXPaji9WbF0Uvsy84sMUz5M17XypmprmNO32Dw
 hCresIt7z7ZvFqJIjXSksdk+XR774bXOcLh3VHyD+DJac1NbH3vUb2wenEUP3RdTqmdr
 6PA6YH9jSke0gDikjyBnMaTy9c+5gR/ralgUePmdoFmq9zppkgViV4O90Gz7dlykQPB5
 Y8M+ivXOLaD0yfQ2jMhfiZwY43niI5poftEDreedJYFE4F6aw9P7B4XtmLqsBnPbF/oV
 baa3/4URkQCS8miO82oy8OvnfDME95UkfsffclvAgjL+RLCsQFgG3PXJU1+06hiobDvb
 bIKw==
X-Gm-Message-State: AOAM530E5TRrXMzqml2vz0IS/DlSPzsLUZBqztbP3oYwfOrLhFS1bzXy
 UJzGNVdYAZYhyCMHbuXPuAHVpfd0JFnSyw==
X-Google-Smtp-Source: ABdhPJzvI7JWTi7GE2fURc+tn3syWDFsFmqUxOfWAOn28V2lj2UWvXRDsjrj1WKQUxIOFVfV/XmONA==
X-Received: by 2002:a17:902:bb90:b0:163:ad4c:624b with SMTP id
 m16-20020a170902bb9000b00163ad4c624bmr12894373pls.87.1654315576054; 
 Fri, 03 Jun 2022 21:06:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/28] target/arm: Move get_phys_addr_pmsav7 to ptw.c
Date: Fri,  3 Jun 2022 21:05:46 -0700
Message-Id: <20220604040607.269301-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/ptw.h    |  10 +--
 target/arm/helper.c | 194 +-------------------------------------------
 target/arm/ptw.c    | 190 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+), 196 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d6e3fee152..d24b7c263a 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,14 +33,14 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
+bool m_is_ppb_region(CPUARMState *env, uint32_t address);
+bool m_is_system_region(CPUARMState *env, uint32_t address);
+
 void get_phys_addr_pmsav7_default(CPUARMState *env,
                                   ARMMMUIdx mmu_idx,
                                   int32_t address, int *prot);
-bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi);
+bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
+
 bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *txattrs,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7dd54c1863..9cbf3422ec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11642,8 +11642,7 @@ do_fault:
     return true;
 }
 
-static bool pmsav7_use_background_region(ARMCPU *cpu,
-                                         ARMMMUIdx mmu_idx, bool is_user)
+bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user)
 {
     /* Return true if we should use the default memory map as a
      * "background" region if there are no hits against any MPU regions.
@@ -11662,14 +11661,14 @@ static bool pmsav7_use_background_region(ARMCPU *cpu,
     }
 }
 
-static inline bool m_is_ppb_region(CPUARMState *env, uint32_t address)
+bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
     return arm_feature(env, ARM_FEATURE_M) &&
         extract32(address, 20, 12) == 0xe00;
 }
 
-static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
+bool m_is_system_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile system region
      * 0xe0000000 - 0xffffffff
@@ -11677,193 +11676,6 @@ static inline bool m_is_system_region(CPUARMState *env, uint32_t address)
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
 }
 
-bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int n;
-    bool is_user = regime_is_user(env, mmu_idx);
-
-    *phys_ptr = address;
-    *page_size = TARGET_PAGE_SIZE;
-    *prot = 0;
-
-    if (regime_translation_disabled(env, mmu_idx) ||
-        m_is_ppb_region(env, address)) {
-        /* MPU disabled or M profile PPB access: use default memory map.
-         * The other case which uses the default memory map in the
-         * v7M ARM ARM pseudocode is exception vector reads from the vector
-         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
-         * which always does a direct read using address_space_ldl(), rather
-         * than going via this function, so we don't need to check that here.
-         */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-    } else { /* MPU enabled */
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
-            /* region search */
-            uint32_t base = env->pmsav7.drbar[n];
-            uint32_t rsize = extract32(env->pmsav7.drsr[n], 1, 5);
-            uint32_t rmask;
-            bool srdis = false;
-
-            if (!(env->pmsav7.drsr[n] & 0x1)) {
-                continue;
-            }
-
-            if (!rsize) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "DRSR[%d]: Rsize field cannot be 0\n", n);
-                continue;
-            }
-            rsize++;
-            rmask = (1ull << rsize) - 1;
-
-            if (base & rmask) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
-                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
-                              n, base, rmask);
-                continue;
-            }
-
-            if (address < base || address > base + rmask) {
-                /*
-                 * Address not in this region. We must check whether the
-                 * region covers addresses in the same page as our address.
-                 * In that case we must not report a size that covers the
-                 * whole page for a subsequent hit against a different MPU
-                 * region or the background region, because it would result in
-                 * incorrect TLB hits for subsequent accesses to addresses that
-                 * are in this MPU region.
-                 */
-                if (ranges_overlap(base, rmask,
-                                   address & TARGET_PAGE_MASK,
-                                   TARGET_PAGE_SIZE)) {
-                    *page_size = 1;
-                }
-                continue;
-            }
-
-            /* Region matched */
-
-            if (rsize >= 8) { /* no subregions for regions < 256 bytes */
-                int i, snd;
-                uint32_t srdis_mask;
-
-                rsize -= 3; /* sub region size (power of 2) */
-                snd = ((address - base) >> rsize) & 0x7;
-                srdis = extract32(env->pmsav7.drsr[n], snd + 8, 1);
-
-                srdis_mask = srdis ? 0x3 : 0x0;
-                for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
-                    /* This will check in groups of 2, 4 and then 8, whether
-                     * the subregion bits are consistent. rsize is incremented
-                     * back up to give the region size, considering consistent
-                     * adjacent subregions as one region. Stop testing if rsize
-                     * is already big enough for an entire QEMU page.
-                     */
-                    int snd_rounded = snd & ~(i - 1);
-                    uint32_t srdis_multi = extract32(env->pmsav7.drsr[n],
-                                                     snd_rounded + 8, i);
-                    if (srdis_mask ^ srdis_multi) {
-                        break;
-                    }
-                    srdis_mask = (srdis_mask << i) | srdis_mask;
-                    rsize++;
-                }
-            }
-            if (srdis) {
-                continue;
-            }
-            if (rsize < TARGET_PAGE_BITS) {
-                *page_size = 1 << rsize;
-            }
-            break;
-        }
-
-        if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
-                /* background fault */
-                fi->type = ARMFault_Background;
-                return true;
-            }
-            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-        } else { /* a MPU hit! */
-            uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
-            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
-
-            if (m_is_system_region(env, address)) {
-                /* System space is always execute never */
-                xn = 1;
-            }
-
-            if (is_user) { /* User mode AP bit decoding */
-                switch (ap) {
-                case 0:
-                case 1:
-                case 5:
-                    break; /* no access */
-                case 3:
-                    *prot |= PAGE_WRITE;
-                    /* fall through */
-                case 2:
-                case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
-                    break;
-                case 7:
-                    /* for v7M, same as 6; for R profile a reserved value */
-                    if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
-                        break;
-                    }
-                    /* fall through */
-                default:
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "DRACR[%d]: Bad value for AP bits: 0x%"
-                                  PRIx32 "\n", n, ap);
-                }
-            } else { /* Priv. mode AP bits decoding */
-                switch (ap) {
-                case 0:
-                    break; /* no access */
-                case 1:
-                case 2:
-                case 3:
-                    *prot |= PAGE_WRITE;
-                    /* fall through */
-                case 5:
-                case 6:
-                    *prot |= PAGE_READ | PAGE_EXEC;
-                    break;
-                case 7:
-                    /* for v7M, same as 6; for R profile a reserved value */
-                    if (arm_feature(env, ARM_FEATURE_M)) {
-                        *prot |= PAGE_READ | PAGE_EXEC;
-                        break;
-                    }
-                    /* fall through */
-                default:
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "DRACR[%d]: Bad value for AP bits: 0x%"
-                                  PRIx32 "\n", n, ap);
-                }
-            }
-
-            /* execute never */
-            if (xn) {
-                *prot &= ~PAGE_EXEC;
-            }
-        }
-    }
-
-    fi->type = ARMFault_Permission;
-    fi->level = 1;
-    return !(*prot & (1 << access_type));
-}
-
 static bool v8m_is_sau_exempt(CPUARMState *env,
                               uint32_t address, MMUAccessType access_type)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 74650c6c52..27715dbfa8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/range.h"
 #include "cpu.h"
 #include "internals.h"
 #include "ptw.h"
@@ -415,6 +416,195 @@ void get_phys_addr_pmsav7_default(CPUARMState *env,
     }
 }
 
+static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, int *prot,
+                                 target_ulong *page_size,
+                                 ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int n;
+    bool is_user = regime_is_user(env, mmu_idx);
+
+    *phys_ptr = address;
+    *page_size = TARGET_PAGE_SIZE;
+    *prot = 0;
+
+    if (regime_translation_disabled(env, mmu_idx) ||
+        m_is_ppb_region(env, address)) {
+        /*
+         * MPU disabled or M profile PPB access: use default memory map.
+         * The other case which uses the default memory map in the
+         * v7M ARM ARM pseudocode is exception vector reads from the vector
+         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
+         * which always does a direct read using address_space_ldl(), rather
+         * than going via this function, so we don't need to check that here.
+         */
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    } else { /* MPU enabled */
+        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+            /* region search */
+            uint32_t base = env->pmsav7.drbar[n];
+            uint32_t rsize = extract32(env->pmsav7.drsr[n], 1, 5);
+            uint32_t rmask;
+            bool srdis = false;
+
+            if (!(env->pmsav7.drsr[n] & 0x1)) {
+                continue;
+            }
+
+            if (!rsize) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "DRSR[%d]: Rsize field cannot be 0\n", n);
+                continue;
+            }
+            rsize++;
+            rmask = (1ull << rsize) - 1;
+
+            if (base & rmask) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "DRBAR[%d]: 0x%" PRIx32 " misaligned "
+                              "to DRSR region size, mask = 0x%" PRIx32 "\n",
+                              n, base, rmask);
+                continue;
+            }
+
+            if (address < base || address > base + rmask) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (ranges_overlap(base, rmask,
+                                   address & TARGET_PAGE_MASK,
+                                   TARGET_PAGE_SIZE)) {
+                    *page_size = 1;
+                }
+                continue;
+            }
+
+            /* Region matched */
+
+            if (rsize >= 8) { /* no subregions for regions < 256 bytes */
+                int i, snd;
+                uint32_t srdis_mask;
+
+                rsize -= 3; /* sub region size (power of 2) */
+                snd = ((address - base) >> rsize) & 0x7;
+                srdis = extract32(env->pmsav7.drsr[n], snd + 8, 1);
+
+                srdis_mask = srdis ? 0x3 : 0x0;
+                for (i = 2; i <= 8 && rsize < TARGET_PAGE_BITS; i *= 2) {
+                    /*
+                     * This will check in groups of 2, 4 and then 8, whether
+                     * the subregion bits are consistent. rsize is incremented
+                     * back up to give the region size, considering consistent
+                     * adjacent subregions as one region. Stop testing if rsize
+                     * is already big enough for an entire QEMU page.
+                     */
+                    int snd_rounded = snd & ~(i - 1);
+                    uint32_t srdis_multi = extract32(env->pmsav7.drsr[n],
+                                                     snd_rounded + 8, i);
+                    if (srdis_mask ^ srdis_multi) {
+                        break;
+                    }
+                    srdis_mask = (srdis_mask << i) | srdis_mask;
+                    rsize++;
+                }
+            }
+            if (srdis) {
+                continue;
+            }
+            if (rsize < TARGET_PAGE_BITS) {
+                *page_size = 1 << rsize;
+            }
+            break;
+        }
+
+        if (n == -1) { /* no hits */
+            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+                /* background fault */
+                fi->type = ARMFault_Background;
+                return true;
+            }
+            get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        } else { /* a MPU hit! */
+            uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
+            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
+
+            if (m_is_system_region(env, address)) {
+                /* System space is always execute never */
+                xn = 1;
+            }
+
+            if (is_user) { /* User mode AP bit decoding */
+                switch (ap) {
+                case 0:
+                case 1:
+                case 5:
+                    break; /* no access */
+                case 3:
+                    *prot |= PAGE_WRITE;
+                    /* fall through */
+                case 2:
+                case 6:
+                    *prot |= PAGE_READ | PAGE_EXEC;
+                    break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
+                default:
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "DRACR[%d]: Bad value for AP bits: 0x%"
+                                  PRIx32 "\n", n, ap);
+                }
+            } else { /* Priv. mode AP bits decoding */
+                switch (ap) {
+                case 0:
+                    break; /* no access */
+                case 1:
+                case 2:
+                case 3:
+                    *prot |= PAGE_WRITE;
+                    /* fall through */
+                case 5:
+                case 6:
+                    *prot |= PAGE_READ | PAGE_EXEC;
+                    break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
+                default:
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "DRACR[%d]: Bad value for AP bits: 0x%"
+                                  PRIx32 "\n", n, ap);
+                }
+            }
+
+            /* execute never */
+            if (xn) {
+                *prot &= ~PAGE_EXEC;
+            }
+        }
+    }
+
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
+    return !(*prot & (1 << access_type));
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
-- 
2.34.1


