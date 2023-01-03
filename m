Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F765C5F7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrf-0000I2-Rf; Tue, 03 Jan 2023 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrZ-000076-Nc
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:14 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrV-0005JJ-6O
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:13 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id n205so8664092vkf.13
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UudCQe6aaBu/DssdkCisyt5+2IhUcMmaavH5MxGn6CU=;
 b=ECEPau6yOOUQt/L2GljuK3lwDDoNNoTY6q8Yqso+g9zLLpNy0n2bHrQjKg3St9QyGa
 rAFpKX3rn2sjbanzPk9KiT05/E1Euw3JfEoBL7Xbg+BJYrgcmUJ/juPdhaACLMk0/EYh
 FvfmIMBlpuyXGo1IatW2lXaBTkp9k/A0uIvQZfPTDeVURlsHeze1ghujGntZ9DrNgZLc
 Rk2efyoXEh4G8LD99wcgHO1AfEw/b9C/af3XujV8Wc/E9k2Vefvn6pX8UygQCXWYsPGV
 vDUhujPLDV4RWxKqJ9eqT7X4QnYjug53Ih+O+cesoBV13sYDpkFXtR6XVYoIYvA9J2ts
 JNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UudCQe6aaBu/DssdkCisyt5+2IhUcMmaavH5MxGn6CU=;
 b=X/RrVTut4aAabm4qzrUoCXehMpaKakW6iRcqIbq2no7VyB41myqsM1bCihEZwFq/9V
 SmdoIQhkoWtIp07HxBbQx10uGg9bvsM5NyYxtTcrgo00L0TFH1YPyiKeBKuBtMARthto
 RKdSslpZ2z6cyEtKrj2+dO/WlEA1NTw0WVYqsva6Nl3vKMpL0yZgLH+agF7Hq6Z631wF
 C8mFZrfNnsxlGYL3yvDfYwZqfNpnx1qRXdI7U9p17wMrAe6sh6NGEt7xciPZfs+Ddgxk
 QTz7ZocZJyyWoby/m9BPBY8QptUSVbXLGXFaPK7unYFZNryQdkv6STAlFlsJwicU1yfN
 6/gQ==
X-Gm-Message-State: AFqh2kpu6EiGiWTJ2EFv27wW/XztFZYQnwV3458dWDoO6zlK/1VlsGMa
 zk34mX7h32fYoMxsHNcq72tGUUYD8NcxXSBp1XM=
X-Google-Smtp-Source: AMrXdXvamc2UF5R4f7bwfXaVVwHZfqb9bKEQsQXtXPGoepN3NT9CRQhuS597628wKBaWplhZ/K8nWQ==
X-Received: by 2002:a1f:320f:0:b0:3bc:b7f6:5fde with SMTP id
 y15-20020a1f320f000000b003bcb7f65fdemr19162894vky.4.1672769887715; 
 Tue, 03 Jan 2023 10:18:07 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 26/40] target/arm: Rename 'cpu' to 'acc' in class init
 functions
Date: Tue,  3 Jan 2023 10:16:32 -0800
Message-Id: <20230103181646.55711-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These were previously left 'misnamed' to minimize the size
of the patch.  Rename them all in bulk with no other change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   |  858 ++++++++++++++--------------
 target/arm/cpu_tcg.c | 1260 +++++++++++++++++++++---------------------
 2 files changed, 1059 insertions(+), 1059 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f94f775585..6ad5f9e444 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,82 +36,82 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 
-static void aarch64_a35_class_init(ARMCPUClass *cpu)
+static void aarch64_a35_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a35";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
+    acc->dtb_compatible = "arm,cortex-a35";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
 
     /* From B2.2 AArch64 identification registers. */
-    cpu->midr = 0x411fd040;
-    cpu->revidr = 0;
-    cpu->ctr = 0x84448004;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64pfr1 = 0;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64dfr1 = 0;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64isar1 = 0;
-    cpu->isar.id_aa64mmfr0 = 0x00101122;
-    cpu->isar.id_aa64mmfr1 = 0;
-    cpu->clidr = 0x0a200023;
-    cpu->dcz_blocksize = 4;
+    acc->midr = 0x411fd040;
+    acc->revidr = 0;
+    acc->ctr = 0x84448004;
+    acc->isar.id_pfr0 = 0x00000131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x03010066;
+    acc->id_afr0 = 0;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x00011121;
+    acc->isar.id_aa64pfr0 = 0x00002222;
+    acc->isar.id_aa64pfr1 = 0;
+    acc->isar.id_aa64dfr0 = 0x10305106;
+    acc->isar.id_aa64dfr1 = 0;
+    acc->isar.id_aa64isar0 = 0x00011120;
+    acc->isar.id_aa64isar1 = 0;
+    acc->isar.id_aa64mmfr0 = 0x00101122;
+    acc->isar.id_aa64mmfr1 = 0;
+    acc->clidr = 0x0a200023;
+    acc->dcz_blocksize = 4;
 
     /* From B2.4 AArch64 Virtual Memory control registers */
-    cpu->reset_sctlr = 0x00c50838;
+    acc->reset_sctlr = 0x00c50838;
 
     /* From B2.10 AArch64 performance monitor registers */
-    cpu->isar.reset_pmcr_el0 = 0x410a3000;
+    acc->isar.reset_pmcr_el0 = 0x410a3000;
 
     /* From B2.29 Cache ID registers */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+    acc->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    acc->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
 
     /* From B3.5 VGIC Type register */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
 
     /* From C6.4 Debug ID Register */
-    cpu->isar.dbgdidr = 0x3516d000;
+    acc->isar.dbgdidr = 0x3516d000;
     /* From C6.5 Debug Device ID Register */
-    cpu->isar.dbgdevid = 0x00110f13;
+    acc->isar.dbgdevid = 0x00110f13;
     /* From C6.6 Debug Device ID Register 1 */
-    cpu->isar.dbgdevid1 = 0x2;
+    acc->isar.dbgdevid1 = 0x2;
 
     /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
     /* From 3.2 AArch32 register summary */
-    cpu->reset_fpsid = 0x41034043;
+    acc->reset_fpsid = 0x41034043;
 
     /* From 2.2 AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x12111111;
+    acc->isar.mvfr2 = 0x00000043;
 
     /* These values are the same with A53/A57/A72. */
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    define_cortex_a72_a57_a53_cp_reginfo(acc);
 }
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
@@ -676,338 +676,338 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
-static void aarch64_a57_class_init(ARMCPUClass *cpu)
+static void aarch64_a57_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a57";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
-    cpu->midr = 0x411fd070;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001124;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    acc->dtb_compatible = "arm,cortex-a57";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    acc->midr = 0x411fd070;
+    acc->revidr = 0x00000000;
+    acc->reset_fpsid = 0x41034070;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x12111111;
+    acc->isar.mvfr2 = 0x00000043;
+    acc->ctr = 0x8444c004;
+    acc->reset_sctlr = 0x00c50838;
+    acc->isar.id_pfr0 = 0x00000131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x03010066;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10101105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x00011121;
+    acc->isar.id_isar6 = 0;
+    acc->isar.id_aa64pfr0 = 0x00002222;
+    acc->isar.id_aa64dfr0 = 0x10305106;
+    acc->isar.id_aa64isar0 = 0x00011120;
+    acc->isar.id_aa64mmfr0 = 0x00001124;
+    acc->isar.dbgdidr = 0x3516d000;
+    acc->isar.dbgdevid = 0x01110f13;
+    acc->isar.dbgdevid1 = 0x2;
+    acc->isar.reset_pmcr_el0 = 0x41013000;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    acc->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
+    acc->dcz_blocksize = 4; /* 64 bytes */
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
+    define_cortex_a72_a57_a53_cp_reginfo(acc);
 }
 
-static void aarch64_a53_class_init(ARMCPUClass *cpu)
+static void aarch64_a53_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a53";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
-    cpu->midr = 0x410fd034;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_isar6 = 0;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x00110f13;
-    cpu->isar.dbgdevid1 = 0x1;
-    cpu->isar.reset_pmcr_el0 = 0x41033000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    acc->dtb_compatible = "arm,cortex-a53";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
+    acc->midr = 0x410fd034;
+    acc->revidr = 0x00000000;
+    acc->reset_fpsid = 0x41034070;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x12111111;
+    acc->isar.mvfr2 = 0x00000043;
+    acc->ctr = 0x84448004; /* L1Ip = VIPT */
+    acc->reset_sctlr = 0x00c50838;
+    acc->isar.id_pfr0 = 0x00000131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x03010066;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10101105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x00011121;
+    acc->isar.id_isar6 = 0;
+    acc->isar.id_aa64pfr0 = 0x00002222;
+    acc->isar.id_aa64dfr0 = 0x10305106;
+    acc->isar.id_aa64isar0 = 0x00011120;
+    acc->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
+    acc->isar.dbgdidr = 0x3516d000;
+    acc->isar.dbgdevid = 0x00110f13;
+    acc->isar.dbgdevid1 = 0x1;
+    acc->isar.reset_pmcr_el0 = 0x41033000;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    acc->ccsidr[2] = 0x707fe07a; /* 1024KB L2 cache */
+    acc->dcz_blocksize = 4; /* 64 bytes */
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
+    define_cortex_a72_a57_a53_cp_reginfo(acc);
 }
 
-static void aarch64_a55_class_init(ARMCPUClass *cpu)
+static void aarch64_a55_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a55";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
+    acc->dtb_compatible = "arm,cortex-a55";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00011011;
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x412FD050;          /* r2p0 */
-    cpu->revidr = 0;
+    acc->clidr = 0x82000023;
+    acc->ctr = 0x84448004; /* L1Ip = VIPT */
+    acc->dcz_blocksize = 4; /* 64 bytes */
+    acc->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    acc->isar.id_aa64isar0 = 0x0000100010211120ull;
+    acc->isar.id_aa64isar1 = 0x0000000000100001ull;
+    acc->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    acc->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    acc->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    acc->isar.id_aa64pfr0  = 0x0000000010112222ull;
+    acc->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    acc->id_afr0       = 0x00000000;
+    acc->isar.id_dfr0  = 0x04010088;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x01011121;
+    acc->isar.id_isar6 = 0x00000010;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02122211;
+    acc->isar.id_mmfr4 = 0x00021110;
+    acc->isar.id_pfr0  = 0x10010131;
+    acc->isar.id_pfr1  = 0x00011011;
+    acc->isar.id_pfr2  = 0x00000011;
+    acc->midr = 0x412FD050;          /* r2p0 */
+    acc->revidr = 0;
 
     /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
-    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+    acc->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    acc->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
 
     /* From B2.96 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
+    acc->reset_sctlr = 0x30c50838;
 
     /* From B4.45 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
 
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x13211111;
+    acc->isar.mvfr2 = 0x00000043;
 
     /* From D5.4 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+    acc->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
-static void aarch64_a72_class_init(ARMCPUClass *cpu)
+static void aarch64_a72_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a72";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->midr = 0x410fd083;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034080;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_aa64pfr0 = 0x00002222;
-    cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
-    cpu->isar.id_aa64mmfr0 = 0x00001124;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41023000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
-    cpu->dcz_blocksize = 4; /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    acc->dtb_compatible = "arm,cortex-a72";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->midr = 0x410fd083;
+    acc->revidr = 0x00000000;
+    acc->reset_fpsid = 0x41034080;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x12111111;
+    acc->isar.mvfr2 = 0x00000043;
+    acc->ctr = 0x8444c004;
+    acc->reset_sctlr = 0x00c50838;
+    acc->isar.id_pfr0 = 0x00000131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x03010066;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x00011121;
+    acc->isar.id_aa64pfr0 = 0x00002222;
+    acc->isar.id_aa64dfr0 = 0x10305106;
+    acc->isar.id_aa64isar0 = 0x00011120;
+    acc->isar.id_aa64mmfr0 = 0x00001124;
+    acc->isar.dbgdidr = 0x3516d000;
+    acc->isar.dbgdevid = 0x01110f13;
+    acc->isar.dbgdevid1 = 0x2;
+    acc->isar.reset_pmcr_el0 = 0x41023000;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    acc->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
+    acc->dcz_blocksize = 4; /* 64 bytes */
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
+    define_cortex_a72_a57_a53_cp_reginfo(acc);
 }
 
-static void aarch64_a76_class_init(ARMCPUClass *cpu)
+static void aarch64_a76_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a76";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
+    acc->dtb_compatible = "arm,cortex-a76";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444C004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0b1;          /* r4p1 */
-    cpu->revidr = 0;
+    acc->clidr = 0x82000023;
+    acc->ctr = 0x8444C004;
+    acc->dcz_blocksize = 4;
+    acc->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    acc->isar.id_aa64isar0 = 0x0000100010211120ull;
+    acc->isar.id_aa64isar1 = 0x0000000000100001ull;
+    acc->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    acc->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    acc->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    acc->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    acc->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    acc->id_afr0       = 0x00000000;
+    acc->isar.id_dfr0  = 0x04010088;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00010142;
+    acc->isar.id_isar5 = 0x01011121;
+    acc->isar.id_isar6 = 0x00000010;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02122211;
+    acc->isar.id_mmfr4 = 0x00021110;
+    acc->isar.id_pfr0  = 0x10010131;
+    acc->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    acc->isar.id_pfr2  = 0x00000011;
+    acc->midr = 0x414fd0b1;          /* r4p1 */
+    acc->revidr = 0;
 
     /* From B2.18 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
+    acc->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    acc->ccsidr[2] = 0x707fe03a; /* 512KB L2 cache */
 
     /* From B2.93 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
+    acc->reset_sctlr = 0x30c50838;
 
     /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x13211111;
+    acc->isar.mvfr2 = 0x00000043;
 
     /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+    acc->isar.reset_pmcr_el0 = 0x410b3000;
 }
 
-static void aarch64_a64fx_class_init(ARMCPUClass *cpu)
+static void aarch64_a64fx_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,a64fx";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->midr = 0x461f0010;
-    cpu->revidr = 0x00000000;
-    cpu->ctr = 0x86668006;
-    cpu->reset_sctlr = 0x30000180;
-    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
-    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
-    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
-    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
-    cpu->id_aa64afr0 = 0x0000000000000000;
-    cpu->id_aa64afr1 = 0x0000000000000000;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
-    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
-    cpu->isar.id_aa64isar0 = 0x0000000010211120;
-    cpu->isar.id_aa64isar1 = 0x0000000000010001;
-    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
-    cpu->clidr = 0x0000000080000023;
-    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
-    cpu->dcz_blocksize = 6; /* 256 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x46014040;
+    acc->dtb_compatible = "arm,a64fx";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->midr = 0x461f0010;
+    acc->revidr = 0x00000000;
+    acc->ctr = 0x86668006;
+    acc->reset_sctlr = 0x30000180;
+    acc->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
+    acc->isar.id_aa64pfr1 = 0x0000000000000000;
+    acc->isar.id_aa64dfr0 = 0x0000000010305408;
+    acc->isar.id_aa64dfr1 = 0x0000000000000000;
+    acc->id_aa64afr0 = 0x0000000000000000;
+    acc->id_aa64afr1 = 0x0000000000000000;
+    acc->isar.id_aa64mmfr0 = 0x0000000000001122;
+    acc->isar.id_aa64mmfr1 = 0x0000000011212100;
+    acc->isar.id_aa64mmfr2 = 0x0000000000001011;
+    acc->isar.id_aa64isar0 = 0x0000000010211120;
+    acc->isar.id_aa64isar1 = 0x0000000000010001;
+    acc->isar.id_aa64zfr0 = 0x0000000000000000;
+    acc->clidr = 0x0000000080000023;
+    acc->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
+    acc->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
+    acc->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
+    acc->dcz_blocksize = 6; /* 256 bytes */
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
+    acc->isar.reset_pmcr_el0 = 0x46014040;
 
     /* TODO:  Add A64FX specific HPC extension registers */
 }
@@ -1023,71 +1023,71 @@ static void aarch64_a64fx_object_init(Object *obj)
                           | (1 << 3); /* 512bit */
 }
 
-static void aarch64_neoverse_n1_class_init(ARMCPUClass *cpu)
+static void aarch64_neoverse_n1_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,neoverse-n1";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_AARCH64);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
+    acc->dtb_compatible = "arm,neoverse-n1";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_AARCH64);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
 
     /* Ordered by B2.4 AArch64 registers by functional group */
-    cpu->clidr = 0x82000023;
-    cpu->ctr = 0x8444c004;
-    cpu->dcz_blocksize = 4;
-    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
-    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
-    cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
-    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
-    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
-    cpu->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
-    cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
-    cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x04010088;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
-    cpu->isar.id_isar6 = 0x00000010;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02122211;
-    cpu->isar.id_mmfr4 = 0x00021110;
-    cpu->isar.id_pfr0  = 0x10010131;
-    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
-    cpu->isar.id_pfr2  = 0x00000011;
-    cpu->midr = 0x414fd0c1;          /* r4p1 */
-    cpu->revidr = 0;
+    acc->clidr = 0x82000023;
+    acc->ctr = 0x8444c004;
+    acc->dcz_blocksize = 4;
+    acc->isar.id_aa64dfr0  = 0x0000000110305408ull;
+    acc->isar.id_aa64isar0 = 0x0000100010211120ull;
+    acc->isar.id_aa64isar1 = 0x0000000000100001ull;
+    acc->isar.id_aa64mmfr0 = 0x0000000000101125ull;
+    acc->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    acc->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    acc->isar.id_aa64pfr0  = 0x1100000010111112ull; /* GIC filled in later */
+    acc->isar.id_aa64pfr1  = 0x0000000000000020ull;
+    acc->id_afr0       = 0x00000000;
+    acc->isar.id_dfr0  = 0x04010088;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00010142;
+    acc->isar.id_isar5 = 0x01011121;
+    acc->isar.id_isar6 = 0x00000010;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02122211;
+    acc->isar.id_mmfr4 = 0x00021110;
+    acc->isar.id_pfr0  = 0x10010131;
+    acc->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    acc->isar.id_pfr2  = 0x00000011;
+    acc->midr = 0x414fd0c1;          /* r4p1 */
+    acc->revidr = 0;
 
     /* From B2.23 CCSIDR_EL1 */
-    cpu->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
+    acc->ccsidr[0] = 0x701fe01a; /* 64KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe01a; /* 64KB L1 icache */
+    acc->ccsidr[2] = 0x70ffe03a; /* 1MB L2 cache */
 
     /* From B2.98 SCTLR_EL3 */
-    cpu->reset_sctlr = 0x30c50838;
+    acc->reset_sctlr = 0x30c50838;
 
     /* From B4.23 ICH_VTR_EL2 */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
+    acc->gic_num_lrs = 4;
+    acc->gic_vpribits = 5;
+    acc->gic_vprebits = 5;
+    acc->gic_pribits = 5;
 
     /* From B5.1 AdvSIMD AArch64 register summary */
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x13211111;
-    cpu->isar.mvfr2 = 0x00000043;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x13211111;
+    acc->isar.mvfr2 = 0x00000043;
 
     /* From D5.1 AArch64 PMU register summary */
-    cpu->isar.reset_pmcr_el0 = 0x410c3000;
+    acc->isar.reset_pmcr_el0 = 0x410c3000;
 }
 
 static void aarch64_host_class_init(ARMCPUClass *acc)
@@ -1136,22 +1136,22 @@ static void aarch64_host_object_init(Object *obj)
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
  * this version only needs to handle 64 bits.
  */
-static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
+static bool aarch64_max_class_late_init(ARMCPUClass *acc, Error **errp)
 {
     uint64_t t;
     uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        return aarch64_host_class_late_init(cpu, errp);
+        return aarch64_host_class_late_init(acc, errp);
     }
 
     /*
      * '-cpu max' for TCG: we currently do this as "A57 with extra things"
      * Retain the more generic dtb_compatible setting from host_class_init.
      */
-    aarch64_a57_class_init(cpu);
-    cpu->dtb_compatible = "arm,arm-v8";
+    aarch64_a57_class_init(acc);
+    acc->dtb_compatible = "arm,arm-v8";
 
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
@@ -1170,18 +1170,18 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
     t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
     t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-    cpu->midr = t;
+    acc->midr = t;
 
     /*
      * We're going to set FEAT_S2FWB, which mandates that CLIDR_EL1.{LoUU,LoUIS}
      * are zero.
      */
-    u = cpu->clidr;
+    u = acc->clidr;
     u = FIELD_DP32(u, CLIDR_EL1, LOUIS, 0);
     u = FIELD_DP32(u, CLIDR_EL1, LOUU, 0);
-    cpu->clidr = u;
+    acc->clidr = u;
 
-    t = cpu->isar.id_aa64isar0;
+    t = acc->isar.id_aa64isar0;
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
@@ -1196,9 +1196,9 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
     t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
     t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
-    cpu->isar.id_aa64isar0 = t;
+    acc->isar.id_aa64isar0 = t;
 
-    t = cpu->isar.id_aa64isar1;
+    t = acc->isar.id_aa64isar1;
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
     t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
     t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
@@ -1209,9 +1209,9 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
     t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
-    cpu->isar.id_aa64isar1 = t;
+    acc->isar.id_aa64isar1 = t;
 
-    t = cpu->isar.id_aa64pfr0;
+    t = acc->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, RAS, 2);       /* FEAT_RASv1p1 + FEAT_DoubleFault */
@@ -1220,9 +1220,9 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
-    cpu->isar.id_aa64pfr0 = t;
+    acc->isar.id_aa64pfr0 = t;
 
-    t = cpu->isar.id_aa64pfr1;
+    t = acc->isar.id_aa64pfr1;
     t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
     t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
     /*
@@ -1234,17 +1234,17 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
-    cpu->isar.id_aa64pfr1 = t;
+    acc->isar.id_aa64pfr1 = t;
 
-    t = cpu->isar.id_aa64mmfr0;
+    t = acc->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
-    cpu->isar.id_aa64mmfr0 = t;
+    acc->isar.id_aa64mmfr0 = t;
 
-    t = cpu->isar.id_aa64mmfr1;
+    t = acc->isar.id_aa64mmfr1;
     t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
@@ -1254,9 +1254,9 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
-    cpu->isar.id_aa64mmfr1 = t;
+    acc->isar.id_aa64mmfr1 = t;
 
-    t = cpu->isar.id_aa64mmfr2;
+    t = acc->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
@@ -1268,9 +1268,9 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
     t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
-    cpu->isar.id_aa64mmfr2 = t;
+    acc->isar.id_aa64mmfr2 = t;
 
-    t = cpu->isar.id_aa64zfr0;
+    t = acc->isar.id_aa64zfr0;
     t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
     t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
     t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
@@ -1280,14 +1280,14 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
     t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
-    cpu->isar.id_aa64zfr0 = t;
+    acc->isar.id_aa64zfr0 = t;
 
-    t = cpu->isar.id_aa64dfr0;
+    t = acc->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
-    cpu->isar.id_aa64dfr0 = t;
+    acc->isar.id_aa64dfr0 = t;
 
-    t = cpu->isar.id_aa64smfr0;
+    t = acc->isar.id_aa64smfr0;
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
@@ -1295,18 +1295,18 @@ static bool aarch64_max_class_late_init(ARMCPUClass *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
-    cpu->isar.id_aa64smfr0 = t;
+    acc->isar.id_aa64smfr0 = t;
 
     /* Replicate the same data to the 32-bit id registers.  */
-    aa32_max_features(cpu);
+    aa32_max_features(acc);
 
 #ifdef CONFIG_USER_ONLY
     /*
      * For usermode -cpu max we can use a larger and more efficient DCZ
      * blocksize since we don't have to follow what the hardware does.
      */
-    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-    cpu->dcz_blocksize = 7; /*  512 bytes */
+    acc->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+    acc->dcz_blocksize = 7; /*  512 bytes */
 #endif
     return true;
 }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f35b4a52b0..1ef825b39e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,21 +22,21 @@
 
 
 /* Share AArch32 -cpu max features with AArch64. */
-void aa32_max_features(ARMCPUClass *cpu)
+void aa32_max_features(ARMCPUClass *acc)
 {
     uint32_t t;
 
     /* Add additional features supported by QEMU */
-    t = cpu->isar.id_isar5;
+    t = acc->isar.id_isar5;
     t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
     t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
     t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
     t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
     t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
     t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
-    cpu->isar.id_isar5 = t;
+    acc->isar.id_isar5 = t;
 
-    t = cpu->isar.id_isar6;
+    t = acc->isar.id_isar6;
     t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
     t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
     t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
@@ -44,50 +44,50 @@ void aa32_max_features(ARMCPUClass *cpu)
     t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
     t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
     t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
-    cpu->isar.id_isar6 = t;
+    acc->isar.id_isar6 = t;
 
-    t = cpu->isar.mvfr1;
+    t = acc->isar.mvfr1;
     t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
     t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
-    cpu->isar.mvfr1 = t;
+    acc->isar.mvfr1 = t;
 
-    t = cpu->isar.mvfr2;
+    t = acc->isar.mvfr2;
     t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
     t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
+    acc->isar.mvfr2 = t;
 
-    t = cpu->isar.id_mmfr3;
+    t = acc->isar.id_mmfr3;
     t = FIELD_DP32(t, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
-    cpu->isar.id_mmfr3 = t;
+    acc->isar.id_mmfr3 = t;
 
-    t = cpu->isar.id_mmfr4;
+    t = acc->isar.id_mmfr4;
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
-    cpu->isar.id_mmfr4 = t;
+    acc->isar.id_mmfr4 = t;
 
-    t = cpu->isar.id_mmfr5;
+    t = acc->isar.id_mmfr5;
     t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
-    cpu->isar.id_mmfr5 = t;
+    acc->isar.id_mmfr5 = t;
 
-    t = cpu->isar.id_pfr0;
+    t = acc->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
-    cpu->isar.id_pfr0 = t;
+    acc->isar.id_pfr0 = t;
 
-    t = cpu->isar.id_pfr2;
+    t = acc->isar.id_pfr2;
     t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
-    cpu->isar.id_pfr2 = t;
+    acc->isar.id_pfr2 = t;
 
-    t = cpu->isar.id_dfr0;
+    t = acc->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
-    cpu->isar.id_dfr0 = t;
+    acc->isar.id_dfr0 = t;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -178,43 +178,43 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 #endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
-static void arm926_class_init(ARMCPUClass *cpu)
+static void arm926_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,arm926";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr = 0x41069265;
-    cpu->reset_fpsid = 0x41011090;
-    cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00090078;
+    acc->dtb_compatible = "arm,arm926";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CACHE_TEST_CLEAN);
+    acc->midr = 0x41069265;
+    acc->reset_fpsid = 0x41011090;
+    acc->ctr = 0x1dd20d2;
+    acc->reset_sctlr = 0x00090078;
 
     /*
      * ARMv5 does not have the ID_ISAR registers, but we can still
      * set the field to indicate Jazelle support within QEMU.
      */
-    cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    acc->isar.id_isar1 = FIELD_DP32(acc->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
     /*
      * Similarly, we need to set MVFR0 fields to enable vfp and short vector
      * support even though ARMv5 doesn't have this register.
      */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPSP, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
-static void arm946_class_init(ARMCPUClass *cpu)
+static void arm946_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,arm946";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_PMSA);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr = 0x41059461;
-    cpu->ctr = 0x0f004006;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "arm,arm946";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_PMSA);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    acc->midr = 0x41059461;
+    acc->ctr = 0x0f004006;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void arm1026_class_init(ARMCPUClass *cpu)
+static void arm1026_class_init(ARMCPUClass *acc)
 {
     /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
     static const ARMCPRegInfo ifar[1] = {
@@ -224,34 +224,34 @@ static void arm1026_class_init(ARMCPUClass *cpu)
           .resetvalue = 0 }
     };
 
-    cpu->dtb_compatible = "arm,arm1026";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_AUXCR);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr = 0x4106a262;
-    cpu->reset_fpsid = 0x410110a0;
-    cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00090078;
-    cpu->reset_auxcr = 1;
+    acc->dtb_compatible = "arm,arm1026";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_AUXCR);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CACHE_TEST_CLEAN);
+    acc->midr = 0x4106a262;
+    acc->reset_fpsid = 0x410110a0;
+    acc->ctr = 0x1dd20d2;
+    acc->reset_sctlr = 0x00090078;
+    acc->reset_auxcr = 1;
 
     /*
      * ARMv5 does not have the ID_ISAR registers, but we can still
      * set the field to indicate Jazelle support within QEMU.
      */
-    cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    acc->isar.id_isar1 = FIELD_DP32(acc->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
     /*
      * Similarly, we need to set MVFR0 fields to enable vfp and short vector
      * support even though ARMv5 doesn't have this register.
      */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPSP, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPDP, 1);
 
-    define_arm_cp_regs_with_class(cpu, ifar, NULL);
+    define_arm_cp_regs_with_class(acc, ifar, NULL);
 }
 
-static void arm1136_r2_class_init(ARMCPUClass *cpu)
+static void arm1136_r2_class_init(ARMCPUClass *acc)
 {
     /*
      * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
@@ -262,116 +262,116 @@ static void arm1136_r2_class_init(ARMCPUClass *cpu)
      * of the ID registers).
      */
 
-    cpu->dtb_compatible = "arm,arm1136";
-    set_class_feature(cpu, ARM_FEATURE_V6);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr = 0x4107b362;
-    cpu->reset_fpsid = 0x410120b4;
-    cpu->isar.mvfr0 = 0x11111111;
-    cpu->isar.mvfr1 = 0x00000000;
-    cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00050078;
-    cpu->isar.id_pfr0 = 0x111;
-    cpu->isar.id_pfr1 = 0x1;
-    cpu->isar.id_dfr0 = 0x2;
-    cpu->id_afr0 = 0x3;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222110;
-    cpu->isar.id_isar0 = 0x00140011;
-    cpu->isar.id_isar1 = 0x12002111;
-    cpu->isar.id_isar2 = 0x11231111;
-    cpu->isar.id_isar3 = 0x01102131;
-    cpu->isar.id_isar4 = 0x141;
-    cpu->reset_auxcr = 7;
+    acc->dtb_compatible = "arm,arm1136";
+    set_class_feature(acc, ARM_FEATURE_V6);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(acc, ARM_FEATURE_CACHE_BLOCK_OPS);
+    acc->midr = 0x4107b362;
+    acc->reset_fpsid = 0x410120b4;
+    acc->isar.mvfr0 = 0x11111111;
+    acc->isar.mvfr1 = 0x00000000;
+    acc->ctr = 0x1dd20d2;
+    acc->reset_sctlr = 0x00050078;
+    acc->isar.id_pfr0 = 0x111;
+    acc->isar.id_pfr1 = 0x1;
+    acc->isar.id_dfr0 = 0x2;
+    acc->id_afr0 = 0x3;
+    acc->isar.id_mmfr0 = 0x01130003;
+    acc->isar.id_mmfr1 = 0x10030302;
+    acc->isar.id_mmfr2 = 0x01222110;
+    acc->isar.id_isar0 = 0x00140011;
+    acc->isar.id_isar1 = 0x12002111;
+    acc->isar.id_isar2 = 0x11231111;
+    acc->isar.id_isar3 = 0x01102131;
+    acc->isar.id_isar4 = 0x141;
+    acc->reset_auxcr = 7;
 }
 
-static void arm1136_class_init(ARMCPUClass *cpu)
+static void arm1136_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,arm1136";
-    set_class_feature(cpu, ARM_FEATURE_V6K);
-    set_class_feature(cpu, ARM_FEATURE_V6);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr = 0x4117b363;
-    cpu->reset_fpsid = 0x410120b4;
-    cpu->isar.mvfr0 = 0x11111111;
-    cpu->isar.mvfr1 = 0x00000000;
-    cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00050078;
-    cpu->isar.id_pfr0 = 0x111;
-    cpu->isar.id_pfr1 = 0x1;
-    cpu->isar.id_dfr0 = 0x2;
-    cpu->id_afr0 = 0x3;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222110;
-    cpu->isar.id_isar0 = 0x00140011;
-    cpu->isar.id_isar1 = 0x12002111;
-    cpu->isar.id_isar2 = 0x11231111;
-    cpu->isar.id_isar3 = 0x01102131;
-    cpu->isar.id_isar4 = 0x141;
-    cpu->reset_auxcr = 7;
+    acc->dtb_compatible = "arm,arm1136";
+    set_class_feature(acc, ARM_FEATURE_V6K);
+    set_class_feature(acc, ARM_FEATURE_V6);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(acc, ARM_FEATURE_CACHE_BLOCK_OPS);
+    acc->midr = 0x4117b363;
+    acc->reset_fpsid = 0x410120b4;
+    acc->isar.mvfr0 = 0x11111111;
+    acc->isar.mvfr1 = 0x00000000;
+    acc->ctr = 0x1dd20d2;
+    acc->reset_sctlr = 0x00050078;
+    acc->isar.id_pfr0 = 0x111;
+    acc->isar.id_pfr1 = 0x1;
+    acc->isar.id_dfr0 = 0x2;
+    acc->id_afr0 = 0x3;
+    acc->isar.id_mmfr0 = 0x01130003;
+    acc->isar.id_mmfr1 = 0x10030302;
+    acc->isar.id_mmfr2 = 0x01222110;
+    acc->isar.id_isar0 = 0x00140011;
+    acc->isar.id_isar1 = 0x12002111;
+    acc->isar.id_isar2 = 0x11231111;
+    acc->isar.id_isar3 = 0x01102131;
+    acc->isar.id_isar4 = 0x141;
+    acc->reset_auxcr = 7;
 }
 
-static void arm1176_class_init(ARMCPUClass *cpu)
+static void arm1176_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,arm1176";
-    set_class_feature(cpu, ARM_FEATURE_V6K);
-    set_class_feature(cpu, ARM_FEATURE_VAPA);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_class_feature(cpu, ARM_FEATURE_CACHE_BLOCK_OPS);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    cpu->midr = 0x410fb767;
-    cpu->reset_fpsid = 0x410120b5;
-    cpu->isar.mvfr0 = 0x11111111;
-    cpu->isar.mvfr1 = 0x00000000;
-    cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00050078;
-    cpu->isar.id_pfr0 = 0x111;
-    cpu->isar.id_pfr1 = 0x11;
-    cpu->isar.id_dfr0 = 0x33;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x01130003;
-    cpu->isar.id_mmfr1 = 0x10030302;
-    cpu->isar.id_mmfr2 = 0x01222100;
-    cpu->isar.id_isar0 = 0x0140011;
-    cpu->isar.id_isar1 = 0x12002111;
-    cpu->isar.id_isar2 = 0x11231121;
-    cpu->isar.id_isar3 = 0x01102131;
-    cpu->isar.id_isar4 = 0x01141;
-    cpu->reset_auxcr = 7;
+    acc->dtb_compatible = "arm,arm1176";
+    set_class_feature(acc, ARM_FEATURE_V6K);
+    set_class_feature(acc, ARM_FEATURE_VAPA);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_class_feature(acc, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    acc->midr = 0x410fb767;
+    acc->reset_fpsid = 0x410120b5;
+    acc->isar.mvfr0 = 0x11111111;
+    acc->isar.mvfr1 = 0x00000000;
+    acc->ctr = 0x1dd20d2;
+    acc->reset_sctlr = 0x00050078;
+    acc->isar.id_pfr0 = 0x111;
+    acc->isar.id_pfr1 = 0x11;
+    acc->isar.id_dfr0 = 0x33;
+    acc->id_afr0 = 0;
+    acc->isar.id_mmfr0 = 0x01130003;
+    acc->isar.id_mmfr1 = 0x10030302;
+    acc->isar.id_mmfr2 = 0x01222100;
+    acc->isar.id_isar0 = 0x0140011;
+    acc->isar.id_isar1 = 0x12002111;
+    acc->isar.id_isar2 = 0x11231121;
+    acc->isar.id_isar3 = 0x01102131;
+    acc->isar.id_isar4 = 0x01141;
+    acc->reset_auxcr = 7;
 }
 
-static void arm11mpcore_class_init(ARMCPUClass *cpu)
+static void arm11mpcore_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,arm11mpcore";
-    set_class_feature(cpu, ARM_FEATURE_V6K);
-    set_class_feature(cpu, ARM_FEATURE_VAPA);
-    set_class_feature(cpu, ARM_FEATURE_MPIDR);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr = 0x410fb022;
-    cpu->reset_fpsid = 0x410120b4;
-    cpu->isar.mvfr0 = 0x11111111;
-    cpu->isar.mvfr1 = 0x00000000;
-    cpu->ctr = 0x1d192992; /* 32K icache 32K dcache */
-    cpu->isar.id_pfr0 = 0x111;
-    cpu->isar.id_pfr1 = 0x1;
-    cpu->isar.id_dfr0 = 0;
-    cpu->id_afr0 = 0x2;
-    cpu->isar.id_mmfr0 = 0x01100103;
-    cpu->isar.id_mmfr1 = 0x10020302;
-    cpu->isar.id_mmfr2 = 0x01222000;
-    cpu->isar.id_isar0 = 0x00100011;
-    cpu->isar.id_isar1 = 0x12002111;
-    cpu->isar.id_isar2 = 0x11221011;
-    cpu->isar.id_isar3 = 0x01102131;
-    cpu->isar.id_isar4 = 0x141;
-    cpu->reset_auxcr = 1;
+    acc->dtb_compatible = "arm,arm11mpcore";
+    set_class_feature(acc, ARM_FEATURE_V6K);
+    set_class_feature(acc, ARM_FEATURE_VAPA);
+    set_class_feature(acc, ARM_FEATURE_MPIDR);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    acc->midr = 0x410fb022;
+    acc->reset_fpsid = 0x410120b4;
+    acc->isar.mvfr0 = 0x11111111;
+    acc->isar.mvfr1 = 0x00000000;
+    acc->ctr = 0x1d192992; /* 32K icache 32K dcache */
+    acc->isar.id_pfr0 = 0x111;
+    acc->isar.id_pfr1 = 0x1;
+    acc->isar.id_dfr0 = 0;
+    acc->id_afr0 = 0x2;
+    acc->isar.id_mmfr0 = 0x01100103;
+    acc->isar.id_mmfr1 = 0x10020302;
+    acc->isar.id_mmfr2 = 0x01222000;
+    acc->isar.id_isar0 = 0x00100011;
+    acc->isar.id_isar1 = 0x12002111;
+    acc->isar.id_isar2 = 0x11221011;
+    acc->isar.id_isar3 = 0x01102131;
+    acc->isar.id_isar4 = 0x141;
+    acc->reset_auxcr = 1;
 }
 
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
@@ -381,41 +381,41 @@ static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-static void cortex_a8_class_init(ARMCPUClass *cpu)
+static void cortex_a8_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a8";
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    cpu->midr = 0x410fc080;
-    cpu->reset_fpsid = 0x410330c0;
-    cpu->isar.mvfr0 = 0x11110222;
-    cpu->isar.mvfr1 = 0x00011111;
-    cpu->ctr = 0x82048004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x1031;
-    cpu->isar.id_pfr1 = 0x11;
-    cpu->isar.id_dfr0 = 0x400;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x31100003;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01202000;
-    cpu->isar.id_mmfr3 = 0x11;
-    cpu->isar.id_isar0 = 0x00101111;
-    cpu->isar.id_isar1 = 0x12112111;
-    cpu->isar.id_isar2 = 0x21232031;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x00111142;
-    cpu->isar.dbgdidr = 0x15141000;
-    cpu->clidr = (1 << 27) | (2 << 24) | 3;
-    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
-    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
-    cpu->reset_auxcr = 2;
-    cpu->isar.reset_pmcr_el0 = 0x41002000;
-    define_arm_cp_regs_with_class(cpu, cortexa8_cp_reginfo, NULL);
+    acc->dtb_compatible = "arm,cortex-a8";
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_THUMB2EE);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    acc->midr = 0x410fc080;
+    acc->reset_fpsid = 0x410330c0;
+    acc->isar.mvfr0 = 0x11110222;
+    acc->isar.mvfr1 = 0x00011111;
+    acc->ctr = 0x82048004;
+    acc->reset_sctlr = 0x00c50078;
+    acc->isar.id_pfr0 = 0x1031;
+    acc->isar.id_pfr1 = 0x11;
+    acc->isar.id_dfr0 = 0x400;
+    acc->id_afr0 = 0;
+    acc->isar.id_mmfr0 = 0x31100003;
+    acc->isar.id_mmfr1 = 0x20000000;
+    acc->isar.id_mmfr2 = 0x01202000;
+    acc->isar.id_mmfr3 = 0x11;
+    acc->isar.id_isar0 = 0x00101111;
+    acc->isar.id_isar1 = 0x12112111;
+    acc->isar.id_isar2 = 0x21232031;
+    acc->isar.id_isar3 = 0x11112131;
+    acc->isar.id_isar4 = 0x00111142;
+    acc->isar.dbgdidr = 0x15141000;
+    acc->clidr = (1 << 27) | (2 << 24) | 3;
+    acc->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
+    acc->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
+    acc->ccsidr[2] = 0xf0000000; /* No L2 icache. */
+    acc->reset_auxcr = 2;
+    acc->isar.reset_pmcr_el0 = 0x41002000;
+    define_arm_cp_regs_with_class(acc, cortexa8_cp_reginfo, NULL);
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
@@ -447,45 +447,45 @@ static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
       .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
 };
 
-static void cortex_a9_class_init(ARMCPUClass *cpu)
+static void cortex_a9_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a9";
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
+    acc->dtb_compatible = "arm,cortex-a9";
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_THUMB2EE);
+    set_class_feature(acc, ARM_FEATURE_EL3);
     /*
      * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
-    set_class_feature(cpu, ARM_FEATURE_V7MP);
-    set_class_feature(cpu, ARM_FEATURE_CBAR);
-    cpu->midr = 0x410fc090;
-    cpu->reset_fpsid = 0x41033090;
-    cpu->isar.mvfr0 = 0x11110222;
-    cpu->isar.mvfr1 = 0x01111111;
-    cpu->ctr = 0x80038003;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x1031;
-    cpu->isar.id_pfr1 = 0x11;
-    cpu->isar.id_dfr0 = 0x000;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x00100103;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01230000;
-    cpu->isar.id_mmfr3 = 0x00002111;
-    cpu->isar.id_isar0 = 0x00101111;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x00111142;
-    cpu->isar.dbgdidr = 0x35141000;
-    cpu->clidr = (1 << 27) | (1 << 24) | 3;
-    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
-    cpu->isar.reset_pmcr_el0 = 0x41093000;
-    define_arm_cp_regs_with_class(cpu, cortexa9_cp_reginfo, NULL);
+    set_class_feature(acc, ARM_FEATURE_V7MP);
+    set_class_feature(acc, ARM_FEATURE_CBAR);
+    acc->midr = 0x410fc090;
+    acc->reset_fpsid = 0x41033090;
+    acc->isar.mvfr0 = 0x11110222;
+    acc->isar.mvfr1 = 0x01111111;
+    acc->ctr = 0x80038003;
+    acc->reset_sctlr = 0x00c50078;
+    acc->isar.id_pfr0 = 0x1031;
+    acc->isar.id_pfr1 = 0x11;
+    acc->isar.id_dfr0 = 0x000;
+    acc->id_afr0 = 0;
+    acc->isar.id_mmfr0 = 0x00100103;
+    acc->isar.id_mmfr1 = 0x20000000;
+    acc->isar.id_mmfr2 = 0x01230000;
+    acc->isar.id_mmfr3 = 0x00002111;
+    acc->isar.id_isar0 = 0x00101111;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232041;
+    acc->isar.id_isar3 = 0x11112131;
+    acc->isar.id_isar4 = 0x00111142;
+    acc->isar.dbgdidr = 0x35141000;
+    acc->clidr = (1 << 27) | (1 << 24) | 3;
+    acc->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
+    acc->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    acc->isar.reset_pmcr_el0 = 0x41093000;
+    define_arm_cp_regs_with_class(acc, cortexa9_cp_reginfo, NULL);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -511,106 +511,106 @@ static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-static void cortex_a7_class_init(ARMCPUClass *cpu)
+static void cortex_a7_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a7";
-    set_class_feature(cpu, ARM_FEATURE_V7VE);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
-    cpu->midr = 0x410fc075;
-    cpu->reset_fpsid = 0x41023075;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x84448003;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
+    acc->dtb_compatible = "arm,cortex-a7";
+    set_class_feature(acc, ARM_FEATURE_V7VE);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_THUMB2EE);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
+    acc->midr = 0x410fc075;
+    acc->reset_fpsid = 0x41023075;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x11111111;
+    acc->ctr = 0x84448003;
+    acc->reset_sctlr = 0x00c50078;
+    acc->isar.id_pfr0 = 0x00001131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x02010555;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10101105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01240000;
+    acc->isar.id_mmfr3 = 0x02102211;
     /*
      * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
      * table 4-41 gives 0x02101110, which includes the arm div insns.
      */
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f005;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x1;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x41072000;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232041;
+    acc->isar.id_isar3 = 0x11112131;
+    acc->isar.id_isar4 = 0x10011142;
+    acc->isar.dbgdidr = 0x3515f005;
+    acc->isar.dbgdevid = 0x01110f13;
+    acc->isar.dbgdevid1 = 0x1;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    acc->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    acc->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    acc->isar.reset_pmcr_el0 = 0x41072000;
 
     /* Same as A15 */
-    define_arm_cp_regs_with_class(cpu, cortexa15_cp_reginfo, NULL);
+    define_arm_cp_regs_with_class(acc, cortexa15_cp_reginfo, NULL);
 }
 
-static void cortex_a15_class_init(ARMCPUClass *cpu)
+static void cortex_a15_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "arm,cortex-a15";
-    set_class_feature(cpu, ARM_FEATURE_V7VE);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_THUMB2EE);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    /* r4p0 cpu, not requiring expensive tlb flush errata */
-    cpu->midr = 0x414fc0f0;
-    cpu->revidr = 0x0;
-    cpu->reset_fpsid = 0x410430f0;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f021;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x0;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x410F3000;
-    define_arm_cp_regs_with_class(cpu, cortexa15_cp_reginfo, NULL);
+    acc->dtb_compatible = "arm,cortex-a15";
+    set_class_feature(acc, ARM_FEATURE_V7VE);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_THUMB2EE);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
+    /* r4p0 acc, not requiring expensive tlb flush errata */
+    acc->midr = 0x414fc0f0;
+    acc->revidr = 0x0;
+    acc->reset_fpsid = 0x410430f0;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x11111111;
+    acc->ctr = 0x8444c004;
+    acc->reset_sctlr = 0x00c50078;
+    acc->isar.id_pfr0 = 0x00001131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x02010555;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10201105;
+    acc->isar.id_mmfr1 = 0x20000000;
+    acc->isar.id_mmfr2 = 0x01240000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232041;
+    acc->isar.id_isar3 = 0x11112131;
+    acc->isar.id_isar4 = 0x10011142;
+    acc->isar.dbgdidr = 0x3515f021;
+    acc->isar.dbgdevid = 0x01110f13;
+    acc->isar.dbgdevid1 = 0x0;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    acc->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    acc->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    acc->isar.reset_pmcr_el0 = 0x410F3000;
+    define_arm_cp_regs_with_class(acc, cortexa15_cp_reginfo, NULL);
 }
 
-static void cortex_m0_class_init(ARMCPUClass *cpu)
+static void cortex_m0_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V6);
-    set_class_feature(cpu, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_V6);
+    set_class_feature(acc, ARM_FEATURE_M);
 
-    cpu->midr = 0x410cc200;
+    acc->midr = 0x410cc200;
 
     /*
      * These ID register values are not guest visible, because
@@ -620,168 +620,168 @@ static void cortex_m0_class_init(ARMCPUClass *cpu)
      * by looking at ID register fields. We use the same values as
      * for the M3.
      */
-    cpu->isar.id_pfr0 = 0x00000030;
-    cpu->isar.id_pfr1 = 0x00000200;
-    cpu->isar.id_dfr0 = 0x00100000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
-    cpu->isar.id_isar0 = 0x01141110;
-    cpu->isar.id_isar1 = 0x02111000;
-    cpu->isar.id_isar2 = 0x21112231;
-    cpu->isar.id_isar3 = 0x01111110;
-    cpu->isar.id_isar4 = 0x01310102;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
+    acc->isar.id_pfr0 = 0x00000030;
+    acc->isar.id_pfr1 = 0x00000200;
+    acc->isar.id_dfr0 = 0x00100000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00000030;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x00000000;
+    acc->isar.id_mmfr3 = 0x00000000;
+    acc->isar.id_isar0 = 0x01141110;
+    acc->isar.id_isar1 = 0x02111000;
+    acc->isar.id_isar2 = 0x21112231;
+    acc->isar.id_isar3 = 0x01111110;
+    acc->isar.id_isar4 = 0x01310102;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m3_class_init(ARMCPUClass *cpu)
+static void cortex_m3_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_M);
-    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
-    cpu->midr = 0x410fc231;
-    cpu->pmsav7_dregion = 8;
-    cpu->isar.id_pfr0 = 0x00000030;
-    cpu->isar.id_pfr1 = 0x00000200;
-    cpu->isar.id_dfr0 = 0x00100000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
-    cpu->isar.id_isar0 = 0x01141110;
-    cpu->isar.id_isar1 = 0x02111000;
-    cpu->isar.id_isar2 = 0x21112231;
-    cpu->isar.id_isar3 = 0x01111110;
-    cpu->isar.id_isar4 = 0x01310102;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_M_MAIN);
+    acc->midr = 0x410fc231;
+    acc->pmsav7_dregion = 8;
+    acc->isar.id_pfr0 = 0x00000030;
+    acc->isar.id_pfr1 = 0x00000200;
+    acc->isar.id_dfr0 = 0x00100000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00000030;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x00000000;
+    acc->isar.id_mmfr3 = 0x00000000;
+    acc->isar.id_isar0 = 0x01141110;
+    acc->isar.id_isar1 = 0x02111000;
+    acc->isar.id_isar2 = 0x21112231;
+    acc->isar.id_isar3 = 0x01111110;
+    acc->isar.id_isar4 = 0x01310102;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m4_class_init(ARMCPUClass *cpu)
+static void cortex_m4_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_M);
-    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
-    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
-    cpu->midr = 0x410fc240; /* r0p0 */
-    cpu->pmsav7_dregion = 8;
-    cpu->isar.mvfr0 = 0x10110021;
-    cpu->isar.mvfr1 = 0x11000011;
-    cpu->isar.mvfr2 = 0x00000000;
-    cpu->isar.id_pfr0 = 0x00000030;
-    cpu->isar.id_pfr1 = 0x00000200;
-    cpu->isar.id_dfr0 = 0x00100000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00000030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x00000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
-    cpu->isar.id_isar0 = 0x01141110;
-    cpu->isar.id_isar1 = 0x02111000;
-    cpu->isar.id_isar2 = 0x21112231;
-    cpu->isar.id_isar3 = 0x01111110;
-    cpu->isar.id_isar4 = 0x01310102;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_M_MAIN);
+    set_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+    acc->midr = 0x410fc240; /* r0p0 */
+    acc->pmsav7_dregion = 8;
+    acc->isar.mvfr0 = 0x10110021;
+    acc->isar.mvfr1 = 0x11000011;
+    acc->isar.mvfr2 = 0x00000000;
+    acc->isar.id_pfr0 = 0x00000030;
+    acc->isar.id_pfr1 = 0x00000200;
+    acc->isar.id_dfr0 = 0x00100000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00000030;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x00000000;
+    acc->isar.id_mmfr3 = 0x00000000;
+    acc->isar.id_isar0 = 0x01141110;
+    acc->isar.id_isar1 = 0x02111000;
+    acc->isar.id_isar2 = 0x21112231;
+    acc->isar.id_isar3 = 0x01111110;
+    acc->isar.id_isar4 = 0x01310102;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m7_class_init(ARMCPUClass *cpu)
+static void cortex_m7_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_M);
-    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
-    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
-    cpu->midr = 0x411fc272; /* r1p2 */
-    cpu->pmsav7_dregion = 8;
-    cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12000011;
-    cpu->isar.mvfr2 = 0x00000040;
-    cpu->isar.id_pfr0 = 0x00000030;
-    cpu->isar.id_pfr1 = 0x00000200;
-    cpu->isar.id_dfr0 = 0x00100000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00100030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
-    cpu->isar.id_isar0 = 0x01101110;
-    cpu->isar.id_isar1 = 0x02112000;
-    cpu->isar.id_isar2 = 0x20232231;
-    cpu->isar.id_isar3 = 0x01111131;
-    cpu->isar.id_isar4 = 0x01310132;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_M_MAIN);
+    set_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+    acc->midr = 0x411fc272; /* r1p2 */
+    acc->pmsav7_dregion = 8;
+    acc->isar.mvfr0 = 0x10110221;
+    acc->isar.mvfr1 = 0x12000011;
+    acc->isar.mvfr2 = 0x00000040;
+    acc->isar.id_pfr0 = 0x00000030;
+    acc->isar.id_pfr1 = 0x00000200;
+    acc->isar.id_dfr0 = 0x00100000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00100030;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x01000000;
+    acc->isar.id_mmfr3 = 0x00000000;
+    acc->isar.id_isar0 = 0x01101110;
+    acc->isar.id_isar1 = 0x02112000;
+    acc->isar.id_isar2 = 0x20232231;
+    acc->isar.id_isar3 = 0x01111131;
+    acc->isar.id_isar4 = 0x01310132;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
 }
 
-static void cortex_m33_class_init(ARMCPUClass *cpu)
+static void cortex_m33_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_M);
-    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
-    set_class_feature(cpu, ARM_FEATURE_M_SECURITY);
-    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
-    cpu->midr = 0x410fd213; /* r0p3 */
-    cpu->pmsav7_dregion = 16;
-    cpu->sau_sregion = 8;
-    cpu->isar.mvfr0 = 0x10110021;
-    cpu->isar.mvfr1 = 0x11000011;
-    cpu->isar.mvfr2 = 0x00000040;
-    cpu->isar.id_pfr0 = 0x00000030;
-    cpu->isar.id_pfr1 = 0x00000210;
-    cpu->isar.id_dfr0 = 0x00200000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00101F40;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000000;
-    cpu->isar.id_isar0 = 0x01101110;
-    cpu->isar.id_isar1 = 0x02212000;
-    cpu->isar.id_isar2 = 0x20232232;
-    cpu->isar.id_isar3 = 0x01111131;
-    cpu->isar.id_isar4 = 0x01310132;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
-    cpu->clidr = 0x00000000;
-    cpu->ctr = 0x8000c000;
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_M_MAIN);
+    set_class_feature(acc, ARM_FEATURE_M_SECURITY);
+    set_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+    acc->midr = 0x410fd213; /* r0p3 */
+    acc->pmsav7_dregion = 16;
+    acc->sau_sregion = 8;
+    acc->isar.mvfr0 = 0x10110021;
+    acc->isar.mvfr1 = 0x11000011;
+    acc->isar.mvfr2 = 0x00000040;
+    acc->isar.id_pfr0 = 0x00000030;
+    acc->isar.id_pfr1 = 0x00000210;
+    acc->isar.id_dfr0 = 0x00200000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00101F40;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x01000000;
+    acc->isar.id_mmfr3 = 0x00000000;
+    acc->isar.id_isar0 = 0x01101110;
+    acc->isar.id_isar1 = 0x02212000;
+    acc->isar.id_isar2 = 0x20232232;
+    acc->isar.id_isar3 = 0x01111131;
+    acc->isar.id_isar4 = 0x01310132;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
+    acc->clidr = 0x00000000;
+    acc->ctr = 0x8000c000;
 }
 
-static void cortex_m55_class_init(ARMCPUClass *cpu)
+static void cortex_m55_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_V8_1M);
-    set_class_feature(cpu, ARM_FEATURE_M);
-    set_class_feature(cpu, ARM_FEATURE_M_MAIN);
-    set_class_feature(cpu, ARM_FEATURE_M_SECURITY);
-    set_class_feature(cpu, ARM_FEATURE_THUMB_DSP);
-    cpu->midr = 0x410fd221; /* r0p1 */
-    cpu->revidr = 0;
-    cpu->pmsav7_dregion = 16;
-    cpu->sau_sregion = 8;
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_V8_1M);
+    set_class_feature(acc, ARM_FEATURE_M);
+    set_class_feature(acc, ARM_FEATURE_M_MAIN);
+    set_class_feature(acc, ARM_FEATURE_M_SECURITY);
+    set_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+    acc->midr = 0x410fd221; /* r0p1 */
+    acc->revidr = 0;
+    acc->pmsav7_dregion = 16;
+    acc->sau_sregion = 8;
     /* These are the MVFR* values for the FPU + full MVE configuration */
-    cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12100211;
-    cpu->isar.mvfr2 = 0x00000040;
-    cpu->isar.id_pfr0 = 0x20000030;
-    cpu->isar.id_pfr1 = 0x00000230;
-    cpu->isar.id_dfr0 = 0x10200000;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x00111040;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01000000;
-    cpu->isar.id_mmfr3 = 0x00000011;
-    cpu->isar.id_isar0 = 0x01103110;
-    cpu->isar.id_isar1 = 0x02212000;
-    cpu->isar.id_isar2 = 0x20232232;
-    cpu->isar.id_isar3 = 0x01111131;
-    cpu->isar.id_isar4 = 0x01310132;
-    cpu->isar.id_isar5 = 0x00000000;
-    cpu->isar.id_isar6 = 0x00000000;
-    cpu->clidr = 0x00000000; /* caches not implemented */
-    cpu->ctr = 0x8303c003;
+    acc->isar.mvfr0 = 0x10110221;
+    acc->isar.mvfr1 = 0x12100211;
+    acc->isar.mvfr2 = 0x00000040;
+    acc->isar.id_pfr0 = 0x20000030;
+    acc->isar.id_pfr1 = 0x00000230;
+    acc->isar.id_dfr0 = 0x10200000;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x00111040;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x01000000;
+    acc->isar.id_mmfr3 = 0x00000011;
+    acc->isar.id_isar0 = 0x01103110;
+    acc->isar.id_isar1 = 0x02212000;
+    acc->isar.id_isar2 = 0x20232232;
+    acc->isar.id_isar3 = 0x01111131;
+    acc->isar.id_isar4 = 0x01310132;
+    acc->isar.id_isar5 = 0x00000000;
+    acc->isar.id_isar6 = 0x00000000;
+    acc->clidr = 0x00000000; /* caches not implemented */
+    acc->ctr = 0x8303c003;
 }
 
 static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
@@ -794,180 +794,180 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
 };
 
-static void cortex_r5_class_init(ARMCPUClass *cpu)
+static void cortex_r5_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V7);
-    set_class_feature(cpu, ARM_FEATURE_V7MP);
-    set_class_feature(cpu, ARM_FEATURE_PMSA);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->midr = 0x411fc153; /* r1p3 */
-    cpu->isar.id_pfr0 = 0x0131;
-    cpu->isar.id_pfr1 = 0x001;
-    cpu->isar.id_dfr0 = 0x010400;
-    cpu->id_afr0 = 0x0;
-    cpu->isar.id_mmfr0 = 0x0210030;
-    cpu->isar.id_mmfr1 = 0x00000000;
-    cpu->isar.id_mmfr2 = 0x01200000;
-    cpu->isar.id_mmfr3 = 0x0211;
-    cpu->isar.id_isar0 = 0x02101111;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232141;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x0010142;
-    cpu->isar.id_isar5 = 0x0;
-    cpu->isar.id_isar6 = 0x0;
-    cpu->pmsav7_dregion = 16;
-    cpu->isar.reset_pmcr_el0 = 0x41151800;
-    define_arm_cp_regs_with_class(cpu, cortexr5_cp_reginfo, NULL);
+    set_class_feature(acc, ARM_FEATURE_V7);
+    set_class_feature(acc, ARM_FEATURE_V7MP);
+    set_class_feature(acc, ARM_FEATURE_PMSA);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->midr = 0x411fc153; /* r1p3 */
+    acc->isar.id_pfr0 = 0x0131;
+    acc->isar.id_pfr1 = 0x001;
+    acc->isar.id_dfr0 = 0x010400;
+    acc->id_afr0 = 0x0;
+    acc->isar.id_mmfr0 = 0x0210030;
+    acc->isar.id_mmfr1 = 0x00000000;
+    acc->isar.id_mmfr2 = 0x01200000;
+    acc->isar.id_mmfr3 = 0x0211;
+    acc->isar.id_isar0 = 0x02101111;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232141;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x0010142;
+    acc->isar.id_isar5 = 0x0;
+    acc->isar.id_isar6 = 0x0;
+    acc->pmsav7_dregion = 16;
+    acc->isar.reset_pmcr_el0 = 0x41151800;
+    define_arm_cp_regs_with_class(acc, cortexr5_cp_reginfo, NULL);
 }
 
-static void cortex_r5f_class_init(ARMCPUClass *cpu)
+static void cortex_r5f_class_init(ARMCPUClass *acc)
 {
-    cortex_r5_class_init(cpu);
-    cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x00000011;
+    cortex_r5_class_init(acc);
+    acc->isar.mvfr0 = 0x10110221;
+    acc->isar.mvfr1 = 0x00000011;
 }
 
-static void ti925t_class_init(ARMCPUClass *cpu)
+static void ti925t_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_V4T);
-    set_class_feature(cpu, ARM_FEATURE_OMAPCP);
-    cpu->midr = ARM_CPUID_TI925T;
-    cpu->ctr = 0x5109149;
-    cpu->reset_sctlr = 0x00000070;
+    set_class_feature(acc, ARM_FEATURE_V4T);
+    set_class_feature(acc, ARM_FEATURE_OMAPCP);
+    acc->midr = ARM_CPUID_TI925T;
+    acc->ctr = 0x5109149;
+    acc->reset_sctlr = 0x00000070;
 }
 
-static void sa1100_class_init(ARMCPUClass *cpu)
+static void sa1100_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "intel,sa1100";
-    set_class_feature(cpu, ARM_FEATURE_STRONGARM);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr = 0x4401A11B;
-    cpu->reset_sctlr = 0x00000070;
+    acc->dtb_compatible = "intel,sa1100";
+    set_class_feature(acc, ARM_FEATURE_STRONGARM);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    acc->midr = 0x4401A11B;
+    acc->reset_sctlr = 0x00000070;
 }
 
-static void sa1110_class_init(ARMCPUClass *cpu)
+static void sa1110_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(cpu, ARM_FEATURE_STRONGARM);
-    set_class_feature(cpu, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr = 0x6901B119;
-    cpu->reset_sctlr = 0x00000070;
+    set_class_feature(acc, ARM_FEATURE_STRONGARM);
+    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    acc->midr = 0x6901B119;
+    acc->reset_sctlr = 0x00000070;
 }
 
-static void pxa250_class_init(ARMCPUClass *cpu)
+static void pxa250_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    cpu->midr = 0x69052100;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    acc->midr = 0x69052100;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa255_class_init(ARMCPUClass *cpu)
+static void pxa255_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    cpu->midr = 0x69052d00;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    acc->midr = 0x69052d00;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa260_class_init(ARMCPUClass *cpu)
+static void pxa260_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    cpu->midr = 0x69052903;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    acc->midr = 0x69052903;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa261_class_init(ARMCPUClass *cpu)
+static void pxa261_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    cpu->midr = 0x69052d05;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    acc->midr = 0x69052d05;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa262_class_init(ARMCPUClass *cpu)
+static void pxa262_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    cpu->midr = 0x69052d06;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    acc->midr = 0x69052d06;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270a0_class_init(ARMCPUClass *cpu)
+static void pxa270a0_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054110;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054110;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270a1_class_init(ARMCPUClass *cpu)
+static void pxa270a1_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054111;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054111;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270b0_class_init(ARMCPUClass *cpu)
+static void pxa270b0_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054112;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054112;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270b1_class_init(ARMCPUClass *cpu)
+static void pxa270b1_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054113;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054113;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270c0_class_init(ARMCPUClass *cpu)
+static void pxa270c0_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054114;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054114;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
-static void pxa270c5_class_init(ARMCPUClass *cpu)
+static void pxa270c5_class_init(ARMCPUClass *acc)
 {
-    cpu->dtb_compatible = "marvell,xscale";
-    set_class_feature(cpu, ARM_FEATURE_V5);
-    set_class_feature(cpu, ARM_FEATURE_XSCALE);
-    set_class_feature(cpu, ARM_FEATURE_IWMMXT);
-    cpu->midr = 0x69054117;
-    cpu->ctr = 0xd172172;
-    cpu->reset_sctlr = 0x00000078;
+    acc->dtb_compatible = "marvell,xscale";
+    set_class_feature(acc, ARM_FEATURE_V5);
+    set_class_feature(acc, ARM_FEATURE_XSCALE);
+    set_class_feature(acc, ARM_FEATURE_IWMMXT);
+    acc->midr = 0x69054117;
+    acc->ctr = 0xd172172;
+    acc->reset_sctlr = 0x00000078;
 }
 
 #ifdef CONFIG_TCG
@@ -1010,51 +1010,51 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
  * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
  * this only needs to handle 32 bits, and need not care about KVM.
  */
-static void arm_max_class_init(ARMCPUClass *cpu)
+static void arm_max_class_init(ARMCPUClass *acc)
 {
     /* aarch64_a57_class_init, advertising none of the aarch64 features */
-    cpu->dtb_compatible = "arm,cortex-a57";
-    set_class_feature(cpu, ARM_FEATURE_V8);
-    set_class_feature(cpu, ARM_FEATURE_NEON);
-    set_class_feature(cpu, ARM_FEATURE_GENERIC_TIMER);
-    set_class_feature(cpu, ARM_FEATURE_CBAR_RO);
-    set_class_feature(cpu, ARM_FEATURE_EL2);
-    set_class_feature(cpu, ARM_FEATURE_EL3);
-    set_class_feature(cpu, ARM_FEATURE_PMU);
-    cpu->midr = 0x411fd070;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    cpu->isar.id_pfr0 = 0x00000131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x03010066;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01260000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232042;
-    cpu->isar.id_isar3 = 0x01112131;
-    cpu->isar.id_isar4 = 0x00011142;
-    cpu->isar.id_isar5 = 0x00011121;
-    cpu->isar.id_isar6 = 0;
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x00110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
-    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
-    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    acc->dtb_compatible = "arm,cortex-a57";
+    set_class_feature(acc, ARM_FEATURE_V8);
+    set_class_feature(acc, ARM_FEATURE_NEON);
+    set_class_feature(acc, ARM_FEATURE_GENERIC_TIMER);
+    set_class_feature(acc, ARM_FEATURE_CBAR_RO);
+    set_class_feature(acc, ARM_FEATURE_EL2);
+    set_class_feature(acc, ARM_FEATURE_EL3);
+    set_class_feature(acc, ARM_FEATURE_PMU);
+    acc->midr = 0x411fd070;
+    acc->revidr = 0x00000000;
+    acc->reset_fpsid = 0x41034070;
+    acc->isar.mvfr0 = 0x10110222;
+    acc->isar.mvfr1 = 0x12111111;
+    acc->isar.mvfr2 = 0x00000043;
+    acc->ctr = 0x8444c004;
+    acc->reset_sctlr = 0x00c50838;
+    acc->isar.id_pfr0 = 0x00000131;
+    acc->isar.id_pfr1 = 0x00011011;
+    acc->isar.id_dfr0 = 0x03010066;
+    acc->id_afr0 = 0x00000000;
+    acc->isar.id_mmfr0 = 0x10101105;
+    acc->isar.id_mmfr1 = 0x40000000;
+    acc->isar.id_mmfr2 = 0x01260000;
+    acc->isar.id_mmfr3 = 0x02102211;
+    acc->isar.id_isar0 = 0x02101110;
+    acc->isar.id_isar1 = 0x13112111;
+    acc->isar.id_isar2 = 0x21232042;
+    acc->isar.id_isar3 = 0x01112131;
+    acc->isar.id_isar4 = 0x00011142;
+    acc->isar.id_isar5 = 0x00011121;
+    acc->isar.id_isar6 = 0;
+    acc->isar.dbgdidr = 0x3516d000;
+    acc->isar.dbgdevid = 0x00110f13;
+    acc->isar.dbgdevid1 = 0x2;
+    acc->isar.reset_pmcr_el0 = 0x41013000;
+    acc->clidr = 0x0a200023;
+    acc->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    acc->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    acc->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
+    define_cortex_a72_a57_a53_cp_reginfo(acc);
 
-    aa32_max_features(cpu);
+    aa32_max_features(acc);
 
 #ifdef CONFIG_USER_ONLY
     /*
@@ -1062,7 +1062,7 @@ static void arm_max_class_init(ARMCPUClass *cpu)
      * Only do this for user-mode, where -cpu max is the default, so that
      * older v6 and v7 programs are more likely to work without adjustment.
      */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    acc->isar.mvfr0 = FIELD_DP32(acc->isar.mvfr0, MVFR0, FPSHVEC, 1);
 #endif
 }
 #endif /* !TARGET_AARCH64 */
-- 
2.34.1


