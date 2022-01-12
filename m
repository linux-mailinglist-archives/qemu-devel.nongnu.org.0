Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B328048BDF1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:44:08 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VUV-0006v0-KX
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQe-0002Iu-Rr; Tue, 11 Jan 2022 23:40:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQc-0003eT-JH; Tue, 11 Jan 2022 23:40:08 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C1HO3w007778; 
 Wed, 12 Jan 2022 04:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xa1fBDGedA8k5iunYJrylgbRYsmKMgQdy9Rwow2KOeQ=;
 b=Qf/Z7fedLm0X1QS9GeFXhk4wpnsnYhjyq8oBtN40OKvH2Kw1Qm1G/+Y4XsE+QRW8iQA5
 1lqAGp5fdP63S4OQcV1DMYlK4nUtqJa5d9sGDTBPxnrvkbTnHyvpiy1THbjfugb5uDwz
 DP7PKZHheTKIhqYNQoAbMrTZiYYfbSp3SSSoZVkDGMWSvo0mZLkLHyJqVaEPZOFzy9wQ
 BhoQ7Gx201jppqFaEEx/425UozBJvGjp9limkipW9MLTQqrvSurRdRutsxKEWHY0Id7H
 N5y280hdC47p/c8tQU2lybWIjb/mECNfe91rAdy+nks8ufKVWtsUu77iKHgf5JQGRL0f Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh2qt54p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:40:02 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C4W5Li020684;
 Wed, 12 Jan 2022 04:40:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dh2qt54ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:40:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4XBV4021564;
 Wed, 12 Jan 2022 04:40:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3df2895eab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:59 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C4duVP33685962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:39:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6D3B4203F;
 Wed, 12 Jan 2022 04:39:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40E2F4204C;
 Wed, 12 Jan 2022 04:39:56 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:39:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 5/5] tests/tcg/s390x: Test shift instructions
Date: Wed, 12 Jan 2022 05:39:48 +0100
Message-Id: <20220112043948.224405-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112043948.224405-1-iii@linux.ibm.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zkvvHoo73CC1JcDCrIfxprUOAoa_a5St
X-Proofpoint-ORIG-GUID: MZK205btnM7MH1rZMzi9m0x7jxMkhngE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test for each shift instruction in order to to prevent
regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/shift.c         | 258 ++++++++++++++++++++++++++++++++
 2 files changed, 259 insertions(+)
 create mode 100644 tests/tcg/s390x/shift.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cc64dd32d2..1a7238b4eb 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -9,6 +9,7 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
 
diff --git a/tests/tcg/s390x/shift.c b/tests/tcg/s390x/shift.c
new file mode 100644
index 0000000000..73bac9d255
--- /dev/null
+++ b/tests/tcg/s390x/shift.c
@@ -0,0 +1,258 @@
+#include <inttypes.h>
+#include <stdint.h>
+#include <stdio.h>
+
+#define DEFINE_SHIFT_SINGLE_COMMON(name, insn_str) \
+    static uint64_t name(uint64_t op1, uint64_t op2, uint64_t *cc) \
+    { \
+        asm("    spm %[cc]\n" \
+            "    " insn_str "\n" \
+            "    ipm %[cc]" \
+            : [op1] "+&r" (op1), \
+              [cc] "+r" (*cc) \
+            : [op2] "r" (op2) \
+            : "cc"); \
+        return op1; \
+    }
+#define DEFINE_SHIFT_SINGLE_2(insn, offset) \
+    DEFINE_SHIFT_SINGLE_COMMON(insn ## _ ## offset, \
+                               #insn " %[op1]," #offset "(%[op2])")
+#define DEFINE_SHIFT_SINGLE_3(insn, offset) \
+    DEFINE_SHIFT_SINGLE_COMMON(insn ## _ ## offset, \
+                               #insn " %[op1],%[op1]," #offset "(%[op2])")
+#define DEFINE_SHIFT_DOUBLE(insn, offset) \
+    static uint64_t insn ## _ ## offset(uint64_t op1, uint64_t op2, \
+                                        uint64_t *cc) \
+    { \
+        uint32_t op1h = op1 >> 32; \
+        uint32_t op1l = op1 & 0xffffffff; \
+        register uint32_t r2 asm("2") = op1h; \
+        register uint32_t r3 asm("3") = op1l; \
+        \
+        asm("    spm %[cc]\n" \
+            "    " #insn " %[r2]," #offset "(%[op2])\n" \
+            "    ipm %[cc]" \
+            : [r2] "+&r" (r2), \
+              [r3] "+&r" (r3), \
+              [cc] "+r" (*cc) \
+            : [op2] "r" (op2) \
+            : "cc"); \
+        op1h = r2; \
+        op1l = r3; \
+        return (((uint64_t)op1h) << 32) | op1l; \
+    }
+
+DEFINE_SHIFT_SINGLE_3(rll, 0x4cf3b);
+DEFINE_SHIFT_SINGLE_3(rllg, 0x697c9);
+DEFINE_SHIFT_SINGLE_2(sla, 0x4b0);
+DEFINE_SHIFT_SINGLE_2(sla, 0xd54);
+DEFINE_SHIFT_SINGLE_3(slak, 0x2832c);
+DEFINE_SHIFT_SINGLE_3(slag, 0x66cc4);
+DEFINE_SHIFT_SINGLE_2(sll, 0xd04);
+DEFINE_SHIFT_SINGLE_3(sllk, 0x2699f);
+DEFINE_SHIFT_SINGLE_3(sllg, 0x59df9);
+DEFINE_SHIFT_SINGLE_2(sra, 0x67e);
+DEFINE_SHIFT_SINGLE_3(srak, 0x60943);
+DEFINE_SHIFT_SINGLE_3(srag, 0x6b048);
+DEFINE_SHIFT_SINGLE_2(srl, 0x035);
+DEFINE_SHIFT_SINGLE_3(srlk, 0x43dfc);
+DEFINE_SHIFT_SINGLE_3(srlg, 0x27227);
+DEFINE_SHIFT_DOUBLE(slda, 0x38b);
+DEFINE_SHIFT_DOUBLE(sldl, 0x031);
+DEFINE_SHIFT_DOUBLE(srda, 0x36f);
+DEFINE_SHIFT_DOUBLE(srdl, 0x99a);
+
+struct shift_test {
+    const char *name;
+    uint64_t (*insn)(uint64_t, uint64_t, uint64_t *);
+    uint64_t op1;
+    uint64_t op2;
+    uint64_t exp_result;
+    uint64_t exp_cc;
+};
+
+static const struct shift_test tests[] = {
+    {
+        .name = "rll",
+        .insn = rll_0x4cf3b,
+        .op1 = 0xecbd589a45c248f5ull,
+        .op2 = 0x62e5508ccb4c99fdull,
+        .exp_result = 0xecbd589af545c248ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "rllg",
+        .insn = rllg_0x697c9,
+        .op1 = 0xaa2d54c1b729f7f4ull,
+        .op2 = 0x5ffcf7465f5cd71full,
+        .exp_result = 0x29f7f4aa2d54c1b7ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "sla-1",
+        .insn = sla_0x4b0,
+        .op1 = 0x8bf21fb67cca0e96ull,
+        .op2 = 0x3ddf2f53347d3030ull,
+        .exp_result = 0x8bf21fb600000000ull,
+        .exp_cc = 3,
+    },
+    {
+        .name = "sla-2",
+        .insn = sla_0xd54,
+        .op1 = 0xe4faaed5def0e926ull,
+        .op2 = 0x18d586fab239cbeeull,
+        .exp_result = 0xe4faaed5fbc3a498ull,
+        .exp_cc = 3,
+    },
+    {
+        .name = "slak",
+        .insn = slak_0x2832c,
+        .op1 = 0x7300bf78707f09f9ull,
+        .op2 = 0x4d193b85bb5cb39bull,
+        .exp_result = 0x7300bf783f84fc80ull,
+        .exp_cc = 3,
+    },
+    {
+        .name = "slag",
+        .insn = slag_0x66cc4,
+        .op1 = 0xe805966de1a77762ull,
+        .op2 = 0x0e92953f6aa91c6bull,
+        .exp_result = 0xbbb1000000000000ull,
+        .exp_cc = 3,
+    },
+    {
+        .name = "sll",
+        .insn = sll_0xd04,
+        .op1 = 0xb90281a3105939dfull,
+        .op2 = 0xb5e4df7e082e4c5eull,
+        .exp_result = 0xb90281a300000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "sllk",
+        .insn = sllk_0x2699f,
+        .op1 = 0x777c6cf116f99557ull,
+        .op2 = 0xe0556cf112e5a458ull,
+        .exp_result = 0x777c6cf100000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "sllg",
+        .insn = sllg_0x59df9,
+        .op1 = 0xcdf86cbfbc0f3557ull,
+        .op2 = 0x325a45acf99c6d3dull,
+        .exp_result = 0x55c0000000000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "sra",
+        .insn = sra_0x67e,
+        .op1 = 0xb878f048d5354183ull,
+        .op2 = 0x9e27d13195931f79ull,
+        .exp_result = 0xb878f048ffffffffull,
+        .exp_cc = 1,
+    },
+    {
+        .name = "srak",
+        .insn = srak_0x60943,
+        .op1 = 0xb6ceb5a429cedb35ull,
+        .op2 = 0x352354900ae34d7aull,
+        .exp_result = 0xb6ceb5a400000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "srag",
+        .insn = srag_0x6b048,
+        .op1 = 0xd54dd4468676c63bull,
+        .op2 = 0x84d026db7b4dca28ull,
+        .exp_result = 0xffffffffffffd54dull,
+        .exp_cc = 1,
+    },
+    {
+        .name = "srl",
+        .insn = srl_0x035,
+        .op1 = 0x09be503ef826815full,
+        .op2 = 0xbba8d1a0e542d5c1ull,
+        .exp_result = 0x9be503e00000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "srlk",
+        .insn = srlk_0x43dfc,
+        .op1 = 0x540d6c8de71aee2aull,
+        .op2 = 0x0000000000000000ull,
+        .exp_result = 0x540d6c8d00000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "srlg",
+        .insn = srlg_0x27227,
+        .op1 = 0x26f7123c1c447a34ull,
+        .op2 = 0x0000000000000000ull,
+        .exp_result = 0x00000000004dee24ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "slda",
+        .insn = slda_0x38b,
+        .op1 = 0x7988f722dd5bbe7cull,
+        .op2 = 0x9aed3f95b4d78cc2ull,
+        .exp_result = 0x1ee45bab77cf8000ull,
+        .exp_cc = 3,
+    },
+    {
+        .name = "sldl",
+        .insn = sldl_0x031,
+        .op1 = 0xaae2918dce2b049aull,
+        .op2 = 0x0000000000000000ull,
+        .exp_result = 0x0934000000000000ull,
+        .exp_cc = 0,
+    },
+    {
+        .name = "srda",
+        .insn = srda_0x36f,
+        .op1 = 0x0cd4ed9228a50978ull,
+        .op2 = 0x72b046f0848b8cc9ull,
+        .exp_result = 0x000000000000000cull,
+        .exp_cc = 2,
+    },
+    {
+        .name = "srdl",
+        .insn = srdl_0x99a,
+        .op1 = 0x1018611c41689a1dull,
+        .op2 = 0x2907e150c50ba319ull,
+        .exp_result = 0x0000000000000203ull,
+        .exp_cc = 0,
+    },
+};
+
+int main(void)
+{
+    int ret = 0;
+    size_t i;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        uint64_t result;
+        uint64_t cc = 0xffffffff00ffffffull;
+
+        result = tests[i].insn(tests[i].op1, tests[i].op2, &cc);
+        cc = (cc >> 28) & 3;
+        if (result != tests[i].exp_result) {
+            fprintf(stderr,
+                    "bad %s result:\n"
+                    "actual   = 0x%" PRIx64 "\n"
+                    "expected = 0x%" PRIx64 "\n",
+                    tests[i].name, result, tests[i].exp_result);
+            ret = 1;
+        }
+        if (cc != tests[i].exp_cc) {
+            fprintf(stderr,
+                    "bad %s cc:\n"
+                    "actual   = %" PRIu64 "\n"
+                    "expected = %" PRIu64 "\n",
+                    tests[i].name, cc, tests[i].exp_cc);
+            ret = 1;
+        }
+    }
+    return ret;
+}
-- 
2.31.1


