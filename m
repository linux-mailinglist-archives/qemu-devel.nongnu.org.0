Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9323AF15C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:06:02 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNN3-0000GX-SW
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnf-0008CS-6x
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnd-0007qG-5I
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id e22so16818168wrc.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iWL3q67bBg5eccSTYVrYwslzpULwLt3AfwRBBm3qyz0=;
 b=NzNdGpJDfokbD97ewv2DH3O+3ZuFW0qWguo1rfQjrbatn69H9uOMtshczCBG7nHPJc
 jrs7hy8i6NJo0stlD2ekaYA7Dh5ZcqjdEd6451tHxSh28BfOmQdDZr5hotDTQ1DONYL4
 F7hJBG+fnTchrEg5UCOK3ShMgbxFUXaoB04spcDKwIpq/udmidOI5+yphDZZPE7wRhKw
 ug/8Y4aoWrzXikiyStQBAS0+Jc9vS2p6/CcnJ06Z9nF8L4VOL8COD7pe1FsHooNiiF12
 kWQzoa5yhT9RdRp2EWG/vxDkUBi3M19A63yjPM84sUWKloxpusrIi7KcaHELoLBl6/hj
 EYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWL3q67bBg5eccSTYVrYwslzpULwLt3AfwRBBm3qyz0=;
 b=ThtDNlqZjNtpXl/BoxLQI4lYuS/rfbV3omARMWonGRNSNAJT+Gl8WBnMw5ySZQpuy1
 f7BBvGQOsulFMTzubaY/e8v6+V9fAxqcxQVZx6J/AWRvp+VofvswJA1UmL2k8oig72j4
 VY4s9wRTvXNSWFUDHFMa4u6QGVV5XHK1ll0JfXGyP7KTtmr4unUKQqUsa2bVzGDPklM4
 a3ZwIwaJFhH2nNqVf/ydjp/9mr4jT3x+CdP0Zvkr98QCYbqtlTtECZ8wufb//ee6CFdk
 Oov/2bfezGccoIz9KZ5ye2Hw5tULpBF5GPu0P+LfogzdwTVqTOqYKXXHEIEglidZ+8mj
 Iviw==
X-Gm-Message-State: AOAM532ZdaBAB7cpfEwLF+isYvtqBp35VhPwHZAprnJf54ofk85jijRS
 BY+ZRYgox5093t84W5DQ/CRuFiAsuxupstBZ
X-Google-Smtp-Source: ABdhPJyVigbBSH8c//90Osx2iKX1qWmwQgy38SBCF46dMcWvsaH3eJ+hXZ+mUqR0+Ab3dcTDU/5cjg==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr5866803wrv.58.1624292963966; 
 Mon, 21 Jun 2021 09:29:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/57] target/arm: Implement MTE3
Date: Mon, 21 Jun 2021 17:28:32 +0100
Message-Id: <20210621162833.32535-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Collingbourne <pcc@google.com>

MTE3 introduces an asymmetric tag checking mode, in which loads are
checked synchronously and stores are checked asynchronously. Add
support for it.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210616195614.11785-1-pcc@google.com
[PMM: Add line to emulation.rst]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu64.c            |  2 +-
 target/arm/mte_helper.c       | 82 ++++++++++++++++++++++-------------
 3 files changed, 53 insertions(+), 32 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 836c1ca8453..144dc491d95 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -29,6 +29,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
+- FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_PAN (Privileged access never)
 - FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
 - FEAT_PAuth (Pointer authentication)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1c23187d1a5..c7a1626bec2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -683,7 +683,7 @@ static void aarch64_max_initfn(Object *obj)
          * during realize if the board provides no tag memory, much like
          * we do for EL2 with the virtualization=on property.
          */
-        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr0;
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 9e615cc513c..724175210be 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -538,13 +538,50 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
     }
 }
 
+static void mte_sync_check_fail(CPUARMState *env, uint32_t desc,
+                                uint64_t dirty_ptr, uintptr_t ra)
+{
+    int is_write, syn;
+
+    env->exception.vaddress = dirty_ptr;
+
+    is_write = FIELD_EX32(desc, MTEDESC, WRITE);
+    syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0, is_write,
+                                0x11);
+    raise_exception_ra(env, EXCP_DATA_ABORT, syn, exception_target_el(env), ra);
+    g_assert_not_reached();
+}
+
+static void mte_async_check_fail(CPUARMState *env, uint64_t dirty_ptr,
+                                 uintptr_t ra, ARMMMUIdx arm_mmu_idx, int el)
+{
+    int select;
+
+    if (regime_has_2_ranges(arm_mmu_idx)) {
+        select = extract64(dirty_ptr, 55, 1);
+    } else {
+        select = 0;
+    }
+    env->cp15.tfsr_el[el] |= 1 << select;
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
+     * which then sends a SIGSEGV when the thread is next scheduled.
+     * This cpu will return to the main loop at the end of the TB,
+     * which is rather sooner than "normal".  But the alternative
+     * is waiting until the next syscall.
+     */
+    qemu_cpu_kick(env_cpu(env));
+#endif
+}
+
 /* Record a tag check failure.  */
 static void mte_check_fail(CPUARMState *env, uint32_t desc,
                            uint64_t dirty_ptr, uintptr_t ra)
 {
     int mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     ARMMMUIdx arm_mmu_idx = core_to_aa64_mmu_idx(mmu_idx);
-    int el, reg_el, tcf, select, is_write, syn;
+    int el, reg_el, tcf;
     uint64_t sctlr;
 
     reg_el = regime_el(env, arm_mmu_idx);
@@ -564,14 +601,8 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     switch (tcf) {
     case 1:
         /* Tag check fail causes a synchronous exception. */
-        env->exception.vaddress = dirty_ptr;
-
-        is_write = FIELD_EX32(desc, MTEDESC, WRITE);
-        syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
-                                    is_write, 0x11);
-        raise_exception_ra(env, EXCP_DATA_ABORT, syn,
-                           exception_target_el(env), ra);
-        /* noreturn, but fall through to the assert anyway */
+        mte_sync_check_fail(env, desc, dirty_ptr, ra);
+        break;
 
     case 0:
         /*
@@ -583,30 +614,19 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
     case 2:
         /* Tag check fail causes asynchronous flag set.  */
-        if (regime_has_2_ranges(arm_mmu_idx)) {
-            select = extract64(dirty_ptr, 55, 1);
-        } else {
-            select = 0;
-        }
-        env->cp15.tfsr_el[el] |= 1 << select;
-#ifdef CONFIG_USER_ONLY
-        /*
-         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
-         * which then sends a SIGSEGV when the thread is next scheduled.
-         * This cpu will return to the main loop at the end of the TB,
-         * which is rather sooner than "normal".  But the alternative
-         * is waiting until the next syscall.
-         */
-        qemu_cpu_kick(env_cpu(env));
-#endif
+        mte_async_check_fail(env, dirty_ptr, ra, arm_mmu_idx, el);
         break;
 
-    default:
-        /* Case 3: Reserved. */
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Tag check failure with SCTLR_EL%d.TCF%s "
-                      "set to reserved value %d\n",
-                      reg_el, el ? "" : "0", tcf);
+    case 3:
+        /*
+         * Tag check fail causes asynchronous flag set for stores, or
+         * a synchronous exception for loads.
+         */
+        if (FIELD_EX32(desc, MTEDESC, WRITE)) {
+            mte_async_check_fail(env, dirty_ptr, ra, arm_mmu_idx, el);
+        } else {
+            mte_sync_check_fail(env, desc, dirty_ptr, ra);
+        }
         break;
     }
 }
-- 
2.20.1


