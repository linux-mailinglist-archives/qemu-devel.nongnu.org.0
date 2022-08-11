Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF1C58FA62
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:03:22 +0200 (CEST)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM529-0002RE-UE
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4v1-0002CF-On; Thu, 11 Aug 2022 05:55:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4uz-0002gB-FN; Thu, 11 Aug 2022 05:55:59 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9d0sv009954;
 Thu, 11 Aug 2022 09:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rtgOdwlKL84LDuedjqddt8Q60nUJ68iFlIH3jXbWdN4=;
 b=dznBF8okbBQt8wP9Big/kpi8bcdRFCaa1fYAwS2YBzJYfc3C74ry4FmGqpHoGna1Dy+5
 LVljXhMFiWhM+xPNwoEDL9BG4nQ1bcV/+JTIcHTebalh2iSWIKZ6tS3F+MKiALY57YWa
 vZeYlj7260ZXDugKIWS8ZDWS2PYlN0KW0zZ9JVIbG7tsPjc95SnPiK6gsPtEaTPtKrPo
 kOGZeIdI1DpLpQRJ6bIiYHYrHZghruYojVOJFljJoF5uOa3QRHPoIQOH9hi1hbCTO0iw
 17qvwwcHtZnVM9xjGvM/WKJKOsZiaVbmV1gbc8f0djQiJDqcrlg8h4hk5ugrXF5WhpbD TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvvtqwfju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9e6iJ019558;
 Thu, 11 Aug 2022 09:55:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvvtqwfj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9p5YX031818;
 Thu, 11 Aug 2022 09:55:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3huwvf1uhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27B9tduH29425982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FA20A404D;
 Thu, 11 Aug 2022 09:55:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70B74A4040;
 Thu, 11 Aug 2022 09:55:38 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:55:38 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 5/5] tests/tcg: Test siginfo_t contents when jumping to
 non-readable pages
Date: Thu, 11 Aug 2022 11:55:34 +0200
Message-Id: <20220811095534.241224-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811095534.241224-1-iii@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c0vTB7Qxn3mQt0jY0WYxfo4_vQZXuTTh
X-Proofpoint-GUID: e3kt17i47tNexmBsnumuZhdggnHtZh_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110027
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add x86_64 and s390x tests to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 5 files changed, 378 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

diff --git a/tests/tcg/multiarch/noexec.h b/tests/tcg/multiarch/noexec.h
new file mode 100644
index 0000000000..a76e0aa9ea
--- /dev/null
+++ b/tests/tcg/multiarch/noexec.h
@@ -0,0 +1,114 @@
+/*
+ * Common code for arch-specific MMU_INST_FETCH fault testing.
+ *
+ * Declare struct arch_noexec_test before including this file and define
+ * arch_check_mcontext() after that.
+ */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/ucontext.h>
+#include <unistd.h>
+
+/* Forward declarations. */
+
+static void arch_check_mcontext(const struct arch_noexec_test *test,
+                                const mcontext_t *ctx);
+
+/* Utility functions. */
+
+static void safe_print(const char *s)
+{
+    write(0, s, strlen(s));
+}
+
+static void safe_puts(const char *s)
+{
+    safe_print(s);
+    safe_print("\n");
+}
+
+#define PAGE_ALIGN(p) (void *)((unsigned long)(p) & ~0xfffUL)
+
+/* Testing infrastructure. */
+
+struct noexec_test {
+    const char *name;
+    void (*func)(int);
+    void *page;
+    void *expected_si_addr;
+    struct arch_noexec_test arch;
+};
+
+static const struct noexec_test *current_noexec_test;
+
+static void handle_segv(int sig, siginfo_t *info, void *ucontext)
+{
+    int err;
+
+    if (current_noexec_test == NULL) {
+        safe_puts("[  FAILED  ] unexpected SEGV");
+        _exit(1);
+    }
+
+    if (info->si_addr != current_noexec_test->expected_si_addr) {
+        safe_puts("[  FAILED  ] wrong si_addr");
+        _exit(1);
+    }
+
+    arch_check_mcontext(&current_noexec_test->arch,
+                        &((ucontext_t *)ucontext)->uc_mcontext);
+
+    err = mprotect(current_noexec_test->page, 0x1000, PROT_READ | PROT_EXEC);
+    if (err != 0) {
+        safe_puts("[  FAILED  ] mprotect() failed");
+        _exit(1);
+    }
+
+    current_noexec_test = NULL;
+}
+
+static void test_noexec_1(const struct noexec_test *test)
+{
+    int ret;
+
+    /* Trigger TB creation in order to test invalidation. */
+    test->func(0);
+
+    ret = mprotect(test->page, 0x1000, PROT_NONE);
+    assert(ret == 0);
+
+    /* Trigger SEGV and check that handle_segv() ran. */
+    current_noexec_test = test;
+    test->func(0);
+    assert(current_noexec_test == NULL);
+}
+
+static int test_noexec(struct noexec_test *tests, size_t n_tests)
+{
+    struct sigaction act;
+    size_t i;
+    int err;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_segv;
+    act.sa_flags = SA_SIGINFO;
+    err = sigaction(SIGSEGV, &act, NULL);
+    assert(err == 0);
+
+    for (i = 0; i < n_tests; i++) {
+        struct noexec_test *test = &tests[i];
+
+        safe_print("[ RUN      ] ");
+        safe_puts(test->name);
+        test_noexec_1(test);
+        safe_puts("[       OK ]");
+    }
+
+    safe_puts("[  PASSED  ]");
+
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
diff --git a/tests/tcg/s390x/noexec.c b/tests/tcg/s390x/noexec.c
new file mode 100644
index 0000000000..2dfc9ee817
--- /dev/null
+++ b/tests/tcg/s390x/noexec.c
@@ -0,0 +1,145 @@
+#define _GNU_SOURCE
+
+struct arch_noexec_test {
+    void *expected_pswa;
+    unsigned long expected_r2;
+};
+
+#include "../multiarch/noexec.h"
+
+static void arch_check_mcontext(const struct arch_noexec_test *test,
+                                const mcontext_t *ctx) {
+    if (ctx->psw.addr != (unsigned long)test->expected_pswa) {
+        safe_puts("[  FAILED  ] wrong psw.addr");
+        _exit(1);
+    }
+
+    if (ctx->gregs[2] != test->expected_r2) {
+        safe_puts("[  FAILED  ] wrong r2");
+        _exit(1);
+    }
+}
+
+#define DEFINE_NX(name, offset) \
+    void name ## _1(int); \
+    void name ## _2(int); \
+    void name ## _exrl(int); \
+    extern const short name ## _end[]; \
+    asm(/* Go to the specified page offset. */ \
+        ".align 0x1000\n" \
+        ".org .+" #offset "\n" \
+        /* %r2 is 0 on entry, overwrite it with 1. */ \
+        ".globl " #name "_1\n" \
+        #name "_1:\n" \
+        ".cfi_startproc\n" \
+        "lgfi %r2,1\n" \
+        /* Overwrite %2 with 2. */ \
+        ".globl " #name "_2\n" \
+        #name "_2:\n" \
+        "lgfi %r2,2\n" \
+        "br %r14\n" \
+        /* End of code. */ \
+        ".globl " #name "_end\n" \
+        #name "_end:\n" \
+        ".cfi_endproc\n" \
+        /* Go to the next page. */ \
+        ".align 0x1000\n" \
+        /* Break alignment. */ \
+        "nopr %r7\n" \
+        ".globl " #name "_exrl\n" \
+        #name "_exrl:\n" \
+        ".cfi_startproc\n" \
+        "exrl %r0," #name "_2\n" \
+        "br %r14\n" \
+        ".cfi_endproc");
+
+/* noexec_1 is executable, noexec_2 is non-executable. */
+DEFINE_NX(noexec, 0xffa);
+
+/*
+ * noexec_cross_1 is executable, noexec_cross_2 crosses non-executable page
+ * boundary.
+ */
+DEFINE_NX(noexec_cross, 0xff8);
+
+/* noexec_full_1 and noexec_full_2 are non-executable. */
+DEFINE_NX(noexec_full, 0x322);
+
+int main(void)
+{
+    struct noexec_test noexec_tests[] = {
+        {
+            .name = "Fallthrough",
+            .func = noexec_1,
+            .page = noexec_2,
+            .expected_si_addr = noexec_2,
+            .arch = {
+                .expected_pswa = noexec_2,
+                .expected_r2 = 1,
+            },
+        },
+        {
+            .name = "Jump",
+            .func = noexec_2,
+            .page = noexec_2,
+            .expected_si_addr = noexec_2,
+            .arch = {
+                .expected_pswa = noexec_2,
+                .expected_r2 = 0,
+            },
+        },
+        {
+            .name = "EXRL",
+            .func = noexec_exrl,
+            .page = noexec_2,
+            .expected_si_addr = PAGE_ALIGN(noexec_end),
+            .arch = {
+                .expected_pswa = noexec_exrl,
+                .expected_r2 = 0,
+            },
+        },
+        {
+            .name = "Fallthrough [cross]",
+            .func = noexec_cross_1,
+            .page = PAGE_ALIGN(noexec_cross_end),
+            .expected_si_addr = PAGE_ALIGN(noexec_cross_end),
+            .arch = {
+                .expected_pswa = noexec_cross_2,
+                .expected_r2 = 1,
+            },
+        },
+        {
+            .name = "Jump [cross]",
+            .func = noexec_cross_2,
+            .page = PAGE_ALIGN(noexec_cross_end),
+            .expected_si_addr = PAGE_ALIGN(noexec_cross_end),
+            .arch = {
+                .expected_pswa = noexec_cross_2,
+                .expected_r2 = 0,
+            },
+        },
+        {
+            .name = "EXRL [cross]",
+            .func = noexec_cross_exrl,
+            .page = PAGE_ALIGN(noexec_cross_end),
+            .expected_si_addr = PAGE_ALIGN(noexec_cross_end),
+            .arch = {
+                .expected_pswa = noexec_cross_exrl,
+                .expected_r2 = 0,
+            },
+        },
+        {
+            .name = "Jump [full]",
+            .func = noexec_full_1,
+            .page = PAGE_ALIGN(noexec_full_1),
+            .expected_si_addr = PAGE_ALIGN(noexec_full_1),
+            .arch = {
+                .expected_pswa = noexec_full_1,
+                .expected_r2 = 0,
+            },
+        },
+    };
+
+    return test_noexec(noexec_tests,
+                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
+}
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index b71a6bcd5e..c0e7e5b005 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -10,6 +10,7 @@ include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
 ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
+X86_64_TESTS += noexec
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
@@ -20,5 +21,5 @@ test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
-vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
+%: $(SRC_PATH)/tests/tcg/x86_64/%.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
diff --git a/tests/tcg/x86_64/noexec.c b/tests/tcg/x86_64/noexec.c
new file mode 100644
index 0000000000..ec07c9f0ba
--- /dev/null
+++ b/tests/tcg/x86_64/noexec.c
@@ -0,0 +1,116 @@
+#define _GNU_SOURCE
+
+struct arch_noexec_test {
+    void *expected_rip;
+    unsigned long expected_rdi;
+};
+
+#include "../multiarch/noexec.h"
+
+static void arch_check_mcontext(const struct arch_noexec_test *test,
+                                const mcontext_t *ctx) {
+    if (ctx->gregs[REG_RIP] != (unsigned long)test->expected_rip) {
+        safe_puts("[  FAILED  ] wrong rip");
+        _exit(1);
+    }
+
+    if (ctx->gregs[REG_RDI] != test->expected_rdi) {
+        safe_puts("[  FAILED  ] wrong rdi");
+        _exit(1);
+    }
+}
+
+#define DEFINE_NX(name, offset) \
+    void name ## _1(int); \
+    void name ## _2(int); \
+    extern const short name ## _end[]; \
+    asm(/* Go to the specified page offset. */ \
+        ".align 0x1000\n" \
+        ".org .+" #offset "\n" \
+        /* %rdi is 0 on entry, overwrite it with 1. */ \
+        ".globl " #name "_1\n" \
+        #name "_1:\n" \
+        ".cfi_startproc\n" \
+        "movq $1,%rdi\n" \
+        /* Overwrite %rdi with 2. */ \
+        ".globl " #name "_2\n" \
+        #name "_2:\n" \
+        "movq $2,%rdi\n" \
+        "ret\n" \
+        /* End of code. */ \
+        ".globl " #name "_end\n" \
+        #name "_end:\n" \
+        ".cfi_endproc\n" \
+        /* Go to the next page. */ \
+        ".align 0x1000");
+
+/* noexec_1 is executable, noexec_2 is non-executable. */
+DEFINE_NX(noexec, 0xff9);
+
+/*
+ * noexec_cross_1 is executable, noexec_cross_2 crosses non-executable page
+ * boundary.
+ */
+DEFINE_NX(noexec_cross, 0xff8);
+
+/* noexec_full_1 and noexec_full_2 are non-executable. */
+DEFINE_NX(noexec_full, 0x321);
+
+int main(void)
+{
+    struct noexec_test noexec_tests[] = {
+        {
+            .name = "Fallthrough",
+            .func = noexec_1,
+            .page = noexec_2,
+            .expected_si_addr = noexec_2,
+            .arch = {
+                .expected_rip = noexec_2,
+                .expected_rdi = 1,
+            },
+        },
+        {
+            .name = "Jump",
+            .func = noexec_2,
+            .page = noexec_2,
+            .expected_si_addr = noexec_2,
+            .arch = {
+                .expected_rip = noexec_2,
+                .expected_rdi = 0,
+            },
+        },
+        {
+            .name = "Fallthrough [cross]",
+            .func = noexec_cross_1,
+            .page = PAGE_ALIGN(noexec_cross_end),
+            .expected_si_addr = PAGE_ALIGN(noexec_cross_end),
+            .arch = {
+                .expected_rip = noexec_cross_2,
+                .expected_rdi = 1,
+            },
+        },
+        {
+            .name = "Jump [cross]",
+            .func = noexec_cross_2,
+            .page = PAGE_ALIGN(noexec_cross_end),
+            .expected_si_addr = PAGE_ALIGN(noexec_cross_end),
+            .arch = {
+                .expected_rip = noexec_cross_2,
+                .expected_rdi = 0,
+            },
+        },
+        {
+            .name = "Jump [full]",
+            .func = noexec_full_1,
+            .page = PAGE_ALIGN(noexec_full_1),
+            .expected_si_addr = noexec_full_1,
+            .arch = {
+                .expected_rip = noexec_full_1,
+                .expected_rdi = 0,
+            },
+        },
+    };
+
+    return test_noexec(noexec_tests,
+                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
+}
-- 
2.37.1


