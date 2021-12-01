Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA146516B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:22:07 +0100 (CET)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRQs-0002Ra-VJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRN2-0006jn-I0; Wed, 01 Dec 2021 10:18:08 -0500
Received: from [2607:f8b0:4864:20::934] (port=34547
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRN0-0003MT-Ho; Wed, 01 Dec 2021 10:18:08 -0500
Received: by mail-ua1-x934.google.com with SMTP id n6so49826940uak.1;
 Wed, 01 Dec 2021 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WVS3GAAoJjurl1YFSyMfRyqcO4teP2wEnanuIv/d8qw=;
 b=Sb3ErEYHtK2eyN1g77vgxjKhKhqDh28qGitAfcxeLcAQ+y/0sva0cSjRNZZH6RPvft
 1JVzE9drmt1ue+8QTreyLXz9VJeVA98o1SCnLYuiftuIN8ITwMZCgJNg6zYHLlSwZQwl
 QEHenwRaWxmB1ZATqL9Q1i4iu3qj2NRiuTNeZ2IkmtUDDZuzO1XNlsiqsp/4kfL7HmZ7
 Qk3gRTX5tPrvd/ga9mey0AJ2O73Ptx2IZmnCXmlRPuevMbeiW7lBRhklcRZkmhKKksu1
 DNpPESqV1X/ioM6lLaAfvAq1Mq3Pa+abKhMvVjdwxd0MI+eeKKPu0Kpjcjv+q5RMmC8Q
 Aqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WVS3GAAoJjurl1YFSyMfRyqcO4teP2wEnanuIv/d8qw=;
 b=bsajmQsVd9aZTnz4K7+zMmXAIunJLEYTS0OVAiTt5PtkJS7OLsgO1KhhLvCsBsTVJz
 vV/7mmmkzbVgpGCS58yvEWuSTxpBtFYJmjuAK1X12Jjzqmn5YX2X/uWB4UsTuyd/65qJ
 IvRGhcDWDU+gWPC65iAOMeQ41H/7trA+vPn09mnxUIqKMsuY9uh/VFSkW75Edny3Y1U5
 QiVNj6UcwexGg4oUQQarh1G50uyo7sPPr5d7irlYSW1f7zbE27sotdFQ9IJhdwyo70zE
 Uq/Y4/qg0bLKncOSmpRkik1uJF4fGFMx6SWYZmiiuuZWolVR+wsR1zbuUlgEv5AJF2D2
 hrlw==
X-Gm-Message-State: AOAM531iQ2iIDcQKGByMmv2/F6bHIuvEImXR51AYroYMnoohXrzLzAIi
 UR/FMPKemg7j0GImClNdM+/3R0LaY5w=
X-Google-Smtp-Source: ABdhPJwDd5uK5kCJN1rOZTA7r+LwL6nl08p5lEE3v+BA3fdT1Uvqh9AHjbB0MrNqZ6B7lRaSUv7B8g==
X-Received: by 2002:a67:e054:: with SMTP id n20mr7804836vsl.83.1638371883178; 
 Wed, 01 Dec 2021 07:18:03 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:18:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/10] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Wed,  1 Dec 2021 12:17:31 -0300
Message-Id: <20211201151734.654994-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  4 ++++
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/power8-pmu.c | 27 ++++++++++++++++++++++++---
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 28a185fb25..ac08e669ea 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -303,6 +303,7 @@ typedef enum {
     PMU_EVENT_INACTIVE,
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
index e163ba5640..08d1902cd5 100644
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
@@ -117,7 +126,8 @@ bool pmu_insn_cnt_enabled(CPUPPCState *env)
     int sprn;
 
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) == PMU_EVENT_INSTRUCTIONS) {
+        if (pmc_get_event(env, sprn) == PMU_EVENT_INSTRUCTIONS ||
+            pmc_get_event(env, sprn) == PMU_EVENT_INSN_RUN_LATCH) {
             return true;
         }
     }
@@ -132,11 +142,22 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 
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
index 896b916021..e1076e5f43 100644
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


