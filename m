Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB039564679
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:42:26 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w7V-0000Kh-KX
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7v00-0002C2-OW
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzy-0006oZ-Kd
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id s21so2000322pjq.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/Z8gbQenSvpu+j6hmlZ/8di1MxPW1VxNbRQmZjhvR4=;
 b=fkRvBdXwYldU43aVr6whfmoNdoJqe+/U9Al13yIqcgoJJ+TAEt8rXOHG4hZ4XJbCi2
 E/5q6v/1k9Yq9wYVkBdj70TlwplWOg908pJ22zlSfWNM8h4WlL03Ato/oXF9wLV4O4fI
 Rqjcn0I4/7VPNmXGsiMlxu8W4H+UvW2EY7rcdCrLU91+gjGMLqs5U1+oB+NF0SE6/j/c
 S1LcSAjnfqbadFi9p6U2vrS/vjSPTj/Q0ko7aVHsx00l615aKXgSWuQt7W1NgUIUCDal
 7SEZk0Zxaat75xyNwljAbyRi2S03BZVnX3PyyxPwriKIrJSkQvOISP/Y4kfPdr8Gb3II
 RqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/Z8gbQenSvpu+j6hmlZ/8di1MxPW1VxNbRQmZjhvR4=;
 b=N0UBkn+9MW/Rhjgwb4qtnFHZGTVbto4T+qeka6UZHyC+iGvkIPtmBKpNisYJTdRIJ0
 2VuLyZrEtM6OFVEDtKoD8eeNUXe3DcnTByJkuRtnTaOPL9L8fF+ElQWp3JsZNVd9U1JW
 IekiXZC16lWUvAgELcZp+ldtyLDblUMS9LqPYs0Oe9FH1uD9pWQBBH5pHutWl85WRh3m
 PhczMq/3+C+nWfdj9tcRa7cAtc/2nNCYJupKtElt+0yeZD50grZBGaGN3H5ezwRTgjBY
 F+EmmSazjL7NK5D6FxbFedpVokuyMFvFMuDKkDaNaj4veciCGv5vobFNgroefDA08Sh6
 PZPA==
X-Gm-Message-State: AJIora99ubHYv1dJKPfZwPKdOLuVG9n86WsPDTivV2RqIzDRPWaBXJ1d
 2iCMwElKRmEXIPF4vxBMc96WJ0aUTBj649O5
X-Google-Smtp-Source: AGRyM1shNRUD5gX+LG79/yW230EMlwOlZRuIC8cp7N8UjOMKUbRpXHXl6/DUDmPHPnedj2l5BdWoeQ==
X-Received: by 2002:a17:903:1108:b0:16a:a0ab:8f89 with SMTP id
 n8-20020a170903110800b0016aa0ab8f89mr29922369plh.12.1656837033786; 
 Sun, 03 Jul 2022 01:30:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 62/62] target/arm: Implement FEAT_HAFDBS
Date: Sun,  3 Jul 2022 13:54:19 +0530
Message-Id: <20220703082419.770989-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Perform the atomic update for hardware management of the
access flag and the dirty bit.

A limitation of the implementation so far is that the
page table must itself be writable.  This is allowed because
it is CONSTRAINED UNPREDICTABLE whether any atomic update
happens at all.  Any implementation is allowed to simply
fall back on software update at any time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 128 ++++++++++++++++++++++++++++++++--
 3 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..ccbb61feb1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -30,6 +30,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2..0eb2e46bbc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1030,6 +1030,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 07ed49bd70..608956bee6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -193,6 +193,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 typedef struct {
     bool is_secure;
     bool be;
+    bool rw;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -205,11 +206,12 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 {
     MemTxAttrs attrs = {};
     PageEntryExtra extra;
-    int flags;
+    CPUTLBEntry *entry;
+    int flags, s2_core_idx;
 
     env->tlb_fi = fi;
-    flags = probe_access_extra(env, addr, MMU_DATA_LOAD,
-                               arm_to_core_mmu_idx(s2_mmu_idx),
+    s2_core_idx = arm_to_core_mmu_idx(s2_mmu_idx);
+    flags = probe_access_extra(env, addr, MMU_DATA_LOAD, s2_core_idx,
                                true, &res->hphys, &attrs, &extra, 0);
     env->tlb_fi = NULL;
 
@@ -222,6 +224,14 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         return false;
     }
 
+    /*
+     * The page must be in the tlb, because we just probed it.
+     * Remember if the page is also writable, for FEAT_HAFDBS.
+     */
+    entry = tlb_entry(env, s2_core_idx, addr);
+    assert(tlb_hit(entry->addr_read, addr));
+    res->rw = tlb_hit(tlb_addr_write(entry), addr);
+
     if (s2_mmu_idx == ARMMMUIdx_Stage2 || s2_mmu_idx == ARMMMUIdx_Stage2_S) {
         uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         uint8_t s2attrs = FIELD_EX64(extra.x, PAGEENTRYEXTRA, ATTRS);
@@ -334,6 +344,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
     return data;
 }
 
+static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
+                             uint64_t new_val, const S1TranslateResult *s1,
+                             ARMMMUFaultInfo *fi)
+{
+    uint64_t cur_val;
+
+    if (unlikely(!s1->hphys)) {
+        fi->type = ARMFault_UnsuppAtomicUpdate;
+        fi->s1ptw = true;
+        return 0;
+    }
+
+#ifndef CONFIG_ATOMIC64
+    /*
+     * We can't support the atomic operation on the host.  We should be
+     * running in round-robin mode though, which means that we would only
+     * race with dma i/o.
+     */
+    qemu_mutex_lock_iothread();
+    if (s1->be) {
+        cur_val = ldq_be_p(s1->hphys);
+        if (cur_val == old_val) {
+            stq_be_p(s1->hphys, new_val);
+        }
+    } else {
+        cur_val = ldq_le_p(s1->hphys);
+        if (cur_val == old_val) {
+            stq_le_p(s1->hphys, new_val);
+        }
+    }
+    qemu_mutex_unlock_iothread();
+#else
+    if (s1->be) {
+        old_val = cpu_to_be64(old_val);
+        new_val = cpu_to_be64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
+                                           old_val, new_val);
+        cur_val = be64_to_cpu(cur_val);
+    } else {
+        old_val = cpu_to_le64(old_val);
+        new_val = cpu_to_le64(new_val);
+        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
+                                           old_val, new_val);
+        cur_val = le64_to_cpu(cur_val);
+    }
+#endif
+
+    return cur_val;
+}
+
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
                                      uint32_t *table, uint32_t address)
 {
@@ -1237,6 +1297,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1314,8 +1375,26 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      */
     if ((attrs & (1 << 10)) == 0) {
         /* Access flag */
-        fi->type = ARMFault_AccessFlag;
-        goto do_fault;
+        uint64_t new_des, old_des;
+
+        /*
+         * If HA is disabled, or if the pte is not writable,
+         * pass on the access fault to software.
+         */
+        if (!param.ha || !s1.rw) {
+            fi->type = ARMFault_AccessFlag;
+            goto do_fault;
+        }
+
+        old_des = descriptor;
+        new_des = descriptor | (1 << 10); /* AF */
+        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        if (old_des != descriptor) {
+            goto restart_atomic_update;
+        }
     }
 
     ap = extract32(attrs, 6, 2);
@@ -1332,8 +1411,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (!(result->prot & (1 << access_type))) {
-        fi->type = ARMFault_Permission;
-        goto do_fault;
+        uint64_t new_des, old_des;
+
+        /* Writes may set dirty if DBM attribute is set. */
+        if (!param.hd
+            || access_type != MMU_DATA_STORE
+            || !extract64(attrs, 51, 1)  /* DBM */
+            || !s1.rw) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        old_des = descriptor;
+        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+            new_des = descriptor | (1ull << 7);   /* S2AP[1] */
+        } else {
+            new_des = descriptor & ~(1ull << 7);  /* AP[2] */
+        }
+
+        /*
+         * If the descriptor didn't change, then attributes weren't the
+         * reason for the permission fault, so deliver it.
+         */
+        if (old_des == new_des) {
+            fi->type = ARMFault_Permission;
+            goto do_fault;
+        }
+
+        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
+        if (fi->type != ARMFault_None) {
+            goto do_fault;
+        }
+        if (old_des != descriptor) {
+            goto restart_atomic_update;
+        }
+
+        /* Success: the page is now writable. */
+        result->prot |= 1 << MMU_DATA_STORE;
     }
 
     if (ns) {
-- 
2.34.1


