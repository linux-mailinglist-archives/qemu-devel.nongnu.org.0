Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5A3F62B5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:33:49 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZMy-0002f0-T2
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKQ-0008Ec-NQ; Tue, 24 Aug 2021 12:31:12 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKO-0008Ue-14; Tue, 24 Aug 2021 12:31:10 -0400
Received: by mail-qt1-x833.google.com with SMTP id u21so14331769qtw.8;
 Tue, 24 Aug 2021 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+9zhb5pU5UdkcMt4NXPfAYOah6MErf8DGT2ptgvitXY=;
 b=WlKke5/DWX55QyofkZfmUdENYdJVX2BE9OA7jROcQUY0twUYoPcPi9a9AJAq7MaNr+
 goJqhrYdJW8tmh/lJ65xjpaAGVpPzfh2t65aKeDdC/cr5jLIBQWuNtrqYu/n10TCd6k8
 GOGmmRZKBWjMUzigA6pZw5P7++DVMvGcfE8O8sFCxFjAhm/Sm+px4++ttW+nfraH0fSH
 AGGjZXtq7TVYulkflWKlYn3zlhqHPYXSTzjgwJBElCwIxpxpmtmZrcBhzv0Tw4kpJ+F9
 DO5NXv92Fc9EJDe1g33Ntmo/ca+8/REmudeQ3iBgCWMf11SwrY+FyV9YN4LZjG8PuJm0
 TpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9zhb5pU5UdkcMt4NXPfAYOah6MErf8DGT2ptgvitXY=;
 b=NY4t7w+rSPudQCCTuDlppvH7mwAj4F5Syy2GcOqCDfhFssqCKCN8cQBlZBzfOsGCH6
 koGj92NBIJM7YBn9GHuOjGQJn8lTyjdp3+3hO322wDHrEtGPX0RGF5+s/CgbZ64yHECK
 t/5dRhItC5GQb0fCWnwO2pKVTIYG5HrPXK1Fo5np7WHE6lh5HjQDsvO2jzR7bgJA5qVu
 7ZNp08NH9/0QSStv0Y4zcQouFZwRv44u6GG67Xuu4xoOzs9c+Pq7G4KNK+xOtuXh/JKM
 ylBmmpg/kFk328DyCvnhROtyv5y6XoxwnFlMtQFoe5lE5HrUSAIsBud1RZYLGVqZUpPC
 R2aQ==
X-Gm-Message-State: AOAM530DhsuLj2zI7iajYVL6BqFc6paoQ237k/o8jNBbMAeG2NEfuL2S
 mAWYwzVljxhA/8MSvH3e+XXWXG7Pjqc=
X-Google-Smtp-Source: ABdhPJyni2q2Py38suYeXeUvSABmg/iIoQ0ch+Qju+Z5qnC7+VSqRmWzqddhhouWOaSCEVUDOA/pZA==
X-Received: by 2002:aed:3147:: with SMTP id 65mr295823qtg.233.1629822666679;
 Tue, 24 Aug 2021 09:31:06 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] target/ppc/power8_pmu.c: add PMC14/PMC56 counter
 freeze bits
Date: Tue, 24 Aug 2021 13:30:24 -0300
Message-Id: <20210824163032.394099-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
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

We're missing two counter freeze bits that are used to further control
how the PMCs behaves: MMCR0_FC14 and MMCR0_FC56. These bits can frozen
PMCs separately: MMCR0_FC14 freezes PMCs 1 to 4 and MMCR0_FC56 freezes
PMCs 5 and 6.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  2 ++
 target/ppc/power8_pmu.c | 25 ++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 60e5e1159a..105ee75a01 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -349,6 +349,8 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
 #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
+#define MMCR0_FC14 PPC_BIT(58)
+#define MMCR0_FC56 PPC_BIT(59)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 9154fca5fd..4545fe7810 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -58,6 +58,15 @@ static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
     return event;
 }
 
+static bool pmc_is_running(CPUPPCState *env, int sprn)
+{
+    if (sprn < SPR_POWER_PMC5) {
+        return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    }
+
+    return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
+}
+
 static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
                                         uint64_t time_delta)
 {
@@ -90,13 +99,19 @@ static void update_cycles_PMCs(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t time_delta = now - env->pmu_base_time;
+    bool PMC14_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    bool PMC6_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
     int sprn;
 
-    for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
-        update_programmable_PMC_reg(env, sprn, time_delta);
+    if (PMC14_running) {
+        for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
+            update_programmable_PMC_reg(env, sprn, time_delta);
+        }
     }
 
-    update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
+    if (PMC6_running) {
+        update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
+    }
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
@@ -136,6 +151,10 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn,
 {
     bool ret = false;
 
+    if (!pmc_is_running(env, sprn)) {
+        return false;
+    }
+
     if (sprn == SPR_POWER_PMC5) {
         return true;
     }
-- 
2.31.1


