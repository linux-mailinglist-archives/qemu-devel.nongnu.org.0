Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C36B3E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pab8Y-0007h2-AW; Fri, 10 Mar 2023 06:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8W-0007eX-4N; Fri, 10 Mar 2023 06:42:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8S-00052Z-GZ; Fri, 10 Mar 2023 06:42:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AAUJUE010070; Fri, 10 Mar 2023 11:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=I2mFjC7D9AcbrkalqeO0NOer9+igh6BueaspmXvu8bA=;
 b=OXs4g0jUEYzv87KnyE9PpE3glnMsZh44Lu4gxYof/cSfdLXx24La2+mYGVQEPZxte+Ky
 CEQEYSZmoWdXoXku16f4cittDh9HlLrCB8C4Vg6xCDJmGio+gilMzdz33YWf1K5Lobqi
 sKDvPLIby/bp6icHQ7lsmUSmCoHQaY1Z44DanNZWS+u8K3kNAr3rQeuOXwtGYUip8GTf
 j9Y1zTDtIFecyAhmBlEKYX2IzCGzKL1WagYzA+t8SO3K3w3A/+R3GMLmfUM4f5MT7A6H
 m1khpMn8zIbKLUaf8ZlYrDk33lv+gY1hxO8Lg3MEGeKNAqBeNmDXmxjYTxnbB+4PY3yn FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7wxegkyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:05 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ABWv6r013091;
 Fri, 10 Mar 2023 11:42:05 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7wxegkxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A7Evld020006;
 Fri, 10 Mar 2023 11:42:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p6ftvkt0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ABfxGL61210914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 11:41:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C0E720040;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6693E20043;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 2/2] tests/tcg/s390x: Add C(G)HRL test
Date: Fri, 10 Mar 2023 12:41:57 +0100
Message-Id: <20230310114157.3024170-3-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310114157.3024170-1-nsg@linux.ibm.com>
References: <20230310114157.3024170-1-nsg@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KHhMKPJdxzVFXhiDtx7xiPzCMq0TQDGs
X-Proofpoint-ORIG-GUID: x1ljb2JwbfAbA2q-AHrQcOHBWEARX6g7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_03,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=833
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
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

Test COMPARE HALFWORD RELATIVE LONG instructions.
Test that the bytes following the second operand do not affect the
instruction.
Test the sign extension performed on the second operand.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
---
 tests/tcg/s390x/chrl.c          | 80 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 tests/tcg/s390x/chrl.c

diff --git a/tests/tcg/s390x/chrl.c b/tests/tcg/s390x/chrl.c
new file mode 100644
index 0000000000..b1c3a1c561
--- /dev/null
+++ b/tests/tcg/s390x/chrl.c
@@ -0,0 +1,80 @@
+#include <stdlib.h>
+#include <assert.h>
+#include <stdint.h>
+
+static void test_chrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short 1, 0x8000\n\t"
+        ".popsection\n\t"
+
+        "chrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short -1, 0x8000\n\t"
+        ".popsection\n\t"
+
+        "chrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+static void test_cghrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short 1, 0x8000, 0, 0\n\t"
+        ".popsection\n\t"
+
+        "cghrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short -1, 0x8000, 0, 0\n\t"
+        ".popsection\n\t"
+
+        "cghrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+int main(void)
+{
+    test_chrl();
+    test_cghrl();
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 72ad309b27..a3d3beeffe 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -28,6 +28,7 @@ TESTS+=div
 TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
+TESTS+=chrl
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
-- 
2.39.1


