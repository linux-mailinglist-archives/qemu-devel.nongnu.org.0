Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3C351101D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:26:22 +0200 (CEST)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZFs-00020N-E7
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZD3-00014c-6n
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:23:25 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZCw-0004pt-Bq
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:23:21 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fv2so428031pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRHn2mdN0R0av8YyHUzJgxZG/sPCJkq9JFL0TZYgnqQ=;
 b=Gq2SusrUeJPU7fI4BBK7yWivjCeTz9Rpm1knngsr/kmYtGTmrzeWvi5o31VHPEyi2U
 +2gmxMFNsAUwRL+OJJnjAxz+zdGYeJLkB797gSeeTRjf4eKDLzRD1jcm2I9TTOSfyJ4E
 pkpCqpl9OE0EoSfSUs943xilkOU+uG0a8wiSRBC71E5bry4yDRwHadKcWAyeIuuNKTHY
 UVYfyXlTTinXRVJRptaVB1hBOm38jOc5BrwAcbwRdN6bF6clONABiAtPa3WgvyjURIJA
 SsbvzCglVn9yWhzbuFr4H0rjhfJX9Vlzk/kMqTZs9SHxr60eyQHeec5o4aMEDD0t36F5
 /hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRHn2mdN0R0av8YyHUzJgxZG/sPCJkq9JFL0TZYgnqQ=;
 b=8PGgBsZVew0RrxxdN7z3Q8TiO+s8cvbEvnCK3Ps2X1Ij+Npd0+DHDFT7ZhzlAaAM/t
 1cdXsNB5rWGuZVOy2UWfZPzW/Z1HIRfeYIJkCER4TVSgzg3+O1zicHPHgBcMvWTDSnMi
 Nl+vK7wTFhg2RKwGDijzSM3K5HmyoWn8KA8bbzSuuIUvacoip5L50EBG9U4NjzbYzHaO
 KYfss8soSKwyS8POTypT9HwhkRwhnTUif7enUq2Uqu9Pywg+YmDlIANjwAC26A2ZjQ2T
 6LmgtcyAN3CDXGgksH7TacVcjHTAobTclVnvcX2n9ncRwc3gxBSD9BWjIN2jSgOf64vx
 P22A==
X-Gm-Message-State: AOAM531//9BMV6CD3XIc+XFcYe4OmUCos8kldKdJyTKynbK7d5DD3q0v
 VxE4R4F0XYUQMr49DbguYJ6Z2x0Gb+sAWQ==
X-Google-Smtp-Source: ABdhPJyPY1Ls6ZRb2J+9jX/qqJXtlIR14VfTZQcBDfD6SrLoQukPn/XAf1xiKEzMBgk7V9qHoOYyXw==
X-Received: by 2002:a17:90a:ba15:b0:1cb:be7d:bbca with SMTP id
 s21-20020a17090aba1500b001cbbe7dbbcamr41341075pjr.143.1651033393867; 
 Tue, 26 Apr 2022 21:23:13 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 iy19-20020a17090b16d300b001cd4989fee6sm4846064pjb.50.2022.04.26.21.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
Date: Tue, 26 Apr 2022 21:23:12 -0700
Message-Id: <20220427042312.294300-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
(indirect branch from register other than x16/x17).  The linux kernel
sets this in bti_enable().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c                  |  2 ++
 tests/tcg/aarch64/bti-3.c         | 42 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  8 +++---
 3 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-3.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..c50a8dca0b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -197,6 +197,8 @@ static void arm_cpu_reset(DeviceState *dev)
         /* Enable all PAC keys.  */
         env->cp15.sctlr_el[1] |= (SCTLR_EnIA | SCTLR_EnIB |
                                   SCTLR_EnDA | SCTLR_EnDB);
+        /* Trap on btype=3 for PACIxSP. */
+        env->cp15.sctlr_el[1] |= SCTLR_BT0;
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
new file mode 100644
index 0000000000..a852856d9a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-3.c
@@ -0,0 +1,42 @@
+/*
+ * BTI vs PACIASP
+ */
+
+#include "bti-crt.inc.c"
+
+static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
+{
+    uc->uc_mcontext.pc += 8;
+    uc->uc_mcontext.pstate = 1;
+}
+
+#define BTYPE_1() \
+    asm("mov %0,#1; adr x16, 1f; br x16; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_2() \
+    asm("mov %0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_3() \
+    asm("mov %0,#1; adr x15, 1f; br x15; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x15", "x30")
+
+#define TEST(WHICH, EXPECT) \
+    do { WHICH(); fail += skipped ^ EXPECT; } while (0)
+
+int main()
+{
+    int fail = 0;
+    int skipped;
+
+    /* Signal-like with SA_SIGINFO.  */
+    signal_info(SIGILL, skip2_sigill);
+
+    /* With SCTLR_EL1.BT0 set, PACIASP is not compatible with type=3. */
+    TEST(BTYPE_1, 0);
+    TEST(BTYPE_2, 0);
+    TEST(BTYPE_3, 1);
+
+    return fail;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6ad0ad49f9..a738eb137c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
 # BTI Tests
-# bti-1 tests the elf notes, so we require special compiler support.
+# bti-1 test the elf notes, so we require special compiler support.
 ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
-AARCH64_TESTS += bti-1
-bti-1: CFLAGS += -mbranch-protection=standard
-bti-1: LDFLAGS += -nostdlib
+AARCH64_TESTS += bti-1 bti-3
+bti-1 bti-3: CFLAGS += -mbranch-protection=standard
+bti-1 bti-3: LDFLAGS += -nostdlib
 endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
 AARCH64_TESTS += bti-2
-- 
2.34.1


