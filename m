Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C5457674
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:34:37 +0100 (CET)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8ia-0003zJ-6D
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XD-0004CP-KL; Fri, 19 Nov 2021 13:22:52 -0500
Received: from [2607:f8b0:4864:20::931] (port=39757
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XC-0001oL-0k; Fri, 19 Nov 2021 13:22:51 -0500
Received: by mail-ua1-x931.google.com with SMTP id i6so23007260uae.6;
 Fri, 19 Nov 2021 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFsGFsGd2XzKYW/+Od+IKB2ETeZxJSknNMw33kc55iw=;
 b=hv9ls9c4o03FoOC02H0PC5rVeXC4d05oXPUsG/TYiIKEO2GBYsHfEYHcItstzTnioP
 k0tYY76AAuNJLerYbMBFkzoK2pxZjbJL8ZcqHBSmlMziNXvgSJY+2XN+3kfmExdd5Tzn
 MSsqdD3JmwwC4KXdx7g9ZaQ6zqdeZBiipM7kF/JMt5ekg2+2m5zcAqmiQ0/NToCe+ud/
 0sWCnBRcz5oPQXhjwUqX8+PZZyjEV7A+e5jEscrSqUAP1ePMky1bfXj1/0xFenKFW9I7
 G9a0u+rNvNfWzsSCo0w+ueIi6716gmQHe0HUAlxxdQ58UWP1tqmn/NIVCrv2SAtwAHki
 MVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFsGFsGd2XzKYW/+Od+IKB2ETeZxJSknNMw33kc55iw=;
 b=Do9bNpCcqb5bdsXnRT5rk7OXW56nDU4r76Yvt8s4SXoHTakziPRpna6IW98N79YpB4
 k6rwpQ9ERoKlfeIT4u0JYp7cMif2VCyr56//pJq+QDeiuwyjWazUd28u22NU3ItXrTK1
 7S1v+T/YSchiDdC3BQDvsteqab1KhspGf1pQpJri2EegeFaYbpB1ea/C2wwya6LRV9i+
 SmfeTpKvf+1p/QLhYC18oaglm9J7Y7ftdjkTGXCM/lmjn2BP8YtpcWomsOpMWWwK2KUH
 yZilHSvXWLUTTETA17TK8Im7fokpWc+sHGMzNJR47cvr8NJBPDWSNQAmYZoCAjexu+7I
 uBLA==
X-Gm-Message-State: AOAM5321sIR6hE8zz/bkpprupH7vKxW4Z2jWHRAtndKn8GFocI7Rzvl0
 G10R4G+uHwCgS8b0+UbW2HsRnAeqQTixTQ==
X-Google-Smtp-Source: ABdhPJxQff3+PXFmdZiL1gKAroH8+iWeYZ4iuFAqqLsptAI2E8VZmsn4qBjWnzCwzsatUw6vC89RIA==
X-Received: by 2002:a05:6102:356e:: with SMTP id
 bh14mr97975985vsb.21.1637346168071; 
 Fri, 19 Nov 2021 10:22:48 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 05/10] target/ppc/power8-pmu.c: add
 PM_RUN_INST_CMPL (0xFA) event
Date: Fri, 19 Nov 2021 15:22:11 -0300
Message-Id: <20211119182216.628676-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
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
index 1b74916faf..a1957c5e7a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -303,6 +303,7 @@ typedef enum {
     PMU_EVENT_INVALID = 0,
     PMU_EVENT_CYCLES,
     PMU_EVENT_INSTRUCTIONS,
+    PMU_EVENT_INSN_RUN_LATCH,
 } PMUEventType;
 
 /*****************************************************************************/
@@ -388,6 +389,9 @@ typedef enum {
 #define MMCR1_PMC4SEL_START 56
 #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
 
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e0b6fe4057..6ac6bcf7b9 100644
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
index fb44e6bc56..e43a74cc66 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -70,6 +70,15 @@ static PMUEventType getPMUEventType(CPUPPCState *env, int sprn)
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
@@ -111,12 +120,23 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 
     /* PMC6 never counts instructions */
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
+        PMUEventType evt_type = getPMUEventType(env, sprn);
+        bool insn_event = evt_type == PMU_EVENT_INSTRUCTIONS ||
+                          evt_type == PMU_EVENT_INSN_RUN_LATCH;
+
         if (!pmc_is_active(env, sprn, env->spr[SPR_POWER_MMCR0]) ||
-            getPMUEventType(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+            !insn_event) {
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
index eb1d0c2bf0..fdc6adfc31 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
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


