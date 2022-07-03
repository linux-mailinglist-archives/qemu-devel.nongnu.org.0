Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D8564672
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:36:15 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w1U-0006kd-Rs
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRz-0004DD-NA
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRy-00049V-2e
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id fz10so475223pjb.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdR2AdXYQcU9MB9eRdNwupFKlHHJUO4XdfGfsX7z9ZA=;
 b=r5s3lkQ/KH/owNvwkx8GX3ARK+tLsS7L8Y3iDkvhKZOpNdAPHnpVGHD8XVqjad6oaD
 91dlITPT86XOWg4XNwFBoRprFn+mkHqjf61iLU7ssdVxT7e7HqkbYlY5xT8wp7zSRxfe
 7kGohEzRh6XqnTCYeROhh9kc7du36btbJhupgc+2hYtpN3i62lXgddAb/mxbRMV0By6F
 JaEyOnnfsvYYvuGJK1qfOawM+qnVyjVq8LdgMBOJSA4qcgHMiXiAfRbpnE6/+GMyJmvZ
 r/uvdgVJ0hzn1LxZtOZjeEfOZ7sc74D7/B+I1P6M8WRyWPeVZCTjv+TkcgWxL3xKjw46
 hnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdR2AdXYQcU9MB9eRdNwupFKlHHJUO4XdfGfsX7z9ZA=;
 b=ayg9OOOQODTiaIlufDRZaPsWaWUgAZnksPibz3MrkJKAubRXbm9rbU5eyQzCdZB4CZ
 pbzaGLGMm/2/vQpGWfysPCDnSrvG/JrudT64XqjUqpeAdv5u6twhIO7P+5qXV0Ty3582
 ZERoebOhK+9ZXtUazdTpCtwMsxG+kToej71feeUfzHKZulaopV4evIoK8nwuC1GKnrpf
 m+j15Uoc6DngI8ATo9hKVH1K/+X9zLan/uy83YbbGYXNRvqTTttrG8SkAHTbbFhIVp0B
 /77NNP6tUnFrcUZWeQRHPcHKXnI55u/Xh4k1vfvkuXTfru1p/6K7Eo1QxQkp30xKXF/j
 jJVw==
X-Gm-Message-State: AJIora+68pseEi0+at84dEaVBKfmrbulVxHbDGT4j2FWlGsS4QVWrDAc
 q/a5CbIul3cdg/8AzRabdWP/w+8p7th9O3Gw
X-Google-Smtp-Source: AGRyM1u9+ezK7fHIvZrUnnQ7C4aCPMBPYakcs7g9/3qTSPqSZKvXOC0RN8U7TvLtpuUoogdhvTNTfw==
X-Received: by 2002:a17:90b:388c:b0:1ec:d129:704 with SMTP id
 mu12-20020a17090b388c00b001ecd1290704mr29205904pjb.98.1656838768784; 
 Sun, 03 Jul 2022 01:59:28 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v21 03/13] linux-user: Add LoongArch elf support
Date: Sun,  3 Jul 2022 14:29:03 +0530
Message-Id: <20220703085913.772936-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


