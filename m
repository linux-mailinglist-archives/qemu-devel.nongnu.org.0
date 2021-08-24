Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F443F62D5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:40:53 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZTo-0006d9-NI
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKN-0008Cm-53; Tue, 24 Aug 2021 12:31:08 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKL-0008TB-Dk; Tue, 24 Aug 2021 12:31:06 -0400
Received: by mail-qv1-xf35.google.com with SMTP id g11so12042257qvd.2;
 Tue, 24 Aug 2021 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0B0qLh8PXxbEdnRhKaE627h9TxWvlLuXs5FwuLK5IXI=;
 b=UZLHhoIVXpeAQdCn700jHoRbgka2lyGxvzfl1KI7FNDEYPSvc+LRtGCP2rrJYlSN8m
 btzzWSRR66bZRbIoRMbsplilw1nVV+oaTZhtsKNMlo10R+OLbm2c2vA/n7Wf/NeWr7Kc
 eh2TWsEL342qJNPmRYCxhbw2yZ6V2tn1+MZ6cFGTsZ4X5MYNNqeUcGgGiGHBqxiYNw3P
 DjdFC9HFZ3I5AgYV+hzNL6aXnOXZhCKa1vzDOLa4HeJJLxyVrDutJ0INu0FUFWC3VQiF
 pVYH2GwGtjmeKuxV93cXAO/3sIHlYQpyX6u8rlJBvzYhAu3sGbKr9V5ouJsnXSSJNNnK
 vSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0B0qLh8PXxbEdnRhKaE627h9TxWvlLuXs5FwuLK5IXI=;
 b=Vohro5Hy56pJcndshaFBsHyaGMzpGpdJr8rmjKZ2AHDLle0EuDjtjsrvdueETxeDRS
 eSZXZLWdS8oXrP45GReMWsQfs9WLAlAs+unWf1HfDmIgQguBSP85Z6bFrei/wk7Y1kSl
 bW3WazbvJqo75Ti0IJzGrepif4aH9W/P/uItliMatVtPWhQXLbARgBJ3M4LodabloV5M
 ewCk634d28cKiFnpp7Aq1jCT6vd2gINFHlItSJPGFcA0K2tnvqoDmSEYlihRvOz4ntj7
 pRbAuH4vnj3hDhkmCnYvIDNpOVOTZPkwN3Mb6l/tinY5NNSnTiPXVNVhWtpvk9J719Xs
 kPQQ==
X-Gm-Message-State: AOAM531d0by3HLi/UaAK67V0xIjo6Bgh93g/6pyz9kDLZ06mnLoiI579
 wEDlxhzZgzSOkvmNx5o3XVjMLDJE8DA=
X-Google-Smtp-Source: ABdhPJzUdVqkCdYyR6Vd5NF9tZMVlz4x1hBwDDBuhNq6hyur5M8IrsdJIQehCojDS6ZGrcR3XKI1Fg==
X-Received: by 2002:a05:6214:c87:: with SMTP id r7mr2403020qvr.2.1629822663907; 
 Tue, 24 Aug 2021 09:31:03 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/16] target/ppc/power8_pmu.c: add PM_RUN_INST_CMPL (0xFA)
 event
Date: Tue, 24 Aug 2021 13:30:23 -0300
Message-Id: <20210824163032.394099-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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

PM_RUN_INST_CMPL, instructions completed with the run latch set, is
the architected PowerISA v3.1 event defined with PMC4SEL = 0xFA.

Implement it by checking for the CTRL RUN bit before incrementing the
counter.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  3 +++
 target/ppc/power8_pmu.c | 25 ++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e5df644a3c..60e5e1159a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -358,6 +358,9 @@ typedef struct ppc_v3_pate_t {
 #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
 #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
 
+/* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
+#define CTRL_RUN PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 311eaa358f..9154fca5fd 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -131,10 +131,10 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
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
@@ -156,8 +156,15 @@ static bool pmc_counting_insns(CPUPPCState *env, int sprn)
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
@@ -171,8 +178,16 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
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
-- 
2.31.1


