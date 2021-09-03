Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD0C40071C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:50:29 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG8q-0004sG-6D
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqy-00036a-Jv; Fri, 03 Sep 2021 16:32:00 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqk-0001ce-2Z; Fri, 03 Sep 2021 16:32:00 -0400
Received: by mail-qk1-x731.google.com with SMTP id ay33so319991qkb.10;
 Fri, 03 Sep 2021 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lTTss7SrrwB0A6Ku+sNQ+prO68WOJFHlGNwO7JiDZo=;
 b=HPyaKqJy9rMEzs3iN7NK8Yn3Nnjd2envY7e0bsCrzl8Qwcg7IjrNXqC7PlTSsPPtfl
 rhH6GHsqgZJjgFmb9XXMxWpLYz81Ys0XlAhXjkQorjDkF0NwAMGU9IAUulX/+6iQMuwP
 H9e6y5byDkrD8p1t1Vi/uPGdKBzxwJH+NXdlUAWzHfWkLRzPZ3l7Oa+bNb9b5IaZsH8s
 ejnKPoIWawIgEnxXNIFLH17eIiPZWCVoowTw/4O1xu6U8I1dAoUPtm58PYx3JXtZvwuS
 vnGhX6lf3OHlMy7TShhUcoxsLTAbJU8quXcvQyu8gRox8uleW8fWlS2GSnQotK6CxM3l
 9KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lTTss7SrrwB0A6Ku+sNQ+prO68WOJFHlGNwO7JiDZo=;
 b=r7IX/WEZlo/miJba/Pg1MrBPxkN+axrxfE3d+n5E8exOunKu5QwwkBtk0kiKLuMH06
 6lWeybMmd521zP9LRyq9P+JjCCszf2jw5tpn/LIcHTdUPx7QiEdU6Dr8gDPS5jzbSliG
 pgOk9PD1x2804znBW5MBtw41pWaH2XsjMFHljqkbJR36OpOsSvahl/NLAbX9avt16pLr
 zNfNWSkqEWJfQxhHY6KLv175ayX9fMghTLfoGYmHqyrwdXoaccf4x5SCQEqUE+04dheQ
 WcOXKxITzMVZGki7zVj6MIEB2ZFLfyRYG7vahfw4TIUpgodXZk1Ji7764aA3dTIn9m2x
 Auqw==
X-Gm-Message-State: AOAM5338tO6enW3spiIbBYLmBlDz0gsdWwMztECyXZ2v9atLWR0ChnGR
 6Cx1x/NrrR3L77afzKqIJFM9OK5jU0c=
X-Google-Smtp-Source: ABdhPJwzk3lQ8lFZBY1TB3kDq/ZrztVEguWrME6/A2EGEM3jLNZQStPaP++QaH5pUukOuz1Bmnlfxw==
X-Received: by 2002:a05:620a:38d:: with SMTP id
 q13mr652640qkm.87.1630701104789; 
 Fri, 03 Sep 2021 13:31:44 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] target/ppc/power8_pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Fri,  3 Sep 2021 17:31:07 -0300
Message-Id: <20210903203116.80628-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
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
translation block each time SPR_CTRL is written.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  3 +++
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/power8_pmu.c | 27 ++++++++++++++++++++-------
 target/ppc/spr_tcg.h    |  1 +
 target/ppc/translate.c  | 12 ++++++++++++
 5 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4d4886ac74..76b462c3c8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,9 @@ typedef struct ppc_v3_pate_t {
 #define MMCR1_PMC4SEL_START 56
 #define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
 
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 07c79745ba..0013cba5ff 100644
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
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 9769c0ff35..f584480fde 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -133,17 +133,15 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
     }
 }
 
-static bool pmc_counting_insns(CPUPPCState *env, int sprn)
+static bool pmc_counting_insns(CPUPPCState *env, int sprn,
+                               uint8_t event)
 {
     bool ret = false;
-    uint8_t event;
 
     if (sprn == SPR_POWER_PMC5) {
         return true;
     }
 
-    event = get_PMC_event(env, sprn);
-
     /*
      * Event 0x2 is an implementation-dependent event that IBM
      * POWER chips implement (at least since POWER8) that is
@@ -158,8 +156,15 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn)
         return event == 0x2 || event == 0xFE;
     case SPR_POWER_PMC2:
     case SPR_POWER_PMC3:
-    case SPR_POWER_PMC4:
         return event == 0x2;
+    case SPR_POWER_PMC4:
+        /*
+         * Event 0xFA is the "instructions completed with run latch
+         * set" event. Consider it as instruction counting event.
+         * The caller is responsible for handling it separately
+         * from PM_INST_CMPL.
+         */
+        return event == 0x2 || event == 0xFA;
     default:
         break;
     }
@@ -173,8 +178,16 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
     int sprn;
 
     for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (pmc_counting_insns(env, sprn)) {
-            env->spr[sprn] += num_insns;
+        uint8_t event = get_PMC_event(env, sprn);
+
+        if (pmc_counting_insns(env, sprn, event)) {
+            if (sprn == SPR_POWER_PMC4 && event == 0xFA) {
+                if (env->spr[SPR_CTRL] & CTRL_RUN) {
+                    env->spr[SPR_POWER_PMC4] += num_insns;
+                }
+            } else {
+                env->spr[sprn] += num_insns;
+            }
         }
     }
 }
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 51fbc081de..5e6ed36eb1 100644
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
index b7235a2be0..866b1d2b34 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -402,6 +402,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
     spr_store_dump_spr(sprn);
 }
 
+void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+
+    /*
+     * Write in SPR_CTRL must force a new translation block,
+     * allowing the PMU to calculate the run latch events with
+     * more accuracy.
+     */
+    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+}
+
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
 {
-- 
2.31.1


