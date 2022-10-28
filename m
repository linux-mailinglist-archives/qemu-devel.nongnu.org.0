Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD06117DB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:45:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooST9-0006FF-Rs; Fri, 28 Oct 2022 12:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSv-0003qF-O6; Fri, 28 Oct 2022 12:44:18 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSt-000135-L8; Fri, 28 Oct 2022 12:44:17 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso6949666fac.0; 
 Fri, 28 Oct 2022 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGnQWlzMtyUtHXLrjMDWd0Rce4Z/L/hcD+8jmeiuS5I=;
 b=duHeNbde1x34Zn7TDMAOaKEgRUGDbliQ89Z4W8y1kZyoSYCn2MhkT3QHnbSxmXhke7
 /C61F6cGoplAmS8WJyrA79oUGr5SeO2V6qi6q+DpvRIfGCBDzrBWlRCvNBacfKwIYJ/W
 Z3W3CG0P6hyd7DqBMbGW6uOEnxbVAeWHSTsdKUWzMbFj38yuDJt60VEn1e/ajUAhydZ7
 sGjb/GqF8HsQfuhRwdVoIV3ZkYSi5q+5h2pTXAJlTvkeS/aEb0rQJ8CfkcxrmQsEDtZA
 04kWYu5m0jwqpvpQmxleodjQ47rh/ylw4/OxCJfIjNg5uSgXLpo+93iLy2I0L4sO5eUl
 oQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGnQWlzMtyUtHXLrjMDWd0Rce4Z/L/hcD+8jmeiuS5I=;
 b=z8xcNggg94yvp88qzUPMZjFzJtAfJLH4PR6qrcJiKs/JJMzvL/H/p4zgsHWrHOZ1F2
 hjXKD/Rgre7YmGoqmo7zwgU2zBPB4p/IGX6sGzUhXlzJAT7rs9/7necf5nrAaNWJsard
 /5N3Jfb/6A7xh70ZE86LrkkGQrYI12FFHH+BmQCDBleluB9aVX+3E/R3SuX/hqtvN1kk
 X+VP44z7Pb/98ayKZSWZc+rTnQxmkvl5t6OL7Cu4sYSSTMQBJSxjrSx8VW40G55aVJ91
 dZvTroSwjgq9tcbt7sWwbVdjgfCWVw9z7vv0WyCA7K49GHvAz7GC7mYWsdJwGWqNuYf2
 zCbQ==
X-Gm-Message-State: ACrzQf2uJ4i0Sts7vevkubPI+5TYKCn3dAU3pymhPbrJsnni5zUU8yaf
 5hKQNiNuwmJPvsz7scu68FLoNRYknhgrQw==
X-Google-Smtp-Source: AMsMyM6as5cILvnfO4E9Xr7vQ5nSGWzuO9wBAgQ2HxkR9uuJVhdyRzwwvIfgD6jPXufUzMg0bI+6tw==
X-Received: by 2002:a05:6870:f61a:b0:13b:9374:203e with SMTP id
 ek26-20020a056870f61a00b0013b9374203emr50229oab.18.1666975453689; 
 Fri, 28 Oct 2022 09:44:13 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 57/62] target/ppc: Increment PMC5 with inline insns
Date: Fri, 28 Oct 2022 13:39:46 -0300
Message-Id: <20221028163951.810456-58-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Profiling QEMU during Fedora 35 for PPC64 boot revealed that
6.39% of total time was being spent in helper_insns_inc(), on a
POWER9 machine. To avoid calling this helper every time PMCs had
to be incremented, an inline implementation of PMC5 increment and
check for overflow was developed. This led to a reduction of
about 12% in Fedora's boot time.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221025202424.195984-4-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h     |  1 +
 target/ppc/power8-pmu.c | 74 +++++++++++++++++++++--------------------
 target/ppc/power8-pmu.h |  3 ++
 target/ppc/translate.c  | 28 ++++++++++++++--
 4 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 25533b8f33..8dd22a35e4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -30,6 +30,7 @@ DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 DEF_HELPER_2(insns_inc, void, env, i32)
+DEF_HELPER_1(handle_pmc5_overflow, void, env)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index beeab5c494..1381072b9e 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -22,8 +22,6 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
-#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
-
 static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
 {
     if (sprn == SPR_POWER_PMC1) {
@@ -88,49 +86,47 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
     bool overflow_triggered = false;
     target_ulong tmp;
 
-    if (unlikely(ins_cnt & 0x1e)) {
-        if (ins_cnt & (1 << 1)) {
-            tmp = env->spr[SPR_POWER_PMC1];
-            tmp += num_insns;
-            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
-                tmp = PMC_COUNTER_NEGATIVE_VAL;
-                overflow_triggered = true;
-            }
-            env->spr[SPR_POWER_PMC1] = tmp;
+    if (ins_cnt & (1 << 1)) {
+        tmp = env->spr[SPR_POWER_PMC1];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
         }
+        env->spr[SPR_POWER_PMC1] = tmp;
+    }
 
-        if (ins_cnt & (1 << 2)) {
-            tmp = env->spr[SPR_POWER_PMC2];
-            tmp += num_insns;
-            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
-                tmp = PMC_COUNTER_NEGATIVE_VAL;
-                overflow_triggered = true;
-            }
-            env->spr[SPR_POWER_PMC2] = tmp;
+    if (ins_cnt & (1 << 2)) {
+        tmp = env->spr[SPR_POWER_PMC2];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
+        }
+        env->spr[SPR_POWER_PMC2] = tmp;
+    }
+
+    if (ins_cnt & (1 << 3)) {
+        tmp = env->spr[SPR_POWER_PMC3];
+        tmp += num_insns;
+        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
+            tmp = PMC_COUNTER_NEGATIVE_VAL;
+            overflow_triggered = true;
         }
+        env->spr[SPR_POWER_PMC3] = tmp;
+    }
 
-        if (ins_cnt & (1 << 3)) {
-            tmp = env->spr[SPR_POWER_PMC3];
+    if (ins_cnt & (1 << 4)) {
+        target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
+        int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+        if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
+            tmp = env->spr[SPR_POWER_PMC4];
             tmp += num_insns;
             if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
                 tmp = PMC_COUNTER_NEGATIVE_VAL;
                 overflow_triggered = true;
             }
-            env->spr[SPR_POWER_PMC3] = tmp;
-        }
-
-        if (ins_cnt & (1 << 4)) {
-            target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
-            int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
-            if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
-                tmp = env->spr[SPR_POWER_PMC4];
-                tmp += num_insns;
-                if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
-                    tmp = PMC_COUNTER_NEGATIVE_VAL;
-                    overflow_triggered = true;
-                }
-                env->spr[SPR_POWER_PMC4] = tmp;
-            }
+            env->spr[SPR_POWER_PMC4] = tmp;
         }
     }
 
@@ -310,6 +306,12 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
     raise_ebb_perfm_exception(env);
 }
 
+void helper_handle_pmc5_overflow(CPUPPCState *env)
+{
+    env->spr[SPR_POWER_PMC5] = PMC_COUNTER_NEGATIVE_VAL;
+    fire_PMC_interrupt(env_archcpu(env));
+}
+
 /* This helper assumes that the PMC is running. */
 void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
 {
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 9692dd765e..c0093e2219 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -14,6 +14,9 @@
 #define POWER8_PMU_H
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 void cpu_ppc_pmu_init(CPUPPCState *env);
 void pmu_update_summaries(CPUPPCState *env);
 #else
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 8d79522f98..19c1d17cb0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
 #include "qemu/atomic128.h"
 #include "spr_common.h"
+#include "power8-pmu.h"
 
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
@@ -4271,6 +4272,9 @@ static void pmu_count_insns(DisasContext *ctx)
     }
 
  #if !defined(CONFIG_USER_ONLY)
+    TCGLabel *l;
+    TCGv t0;
+
     /*
      * The PMU insns_inc() helper stops the internal PMU timer if a
      * counter overflows happens. In that case, if the guest is
@@ -4279,8 +4283,26 @@ static void pmu_count_insns(DisasContext *ctx)
      */
     gen_icount_io_start(ctx);
 
-    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
-#else
+    /* Avoid helper calls when only PMC5-6 are enabled. */
+    if (!ctx->pmc_other) {
+        l = gen_new_label();
+        t0 = tcg_temp_new();
+
+        gen_load_spr(t0, SPR_POWER_PMC5);
+        tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
+        gen_store_spr(SPR_POWER_PMC5, t0);
+        /* Check for overflow, if it's enabled */
+        if (ctx->mmcr0_pmcjce) {
+            tcg_gen_brcondi_tl(TCG_COND_LT, t0, PMC_COUNTER_NEGATIVE_VAL, l);
+            gen_helper_handle_pmc5_overflow(cpu_env);
+        }
+
+        gen_set_label(l);
+        tcg_temp_free(t0);
+    } else {
+        gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+    }
+  #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
      * the PMU via MMCR0_FC. In this case just increment
@@ -4293,7 +4315,7 @@ static void pmu_count_insns(DisasContext *ctx)
     gen_store_spr(SPR_POWER_PMC5, t0);
 
     tcg_temp_free(t0);
-#endif /* #if !defined(CONFIG_USER_ONLY) */
+  #endif /* #if !defined(CONFIG_USER_ONLY) */
 }
 #else
 static void pmu_count_insns(DisasContext *ctx)
-- 
2.37.3


