Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE64632760
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8PR-0003N7-Sz; Mon, 21 Nov 2022 10:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox8PO-0003ML-7A; Mon, 21 Nov 2022 10:08:30 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox8PL-0002PD-CZ; Mon, 21 Nov 2022 10:08:28 -0500
Received: by mail-lf1-x135.google.com with SMTP id l12so19241603lfp.6;
 Mon, 21 Nov 2022 07:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0hkIqbBe/RseetpPmCKez9mYuN6qSjmPAo1amuK0T4=;
 b=ZHUr3RWvqyhJup4ox4DwN/57mEzZ9ym6jHYWFs9/5DKecKQdBDGaLBWODAgHIlmb5g
 CGW2NUswfz4uCX07pi9KmSjhqd1rNJQoX61YacCUO0lDhCuhV2fPxaqXFzP0BL/C68rr
 53FT7mcp3LfFVPs3oH1Rai3XAuHn7iUwv/jYdsdUwF048UTGc5kNt2DM4HpfThUaeMas
 BEoRsIzmX/OtUKgvj6k/7yukOjRsNarS/ZhdvdhYPhErKBuo+sGldgdsbGD3IBqhPvn6
 f9aasPvnmU3/fWbnQwaBu9gmBFKLept2NkrtZf+9s+8HdRcxG5v/+O5m/x662lcYA6fv
 wmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0hkIqbBe/RseetpPmCKez9mYuN6qSjmPAo1amuK0T4=;
 b=ww4iNGCiO7dDIKncvBeZiGQ5LQm1hLV5Z0c4h3KIrZdwWCI15gxwjDcTcF+IwU8bMA
 yIi9FjZYFYWj/tvHgkwPIjRAFmjMUkThg1vUfAwlXQ7oJneA7aZGFG3RYmzNB3oHUdNX
 JKB2cNfS2aHx1wGCU3weC7xhjDxbfF0nUND6sY5q+Y9+Mhze0/OK3Z7RRnmsJ6WyooyK
 YvUOgi/KOSRpq3Ve0j2gRHWy8y0Sy+UXFRzk3YCgAodrCfvMhQd/x4lRZGIbFlGYRP0j
 55mMCU71RTjhzpvGB264+KLiv4Gg9mh1G+8X9Z8+/2Kh11Yusx0OiinWlSkf+pM2z0EG
 8R8g==
X-Gm-Message-State: ANoB5plYcaRCNXv7DRVKNn/SqROCgcjNRppZxLkPsSnNh1npyJkD7U2J
 LWBGQCrUUrI+DzXV5YL/Jvk=
X-Google-Smtp-Source: AA0mqf7erirBv8o2H4J2KPepzjZZIilWOIpmBsPyr5Oibe0uo5calhsKI8Qao3zC0QjbKzyxF4piNg==
X-Received: by 2002:ac2:4153:0:b0:4b0:f505:919b with SMTP id
 c19-20020ac24153000000b004b0f505919bmr5841102lfi.306.1669043303541; 
 Mon, 21 Nov 2022 07:08:23 -0800 (PST)
Received: from NBK05906.kdtln.ru (79-126-20-183.dynamic.mts-nn.ru.
 [79.126.20.183]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056512374700b00492f0f66956sm2053192lfs.284.2022.11.21.07.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 07:08:23 -0800 (PST)
From: Timofey Kutergin <tkutergin@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: tkutergin@gmail.com
Subject: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
Date: Mon, 21 Nov 2022 18:08:19 +0300
Message-Id: <20221121150819.2782817-1-tkutergin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=tkutergin@gmail.com; helo=mail-lf1-x135.google.com
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
  provides access to this feature without using fictitious "max"
  CPU.

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 69 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..8055c59afa 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -54,6 +54,7 @@ Supported guest CPU types:
 - ``cortex-a15`` (32-bit; the default)
 - ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
+- ``cortex-a55`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
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
index 3d74f134f5..cec64471b4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -792,6 +792,74 @@ static void aarch64_a53_initfn(Object *obj)
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
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00011011;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x412FD050;          /* r2p0 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+
+    /* From B2.96 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.45 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.4 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+}
+
 static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1243,6 +1311,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-- 
2.25.1


