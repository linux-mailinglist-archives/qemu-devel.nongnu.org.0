Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404EC45DD2C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:18:10 +0100 (CET)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGVl-0000PJ-Bt
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMf-00037Q-RE; Thu, 25 Nov 2021 10:08:45 -0500
Received: from [2607:f8b0:4864:20::92b] (port=34604
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMd-00022F-PU; Thu, 25 Nov 2021 10:08:45 -0500
Received: by mail-ua1-x92b.google.com with SMTP id n6so12972541uak.1;
 Thu, 25 Nov 2021 07:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ASnNF0smJnq9DV9q0P1fSPtqI3ed2Y8rsHWBjOhfCLE=;
 b=NKh7dYcQHwIWhLdODPFVrfM8RTw38yFGeI9dcW8Ht2xobYiy7eENuivU8y6fEglGGA
 pm6pVv3CnkOmPYA0KaB758Y9mOsu8o9Zo5/FU+d51c0mwJ+6HT7r+2+BfDNuGrMBFwgi
 1riAbvd+D9mGhVEQpOv8rAOPa5YkMgSuzANs8MGenG5ldeadRtH6hydtlKd5ADmRXd+T
 mOdn+8mEeD7NOKAc9QTe25OPR27ZBQUaM7Y7XlZGp4sc1xPKolg77uP7dS75MAqbnHZF
 ZCNjXhQ/aKPuU9ncaXImyPzTeHNOW97h99WdQjf+sLR87Y22JyeBPdl+Y0XtyHCnuxMI
 asVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASnNF0smJnq9DV9q0P1fSPtqI3ed2Y8rsHWBjOhfCLE=;
 b=ZxK0SylhaUXgbPD12LOJbHZSHs5m9Gsmj1hoLG2WWKgdo2nFuVWcBW2G48/xVWx4sK
 ULL3Y464uflp49S1KrVzqGp2FsNUrH0piVe0Kbyupl2gFiDU9XX4WVCt0SG5SIKZ4Ifs
 lLxNVuV0iTBEJ289wLADhjCS1vz+Sr3e8ru0pzY5yzHYov/8ssgJ3xbUlSRr9ubbRsy2
 cKFclCjPgoF+XxFxqJ0Hc+ijXiISFWY3Ca1i5fZgp4brpBZNQKlqFZuITxMO70DENRZZ
 SjndLiAKEdwIkxUC5QIWKOYljys6qsoNosUZbTOXeYLydyJmyw0cv1LNOKoylKOeFjmy
 TA/A==
X-Gm-Message-State: AOAM530I0H/QkmPQNzT6OqDVZDwTUiMLJqI5QILu1BGccDosOsL2bifd
 Z0Iu98AJ7OUgwcthc5UjiVqh6cmaWM4=
X-Google-Smtp-Source: ABdhPJzMv0HlxhKHDt2TOn8rlZ8RUnfp1W1zvP0RWZunp4q8ejPbZPNq+iq/pgybBnQixWvXaBInDg==
X-Received: by 2002:a05:6102:a4c:: with SMTP id
 i12mr10088772vss.41.1637852922482; 
 Thu, 25 Nov 2021 07:08:42 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/10] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Thu, 25 Nov 2021 12:08:14 -0300
Message-Id: <20211125150817.573204-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211125150817.573204-1-danielhb413@gmail.com>
References: <20211125150817.573204-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PM_RUN_INST_CMPL, instructions completed with the run latch set, is
the architected PowerISA v3.1 event defined with PMC4SEL = 0xFA.

Implement it by checking for the CTRL RUN bit before incrementing the
counter. To make this work properly we also need to force a new
translation block each time SPR_CTRL is written. A small tweak in
pmu_increment_insns() is then needed to only increment this event
if the thread has the run latch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  4 ++++
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/power8-pmu.c | 24 ++++++++++++++++++++++--
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 38cd2b5c43..993884164f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -304,6 +304,7 @@ typedef enum {
     PMU_EVENT_INACTIVE,
     PMU_EVENT_CYCLES,
     PMU_EVENT_INSTRUCTIONS,
+    PMU_EVENT_INSN_RUN_LATCH,
 } PMUEventType;
 
 /*****************************************************************************/
@@ -389,6 +390,9 @@ typedef enum {
 #define MMCR1_PMC4SEL_START 56
 #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
 
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 2d72dde26d..ecce4c7c1e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6749,7 +6749,7 @@ static void register_book3s_ctrl_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_CTRL, "SPR_CTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_generic,
+                 SPR_NOACCESS, &spr_write_CTRL,
                  0x00000000);
     spr_register(env, SPR_UCTRL, "SPR_UCTRL",
                  &spr_read_ureg, SPR_NOACCESS,
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 59d0def79d..98797f0b2f 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -96,6 +96,15 @@ static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
             evt_type = PMU_EVENT_CYCLES;
         }
         break;
+    case 0xFA:
+        /*
+         * PMC4SEL = 0xFA is the "instructions completed
+         * with run latch set" event.
+         */
+        if (sprn == SPR_POWER_PMC4) {
+            evt_type = PMU_EVENT_INSN_RUN_LATCH;
+        }
+        break;
     case 0xFE:
         /*
          * PMC1SEL = 0xFE is the architected PowerISA v3.1
@@ -119,11 +128,22 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 
     /* PMC6 never counts instructions */
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+        PMUEventType evt_type = pmc_get_event(env, sprn);
+        bool insn_event = evt_type == PMU_EVENT_INSTRUCTIONS ||
+                          evt_type == PMU_EVENT_INSN_RUN_LATCH;
+
+        if (pmc_is_inactive(env, sprn) || !insn_event) {
             continue;
         }
 
-        env->spr[sprn] += num_insns;
+        if (evt_type == PMU_EVENT_INSTRUCTIONS) {
+            env->spr[sprn] += num_insns;
+        }
+
+        if (evt_type == PMU_EVENT_INSN_RUN_LATCH &&
+            env->spr[SPR_CTRL] & CTRL_RUN) {
+            env->spr[sprn] += num_insns;
+        }
 
         if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
             pmc_has_overflow_enabled(env, sprn)) {
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 1d6521eedc..f98d97c0ba 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ccc83d0603..d0e361a9d1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -403,6 +403,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
     spr_store_dump_spr(sprn);
 }
 
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+
+    /*
+     * SPR_CTRL writes must force a new translation block,
+     * allowing the PMU to calculate the run latch events with
+     * more accuracy.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
-- 
2.31.1


