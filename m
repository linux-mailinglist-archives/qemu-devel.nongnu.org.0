Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5E6BDA96
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 22:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcupV-0002Tx-ET; Thu, 16 Mar 2023 17:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupT-0002Sv-CM; Thu, 16 Mar 2023 17:08:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupR-0008R4-9j; Thu, 16 Mar 2023 17:08:07 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GL1jLb005992; Thu, 16 Mar 2023 21:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K+toebhe+Ntd6FGSKsZ75zXmjHDXrYh2LGhCOVOqY1k=;
 b=FjQZVnkO6DL925xmpUAfALh4e/vVEE/Qcn7Ccl4wi7F0KxzrI1AoKHo3QSYoLq40IHWv
 zYpBS+Y1O6v4h7YlpNlNy2gzv/930J0/kadkrDDbGNFf+95NuAv3+uLbLbW+/eojOjhK
 QAoa7NaIutgSz1nY1wun8aCi4KIBJUDHnbiVjqD+SFJdepcLuWA4YbbZhMgvfNuigCkq
 sNCq3rW5UCi3XoLwxOIKZE92w1O/Cbk9tJSwkiysX3KRgRSDqREArSw4aHRuIzAfNG7q
 KHjc7tABS8PUTCa+K2paENqdS3kLmnwMz4gXDCSSU4cEmKiGQiSEmjR4SI39AOiAmXcD oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcanw84ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:08:03 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GL28io006901;
 Thu, 16 Mar 2023 21:08:03 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcanw84rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:08:02 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GIImT2008160;
 Thu, 16 Mar 2023 21:08:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pbsu7h0e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:08:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GL7vMd43254228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 21:07:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 562A220040;
 Thu, 16 Mar 2023 21:07:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB1820049;
 Thu, 16 Mar 2023 21:07:56 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 21:07:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v3 2/2] tests/tcg/s390x: Add ex-relative-long.c
Date: Thu, 16 Mar 2023 22:07:51 +0100
Message-Id: <20230316210751.302423-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316210751.302423-1-iii@linux.ibm.com>
References: <20230316210751.302423-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uyxfvTPHwlpcPTr_7_nX8EROOD2_mC4M
X-Proofpoint-ORIG-GUID: MaI4u6oZBX-9DWd8_5BgSeKuAz5w1ez_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=995 clxscore=1015 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160158
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Test EXECUTE and EXECUTE RELATIVE LONG with relative long instructions
as targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target    |   1 +
 tests/tcg/s390x/ex-relative-long.c | 156 +++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cf93b966862..90bc48227db 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -29,6 +29,7 @@ TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
 TESTS+=chrl
+TESTS+=ex-relative-long
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
diff --git a/tests/tcg/s390x/ex-relative-long.c b/tests/tcg/s390x/ex-relative-long.c
new file mode 100644
index 00000000000..21fbef62585
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
-- 
2.39.2


