Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905683AA4D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:57:33 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbfI-0007rt-55
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YFfKYAMKCkUwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com>)
 id 1ltbeB-0007AV-Vv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:56:24 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YFfKYAMKCkUwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com>)
 id 1ltbe6-0002iz-KF
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:56:23 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso4806337ybe.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Mnv+AEsi4m4GQKAH/056B6oPUUMVCrTjYP+DjyRCDNU=;
 b=eSBL8+JWS4iY0IOrhIp9EYj6cP4jdhmieRgkD56J3P6nk0ldV+lahJiTRfLNX7izmx
 ZqLJqm1RuSfTNNmS5Krzd3ifUJKQX5MQtLYQBhx+LUu0Vyu8YgU71jAopDpddbQ5TlLf
 tkHnBKa336Av0p58sD+dR1D4xjJbNi8BWNJH+f/lIqSN7a3s6Bn/eOoIJEyZDUAPfzD0
 omaMHrHpyd21LjzWq0v5oWDzN+fSsEyAWPnvp1zdSzbzCqMRg4hwQOMsc0+4R+D0WwEw
 987//EBtgZRpAM2W68ThV10uT6XndSJOOqNkeqxCyFRy1FAp3Ljgoc1/2BoJ4ETqMCWs
 6WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Mnv+AEsi4m4GQKAH/056B6oPUUMVCrTjYP+DjyRCDNU=;
 b=NwS5DI7FXh7IutcVWAdFrs2gMB0rLQGpemX7FjZ0blowdLu/2IbZevh7N0SQLVrpTb
 HLW5r79ajkent9CF6fxTcMR8FC3KPw1ltOdvtjKdx38LhTg0ULHHfHf5ORxG0QeMYIKD
 F/ivFKg4ksrXvaM2iXtiJvqdUPYpguuGcJDokfifMmDc2dYUOMaCLHAaOI/qpw92DY5Z
 78uBg0AP2k+WHBU6nWeeOvbZJf15o6/sPb+g5Pkcp7DrlwjTP1juKgSDPfFer3YWEoq0
 on9ch65+iVkxJGUlhfrJPa5xfAoAXYXZqCKWmuIU+LRsobToHKTQprnHJdPg+QDj+gUu
 +jgQ==
X-Gm-Message-State: AOAM533LKaEkOXX28se+is9YgnbT8BRAY2H/lg52+iY2HDCTVU9dr5yP
 jkPg2+t1AWFBu2OKT93DP8ahI9I=
X-Google-Smtp-Source: ABdhPJxAX43KpIJjLSgg+iUPMc3yM2OFAtzSLDx0lxje06Dwc5E/YGoMVosUz8sw8ePf5uK+T4vb9jg=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:200:1589:32f2:bd08:7fe0])
 (user=pcc job=sendgmr) by 2002:a25:df82:: with SMTP id
 w124mr949800ybg.425.1623873376835; 
 Wed, 16 Jun 2021 12:56:16 -0700 (PDT)
Date: Wed, 16 Jun 2021 12:56:14 -0700
Message-Id: <20210616195614.11785-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH v2] target/arm: Implement MTE3
From: Peter Collingbourne <pcc@google.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Collingbourne <pcc@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Evgenii Stepanov <eugenis@google.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3YFfKYAMKCkUwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

MTE3 introduces an asymmetric tag checking mode, in which loads are
checked synchronously and stores are checked asynchronously. Add
support for it.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2:
- remove unused argument

 target/arm/cpu64.c      |  2 +-
 target/arm/mte_helper.c | 82 +++++++++++++++++++++++++----------------
 2 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1c23187d1a..c7a1626bec 100644
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
index 9e615cc513..724175210b 100644
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
2.32.0.272.g935e593368-goog


