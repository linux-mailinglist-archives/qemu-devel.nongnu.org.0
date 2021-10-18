Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF35430D59
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:12:39 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHCg-00065h-Lb
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2Y-0006lb-Dt; Sun, 17 Oct 2021 21:02:17 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:37632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2W-0001ZM-Mr; Sun, 17 Oct 2021 21:02:10 -0400
Received: by mail-ua1-x929.google.com with SMTP id f4so2786860uad.4;
 Sun, 17 Oct 2021 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqR/4FXpSKMXflowJdvTANNRTOQST1LZ+4RP3Lswx0A=;
 b=O5lZQKblIoEaroCAW/2aiqhi60vwvPKp1lE7K7d/Kni449Cr/0aiFoZuT7JwyUFR8F
 +qWNlviZ+TwhodfMLc342Jz2c85QqqOh3rTEGjJjx7lHNXNPvIqrkJKjVpoM4xS6ZXs8
 RfRoMcfSWK3NkMJ++cbXEOw1kvNL7DAAwzEeoNAk0Gtw72XPooUSZqJ0xT8NAeBrPzKu
 hZbRbX/asmH1YtoD1uFiS6zO9kyYeeSCcgmkKGCePLMLDobO82Yb5u9F/ZoanCwNo1uo
 U7VMXcj1tTQXIUL6vPVFNx+MkEbgkTkdRJOkVZ5L4hPaHA/xISdORQhWn3dIfvcMhKJg
 AqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqR/4FXpSKMXflowJdvTANNRTOQST1LZ+4RP3Lswx0A=;
 b=aEal3TwvnFaHLcyTqxYQT1aAEk+6bQJglNNlLdJa4rDl7z4UAPP8h7ucW06pJ/6C3n
 yb2/7yaNhydZvylN1snmqqAddLg3NwROd2WQf5F/03uofZoU+6gerx9/FwKPB00GqpKp
 ZYVhYw8RlYgS8IdIrwK1VADqmCyUx7r3neYCUPoTN4VgQjJzRqmndxBqO1cc0dZoqFxt
 LL0x515OxecXdt5vbFijCPVM9d7yqIc6eSvPbNTTWU6a/7eEov/xADA9oMrl493Qo8X4
 be9DfyJIraOv9c4KiCG7HhiE67b4X4Ug3fiCs9qhwlsVTdFEFtY3vtKRV+dqIwzy3ZpT
 WZIQ==
X-Gm-Message-State: AOAM531sKx1mAxVbT750UCUJQZUzTFSh3JxV9vFX43smbPDtvzc8/Ld8
 X4sVuNWpSI9IsM1YdLRvjkUHgsFsc1I=
X-Google-Smtp-Source: ABdhPJzwI1ijd2RCFW5Xfe0p333JMB0PyGmP6D444krfzD8pbEGiCaMA6+fykOWMbHGW/nZV1nPA+g==
X-Received: by 2002:a67:c18c:: with SMTP id h12mr24659264vsj.27.1634518927385; 
 Sun, 17 Oct 2021 18:02:07 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/15] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Sun, 17 Oct 2021 22:01:28 -0300
Message-Id: <20211018010133.315842-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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

PM_RUN_INST_CMPL, instructions completed with the run latch set, is
the architected PowerISA v3.1 event defined with PMC4SEL = 0xFA.

Implement it by checking for the CTRL RUN bit before incrementing the
counter. To make this work properly we also need to force a new
translation block each time SPR_CTRL is written. A small tweak in
pmu_events_increment_insns() is then needed to only increment this event
if the thread has the run latch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  4 ++++
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/power8-pmu.c | 23 ++++++++++++++++++++---
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 185a6166aa..6f9a48a5a1 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -302,6 +302,7 @@ typedef enum {
     PMU_EVENT_INVALID = 0,
     PMU_EVENT_CYCLES,
     PMU_EVENT_INSTRUCTIONS,
+    PMU_EVENT_INSN_RUN_LATCH,
 } PMUEventType;
 
 typedef struct PMUEvent {
@@ -398,6 +399,9 @@ typedef struct PMUEvent {
 #define MMCR1_PMC4SEL_START 56
 #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
 
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ffcd08a947..eb1a0320b9 100644
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
index e9c6b9dfec..3946314e9c 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -62,6 +62,15 @@ static void define_enabled_events(CPUPPCState *env)
                 event->type = PMU_EVENT_CYCLES;
             }
             break;
+        case 0xFA:
+            /*
+             * PMC4SEL = 0xFA is the "instructions completed
+             * with run latch set" event.
+             */
+            if (event->sprn == SPR_POWER_PMC4) {
+                event->type = PMU_EVENT_INSN_RUN_LATCH;
+            }
+            break;
         case 0xFE:
             /*
              * PMC1SEL = 0xFE is the architected PowerISA v3.1
@@ -110,13 +119,21 @@ static bool pmu_events_increment_insns(CPUPPCState *env, uint32_t num_insns)
     /* PMC6 never counts instructions. */
     for (i = 0; i < PMU_EVENTS_NUM - 1; i++) {
         PMUEvent *event = &env->pmu_events[i];
+        bool insn_event = event->type == PMU_EVENT_INSTRUCTIONS ||
+                          event->type == PMU_EVENT_INSN_RUN_LATCH;
 
-        if (!pmu_event_is_active(env, event) ||
-            event->type != PMU_EVENT_INSTRUCTIONS) {
+        if (!pmu_event_is_active(env, event) || !insn_event) {
             continue;
         }
 
-        env->spr[event->sprn] += num_insns;
+        if (event->type == PMU_EVENT_INSTRUCTIONS) {
+            env->spr[event->sprn] += num_insns;
+        }
+
+        if (event->type == PMU_EVENT_INSN_RUN_LATCH &&
+            env->spr[SPR_CTRL] & CTRL_RUN) {
+            env->spr[event->sprn] += num_insns;
+        }
 
         if (env->spr[event->sprn] >= COUNTER_NEGATIVE_VAL &&
             pmu_event_has_overflow_enabled(env, event)) {
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 82f9dc16a4..28126da6e2 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -27,6 +27,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index acc0e50194..e2839883be 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -404,6 +404,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
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


