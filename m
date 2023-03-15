Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13166BA3EC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 01:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEjv-00068W-3r; Tue, 14 Mar 2023 20:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEjt-00067p-QQ; Tue, 14 Mar 2023 20:11:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEjq-0008Fa-N7; Tue, 14 Mar 2023 20:11:33 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ENoLNT022297; Wed, 15 Mar 2023 00:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fYxKxk+g8u9WCb66c5ASaGUenSMPzdlz8zyCPSeKUf4=;
 b=fE0M5zqGQvjZ9kE7yRRrF2JEtze7LFryX8ULo7NpYn8eel6YGo0VhBE4xSYrmBCgbB2n
 Co+YhiC2xHd/cAhMvkIVsIUoC59C5i298mgOiUcwvTa1wakx20vN6DRLjWz/yXJua1Pk
 /qIxZQKfWBScNsuYrEon36j0G/xSDM37HPCi89rZ3iRBS0ei9lqV9UZQQwfZDYP+/gKP
 A0YWEPc2A6nop/JceBFTTSJ+vWFVfpW4sKTsipipk3qE6I0MxXtYp1BaUVoJJyXSEujb
 huJcOMDeukz+Wi0CSbFhMJAqnXzoZaGQ0gkq8F8JYkos1E+R31gIjMlfBwiWHODb7ncn mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2xx8dcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:28 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ENv23D009244;
 Wed, 15 Mar 2023 00:11:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2xx8dc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN623V001318;
 Wed, 15 Mar 2023 00:11:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pb29rr1dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F0BNR521037776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 00:11:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD43C2004B;
 Wed, 15 Mar 2023 00:11:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D54920043;
 Wed, 15 Mar 2023 00:11:23 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 00:11:23 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/2] tests/tcg/s390x: Add ex-relative-long.c
Date: Wed, 15 Mar 2023 01:11:17 +0100
Message-Id: <20230315001117.337128-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315001117.337128-1-iii@linux.ibm.com>
References: <20230315001117.337128-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UROiWs6a_zVzwIiF72uwLtyCPB47PWS8
X-Proofpoint-GUID: GYBcl9NOTNCyfJyNZwAs_9ReEQVDv2QQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_15,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=981 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303140189
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

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target    |   1 +
 tests/tcg/s390x/ex-relative-long.c | 159 +++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
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
index 00000000000..4caa8c1b962
--- /dev/null
+++ b/tests/tcg/s390x/ex-relative-long.c
@@ -0,0 +1,159 @@
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
+long mem[0x1000];
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
+        register long reg_val asm("r2");                                       \
+        long cc_val, mask, target;                                             \
+                                                                               \
+        reg_val = reg;                                                         \
+        asm("xgr %[cc_val],%[cc_val]\n"  /* initial cc */                      \
+            "lghi %[mask],0x20\n"        /* make target use %r2 */             \
+            "larl %[target],0f\n"                                              \
+            "ex %[mask],0(%[target])\n"                                        \
+            "jg 1f\n"                                                          \
+            "0: " #insn " %%r0," MEM_ASM "\n"                                  \
+            "1: ipm %[cc_val]\n"                                               \
+            : [cc_val] "=&r" (cc_val)                                          \
+            , [mask] "=&r" (mask)                                              \
+            , [target] "=&r" (target)                                          \
+            , [reg_val] "+&r" (reg_val)                                        \
+            : : "cc", "memory");                                               \
+        reg = reg_val;                                                         \
+        *cc = (cc_val >> 28) & 3;                                              \
+                                                                               \
+        return reg_val;                                                        \
+    }
+
+#define DEFINE_EXRL_TEST(insn, exp_reg, exp_mem, exp_cc)                       \
+    static long test_exrl_ ## insn(long reg, long *cc)                         \
+    {                                                                          \
+        register long reg_val asm("r2");                                       \
+        long cc_val, mask;                                                     \
+                                                                               \
+        reg_val = reg;                                                         \
+        asm("xgr %[cc_val],%[cc_val]\n"  /* initial cc */                      \
+            "lghi %[mask],0x20\n"        /* make target use %r2 */             \
+            "exrl %[mask],0f\n"                                                \
+            "jg 1f\n"                                                          \
+            "0: " #insn " %%r0," MEM_ASM "\n"                                  \
+            "1: ipm %[cc_val]\n"                                               \
+            : [cc_val] "=&r" (cc_val)                                          \
+            , [mask] "=&r" (mask)                                              \
+            , [reg_val] "+&r" (reg_val)                                        \
+            : : "cc", "memory");                                               \
+        reg = reg_val;                                                         \
+        *cc = (cc_val >> 28) & 3;                                              \
+                                                                               \
+        return reg_val;                                                        \
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
+        .exp_reg = (long)(_exp_reg),                                           \
+        .exp_mem = (long)(_exp_mem),                                           \
+        .exp_cc = (long)(_exp_cc),                                             \
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


