Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931D4B2D25
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:51:54 +0100 (CET)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIb1N-0005Je-1x
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:51:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakR-0004Pn-Ug; Fri, 11 Feb 2022 13:34:23 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=36494
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakP-00047Q-R1; Fri, 11 Feb 2022 13:34:23 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so11387064oov.3; 
 Fri, 11 Feb 2022 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6qI1cXWj/snLOv765Pti0GJPpsTAWSnfGzCkzaSYLSU=;
 b=GrxUk5ACwgbkcnxiwbaA3HMass3SDK2WnSIbNV+GKLFACBnVlp/PUzgPLrOrenG/Vk
 3znJLpqI2CSRm8OZKIPxF1RTL9jfjHzW4Ky1mWZ/I/Awo1Z6jQeICsIMFlOOkQah67aG
 c5Giy9+/gvDCoXkLXfyiss/WsPej7TGDJgY5FXC4mVighbGg4rdk6IkmRBPaASj6c99i
 ZRdbTa/wKfaaQWQZn67tGkxfSGZ3clHsLsqULq7d/QwKN1+Jh0DAJn/zt8vuIeK+VNhP
 5QK0NFSKOMwsJ1Erv44HvGk/TOl/56H/Zh8teA07igIoHcOgVvHsCIKQSFd6wuN55/LM
 DOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6qI1cXWj/snLOv765Pti0GJPpsTAWSnfGzCkzaSYLSU=;
 b=BpDyVDZHSU/K3i/AJdaAfKFeOem7sB0qyRvWryns7+VQmG+15Z73SVAUXSjQQ0JZ2J
 HsLxEOlVYipdbudOc/Q4LCnfeeXDaNxkdWH610rEY9E8sBxmU5MG8y5BX0eaBRUZLVHk
 SA68lUfDVyQdAKAcK0SWxFnvlP+Ihn+qebNNkFTFmqQtFyJi0YMa8QYsRh4cHH9bjfa+
 1HtJn0wgAkTzo5gZwiiuvRbP5pUwMCqoYMEp2/CkEUT6zc9m2ER1UNsWbBLVxZWBwpQe
 zCbl29lCBgdJ43rfhYHYu8/Edyj6hKXRUTBMVS7UyFD5DCtwiYdDNcOCR71VWfJAJuiP
 39xA==
X-Gm-Message-State: AOAM53393sz50c4o0lTIlbCu1Effr+Ub49uPrmjFS9xCZHWJolqpjHge
 zxG2GG1m8Si/4NOL6jsrjuri5/6bodw=
X-Google-Smtp-Source: ABdhPJxt5TV/AcfiBNm341LuCH+tvZkq0Fzp6iNX5LjMzn67qCGDacBqD9P0wB3SP+jPIaH3uL90sw==
X-Received: by 2002:a05:6870:660e:: with SMTP id
 gf14mr546721oab.235.1644604460273; 
 Fri, 11 Feb 2022 10:34:20 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id t22sm10008145oiw.2.2022.02.11.10.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:34:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Date: Fri, 11 Feb 2022 15:33:54 -0300
Message-Id: <20220211183354.563602-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211183354.563602-1-danielhb413@gmail.com>
References: <20220211183354.563602-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the EBB exception support that are triggered by
Performance Monitor alerts. This happens when a Performance Monitor
alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.

fire_PMC_interrupt() will execute a new ebb_perfm_excp() helper that
will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits are
set, do_ebb() will attempt to trigger a PERFM EBB event.

If the EBB facility is enabled in both FSCR and HFSCR we consider that
the EBB is valid and set BESCR_PMEO. After that, if we're running in
problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
queue a PPC_INTERRUPT_EBB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/helper.h      |  1 +
 target/ppc/power8-pmu.c  |  3 +--
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ad40a0f8e6..0c031e67b1 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1948,6 +1948,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
         env->spr[SPR_BESCR] &= ~BESCR_GE;
     }
 }
+
+/*
+ * Triggers or queues an 'ebb_excp' EBB exception. All checks
+ * but FSCR, HFSCR and msr_pr must be done beforehand.
+ *
+ * PowerISA v3.1 isn't clear about whether an EBB should be
+ * postponed or cancelled if the EBB facility is unavailable.
+ * Our assumption here is that the EBB is cancelled if both
+ * FSCR and HFSCR EBB facilities aren't available.
+ */
+static void do_ebb(CPUPPCState *env, int ebb_excp)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = CPU(cpu);
+
+    /*
+     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
+     * HFSCR.
+     */
+    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
+    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
+
+    if (ebb_excp == POWERPC_EXCP_PERFM_EBB) {
+        env->spr[SPR_BESCR] |= BESCR_PMEO;
+    } else if (ebb_excp == POWERPC_EXCP_EXTERNAL_EBB) {
+        env->spr[SPR_BESCR] |= BESCR_EEO;
+    }
+
+    if (msr_pr == 1) {
+        powerpc_excp(cpu, ebb_excp);
+    } else {
+        env->pending_interrupts |= 1 << PPC_INTERRUPT_EBB;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+void helper_ebb_perfm_excp(CPUPPCState *env)
+{
+    bool perfm_ebb_enabled = env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
+                             env->spr[SPR_BESCR] & BESCR_PME &&
+                             env->spr[SPR_BESCR] & BESCR_GE;
+
+    if (!perfm_ebb_enabled) {
+        return;
+    }
+
+    do_ebb(env, POWERPC_EXCP_PERFM_EBB);
+}
 #endif
 
 /*****************************************************************************/
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f2e5060910..adc31235a8 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
 DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(rfebb, void, env, tl)
+DEF_HELPER_1(ebb_perfm_excp, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d245663158..38e1ecb782 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -307,8 +307,7 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
 
-    /* PMC interrupt not implemented yet */
-    return;
+    helper_ebb_perfm_excp(env);
 }
 
 /* This helper assumes that the PMC is running. */
-- 
2.34.1


