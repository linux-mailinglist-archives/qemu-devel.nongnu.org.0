Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013744DAA56
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:07:38 +0100 (CET)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMor-00009a-3a
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:07:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgU-0002ik-7k
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:58 -0400
Received: from [2607:f8b0:4864:20::435] (port=41884
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgS-0006U5-IQ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:57 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so2523499pfh.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iKqCq5gnBEuV7yETH5boxm9MvdrrB2fADfIX32vfoE=;
 b=wO35ImkL7UGqvRCNK5zbCHxn7DFO9syy/34zn+WfJxSB0UR0vmnBhNNTEwAl9BsRKj
 ZhmZWy6r3yxLPOWd6YNeYzYGR/rHQ7m2ffgLktSJbVbO8U6Dd6EW/Qbe0Qm5dwvnqKrq
 COD1wYm9lYhkTkhMfqTfNggZc20v2Z/GNhaUOIbuR6hlJOMnNvg85xZTgrnw2SHqYn1l
 OJ20rLtEtVK7siS+6RIcKLdH79Tbs+beNgH0XThiZtuaEI4hO61Ui7q5c46zf/r71MWW
 Ac+wHsttBODRLAqPiQisvHbjwV8wyJWRr8d6j0z7zEKjWxkNDCUbszqzNoLI+7ZxxbBY
 5Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1iKqCq5gnBEuV7yETH5boxm9MvdrrB2fADfIX32vfoE=;
 b=uzeeMnz5EZiUBpwGspFUeS9pvj88Y/rjn1ndtvSI1tTYOu2seLqxUMC929iJDgT2Lb
 +nkgliZgLrWvaJ8txTSO1avJfMp+Ssy8oXKsVLMs+t/LghvSbPFUntKylkYLxozkLUaY
 6Sg93j7UjFJiZzRpf/w4JxsUMNrrwFyTBpW7BIHC4junl4vsdH8gM4leBQ32tDgeqy93
 AKtpyet+F9Cdxm8irMm/iHR2bdcBphwMkmO/tGTYBUmfTmMnutC4z+IR8C5ydyIYH8CH
 JGLy/mjvyMLY6H8tZjdIkaCbJONmvsaR3N7vDw+AAs90Vv0YOJSS8sNZRzojoI3KjbbG
 hJSg==
X-Gm-Message-State: AOAM530/Wd5r0Ht/NVYpGzORN/w6dqXKn6+s+zTVMTtJBqlAuq+9BCiY
 onnoK7vFOfTR4EiAFZylUt5HkNao5KR3XQ==
X-Google-Smtp-Source: ABdhPJxf8vrnPgiAEXYiwlDoyii5fTxIQuJhRfDygVfgBpxkcCZoZCv0QpdYN+4E3Ieycq4MnV4LJg==
X-Received: by 2002:a63:7cb:0:b0:380:f89f:c9a2 with SMTP id
 194-20020a6307cb000000b00380f89fc9a2mr23383684pgh.264.1647410335389; 
 Tue, 15 Mar 2022 22:58:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/17] tests/tcg/m68k: Add trap.c
Date: Tue, 15 Mar 2022 22:58:37 -0700
Message-Id: <20220316055840.727571-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
2.25.1


