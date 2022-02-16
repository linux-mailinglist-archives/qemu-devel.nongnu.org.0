Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CB4B854B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:14:26 +0100 (CET)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHKJ-0007jW-1z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:14:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHP-0004T2-U5; Wed, 16 Feb 2022 05:11:23 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=44640
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHO-000293-4z; Wed, 16 Feb 2022 05:11:23 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so1858483ooa.11; 
 Wed, 16 Feb 2022 02:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=nYhQVVXHluWdji2KZRKbdw8glH+UN7i3hmsOOE8FIatZJGeGewFuWs7nUM3T/Ph0u1
 HLdHJZAKi7SGrqARE/UT5XWnTFk1oIhwSUoIu8IyuNk6aUzdOsHnWCz0SV/4+oMiI61s
 iNsiGz/ZmW2TPAS/+jO3FhIXH1MP2ElXxIK/3sRzcYb1OlNHAygrzMhCfUnVd1Zz7wB6
 LqfsDcSQbxkss9KnyLQRvgShGEZZ/Zg5sQRz9OgTxJZLc13xsOWbZirUiKT2UHG6OeOq
 AJOezVdN4Zb5cFVe7GPLzsODizvWY8vK7El5zEN9oAKPunpniOps8mh3Nep4jVp5xVlm
 fHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=C6yuiLzl+vKOdBvL5AoTJ1k6ZqXlMUmDK3Se1OaT46X3EnpCn++IZNfxegXtOW6Kkz
 f2jmCKbgaBFze16Eo5t58RB4DhjqJ8ZEjdKh/cXQqfJG2gke8S5o67NlDIeZ/6gWCgKZ
 yC1x1hGdvZPCnuv/+Qf44NMlJ8ij/km1qjy+i/BRcJo2rKSaK0xZUI8RuQetnQv0FGHh
 2ET5Ggi8ro34HiYJb82YsWfUE1FLEzVMbA6L+K+eAOztz3YgGnhSnTujQHX7Z0Y9GQAJ
 fHTZSYTVUix1L6qatPZD3fN/7+9e/OLA0lrs7cGrLi8JIr8g+9aMpXVVV5OnCyS2/jFU
 pzOw==
X-Gm-Message-State: AOAM532zZrF9r0eHY0FsFLHv12OqLPHRpn86m3p15poD8J2DfCONWKkK
 V4QuWqN31glDsrnjUQxUG2Pexuj1nyU=
X-Google-Smtp-Source: ABdhPJy9f9W/VA5Pgx9+UALEVGCza9BtVwmHeGzxHaWe6HGMOnptpG2FgBXTJ9JG0bzI8Bqs74HFqw==
X-Received: by 2002:a05:6870:a987:b0:d3:3505:4b8e with SMTP id
 ep7-20020a056870a98700b000d335054b8emr230958oab.88.1645006280727; 
 Wed, 16 Feb 2022 02:11:20 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:20 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 3/5] target/ppc: finalize pre-EBB PMU logic
Date: Wed, 16 Feb 2022 07:11:00 -0300
Message-Id: <20220216101102.179158-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216101102.179158-1-danielhb413@gmail.com>
References: <20220216101102.179158-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2f.google.com
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


