Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE052EF512
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:45:42 +0100 (CET)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtxN-0006sR-Iw
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtod-0004j6-9S
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoa-0002t7-TQ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g185so8774897wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2D1No+kzyFL1cUkFc4BKpRp9iyQy/AXg4LApV51ftSM=;
 b=ZQjov/ZMnhvv6STpkzAUQ6Dp6V8g0H2Fg1xYKILDKUU1NNMEr02Z3aWfb0rAHjbI6H
 gEd6g2QjNpNdzv5/019IfMLzJmSFrxhnm7PaljKhdrwCMbLCU6I9X+R3aEneCG5vhUsT
 h5BqCWg44WfR7d54jgavxduGt5hiMJunnB1sSjTHEl1cD0+h3AOVxWb9OzGH7WiPjJrm
 pYUAiFvtjgJeXCVuSZGaN35t/nrbY6jILwm56O3giwNDe/Ga/634HOSPmF6+eyFxJ/DQ
 GDR21I5V2pCl/u3E8aoXhZ7t8adO3HPy25zo5LfATU0L+mYXz32qpahO5jQyo5Drk9UQ
 2fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2D1No+kzyFL1cUkFc4BKpRp9iyQy/AXg4LApV51ftSM=;
 b=j5IOjPDyK5vk8HMNGwgvYjwuHsBQ71DCzRfcpNocMZTdNrcfbLnie5hfTboKJpEtkV
 VktmiyNpatXfZUCi6Z0NeA/ndUwKPX6VzbhAgaQDElZ1E2BCohuRMGXc1bLkpcj58pl1
 y/uyzGSZQ07NjCc50uA7t82X9tRPvOGfp7pWpEvEv21Umh4f5r4RkhKGVZ6I7UzoZU89
 Bn3xXKX8azVnHj4Q5Y0484hOrM7C3lhI+ebEXkoTbuOumV7L7DV3136PoI0DkIi0wJbr
 QoQkLlDV2MYX+0LIhi7oMzPGYwMKw/gGEWaqvpokgIxD4MdADufry3Lpk+fwbZN3Bz9c
 FEqw==
X-Gm-Message-State: AOAM533tbmL1nJ/KVPMKSDzARP9EYOSJboWEZCuKL2rA+6edj5Jpojwq
 /SxijTLLYflIt9jjFyeVLMJjoNnPtgs7Fw==
X-Google-Smtp-Source: ABdhPJzq92OQZBlABpJd8SbfJ6BGWwG/Pgvi+xSSd/af2rg6YzVDlLDn4SR+J5mg11f1FsUpLPNcsA==
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr3615500wmc.187.1610120195314; 
 Fri, 08 Jan 2021 07:36:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] target/arm: Implement Cortex-M55 model
Date: Fri,  8 Jan 2021 15:36:05 +0000
Message-Id: <20210108153621.3868-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201210201433.26262-5-peter.maydell@linaro.org
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


