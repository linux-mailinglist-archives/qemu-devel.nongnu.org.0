Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745B6EFE22
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 01:59:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prp1w-000327-RR; Wed, 26 Apr 2023 19:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1q-0002zo-VS; Wed, 26 Apr 2023 19:58:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1p-0005GA-7K; Wed, 26 Apr 2023 19:58:30 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QNdfYj012717; Wed, 26 Apr 2023 23:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hiqiRac3dxtgF39ZNOcW2loLDhOLmcN8rVWRikfrgy0=;
 b=sQg+qsIAfqOmA0jnS0xTzqWDkfcvze8Gfackkf375WyA0cdlCxB7rBnRIi9KsnbVOLAA
 WdRyHW64pSYymM9juXPFo+hk7xOUdGtFtEHduxDTNi+9iVCJpihUxeWkjBfBAv9PDI3u
 hasT3BimnZerl8rBjW6mxopHSZ0eAWrVpJyu55hAYrFT9acPpbuj/Eh2Oug0W2ZCt3eO
 qPFbk3DAbUZ+yWZU0SL+aYr0m4GSe+P8C3vHg600qQnf17PGR3UulEiDy4kh0h3pIwSD
 bS/hL7CKNkewDXphjGVJbi9jZH8/YnRkPfshi0gRVwHYzB07LWGSyw1YrhR1W6fE3La0 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7d0jhm89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:27 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33QNwRMD032021;
 Wed, 26 Apr 2023 23:58:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7d0jhm7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33QLPCuM019354;
 Wed, 26 Apr 2023 23:58:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47772myb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33QNwMOM43188634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 23:58:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0F8720040;
 Wed, 26 Apr 2023 23:58:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B7AC20043;
 Wed, 26 Apr 2023 23:58:22 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.69.68])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 26 Apr 2023 23:58:22 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Test EXECUTE of relative branches
Date: Thu, 27 Apr 2023 01:58:13 +0200
Message-Id: <20230426235813.198183-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426235813.198183-1-iii@linux.ibm.com>
References: <20230426235813.198183-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9GHWKpnd_WB3AXcHBdlF2XmpInzJIrQo
X-Proofpoint-GUID: DjPkcf7oCXE8zCf-Zye_ngc_aKkCKHdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260203
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/ex-branch.c     | 158 ++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tests/tcg/s390x/ex-branch.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0031868b136..23dc8b6a63f 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -34,6 +34,7 @@ TESTS+=cdsg
 TESTS+=chrl
 TESTS+=rxsbg
 TESTS+=ex-relative-long
+TESTS+=ex-branch
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
diff --git a/tests/tcg/s390x/ex-branch.c b/tests/tcg/s390x/ex-branch.c
new file mode 100644
index 00000000000..c6067191528
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
-- 
2.40.0


