Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9726C12B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:07:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFB8-0001FX-HM; Mon, 20 Mar 2023 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB1-0001DY-OT
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFAz-0006DK-K3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBRy9jZNk9E2rGCfhCf4kQdgO2FvGr4J9VZSGzo4vio=;
 b=FhCAUnj8gwgiOjT84b78jqmnQUHhMtypK3ZwuK02V5wGJ+06vHs/VK7JZ2/BLPaSCfp+3A
 2vz2Yc7ZpUjkclgJ9xcO7IR7/KQeIdt8WYfLEs68vmCkuvpk8FzxjabJ9xewDvTECUpBnD
 FdEFAjJVF1www6NzvMKzw49g3CM2d6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-xGR1lpnoMES8HSrPu574lA-1; Mon, 20 Mar 2023 09:03:43 -0400
X-MC-Unique: xGR1lpnoMES8HSrPu574lA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF9C83C16EA3;
 Mon, 20 Mar 2023 13:03:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8041C15BA0;
 Mon, 20 Mar 2023 13:03:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PULL 08/24] tests/tcg/s390x: Add ex-relative-long.c
Date: Mon, 20 Mar 2023 14:03:14 +0100
Message-Id: <20230320130330.406378-9-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Test EXECUTE and EXECUTE RELATIVE LONG with relative long instructions
as targets.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Message-Id: <20230316210751.302423-3-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/ex-relative-long.c | 156 +++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target    |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

diff --git a/tests/tcg/s390x/ex-relative-long.c b/tests/tcg/s390x/ex-relative-long.c
new file mode 100644
index 0000000000..21fbef6258
--- /dev/null
+++ b/tests/tcg/s390x/ex-relative-long.c
@@ -0,0 +1,156 @@
+/* Check EXECUTE with relative long instructions as targets. */
+#include <stdlib.h>
+#include <stdio.h>
+
+struct test {
+    const char *name;
+    long (*func)(long reg, long *cc);
+    long exp_reg;
+    long exp_mem;
+    long exp_cc;
+};
+
+/*
+ * Each test sets the MEM_IDXth element of the mem array to MEM and uses a
+ * single relative long instruction on it. The other elements remain zero.
+ * This is in order to prevent stumbling upon MEM in random memory in case
+ * there is an off-by-a-small-value bug.
+ *
+ * Note that while gcc supports the ZL constraint for relative long operands,
+ * clang doesn't, so the assembly code accesses mem[MEM_IDX] using MEM_ASM.
+ */
+static long mem[0x1000];
+#define MEM_IDX 0x800
+#define MEM_ASM "mem+0x800*8"
+
+/* Initial %r2 value. */
+#define REG 0x1234567887654321
+
+/* Initial mem[MEM_IDX] value. */
+#define MEM 0xfedcba9889abcdef
+
+/* Initial cc value. */
+#define CC 0
+
+/* Relative long instructions and their expected effects. */
+#define FOR_EACH_INSN(F)                                                       \
+    F(cgfrl,  REG,                 MEM,                2)                      \
+    F(cghrl,  REG,                 MEM,                2)                      \
+    F(cgrl,   REG,                 MEM,                2)                      \
+    F(chrl,   REG,                 MEM,                1)                      \
+    F(clgfrl, REG,                 MEM,                2)                      \
+    F(clghrl, REG,                 MEM,                2)                      \
+    F(clgrl,  REG,                 MEM,                1)                      \
+    F(clhrl,  REG,                 MEM,                2)                      \
+    F(clrl,   REG,                 MEM,                1)                      \
+    F(crl,    REG,                 MEM,                1)                      \
+    F(larl,   (long)&mem[MEM_IDX], MEM,                CC)                     \
+    F(lgfrl,  0xfffffffffedcba98,  MEM,                CC)                     \
+    F(lghrl,  0xfffffffffffffedc,  MEM,                CC)                     \
+    F(lgrl,   MEM,                 MEM,                CC)                     \
+    F(lhrl,   0x12345678fffffedc,  MEM,                CC)                     \
+    F(llghrl, 0x000000000000fedc,  MEM,                CC)                     \
+    F(llhrl,  0x123456780000fedc,  MEM,                CC)                     \
+    F(lrl,    0x12345678fedcba98,  MEM,                CC)                     \
+    F(stgrl,  REG,                 REG,                CC)                     \
+    F(sthrl,  REG,                 0x4321ba9889abcdef, CC)                     \
+    F(strl,   REG,                 0x8765432189abcdef, CC)
+
+/* Test functions. */
+#define DEFINE_EX_TEST(insn, exp_reg, exp_mem, exp_cc)                         \
+    static long test_ex_ ## insn(long reg, long *cc)                           \
+    {                                                                          \
+        register long r2 asm("r2");                                            \
+        char mask = 0x20;  /* make target use %r2 */                           \
+        long pm, target;                                                       \
+                                                                               \
+        r2 = reg;                                                              \
+        asm("larl %[target],0f\n"                                              \
+            "cr %%r0,%%r0\n"  /* initial cc */                                 \
+            "ex %[mask],0(%[target])\n"                                        \
+            "jg 1f\n"                                                          \
+            "0: " #insn " %%r0," MEM_ASM "\n"                                  \
+            "1: ipm %[pm]\n"                                                   \
+            : [target] "=&a" (target), [r2] "+r" (r2), [pm] "=r" (pm)          \
+            : [mask] "a" (mask)                                                \
+            : "cc", "memory");                                                 \
+        reg = r2;                                                              \
+        *cc = (pm >> 28) & 3;                                                  \
+                                                                               \
+        return reg;                                                            \
+    }
+
+#define DEFINE_EXRL_TEST(insn, exp_reg, exp_mem, exp_cc)                       \
+    static long test_exrl_ ## insn(long reg, long *cc)                         \
+    {                                                                          \
+        register long r2 asm("r2");                                            \
+        char mask = 0x20;  /* make target use %r2 */                           \
+        long pm;                                                               \
+                                                                               \
+        r2 = reg;                                                              \
+        asm("cr %%r0,%%r0\n"  /* initial cc */                                 \
+            "exrl %[mask],0f\n"                                                \
+            "jg 1f\n"                                                          \
+            "0: " #insn " %%r0," MEM_ASM "\n"                                  \
+            "1: ipm %[pm]\n"                                                   \
+            : [r2] "+r" (r2), [pm] "=r" (pm)                                   \
+            : [mask] "a" (mask)                                                \
+            : "cc", "memory");                                                 \
+        reg = r2;                                                              \
+        *cc = (pm >> 28) & 3;                                                  \
+                                                                               \
+        return reg;                                                            \
+    }
+
+FOR_EACH_INSN(DEFINE_EX_TEST)
+FOR_EACH_INSN(DEFINE_EXRL_TEST)
+
+/* Test definitions. */
+#define REGISTER_EX_EXRL_TEST(ex_insn, insn, _exp_reg, _exp_mem, _exp_cc)      \
+    {                                                                          \
+        .name = #ex_insn " " #insn,                                            \
+        .func = test_ ## ex_insn ## _ ## insn,                                 \
+        .exp_reg = (_exp_reg),                                                 \
+        .exp_mem = (_exp_mem),                                                 \
+        .exp_cc = (_exp_cc),                                                   \
+    },
+
+#define REGISTER_EX_TEST(insn, exp_reg, exp_mem, exp_cc)                       \
+    REGISTER_EX_EXRL_TEST(ex, insn, exp_reg, exp_mem, exp_cc)
+
+#define REGISTER_EXRL_TEST(insn, exp_reg, exp_mem, exp_cc)                     \
+    REGISTER_EX_EXRL_TEST(exrl, insn, exp_reg, exp_mem, exp_cc)
+
+static const struct test tests[] = {
+    FOR_EACH_INSN(REGISTER_EX_TEST)
+    FOR_EACH_INSN(REGISTER_EXRL_TEST)
+};
+
+/* Loop over all tests and run them. */
+int main(void)
+{
+    const struct test *test;
+    int ret = EXIT_SUCCESS;
+    long reg, cc;
+    size_t i;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        test = &tests[i];
+        mem[MEM_IDX] = MEM;
+        cc = -1;
+        reg = test->func(REG, &cc);
+#define ASSERT_EQ(expected, actual) do {                                       \
+    if (expected != actual) {                                                  \
+        fprintf(stderr, "%s: " #expected " (0x%lx) != " #actual " (0x%lx)\n",  \
+                test->name, expected, actual);                                 \
+        ret = EXIT_FAILURE;                                                    \
+    }                                                                          \
+} while (0)
+        ASSERT_EQ(test->exp_reg, reg);
+        ASSERT_EQ(test->exp_mem, mem[MEM_IDX]);
+        ASSERT_EQ(test->exp_cc, cc);
+#undef ASSERT_EQ
+    }
+
+    return ret;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 3c940ac952..510bbd9b28 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -30,6 +30,7 @@ TESTS+=long-double
 TESTS+=cdsg
 TESTS+=chrl
 TESTS+=rxsbg
+TESTS+=ex-relative-long
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
-- 
2.31.1


