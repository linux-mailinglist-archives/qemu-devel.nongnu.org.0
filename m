Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4CB5A9091
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:41:08 +0200 (CEST)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTep1-0000BW-Dh
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4l-0006VG-1w
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4h-0003Qo-C4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b16so13387874wru.7
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ma8Zb7C/D5E9n4vs/B/KW4yUla4VOnseIE7w6pS63kM=;
 b=hE1H8+CkoACrOEG4RxH9Jvgs+UYZjHeHHCr5p1EptLcFk4uM7/Cvok7q+PtJE87ryY
 awjCqegciBk8cmygW4Fiqu3EoN5kFHi8+XLAESP1E0clk6QI7/eEII4/g+JVco+ILteF
 i4TcDROGb8PSGHbUFxDaZxK+CreT9Jt9HhIkOMhHITIs3tMYuxDffCBnPXvN60lePtmP
 b7xiqi2b7pPDxoYWc6ZM6gQUjhD55GwCksS2cGvLfgHaiZoVcObG1dWWTl1BsvHzqT1I
 Lvyn1s5VOroHmSEouKaeMnvPXLRnpjhmOwDJO1mzVVwcFvDPWas1wO+y1ejJW8jDzbPP
 IoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ma8Zb7C/D5E9n4vs/B/KW4yUla4VOnseIE7w6pS63kM=;
 b=Urkp8sxhmkPvRCwTsBSjH7McSDwddrZRzDUgdrNl/tyOzOgCYpq9jGaNJVJgKO5UZR
 TEeVs1fZZdiNFZr2m6rJQx9Z6VdZSeWGZttBwrhRtyyPAGsjwTWWQEAWF64wVGhxf4Nv
 FjxWpP1qHJMPXC1dNp2kMONfFKgWzDRHO0DX0WZjxGFRQCwObQoIfYIBUQF5cqaLw52C
 Ijo/BLC6o9i8yvJHSgBPSxNrIxUxRNvyqFrgNc1SJqysfBO3Hah41IiiPpH6cxVO/t/r
 usC93xbd7RFRFYvZ1c2P6OkUvP3U1zq38nsn8zrO+yl3BiSpscrmMGQFl1AzwRiPZI4P
 uGpg==
X-Gm-Message-State: ACgBeo3j09SK1xPT7xHipcdAarw4xJViX6OnR4QF3+USYAzOVAFH1DA+
 ib7c2JscJf4Hp83wK36hBaQq7b2OPM/uxDks
X-Google-Smtp-Source: AA6agR52AEXHfZn8s2AijW5gQxT+u0bDmOFoN9Xr0elGcDAcqcAds6hybdOsQ2k/XK1/mrJni4GrBw==
X-Received: by 2002:a5d:47c9:0:b0:226:eb05:ecbc with SMTP id
 o9-20020a5d47c9000000b00226eb05ecbcmr4016671wrc.74.1662015194034; 
 Wed, 31 Aug 2022 23:53:14 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 17/20] target/s390x: Make translator stop before the end of a
 page
Date: Thu,  1 Sep 2022 07:52:07 +0100
Message-Id: <20220901065210.117081-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220817150506.592862-3-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c     |  15 +++-
 tests/tcg/s390x/noexec.c         | 106 +++++++++++++++++++++++
 tests/tcg/multiarch/noexec.c.inc | 139 +++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 4 files changed, 257 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/multiarch/noexec.c.inc

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d4c0b9b3a2..1d2dddab1c 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6609,6 +6609,14 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
     dc->insn_start = tcg_last_op();
 }
 
+static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
+                                uint64_t pc)
+{
+    uint64_t insn = ld_code2(env, s, pc);
+
+    return pc + get_ilen((insn >> 8) & 0xff);
+}
+
 static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     CPUS390XState *env = cs->env_ptr;
@@ -6616,10 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     dc->base.is_jmp = translate_one(env, dc);
     if (dc->base.is_jmp == DISAS_NEXT) {
-        uint64_t page_start;
-
-        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
-        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
+        if (!is_same_page(dcbase, dc->base.pc_next) ||
+            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
+            dc->ex_value) {
             dc->base.is_jmp = DISAS_TOO_MANY;
         }
     }
diff --git a/tests/tcg/s390x/noexec.c b/tests/tcg/s390x/noexec.c
new file mode 100644
index 0000000000..15d007d07f
--- /dev/null
+++ b/tests/tcg/s390x/noexec.c
@@ -0,0 +1,106 @@
+#include "../multiarch/noexec.c.inc"
+
+static void *arch_mcontext_pc(const mcontext_t *ctx)
+{
+    return (void *)ctx->psw.addr;
+}
+
+static int arch_mcontext_arg(const mcontext_t *ctx)
+{
+    return ctx->gregs[2];
+}
+
+static void arch_flush(void *p, int len)
+{
+}
+
+extern char noexec_1[];
+extern char noexec_2[];
+extern char noexec_end[];
+
+asm("noexec_1:\n"
+    "   lgfi %r2,1\n"       /* %r2 is 0 on entry, set 1. */
+    "noexec_2:\n"
+    "   lgfi %r2,2\n"       /* %r2 is 0/1; set 2. */
+    "   br %r14\n"          /* return */
+    "noexec_end:");
+
+extern char exrl_1[];
+extern char exrl_2[];
+extern char exrl_end[];
+
+asm("exrl_1:\n"
+    "   exrl %r0, exrl_2\n"
+    "   br %r14\n"
+    "exrl_2:\n"
+    "   lgfi %r2,2\n"
+    "exrl_end:");
+
+int main(void)
+{
+    struct noexec_test noexec_tests[] = {
+        {
+            .name = "fallthrough",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = noexec_1 - noexec_2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2,
+            .entry_ofs = 0,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = 0,
+            .expected_arg = 0,
+        },
+        {
+            .name = "exrl",
+            .test_code = exrl_1,
+            .test_len = exrl_end - exrl_1,
+            .page_ofs = exrl_1 - exrl_2,
+            .entry_ofs = exrl_1 - exrl_2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = exrl_1 - exrl_2,
+            .expected_arg = 0,
+        },
+        {
+            .name = "fallthrough [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = noexec_1 - noexec_2 - 2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 1,
+        },
+        {
+            .name = "jump [cross]",
+            .test_code = noexec_1,
+            .test_len = noexec_end - noexec_1,
+            .page_ofs = noexec_1 - noexec_2 - 2,
+            .entry_ofs = -2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = -2,
+            .expected_arg = 0,
+        },
+        {
+            .name = "exrl [cross]",
+            .test_code = exrl_1,
+            .test_len = exrl_end - exrl_1,
+            .page_ofs = exrl_1 - exrl_2 - 2,
+            .entry_ofs = exrl_1 - exrl_2 - 2,
+            .expected_si_ofs = 0,
+            .expected_pc_ofs = exrl_1 - exrl_2 - 2,
+            .expected_arg = 0,
+        },
+    };
+
+    return test_noexec(noexec_tests,
+                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
+}
diff --git a/tests/tcg/multiarch/noexec.c.inc b/tests/tcg/multiarch/noexec.c.inc
new file mode 100644
index 0000000000..2ef539b721
--- /dev/null
+++ b/tests/tcg/multiarch/noexec.c.inc
@@ -0,0 +1,139 @@
+/*
+ * Common code for arch-specific MMU_INST_FETCH fault testing.
+ */
+
+#define _GNU_SOURCE
+
+#include <assert.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/ucontext.h>
+
+/* Forward declarations. */
+
+static void *arch_mcontext_pc(const mcontext_t *ctx);
+static int arch_mcontext_arg(const mcontext_t *ctx);
+static void arch_flush(void *p, int len);
+
+/* Testing infrastructure. */
+
+struct noexec_test {
+    const char *name;
+    const char *test_code;
+    int test_len;
+    int page_ofs;
+    int entry_ofs;
+    int expected_si_ofs;
+    int expected_pc_ofs;
+    int expected_arg;
+};
+
+static void *page_base;
+static int page_size;
+static const struct noexec_test *current_noexec_test;
+
+static void handle_err(const char *syscall)
+{
+    printf("[  FAILED  ] %s: %s\n", syscall, strerror(errno));
+    exit(EXIT_FAILURE);
+}
+
+static void handle_segv(int sig, siginfo_t *info, void *ucontext)
+{
+    const struct noexec_test *test = current_noexec_test;
+    const mcontext_t *mc = &((ucontext_t *)ucontext)->uc_mcontext;
+    void *expected_si;
+    void *expected_pc;
+    void *pc;
+    int arg;
+
+    if (test == NULL) {
+        printf("[  FAILED  ] unexpected SEGV\n");
+        exit(EXIT_FAILURE);
+    }
+    current_noexec_test = NULL;
+
+    expected_si = page_base + test->expected_si_ofs;
+    if (info->si_addr != expected_si) {
+        printf("[  FAILED  ] wrong si_addr (%p != %p)\n",
+               info->si_addr, expected_si);
+        exit(EXIT_FAILURE);
+    }
+
+    pc = arch_mcontext_pc(mc);
+    expected_pc = page_base + test->expected_pc_ofs;
+    if (pc != expected_pc) {
+        printf("[  FAILED  ] wrong pc (%p != %p)\n", pc, expected_pc);
+        exit(EXIT_FAILURE);
+    }
+
+    arg = arch_mcontext_arg(mc);
+    if (arg != test->expected_arg) {
+        printf("[  FAILED  ] wrong arg (%d != %d)\n", arg, test->expected_arg);
+        exit(EXIT_FAILURE);
+    }
+
+    if (mprotect(page_base, page_size,
+                 PROT_READ | PROT_WRITE | PROT_EXEC) < 0) {
+        handle_err("mprotect");
+    }
+}
+
+static void test_noexec_1(const struct noexec_test *test)
+{
+    void *start = page_base + test->page_ofs;
+    void (*fn)(int arg) = page_base + test->entry_ofs;
+
+    memcpy(start, test->test_code, test->test_len);
+    arch_flush(start, test->test_len);
+
+    /* Trigger TB creation in order to test invalidation. */
+    fn(0);
+
+    if (mprotect(page_base, page_size, PROT_NONE) < 0) {
+        handle_err("mprotect");
+    }
+
+    /* Trigger SEGV and check that handle_segv() ran. */
+    current_noexec_test = test;
+    fn(0);
+    assert(current_noexec_test == NULL);
+}
+
+static int test_noexec(struct noexec_test *tests, size_t n_tests)
+{
+    struct sigaction act;
+    size_t i;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_segv;
+    act.sa_flags = SA_SIGINFO;
+    if (sigaction(SIGSEGV, &act, NULL) < 0) {
+        handle_err("sigaction");
+    }
+
+    page_size = getpagesize();
+    page_base = mmap(NULL, 2 * page_size,
+                     PROT_READ | PROT_WRITE | PROT_EXEC,
+                     MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+    if (page_base == MAP_FAILED) {
+        handle_err("mmap");
+    }
+    page_base += page_size;
+
+    for (i = 0; i < n_tests; i++) {
+        struct noexec_test *test = &tests[i];
+
+        printf("[ RUN      ] %s\n", test->name);
+        test_noexec_1(test);
+        printf("[       OK ]\n");
+    }
+
+    printf("[  PASSED  ]\n");
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7a4a2f59..5e13a41c3f 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -16,6 +16,7 @@ TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
+TESTS+=noexec
 
 Z14_TESTS=vfminmax
 vfminmax: LDFLAGS+=-lm
-- 
2.34.1


