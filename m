Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3823F0309
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 13:50:54 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGK5t-0005PS-2t
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 07:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK2v-0001QS-Gs
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:49 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK2t-0007By-Pp
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:49 -0400
Received: by mail-lj1-x22e.google.com with SMTP id h9so4564823ljq.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=LuuZ+O7bYnJbqZCBNNilzA6rVhI+JNmbz8F49R8mBrM=;
 b=n/MvGbUXrrnL6IgYcKVa2vjU0IDH5Bq4Bufy66lU3goyDKG4/m1tV9zSjlMRX8138K
 V7kVT2J8hX2LLJdrgoPA46HfJVtPvlaMw1+Ge/2ahfausIzRz3M6LYmjFNKoeCKARGiA
 6jhjaD7nT3u5MzZgCckTwUsNhxKamlF35C9sOxsrR//iIwpWZXAq5X+UkZd4yy4ZlVmH
 UX6NpV9Sn+E8y25phT+geCuHpOiOdT//oOD16C9PKKl8LGEKkjxTgpH3gsv0TvoB4z/c
 eJ7Cr4tWLNwp3wXIqh/W2JTYQS1NVklIML22+Dz446INK6btzFmUz81yHrHVHJbWFo0O
 C5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=LuuZ+O7bYnJbqZCBNNilzA6rVhI+JNmbz8F49R8mBrM=;
 b=oh3eW4atEzvWWJPg4MJo1UkaUYSEvTn6agtDZV1EPofZ3lG4UnQSo7RNUCs20znBRQ
 IGfPQEpYjIBjMPiha/0W6yT4RQd1YEak24j1Pu3hmm/jITc4y4EkMrH3mbv+pgjW2BIX
 tbD5bUa/wGkVOWu3D5/3JKDSMqqqLhxSmhO4Yeo/BmBEwTQdHVbpBogIeNyFt62MphgI
 raaWb2/TKXQRS6QMrT5nt3f0mOnJodoq6xM3DTaK5mfDIAt/QELhYz1DLCF8DhOBdQme
 WkkkHSnvP4AHABX+GPphBqgvtI3K0NLD7VIKeogW8Pnn6gogyJFwsbq6gXpmPjJgi4Pk
 PZ+w==
X-Gm-Message-State: AOAM531wyXticlTA6AlpK3AQH/cV7D3GBO9CiwDmc14+Gc1mSgAJrUjD
 blQcicmT4oCyZ8Vizz/ClOvwIpVOkNA=
X-Google-Smtp-Source: ABdhPJzWrVnCG3QpvpHZ5H0R0CZ3dl40F+guF39+CXm93LqF9yqxM07Zty+7sBbqwhfx5f2C3V8b/A==
X-Received: by 2002:a2e:9615:: with SMTP id v21mr2042487ljh.22.1629287265783; 
 Wed, 18 Aug 2021 04:47:45 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id a24sm593793ljk.63.2021.08.18.04.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:47:45 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] target/arm: Refactoring MMU helper function
Date: Wed, 18 Aug 2021 14:47:41 +0300
Message-Id: <162928726129.357603.13067010407123784733.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
References: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru, changbin.du@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To reuse existing code for "tlb info", this patch also extracts
some of the APIs from helper.c including
mode_translation_disabled (), pt_start_level_stage1 (),
mode_ttbr (), arm_ldq_ptw ().

Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 target/arm/helper.c    |   35 +++--------------------------------
 target/arm/internals.h |   39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b9421..513b2a9105 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10101,8 +10101,7 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 #ifndef CONFIG_USER_ONLY
 
 /* Return true if the specified stage of address translation is disabled */
-static inline bool regime_translation_disabled(CPUARMState *env,
-                                               ARMMMUIdx mmu_idx)
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     uint64_t hcr_el2;
 
@@ -10152,23 +10151,6 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* Convert a possible stage1+2 MMU index into the appropriate
@@ -10564,7 +10546,7 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -11246,18 +11228,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
 
     if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        /* The starting level depends on the virtual address size (which can
-         * be up to 48 bits) and the translation granule size. It indicates
-         * the number of strides (stride bits at a time) needed to
-         * consume the bits of the input address. In the pseudocode this is:
-         *  level = 4 - RoundUp((inputsize - grainsize) / stride)
-         * where their 'inputsize' is our 'inputsize', 'grainsize' is
-         * our 'stride + 3' and 'stride' is our 'stride'.
-         * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
-         * = 4 - (inputsize - stride - 3 + stride - 1) / stride
-         * = 4 - (inputsize - 4) / stride;
-         */
-        level = 4 - (inputsize - 4) / stride;
+        level = pt_start_level_stage1(inputsize, stride);
     } else {
         /* For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c38d541017..b33d0835b5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -738,6 +738,8 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
+
 /* Return the TCR controlling this translation regime */
 static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -754,6 +756,23 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return the TTBR associated with this translation regime */
+static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                   int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
@@ -1096,6 +1115,26 @@ typedef struct ARMCacheAttrs {
     unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
 } ARMCacheAttrs;
 
+static inline int pt_start_level_stage1(int inputsize, int stride)
+{
+    /*
+     * The starting level depends on the virtual address size (which can
+     * be up to 48 bits) and the translation granule size. It indicates
+     * the number of strides (stride bits at a time) needed to
+     * consume the bits of the input address. In the pseudocode this is:
+     *  level = 4 - RoundUp((inputsize - grainsize) / stride)
+     * where their 'inputsize' is our 'inputsize', 'grainsize' is
+     * our 'stride + 3' and 'stride' is our 'stride'.
+     * Applying the usual "rounded up m/n is (m+n-1)/n" and simplifying:
+     * = 4 - (inputsize - stride - 3 + stride - 1) / stride
+     * = 4 - (inputsize - 4) / stride;
+     */
+    return 4 - (inputsize - 4) / stride;
+}
+
+uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi);
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,


