Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8747DDFE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 04:04:04 +0100 (CET)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0EOh-0008Fi-DC
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 22:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMh-0006Aj-1v
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:01:59 -0500
Received: from [2607:f8b0:4864:20::636] (port=34353
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0EMf-00082U-8G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 22:01:58 -0500
Received: by mail-pl1-x636.google.com with SMTP id x15so3281401plg.1
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 19:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCrXIz6oQFkKNm70zoG/HZSBQOnDEr0Dc7B5UJQw9/s=;
 b=oF1YlVbOJPaUjGbhNbEDYh+E8M9h96Niab4cUjjyZ93BL7OrgsHB7teHQqpi7xYx0L
 3DvnKlqJaxq7/J3zPi9OCr034WQuNovsCr5vtojHbUCMSuCymvIMGyjQc/P42G/ooD0I
 mb/m1xEN+BZ2HsQd3s7ooXcYoYJvEqoU6tuK3AdmwRSW7bUf5iJnc56IN1diKyz8Gd28
 D+wrc8AFKR7EVhLL0XcnwhDjLtK61dErtfkQ7U2b6WlTl8HItitwesP0mFZI8D2P0YY6
 +kGqunHEwvgcuv3vSlxgRAGPHwj2yxMUWVh34zPc9lwZ+VZUD4EDkL6FfeAgZglMfrZK
 Ao3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCrXIz6oQFkKNm70zoG/HZSBQOnDEr0Dc7B5UJQw9/s=;
 b=KGdnPw1OwBvUjIpc5aYKq7Fl0frW3k/x8XaqHHs46Aj55ZiN9I3l1e5wJhlzZfQGXX
 gQ/hv411ekCbMISGFeAnxsf23HXFww3J1RLJdeADudAQOKj0dhbFkmwxeLvfSP7ggoUk
 ZwHzwFyoTGczg2WOl/0vBKls4tojT6q58g6cvaW7G2wyZHg5U5o7fYsS8d55M04qRxdG
 M0Q5SpygV8pSWe6YWkIlXCDMsMSDwrpawdaXjaEcDZlO7ru1KYeqqfjP9KYkMSqtI9Mb
 rL/tPewXy4yre2LBMAwLlujt/f7jWIzpq706de1JFz4trsUyedBAqsfjqWsU5JDDofKY
 2JjA==
X-Gm-Message-State: AOAM5327jsYDAGLQIaehUWP/9WXsn6FHz1KCJrQoL7YAzfVw3+QPWwSk
 TDIAcrwgMW43qpuRPy5urFhTls/ec/2p1A==
X-Google-Smtp-Source: ABdhPJwzsuTtz50GytEgMsRinQqrlsvhwBsE+jWVPe5rKlOdhDGJ34XhbSRxR9YtMKsb7/7awTFoxw==
X-Received: by 2002:a17:902:c215:b0:148:af14:6e96 with SMTP id
 21-20020a170902c21500b00148af146e96mr440038pll.80.1640228512109; 
 Wed, 22 Dec 2021 19:01:52 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm4248513pfk.83.2021.12.22.19.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 19:01:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/ppc: Cache per-pmc insn and cycle count settings
Date: Wed, 22 Dec 2021 19:01:47 -0800
Message-Id: <20211223030149.1947418-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223030149.1947418-1-richard.henderson@linaro.org>
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the combination of frozen bit and counter type, on a per
counter basis.  So far this is only used by HFLAGS_INSN_CNT, but
will be used more later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  3 +++
 target/ppc/power8-pmu.h  | 14 +++++------
 target/ppc/cpu_init.c    |  1 +
 target/ppc/helper_regs.c |  2 +-
 target/ppc/machine.c     |  2 ++
 target/ppc/power8-pmu.c  | 51 +++++++++++++++++++++++++++++++---------
 6 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fc66c3561d..a297a52168 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1144,6 +1144,9 @@ struct CPUPPCState {
     /* Other registers */
     target_ulong spr[1024]; /* special purpose registers */
     ppc_spr_t spr_cb[1024];
+    /* Composite status for PMC[1-5] enabled and counting insns or cycles. */
+    uint8_t pmc_ins_cnt;
+    uint8_t pmc_cyc_cnt;
     /* Vector status and control register, minus VSCR_SAT */
     uint32_t vscr;
     /* VSX registers (including FP and AVR) */
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index 3ee4b4cda5..a839199561 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -13,14 +13,12 @@
 #ifndef POWER8_PMU
 #define POWER8_PMU
 
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "exec/helper-proto.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
-
 void cpu_ppc_pmu_init(CPUPPCState *env);
-bool pmu_insn_cnt_enabled(CPUPPCState *env);
+
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void pmu_update_summaries(CPUPPCState *env);
+#else
+static inline void pmu_update_summaries(CPUPPCState *env) { }
+#endif
 
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 06ef15cd9e..63f9babfee 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8313,6 +8313,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #endif /* CONFIG_TCG */
 #endif
 
+    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index b847928842..8671b7bb69 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -123,7 +123,7 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     }
 
 #if defined(TARGET_PPC64)
-    if (pmu_insn_cnt_enabled(env)) {
+    if (env->pmc_ins_cnt) {
         hflags |= 1 << HFLAGS_INSN_CNT;
     }
 #endif
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 93972df58e..756d8de5d8 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
+#include "power8-pmu.h"
 
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -19,6 +20,7 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
+    pmu_update_summaries(env);
 }
 
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5..d547e4c99b 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -11,8 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-
-#include "power8-pmu.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "exec/exec-all.h"
@@ -20,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
+#include "power8-pmu.h"
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
@@ -121,18 +120,47 @@ static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
     return evt_type;
 }
 
-bool pmu_insn_cnt_enabled(CPUPPCState *env)
+void pmu_update_summaries(CPUPPCState *env)
 {
-    int sprn;
+    target_ulong mmcr0 = env->spr[SPR_POWER_MMCR0];
+    target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
+    int ins_cnt = 0;
+    int cyc_cnt = 0;
 
-    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
-        if (pmc_get_event(env, sprn) == PMU_EVENT_INSTRUCTIONS ||
-            pmc_get_event(env, sprn) == PMU_EVENT_INSN_RUN_LATCH) {
-            return true;
+    if (!(mmcr0 & MMCR0_FC14) && mmcr1 != 0) {
+        target_ulong sel;
+
+        sel = extract64(mmcr1, MMCR1_PMC1EVT_EXTR, MMCR1_EVT_SIZE);
+        switch (sel) {
+        case 0x02:
+        case 0xfe:
+            ins_cnt |= 1 << 1;
+            break;
+        case 0x1e:
+        case 0xf0:
+            cyc_cnt |= 1 << 1;
+            break;
         }
+
+        sel = extract64(mmcr1, MMCR1_PMC2EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= (sel == 0x02) << 2;
+        cyc_cnt |= (sel == 0x1e) << 2;
+
+        sel = extract64(mmcr1, MMCR1_PMC3EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= (sel == 0x02) << 3;
+        cyc_cnt |= (sel == 0x1e) << 3;
+
+        sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
+        ins_cnt |= ((sel == 0xf4) || (sel == 0x2)) << 4;
+        cyc_cnt |= (sel == 0x1e) << 3;
     }
 
-    return false;
+    ins_cnt |= !(mmcr0 & MMCR0_FC56) << 5;
+    cyc_cnt |= !(mmcr0 & MMCR0_FC56) << 6;
+
+    env->pmc_ins_cnt = ins_cnt;
+    env->pmc_cyc_cnt = cyc_cnt;
+    env->hflags = deposit32(env->hflags, HFLAGS_INSN_CNT, 1, ins_cnt != 0);
 }
 
 static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
@@ -264,8 +292,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 
     env->spr[SPR_POWER_MMCR0] = value;
 
-    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_INSN_CNT */
+    /* MMCR0 writes can change HFLAGS_PMCC[01] and HFLAGS_INSN_CNT */
     hreg_compute_hflags(env);
+    pmu_update_summaries(env);
 
     /* Update cycle overflow timers with the current MMCR0 state */
     pmu_update_overflow_timers(env);
@@ -278,7 +307,7 @@ void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
     env->spr[SPR_POWER_MMCR1] = value;
 
     /* MMCR1 writes can change HFLAGS_INSN_CNT */
-    hreg_compute_hflags(env);
+    pmu_update_summaries(env);
 }
 
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
-- 
2.25.1


