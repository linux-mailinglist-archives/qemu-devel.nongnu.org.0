Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4AF4006C5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:40:21 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFz2-0001cP-4b
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFr1-0003Hj-GV; Fri, 03 Sep 2021 16:32:03 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqz-0001ox-Rb; Fri, 03 Sep 2021 16:32:03 -0400
Received: by mail-qt1-x835.google.com with SMTP id d11so292617qtw.3;
 Fri, 03 Sep 2021 13:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KodW1W3UapdxzGinl4ph1E19T3Up3sSRrUYz7X6sIMA=;
 b=Kg3CMomxjX9X+zlxpDLNbP5F+8dd9JJHx7mVDIo1Aox1iNRDiSuaHG6ZsZNx8V0EId
 STN9wUmQscvJNRiY7E+On/oacn+yCmomfg6HX1xXyzBizNrVG72djaxOVdy/hFGPOiWL
 9Wi99VLan+voxGzfLxRXL/7CM7ufu2xKUM/SvIdHbPt9Jurd7nvtuEHJbKjEqHVnsmeZ
 A76Eqf2CL5Grs49uOIk6sE0Pg6VuxVGrODTl5magmhlFt3xQ/DbTkJpcPFVajaL9rprD
 a2sR0r2m/jkoSXuH0zxFRnHXNLQ6vg7DayIsOE07jemRVdFP8xw5SfRyKXZzlLI/Y5pJ
 rYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KodW1W3UapdxzGinl4ph1E19T3Up3sSRrUYz7X6sIMA=;
 b=qzbx1kxFDJ6OwcdYF4iwHlsQlDk/VFC7uIT5RXQnPl+iLxH2EEuY2dGXN7Fd1iQjRK
 InJQjLBQ+neZK0NskciBGwrzLNcmSrm8WV9z9FT5DDbaVRU3LLkre7g0e7/v3sY+Mq5W
 nJyCgy59XPYOzrn/LryVCnJROuITzWekb7H/WGBa3UXdFYSvw3638fuEFDPrcOCLtUZa
 aROaWu4/k/2gpEkOcVW9+6m9bDNhraJZiK3KiI/OD9bG0ewkiecieEVrYKgZ+94iMIyX
 M9Jcgg+ETdUpZXYDPssxAc2ExaEb5594/4ucShdqrrST8zLrH9eWy3JvQBaFx+uqmCqi
 /j7A==
X-Gm-Message-State: AOAM531LBmjAEVr03y3W9xMgjt0QUoVghQ28Kl9b/AMBX7oK+5tocaq5
 WpfBMKE6pzjoLs2Be8jSomWySKBd/w8=
X-Google-Smtp-Source: ABdhPJx8MMyX9t16ETSjQwaghkLNnt7PpOyVb33bHhUFG7mNkQVfAFwLbVX3R0YuvhVpOFrdci7UUg==
X-Received: by 2002:ac8:544e:: with SMTP id d14mr759743qtq.133.1630701120431; 
 Fri, 03 Sep 2021 13:32:00 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:32:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/15] target/ppc: PMU: insns counter negative overflow
 support
Date: Fri,  3 Sep 2021 17:31:14 -0300
Message-Id: <20210903203116.80628-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
index 9125ba29ae..edece140aa 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -253,9 +253,8 @@ static void start_cycle_count_session(CPUPPCState *env)
     }
 }
 
-static void cpu_ppc_pmu_timer_cb(void *opaque)
+static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
-    PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
 
     if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
@@ -288,6 +287,13 @@ static void cpu_ppc_pmu_timer_cb(void *opaque)
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
@@ -380,6 +386,8 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn,
 /* This helper assumes that the PMC is running. */
 void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
 {
+    bool overflow_triggered = false;
+    PowerPCCPU *cpu;
     int sprn;
 
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
@@ -393,8 +401,19 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
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
index 7a3104ecf9..c23ae2479c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4434,6 +4434,14 @@ static void pmu_count_insns(DisasContext *ctx)
         return;
     }
 
+    /*
+     * The PMU insns_inc() helper stops the internal PMU timer if a
+     * counter overflows happens. In that case, if the guest is
+     * running with icount and we do not handle it beforehand,
+     * the helper can trigger a 'bad icount read'.
+     */
+    gen_icount_io_start(ctx);
+
     gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
 }
 #else
-- 
2.31.1


