Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1553665F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudU6-000867-AB
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8h-0001yS-Ts
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8S-0005Q2-VD
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id cv10so5057799pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec0dbY3Lo89Y5jy2prv7uGoDI+hJWJ+BkmpUFqfWdho=;
 b=vVw1Mejzw8+8rdBfVEImJBecz5ij7tUQ0+26Qyi0HP6gjBnPpyZOet0VN6siE3rUnL
 Rr+QOvfdu/5Bq/vHXMwbtiO5NfSChR1c/IH787q26B0jfzQlQxMQhDr0KHAjh/lr5uo0
 wxwQ1/sqkBEsj3/+2qPoya7wQO7iDsf4EfHCV1EoysUOYEwOOlE7objRTgzoMsyh7Zpg
 svmzfzZNPDLy6KMANC5GwHyu4huWS8rBYYiev0hM4k06Z/PaTDiyx0oQ04xSOCV0Gs3n
 59boz+aBWB7hOEVIORQ234vv4/AhNW2v4DHyd5Vwg7/LO8s6NQXAo1EpBF5IQep5T5mY
 d8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec0dbY3Lo89Y5jy2prv7uGoDI+hJWJ+BkmpUFqfWdho=;
 b=oJGl18ZtciadFlmU50ddG6hCa9PwF8O4MX49/fH2r8PV1LxxC7dtAma+RNIf05QTVa
 PmVkyDOdumPUc1/Z0Y9X5OOkaplof4cTRVOrhHAS5NwDtFuvJIJo9XYeggxWCx0+Yh7I
 7Wwg79ijTAOuQCRno+hYU7bXDm1znlE7FuNAss1OwPZT2/nzq9VfztAZdGqE69V5PULO
 shNkgAOBbw/m9VpRAqn0pNN+bYEMtOiz9Vy4IXuld5HcoM5GG7Atf//BBvPcogDXcenB
 q8Yop7GChdnFFMEsHGQpx7kTwW1VnBZRP4ETjwDYcILfMkiz4U69vHakgf0OSL2NVceH
 Lkvg==
X-Gm-Message-State: AOAM530sCojf7mMRloSAFdNBMTFb/fNeu938OctAbJzlZBBBEVgUgQAm
 BypsOU/dL5fqb4MkxSR31x7M4f+n92+L4Q==
X-Google-Smtp-Source: ABdhPJxoqbG9/+x6HEFYbX5mz3Wt9v7w+uGyjvWwyNqO+eDnR7WhIbgEk0COUJokhebE++JK9kh3oQ==
X-Received: by 2002:a17:90b:390b:b0:1df:b3dc:514a with SMTP id
 ob11-20020a17090b390b00b001dfb3dc514amr9361789pjb.25.1653670103653; 
 Fri, 27 May 2022 09:48:23 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 14/17] tests/tcg/m68k: Add trap.c
Date: Fri, 27 May 2022 09:48:04 -0700
Message-Id: <20220527164807.135038-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


