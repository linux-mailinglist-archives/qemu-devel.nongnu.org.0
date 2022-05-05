Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282551BBBF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:18:24 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXct-0003BU-0Z
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWc-0004nD-U5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWa-00039c-7Z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:11:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b19so5210540wrh.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qfuC15wVhgbtf/sFl4PEa+tcmWHsuyafqPjoww1w/hI=;
 b=dVV/E+RuyBmbbozQCgqG39EvJV5ONedx5ZNcjcYqt1bu6pEXRzWzwcb5iAZin8KuNz
 zGTyj8GjHdzQ9z39ESlBP7QGKZe/D93O7aZokGkE7BfRdYAEu32RDnVpCg9aZDqFI9cM
 Ww4/+Y1DqXvrfBQZz+4CAX3iD4tGYg6zCLQp4SPWNJ+znFMj6wsBIRdxTYDa/8pm3001
 94pD3T37VtL7tph0mcPs5RZMBkE/Fm1ZpEzc0ShC2v/tNMXaiqNKaak8/bV7rrzepQqP
 54qYbud/cf6uVUaCjWOfd5fzfBNJnO5Sh9wLCz+36hlrPJmaehVjtv8xWEBbgqaqRFnX
 7K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfuC15wVhgbtf/sFl4PEa+tcmWHsuyafqPjoww1w/hI=;
 b=t0iD/yGMDd0i3KNVex36oGNSAQfbKdZc19bJOAW5otZhJ+sIpHZTn2ig3d+xTGjrpD
 w7CtopteDS8uxA4151zx+GAZqsowDKHAkFccN+MKDY/MEm3VNo3lJllifB4c1HgqFRv9
 JSbL8h11EvKTrTBOjqSRmuXdjwbt6ySBmuQqtRH86dDcaX0lQRVx+sbfntCW4mWhiQv9
 wXjyVZYkK9p0ggoeLHBq3rxoPEJte6QlHKMtAmUYXpJezO3w/OgO/ZYc4z+YAMEaGp9N
 uRrILrEc+sZV85xVOPOonLSyoARUFyvwNQlSQ9PCdmrVh/mTyWwhiggA0ZLBgZdGqrSk
 57bA==
X-Gm-Message-State: AOAM5338WNSwugxp6bKPVSPt3uOPCsUrNkhiiadf+ZWsZ76C4Onshp9f
 yiCpHLESQI+XPWPDfQn0EtLrBA64Fewf7w==
X-Google-Smtp-Source: ABdhPJy0aoHLOgEIOrxcA4PcgTcjuOCXvGEZlwQJepRL9b7ejgUDAgMhV7Mokxrad7UcilzghaQNbA==
X-Received: by 2002:a5d:4ac2:0:b0:20c:7844:fb79 with SMTP id
 y2-20020a5d4ac2000000b0020c7844fb79mr8647245wrs.33.1651741910669; 
 Thu, 05 May 2022 02:11:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
Date: Thu,  5 May 2022 10:11:25 +0100
Message-Id: <20220505091147.2657652-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
(indirect branch from register other than x16/x17).  The linux kernel
sets this in bti_enable().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220427042312.294300-1-richard.henderson@linaro.org
[PMM: remove stray change to makefile comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c                  |  2 ++
 tests/tcg/aarch64/bti-3.c         | 42 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  6 ++---
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-3.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e46a766d770..2b81b18351a 100644
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
index 00000000000..a852856d9a6
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
index 6ad0ad49f98..d6a74d24dc0 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -28,9 +28,9 @@ endif
 # BTI Tests
 # bti-1 tests the elf notes, so we require special compiler support.
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
2.25.1


