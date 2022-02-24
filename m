Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F64C36CC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:21:45 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKcS-00025A-7b
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa6-0008Bk-N1; Thu, 24 Feb 2022 15:19:18 -0500
Received: from [2607:f8b0:4864:20::231] (port=42578
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa4-00030J-7K; Thu, 24 Feb 2022 15:19:18 -0500
Received: by mail-oi1-x231.google.com with SMTP id a6so4716948oid.9;
 Thu, 24 Feb 2022 12:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=327DkvtyPlmOk/BbGsj7+zy8MYMhQ3E4ZM6Cf9A98ao=;
 b=PRUt5kl4p7L3GrTfHZk0J3QzaivgKCZc0swqpk3Iape9ugYIpTPawwxN9HUZokVJCo
 c4l32p81Cw7oYuVpNv5RzTaoMWVZ8pyQ0mmmotiuZm/2yvC55HyNG3r1B7Iv6PhQFKlL
 nKGN0DKrDuq3cZwAiQCxsXmVQ8eYMizokmTZHGdmYD+3WDqvOv4VM1bGeTbrgSt2uk7I
 PdJegGu7wkqmiExmRGSf0z0llDbKA8nViUdIoL8G6eKYLA/PfKRSVUbcNMAp5p03e60c
 Q18xkoDrY5RazIyeMlJg+Gk38mzdZmlTVA9vqPC+fSPfAYytKuuoE4mBD4gowWjw9jB7
 B3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=327DkvtyPlmOk/BbGsj7+zy8MYMhQ3E4ZM6Cf9A98ao=;
 b=S8IL0DVVVen3mxYGbKtEx7voFPQ6lTqT7LktJGfItS2Gh+Sva5RKnqM7al2arRRI01
 EAmGQqUC4SlFab/5VFDZPnufvpgKoeY1U8svIm3cWgFgDna4qgUHBwgCDifrQXKmNUTW
 vWEflOERbiqCZG8I0GPTUz07a6e7AmGLPBiBhZtaum1JwDuSxcqs18knE/eD7ttcfthH
 c+PABHiJELYsgLO2k4XhHSMtU04wkDXQQ6ynFpmB9FDynwrTDPrpLsNuM7FzaFzZFkw5
 AnNaOldomvdH/lpEuGd73hVEZmpJ1OIRQ4Pj+hZ0mqg6fQHDPfC4Nbu2kfb2w+i3TUHN
 tHDw==
X-Gm-Message-State: AOAM5323XFoau+05CASxG3vyv1362ioNzzfOJjXpitsAmEEPtvyvdsLs
 PVD4guiJXpjHIixiIyHf+JzZitdVqGo=
X-Google-Smtp-Source: ABdhPJxmHEmQ/4JPVLyhYF/1y7F/0DXA4t4tC02LZorEJS3O5bZAx+8ZML5MKlWwQqhB4GT+ZRTtQQ==
X-Received: by 2002:a05:6808:1286:b0:2ce:6a75:b870 with SMTP id
 a6-20020a056808128600b002ce6a75b870mr2266108oiw.311.1645733954634; 
 Thu, 24 Feb 2022 12:19:14 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 bh42-20020a056808182a00b002d538a8d5afsm305775oib.7.2022.02.24.12.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:19:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 2/4] target/ppc: finalize pre-EBB PMU logic
Date: Thu, 24 Feb 2022 17:18:58 -0300
Message-Id: <20220224201900.1037465-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224201900.1037465-1-danielhb413@gmail.com>
References: <20220224201900.1037465-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
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
2.35.1


