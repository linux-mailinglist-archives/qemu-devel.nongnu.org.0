Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1126B862D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrke-0007Lc-3U; Mon, 13 Mar 2023 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkU-0007Ig-RF; Mon, 13 Mar 2023 19:38:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkR-0003Sr-DQ; Mon, 13 Mar 2023 19:38:38 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DNKkFe024061; Mon, 13 Mar 2023 23:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xP9B2t89C35NkSuoGDuh9oZ7d2NdyDL3JZ9VhMChmPs=;
 b=gogy/Z073iXbxfGVizsM1i1ok56BPK5NZmR2To1A795sDf2r4jm87APisVfkEJpxixrA
 1DmwK7Bs6c3caFJE5ZDkOr3BRacVLOTUaoXYkVrAYwX26hwysiEmWFaBeDvEhNspZgrz
 grWwIdRJBReNDiqWw7cuqMvZ2WXahRAjhZF3ryS0iZdwMU5JGqNthxTTkuLsN9m1xlJg
 s8Eb6PLVB4ZtzkdfTPIpRm3FwP9VXgfn51izIKSbv/BwStL4mPJiDgTXrTxHicrviDAT
 XNcgyRJ8qD43rf1L725tSrQONxiDfKxPoL3pYZ5TPttLSuI0t1YfiYeWMk/et0DbDBK0 Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paaud41jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DNJbF3010366;
 Mon, 13 Mar 2023 23:38:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paaud41j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DDiBsa030078;
 Mon, 13 Mar 2023 23:38:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfc0n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DNcS1135783072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 23:38:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D6D020040;
 Mon, 13 Mar 2023 23:38:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92D012004B;
 Mon, 13 Mar 2023 23:38:27 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 23:38:27 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Add ex-relative-long.c
Date: Tue, 14 Mar 2023 00:38:19 +0100
Message-Id: <20230313233819.122329-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313233819.122329-1-iii@linux.ibm.com>
References: <20230313233819.122329-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LSi3n-KHWGszWHoCkXJlyrStZLPZQnLP
X-Proofpoint-ORIG-GUID: T83nquHXVFCMX3NZi1WV1MYOBw649W72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_11,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130186
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
 tests/tcg/s390x/ex-relative-long.c | 149 +++++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 72ad309b273..ed2709ee2c3 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -28,6 +28,7 @@ TESTS+=div
 TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
+TESTS+=ex-relative-long
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
diff --git a/tests/tcg/s390x/ex-relative-long.c b/tests/tcg/s390x/ex-relative-long.c
new file mode 100644
index 00000000000..e47dac7e2c3
--- /dev/null
+++ b/tests/tcg/s390x/ex-relative-long.c
@@ -0,0 +1,149 @@
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
+/* Variable targeted by relative long instructions. */
+long mem;
+
+/* Initial %r2 value. */
+#define REG 0x1234567887654321
+
+/* Initial "mem" value. */
+#define MEM 0xfedcba9889abcdef
+
+/* Initial cc value. */
+#define CC 0
+
+/* Relative long instructions. */
+#define FOR_EACH_TEST(F)                                                       \
+    F(cgfrl,  REG,                MEM,                2)                       \
+    F(cghrl,  REG,                MEM,                2)                       \
+    F(cgrl,   REG,                MEM,                2)                       \
+    F(chrl,   REG,                MEM,                1)                       \
+    F(clgfrl, REG,                MEM,                2)                       \
+    F(clghrl, REG,                MEM,                2)                       \
+    F(clgrl,  REG,                MEM,                1)                       \
+    F(clhrl,  REG,                MEM,                2)                       \
+    F(clrl,   REG,                MEM,                1)                       \
+    F(crl,    REG,                MEM,                1)                       \
+    F(larl,   (long)&mem,         MEM,                CC)                      \
+    F(lgfrl,  0xfffffffffedcba98, MEM,                CC)                      \
+    F(lghrl,  0xfffffffffffffedc, MEM,                CC)                      \
+    F(lgrl,   MEM,                MEM,                CC)                      \
+    F(lhrl,   0x12345678fffffedc, MEM,                CC)                      \
+    F(llghrl, 0x000000000000fedc, MEM,                CC)                      \
+    F(llhrl,  0x123456780000fedc, MEM,                CC)                      \
+    F(lrl,    0x12345678fedcba98, MEM,                CC)                      \
+    F(stgrl,  REG,                REG,                CC)                      \
+    F(sthrl,  REG,                0x4321ba9889abcdef, CC)                      \
+    F(strl,   REG,                0x8765432189abcdef, CC)
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
+            "0: " #insn " %%r0,mem\n"                                          \
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
+            "0: " #insn " %%r0,mem\n"                                          \
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
+FOR_EACH_TEST(DEFINE_EX_TEST)
+FOR_EACH_TEST(DEFINE_EXRL_TEST)
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
+    FOR_EACH_TEST(REGISTER_EX_TEST)
+    FOR_EACH_TEST(REGISTER_EXRL_TEST)
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
+        mem = MEM;
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
+        ASSERT_EQ(test->exp_mem, mem);
+        ASSERT_EQ(test->exp_cc, cc);
+#undef ASSERT_EQ
+    }
+
+    return ret;
+}
-- 
2.39.2


