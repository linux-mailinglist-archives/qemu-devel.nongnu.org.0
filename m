Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1A65F239
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMc-0001C9-NS; Thu, 05 Jan 2023 11:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM6-0000do-0I
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM4-0007Qa-7C
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1747897wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=byMM6iVgc74/+OKbtKS09cRKP886+lRaecSbts9EjCY=;
 b=hTaih6okMw0Bki+BQB5k5bxdR6I7tyyUju5LVmrht0TSeRqslP9FadCv8hbh+3GO0u
 2JFDCwH7G1Z5Odi+CRVhrjeemYqFODm2Bi4HGW/9P7TnUGdv1hC6mPmJQAfpEAP+tjZW
 OVIgBk0MbxrJD48IjFYJyQaak4o5eaNfQXenjqci8Sws3GL67NUzW4t8BrMLFRDSj0tR
 0JqQc81+e0QNckRUBAYa6xd+kycuj5v1gjlMH4sBcTsZkhJ4PTkNjZlZZeKGXSJ3e/Z2
 6NbaVuB7yummZ4WQ72yuKOFOSJBxdYTnKHtVbFSKjePCybzsbCHWFsOEgnCk2Z08Wqxw
 ob3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=byMM6iVgc74/+OKbtKS09cRKP886+lRaecSbts9EjCY=;
 b=GNRyn/Cq8oKhMK69Hgi8uAJGJQeM6bUIkiRKWBkofdXT32x7nPu/DbzSnfibnv5VU9
 DOM2VAfrPhgEvbb9XebTjXZvMP77164h8snBI9ZbQM1A+OrA5HRZk/BSWrMeN2UKXJue
 XTVy1VJLOvmaNGk9pmp9iCQQ4Nm3EDrsQiUmXBoUqnyrlnf8UiLwPtP+Y9Oo8oGxHYJ+
 i7d8diVW+nc8YTUMANJguTEaT3Ps6KzLHLMPFudYEErLRKRLA5OBAQ6Cl3BfysFblQQo
 c45TC45mkGlukqXuRe9+0+eBuQnrZScUKvqQJsNU/dfZdvF8B5pdzRuAW+H7tkLsU9D2
 kcQA==
X-Gm-Message-State: AFqh2kpFArZzVr1oEY00QqMfJBVx1pQ++j3PPDjuHE1rG04XsXh5KMZn
 +sxaeQ+ITtUR2VEcx0cYylc7AJhJ33EPQkKW
X-Google-Smtp-Source: AMrXdXvmmVRrsr+s1++UGup0FYFjwIv79Hb1fQQnYhOBr5zL0owwxMH3CiDugRde2tDw+++y+dZzQQ==
X-Received: by 2002:a7b:c7c8:0:b0:3d7:889:7496 with SMTP id
 z8-20020a7bc7c8000000b003d708897496mr36660973wmk.17.1672937075028; 
 Thu, 05 Jan 2023 08:44:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/34] target/arm: Fix checkpatch space errors in helper.c
Date: Thu,  5 Jan 2023 16:44:02 +0000
Message-Id: <20230105164417.3994639-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

Fix the following:

ERROR: spaces required around that '|' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '+' (ctx:VxB)
ERROR: space prohibited between function name and open parenthesis '('

(the last two still have some occurrences in macros which I left
behind because it might impact readability)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20221213190537.511-3-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a5f96ab77dd..8f1cc2d7cfb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -205,7 +205,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     uint32_t regidx = (uintptr_t)key;
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
         cpu->cpreg_array_len++;
@@ -219,7 +219,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
     ri = g_hash_table_lookup(cpu->cp_regs, key);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
     }
 }
@@ -2350,11 +2350,11 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
@@ -4315,17 +4315,17 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
       .resetvalue = 0 },
     /* The cache ops themselves: these all NOP for QEMU */
     { .name = "IICR", .cp = 15, .crm = 5, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "IDCR", .cp = 15, .crm = 6, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CDCR", .cp = 15, .crm = 12, .opc1 = 0,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PIR", .cp = 15, .crm = 12, .opc1 = 1,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PDR", .cp = 15, .crm = 12, .opc1 = 2,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CIDCR", .cp = 15, .crm = 14, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
@@ -8695,7 +8695,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar = {
                 .name = "CBAR",
                 .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                .access = PL1_R|PL3_W, .resetvalue = cpu->reset_cbar,
+                .access = PL1_R | PL3_W, .resetvalue = cpu->reset_cbar,
                 .fieldoffset = offsetof(CPUARMState,
                                         cp15.c15_config_base_address)
             };
@@ -9673,11 +9673,11 @@ static void switch_mode(CPUARMState *env, int mode)
         return;
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
+        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
     } else if (mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
+        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
     }
 
     i = bank_number(old_mode);
@@ -11181,7 +11181,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if (sum >= 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SARITH8(a, b, n, op) do { \
     int32_t sum; \
@@ -11189,7 +11189,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if (sum >= 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 
 #define ADD16(a, b, n) SARITH16(a, b, n, +)
@@ -11208,7 +11208,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 1) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define ADD8(a, b, n) do { \
     uint32_t sum; \
@@ -11216,7 +11216,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 1) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define SUB16(a, b, n) do { \
     uint32_t sum; \
@@ -11224,7 +11224,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SUB8(a, b, n) do { \
     uint32_t sum; \
@@ -11232,7 +11232,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define PFX u
 #define ARITH_GE
-- 
2.25.1


