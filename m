Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563A4AE2AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:52:58 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXTt-0005xf-Gh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:52:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWU4-0007Wb-NM; Tue, 08 Feb 2022 14:49:04 -0500
Received: from [2607:f8b0:4864:20::22f] (port=46979
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHWU1-0002tO-Cv; Tue, 08 Feb 2022 14:49:04 -0500
Received: by mail-oi1-x22f.google.com with SMTP id y23so137877oia.13;
 Tue, 08 Feb 2022 11:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=TzuvGzaxIdT6sINz2F2fmMtIWhUO7Ipev+xtZwCtuOBZXSafywQO1weYvhOmA4b6ei
 zIDThzPkEZudWPaGadpwobDMzWt5N/GxRriPkKNqQq426xdD7Rqn5qYhgyLl0cTLfAmn
 ycCJuvYMAHv+UjJ+16lx2rutgGsrDF486OYB2XSSW/hdrP0OSX7cRoRcbuIORZjDMfN8
 TfPw2JUVSThgGSvUR6M17nL2p1wkFd7T/d7iqtfhPBMKzUt4t/G142tQtOzRtwWBM+bC
 BHmiRfDIOGX/OR7t4l3J82LgGATWg6Vvj43vlxPKcB2VVeZxBA3IMgWY0kM2aNYFRbOS
 dsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=pMymN0zJrzFtztn9UmxR/eZTOR2/aQQS9tF95qQRYUAi5IplWF6iIghUSMNe+qX9M0
 v9S3c3KXkg99XzF9vsvCiZ/713+wKWPoxbHZveNgE7jgA4UNfMWPAv8OIkl/jySS9t0o
 SbfLqLYy8G1876wmkZrFs+bb9ePAD5gzq2vm41te5F1tC+/8lY9Cl5xSw/aFUYSiowxL
 hh/zya1+0+bSvWN86ba2uLeblNkVhLel6BdKaACUo0Mt0PCo42NK55MU1qoDpIi1TXys
 +pqUQTNjFwiFI2zJ1l8E6tLZZQlVu6XHl7WFq4+ghFX1SSHnUx3Baq5h34nkD7GaobGk
 4S5w==
X-Gm-Message-State: AOAM533IvUi7LeRBbLd9K3h1bNVzuDm48yjDEjtOubm7VdHxcDdHjLEi
 7rBr9XaeR/x+OouNOFdDbzh6TsZo3iA=
X-Google-Smtp-Source: ABdhPJy1ttbKO44unOoHdnDcC9cQFaFuZxyS/fPYxEZvIMBVsD1TxlqkguwM37OYo5klsuz8vrK0Ng==
X-Received: by 2002:a05:6808:23c6:: with SMTP id
 bq6mr1279576oib.99.1644349739718; 
 Tue, 08 Feb 2022 11:48:59 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id s14sm6012592oiw.42.2022.02.08.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:48:59 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 2/3] target/ppc: finalize pre-EBB PMU logic
Date: Tue,  8 Feb 2022 16:48:37 -0300
Message-Id: <20220208194838.169257-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208194838.169257-1-danielhb413@gmail.com>
References: <20220208194838.169257-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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

There are still PMU exclusive bits to handle in fire_PMC_interrupt()
before implementing the EBB support. Let's finalize it now to avoid
dealing with PMU and EBB logic at the same time in the next patches.

fire_PMC_interrupt() will fire an Performance Monitor alert depending on
MMCR0_PMAE. If we are required to freeze the timers (MMCR0_FCECE) we'll
also need to update summaries and delete the existing overflow timers.
In all cases we're going to update the cycle counters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 236e8e66e9..d245663158 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -222,6 +222,20 @@ static void pmu_update_overflow_timers(CPUPPCState *env)
     }
 }
 
+static void pmu_delete_timers(CPUPPCState *env)
+{
+    QEMUTimer *pmc_overflow_timer;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
+        pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
+
+        if (pmc_overflow_timer) {
+            timer_del(pmc_overflow_timer);
+        }
+    }
+}
+
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
 {
     bool hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
@@ -271,8 +285,26 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
 
-    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_EBE)) {
-        return;
+    pmu_update_cycles(env);
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
+
+        /* Changing MMCR0_FC requires a new HFLAGS_INSN_CNT calc */
+        pmu_update_summaries(env);
+
+        /*
+         * Delete all pending timers if we need to freeze
+         * the PMC. We'll restart them when the PMC starts
+         * running again.
+         */
+        pmu_delete_timers(env);
+    }
+
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
+        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
+        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
     }
 
     /* PMC interrupt not implemented yet */
-- 
2.34.1


