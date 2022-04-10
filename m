Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBB4FAC3C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:12:41 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQoS-00070z-4S
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZr-00024m-Ey
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZp-00030B-JY
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id u14so12329333pjj.0
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QswmRLp0zJBHFk1pYr5Ngu+gpbMPNOeIbq7m9P+NBQ=;
 b=YN2ysF2alCMJdpnTrB3pmkMnmwFMWx7piiG1PWTMCTdibQ3w+uBe955KFAaxt7BbtC
 AZbe6XM/vxkYAs/3FETnB6GWwuuGqwCgnBaxoraa13r/Tr1ZjR8a6GPT1Nq/tR/VGzrx
 r2MM/eJY0qIAtpYFvYT2DBS8O6gsDyzH5mL065tYRi+QJECoBbGP4liE97HBM8Wk68hd
 O0SBXN8G5b0gxAV9NU8opV0BSz3pTbMX39VokdA+6TsPK3j4CUlZaa6l70wOg+WE7jhD
 nUMlye8UIVGxMfHviZolnc0fqmVrCdnNaSN+T6X1jEar9QylgqU6GW4JK6UgfMf3cdvy
 ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QswmRLp0zJBHFk1pYr5Ngu+gpbMPNOeIbq7m9P+NBQ=;
 b=lOMMrycfVh/ZcBx6JCG5UNmGVNIQUdN2Ry/qqzbVWQVYRGyotFHErD4bJZiiCSW9Ty
 BkocHW0zHB0vvMM4jgrAMUBc7udqO07B/k2S0qjuz4PPwcp/wA/I3YbWecfJJiHvYdwv
 3wH5glURNYioPHH5ucbvhFtgwyOFHdi5QFg/5avIAGcp/YTQeazXRbjfVda8jkw2auf9
 MUcaSSPnoFyjs1hJmVR/fTGTqFMbqhkBIMWoiQcaJ968FVStry/clebS++kVuGxmEUWn
 ukGUN4QWnalFrHiZTFWjegK5D/LBG5rjTddNwEkL4S70FZ7PSPjE47Hasg5bjfouikoW
 R2EQ==
X-Gm-Message-State: AOAM5309Y89e8v7sPK8NFUT+h67o3prcW+IAX5AYEx06WrvmTWUSInay
 Xu1atnLbzbC2XgiQRJ8WtE2R59/NQ7Oruw==
X-Google-Smtp-Source: ABdhPJyoJ0PUdiL5Jqyn1PJGhfMGjZ+sz0GjpvZgj7dxl5b/QVXAwU1s7MuGzwYpQuP5v2ZZ7cw8AA==
X-Received: by 2002:a17:902:8a8d:b0:157:ab0:a07 with SMTP id
 p13-20020a1709028a8d00b001570ab00a07mr15315062plo.77.1649570252232; 
 Sat, 09 Apr 2022 22:57:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/arm: Define cortex-a76
Date: Sat,  9 Apr 2022 22:57:24 -0700
Message-Id: <20220410055725.380246-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 hw/arm/sbsa-ref.c  |  1 +
 hw/arm/virt.c      |  1 +
 target/arm/cpu64.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

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
index 199ca437a0..a00c02be2c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -251,6 +251,69 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
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
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
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
+    cpu->isar.id_pfr1  = 0x10010000;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x413fd0b1;
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
@@ -935,6 +998,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
+    { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-- 
2.25.1


