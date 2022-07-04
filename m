Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E94565103
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:37:19 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IW5-00038w-CC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT9-0008Vo-2V
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT7-0004wK-DX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:14 -0400
Received: by mail-pj1-x102d.google.com with SMTP id s21so4229855pjq.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdR2AdXYQcU9MB9eRdNwupFKlHHJUO4XdfGfsX7z9ZA=;
 b=TfwS/UsoMCEpOkBy7afPC7UzceTeJa/3YpE8VzLntIebEN3wubGA0w9N+s9D/1OiYY
 TRByuQMJNfyJdkYCF79nV+cDp8PLwbPiTWh7Wta4Qw9Gh4AJbKgRRRFVbsz/s8sOr8vq
 5ImeEILEfcWKfq9vQJXi1Fu88FzH/rS/c+yPI59pml88xTzsXo/wfSaEn152Xmq6/Xcn
 uuMoJE4NMR1a5Wloy/JyEhzn3PNkJOB774iCRr5la199Up4vOeVptJ4aaDXC3p7JUTE8
 XKP1XaK4WZ0GhEv6kUKRsF8Yjk0uchcMrQBhERgh8qNz4SyeUEe12cu5Idb5EaCk1rx2
 04JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdR2AdXYQcU9MB9eRdNwupFKlHHJUO4XdfGfsX7z9ZA=;
 b=VrvKakrJCVeHwO6cR5sgcOPwhP3oWDBa3IErpQ7R/hsx8Q01QZSr6xsrPKk6PLMbwW
 60oAcN/oh+drfrVN2u5qqxu9fn1acvubBLnL/6iDr8lWrtT4H/FaN1pc5L8U53BPMMPr
 EZaErKtl+HGm8g5Gs5A12ttIvM7QfQLUlMTY/NutB68BIfU01Z6zne8pppQ5JV9/0Osl
 GY9Qzej4Z9PbFi1nOlB8A06z/vtzKzrGLPhilMW4Yz8+rdvYz5eISrQqvTbLl0UdJoqx
 MGORPX74BLGviZvGtSwqfI7Igti1Kqtp7u3YzUIf9se083+D2kwfqFdTwVbPEgzC6K1M
 g/Pg==
X-Gm-Message-State: AJIora/+7Jwe1WaG4l1c1k/QvHeOWmx9U2BGou9Es00WI88kRn0/vy1K
 VJb2wZJm4bILG30mo9VJoMoU+xmJDPIySJkV
X-Google-Smtp-Source: AGRyM1tWZsuzCAmspC3QGN+0dVQXjyx/RjRxLjxN8LWdoftROzaAYpbb/WYukTjTz0glLhgWxtmW/Q==
X-Received: by 2002:a17:90b:180b:b0:1ed:27d3:988f with SMTP id
 lw11-20020a17090b180b00b001ed27d3988fmr35646457pjb.170.1656927252127; 
 Mon, 04 Jul 2022 02:34:12 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/23] linux-user: Add LoongArch elf support
Date: Mon,  4 Jul 2022 15:03:37 +0530
Message-Id: <20220704093357.983255-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220624031049.1716097-4-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loongarch64/target_elf.h | 12 ++++
 linux-user/elfload.c                | 91 +++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 linux-user/loongarch64/target_elf.h

diff --git a/linux-user/loongarch64/target_elf.h b/linux-user/loongarch64/target_elf.h
new file mode 100644
index 0000000000..95c3f05a46
--- /dev/null
+++ b/linux-user/loongarch64/target_elf.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_ELF_H
+#define LOONGARCH_TARGET_ELF_H
+static inline const char *cpu_get_model(uint32_t eflags)
+{
+    return "la464";
+}
+#endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 163fc8a1ee..1de77c7959 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -922,6 +922,97 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
 #endif
 
+#ifdef TARGET_LOONGARCH64
+
+#define ELF_START_MMAP 0x80000000
+
+#define ELF_CLASS   ELFCLASS64
+#define ELF_ARCH    EM_LOONGARCH
+
+#define elf_check_arch(x) ((x) == EM_LOONGARCH)
+
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    /*Set crmd PG,DA = 1,0 */
+    regs->csr.crmd = 2 << 3;
+    regs->csr.era = infop->entry;
+    regs->regs[3] = infop->start_stack;
+}
+
+/* See linux kernel: arch/loongarch/include/asm/elf.h */
+#define ELF_NREG 45
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+enum {
+    TARGET_EF_R0 = 0,
+    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 33,
+    TARGET_EF_CSR_BADV = TARGET_EF_R0 + 34,
+};
+
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPULoongArchState *env)
+{
+    int i;
+
+    (*regs)[TARGET_EF_R0] = 0;
+
+    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
+        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
+    }
+
+    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
+    (*regs)[TARGET_EF_CSR_BADV] = tswapreg(env->CSR_BADV);
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE        4096
+
+#define ELF_HWCAP get_elf_hwcap()
+
+/* See arch/loongarch/include/uapi/asm/hwcap.h */
+enum {
+    HWCAP_LOONGARCH_CPUCFG   = (1 << 0),
+    HWCAP_LOONGARCH_LAM      = (1 << 1),
+    HWCAP_LOONGARCH_UAL      = (1 << 2),
+    HWCAP_LOONGARCH_FPU      = (1 << 3),
+    HWCAP_LOONGARCH_LSX      = (1 << 4),
+    HWCAP_LOONGARCH_LASX     = (1 << 5),
+    HWCAP_LOONGARCH_CRC32    = (1 << 6),
+    HWCAP_LOONGARCH_COMPLEX  = (1 << 7),
+    HWCAP_LOONGARCH_CRYPTO   = (1 << 8),
+    HWCAP_LOONGARCH_LVZ      = (1 << 9),
+    HWCAP_LOONGARCH_LBT_X86  = (1 << 10),
+    HWCAP_LOONGARCH_LBT_ARM  = (1 << 11),
+    HWCAP_LOONGARCH_LBT_MIPS = (1 << 12),
+};
+
+static uint32_t get_elf_hwcap(void)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    hwcaps |= HWCAP_LOONGARCH_CRC32;
+
+    if (FIELD_EX32(cpu->env.cpucfg[1], CPUCFG1, UAL)) {
+        hwcaps |= HWCAP_LOONGARCH_UAL;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, FP)) {
+        hwcaps |= HWCAP_LOONGARCH_FPU;
+    }
+
+    if (FIELD_EX32(cpu->env.cpucfg[2], CPUCFG2, LAM)) {
+        hwcaps |= HWCAP_LOONGARCH_LAM;
+    }
+
+    return hwcaps;
+}
+
+#define ELF_PLATFORM "loongarch"
+
+#endif /* TARGET_LOONGARCH64 */
+
 #ifdef TARGET_MIPS
 
 #define ELF_START_MMAP 0x80000000
-- 
2.34.1


