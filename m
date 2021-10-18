Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD28430D46
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:09:44 +0200 (CEST)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH9s-0008QJ-1I
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2P-0006ZS-Em; Sun, 17 Oct 2021 21:02:03 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2N-0000op-Eh; Sun, 17 Oct 2021 21:02:01 -0400
Received: by mail-vk1-xa30.google.com with SMTP id bc10so869555vkb.1;
 Sun, 17 Oct 2021 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufmSvaZ4C/uK4Pv1xGj73IfBDohJJr9Vtbjnj3wHkiI=;
 b=hHzN+9RxTL+oTfJnsAib3JQsHbhgNNjELmFDMAPRinSkkfewuqKX8UodvSp+Ib2zDV
 cmlzET6eYQSKlHxpiopq0S9MSBDl/+qNd7MBP9RzvUF5JXkIsAU6/3+GMc0X119926v+
 i27imDGHIKZhCFfyjIfmhiuR4kbeZb5zTMBGBTsBA+r2yqOr81vbo4mfW6GXg2IZ7EmD
 XmTHjUCFV/m5R92IJC4NwSsDVMQOMTyCTGtjjgsshnuwNlsrb+wEOjOOk5Qde0tqEtCs
 /aUSSzOVS7E/lzDV+Wf+VdD/62tSZkaVqwguV1Q13LEa6XPJSnYOlZjOiOyvEhPr4Jy/
 XcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufmSvaZ4C/uK4Pv1xGj73IfBDohJJr9Vtbjnj3wHkiI=;
 b=0rMwYz+haSOKELN74QXjM7F4ygrwnfvoyLcXrfKkMBG7mekposx9JACwpw59yP9fQB
 crdY9M7gIQYejYzOemOdIIk/DMI1PiP1Rwsrf/4GDe35rA5O5Q71wLqSBTWuwwnmfYbp
 2U4DJScQTQj5EpKPScokXvrMLbQHzcNbIU5cwQD7mKLuZgdxWHCrjeyAKxERmY+aDYV0
 JxUVQufWQrxnK6XB/A1LneZmywbi1jztjJ+ku/eCAsYl8vPQDLi8gYEwHbHRX4YqbId7
 qgJ1o9j5bE303A1FO8vfsGgsiu+oUm8SZY6EMcBPoxNoO/PRpISDmKElZqnNNHFJxizR
 yLpA==
X-Gm-Message-State: AOAM533FktDYmuRyPhfguyeF/0jafP3N5dlDYwtlMlxAgDjxKficR341
 cNRv76DbQNuC9JoJ2ROYIVt5ZjrHhYc=
X-Google-Smtp-Source: ABdhPJz10gI7iKlLqjOVEJhMjQr2ugw++BO7HzyQApdrD9DCnb0FP7d2OA2VoPAVy4UatudlZE4KhA==
X-Received: by 2002:a1f:1409:: with SMTP id 9mr21877001vku.25.1634518917972;
 Sun, 17 Oct 2021 18:01:57 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/15] target/ppc: initialize PMUEvents on MMCR1 write
Date: Sun, 17 Oct 2021 22:01:24 -0300
Message-Id: <20211018010133.315842-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
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

The value of MMCR1 determines the events that are going to be sampled by
the programmable counters (PMCs 1-4). PMCs 5 and 6 are always counting
instructions and cycles respectively and aren't affected by MMCR1.

This patch adds a helper to initialize PMCs 1-4 PMUEvents when writing
the MMCR1 register. The following events are considered valid at this
moment:

- For PMCs 1-4, event 0x2 is the implementation dependent value of
PMU_EVENT_INSTRUCTIONS and event 0x1E is the implementation dependent
value of PMU_EVENT_CYCLES. These events are supported by IBM Power chips
since Power8, at least, and the Linux Perf driver makes use of these
events until kernel v5.15;

- for PMC1, event 0xF0 is the architected PowerISA event for cycles.
Event 0xFE is the architected PowerISA event for instructions.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 | 11 ++++++
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu-regs.c.inc | 16 +++++++++
 target/ppc/power8-pmu.c          | 59 ++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |  1 +
 6 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 21591ec725..aaf503c8ff 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -382,6 +382,17 @@ typedef struct PMUEvent {
 #define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
                          MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
 
+#define MMCR1_EVT_SIZE 8
+/* extract64() does a right shift before extracting */
+#define MMCR1_PMC1SEL_START 32
+#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC2SEL_START 40
+#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC3SEL_START 48
+#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC4SEL_START 56
+#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 65545ba9ca..7c9ed5dfe1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6824,7 +6824,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCR0, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_MMCR1,
                      KVM_REG_PPC_MMCR1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4076aa281e..fc5bae8330 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
+DEF_HELPER_2(store_mmcr1, void, env, tl)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 7391851238..a0a64e76ad 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -219,6 +219,17 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
     /* The remaining steps are similar to PMCs 1-4 userspace write */
     spr_write_PMC14_ureg(ctx, sprn, gprn);
 }
+
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_helper_store_mmcr1(cpu_env, cpu_gpr[gprn]);
+
+    /*
+     * Writes in MMCR1 must force a new translation block, allowing
+     * the PMU to calculate events with more accuracy.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -259,4 +270,9 @@ void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 42452b5870..9a0b544b04 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,65 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+/*
+ * For PMCs 1-4, IBM POWER chips has support for an implementation
+ * dependent event, 0x1E, that enables cycle counting. The Linux kernel
+ * makes extensive use of 0x1E, so let's also support it.
+ *
+ * Likewise, event 0x2 is an implementation-dependent event that IBM
+ * POWER chips implement (at least since POWER8) that is equivalent to
+ * PM_INST_CMPL. Let's support this event on PMCs 1-4 as well.
+ */
+static void define_enabled_events(CPUPPCState *env)
+{
+    uint8_t mmcr1_evt_extr[] = { MMCR1_PMC1EVT_EXTR, MMCR1_PMC2EVT_EXTR,
+                                 MMCR1_PMC3EVT_EXTR, MMCR1_PMC4EVT_EXTR };
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        uint8_t pmcsel = extract64(env->spr[SPR_POWER_MMCR1],
+                                   mmcr1_evt_extr[i],
+                                   MMCR1_EVT_SIZE);
+        PMUEvent *event = &env->pmu_events[i];
+
+        switch (pmcsel) {
+        case 0x2:
+            event->type = PMU_EVENT_INSTRUCTIONS;
+            break;
+        case 0x1E:
+            event->type = PMU_EVENT_CYCLES;
+            break;
+        case 0xF0:
+            /*
+             * PMC1SEL = 0xF0 is the architected PowerISA v3.1
+             * event that counts cycles using PMC1.
+             */
+            if (event->sprn == SPR_POWER_PMC1) {
+                event->type = PMU_EVENT_CYCLES;
+            }
+            break;
+        case 0xFE:
+            /*
+             * PMC1SEL = 0xFE is the architected PowerISA v3.1
+             * event to sample instructions using PMC1.
+             */
+            if (event->sprn == SPR_POWER_PMC1) {
+                event->type = PMU_EVENT_INSTRUCTIONS;
+            }
+            break;
+        default:
+            event->type = PMU_EVENT_INVALID;
+        }
+    }
+}
+
+void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
+{
+    env->spr[SPR_POWER_MMCR1] = value;
+
+    define_enabled_events(env);
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 520f1ef233..85852f236e 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -25,6 +25,7 @@
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
-- 
2.31.1


