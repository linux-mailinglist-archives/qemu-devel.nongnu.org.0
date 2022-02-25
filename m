Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E6B4C422E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:20:59 +0100 (CET)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXic-0007bW-OU
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:20:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXa3-0006rx-Et; Fri, 25 Feb 2022 05:12:07 -0500
Received: from [2607:f8b0:4864:20::235] (port=37649
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXa0-0004Ue-5F; Fri, 25 Feb 2022 05:12:07 -0500
Received: by mail-oi1-x235.google.com with SMTP id z7so6830505oid.4;
 Fri, 25 Feb 2022 02:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtyGFo9s0nPH7PoJt5LpHgS9546V1z5bjymQL+4v4Oc=;
 b=MUegNW67FUAfdzuAFOL7IujkbJMowRJPPnWwSUa0WcIX9sWnFKygG4BhqY7Ki+2MNr
 OdkfoNK9KYwchtUEfKXqS9O3z8FG3sU+R5tKRvGPwUV/qkGfYesLxth9Xv4lzkcnPVj7
 x7/3/cxuryuF/jobBeKovehakpIfCP0WP7fFXJo2Up/HVOBWnPcJ0KpoAb9H1JqDfbJx
 NScHRHtKXi+xdo4Xqe0D6YuzBnq0ank8FFLaV34ztFiZPjSAlWyuy/1rdJ3ySH/mhjy+
 AXzUrMQsbI+s3RDC2Tc2IYwqyNG8THuuTxEz4WDW1sivod7eXffMuoGcPZqWxAsW9jzu
 Zj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtyGFo9s0nPH7PoJt5LpHgS9546V1z5bjymQL+4v4Oc=;
 b=AMdwWhvKOuPblo3Fk/5OTkNdQHKRhghV2zthwYP1TEyo0hBKGzYB3h6GIek7lJsqPr
 3MNSp53iBb9dFjM4pNOKCMBNs6XUhIR/pGtQXn89bhbQZbgqhateJW5XcqpEApV7IIga
 XI9icKlopMaXV1LSqCybifCtapmAf6q05hKc4ZI+T5OUgWm4qHfPeoFgtUNvF1Ur/wEI
 lHRtEjV3r16Fgzl/l3b+Bu9OxNBOdFGSnrcx/OW0Zu/ZlKbTjafa7NujfbU+TAdOIDZg
 lwUSO1mBxEuWaCYKmS+X5vbZQsayFU77NqhwXCO2r1vaUdSl6Qb4WhwYKFQLch31GDb+
 T+3g==
X-Gm-Message-State: AOAM530UZjI/OswOgB2GrSzPKsX6B2mtX+l+FL64louIRcSEaFy8kG6s
 IoUrxZIYaEeP8KLNADjABovn0QZ42wk=
X-Google-Smtp-Source: ABdhPJwGY6HlnJ1k4pJSgXTtO8qwtNZ+RA9fnC/O4L77/u7PyL1/oirO/WgORiDxRrBPWUdj+fz9hg==
X-Received: by 2002:a05:6808:180f:b0:2d6:5ab9:a60b with SMTP id
 bh15-20020a056808180f00b002d65ab9a60bmr1121870oib.147.1645783922397; 
 Fri, 25 Feb 2022 02:12:02 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4ae6c8000000b0031c2e6dd492sm847823oot.28.2022.02.25.02.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:12:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Date: Fri, 25 Feb 2022 07:11:40 -0300
Message-Id: <20220225101140.1054160-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225101140.1054160-1-danielhb413@gmail.com>
References: <20220225101140.1054160-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

fire_PMC_interrupt() will execute the raise_ebb_perfm_exception() helper
which will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits
are set, do_ebb() will attempt to trigger a PERFM EBB event.

If the EBB facility is enabled in both FSCR and HFSCR we consider that
the EBB is valid and set BESCR_PMEO. After that, if we're running in
problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
queue a PPC_INTERRUPT_EBB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  5 +++++
 target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/power8-pmu.c  |  3 +--
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 79375e8df4..1b687521c7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2502,6 +2502,11 @@ void QEMU_NORETURN raise_exception_err(CPUPPCState *env, uint32_t exception,
 void QEMU_NORETURN raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
                                           uint32_t error_code, uintptr_t raddr);
 
+/* PERFM EBB helper*/
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void raise_ebb_perfm_exception(CPUPPCState *env);
+#endif
+
 #if !defined(CONFIG_USER_ONLY)
 static inline int booke206_tlbm_id(CPUPPCState *env, ppcmas_tlb_t *tlbm)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5e7d29ae00..d3e2cfcd71 100644
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
+void raise_ebb_perfm_exception(CPUPPCState *env)
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
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index d245663158..beeab5c494 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -307,8 +307,7 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
         env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
 
-    /* PMC interrupt not implemented yet */
-    return;
+    raise_ebb_perfm_exception(env);
 }
 
 /* This helper assumes that the PMC is running. */
-- 
2.35.1


