Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F18430D52
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:12:17 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHCK-0004wB-N9
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2U-0006jU-M3; Sun, 17 Oct 2021 21:02:06 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2S-0001Bj-Mx; Sun, 17 Oct 2021 21:02:06 -0400
Received: by mail-ua1-x92e.google.com with SMTP id r17so4674514uaf.8;
 Sun, 17 Oct 2021 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qaoy0P+j4qWwYzJ3qiP7aAF/XN+LRh73RT8pCL5I+1c=;
 b=YM/YycFug0vTLykKb5c8rnUBlrDTK4WWfvJWpqWWt4Cxhmi6f3jOYa+kcFmoymWFM3
 4WTH+Sw6WfAx4s3ZxwkQrbUcdliLT77R3wHGUk5uKdLxZkcxARm52Oa/UgOOz7hJttwg
 5ebFncu0rYFdvP3Wn/jIfViD+H5BkosF3Gn0H/8X7nV+riHNT+xN9B3wWJLtuzZAsiBS
 5p4Sah8deykDNu5uIULHe83H53YnumTYUMCjAcpXrxYdixJ6fDUadiYL7h9T8lHm4bT0
 c+6d13yla8tBhNp9Uf+0hxbPJ0TkNBeytBhRQqjIPM7aS/ZEp/n/pTyWVK/eiFCCzGmC
 jtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qaoy0P+j4qWwYzJ3qiP7aAF/XN+LRh73RT8pCL5I+1c=;
 b=SvYqyzsUdhcoma28ZTJTgKL/nOJ2J4D0VWBmuP+8IZG6qC/VJUQexGaplxfVQRVo0T
 x0/hWNB1NpyOXBN48n7JtluN/gkhI+rhLsCDJbRCVM1CTrC7Hcq8LgHf8Afw5Ek0WsMr
 4UoCvgw7/QIsHpAI8PDVvu4BvmFDmnUTnwM5XyQIWg1QXN99eyu1kiY37qajiAd4MCZm
 nSDHzlKv39/WxBEkB++0+dlQJ2moqf+vmHA40ZmMqhrNLSt3bS0hod6RxDS6lS06qn6e
 iKFJjwAXP0ezBsSJ7TOm8A3cx/gF9aZbBlFNl5WJjBgDVj8hR6RkAG7ly7fzYWbQWdPG
 loUA==
X-Gm-Message-State: AOAM5330v6sAmYzrtS52VDfLlCun8dGnVKixXfB0JZekKag4r7QSdMS/
 fGS3PpxR/jy7lpNhnSnq7dBFEXUSXP0=
X-Google-Smtp-Source: ABdhPJy3rIw4pfBMg/F7E0As247oYGdg3doWipTrex0BcgeWSvWklZ8u02arR5BX1E3AltMUYtMoaA==
X-Received: by 2002:ab0:6d8d:: with SMTP id m13mr22877756uah.113.1634518923148; 
 Sun, 17 Oct 2021 18:02:03 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/15] target/ppc: enable PMU counter overflow with cycle
 events
Date: Sun, 17 Oct 2021 22:01:26 -0300
Message-Id: <20211018010133.315842-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
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

The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
conditions are enabled. This means that if the counter value overflows
(i.e. exceeds 0x80000000) a performance monitor alert will occur. This alert
can trigger an event-based exception (to be implemented in the next patches)
if the MMCR0_EBE bit is set.

For now, overflowing the counter when the PMC is counting cycles will
just trigger a performance monitor alert. This is done by starting the
overflow timer of the PMUEvent to expire in the moment the overflow
would be occuring. The timer will call fire_PMC_interrupt() (via
cpu_ppc_pmu_timer_cb) which will trigger the PMU alert and, if the
conditions are met, an EBB exception.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  2 ++
 target/ppc/power8-pmu.c | 75 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e6bb55cb1a..074d844741 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -373,6 +373,8 @@ typedef struct PMUEvent {
 #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
 #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
+#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
+#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 /* MMCR2 userspace r/w mask */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 55906c70a2..724a1a4038 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -23,6 +23,8 @@
 
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 
+#define COUNTER_NEGATIVE_VAL 0x80000000
+
 /*
  * For PMCs 1-4, IBM POWER chips has support for an implementation
  * dependent event, 0x1E, that enables cycle counting. The Linux kernel
@@ -91,6 +93,15 @@ static bool pmu_event_is_active(CPUPPCState *env, PMUEvent *event)
     return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
 }
 
+static bool pmu_event_has_overflow_enabled(CPUPPCState *env, PMUEvent *event)
+{
+    if (event->sprn == SPR_POWER_PMC1) {
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+    }
+
+    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+}
+
 static void pmu_events_update_cycles(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -121,6 +132,52 @@ static void pmu_events_update_cycles(CPUPPCState *env)
     }
 }
 
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    int i;
+
+    for (i = 0; i < PMU_EVENTS_NUM; i++) {
+        PMUEvent *event = &env->pmu_events[i];
+
+        if (event->sprn == SPR_POWER_PMC5) {
+            continue;
+        }
+
+        timer_del(event->cyc_overflow_timer);
+    }
+}
+
+static void pmu_events_start_overflow_timers(CPUPPCState *env)
+{
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t timeout;
+    int i;
+
+    env->pmu_base_time = now;
+
+    /*
+     * Scroll through all PMCs ad start counter overflow timers for
+     * PM_CYC events, if needed.
+     */
+    for (i = 0; i < PMU_EVENTS_NUM; i++) {
+        PMUEvent *event = &env->pmu_events[i];
+
+        if (!pmu_event_is_active(env, event) ||
+            !(event->type == PMU_EVENT_CYCLES) ||
+            !pmu_event_has_overflow_enabled(env, event)) {
+            continue;
+        }
+
+        if (env->spr[event->sprn] >= COUNTER_NEGATIVE_VAL) {
+            timeout =  0;
+        } else {
+            timeout  = COUNTER_NEGATIVE_VAL - env->spr[event->sprn];
+        }
+
+        timer_mod(event->cyc_overflow_timer, now + timeout);
+    }
+}
+
 /*
  * A cycle count session consists of the basic operations we
  * need to do to support PM_CYC events: redefine a new base_time
@@ -128,8 +185,22 @@ static void pmu_events_update_cycles(CPUPPCState *env)
  */
 static void start_cycle_count_session(CPUPPCState *env)
 {
-    /* Just define pmu_base_time for now */
-    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    bool overflow_enabled = env->spr[SPR_POWER_MMCR0] &
+                            (MMCR0_PMC1CE | MMCR0_PMCjCE);
+
+    /*
+     * Always delete existing overflow timers when starting a
+     * new cycle counting session.
+     */
+    pmu_delete_timers(env);
+
+    if (!overflow_enabled) {
+        /* Define pmu_base_time and leave */
+        env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        return;
+    }
+
+    pmu_events_start_overflow_timers(env);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
-- 
2.31.1


