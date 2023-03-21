Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C66C32CB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuv-000059-Ut; Tue, 21 Mar 2023 09:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebut-0008WI-KM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebur-0006aw-LB
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id iw17so4210683wmb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UgGX9i1g+q2y1PHAwmYRpRwyR7y/+LqvXLTfsWRfm90=;
 b=fKXLX6tsCuwzriNqDywuKHarMXhucw+GX3lNrgTCOnMD4VOHRAE1aG4TfPUgpvsoxV
 K6eVghOQt2tgvuG4IkBUQpizV5V0P3FXCEqPo2KzhFA0rTTRts7JV86k0arGR7tLX0j+
 HappEPrwubcmqa+VVbcV94kqxFcJjtmIwoA4lFW7xFaRBsPsefXwxX9iWQJ8pw8Taxn4
 6aPK+88GYMnogGYkoz5moLd9EDmRTa4ccgGUQYwSXK5H2/idd/qsHbbaSK/02POldk2M
 r+F1VDtHXKgkVmDjbb7WDeMXegNWhQ+fSqVeIZPKmYdI4VmYpHHV9/2pRFkvviV6m0R0
 4l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgGX9i1g+q2y1PHAwmYRpRwyR7y/+LqvXLTfsWRfm90=;
 b=Lmg8Z4zEe7q5Y/avvXkpRJHcZvIPUutH9QqJPbLn/i7wZvi0xE6joLIg3YSQVPdvVB
 PU0+zjqYQNljkBsLyV5IBcNhmse5R0Gza/in6TTduWUeKzGTDowSnTBbGECWUhZFLTdC
 iu6IkEbI9/hOfUCpL0NfMk6kRUc/DNowhI0f7QC2x6IVZ0M64iUupU1W5rd/rd/BOJHF
 EeL1DnV6pkFvUQuYd8yg20BHulmaxvJ6AqAy8ESCNUwGY2/572KbI0EX1crrYlQy+yM7
 nhBCM+Lue4NFxxZWe/nZFyVAfPVT1P69EGFFeR9xJW1tZO3O3JtWIeipOHDNml3BF8xA
 9V/Q==
X-Gm-Message-State: AO0yUKVsyLxe+Huk0loaH++iry9bBhDhaEUu+0G2Zl4gxZStzxvQoiCB
 sDGq40Vh6zdFPjhPQ8Sg3kDA3tCi9Q9IpRWYDPc=
X-Google-Smtp-Source: AK7set9oTYF8vAOX8RiN62Vc9frUHYRGgs3qIAt0w0FonEXUxZkx6UY0oV4j2yKcqIDSbeG7gCG71Q==
X-Received: by 2002:a05:600c:204f:b0:3ed:fddf:b771 with SMTP id
 p15-20020a05600c204f00b003edfddfb771mr2757967wmg.12.1679404839387; 
 Tue, 21 Mar 2023 06:20:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] target/arm: Add Neoverse-N1 registers
Date: Tue, 21 Mar 2023 13:20:29 +0000
Message-Id: <20230321132036.1836617-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add implementation defined registers for neoverse-n1 which
would be accessed by TF-A. Since there is no DSU in Qemu,
CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-id: 20230313033936.585669-1-chenbaozi@phytium.com.cn
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da15..0fb07cc7b6d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "cpregs.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
@@ -1027,6 +1028,72 @@ static void aarch64_a64fx_initfn(Object *obj)
     /* TODO:  Add A64FX specific HPC extension registers */
 }
 
+static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
+    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
+     * (and in particular its system registers).
+     */
+    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
+    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
+static void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
+}
+
 static void aarch64_neoverse_n1_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1094,6 +1161,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
     /* From D5.1 AArch64 PMU register summary */
     cpu->isar.reset_pmcr_el0 = 0x410c3000;
+
+    define_neoverse_n1_cp_reginfo(cpu);
 }
 
 static void aarch64_host_initfn(Object *obj)
-- 
2.34.1


