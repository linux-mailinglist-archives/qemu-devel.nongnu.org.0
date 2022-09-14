Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2195B88A0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:52:13 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRsB-0000x3-F6
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwg-0000hR-5h
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-00007r-OA
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so15308218wmb.4
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JI1f34wCiNQwgB9Mz0O/ou2pzifrzfvbndlM4sOTfB8=;
 b=Tnqya2EFeNyJ/T45AjMLSgHBL1eHtSXZmMzgJvreoaNiaYSgvqgZq62szq1uEPJpMn
 kZC/tF2fRASUyJ90U7JhQdNRcmV4oAQXOuvELklxoKyqFZlOEgfJWIXpGKaCR88YP7XY
 wP4gqUm2cVwH38rTfrfo7lb8iN+bsSCrJdUAjFgwJwUx8moKuDnzajRd5Le8zHEM3/VC
 p4yWsRqyV2ipXgY4ybC1HdspkKp8izZ9MuybXrOmUxoYljE/7dr2YDTSFHWGFDBit/mb
 cKGPAdNkyjAySgyjtfHK2/CIVgprhlMOwm7sLNvHZfk3JrSIDJ9u6CG4OK0fkf29UGAU
 lbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JI1f34wCiNQwgB9Mz0O/ou2pzifrzfvbndlM4sOTfB8=;
 b=6Dn2qsH1KcixkJOhT+FCllfwu5dZsIzsUaQ/LLx3yHXlOtUrLpjcXlFoUqIWqEmC/S
 VR8VXFQnRKKilctZsEO9CbmFxmDHMzaWZHAroDJ6rLum4g7EKL/VaQeON4rZRtBtgYZu
 35RO/WL3AH7hzow7zPcJzskBX7BSFDItLg2OfvOJspzNvXftXEUDl56IR7GMP2SoFPet
 n42jCAlsCLdkPWNWTlhOiWjIyMI8CrAJnGogda5OaZ2B5d33ho5myRq33+35GbuzEh8w
 06Ho7vAPrFQvxlexDwpIGP7Xv62A3JB7W5LJAdcgIlukkwDacxCSpW6bRPY6sHAbJTGr
 5txg==
X-Gm-Message-State: ACgBeo2QrREcjGQvd03QpqM5RVrdh5RjoGIGepGFzteiq4/8cyomUxGm
 bF1m8bWpu+cUUxyGX89IpWjvQ6t+VIKkt3yq
X-Google-Smtp-Source: AA6agR61YySftV+821ll0ydnKp1LS3ufFkJEmNJ05Hv0fC6s4/OaZHD5jDcWdkcW8B+ZZUfjID9WTA==
X-Received: by 2002:a05:600c:4ec7:b0:3a8:4622:ad27 with SMTP id
 g7-20020a05600c4ec700b003a84622ad27mr2980866wmq.88.1663156355341; 
 Wed, 14 Sep 2022 04:52:35 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/20] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
Date: Wed, 14 Sep 2022 12:52:14 +0100
Message-Id: <20220914115217.117532-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

With FEAT_PMUv3p5, the event counters are now 64 bit, rather than 32
bit.  (Previously, only the cycle counter could be 64 bit, and other
event counters were always 32 bits).  For any given event counter,
whether the overflow event is noted for overflow from bit 31 or from
bit 63 is controlled by a combination of PMCR.LP, MDCR_EL2.HLP and
MDCR_EL2.HPMN.

Implement the 64-bit event counter handling.  We choose to make our
counters always 64 bits, and mask out the top 32 bits on read or
write of PMXEVCNTR for CPUs which don't have FEAT_PMUv3p5.

(Note that the changes to pmenvcntr_op_start() and
pmenvcntr_op_finish() bring their logic closer into line with that of
pmccntr_op_start() and pmccntr_op_finish(), which already had to cope
with the overflow being either at 32 or 64 bits.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-10-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  3 +-
 target/arm/helper.c    | 62 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 41e74df104..33cdbc0143 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1334,6 +1334,7 @@ FIELD(CPTR_EL3, TTA, 20, 1)
 FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
+#define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
 #define MDCR_SCCD     (1U << 23)  /* MDCR_EL3 */
 #define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 83526166de..bf60cd5f84 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1256,6 +1256,7 @@ enum MVEECIState {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRLP  0x80
 #define PMCRLC  0x40
 #define PMCRDP  0x20
 #define PMCRX   0x10
@@ -1267,7 +1268,7 @@ enum MVEECIState {
  * Mask of PMCR bits writable by guest (not including WO bits like C, P,
  * which can be written as 1 to trigger behaviour but which stay RAZ).
  */
-#define PMCR_WRITABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+#define PMCR_WRITABLE_MASK (PMCRLP | PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
 
 #define PMXEVTYPER_P          0x80000000
 #define PMXEVTYPER_U          0x40000000
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0d1f23de09..1a57d2e1d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,7 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL2_PMU_ENABLE_BITS \
+    (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD | MDCR_HLP)
 #define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_SCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
@@ -1193,6 +1194,32 @@ static bool pmccntr_clockdiv_enabled(CPUARMState *env)
     return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
 }
 
+static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
+{
+    /* Return true if the specified event counter is configured to be 64 bit */
+
+    /* This isn't intended to be used with the cycle counter */
+    assert(counter < 31);
+
+    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+        return false;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        /*
+         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
+         * current security state, so we don't use arm_mdcr_el2_eff() here.
+         */
+        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
+        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+
+        if (hpmn != 0 && counter >= hpmn) {
+            return hlp;
+        }
+    }
+    return env->cp15.c9_pmcr & PMCRLP;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1269,9 +1296,11 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
     }
 
     if (pmu_counter_enabled(env, counter)) {
-        uint32_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t overflow_mask = pmevcntr_is_64_bit(env, counter) ?
+            1ULL << 63 : 1ULL << 31;
 
-        if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN) {
+        if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & overflow_mask) {
             env->cp15.c9_pmovsr |= (1 << counter);
             pmu_update_irq(env);
         }
@@ -1286,9 +1315,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
 #ifndef CONFIG_USER_ONLY
         uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
         uint16_t event_idx = supported_event_map[event];
-        uint64_t delta = UINT32_MAX -
-            (uint32_t)env->cp15.c14_pmevcntr[counter] + 1;
-        int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
+        uint64_t delta = -(env->cp15.c14_pmevcntr[counter] + 1);
+        int64_t overflow_in;
+
+        if (!pmevcntr_is_64_bit(env, counter)) {
+            delta = (uint32_t)delta;
+        }
+        overflow_in = pm_events[event_idx].ns_per_count(delta);
 
         if (overflow_in > 0) {
             int64_t overflow_at;
@@ -1375,6 +1408,8 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     unsigned int i;
+    uint64_t overflow_mask, new_pmswinc;
+
     for (i = 0; i < pmu_num_counters(env); i++) {
         /* Increment a counter's count iff: */
         if ((value & (1 << i)) && /* counter's bit is set */
@@ -1388,9 +1423,12 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
              * Detect if this write causes an overflow since we can't predict
              * PMSWINC overflows like we can for other events
              */
-            uint32_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
+            new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
 
-            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & INT32_MIN) {
+            overflow_mask = pmevcntr_is_64_bit(env, i) ?
+                1ULL << 63 : 1ULL << 31;
+
+            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & overflow_mask) {
                 env->cp15.c9_pmovsr |= (1 << i);
                 pmu_update_irq(env);
             }
@@ -1597,6 +1635,10 @@ static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value, uint8_t counter)
 {
+    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+        /* Before FEAT_PMUv3p5, top 32 bits of event counters are RES0 */
+        value &= MAKE_64BIT_MASK(0, 32);
+    }
     if (counter < pmu_num_counters(env)) {
         pmevcntr_op_start(env, counter);
         env->cp15.c14_pmevcntr[counter] = value;
@@ -1616,6 +1658,10 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
         pmevcntr_op_start(env, counter);
         ret = env->cp15.c14_pmevcntr[counter];
         pmevcntr_op_finish(env, counter);
+        if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
+            /* Before FEAT_PMUv3p5, top 32 bits of event counters are RES0 */
+            ret &= MAKE_64BIT_MASK(0, 32);
+        }
         return ret;
     } else {
       /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
-- 
2.34.1


