Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3053D531
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:18:07 +0200 (CEST)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLEk-0000DK-DR
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3P-0007ru-SO
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3M-00006t-UG
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gd1so8715418pjb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F5967HU6ZDcdq/w7bIRWwPsJ0i/7AnNCaM6zuiPdJ7g=;
 b=lJrBryHARAPRxHJyZF9HnUx1nq1aF87miciwks4OXd4fmYfdlzIuSu4prPknoLVO9S
 dlmbihyKM87MnJlpIJJe52n7EM9iv59ejxOsJuknPofVf8uvfpXKF/4rgx/JGYYcmMIA
 Cg3PMzMVQC9CF8zsGeMHcwGDU3V14LcslrqNW4Um+q03wUJZRPS6qCYJG3l5I86F/gW7
 Yegkifv7PENWY23R2E7hXgV6XZH2k4SW48zLwaAeTih54GkcBTvrXfBQ+WIO5B7iM2tK
 u5rOIkpMvUKuAU2ruwwvWIA5EudI6xqa8Bjt1hTDW36NJcOvDFFsdKSeVC7Z+gDvDIFv
 eD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5967HU6ZDcdq/w7bIRWwPsJ0i/7AnNCaM6zuiPdJ7g=;
 b=7gKhJ/Ct2vzm8TNOUSqhYCtNG4Wv56XuCD1L54VQLrppiN6VtquDSJeOvHv6VBFV6A
 0nZQS10QLXj3wPFxKCek79+nG59ViLseGBz+N37Bt/rv6+81Xq6dxu/af6q+t25ejGoF
 mWHVe0bXqygJqW3tMctRG+kNmAZ5nGRajbXbHvyfGjG6UbkiqvWgWOXQBMc4aEUVg7ky
 vmhregr4tbfXpCZPBQ/3ugLgrTOo8tpfEi2YmrkaZNKR4OECTDPIsUpOsDNIefFYOL6T
 kW8e0PUC/6OEL6FGPNFaKgWmWnohY2MMCvkmkbIsTznSTIx8zvrjvEg8fRRSqYM5Bdso
 j4xw==
X-Gm-Message-State: AOAM5316hDsfErGAU9wqSA7s67Aj2XczVWZ+umKvvMA9L63aymVhPHuO
 HNNz6R8ZkqFfmY8wq9k/4sbIqEaOFmWSzQ==
X-Google-Smtp-Source: ABdhPJwIB/T+I6CuD7vbIGgG2QGjWGjdedJXn9Hsf/yh+RDw3m0S9lkH/HafZI9F8DTPe2fQpLFF9g==
X-Received: by 2002:a17:90a:de15:b0:1df:63dd:9cfc with SMTP id
 m21-20020a17090ade1500b001df63dd9cfcmr14317056pjv.200.1654315579607; 
 Fri, 03 Jun 2022 21:06:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/28] target/arm: Move v8m_security_lookup to ptw.c
Date: Fri,  3 Jun 2022 21:05:50 -0700
Message-Id: <20220604040607.269301-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This function has one private helper, v8m_is_sau_exempt,
so move that at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 123 ------------------------------------------
 target/arm/ptw.c    | 126 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 123 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2a5dab969..52655bbdf1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
 #include "internals.h"
@@ -11657,128 +11656,6 @@ bool m_is_system_region(CPUARMState *env, uint32_t address)
     return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
 }
 
-static bool v8m_is_sau_exempt(CPUARMState *env,
-                              uint32_t address, MMUAccessType access_type)
-{
-    /* The architecture specifies that certain address ranges are
-     * exempt from v8M SAU/IDAU checks.
-     */
-    return
-        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
-        (address >= 0xe0000000 && address <= 0xe0002fff) ||
-        (address >= 0xe000e000 && address <= 0xe000efff) ||
-        (address >= 0xe002e000 && address <= 0xe002efff) ||
-        (address >= 0xe0040000 && address <= 0xe0041fff) ||
-        (address >= 0xe00ff000 && address <= 0xe00fffff);
-}
-
-void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
-{
-    /* Look up the security attributes for this address. Compare the
-     * pseudocode SecurityCheck() function.
-     * We assume the caller has zero-initialized *sattrs.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    int r;
-    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
-    int idau_region = IREGION_NOTVALID;
-    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
-    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
-
-    if (cpu->idau) {
-        IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(cpu->idau);
-        IDAUInterface *ii = IDAU_INTERFACE(cpu->idau);
-
-        iic->check(ii, address, &idau_region, &idau_exempt, &idau_ns,
-                   &idau_nsc);
-    }
-
-    if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
-        /* 0xf0000000..0xffffffff is always S for insn fetches */
-        return;
-    }
-
-    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
-        return;
-    }
-
-    if (idau_region != IREGION_NOTVALID) {
-        sattrs->irvalid = true;
-        sattrs->iregion = idau_region;
-    }
-
-    switch (env->sau.ctrl & 3) {
-    case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
-        break;
-    case 2: /* SAU.ENABLE == 0, SAU.ALLNS == 1 */
-        sattrs->ns = true;
-        break;
-    default: /* SAU.ENABLE == 1 */
-        for (r = 0; r < cpu->sau_sregion; r++) {
-            if (env->sau.rlar[r] & 1) {
-                uint32_t base = env->sau.rbar[r] & ~0x1f;
-                uint32_t limit = env->sau.rlar[r] | 0x1f;
-
-                if (base <= address && limit >= address) {
-                    if (base > addr_page_base || limit < addr_page_limit) {
-                        sattrs->subpage = true;
-                    }
-                    if (sattrs->srvalid) {
-                        /* If we hit in more than one region then we must report
-                         * as Secure, not NS-Callable, with no valid region
-                         * number info.
-                         */
-                        sattrs->ns = false;
-                        sattrs->nsc = false;
-                        sattrs->sregion = 0;
-                        sattrs->srvalid = false;
-                        break;
-                    } else {
-                        if (env->sau.rlar[r] & 2) {
-                            sattrs->nsc = true;
-                        } else {
-                            sattrs->ns = true;
-                        }
-                        sattrs->srvalid = true;
-                        sattrs->sregion = r;
-                    }
-                } else {
-                    /*
-                     * Address not in this region. We must check whether the
-                     * region covers addresses in the same page as our address.
-                     * In that case we must not report a size that covers the
-                     * whole page for a subsequent hit against a different MPU
-                     * region or the background region, because it would result
-                     * in incorrect TLB hits for subsequent accesses to
-                     * addresses that are in this MPU region.
-                     */
-                    if (limit >= base &&
-                        ranges_overlap(base, limit - base + 1,
-                                       addr_page_base,
-                                       TARGET_PAGE_SIZE)) {
-                        sattrs->subpage = true;
-                    }
-                }
-            }
-        }
-        break;
-    }
-
-    /*
-     * The IDAU will override the SAU lookup results if it specifies
-     * higher security than the SAU does.
-     */
-    if (!idau_ns) {
-        if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
-            sattrs->ns = false;
-            sattrs->nsc = idau_nsc;
-        }
-    }
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b82638b5a0..c15fba43c3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -11,6 +11,7 @@
 #include "qemu/range.h"
 #include "cpu.h"
 #include "internals.h"
+#include "idau.h"
 #include "ptw.h"
 
 
@@ -766,6 +767,131 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool v8m_is_sau_exempt(CPUARMState *env,
+                              uint32_t address, MMUAccessType access_type)
+{
+    /*
+     * The architecture specifies that certain address ranges are
+     * exempt from v8M SAU/IDAU checks.
+     */
+    return
+        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
+        (address >= 0xe0000000 && address <= 0xe0002fff) ||
+        (address >= 0xe000e000 && address <= 0xe000efff) ||
+        (address >= 0xe002e000 && address <= 0xe002efff) ||
+        (address >= 0xe0040000 && address <= 0xe0041fff) ||
+        (address >= 0xe00ff000 && address <= 0xe00fffff);
+}
+
+void v8m_security_lookup(CPUARMState *env, uint32_t address,
+                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                V8M_SAttributes *sattrs)
+{
+    /*
+     * Look up the security attributes for this address. Compare the
+     * pseudocode SecurityCheck() function.
+     * We assume the caller has zero-initialized *sattrs.
+     */
+    ARMCPU *cpu = env_archcpu(env);
+    int r;
+    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
+    int idau_region = IREGION_NOTVALID;
+    uint32_t addr_page_base = address & TARGET_PAGE_MASK;
+    uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+
+    if (cpu->idau) {
+        IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(cpu->idau);
+        IDAUInterface *ii = IDAU_INTERFACE(cpu->idau);
+
+        iic->check(ii, address, &idau_region, &idau_exempt, &idau_ns,
+                   &idau_nsc);
+    }
+
+    if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
+        /* 0xf0000000..0xffffffff is always S for insn fetches */
+        return;
+    }
+
+    if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
+        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        return;
+    }
+
+    if (idau_region != IREGION_NOTVALID) {
+        sattrs->irvalid = true;
+        sattrs->iregion = idau_region;
+    }
+
+    switch (env->sau.ctrl & 3) {
+    case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
+        break;
+    case 2: /* SAU.ENABLE == 0, SAU.ALLNS == 1 */
+        sattrs->ns = true;
+        break;
+    default: /* SAU.ENABLE == 1 */
+        for (r = 0; r < cpu->sau_sregion; r++) {
+            if (env->sau.rlar[r] & 1) {
+                uint32_t base = env->sau.rbar[r] & ~0x1f;
+                uint32_t limit = env->sau.rlar[r] | 0x1f;
+
+                if (base <= address && limit >= address) {
+                    if (base > addr_page_base || limit < addr_page_limit) {
+                        sattrs->subpage = true;
+                    }
+                    if (sattrs->srvalid) {
+                        /*
+                         * If we hit in more than one region then we must report
+                         * as Secure, not NS-Callable, with no valid region
+                         * number info.
+                         */
+                        sattrs->ns = false;
+                        sattrs->nsc = false;
+                        sattrs->sregion = 0;
+                        sattrs->srvalid = false;
+                        break;
+                    } else {
+                        if (env->sau.rlar[r] & 2) {
+                            sattrs->nsc = true;
+                        } else {
+                            sattrs->ns = true;
+                        }
+                        sattrs->srvalid = true;
+                        sattrs->sregion = r;
+                    }
+                } else {
+                    /*
+                     * Address not in this region. We must check whether the
+                     * region covers addresses in the same page as our address.
+                     * In that case we must not report a size that covers the
+                     * whole page for a subsequent hit against a different MPU
+                     * region or the background region, because it would result
+                     * in incorrect TLB hits for subsequent accesses to
+                     * addresses that are in this MPU region.
+                     */
+                    if (limit >= base &&
+                        ranges_overlap(base, limit - base + 1,
+                                       addr_page_base,
+                                       TARGET_PAGE_SIZE)) {
+                        sattrs->subpage = true;
+                    }
+                }
+            }
+        }
+        break;
+    }
+
+    /*
+     * The IDAU will override the SAU lookup results if it specifies
+     * higher security than the SAU does.
+     */
+    if (!idau_ns) {
+        if (sattrs->ns || (!idau_nsc && sattrs->nsc)) {
+            sattrs->ns = false;
+            sattrs->nsc = idau_nsc;
+        }
+    }
+}
+
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
-- 
2.34.1


