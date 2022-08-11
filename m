Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76105905E6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:31:57 +0200 (CEST)
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMC2H-0003dC-1m
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnN-00072D-2i
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnK-0000x4-NH
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v3so22132130wrp.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=e9DbTPQL8bLLCTfLH6rmKKB71n4UgViAJ5ZL+C8eSRQ=;
 b=nah3fnzO5jt3GHTCXEIWjUqMWr+gyN23qM8mUokxIaqnhhsBxQhftN3jL2mR4rIFm+
 hLa0WP+7LRhpcbWA2QsD22eHfpaxGDMRJxE+aw0ugaDvugdxFtRRyURX/QBd60caDPep
 4bONFPqYiUw+khQgPJ8+eSIkregwEkt5JZANxi6jiKCNhW93DrBXHXECNZ/gTd668G/3
 yHl+WcmR1XyjmYRLCvReKh4JQOnQOWczYPfqoXshUOrhouD2h7OXo7qANh1DlN99iKaw
 0p7/BDZkqFGUKNeYrSqfHDGpusJisEaJgvddP9Uh3BSb4ieAmNFvCnOPhKYyUoo6eWNI
 qCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=e9DbTPQL8bLLCTfLH6rmKKB71n4UgViAJ5ZL+C8eSRQ=;
 b=fmQo/8NF0li1jCS71n6Ahwys3xWyqz8+laEO0GglRCrm8336fMjptp/MACkEhtM4YK
 Yoa7HKEVcvUqwl1/GGzpiFVMzsdpORrU4mCVkGjbGgEt1Z8DuyoZLds+sCeW6LYOAWR0
 uVUrqTkCbNbkJ44jz94Sm+otSiVl0oLHSIHj0VGmPi6Jgsbq8zeub9EjYrDiVTw1OgxG
 bq038jqWZRikB/qT2CZgV7WGZHixwvL2ipBrF6HSQZpGf6LFtHXy7yMys9jGo7Mt+b8N
 GkRQPIcBoc5rmmJ81ypOEPQoshQWA/iv51ri/qJfEPF/rPkH57rcsa679lEQNtun86vi
 KSQA==
X-Gm-Message-State: ACgBeo3z+LgJpvb3fPKuJ5TR0yZhEt05x2ebHJR7DTRUmrbRm+PuuPTG
 A3H9fHn9n8GM+XFeU9+WbsblRw==
X-Google-Smtp-Source: AA6agR6vGz0Xv0YLPdjJZAcEqvv3s0OZfsGBnrWz+eq3LOe247YaU0fZ1AJktxj30Xqso5JgcuwWqg==
X-Received: by 2002:a05:6000:1a88:b0:222:ca4d:f0d2 with SMTP id
 f8-20020a0560001a8800b00222ca4df0d2mr22555wry.610.1660238189116; 
 Thu, 11 Aug 2022 10:16:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
Date: Thu, 11 Aug 2022 18:16:18 +0100
Message-Id: <20220811171619.1154755-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
---
 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  3 +-
 target/arm/helper.c    | 62 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e7fe64ceae..b268a2f5705 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1333,6 +1333,7 @@ FIELD(CPTR_EL3, TAM, 30, 1)
 FIELD(CPTR_EL3, TCPAC, 31, 1)
 
 #define MDCR_MCCD     (1ULL << 34) /* MDCR_EL3 */
+#define MDCR_HLP      (1U << 26)  /* MDCR_EL2 */
 #define MDCR_HCCD     (1U << 23)  /* MDCR_EL2 */
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 83526166de0..bf60cd5f845 100644
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
index f601025cc40..cbcf7a1f43c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1084,7 +1084,8 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
  * We use these to decide whether we need to wrap a write to MDCR_EL2
  * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
  */
-#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD)
+#define MDCR_EL2_PMU_ENABLE_BITS \
+    (MDCR_HPME | MDCR_HPMD | MDCR_HPMN | MDCR_HCCD | MDCR_HLP)
 #define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME | MDCR_MCCD)
 
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
@@ -1192,6 +1193,32 @@ static bool pmccntr_clockdiv_enabled(CPUARMState *env)
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
@@ -1268,9 +1295,11 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
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
@@ -1285,9 +1314,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
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
@@ -1374,6 +1407,8 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     unsigned int i;
+    uint64_t overflow_mask, new_pmswinc;
+
     for (i = 0; i < pmu_num_counters(env); i++) {
         /* Increment a counter's count iff: */
         if ((value & (1 << i)) && /* counter's bit is set */
@@ -1387,9 +1422,12 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1596,6 +1634,10 @@ static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -1615,6 +1657,10 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
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
2.25.1


