Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB54B8558
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:16:50 +0100 (CET)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHMf-0004fQ-Le
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:16:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHV-0004rD-8L; Wed, 16 Feb 2022 05:11:29 -0500
Received: from [2607:f8b0:4864:20::236] (port=43745
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHT-0002B6-BE; Wed, 16 Feb 2022 05:11:28 -0500
Received: by mail-oi1-x236.google.com with SMTP id s5so490221oic.10;
 Wed, 16 Feb 2022 02:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cBEGFkYOy9hRxli33ftixkD7di/63zI7udVHNDzaBk=;
 b=i0EdYCdg7t9jpBAZCzGypD13/35BmaJ2niOJNxo682FhuUzMQ+52T3iiAlIuzKfI9R
 7Ibs1KI5duDkMmcdXxtuC3GH/tQMXUvmeGPRTglfiojiInq6vF42rnWlMIrhMWgmZSIb
 wpOmUY7TwbNH9CHXHELe1kfFeTGQjr+p86giwMVtfy0mQRJxbSqERzE3Avg8fE5PmA/c
 +vPrhdGT0Q7wuDlo1xNAn36w8EUa6fVTxOkQ+UpY5AKDdr9WEiNRIHo+otBMg1OrHD1z
 HQAspSRfxc40g/LmNAPerPv2k2j9hwhALbxfpK0Nv+b3/ZarYM9bnioEnR4R+60FlQAi
 PRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cBEGFkYOy9hRxli33ftixkD7di/63zI7udVHNDzaBk=;
 b=VHoDHypbrCv5wXwKdgDHOkOc+0+NS3IhH9jOJsC4GE7H7hAV0isiAA2r9mmcUUqnJ6
 s/mspCcD9uJkrsZZnP4hwsRAAypYPoHTQJkWBoYlUP0TGp6akftBE64K8NldjJemheON
 sH+Uord8+u7/WvAr1OyanFaD9+nPmj7K/qaOohPmouDJDXLi486ENulhUk7lGAMooiYK
 8Y8CZ3kYrWYKgWFxITblS5Qd05yVrShJNn1uT7g4HKAnENsPZ5v/7aG1aneOb5v/TB2C
 SLXrZ/y9IWCKmMgYmrCE+ygfuEuwR3DzumYmR17xlh2s4Ng8AVOWX1BjvSj7+9pCnsBo
 KYYA==
X-Gm-Message-State: AOAM533XSNvOdzmMwCmBy0gqlvuMNGYtlIdZQ7s53JzWskKeIwfdyzQZ
 oEGvoYuG4zRLt2buMyW6ojV7N8dX9Zk=
X-Google-Smtp-Source: ABdhPJwYI8UrIH6TV3jKjrz52ECVMZ/SEOaGKU7nWp2tzsKbX5s34zbSqBHk8WoPZzAYt8hd+W8bGw==
X-Received: by 2002:a05:6808:1929:b0:2d4:374e:3980 with SMTP id
 bf41-20020a056808192900b002d4374e3980mr303544oib.294.1645006285767; 
 Wed, 16 Feb 2022 02:11:25 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:25 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 5/5] target/ppc: trigger PERFM EBBs from power8-pmu.c
Date: Wed, 16 Feb 2022 07:11:02 -0300
Message-Id: <20220216101102.179158-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216101102.179158-1-danielhb413@gmail.com>
References: <20220216101102.179158-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
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
index 04c61cff39..32a28ecce2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2009,6 +2009,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
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
2.34.1


