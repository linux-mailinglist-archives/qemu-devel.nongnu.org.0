Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E6702E71
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:39:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsY-000072-Ns; Mon, 15 May 2023 09:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXr7-0004rL-3A
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXr5-00016K-2i
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cvVo1HLTG3tB+XejkUsy3xh5m+2mDmGhHSUoVztGec=;
 b=QJfYISPqMelen5/rOFU9oTrkRI5VVGWrLPPfeqT3UMI/V/dd6DqY/tyFXCzz9wUzEXfGel
 jpMYSala+37JzcZHsI0ChuOK2Puk9gyU4rfhRcJY60ZRJdRceTDr7bvLYH8p2f36dEWuL3
 voug2qsCI/uJKogIU4ATwTFSTXra/VM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-uPnS1xMsPmK7LSnrn77whg-1; Mon, 15 May 2023 09:03:03 -0400
X-MC-Unique: uPnS1xMsPmK7LSnrn77whg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3446D3C0CF0B;
 Mon, 15 May 2023 13:03:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72FCC40C6EC4;
 Mon, 15 May 2023 13:03:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 21/21] tests/tcg/s390x: Test EXECUTE of relative branches
Date: Mon, 15 May 2023 15:02:33 +0200
Message-Id: <20230515130233.418183-22-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230426235813.198183-3-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/ex-branch.c     | 158 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 tests/tcg/s390x/ex-branch.c

diff --git a/tests/tcg/s390x/ex-branch.c b/tests/tcg/s390x/ex-branch.c
new file mode 100644
index 0000000000..c606719152
--- /dev/null
+++ b/tests/tcg/s390x/ex-branch.c
@@ -0,0 +1,158 @@
+/* Check EXECUTE with relative branch instructions as targets. */
+#include <assert.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+struct test {
+    const char *name;
+    void (*func)(long *link, long *magic);
+    long exp_link;
+};
+
+/* Branch instructions and their expected effects. */
+#define LINK_64(test) ((long)test ## _exp_link)
+#define LINK_NONE(test) -1L
+#define FOR_EACH_INSN(F)                                                       \
+    F(bras,  "%[link]",     LINK_64)                                           \
+    F(brasl, "%[link]",     LINK_64)                                           \
+    F(brc,   "0x8",         LINK_NONE)                                         \
+    F(brcl,  "0x8",         LINK_NONE)                                         \
+    F(brct,  "%%r0",        LINK_NONE)                                         \
+    F(brctg, "%%r0",        LINK_NONE)                                         \
+    F(brxh,  "%%r2,%%r0",   LINK_NONE)                                         \
+    F(brxhg, "%%r2,%%r0",   LINK_NONE)                                         \
+    F(brxle, "%%r0,%%r1",   LINK_NONE)                                         \
+    F(brxlg, "%%r0,%%r1",   LINK_NONE)                                         \
+    F(crj,   "%%r0,%%r0,8", LINK_NONE)                                         \
+    F(cgrj,  "%%r0,%%r0,8", LINK_NONE)                                         \
+    F(cij,   "%%r0,0,8",    LINK_NONE)                                         \
+    F(cgij,  "%%r0,0,8",    LINK_NONE)                                         \
+    F(clrj,  "%%r0,%%r0,8", LINK_NONE)                                         \
+    F(clgrj, "%%r0,%%r0,8", LINK_NONE)                                         \
+    F(clij,  "%%r0,0,8",    LINK_NONE)                                         \
+    F(clgij, "%%r0,0,8",    LINK_NONE)
+
+#define INIT_TEST                                                              \
+    "xgr %%r0,%%r0\n"  /* %r0 = 0; %cc = 0 */                                  \
+    "lghi %%r1,1\n"    /* %r1 = 1 */                                           \
+    "lghi %%r2,2\n"    /* %r2 = 2 */
+
+#define CLOBBERS_TEST "cc", "0", "1", "2"
+
+#define DEFINE_TEST(insn, args, exp_link)                                      \
+    extern char insn ## _exp_link[];                                           \
+    static void test_ ## insn(long *link, long *magic)                         \
+    {                                                                          \
+        asm(INIT_TEST                                                          \
+            #insn " " args ",0f\n"                                             \
+            ".globl " #insn "_exp_link\n"                                      \
+            #insn "_exp_link:\n"                                               \
+            ".org . + 90\n"                                                    \
+            "0: lgfi %[magic],0x12345678\n"                                    \
+            : [link] "+r" (*link)                                              \
+            , [magic] "+r" (*magic)                                            \
+            : : CLOBBERS_TEST);                                                \
+    }                                                                          \
+    extern char ex_ ## insn ## _exp_link[];                                    \
+    static void test_ex_ ## insn(long *link, long *magic)                      \
+    {                                                                          \
+        unsigned long target;                                                  \
+                                                                               \
+        asm(INIT_TEST                                                          \
+            "larl %[target],0f\n"                                              \
+            "ex %%r0,0(%[target])\n"                                           \
+            ".globl ex_" #insn "_exp_link\n"                                   \
+            "ex_" #insn "_exp_link:\n"                                         \
+            ".org . + 60\n"                                                    \
+            "0: " #insn " " args ",1f\n"                                       \
+            ".org . + 120\n"                                                   \
+            "1: lgfi %[magic],0x12345678\n"                                    \
+            : [target] "=r" (target)                                           \
+            , [link] "+r" (*link)                                              \
+            , [magic] "+r" (*magic)                                            \
+            : : CLOBBERS_TEST);                                                \
+    }                                                                          \
+    extern char exrl_ ## insn ## _exp_link[];                                  \
+    static void test_exrl_ ## insn(long *link, long *magic)                    \
+    {                                                                          \
+        asm(INIT_TEST                                                          \
+            "exrl %%r0,0f\n"                                                   \
+            ".globl exrl_" #insn "_exp_link\n"                                 \
+            "exrl_" #insn "_exp_link:\n"                                       \
+            ".org . + 60\n"                                                    \
+            "0: " #insn " " args ",1f\n"                                       \
+            ".org . + 120\n"                                                   \
+            "1: lgfi %[magic],0x12345678\n"                                    \
+            : [link] "+r" (*link)                                              \
+            , [magic] "+r" (*magic)                                            \
+            : : CLOBBERS_TEST);                                                \
+    }
+
+/* Test functions. */
+FOR_EACH_INSN(DEFINE_TEST)
+
+/* Test definitions. */
+#define REGISTER_TEST(insn, args, _exp_link)                                   \
+    {                                                                          \
+        .name = #insn,                                                         \
+        .func = test_ ## insn,                                                 \
+        .exp_link = (_exp_link(insn)),                                         \
+    },                                                                         \
+    {                                                                          \
+        .name = "ex " #insn,                                                   \
+        .func = test_ex_ ## insn,                                              \
+        .exp_link = (_exp_link(ex_ ## insn)),                                  \
+    },                                                                         \
+    {                                                                          \
+        .name = "exrl " #insn,                                                 \
+        .func = test_exrl_ ## insn,                                            \
+        .exp_link = (_exp_link(exrl_ ## insn)),                                \
+    },
+
+static const struct test tests[] = {
+    FOR_EACH_INSN(REGISTER_TEST)
+};
+
+int main(int argc, char **argv)
+{
+    const struct test *test;
+    int ret = EXIT_SUCCESS;
+    bool verbose = false;
+    long link, magic;
+    size_t i;
+
+    for (i = 1; i < argc; i++) {
+        if (strcmp(argv[i], "-v") == 0) {
+            verbose = true;
+        }
+    }
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        test = &tests[i];
+        if (verbose) {
+            fprintf(stderr, "[ RUN      ] %s\n", test->name);
+        }
+        link = -1;
+        magic = -1;
+        test->func(&link, &magic);
+#define ASSERT_EQ(expected, actual) do {                                       \
+    if (expected != actual) {                                                  \
+        fprintf(stderr, "%s: " #expected " (0x%lx) != " #actual " (0x%lx)\n",  \
+                test->name, expected, actual);                                 \
+        ret = EXIT_FAILURE;                                                    \
+    }                                                                          \
+} while (0)
+        ASSERT_EQ(test->exp_link, link);
+        ASSERT_EQ(0x12345678L, magic);
+#undef ASSERT_EQ
+    }
+
+    if (verbose) {
+        fprintf(stderr, ret == EXIT_SUCCESS ? "[  PASSED  ]\n" :
+                                              "[  FAILED  ]\n");
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0031868b13..23dc8b6a63 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -34,6 +34,7 @@ TESTS+=cdsg
 TESTS+=chrl
 TESTS+=rxsbg
 TESTS+=ex-relative-long
+TESTS+=ex-branch
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
-- 
2.31.1


