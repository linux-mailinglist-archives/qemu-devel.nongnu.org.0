Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E85F1E66
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:21:34 +0200 (CEST)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oegBB-0000zh-GF
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLU-0008Bd-Cw
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:08 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLS-000744-55
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:07 -0400
Received: by mail-qv1-xf33.google.com with SMTP id z18so4443139qvn.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8bt/ljGVvBvksdluIpA9+aSBfVlrp86kwVwyB2a9tgo=;
 b=aAcIh1HDg7NEWV8Vhtaua50eUioEWuQjJeEg+9Luqcn3NG96AqjVe4v7YmdkUkyk9j
 /VR9NoI1GWb+4j+5oCUpKV4vEc+Iw0o+Rj27K4iCVnnvVxZCs44E1FXEsUQFORMboGRD
 yvzq60/1UGqxX7PzYrUr0Fe5p74QvxLEwwjKhmkETpVdBRvouoWiBA566tXpgK/ZorLN
 R+kWEEvH1InzUWrSUgg9Zcr3LMx1Xzmp8gZDP4fyv/JmTwliYZmlegGySTOs4mGE2a+3
 /eICWoQdqvVw7ZwZ0sLBKpMyph72rg7Q7LMVlw5Q2gggTenEkfadCO5fkdovNqU/8+Ju
 4R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8bt/ljGVvBvksdluIpA9+aSBfVlrp86kwVwyB2a9tgo=;
 b=uuaKrYxdDdfs4ICKx4rWGiqU3dVUu3/HODJ+E0+VHfBzibfvwDgWarkIZBuYsaK9t5
 7NeoVyB6QuuThG33gicxwI3EAU+JDoeub/k0LFu0UXv+PejAydfFVNtMqNlIOj5MO2rg
 hTvCXuRfP3EqEcOOoZWzQir2+aUfU8SmLsTOvdv271ibSRo3G7Ky/vIvHjqy0kTKKvq0
 eJFRvwwk/u/8hb4sqr/SdJ/kcpx5WdmDXWynhasOU0IAULMJRfQw+GkWkZhoPGATO4J6
 P6h50VHbMAQdHdAT0a6yHILyx6SGmBClwDPfcDKpgGCM1qbGqnjGqmHw1jBvkacknw/P
 JnYA==
X-Gm-Message-State: ACrzQf2IxAvXWxTt7lL8Euv3vEd0qg/s7qST8EIgSCEaJphafvcmdorZ
 Rv1Flu2aMCExw6xsWcPdUaz6SpEBiRAuKA==
X-Google-Smtp-Source: AMsMyM4kWgc+t2D+z/3FNSDHyFzl4EHVXhxSfR+iPF1w5BNwsIsb/aDI7d/hLsH9e17IeMvguV/CUA==
X-Received: by 2002:a05:6214:5295:b0:4ac:ae7d:6a46 with SMTP id
 kj21-20020a056214529500b004acae7d6a46mr11402457qvb.131.1664641684920; 
 Sat, 01 Oct 2022 09:28:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006b5e296452csm6403305qkn.54.2022.10.01.09.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:28:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
Date: Sat,  1 Oct 2022 09:23:17 -0700
Message-Id: <20221001162318.153420-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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

Perform the atomic update for hardware management of the access flag
and the dirty bit.

A limitation of the implementation so far is that the page table
itself must already be writable, i.e. the dirty bit for the stage2
page table must already be set, i.e. we cannot set both dirty bits
at the same time.

This is allowed because it is CONSTRAINED UNPREDICTABLE whether any
atomic update happens at all.  The implementation is allowed to simply
fall back on software update at any time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu64.c            |   1 +
 target/arm/ptw.c              | 119 ++++++++++++++++++++++++++++++++--
 3 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe59..c3582d075e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e6314e86d2..b064dc7964 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1116,6 +1116,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 45734b0d28..14ab56d1b5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -223,6 +223,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 typedef struct {
     bool is_secure;
     bool be;
+    bool rw;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -261,7 +262,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             pte_attrs = s2.cacheattrs.attrs;
             pte_secure = s2.f.attrs.secure;
         }
-        res->hphys = NULL;
+        res->hphys = NULL;  /* force slow path */
+        res->rw = false;    /* debug never modifies */
     } else {
         CPUTLBEntryFull *full;
         int flags;
@@ -276,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             goto fail;
         }
         res->gphys = full->phys_addr;
+        res->rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
     }
@@ -381,6 +384,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
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
@@ -1290,6 +1343,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         goto do_fault;
     }
 
+ restart_atomic_update:
     if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
         /* Invalid, or the Reserved level 3 encoding */
         goto do_translation_fault;
@@ -1365,10 +1419,28 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
      * Here descaddr is the final physical address, and attributes
      * are all in attrs.
      */
-    if ((attrs & (1 << 10)) == 0) {
+    if ((attrs & (1 << 10)) == 0 && !debug) {
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
@@ -1385,8 +1457,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (!(result->f.prot & (1 << access_type))) {
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
+        result->f.prot |= 1 << MMU_DATA_STORE;
     }
 
     if (ns) {
-- 
2.34.1


