Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A6400716
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:48:46 +0200 (CEST)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG7B-0001dq-QF
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqn-0002ZG-Tk; Fri, 03 Sep 2021 16:31:49 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqm-0001dj-7L; Fri, 03 Sep 2021 16:31:49 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id e18so379581qvo.1;
 Fri, 03 Sep 2021 13:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+wi+qQb4G2AkV68aEZiUpC2ywCGEBibpbIhWUWigbI=;
 b=a+//aox/kvxXM3k/at+mo1ZNAZjgeiFhuPZJMzvW9UYKE1BcCqFuArGxOfvHMbY77v
 +dabDriD9JeXl3tx5D0b4KvFVZ1CgBq45pwTdWcR3AngTJH2q0Pntk+qc8WEH9q9sIXT
 +/aUaeaCOoqQykAkRzyKJoGxunUvvpSVJ4Ge2QpIlq6P7RSuxASAUSwHrCI2Enl/bZZe
 gKANEr8MaRQSddJr0NM60uKaTpqlvzWZO2KZjAoIwqZ0yXHV2bYmiyafnzwQkFYyBYbD
 O9w/BYcqb506dete+387itTZHg2qsgnuMO5S4NQxXsX4rFENR774SGQC4de2iWBJ6Flt
 jfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+wi+qQb4G2AkV68aEZiUpC2ywCGEBibpbIhWUWigbI=;
 b=OcZLDLJXZPSqnK8BJDrUs6ojeobYhS9MFKj3XPZRRqoIL+plbM7t2gQWO7C9w3XMcz
 2A/J04KWyLZhDJx3KQXs42jB71WVVdAz/5DLqiXSG/s24ufhtQc4vtMHVxlsHbSZl3H8
 fvbC7Q93+s+1sWE8C6GWnQ/rgKynfTVpORGQQdVv01gA7+2WEQ1hIFBPrT54tvktIF6I
 MLvPzf+isz5oI9jeBW8Ph/wYY3lGzYJFqS+3+vi235+BlbssNmusZ1kjiaVIxYtLgKc4
 Yz+Y5Tq6+njAHSkRrbdZi5W95b4cNh/ZXvRgzEVfG+x/7oaZFHvarDjOuhODTEOiHcES
 FUeg==
X-Gm-Message-State: AOAM530aPNgSwLq57GFSFh4rlJvGLWkph4OdSLO2EYwrD5xkq/2fzENc
 NVDR5V5189Xi25G4EuxsmZ2taqi9iBQ=
X-Google-Smtp-Source: ABdhPJwE5qSt6GT4iEsPD4zJFhhxp9nwPH1Q2jwwuPt6Vox19PA0Nm42Ru5CpWMI4ZgfL/1QE+Tplg==
X-Received: by 2002:a0c:8161:: with SMTP id 88mr964294qvc.20.1630701106940;
 Fri, 03 Sep 2021 13:31:46 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] target/ppc/power8_pmu.c: add PMC14/PMC56 counter
 freeze bits
Date: Fri,  3 Sep 2021 17:31:08 -0300
Message-Id: <20210903203116.80628-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2d.google.com
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
index 76b462c3c8..93f4a46827 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -351,6 +351,8 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
+#define MMCR0_FC14 PPC_BIT(58) /* MMCR0 Freeze Counters 1-4 bit */
+#define MMCR0_FC56 PPC_BIT(59) /* MMCR0 Freeze Counters 5-6 bit */
 
 #define MMCR1_EVT_SIZE 8
 /* extract64() does a right shift before extracting */
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index f584480fde..dd58f57f52 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -59,6 +59,15 @@ static uint8_t get_PMC_event(CPUPPCState *env, int sprn)
     return extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_SIZE);
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
@@ -91,13 +100,19 @@ static void update_cycles_PMCs(CPUPPCState *env)
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
@@ -138,6 +153,10 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn,
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


