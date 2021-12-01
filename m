Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F0465164
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:21:26 +0100 (CET)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRQD-0000wK-Vp
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:21:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMx-0006g2-7L; Wed, 01 Dec 2021 10:18:03 -0500
Received: from [2607:f8b0:4864:20::a31] (port=47035
 helo=mail-vk1-xa31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMu-0003KQ-P8; Wed, 01 Dec 2021 10:18:02 -0500
Received: by mail-vk1-xa31.google.com with SMTP id m16so15329217vkl.13;
 Wed, 01 Dec 2021 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jY8JzvVz7HP00Df2zdAwY6tZZA1+frv+TEz5M1rsPzs=;
 b=bi/OFayqRjPkF15Po1khv7gm1jlXDXF/hyUiaWfpPQCI4eAmtz7XrNlLBO3jlxWbmH
 ze/DzkQCrUQXofOHB/CeeaH3Ur9IypeuZQJK0xqWktA7OwUViRRqih8sFFnAjs8Lio2T
 3s3bMIAlkE+4fhdLqqu3iN9jRjZRzo88556EfwbG5MpVZKG97mCCPBGLhRab89YrvssA
 uOrWEkx+fhLmiRwQaj9cB9uAeMPnpEC0JNMjYMolh2HgkzXusc4i2dEHAGVPwWKCSUpl
 0iIJPv5vHhMoerWS8C14zo9Xk9RorsJKwj3Tg3xvgWuXOoEnfxn05rQzeu9Ja5pkr7d1
 2CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jY8JzvVz7HP00Df2zdAwY6tZZA1+frv+TEz5M1rsPzs=;
 b=XEi28y1ciCM9EEMwliOyhURYdQK3K9ZTbAqquFFY38FCn3vh/XPLGY5f+x7AVbgg+1
 E23ifugnN57w20K4Qtx/PgrmNDs6rm36l6wWNCmPDN9YPOkJF5DzcYtJYwGTYFq2OLk1
 bq4mc6Ru4XVD6sEHH2ZNCPDP7eOIl3blhVLsIlruxonbgEV8at4HIgQCeOplNi14RHFS
 CE373EdY+9vFRwUpaJ/zonuTuG062bnahaFoi8eqkb6lJyC4C47ciuzJ2rYdN7y+1v9j
 VPMI0HhacRXVe6ZSCCfIOsL9S/Bdr09s9Qxblox9/A05QwYFnLliLCVno+b9ni5v489G
 t55w==
X-Gm-Message-State: AOAM530wbThKmYq32hUc0a8eiBQ7s8lBsf6N4meX1vXGE3JnhGV76Szk
 5kHcqZQy7zkoYyhneexwDuEkneNOKOU=
X-Google-Smtp-Source: ABdhPJz4Yb4iiOKRxX1wf0oAlx7KgIIlB5EOphYAbFFuHJ6L/WEl8i0Gp9TGyyzo/lTzyPbwzhXUVg==
X-Received: by 2002:a05:6122:2227:: with SMTP id
 bb39mr8282553vkb.9.1638371879408; 
 Wed, 01 Dec 2021 07:17:59 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:17:59 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 05/10] target/ppc: enable PMU counter overflow with cycle
 events
Date: Wed,  1 Dec 2021 12:17:29 -0300
Message-Id: <20211201151734.654994-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
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

The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
conditions are enabled. This means that if the counter value overflows
(i.e. exceeds 0x80000000) a performance monitor alert will occur. This alert
can trigger an event-based exception (to be implemented in the next patches)
if the MMCR0_EBE bit is set.

For now, overflowing the counter when the PMC is counting cycles will
just trigger a performance monitor alert. This is done by starting the
overflow timer to expire in the moment the overflow would be occuring. The
timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which will
trigger the PMU alert and, if the conditions are met, an EBB exception.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  2 ++
 target/ppc/power8-pmu.c | 71 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0d9690c937..f562d5b933 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,8 @@ typedef enum {
 #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
 #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
+#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
+#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 73252529be..399234a2fc 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
+
 static bool pmc_is_inactive(CPUPPCState *env, int sprn)
 {
     if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
@@ -36,6 +38,15 @@ static bool pmc_is_inactive(CPUPPCState *env, int sprn)
     return env->spr[SPR_POWER_MMCR0] & MMCR0_FC56;
 }
 
+static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
+{
+    if (sprn == SPR_POWER_PMC1) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+}
+
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -123,6 +134,61 @@ static void pmu_update_cycles(CPUPPCState *env)
     env->pmu_base_time = now;
 }
 
+/*
+ * Helper function to retrieve the cycle overflow timer of the
+ * 'sprn' counter.
+ */
+static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
+{
+    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
+}
+
+static void pmc_update_overflow_timer(CPUPPCState *env, int sprn)
+{
+    QEMUTimer *pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
+    int64_t timeout;
+
+    /*
+     * PMC5 does not have an overflow timer and this pointer
+     * will be NULL.
+     */
+    if (!pmc_overflow_timer) {
+        return;
+    }
+
+    if (pmc_get_event(env, sprn) != PMU_EVENT_CYCLES ||
+        !pmc_has_overflow_enabled(env, sprn)) {
+        /* Overflow timer is not needed for this counter */
+        timer_del(pmc_overflow_timer);
+        return;
+    }
+
+    if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL) {
+        timeout =  0;
+    } else {
+        timeout = PMC_COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    }
+
+    /*
+     * Use timer_mod_anticipate() because an overflow timer might
+     * be already running for this PMC.
+     */
+    timer_mod_anticipate(pmc_overflow_timer, env->pmu_base_time + timeout);
+}
+
+static void pmu_update_overflow_timers(CPUPPCState *env)
+{
+    int sprn;
+
+    /*
+     * Scroll through all PMCs and start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        pmc_update_overflow_timer(env, sprn);
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     pmu_update_cycles(env);
@@ -131,6 +197,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 
     /* MMCR0 writes can change HFLAGS_PMCCCLEAR */
     hreg_compute_hflags(env);
+
+    /* Update cycle overflow timers with the current MMCR0 state */
+    pmu_update_overflow_timers(env);
 }
 
 void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
@@ -152,6 +221,8 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
     pmu_update_cycles(env);
 
     env->spr[sprn] = value;
+
+    pmc_update_overflow_timer(env, sprn);
 }
 
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
-- 
2.31.1


