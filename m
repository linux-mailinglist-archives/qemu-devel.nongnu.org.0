Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFA53B151
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:42:52 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZrP-0003Xg-3I
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjN-0002jz-1p
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjJ-0005I9-RJ
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so7975388pju.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec0dbY3Lo89Y5jy2prv7uGoDI+hJWJ+BkmpUFqfWdho=;
 b=y68fsTxszpmTWBuZ1q4Vt43XPX2n+F+Y5PVMLT9hdgrZIbdKBKTJTh3EOu+glZ4BvE
 SDVtKMf9eIO8N6KJaAW/vJN4UlbDiiD57yOhwC30v9UiT8seFdUEBeXik5rXX1GtkRtj
 XP0uQxlr9PJSQ/Emyni4jYTFk3QZlGW6lgAfRHw8mFiNuE7+9myrXpiFEJydxdnpcTC6
 CK6Mt6nKKONw0q4Y79tVFKuocqG9Zh4GfF2THEBdBgFB+nSBSevO7zZA6FXhKORJvoyg
 gdA7uwWlI94U0uUZDVAEu/BtFdHjXEEsUeQzEZ3u5LW/9CF23d02gzWBRgSEkvkDU65E
 hNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec0dbY3Lo89Y5jy2prv7uGoDI+hJWJ+BkmpUFqfWdho=;
 b=i0tzuwxs0hIJrXJTcvDtMMn/yr5o0ZbjXxvuikmP8vLhsx9WdT0kRvU/zKxfH/RjKK
 G2fHFkY/z/pk2YP3lLfGHiNWfjgs/KNeTZUlGkQsKTEW8l2yszbBm4fPKpkMJ32vaujW
 hhQmfJ03j4QgSw+vPIvuV629z4n1tmoyBsp9t95Q5WwYfqmTixUp+FLqW03tO4BBKEss
 mWaa8O6VdWIND1hQh5jfE+FHR41TEcBQb0zoWuPN+Ba/AsgQTrK8KDFxNs8qFcsvPnCX
 tOYkkhAjJZb4lCChRKB6RT+S+drbrPbAMvFpUf/YPjBi0mCk7SczvdA+ccsO1zRbm0Vw
 eR5g==
X-Gm-Message-State: AOAM531C94HaVCV5fmSEb3pELXKkpIKd22cM53SC4ghiJECGFEA1wxrA
 zUmCN5evEBxuFXvmT7bhqgJFoB/kebreyQ==
X-Google-Smtp-Source: ABdhPJzwLwcbj85qUZ86fFjx+vqusgvQGSffdgugfWiMHtw+rj1BglAOPoLteBAm1pL1pNyJSUWgzw==
X-Received: by 2002:a17:90a:5c84:b0:1dc:9b42:f2cf with SMTP id
 r4-20020a17090a5c8400b001dc9b42f2cfmr37258335pji.123.1654133661361; 
 Wed, 01 Jun 2022 18:34:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 14/17] tests/tcg/m68k: Add trap.c
Date: Wed,  1 Jun 2022 18:33:58 -0700
Message-Id: <20220602013401.303699-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Test various trap instructions: chk, div, trap, trapv, trapcc, ftrapcc,
and the signals and addresses that we expect from them.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/m68k/trap.c          | 129 +++++++++++++++++++++++++++++++++
 tests/tcg/m68k/Makefile.target |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 tests/tcg/m68k/trap.c

diff --git a/tests/tcg/m68k/trap.c b/tests/tcg/m68k/trap.c
new file mode 100644
index 0000000000..96cac18d4d
--- /dev/null
+++ b/tests/tcg/m68k/trap.c
@@ -0,0 +1,129 @@
+/*
+ * Test m68k trap addresses.
+ */
+
+#define _GNU_SOURCE 1
+#include <signal.h>
+#include <assert.h>
+#include <limits.h>
+
+static int expect_sig;
+static int expect_si_code;
+static void *expect_si_addr;
+static greg_t expect_mc_pc;
+static volatile int got_signal;
+
+static void sig_handler(int sig, siginfo_t *si, void *puc)
+{
+    ucontext_t *uc = puc;
+    mcontext_t *mc = &uc->uc_mcontext;
+
+    assert(sig == expect_sig);
+    assert(si->si_code == expect_si_code);
+    assert(si->si_addr == expect_si_addr);
+    assert(mc->gregs[R_PC] == expect_mc_pc);
+
+    got_signal = 1;
+}
+
+#define FMT_INS     [ad] "a"(&expect_si_addr), [pc] "a"(&expect_mc_pc)
+#define FMT0_STR(S) \
+    "move.l #1f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
+#define FMT2_STR(S) \
+    "move.l #0f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
+
+#define CHECK_SIG   do { assert(got_signal); got_signal = 0; } while (0)
+
+int main(int argc, char **argv)
+{
+    struct sigaction act = {
+        .sa_sigaction = sig_handler,
+        .sa_flags = SA_SIGINFO
+    };
+    int t0, t1;
+
+    sigaction(SIGILL, &act, NULL);
+    sigaction(SIGTRAP, &act, NULL);
+    sigaction(SIGFPE, &act, NULL);
+
+    expect_sig = SIGFPE;
+    expect_si_code = FPE_INTOVF;
+    asm volatile(FMT2_STR("0:\tchk %0, %1") : : "d"(0), "d"(-1), FMT_INS);
+    CHECK_SIG;
+
+#if 0
+    /* FIXME: chk2 not correctly translated. */
+    int bounds[2] = { 0, 1 };
+    asm volatile(FMT2_STR("0:\tchk2.l %0, %1")
+                 : : "m"(bounds), "d"(2), FMT_INS);
+    CHECK_SIG;
+#endif
+
+    asm volatile(FMT2_STR("cmp.l %0, %1\n0:\ttrapv")
+                 : : "d"(INT_MIN), "d"(1), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.w #0x1234")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.l #0x12345678")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("fcmp.x %0, %0\n0:\tftrapeq")
+                 : : "f"(0.0L), FMT_INS);
+    CHECK_SIG;
+
+    expect_si_code = FPE_INTDIV;
+
+    asm volatile(FMT2_STR("0:\tdivs.w %1, %0")
+                 : "=d"(t0) : "d"(0), "0"(1), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("0:\tdivsl.l %2, %1:%0")
+                 : "=d"(t0), "=d"(t1) : "d"(0), "0"(1), FMT_INS);
+    CHECK_SIG;
+
+    expect_sig = SIGILL;
+    expect_si_code = ILL_ILLTRP;
+    asm volatile(FMT0_STR("trap #1") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #2") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #3") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #4") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #5") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #6") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #7") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #8") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #9") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #10") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #11") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #12") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #13") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #14") : : FMT_INS);
+    CHECK_SIG;
+
+    expect_sig = SIGTRAP;
+    expect_si_code = TRAP_BRKPT;
+    asm volatile(FMT0_STR("trap #15") : : FMT_INS);
+    CHECK_SIG;
+
+    return 0;
+}
diff --git a/tests/tcg/m68k/Makefile.target b/tests/tcg/m68k/Makefile.target
index 62f109eef4..1163c7ef03 100644
--- a/tests/tcg/m68k/Makefile.target
+++ b/tests/tcg/m68k/Makefile.target
@@ -3,5 +3,8 @@
 # m68k specific tweaks - specifically masking out broken tests
 #
 
+VPATH += $(SRC_PATH)/tests/tcg/m68k
+TESTS += trap
+
 # On m68k Linux supports 4k and 8k pages (but 8k is currently broken)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-8192
-- 
2.34.1


