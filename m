Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAA3E4661
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:20:50 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Cf-0000dS-Ac
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53w-0002tU-HH; Mon, 09 Aug 2021 09:11:28 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53t-0001M2-K3; Mon, 09 Aug 2021 09:11:28 -0400
Received: by mail-qk1-x730.google.com with SMTP id w197so16906979qkb.1;
 Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KetW2gInnquFFgv9kgkwzqDJPKB+YNjSMaQCXZ8jkF0=;
 b=J7WKtzwx8QrdFDAMUi6zmRkW0HlqoiPBx7EI6UFpxrjy2zNYOB4mOX7HclH3hFzu5t
 M2Ju+Vgg04QOsYr3kUBHwLNT030CqkbTpIKGUtGUK92rBafCc99LfV6O/yNKmmMiK94J
 ykeMFGo47B7W7WEjMDtArXvy41CjN6CIkpUD4eDX2x0A8Wozug6rpvcAuxCQkV2NznUR
 IpxPKDdPwrggWkeVtDQoj8dk1qWxC6klh9w9/tTLBH5delbXUxLT6vHZzmMjLkbTNmaV
 QvVTy2JWZfvuemcBGyw/xELNmNs+uAWho+pOT5GmZtJyGUTUbK52OfcG6H4tOrSc1zzQ
 Kgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KetW2gInnquFFgv9kgkwzqDJPKB+YNjSMaQCXZ8jkF0=;
 b=m6t8cgV3d1yn6HPLfr3T/0tva4PhnKKbX8ut1KbWsEYBz9K/ZZWbRcyBoaY3AT+qIK
 orBmx0YVVZJRsYwzg9pYpTO/nVgHvPzML6QDx1i48X9/RM0Z5OpfswMYULyPiAv67qKc
 PbBUahqEgV13vrDhdHtqtMzFG6la1wKG+GzSzOqTaPSIdfcBw40zSfDW8msw9nP2vT3T
 a7Fkbin2UVnidWZxZppoenkwNWEJU6EkVLQ4FX+kQx4Tq0Wltozb3kkLXV4GYLDH1HlY
 huCqa0iWOhA1QFMWgdzkfivE+GwMInVH/KZ/IkhafDavfeEXbZ814nWF65urojfAYOjx
 heDg==
X-Gm-Message-State: AOAM531itZpo2NequSrZZM6857HKCNkoX46zovybl9Ze7XiAuYDlWzPu
 E34hhlFH5jwp4tzvJ046pBHQpfL0VDLMdg==
X-Google-Smtp-Source: ABdhPJxuL+erYn0+NxB3nn69WraW3Y9/NvPbRVeXx7mOA9106PzjrOBb1yMdVjvfmKseSJdznekd3w==
X-Received: by 2002:a05:620a:1134:: with SMTP id
 p20mr23030334qkk.397.1628514684027; 
 Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/19] target/ppc/pmu_book3s_helper.c: icount fine tuning
Date: Mon,  9 Aug 2021 10:10:45 -0300
Message-Id: <20210809131057.1694145-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the helper logic we're making 2 icount_get_raw() calls (via
get_insns()) in different places: one in update_PMCs() and another
in the helper_store_mmcr0() when the new base_icount is set.

We don't need two distinct calls in two different places. In fact,
calling them in the same point brings more consistency when turning the
PMU on/off during heavy load. We're also want to retrieve the current
icount value as soon as possible to avoid counting extra instructions.

To do that, we're introducing the concept of 'icount_delta', which is
the icount difference between the time PMU started and the time where
we are updating the counters.

Also, to behave more like the real hardware, discount the mtspr() calls
that turns the PMU on/off when we're about to set the PMCs values.

With these changes, running a pseries TCG with an icount shift of zero,
in an Intel i7-8650U laptop running Fedora 34, the kernel PMU
'count_instructions' test (kernel tree,
tools/testing/selftests/powerpc/pmu) gives a 99.9% average accurracy
when sampling 10M instructions:

[root@localhost powerpc]# ./pmu/count_instructions
test: count_instructions
tags: git_version:v5.13-5357-gdbe69e433722
Binding to cpu 0
main test running as pid 652
Overhead of null loop: 2315 instructions
instructions: result 1002315 running/enabled 1582058
cycles: result 4005276 running/enabled 1343324
Looped for 1000000 instructions, overhead 2315
Expected 1002315
Actual   1002315
Delta    0, 0.000000%
instructions: result 10010235 running/enabled 11598016
cycles: result 40036956 running/enabled 11356940
Looped for 10000000 instructions, overhead 2315
Expected 10002315
Actual   10010235
Delta    7920, 0.079119%

This accuracy is good enough to validate the EBB (Event-Based Branch)
support that we're going to implement shortly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/pmu_book3s_helper.c | 46 ++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 99e62bd37b..6292b96db9 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -17,32 +17,27 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
-static uint64_t get_insns(void)
-{
-    return (uint64_t)icount_get_raw();
-}
 
-static uint64_t get_cycles(uint64_t insns)
+static uint64_t get_cycles(uint64_t icount_delta)
 {
     /* Placeholder value */
-    return insns * 4;
+    return icount_delta * 4;
 }
 
 static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
-                                    uint64_t curr_icount)
+                                    uint64_t icount_delta)
 {
-    env->spr[sprn] += curr_icount - env->pmu_base_icount;
+    env->spr[sprn] += icount_delta;
 }
 
 static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
-                              uint64_t curr_icount)
+                              uint64_t icount_delta)
 {
-    uint64_t insns = curr_icount - env->pmu_base_icount;
-    env->spr[sprn] += get_cycles(insns);
+    env->spr[sprn] += get_cycles(icount_delta);
 }
 
 static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
-                                        uint64_t curr_icount)
+                                        uint64_t icount_delta)
 {
     int event;
 
@@ -68,10 +63,10 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
 
     switch (event) {
     case 0x2:
-        update_PMC_PM_INST_CMPL(env, sprn, curr_icount);
+        update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
         break;
     case 0x1E:
-        update_PMC_PM_CYC(env, sprn, curr_icount);
+        update_PMC_PM_CYC(env, sprn, icount_delta);
         break;
     default:
         return;
@@ -84,21 +79,21 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
  * There is no need to update the base icount of each PMC since
  * the PMU is not running.
  */
-static void update_PMCs_on_freeze(CPUPPCState *env)
+static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
 {
-    uint64_t curr_icount = get_insns();
     int sprn;
 
     for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
-        update_programmable_PMC_reg(env, sprn, curr_icount);
+        update_programmable_PMC_reg(env, sprn, icount_delta);
     }
 
-    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount);
-    update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
+    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, icount_delta);
+    update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
+    uint64_t curr_icount = (uint64_t)icount_get_raw();
     bool curr_FC = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
     bool new_FC = value & MMCR0_FC;
 
@@ -115,9 +110,18 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
      */
     if (curr_FC != new_FC) {
         if (!curr_FC) {
-            update_PMCs_on_freeze(env);
+            uint64_t icount_delta = (curr_icount - env->pmu_base_icount);
+
+            /* Exclude both mtsprs() that opened and closed the timer */
+            icount_delta -= 2;
+
+            /*
+             * Update the counter with the instructions run
+             * until the freeze.
+             */
+            update_PMCs(env, icount_delta);
         } else {
-            env->pmu_base_icount = get_insns();
+            env->pmu_base_icount = curr_icount;
         }
     }
 
-- 
2.31.1


