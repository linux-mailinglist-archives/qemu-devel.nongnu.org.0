Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3279B2B9D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:14:12 +0100 (CET)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsBv-0005rh-6M
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvN-0001G6-SS
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:06 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvB-0004HP-Sx
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:05 -0500
Received: by mail-wr1-x443.google.com with SMTP id u12so8061014wrt.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=PgQliZ57diIrQv1+baj8vSQMq1u1jLzyk6HTxbSrZ3Ch0G5i0r2wy1aLn9bUXeSSBv
 EUOHeyNTHUU26GDUIXFaA9cmPmFjuOLPVY2xhv7ynqMV7+1cB1lR7BEwNvWthWmNLs22
 dPruNGawe4FrL1tcWPgn48t6KjSsncEPbCupV0bcQWTgr5j1erLwCsGJzIH4E8MAnKKD
 m5vJgJCirRksrDtsrR3AYvgnzoThzdb7o/vkR2BXL5+uVSweHAEVJmYfFg5DWQWHBdYA
 PBafRt7YUhzeuygRWEMukJt5LgqiTPAuaUwIkuOmdf6SgzPeaXw3GpS20QpgZho6CWG4
 Q46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=lEiHrTSgXOagptznXUQH9OpU9v0Hu/SzKqCywRovE4N/s3uAUcoancCqWqlHpa2z5J
 XM9sQkQ42kLgJ9PPLRca4XXeaIXqjNWavn9MKa5pJJL8wPTbbOBzvIGrjWdNM6nzPm1X
 LDDln9UxkLsG7hw1CPYG0Fc+bWWke8XZcXXOxWNv4siuC5PVz/rhnCRf63zH8WoON+th
 XsUzWD0Fsn94wgjpRHkz+MpFUcecHNuXp1fI1qxCxbk24tlUkZgopPENsV4lOFwcmVpK
 7h58pKeSJBaiwXxMN0x7EyIuu+/6Ky9CmCtCqy7Qhhz7S7DFyMkYR3fE+tUcV6WOLIBB
 7dLQ==
X-Gm-Message-State: AOAM531cWr924sZ28BM+sec7YVUe8XDJtI/QRY33r2DsabZRowArlKxu
 tHPYWzirAc1VXZ/H4t2rXnRzVGTc/lECrw==
X-Google-Smtp-Source: ABdhPJxlp7pM+b5MfsBIs4tC6VXGCBkh32ZYa1IkAXDwl1lkzhgRN8+IjvhAT+2nsJV+5AlxfxV6MA==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr12696594wri.314.1605823011812; 
 Thu, 19 Nov 2020 13:56:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] target/arm: Implement Cortex-M55 model
Date: Thu, 19 Nov 2020 21:56:17 +0000
Message-Id: <20201119215617.29887-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented all the features needed by the v8.1M
architecture, we can add the model of the Cortex-M55.  This is the
configuration without MVE support; we'll add MVE later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0013e25412f..98544db2df3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -401,6 +401,46 @@ static void cortex_m33_initfn(Object *obj)
     cpu->ctr = 0x8000c000;
 }
 
+static void cortex_m55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr = 0x410fd221; /* r0p1 */
+    cpu->revidr = 0;
+    cpu->pmsav7_dregion = 16;
+    cpu->sau_sregion = 8;
+    /*
+     * These are the MVFR* values for the FPU, no MVE configuration;
+     * we will update them later when we implement MVE
+     */
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr2 = 0x00000040;
+    cpu->isar.id_pfr0 = 0x20000030;
+    cpu->isar.id_pfr1 = 0x00000230;
+    cpu->isar.id_dfr0 = 0x10200000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00111040;
+    cpu->isar.id_mmfr1 = 0x00000000;
+    cpu->isar.id_mmfr2 = 0x01000000;
+    cpu->isar.id_mmfr3 = 0x00000011;
+    cpu->isar.id_isar0 = 0x01103110;
+    cpu->isar.id_isar1 = 0x02212000;
+    cpu->isar.id_isar2 = 0x20232232;
+    cpu->isar.id_isar3 = 0x01111131;
+    cpu->isar.id_isar4 = 0x01310132;
+    cpu->isar.id_isar5 = 0x00000000;
+    cpu->isar.id_isar6 = 0x00000000;
+    cpu->clidr = 0x00000000; /* caches not implemented */
+    cpu->ctr = 0x8303c003;
+}
+
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
     /* Dummy the TCM region regs for the moment */
     { .name = "ATCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 0,
@@ -655,6 +695,8 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
+                             .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
     { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
     { .name = "ti925t",      .initfn = ti925t_initfn },
-- 
2.20.1


