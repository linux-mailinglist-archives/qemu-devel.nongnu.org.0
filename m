Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C150A51DF11
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:24:21 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2cm-0002vi-Lg
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IY-0006BD-3I
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:26 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IV-0003st-St
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:25 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso7989713fac.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=PiWSewlYoqI+CnMLmCNqnktQIJ672IbZ4DVg68qjOyUmVnsJUmrVTnqfauoLWuK04u
 O9vbKBeSLuSAPFNh4zApThjJPUp+uqKN4HVpv/udPwFb5cKSc6KV0Pn+8Dpb+aa6Yo9N
 AZBMjt3HVFGbziniEh0tMvm6LMgrz4B7Ks33WcuzMmysNU05C8eiUd1yXzyzFWR/26/a
 Z7dG1aVdF5uIi+yoOJUuN9UsKfGjpiLfuH3kokbzgIDGlEG+CLRnsRojF1dXFuVN37Mh
 Bj2SxD+K3rsd84vIgH8NgNg6nPzN7BnlbhAI5fbzbmSqxva1hu/BdvBeOgXrvAAB37EQ
 5rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEHioUTW07RbxrApJKm//wt4N/0RvoNJcCdNTfvqqX8=;
 b=s3xg0HH2+kCgXg544C0WCu8EHwEf6qQROToEkAcN//H5Zr81NKAqj7tvbBgj77w/mF
 E+9GB/YnAWJ1oqTxrTQiPGa0cCyMhnZ/zCAo5NeoDNM1cWRDV/KMWqeu/nxyrQBLt9Mf
 fWtYwoTq3Ko7lZ2tkHbY6L+JEUuPlOtQgXwLNEBBc79VUwCfFR3n6IzEJ/7DkOFbdr4T
 BArAx8ZndTPUs9DzkBviV83WhH1G50iOrz44Bup32uMOcow/m8l512P5pxW0OwC9MV9w
 1iSKNAr1hY9QO1AHATnvxfJ7jNS+H571Ad4xER0xnKnndDGutQJI6BF+JyfofrBG63QR
 NVlQ==
X-Gm-Message-State: AOAM530GpBIZQOxDFTR2Org9vFRjXszDPO4JjtHd1jpbRn8foaDuaWWA
 5dY+OyzXcwxTYITm0i+mEUCEKu/PQ6Kt5PdQ
X-Google-Smtp-Source: ABdhPJxGa3NepBHSejcHurEe53Zwvmkmgu0yVvVnktyT4JGYnffMYuUMBtqLJ5PjvNaYp7XvzJu+bA==
X-Received: by 2002:a05:6870:45a4:b0:dd:b08e:fa49 with SMTP id
 y36-20020a05687045a400b000ddb08efa49mr1970286oao.270.1651860203202; 
 Fri, 06 May 2022 11:03:23 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 23/24] target/arm: Define cortex-a76
Date: Fri,  6 May 2022 13:02:41 -0500
Message-Id: <20220506180242.216785-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the a76 for virt and sbsa board use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 5fe045cbf0..3e264d85af 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``cortex-a76`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2387401963..2ddde88f5e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -145,6 +145,7 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("max"),
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f94278935f..12bc2318ec 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -202,6 +202,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f55121060d..adfe6b26be 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -194,6 +194,71 @@ static void aarch64_a72_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a76_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a76";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x8444C004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x414fd0b1;          /* r4p1 */
+    cpu->revidr = 0;
+
+    /* From B2.18 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+
+    /* From B2.93 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+}
+
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -881,6 +946,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-- 
2.34.1


