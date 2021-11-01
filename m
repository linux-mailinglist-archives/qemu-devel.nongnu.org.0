Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92A4424B3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:24:53 +0100 (CET)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhbg-0008Lc-Ak
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhB6-0004Hk-6a; Mon, 01 Nov 2021 19:57:25 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAw-0006Gl-Jk; Mon, 01 Nov 2021 19:57:23 -0400
Received: by mail-qt1-x82e.google.com with SMTP id h16so13032058qtk.0;
 Mon, 01 Nov 2021 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcoWF0ro8SEa/sWiaPCwp3OYAAchyFFySvpbk9Xoz+E=;
 b=YGsBZVOPW+27I0s7ZkhBKhGZStk3t07EFYQiKUYm9GdIAokEVl4IJ+XUN56nFHe8fY
 df0ux0xBbXSoqSevXYcUdBKJS9WvrIXgyZv/GEVcrCOcMM6DcVxKy+5gmLeeZGEadJoY
 6p/qyjKPdWq/rIL6ALucRugSsxfq1w+pDNKu5/wX/LA45EJ/CKXzjPAn7B/l4hNLx4jo
 07fgJc8zsad61PbK4pZLhm1O8clnEeISGIgrWMTw+FT712rWkdRseDC43MADcI0BCZ7z
 YrY7BI6+A0Vd+s/QAdpjOvS9I7FiQn4TJ//qACD4tKyZDkWkchADilasb5zyjB/NG/rE
 Ntog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcoWF0ro8SEa/sWiaPCwp3OYAAchyFFySvpbk9Xoz+E=;
 b=MKz8JrDI6FushzBlq5xBLT7a5rrxcy2NtAHL4/ZYSy2wlMMop+iutMxrRgiHZzjx0z
 OudqYoDUJtl9ZW5T+yJBkbRCOUObzwgheU8KBzsOtacbwbHIaWv+M08zEkEY1x7Nzrz4
 8jsiOI2YOYmzvqShj945vgndRkpIx4aeGQB+3jIhpJ4ymcPVRforNmkr5j7gsmKO5L78
 L3E0w94d+fTtEGg1jGoKtVfU56gBOIVEq+nx/fagsa5lrTJHnzp8Dp0uND0Flkva4XU8
 YBcXuwsg2E6PW2CTCPUc514XR3C6UZTxOqx0APHX4rTzaLZ5L8TE4Bne7KMZvSAP8KGn
 tPEg==
X-Gm-Message-State: AOAM530ffwWcm+owGMTPC93qa64D50i6qiXeaxgbeeSAevmRfvJKgh+C
 OzmycTFUQ+4uF7iZuBmpc2K/JLhNI5A=
X-Google-Smtp-Source: ABdhPJy/P9I73ExzjhZn/SztVGZy2EMlHcOHI5c8NBWnv6DgEpJc+ZahLBLD5cEreZicOp4iqIdFbg==
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr34227362qty.217.1635811033222; 
 Mon, 01 Nov 2021 16:57:13 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/10] target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Mon,  1 Nov 2021 20:56:37 -0300
Message-Id: <20211101235642.926773-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
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
 target/ppc/power8-pmu.c | 25 ++++++++++++++++++++++---
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f965436d19..6c281a4ef4 100644
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
index 6c384c3ac2..e6f3ff9b96 100644
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
index 5f90828aed..3751b6de55 100644
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
@@ -111,12 +120,22 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
 
     /* PMC6 never counts instructions */
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (!pmc_is_active(env, sprn) ||
-            getPMUEventType(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
+        PMUEventType evt_type = getPMUEventType(env, sprn);
+        bool insn_event = evt_type == PMU_EVENT_INSTRUCTIONS ||
+                          evt_type == PMU_EVENT_INSN_RUN_LATCH;
+
+        if (!pmc_is_active(env, sprn) || !insn_event) {
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
 
         if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL &&
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
index 01bacb573d..ac91bd4fba 100644
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


