Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E9515FCB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:13:37 +0200 (CEST)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrb6-0006TH-FR
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI8-0004ju-Pt
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI6-00083x-0l
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:59 -0400
Received: by mail-pj1-x1036.google.com with SMTP id iq10so9630259pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oS4SpFhfIqgKlDgeO+bhyHZ/w+64dvw7Bn99nQxMQ8M=;
 b=sSQ+qxw4sxR4Tq4xNrN+yDVF70mhF4yfFSx2hrNb5lY406SF1632DP0Q9eTVWjdLCv
 tyXIYSP4l4V3Xj1Q5MbR+wFUzquaYxr1Wz2IdZ0e66Qi0RU5gT19kWuVyI1rvI5UPjPB
 T6GEGoy4S8jrPs8nReKuYXXjjfYEgKjYpAHzTkN1A8bW1HP6dhu8MKkTt/u23CWt/sLz
 vXGCYTsDkGI4D7lw2p82dMluwPOP78+C9HIN3VStlsN9QnjZIRjxArBafIg3CuEHJD2G
 RetBZnMr/0Csd7pGfK6U9tPxSJbH4ZZ9eH6SKJSM1XAB31KZXnGyllnIvGYImwAyrUdj
 tuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oS4SpFhfIqgKlDgeO+bhyHZ/w+64dvw7Bn99nQxMQ8M=;
 b=qvsoT3fQF0AMvJ4yz0ide1CbvJSrFVU6OkSkTRcYUw0hPWuaO+3nLywvsgfU7yngXR
 2quqGTmZBJ6nlQjDi/rEGnBFfwMXdzzKoXdQggtH9VNECl3DkdIfdl/YwdAQIiTD7/bq
 ux3UrbMQtLXOR99+qYsBz39DMaKTO6aessdYelzLtYsgpmh+B1Gmvb1dLKOZE1cmbf5U
 CxJVbWzv5MBNB6FOD80jPJQg1c0ecZcni1mUKCGH3/mR3/CHuqWhTcwNU5O8AOoxdW7i
 EY0eA1dVnTsSmSUJQ/o8KiR+KBqX7Hx7F2s6DQAS0fJdmnvgwG4tiOAAaiMs5XphGWLC
 /EiQ==
X-Gm-Message-State: AOAM53282KpYmhf/Hu9byIS8sssf/vwkRmG6GsNtw/1/sFW9y2RAgyOe
 NNQPt1J88s3KLzgsz2JjRYBaOmR5MD2gcg==
X-Google-Smtp-Source: ABdhPJwgqZn3HjbQrD3WuAGE4GTgMcUy//bMNaFTcKF7h4ikytgHQhijC5xHYhBZ7RlqOLatc0cbGQ==
X-Received: by 2002:a17:902:d5ce:b0:158:48db:9719 with SMTP id
 g14-20020a170902d5ce00b0015848db9719mr4713419plh.7.1651341236742; 
 Sat, 30 Apr 2022 10:53:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/17] tests/tcg/m68k: Add trap.c
Date: Sat, 30 Apr 2022 10:53:39 -0700
Message-Id: <20220430175342.370628-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test various trap instructions: chk, div, trap, trapv, trapcc, ftrapcc,
and the signals and addresses that we expect from them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/m68k/trap.c          | 129 +++++++++++++++++++++++++++++++++
 tests/tcg/m68k/Makefile.target |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 tests/tcg/m68k/trap.c

diff --git a/tests/tcg/m68k/trap.c b/tests/tcg/m68k/trap.c
new file mode 100644
index 0000000000..08ab56b2ca
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
+    expect_si_code = ILL_ILLOPN;
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


