Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BE4C36DC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:24:06 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKek-0006E9-0U
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKaA-0008L1-Li; Thu, 24 Feb 2022 15:19:22 -0500
Received: from [2607:f8b0:4864:20::230] (port=33630
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa8-00030y-6u; Thu, 24 Feb 2022 15:19:22 -0500
Received: by mail-oi1-x230.google.com with SMTP id x193so4809578oix.0;
 Thu, 24 Feb 2022 12:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHMjOWoXpSix0c7XyJJy5kRiGq/j5RDb7UL4ykUpzGE=;
 b=KnMK6YHlRi+FwqwUtAP1KHrbsiQr8It1xu7r3UTJgPcA8ay8IUV64Hw22j/sahYx6S
 lVKt6I5+ebLtKAou/KIaHSlfh1zCE2FJypL/WwdR6t3dT1CToWyKsS/jDB79jF9fZmXr
 KpSnGvHeKy2acBjTfiIIFLNr7tBuRCf3+ssZeXngxnuif52rbFr7p1FoW1XJAAAPsDzm
 5zjpCY1DTdBB38oeQUoTCBiX8pRxmYgmlyDZfW3C/AV6wYUuYWmwTW9/gfUHrAaGNj3P
 7mhoi1yY+mAiDaRZsgmi7ym7hO2K6Ohv4VpWIFruDQcIgZ/PDn2mi4HgxAZ8lOL5CGor
 LSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHMjOWoXpSix0c7XyJJy5kRiGq/j5RDb7UL4ykUpzGE=;
 b=Z8i6kY/hj2/Nt3jJ/4Gkv2b41tqfh9KdSIFwCWBtRWy56xsTv9szampywJWJfbvg54
 5facKGV1cuRlUo1P8UsoUcTqcxDPV0o2rTNgauiVBZ5b2D0jmg+s6ktBJSIlfFW8hZ62
 E6XNBfmYqyJVPq0044lFi3JlZAldSBDuink03FtbMhmkd12kxju/efaOw7rhuVn84iKo
 aPERiIWzPcUgHq0ZLogrdhbUkS/OuGTJmalWkmLR59z+QmQ6iyJLouzWkgEzJ/u9VbpU
 I6lOMlheSah7fb2UtOkYQ332uuJXp43M+7Da+oUEjL1Yd0ITiK6dIuIcmEu1Zo9jPLn/
 3aIQ==
X-Gm-Message-State: AOAM530pWDF7kIkQ9234CXMATsYnCzUkO+/t81B5GDeqmLyzOMjQwdns
 CKlNFtdj2QBnWUqrJUPTFop4cylQwk8=
X-Google-Smtp-Source: ABdhPJzPmoJucLYyUxylTGRnIh3uwKDmcNDg6lNx8pMOulaqkh7h65xkIWeGKXF5tGekfBTcNT2UVQ==
X-Received: by 2002:a05:6870:6706:b0:c4:7dc0:d6f0 with SMTP id
 gb6-20020a056870670600b000c47dc0d6f0mr2023110oab.195.1645733958654; 
 Thu, 24 Feb 2022 12:19:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 bh42-20020a056808182a00b002d538a8d5afsm305775oib.7.2022.02.24.12.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:19:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Date: Thu, 24 Feb 2022 17:19:00 -0300
Message-Id: <20220224201900.1037465-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224201900.1037465-1-danielhb413@gmail.com>
References: <20220224201900.1037465-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
index 5e7d29ae00..89b7b3ac00 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2066,6 +2066,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
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
index ab008c9d4e..8c2c03fd48 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -18,6 +18,7 @@ DEF_HELPER_1(rfid, void, env)
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
2.35.1


