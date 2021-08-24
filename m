Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F993F6300
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:45:29 +0200 (CEST)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZYG-0002di-Cw
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKf-0008W8-9a; Tue, 24 Aug 2021 12:31:25 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKd-0000CE-HG; Tue, 24 Aug 2021 12:31:25 -0400
Received: by mail-qt1-x82c.google.com with SMTP id t32so2019451qtc.3;
 Tue, 24 Aug 2021 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NWk4+EnvKoxo9tHhRgS9ZuD/QdWKBoMcTeB1hOFA4c=;
 b=KhSAjk+pEzgXY20R5hd3HCm8vmXee/gtIPXHmf1su10hLUoxlZRwDbdD3bfqhiAfbb
 i9CBOY7IHV5iliCR6vu6EiC23obQiOku8am9H99ArFw2CQFtqaAqbGyuGghDPUa9BnmS
 yKxYP/sSd4SjHTFeBhwIqP9x+9+UKfcwgfNSsSlUoMtzs5XiMaax0n0X0jHlwKw6JnBT
 XCRWY8Xcq8FJh7W2lVxUisp4Xd3GPDf23h7hO+lpvhPTDXKI3CNKAZe5YYq2exdJ4+Ta
 W1gtUB6WpW21z9/XZa+3QjRUXub4mD+ZHicQIcxUT0Q//OznClSJijm8inaVEwDy+lGI
 80rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NWk4+EnvKoxo9tHhRgS9ZuD/QdWKBoMcTeB1hOFA4c=;
 b=hAB4NUXAqSag7DbGDJ0Dwq4ozASnmMwT0BbUpP10WdXYUOXcBXcLL0QVGOuiVnfWRM
 Z7C0N+zcZ2WkqwDCIxL486uWEi11ANFmoM9VbVEuCgdq7WjKJ6dJ1GeRw8dFL8i9Lg3X
 7gkkwp7viiLgQv3Aewj0M1wfGEgn3qqHZx4nEZzk32GCCA3W9OkvEbWCrn9walbh0Nl0
 efuWa11zmTcxNwsC+oK8CY/hUFylf0Aj/OM4f1igxtKZ+tooYeMRhr0d65CMNBicFay1
 EjiGRYVeFTbgnAPhyAxpLBYBLjUfrZaMkrbv74mhaeQIyPMpO/Zgl67l6OV+b4ei87mR
 lXQw==
X-Gm-Message-State: AOAM533lEV6K1g7yoxxOGV/ptlboUH3EzeN09Srl3lZvoJd5dAJQ1wvT
 HzkujQVDuPXUtI2lXzMkr+McP+0Ojy8=
X-Google-Smtp-Source: ABdhPJwvrUXr4ti+2H8+sxgkaKEZ0yKsz+V5ebbndBoT8DJuiXlruPvRMr46OM5Tn6Fet+4M0ni/8w==
X-Received: by 2002:ac8:7194:: with SMTP id w20mr34977406qto.217.1629822682075; 
 Tue, 24 Aug 2021 09:31:22 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] target/ppc: PMU: insns counter negative overflow
 support
Date: Tue, 24 Aug 2021 13:30:30 -0300
Message-Id: <20210824163032.394099-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enabling counter negative overflow for the PMCs that are counting
instructions is simpler than when counting cycles. Instruction
counting is done via helper_insns_inc(), which is called every
time a TB ends.

Firing a performance monitor alert due to a counter negative overflow
in this case is a matter of checking if the counter value is over
0x80000000 each time the counters are incremented and, if counter negative
events are enabled for that specific counter, trigger the PM alert.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8_pmu.c | 23 +++++++++++++++++++++--
 target/ppc/translate.c  |  8 ++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 690476051d..28db086225 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -252,9 +252,8 @@ static void start_cycle_count_session(CPUPPCState *env)
     }
 }
 
-static void cpu_ppc_pmu_timer_cb(void *opaque)
+static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
-    PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
 
     if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
@@ -284,6 +283,13 @@ static void cpu_ppc_pmu_timer_cb(void *opaque)
     ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
 }
 
+static void cpu_ppc_pmu_timer_cb(void *opaque)
+{
+    PowerPCCPU *cpu = opaque;
+
+    fire_PMC_interrupt(cpu);
+}
+
 void cpu_ppc_pmu_timer_init(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -377,6 +383,8 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn,
 /* This helper assumes that the PMC is running. */
 void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
 {
+    bool overflow_triggered = false;
+    PowerPCCPU *cpu;
     int sprn;
 
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
@@ -390,8 +398,19 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
             } else {
                 env->spr[sprn] += num_insns;
             }
+
+            if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL &&
+                pmc_counter_negative_enabled(env, sprn)) {
+                overflow_triggered = true;
+                env->spr[sprn] = COUNTER_NEGATIVE_VAL;
+            }
         }
     }
+
+    if (overflow_triggered) {
+        cpu = env_archcpu(env);
+        fire_PMC_interrupt(cpu);
+    }
 }
 
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d4cfc567cf..8302022852 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4437,6 +4437,14 @@ static void pmu_count_insns(DisasContext *ctx)
     tcg_gen_andi_tl(t0, t0, MMCR0_FC);
     tcg_gen_brcond_tl(TCG_COND_EQ, t0, t_mmcr0FC, l_exit);
 
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
     gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
 
     gen_set_label(l_exit);
-- 
2.31.1


