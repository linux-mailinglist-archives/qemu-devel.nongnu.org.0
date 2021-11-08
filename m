Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8D449ED1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:55:40 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDYB-0000QN-9L
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDU8-000163-Lc; Mon, 08 Nov 2021 17:51:28 -0500
Received: from [2607:f8b0:4864:20::234] (port=42620
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDU6-00009U-RR; Mon, 08 Nov 2021 17:51:28 -0500
Received: by mail-oi1-x234.google.com with SMTP id n66so6605998oia.9;
 Mon, 08 Nov 2021 14:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onoD5K9u5mfIRaSNh0dYjMGF1XEUNFSLdq2ItxcUBg8=;
 b=mTNjb1OhuUfKIP9Z48TPxSx5NPUxDyiKzVh2nbYa7hukPKFRBpynJeLxgZ4s28Xdua
 tFjhBCurvLq7M8qb5lgXvPjWVcrHivLMZ3A/2dMMpmfN6ofgxsQ+ZYtm5Oe4oPCaDJtw
 2q62KbNjJkoaVbuZ+JZKDSUcVQhwI/AaD3BNH875Qg5D1a7eu4CDZWgCvAl4n4NxjbN9
 4PWxf/BU9DN7rKM3+FYDpaMs5S5778rqvyu/+kiiQLelQGkSWscAsjmVDeMUwSP+ivmY
 xKUndzv1xY85n3cdFbd8Rb+OZftzPo6LT5fag5ct9qLMSBWtW0NpF1zLAhj7NgjFUIV2
 vdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onoD5K9u5mfIRaSNh0dYjMGF1XEUNFSLdq2ItxcUBg8=;
 b=ayZs3VV+a0sSwhpDQH9J+SBkz+Sgh93zMc5yijcQIF19C9P2j0TgD5k0z/zLzhFEid
 IfzQVpCIncwYLt7czT3cwiV4dZ2+FTIBs1owLRWZiEV9L1LBqNNG/v9KAB6pE13rD1sP
 +/TcYTPa1W1Vj4+cx070N521azG+z76IblbmzCF0LLcEGuVXG1Iih52NO9aB+rIinqbr
 t4ekPrvtNO1JBVyw/JJexxlV3Ke6MonD/njdYW89zVSaXYfD2OkDJNrHfkkLIKOglpx3
 1eLlXyVz6lCF8I0UtuXLd/IGa13DwBoisJI6T1Ytry2Wv9vcEws7ZPFWlLble3x72NPl
 MGmQ==
X-Gm-Message-State: AOAM531vbB2U3mT9FY1Lt/IROivUjkP4b3FSjLihE+ZtGN790cYnobTi
 XYjAgzCiG0Ykopc6tRk/fCq9TSYE2NU=
X-Google-Smtp-Source: ABdhPJzcD741HD6DOOxyDW9xPkIHYEAiCViG9qMnPuLwd5Vtcmhvc7/K5k01KJJtnHZEg6yoNctc7Q==
X-Received: by 2002:aca:c156:: with SMTP id r83mr1736406oif.78.1636411884785; 
 Mon, 08 Nov 2021 14:51:24 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/10] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Mon,  8 Nov 2021 19:50:42 -0300
Message-Id: <20211108225047.1733607-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108225047.1733607-1-danielhb413@gmail.com>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
index 8c30339bdb..e4010213e2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6748,7 +6748,7 @@ static void register_book3s_ctrl_sprs(CPUPPCState *env)
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


