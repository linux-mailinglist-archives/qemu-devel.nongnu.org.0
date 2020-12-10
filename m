Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A6F2D6890
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:22:21 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSSC-0003IZ-1C
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKq-0007ZL-5j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:44 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKo-00013D-Ir
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:43 -0500
Received: by mail-wr1-x443.google.com with SMTP id w5so3056245wrm.11
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=w+BS881wXyEJlIKegHwmhD1uj1IrL/mXlXoc+eOME4KbzWEpgZ4nrFPvKLYZDhwyhD
 WRyxv8wPH+1LFjx73bJPG/cOWVz9SqvGDkZXsvcJoFXGNsWbbUrkjjuKmyfwXmdoi0iZ
 juNRPU9pmOB6XxZR7AHaKyErAJX2tvi7RttdorGiTbt6a3+gqXrfVvGxybSEwil7FjiE
 l9Av3qEUqAFunOK68qazkWwsnoRweIYD8rPRYz6zsGdIUBO5eLSgFG2kY/MToQ64GFsn
 1SARu6R5mzgopuq6qWuCz3GyY85PMHUJw/pupYBakboQoyLKLLOwBb9aeeyPKcs/twcM
 EwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUi6vcMH4o0CYad/653lpbXGwZgjtkuhUa4zld0PALo=;
 b=jAAgEopPkGzY8Gc9lJcG1Yyi3ShHeDdgrT7Gj8VWavSXrDrFBQRyjf15NI15EHZZa6
 7FLDKUiXmUR5yd03RAOEOPcAOYOXuV/8ZUwhX4lQxr9GsEwmZpq2FCiyIZWkBJNLbXH9
 DwC+czxAfcldnR0owxYNYYcuVq7BgqXyl12cUz7f7ZfBo1UQPC1DeXF2iCgpZFI7nflz
 KRPoPLyy9K/arfoLhh1boioZ90013Jqe/C3EVQGGVAT/0PlVlc8ztgPjTHAKVtt6SbV7
 tkJb4f0pXHua7/2yXaEkQ7jeaQkJgPEajQeTnyhR7MCP2cmqwZcsBD82/IXE80FTVOPD
 9IkQ==
X-Gm-Message-State: AOAM531UdfZjcDiecdawTH9ZCAZehhSu8uiG8ROJ4PqA6J6UkGshmo0J
 6XzJZVEXrOjNtLcQTgXkDY4gXAuInYulxw==
X-Google-Smtp-Source: ABdhPJwNDE6XgkdBLyjbgT+woL3dcoshKqW6e0n5hm+4CYI/GMNYOAYrwZxbTqx1NGl/fPhpujGJ/Q==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr6260008wrv.384.1607631280697; 
 Thu, 10 Dec 2020 12:14:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y130sm11879591wmc.22.2020.12.10.12.14.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:14:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] target/arm: Implement Cortex-M55 model
Date: Thu, 10 Dec 2020 20:14:33 +0000
Message-Id: <20201210201433.26262-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210201433.26262-1-peter.maydell@linaro.org>
References: <20201210201433.26262-1-peter.maydell@linaro.org>
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


