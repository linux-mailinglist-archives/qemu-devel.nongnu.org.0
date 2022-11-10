Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB8623E42
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3Up-00059x-Un; Thu, 10 Nov 2022 04:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ot3Uf-00059E-EX; Thu, 10 Nov 2022 04:05:06 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ot3UY-0005JY-5r; Thu, 10 Nov 2022 04:05:05 -0500
Received: by mail-lf1-x129.google.com with SMTP id g12so1974979lfh.3;
 Thu, 10 Nov 2022 01:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PQdWojFEWwL9VnT+zZun1w9OrrZEpCxfI0a3+OnwqlA=;
 b=KFFTUQrvNgthhXBTrfWh6uib80FP6B2TwKe5kS7jLJZuPaLMx8S2eeFqxV6brvwckc
 ls2joV+LlM7WzJYOtNWcS+q1GVAQWCFcRO78MFj0XJxsgOGh/63zuFVh4VCnTAKoQa+K
 sGWsZGOWZA5mGd2tX8KgsY5FyNKKicpDapYWw2zqkzIeGo05ZdQZWid+sHcr/YRGThuR
 kUSYZsgYW0ph9pOPwh3yU52PlewwpHyHFcLV6A2tQvbjYzS8uvc/Jrm82e+BlyW3vHic
 yQ8ALBZiAm7Z2oAfoyJPljtv1b0lfjez/XXBmTGEnvh6VYvHO96Tc0bysZCmB+/crQ+Z
 LxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQdWojFEWwL9VnT+zZun1w9OrrZEpCxfI0a3+OnwqlA=;
 b=5SSGOY3pl8ZDfej9Mz/CNZUGV4N7H8pl7Bwpe0KeK/pF6G2wFdVgG4li43A1Zudb6S
 bKB27ONoSzILza8XeR+fJ50Ra+x8GU/uKhdyYfOyLI1yE4kIaq2ri6JY1c702NHQ2j0C
 SArH2Z/dfhHplGEY9mcvKcmmNTKqf/g9SLIzeubpCoAgJ+XQX33rvO0rSDgDXe946o7P
 mBpwSzvdfvldoop00JSk9s8lQueqC2DRTfg6mFNaa2fvXGc0sMABrjiQthH5vQ5a6iXE
 8ffRovwmw1DS4E4J4X5VPRgPDnd41ig7nXbw4Se4QfnnbJqQE/eySmB1po5aOsRPDc8S
 pBsQ==
X-Gm-Message-State: ACrzQf1krt5NJ78pNXQbJB/qvmDisV1P59Oq72aC/rcQe8Qzh5MKzQRK
 CjTWFbsl/abGwwiRXp6vzlY=
X-Google-Smtp-Source: AMsMyM6L3sTxvxcFSmIVz4ogeLnfCSNCe6D80UANN1MYtb2l60+kOWc5PStPVxNU2nZsn+1JSB73VA==
X-Received: by 2002:a19:6719:0:b0:4b1:8a90:6524 with SMTP id
 b25-20020a196719000000b004b18a906524mr1056823lfc.628.1668071090886; 
 Thu, 10 Nov 2022 01:04:50 -0800 (PST)
Received: from NBK05906.kdtln.ru (89-109-44-157.dynamic.mts-nn.ru.
 [89.109.44.157]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05651c030300b0027722e99323sm2589274ljp.5.2022.11.10.01.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 01:04:50 -0800 (PST)
From: Timofey Kutergin <tkutergin@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	tkutergin@gmail.com
Subject: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
Date: Thu, 10 Nov 2022 12:04:44 +0300
Message-Id: <20221110090444.550362-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

  cortex-a55 is one of newer armv8.2+ CPUs supporting native
  Privileged Access Never (PAN) feature. Using this CPU
  provides access to this feature without using fictious "max"
  CPU.

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
---
 hw/arm/virt.c      |  1 +
 target/arm/cpu64.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..fc0c9baba6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -201,6 +201,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3d74f134f5..e1ade1b2a3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -792,6 +792,60 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a55";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x411fd050;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034070;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->isar.id_pfr0 = 0x10000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x04010088;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_aa64pfr0 = 0x10112222;
+    cpu->isar.id_aa64dfr0 = 0x10305408;
+    cpu->isar.id_aa64isar0 = 0x10211120;
+    cpu->isar.id_aa64isar1 = 0x00100001;
+    cpu->isar.id_aa64mmfr0 = 0x00101122;
+    cpu->isar.id_aa64mmfr1 = 0x10212122;
+    cpu->isar.id_aa64mmfr2 = 0x00001011;
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->clidr = 0x82000023;
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+}
+
 static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1243,6 +1297,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-- 
2.25.1


