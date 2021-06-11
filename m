Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2D3A494A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:08:05 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrmVg-0001sS-HT
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3V7TDYAMKCtoL88CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--pcc.bounces.google.com>)
 id 1lrmUl-0001CH-TL
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:07:07 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:52925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3V7TDYAMKCtoL88CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--pcc.bounces.google.com>)
 id 1lrmUk-0005Lm-3x
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 15:07:07 -0400
Received: by mail-qt1-x849.google.com with SMTP id
 z17-20020ac86b910000b0290244cba55754so2500336qts.19
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=UMl+zuKqNlXwEFP7jmdNHHZbXV3Sty9aiGf9qvNOkns=;
 b=QtlzDFZprCg/Lzgvfbiw8GEUEubVLMz2E0XKfhr7+wIww6IhcKeU/e7Xr5il1HwFaY
 eRJ5CBzihbSO3mrYKXPv/c6hak7H1opVjDNznpCQeTvp/qouE98gH1aYvoMpWPc7O12T
 tw7yqHDdVnR2Gg0SNYwkcfc5NbrSXCgfUkt2hAVmP8juZ5jtT+/8wJ6juy2Slkv8hiju
 A1woyS7GLRxk995zy2uAiuifKtafPJXCaMSELqV0HztHGlqGBBx+gRO5ykmaiQbXFo3z
 MTzeRLy6IZKCYwHrGCmFO19InrYB3ir15anqRrbPUG7Q2vrprmVFjizCd2Bge9upOaH9
 92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=UMl+zuKqNlXwEFP7jmdNHHZbXV3Sty9aiGf9qvNOkns=;
 b=TKyg3/jAtWRpAU7ugcU4M1Cwf3jchEfDRIKSbIt49tewtU6ghhcVD/DD3f0gcVQVBO
 7OokLwZV2VOUsgMv87bsc+6Cffcl/0gN6JaHV8+xKmzUiJsCyXG5sUvV5atEjbolAh0x
 phGCOH9fWt5Bz9qZGsTBI/MKMQSIQKxRd7MTRTcmyHCUl+qad2Aen7rKjWTdSCweKZBr
 7P2yzYyLS6zcK/RndnPjj1pkODIv4AhTMsx8Auu8JaYHGBO2T43VpTYDLFuWoFI30xr5
 ArNk/Y7hlGspBUPq9u3eBQyv1S3hzLVh/4DQOHBeL91xB94bS5RFIUCXBT3tjiI0Sknc
 J4ag==
X-Gm-Message-State: AOAM533nGN4Jc9lR15+/PrygnpqFxTtAWLsSneZMHZ1VwHy8jEdLGTW0
 0bIyaYbRc6DibTtNgIq/J0J6txQ=
X-Google-Smtp-Source: ABdhPJx7gsaLhWBpJO+xVLTrZisuvHO+2u/d21dV81bW76vei/eRBAIWNM5Qe0h1DeZ5E/upcgGVjJU=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:200:4fb0:9978:e530:6b3c])
 (user=pcc job=sendgmr) by 2002:ad4:596c:: with SMTP id
 eq12mr6373162qvb.30.1623438423966; 
 Fri, 11 Jun 2021 12:07:03 -0700 (PDT)
Date: Fri, 11 Jun 2021 12:06:53 -0700
Message-Id: <20210611190653.754648-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH] target/arm: Implement MTE3
From: Peter Collingbourne <pcc@google.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Collingbourne <pcc@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Evgenii Stepanov <eugenis@google.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3V7TDYAMKCtoL88CKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--pcc.bounces.google.com;
 helo=mail-qt1-x849.google.com
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
---
 target/arm/cpu64.c      |  2 +-
 target/arm/mte_helper.c | 83 ++++++++++++++++++++++++++---------------
 2 files changed, 53 insertions(+), 32 deletions(-)

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
index 166b9d260f..7b76d871ff 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -538,13 +538,51 @@ void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
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
+static void mte_async_check_fail(CPUARMState *env, uint32_t desc,
+                                 uint64_t dirty_ptr, uintptr_t ra,
+                                 ARMMMUIdx arm_mmu_idx, int el)
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
@@ -564,14 +602,8 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
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
@@ -583,30 +615,19 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
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
+        mte_async_check_fail(env, desc, dirty_ptr, ra, arm_mmu_idx, el);
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
+            mte_async_check_fail(env, desc, dirty_ptr, ra, arm_mmu_idx, el);
+        } else {
+            mte_sync_check_fail(env, desc, dirty_ptr, ra);
+        }
         break;
     }
 }
-- 
2.32.0.272.g935e593368-goog


