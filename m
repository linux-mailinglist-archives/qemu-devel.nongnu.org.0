Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173F4FCAB8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:53:29 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4md-0006NA-PR
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Ti-0001zb-Qy
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tf-0001uC-Sb
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id md4so8487690pjb.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7VvkB9bLVbaUbeLnPbB0Uk8wr20FyjkQ0TwGkR7VjI=;
 b=UgFYTgsv9kPehH+ybmMxo3hYV1Pc3vPdmGFw4wIfGf4CObZecSASfRNjgap1nXtCaY
 RibDbOnVyf5yhgHvq3RO8qTyrV5CeCwaNORd+PZbjQjFnVYVPAKJebMMxXnuMQvsktGn
 wYLIP7Xo6/SakfGGGWUM+1+XoXmT1Fa2nT6oQAUC7QOfkfZwhoM8LrUBG/HzBTf8Jlq7
 jyJSawAdxw2MDzF9XpmZv3wvKkpnJPbBtzCFaNKJ2fvvlPr+9OL4nra1yoDGgdOluhMx
 pYTpxQsrTz3oVGyFZAGl59sbMPQWYGnU7KWzN25qxFLsfVT+9W+uXYkfVUKDtXlnPEHE
 Rj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7VvkB9bLVbaUbeLnPbB0Uk8wr20FyjkQ0TwGkR7VjI=;
 b=lL9+X30YBR75HJ8mDzshPCGY0x/HnhyphaVClHwjuXlyAY6wVuaRosvQr9/0rY+UQ4
 xSnb2Tcc54mszCWqhv2bv3sX8/2qE315he0EiszdA4ThrPJtLHtU1ZeWaUHDD6v7JaVI
 mGmH+tpR04Jram6IyxEBSMUT0Jss43CTfzQet/It0/Vdc8vcTZCBHGk6+9pyDImYsE9O
 M6jB4c6HkMc71k5zhmPNEmn7DD+a1XUw1TYrdLgfML1PNDlymnNI7VWWnx9yud/3j2iW
 97yqK0np2lblP07gYMsbKdTvwjJZvyYALCYVpcE+kog8w66/02fbuvuw1vMNIyt5Lufh
 xaKA==
X-Gm-Message-State: AOAM531BZzXXVcisfXimNmtPny8BG5aNZBpS9HFpGV5ReSC+ic2Mx03a
 KfpxtQfEnT4aIIruebMTuMv5zYsWqP6KSA==
X-Google-Smtp-Source: ABdhPJxsfaSPL7JJlLZrhIJOqxxt0m9IJmi+KDw2/VkHvYw7uPppuNm0fuFR2WVdz/L3ALtEeJtQHQ==
X-Received: by 2002:a17:902:e809:b0:158:553c:3592 with SMTP id
 u9-20020a170902e80900b00158553c3592mr9638100plg.151.1649723628534; 
 Mon, 11 Apr 2022 17:33:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] target/arm: Define cortex-a76
Date: Mon, 11 Apr 2022 17:33:25 -0700
Message-Id: <20220412003326.588530-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the a76 for virt and sbsa board use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/sbsa-ref.c        |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 66 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1544632b67..e9ff81aa21 100644
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
index d2e5ecd234..ce15c36a7f 100644
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
index 8934ced19a..7dbd649b0c 100644
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
@@ -879,6 +944,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-- 
2.25.1


