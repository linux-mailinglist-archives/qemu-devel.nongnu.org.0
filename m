Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B284FAC41
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:18:59 +0200 (CEST)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQuY-0004lr-1P
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZs-00028C-Iu
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:36 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZq-00030f-MU
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:36 -0400
Received: by mail-pf1-x430.google.com with SMTP id a42so5373795pfx.7
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQCqNqBk6D7obGxLExlOvEx+VOWdRCxumNtqIfV9qcg=;
 b=oK/EtcpHJr71WWjaM7tHpXckt9XUYsPoPk5PKZFGvK0zHxXEUi10q3lntrjY9NfSvr
 yp6u0uGmm51eeFmvc8/xYHD/pR0tgEHuITXkQdWV5rt0KOq/87Ia79HuNG+GHCBNns28
 rXkV6Wzy0YRaeYUKaPa7hSA6uGpMi6aaNOzfYLcMZ5fumcLdt5zVOc6mkLNsD3LTd4Q0
 SCj7POW1ltVlcmQntzNj8bJRWiA6AM6iNKh8QFIW2C/Cl5VE6Femb4DpFs/9QS+BW/Yk
 2dPUCXX2KH7rF1JAvRWQmBrC9WfTvH29IZmVhvrwqdxIH74cdy3NyvpITqX+IjfRyvoC
 sKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQCqNqBk6D7obGxLExlOvEx+VOWdRCxumNtqIfV9qcg=;
 b=1+H9ySpZbqzVBh9VimX+ipg3BUJ2KHdRVE3Im0Vk5XIHWEq2AbqP6W4BY1npvDaYgT
 rT2L/kELJ08ogeG/Tx/4FS4IDGhQ1/1oJ9sO2H70Luqvg/eJriBSX1KI1Yv5gk3JM5n8
 HAHoTIx6ki5TBDLweyCReLPOqpjIzOLK0vieGgnzUyQATIBmzAiMdqlrvHI41XwQzkVQ
 HEehRDFW9YFe5nJUq+dLsUvvu3aE8FIosguXwRqLme8hAFYxEqVJP5WO813EuQLkeclN
 Tv+QeQzZAmljvDG4wR43d+ru099tBRgXXKigBypxmFkhksQj9/XfBFpu1SV+zGfkF9is
 AVzw==
X-Gm-Message-State: AOAM532/G+QnOXHJD6P4mU9/ZkwzVFsKTWIeBcHppmvIfEY6EmUILk50
 K4iSlKmSEjOixCXZmc5mmvor0Nagig2F/A==
X-Google-Smtp-Source: ABdhPJyp3Z+rp097ChFvS1B1sdKMSjVLx8Bsk74EIrp4/yLNVKXdOLcc7DCwtZ0TeT3hKgDx3OKVpw==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr22326011pgq.215.1649570253242; 
 Sat, 09 Apr 2022 22:57:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Define neoverse-n1
Date: Sat,  9 Apr 2022 22:57:25 -0700
Message-Id: <20220410055725.380246-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Enable the n1 for virt and sbsa board use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c  |  1 +
 hw/arm/virt.c      |  1 +
 target/arm/cpu64.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2ddde88f5e..dac8860f2d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -146,6 +146,7 @@ static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce15c36a7f..82dd934de6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("a64fx"),
+    ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a00c02be2c..6a67b3d840 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -314,6 +314,69 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000043;
 }
 
+static void aarch64_neoverse_n1_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,neoverse-n1";
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
+    cpu->ctr = 0x8444c004;
+    cpu->dcz_blocksize = 4;
+    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
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
+    cpu->midr = 0x414fd0c1;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+
+    /* From B2.98 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.23 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* From B5.1 AdvSIMD AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+}
+
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
@@ -1000,6 +1063,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     { .name = "host",               .initfn = aarch64_host_initfn },
-- 
2.25.1


