Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0673E4666
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:21:19 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5D8-0001Dq-UU
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53s-0002gQ-SD; Mon, 09 Aug 2021 09:11:24 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53r-0001J5-2w; Mon, 09 Aug 2021 09:11:24 -0400
Received: by mail-qt1-x829.google.com with SMTP id c5so12337981qtp.13;
 Mon, 09 Aug 2021 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfNzdTPldWLEyH+KBmlD0eWDxdh/z8kC0ABllRMYQVM=;
 b=ADmRT38qGzHPFU9gO8iiLXE5R7zOKpZn7zCN/MTlEu9IITNmIjJ7sFhyLb1VGMRJw1
 IU/lGWQ3ByqsuodlZWbd4/xcp4MRqv88kagWy9lgNuWpFURQbBlTE4AgjMfNd+GM7z3h
 pL2Xjaosl9iX2bnS9Yvet7txaYxRGMOBJzUbObTHYFmVXQlPwzc1YWKrHPmzUJ5SNQjN
 wjC4IWkX5fAjfCy94OgrvFI0tlF109MEb5Pwm5znxj0X+ezha15MHvp7xqkH5CQUY5BJ
 +StG4FqvWkIePdHdV6+jj2YcwpNfXMzEwQf+i2Ld5jOx1pHfcxtBvUEeYM/uvrzH80nS
 5ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfNzdTPldWLEyH+KBmlD0eWDxdh/z8kC0ABllRMYQVM=;
 b=JAbgbFRubY0o1dItUO9L5B1uk1WnAdd9GGYNmCXUCe50YMEnyAU7FvLZchYQjqTdNs
 8CDQHVmbyoUPxvN8j3urrZGpgkaSd6AFHyYZuQh+gdySPRk7xwzHCSn9pPEpu047MjFk
 PoflsWs1ndvEGBeO1aM7zt6w649hS6bR/5MpZILJ06AqFhFgT3n20Cz609lkRq8hEYbw
 GuaMXEaBRaq/y+0WZvwEpSPAZKP8HBQeSPTvxdTaV8FbBPZDQtB5MNg7Vlrl000T7W8E
 FsAr0l87ioQRK88NsxHkCCuQmtYrbAmD9xrfovFFhKtvHL+f7NrSRZb7hITlu3VP2z41
 M0iQ==
X-Gm-Message-State: AOAM5300wxR3DWkIcE9glZtap8DdIdRbpr9ENoPRL3LRA+8q+plNnRnN
 FBJTReMw6XV/BOzRoq0AyWg5JndS4nohUQ==
X-Google-Smtp-Source: ABdhPJwjagHYDy/eatKvBH7eic4kk6rUCp1AvEksh3nX8z40ue+EMGOUhdNezgP1np11bfPH00vxXg==
X-Received: by 2002:a05:622a:102:: with SMTP id
 u2mr20028986qtw.190.1628514681442; 
 Mon, 09 Aug 2021 06:11:21 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/19] target/ppc/pmu_book3s_helper: enable PMC1-PMC4 events
Date: Mon,  9 Aug 2021 10:10:44 -0300
Message-Id: <20210809131057.1694145-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
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
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far the PMU logic was using PMC5 for instruction counting (linux
kernel PM_INST_CMPL) and PMC6 to count cycles (PM_CYC). We aren't using
PMCs 1-4.

Let's enable all PMCs to count these 2 events we already provide. The
logic used to calculate PMC5 is now being provided by
update_PMC_PM_INST_CMPL() and PMC6 logic is now implemented in
update_PMC_PM_CYC().

The enablement of these 2 events for all PMUs are done by using the
Linux kernel definition of those events: 0x02 for PM_INST_CMPL and 0x1e
for PM_CYC, all of those defined by specific bits in MMCR1 for each PMC.
PMCs 1-4 relies on the correct event to be defined in MMCR1. PMC5 and
PMC6 will count PM_INST_CMPL and PMC_CYC, respectively, regardless of
MMCR1 setup.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |  8 +++++
 target/ppc/pmu_book3s_helper.c | 60 ++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8cea8f2aca..afd9cd402b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 
+#define MMCR1_PMC1SEL_SHIFT (63 - 39)
+#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
+#define MMCR1_PMC2SEL_SHIFT (63 - 47)
+#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
+#define MMCR1_PMC3SEL_SHIFT (63 - 55)
+#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
+#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 0994531f65..99e62bd37b 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -28,6 +28,56 @@ static uint64_t get_cycles(uint64_t insns)
     return insns * 4;
 }
 
+static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
+                                    uint64_t curr_icount)
+{
+    env->spr[sprn] += curr_icount - env->pmu_base_icount;
+}
+
+static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
+                              uint64_t curr_icount)
+{
+    uint64_t insns = curr_icount - env->pmu_base_icount;
+    env->spr[sprn] += get_cycles(insns);
+}
+
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t curr_icount)
+{
+    int event;
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        event = MMCR1_PMC1SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC1SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC2:
+        event = MMCR1_PMC2SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC2SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC3:
+        event = MMCR1_PMC3SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC3SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC4:
+        event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
+        break;
+    default:
+        return;
+    }
+
+    switch (event) {
+    case 0x2:
+        update_PMC_PM_INST_CMPL(env, sprn, curr_icount);
+        break;
+    case 0x1E:
+        update_PMC_PM_CYC(env, sprn, curr_icount);
+        break;
+    default:
+        return;
+    }
+}
+
 /*
  * Set all PMCs values after a PMU freeze via MMCR0_FC.
  *
@@ -37,10 +87,14 @@ static uint64_t get_cycles(uint64_t insns)
 static void update_PMCs_on_freeze(CPUPPCState *env)
 {
     uint64_t curr_icount = get_insns();
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
+        update_programmable_PMC_reg(env, sprn, curr_icount);
+    }
 
-    env->spr[SPR_POWER_PMC5] += curr_icount - env->pmu_base_icount;
-    env->spr[SPR_POWER_PMC6] += get_cycles(curr_icount -
-                                           env->pmu_base_icount);
+    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, curr_icount);
+    update_PMC_PM_CYC(env, SPR_POWER_PMC6, curr_icount);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
-- 
2.31.1


