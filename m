Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C94B2D0C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:37:13 +0100 (CET)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIan9-0006lc-TT
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakN-0004Ge-Nc; Fri, 11 Feb 2022 13:34:19 -0500
Received: from [2607:f8b0:4864:20::235] (port=34537
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nIakL-00046n-FQ; Fri, 11 Feb 2022 13:34:19 -0500
Received: by mail-oi1-x235.google.com with SMTP id i5so10555439oih.1;
 Fri, 11 Feb 2022 10:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=i5O65RAHoqhfxd/xCNd0bYuQVebjiiyt9a1PHcuDiVImgLa74q5Bs695QPY65FEm7V
 S4UjmEeOA+WwNtmHjY0XHC3R8WNTe8kcsvN6KW4GLTzKyIstSmFS99G60tycBp5Mb50W
 MOs8SdCxhGLd2RD76PRdox9TJCArX7EXmdgUjQnxzU2Xowxt8dE9M8qBRwZKzY4sIf6o
 qfhhmbh+C70j+eMeej/i9o3vp8tNIyCFfitlUzyr5knnxvE5j4GpLeZ7Et5lsbFudjNy
 pXUY4lNm+EEJDAUqK/K9dwsKidMGey7D9tKyG+Ev6dhW72BjsEryIGbdOxXPBOcGVLNd
 yXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZPI2m+wUmzdQWIlgl7wmaSuMlcvFlJcfg619/oCuhk=;
 b=ZSwn2GYFQCzJqiTqhXd8mLw6PiET6Oz0ZqHHGm1l5IJ9IDSS/SVPQ7zGqczj/D1MgN
 EzbGzS3SLHnpa3aU/F1iGp9gctfCvUWV/2M/APQvLbU8NeFAWUx9RnCApnrSFcYctHb1
 HZ3Oa1NmGmyN0y//VmL0QKyvUxayemGfWlGk/QeLjtKwv3sKXPSUH4vw7uIWj7JqsPB1
 rDMQe9UdX1UXJtR5hIZ3MTKqGP9cr9vsF7QXUN59PX7AiynzikQX6XV3e/NyxEMckV3c
 IM2263R0wo5ZxZC83vvB4T0dXf8eO1QDEvZWe8NKFHVYLWcm0IiKb9CJBPB6j1XyTBZT
 ggQQ==
X-Gm-Message-State: AOAM533yZiHsBolhE8gt7PeWwJjRidJF2XyR5Q83UqJMgS/iPXmOykWu
 Y02kQc8hCEOxRS0pthE/+M7H4Pr9y2M=
X-Google-Smtp-Source: ABdhPJx5Bv6w8domOn3UDHQDsORweNleKjVhFbbK0xcN/WsqXXfPBXjohFFZBb8lTIgDdqmfhrr/lg==
X-Received: by 2002:a05:6808:148e:: with SMTP id
 e14mr819096oiw.188.1644604456045; 
 Fri, 11 Feb 2022 10:34:16 -0800 (PST)
Received: from rekt.COMFAST ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id t22sm10008145oiw.2.2022.02.11.10.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:34:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 2/4] target/ppc: finalize pre-EBB PMU logic
Date: Fri, 11 Feb 2022 15:33:52 -0300
Message-Id: <20220211183354.563602-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211183354.563602-1-danielhb413@gmail.com>
References: <20220211183354.563602-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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


