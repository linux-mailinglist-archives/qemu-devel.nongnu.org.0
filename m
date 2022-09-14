Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F555B887A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:45:25 +0200 (CEST)
Received: from localhost ([::1]:35364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRlc-0004Yi-3g
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwP-0008U3-Br
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwH-0008Ux-Ah
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so840462wmq.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WwbBd3rRRkrdXZ0csiyteKL8f1uj4exJPXeotBBVkgg=;
 b=Z37Fp5S/9OUW8YYVafss2pBJOZjJ6HP4plk/XGiQy6GvHjvnMbkxsKeklbfvNA/Ycs
 q61tXbssd1k9uKfYNlxV1ZW7f7ycY7d7gbqgVGHJpavvBNk/EixTGV5fHWaQtFbolSce
 7kTmIP+DrXO5uz3/5BkTk83GNdOPYJmx9q7bGZp1L6LnjCPp5iAWnqdsi67XsGHN9OdC
 eNNGFPVIN7Nf+6iNuchIKBOBzcHeycjHZeI/Xk/Cui8o30FTplu9qHfgBNLni/mlfQHL
 NCfkR7NQmpqXR6T6yZjeH/6wtbQC+Njng4rvhVIsWBwDC8If1l59qJlzIUDkocMvkQap
 LCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WwbBd3rRRkrdXZ0csiyteKL8f1uj4exJPXeotBBVkgg=;
 b=8ELJkIgqs+9Np74AgS4/RwK5Y5zxWj+MEIx0m/FCxu6ugObby6tLq56hI7uR2nPO+l
 xpMFYJyRjYqtvlr6fn+wBX0fbx28qKGkrsMZyucs3LYnC6vz1BUAVC9BU4b9HqVE+yzA
 ludg3xNKuDWzfUX5ijixoteZHDz8L6vkJVVJLz/g/et9RL2LGG3BTB9sUBPsd/yXSJCH
 0RpNqBfsBy/r/Lp1sPA5Y5V4VxZ/8BomDb2u6Aqj4HhMb6J11ciSO/t6Oyy0L4DNXSw1
 N2AgoYEKY7zG5QDH3IcPsRuHz616gRSrNkAHfmoaec/U+I1ytlyrvW+iSCJhC3Dg9sxK
 BpeA==
X-Gm-Message-State: ACgBeo0QIK9j4cJEuMECNYI/8Q733VfnDSfz546g20gSuNcvryOfB4xg
 gj9Kg/54duZk/Ktz00bs1ChxugVxHaClGpO6
X-Google-Smtp-Source: AA6agR4VyJ3+kEUDHKuTZTAqnoY6fXGdnK4kXtNgzpTvgi59l9OSJY/Ki6stMCkP3R4uavybQGooVA==
X-Received: by 2002:a05:600c:a14e:b0:3b4:7ff1:299b with SMTP id
 ib14-20020a05600ca14e00b003b47ff1299bmr2855988wmb.18.1663156339788; 
 Wed, 14 Sep 2022 04:52:19 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Joe Komlodi <komlodi@google.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/20] target/arm: Add cortex-a35
Date: Wed, 14 Sep 2022 12:51:57 +0100
Message-Id: <20220914115217.117532-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Add cortex A35 core and enable it for virt board.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220819002015.1663247-1-wuhaotsh@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 80 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3b6ba69a9a..20442ea2c1 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -52,6 +52,7 @@ Supported guest CPU types:
 
 - ``cortex-a7`` (32-bit)
 - ``cortex-a15`` (32-bit; the default)
+- ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a6480fd2a..0961e053e5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,6 +199,7 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+    ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778a..9d1ea32057 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,6 +36,85 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 
+static void aarch64_a35_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a35";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* From B2.2 AArch64 identification registers. */
+    cpu->midr = 0x411fd040;
+    cpu->revidr = 0;
+    cpu->ctr = 0x84448004;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_aa64pfr0 = 0x00002222;
+    cpu->isar.id_aa64pfr1 = 0;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr1 = 0;
+    cpu->isar.id_aa64isar0 = 0x00011120;
+    cpu->isar.id_aa64isar1 = 0;
+    cpu->isar.id_aa64mmfr0 = 0x00101122;
+    cpu->isar.id_aa64mmfr1 = 0;
+    cpu->clidr = 0x0a200023;
+    cpu->dcz_blocksize = 4;
+
+    /* From B2.4 AArch64 Virtual Memory control registers */
+    cpu->reset_sctlr = 0x00c50838;
+
+    /* From B2.10 AArch64 performance monitor registers */
+    cpu->isar.reset_pmcr_el0 = 0x410a3000;
+
+    /* From B2.29 Cache ID registers */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+
+    /* From B3.5 VGIC Type register */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From C6.4 Debug ID Register */
+    cpu->isar.dbgdidr = 0x3516d000;
+    /* From C6.5 Debug Device ID Register */
+    cpu->isar.dbgdevid = 0x00110f13;
+    /* From C6.6 Debug Device ID Register 1 */
+    cpu->isar.dbgdevid1 = 0x2;
+
+    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
+    /* From 3.2 AArch32 register summary */
+    cpu->reset_fpsid = 0x41034043;
+
+    /* From 2.2 AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* These values are the same with A53/A57/A72. */
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
 
 static void aarch64_a57_initfn(Object *obj)
 {
@@ -1158,6 +1237,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
+    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-- 
2.34.1


