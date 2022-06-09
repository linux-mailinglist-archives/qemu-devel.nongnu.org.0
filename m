Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B310544860
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:09:16 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzF6J-0002c8-IL
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE77-0001XE-Ko
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:01 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE75-0005zr-Fk
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so21096176wra.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7p331RrRhxlmCYz1Fu61IkjHxiG1EXhXcEiGzFLN0kw=;
 b=Nzac9gLVaxxc32tKrtQRJAZuVDIlh9ntgDd7nqzjeEZGkyB3+ttOeAzGG0C0KS8Fku
 uZHHp35VMOXdSQpOzFmKThuy7hip9G2q+91v29aIF5WY+1CNviyEMy43+O8lGcihvi+Z
 DRQwJLFknxYYjC/LmP4t6P5Fa3r27PPNXZ6k2S+EmAdFKRcAHMeqcTmjmfYCr+HuuUqp
 BsSuu6aInbx8xqVdQl4sMCoCRLmCYYWSHgI1Xnt2c/BFZ1Ce/driy9R1DbRzjehma6L8
 n08XOq9DGzM6s6MB5F4SfQMDT9YsyeTnxslgrDHms4d0OH9Z/DVNTjS1c95fhxZvehxz
 naew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7p331RrRhxlmCYz1Fu61IkjHxiG1EXhXcEiGzFLN0kw=;
 b=r+Dnfm/BX7Diqz9uDfpoKLglXnpO4Odh/5MkgcV1sW8k394fQ6lKJt4MVOiHWL0enV
 2DHH/TLmR+9PeWTEZZUPXMPukiOvECrQgwpBjC92GbRcRiTNRC0TMsN3fgle5ksXzE4Q
 GihwMMav+iXnKzOL17ke9SlfoNX0i9tYBe8aYUH97PBcrY7SV0DsHo/FOadUabBaTlHb
 c71eqB5BfYDhLqEIScrJBnMPx2I3E0nD1UBPhHZOEMkuQwIw/T/Gd4dTMeLzOqqSo4VF
 QioSYYbrdqDIqmMYBFvX1qrWU39TJuiDwZW6z4jLIZBVTsVumuT5rkSGBvzUwZfYja5n
 ihBw==
X-Gm-Message-State: AOAM531F66Yceor/PpQSmUrNPlIq+dASWxUbGw5kf+COxQKP6oBs6nNK
 H/ZSZFK02ZcP2rmrd8l7OF5tK6mslnMg/w==
X-Google-Smtp-Source: ABdhPJz02w52zl0UOdN5/7nLDCCMXdlPXy2br+xLzrJMPjkLfDil+JbQblmFgV/f/++LP9uviOq+lQ==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr30972761wrw.486.1654765558598; 
 Thu, 09 Jun 2022 02:05:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/55] target/arm: Move pmsav8_mpu_lookup to ptw.c
Date: Thu,  9 Jun 2022 10:04:58 +0100
Message-Id: <20220609090537.1971756-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This is the final user of get_phys_addr_pmsav7_default
within helper.c, so make it static within ptw.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-10-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |   3 -
 target/arm/helper.c | 136 -----------------------------------------
 target/arm/ptw.c    | 146 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 143 insertions(+), 142 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d569507951f..8d2e2397147 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -36,9 +36,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 bool m_is_ppb_region(CPUARMState *env, uint32_t address);
 bool m_is_system_region(CPUARMState *env, uint32_t address);
 
-void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                  ARMMMUIdx mmu_idx,
-                                  int32_t address, int *prot);
 bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
 
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44997fd179d..cb23413d8e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11834,142 +11834,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 }
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                              hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                              int *prot, bool *is_subpage,
-                              ARMMMUFaultInfo *fi, uint32_t *mregion)
-{
-    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
-     * that a full phys-to-virt translation does).
-     * mregion is (if not NULL) set to the region number which matched,
-     * or -1 if no region number is returned (MPU off, address did not
-     * hit a region, address hit in multiple regions).
-     * We set is_subpage to true if the region hit doesn't cover the
-     * entire TARGET_PAGE the address is within.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
-    int n;
-    int matchregion = -1;
-    bool hit = false;
-    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
-    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
-
-    *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
-    if (mregion) {
-        *mregion = -1;
-    }
-
-    /* Unlike the ARM ARM pseudocode, we don't need to check whether this
-     * was an exception vector read from the vector table (which is always
-     * done using the default system address map), because those accesses
-     * are done in arm_v7m_load_vector(), which always does a direct
-     * read using address_space_ldl(), rather than going via this function.
-     */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
-        hit = true;
-    } else if (m_is_ppb_region(env, address)) {
-        hit = true;
-    } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
-            hit = true;
-        }
-
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
-            /* region search */
-            /* Note that the base address is bits [31:5] from the register
-             * with bits [4:0] all zeroes, but the limit address is bits
-             * [31:5] from the register with bits [4:0] all ones.
-             */
-            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
-            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
-
-            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
-                /* Region disabled */
-                continue;
-            }
-
-            if (address < base || address > limit) {
-                /*
-                 * Address not in this region. We must check whether the
-                 * region covers addresses in the same page as our address.
-                 * In that case we must not report a size that covers the
-                 * whole page for a subsequent hit against a different MPU
-                 * region or the background region, because it would result in
-                 * incorrect TLB hits for subsequent accesses to addresses that
-                 * are in this MPU region.
-                 */
-                if (limit >= base &&
-                    ranges_overlap(base, limit - base + 1,
-                                   addr_page_base,
-                                   TARGET_PAGE_SIZE)) {
-                    *is_subpage = true;
-                }
-                continue;
-            }
-
-            if (base > addr_page_base || limit < addr_page_limit) {
-                *is_subpage = true;
-            }
-
-            if (matchregion != -1) {
-                /* Multiple regions match -- always a failure (unlike
-                 * PMSAv7 where highest-numbered-region wins)
-                 */
-                fi->type = ARMFault_Permission;
-                fi->level = 1;
-                return true;
-            }
-
-            matchregion = n;
-            hit = true;
-        }
-    }
-
-    if (!hit) {
-        /* background fault */
-        fi->type = ARMFault_Background;
-        return true;
-    }
-
-    if (matchregion == -1) {
-        /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
-    } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
-        bool pxn = false;
-
-        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
-            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
-        }
-
-        if (m_is_system_region(env, address)) {
-            /* System space is always execute never */
-            xn = 1;
-        }
-
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
-        }
-        /* We don't need to look the attribute up in the MAIR0/MAIR1
-         * registers because that only tells us about cacheability.
-         */
-        if (mregion) {
-            *mregion = matchregion;
-        }
-    }
-
-    fi->type = ARMFault_Permission;
-    fi->level = 1;
-    return !(*prot & (1 << access_type));
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 28caa7a7ae0..989e783cce9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -375,9 +375,8 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
-void get_phys_addr_pmsav7_default(CPUARMState *env,
-                                  ARMMMUIdx mmu_idx,
-                                  int32_t address, int *prot)
+static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                         int32_t address, int *prot)
 {
     if (!arm_feature(env, ARM_FEATURE_M)) {
         *prot = PAGE_READ | PAGE_WRITE;
@@ -605,6 +604,147 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                       int *prot, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+{
+    /*
+     * Perform a PMSAv8 MPU lookup (without also doing the SAU check
+     * that a full phys-to-virt translation does).
+     * mregion is (if not NULL) set to the region number which matched,
+     * or -1 if no region number is returned (MPU off, address did not
+     * hit a region, address hit in multiple regions).
+     * We set is_subpage to true if the region hit doesn't cover the
+     * entire TARGET_PAGE the address is within.
+     */
+    ARMCPU *cpu = env_archcpu(env);
+    bool is_user = regime_is_user(env, mmu_idx);
+    uint32_t secure = regime_is_secure(env, mmu_idx);
+    int n;
+    int matchregion = -1;
+    bool hit = false;
+    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
+    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+
+    *is_subpage = false;
+    *phys_ptr = address;
+    *prot = 0;
+    if (mregion) {
+        *mregion = -1;
+    }
+
+    /*
+     * Unlike the ARM ARM pseudocode, we don't need to check whether this
+     * was an exception vector read from the vector table (which is always
+     * done using the default system address map), because those accesses
+     * are done in arm_v7m_load_vector(), which always does a direct
+     * read using address_space_ldl(), rather than going via this function.
+     */
+    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+        hit = true;
+    } else if (m_is_ppb_region(env, address)) {
+        hit = true;
+    } else {
+        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            hit = true;
+        }
+
+        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+            /* region search */
+            /*
+             * Note that the base address is bits [31:5] from the register
+             * with bits [4:0] all zeroes, but the limit address is bits
+             * [31:5] from the register with bits [4:0] all ones.
+             */
+            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
+            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
+
+            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
+                /* Region disabled */
+                continue;
+            }
+
+            if (address < base || address > limit) {
+                /*
+                 * Address not in this region. We must check whether the
+                 * region covers addresses in the same page as our address.
+                 * In that case we must not report a size that covers the
+                 * whole page for a subsequent hit against a different MPU
+                 * region or the background region, because it would result in
+                 * incorrect TLB hits for subsequent accesses to addresses that
+                 * are in this MPU region.
+                 */
+                if (limit >= base &&
+                    ranges_overlap(base, limit - base + 1,
+                                   addr_page_base,
+                                   TARGET_PAGE_SIZE)) {
+                    *is_subpage = true;
+                }
+                continue;
+            }
+
+            if (base > addr_page_base || limit < addr_page_limit) {
+                *is_subpage = true;
+            }
+
+            if (matchregion != -1) {
+                /*
+                 * Multiple regions match -- always a failure (unlike
+                 * PMSAv7 where highest-numbered-region wins)
+                 */
+                fi->type = ARMFault_Permission;
+                fi->level = 1;
+                return true;
+            }
+
+            matchregion = n;
+            hit = true;
+        }
+    }
+
+    if (!hit) {
+        /* background fault */
+        fi->type = ARMFault_Background;
+        return true;
+    }
+
+    if (matchregion == -1) {
+        /* hit using the background region */
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    } else {
+        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
+        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
+
+        if (m_is_system_region(env, address)) {
+            /* System space is always execute never */
+            xn = 1;
+        }
+
+        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (*prot && !xn && !(pxn && !is_user)) {
+            *prot |= PAGE_EXEC;
+        }
+        /*
+         * We don't need to look the attribute up in the MAIR0/MAIR1
+         * registers because that only tells us about cacheability.
+         */
+        if (mregion) {
+            *mregion = matchregion;
+        }
+    }
+
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
+    return !(*prot & (1 << access_type));
+}
+
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
-- 
2.25.1


