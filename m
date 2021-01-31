Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1B309DDD
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 17:48:30 +0100 (CET)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ftl-0002N8-I4
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 11:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fq7-000073-3Z; Sun, 31 Jan 2021 11:44:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fq3-0001Zv-Kt; Sun, 31 Jan 2021 11:44:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so13985904wro.11;
 Sun, 31 Jan 2021 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HAQsUmSJv4RsQU5o8at7OdfU6YsAfj1cwMNlNa7h8w0=;
 b=vO8GS+iB+KSqO9O7llYrgD3yQDaBw0NTqXO/AIDpoQlTFvU5BdFxQ5Xmi9Yq7DHU5M
 XVaYjGfP1kOkKpI84MNDF6ii8nD0AMFUAO/zswYYuzRm8a0wOw20L+tw/jl1c/t4ZXoS
 aP+g3laMj14w0FAtzJwXz2dWuTMbBp1a8yLZ9uDUfscUOuJkDijwLG2wXx81E7uGbwEN
 3Z68lQeaXlALlBXfbL0XXuMoPY3acbqrHrL74iAPrv96KhShA2FIdQgLLlnQ8ByQ3KTf
 KFORs1RtxZq1ebUQ4png+sGXuF/A4e0lSzp4mNZaIcTpg9i4nbP5TzmeieMVL18isJMU
 Gy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HAQsUmSJv4RsQU5o8at7OdfU6YsAfj1cwMNlNa7h8w0=;
 b=dR8DbJnnlD/zA82WW0KNM4NhVccg0QpZVwieNt/VqCuOQzNCss7s+4ypQL53VC1gmS
 SVI6KIjelXRw2De8+ixeHWoSNkUkp9vd8usLFEWnREeKzu3+SAUl1pFT5OKtUHXrhaUq
 /UijQdkaemhzmaepiP9zXgiE4Y79VaVrwre4Psk/jGkbTkz4HNbW/wbtPKQbyS6YeoZq
 o/PbOnktYT3GWly2q2WoIErTiI2A5k3J4YTston1pbXkB2D6qrIA5A8JISh6ReClTw8s
 wivrvTnyHUvntvZRwUp4nrHwNDVeAtTI2mqT7Hq7YfNhwuhlFgl/KrEs8ivHTB0ybqpf
 lXPQ==
X-Gm-Message-State: AOAM530D5F9Cflk54bhPQsce/1LW4p4D6U6xr3MiMRWuWqJbmlDbMJPl
 HnJqOX5H5g83Oj/yA3/OX+g1rB073Yw=
X-Google-Smtp-Source: ABdhPJwY9NgrzsoxviLa/LENSWrK/Wolx0RxjKY6AcjLe2BJb/XGu6d/umDr0/dSrPadU+FvU4iaSw==
X-Received: by 2002:a5d:4391:: with SMTP id i17mr14233857wrq.57.1612111477032; 
 Sun, 31 Jan 2021 08:44:37 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e16sm23643904wrp.24.2021.01.31.08.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/arm: Restrict v7A TCG cpus to TCG accel
Date: Sun, 31 Jan 2021 17:44:06 +0100
Message-Id: <20210131164406.349825-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

A KVM-only build won't be able to run TCG cpus, move the
v7A CPU definitions to cpu_tcg.c.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c     | 327 -------------------------------------------
 target/arm/cpu_tcg.c | 310 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 310 insertions(+), 327 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2d8312267f7..3f10614778b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1906,323 +1906,6 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
-static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
-    { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a8_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a8";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
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
-    define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
-}
-
-static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /*
-     * power_control should be set to maximum latency. Again,
-     * default to 0 and set by private hook
-     */
-    { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_control) },
-    { .name = "A9_DIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 1,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_diagnostic) },
-    { .name = "A9_PWRDIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_diagnostic) },
-    { .name = "NEONBUSY", .cp = 15, .crn = 15, .crm = 1, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    /* TLB lockdown control */
-    { .name = "TLB_LOCKR", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 2,
-      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
-    { .name = "TLB_LOCKW", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 4,
-      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
-    { .name = "TLB_VA", .cp = 15, .crn = 15, .crm = 5, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    { .name = "TLB_PA", .cp = 15, .crn = 15, .crm = 6, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a9_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a9";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /*
-     * Note that A9 supports the MP extensions even for
-     * A9UP and single-core A9MP (which are both different
-     * and valid configurations; we don't model A9UP).
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR);
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
-    define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
-}
-
-#ifndef CONFIG_USER_ONLY
-static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    /*
-     * Linux wants the number of processors from here.
-     * Might as well set the interrupt-controller bit too.
-     */
-    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
-}
-#endif
-
-static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
-      .writefn = arm_cp_write_ignore, },
-#endif
-    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a7_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a7";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
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
-    /*
-     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
-     * table 4-41 gives 0x02101110, which includes the arm div insns.
-     */
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f005;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
-}
-
-static void cortex_a15_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
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
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
-}
-
-#ifndef TARGET_AARCH64
-/*
- * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
- * this only needs to handle 32 bits, and need not care about KVM.
- */
-static void arm_max_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cortex_a15_initfn(obj);
-
-    /* old-style VFP short-vector support */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * We don't set these in system emulation mode for the moment,
-     * since we don't correctly set (all of) the ID registers to
-     * advertise them.
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    {
-        uint32_t t;
-
-        t = cpu->isar.id_isar5;
-        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = t;
-
-        t = cpu->isar.id_isar6;
-        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-        cpu->isar.id_isar6 = t;
-
-        t = cpu->isar.mvfr1;
-        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-        cpu->isar.mvfr1 = t;
-
-        t = cpu->isar.mvfr2;
-        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-        cpu->isar.mvfr2 = t;
-
-        t = cpu->isar.id_mmfr3;
-        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = t;
-
-        t = cpu->isar.id_mmfr4;
-        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = t;
-    }
-#endif
-}
-#endif
-
-#endif /* !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64) */
-
-static const ARMCPUInfo arm_cpus[] = {
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
-    { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
-    { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
-#ifndef TARGET_AARCH64
-    { .name = "max",         .initfn = arm_max_initfn },
-#endif
-#ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_max_initfn },
-#endif
-#endif
-};
-
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
@@ -2358,21 +2041,11 @@ static const TypeInfo arm_cpu_type_info = {
 
 static void arm_cpu_register_types(void)
 {
-    const size_t cpu_count = ARRAY_SIZE(arm_cpus);
-
     type_register_static(&arm_cpu_type_info);
 
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
 #endif
-
-    if (cpu_count) {
-        size_t i;
-
-        for (i = 0; i < cpu_count; ++i) {
-            arm_cpu_register(&arm_cpus[i]);
-        }
-    }
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index bddfbf5e3a9..1572620fba9 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -12,6 +12,9 @@
 #include "cpu.h"
 #include "internals.h"
 #include "target/arm/idau.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -252,6 +255,236 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->reset_auxcr = 1;
 }
 
+static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
+    { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a8_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a8";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->midr = 0x410fc080;
+    cpu->reset_fpsid = 0x410330c0;
+    cpu->isar.mvfr0 = 0x11110222;
+    cpu->isar.mvfr1 = 0x00011111;
+    cpu->ctr = 0x82048004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x1031;
+    cpu->isar.id_pfr1 = 0x11;
+    cpu->isar.id_dfr0 = 0x400;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x31100003;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01202000;
+    cpu->isar.id_mmfr3 = 0x11;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x12112111;
+    cpu->isar.id_isar2 = 0x21232031;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00111142;
+    cpu->isar.dbgdidr = 0x15141000;
+    cpu->clidr = (1 << 27) | (2 << 24) | 3;
+    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
+    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
+    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
+    cpu->reset_auxcr = 2;
+    define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
+}
+
+static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
+    /*
+     * power_control should be set to maximum latency. Again,
+     * default to 0 and set by private hook
+     */
+    { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_control) },
+    { .name = "A9_DIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 1,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_diagnostic) },
+    { .name = "A9_PWRDIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_diagnostic) },
+    { .name = "NEONBUSY", .cp = 15, .crn = 15, .crm = 1, .opc1 = 0, .opc2 = 0,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    /* TLB lockdown control */
+    { .name = "TLB_LOCKR", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 2,
+      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
+    { .name = "TLB_LOCKW", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 4,
+      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
+    { .name = "TLB_VA", .cp = 15, .crn = 15, .crm = 5, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    { .name = "TLB_PA", .cp = 15, .crn = 15, .crm = 6, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a9_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a9";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    /*
+     * Note that A9 supports the MP extensions even for
+     * A9UP and single-core A9MP (which are both different
+     * and valid configurations; we don't model A9UP).
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V7MP);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR);
+    cpu->midr = 0x410fc090;
+    cpu->reset_fpsid = 0x41033090;
+    cpu->isar.mvfr0 = 0x11110222;
+    cpu->isar.mvfr1 = 0x01111111;
+    cpu->ctr = 0x80038003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x1031;
+    cpu->isar.id_pfr1 = 0x11;
+    cpu->isar.id_dfr0 = 0x000;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x00100103;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01230000;
+    cpu->isar.id_mmfr3 = 0x00002111;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00111142;
+    cpu->isar.dbgdidr = 0x35141000;
+    cpu->clidr = (1 << 27) | (1 << 24) | 3;
+    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
+    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
+}
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * Linux wants the number of processors from here.
+     * Might as well set the interrupt-controller bit too.
+     */
+    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
+}
+#endif
+
+static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
+#ifndef CONFIG_USER_ONLY
+    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
+      .writefn = arm_cp_write_ignore, },
+#endif
+    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a7_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a7";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
+    cpu->midr = 0x410fc075;
+    cpu->reset_fpsid = 0x41023075;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x84448003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10101105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    /*
+     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
+     * table 4-41 gives 0x02101110, which includes the arm div insns.
+     */
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f005;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
+}
+
+static void cortex_a15_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a15";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
+    cpu->midr = 0x412fc0f1;
+    cpu->reset_fpsid = 0x410430f0;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f021;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+}
+
 static void cortex_m0_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -675,6 +908,73 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
+#ifndef TARGET_AARCH64
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
+ * this only needs to handle 32 bits, and need not care about KVM.
+ */
+static void arm_max_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cortex_a15_initfn(obj);
+
+    /* old-style VFP short-vector support */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We don't set these in system emulation mode for the moment,
+     * since we don't correctly set (all of) the ID registers to
+     * advertise them.
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    {
+        uint32_t t;
+
+        t = cpu->isar.id_isar5;
+        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+        cpu->isar.id_isar5 = t;
+
+        t = cpu->isar.id_isar6;
+        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        cpu->isar.id_isar6 = t;
+
+        t = cpu->isar.mvfr1;
+        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+        cpu->isar.mvfr1 = t;
+
+        t = cpu->isar.mvfr2;
+        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+        cpu->isar.mvfr2 = t;
+
+        t = cpu->isar.id_mmfr3;
+        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+        cpu->isar.id_mmfr3 = t;
+
+        t = cpu->isar.id_mmfr4;
+        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+        cpu->isar.id_mmfr4 = t;
+    }
+#endif
+}
+#endif
+
 static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm926",      .initfn = arm926_initfn },
     { .name = "arm946",      .initfn = arm946_initfn },
@@ -688,6 +988,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
+    { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
+    { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
+    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
@@ -718,6 +1022,12 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
     { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
+#ifndef TARGET_AARCH64
+    { .name = "max",         .initfn = arm_max_initfn },
+#endif
+#ifdef CONFIG_USER_ONLY
+    { .name = "any",         .initfn = arm_max_initfn },
+#endif
 };
 
 static const TypeInfo idau_interface_type_info = {
-- 
2.26.2


