Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560496BC1E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcazZ-0005oQ-QC; Wed, 15 Mar 2023 19:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazX-0005ng-Dx; Wed, 15 Mar 2023 19:57:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazV-0007PX-3x; Wed, 15 Mar 2023 19:57:11 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FMWIaP023419; Wed, 15 Mar 2023 23:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DNR3gjlrQrcAN9KAWcCCnW6EaxXixu/69GNGqI8FhV0=;
 b=fK99pcGy73ERPdhHSwfXy+IK911LG02sQSB2GOHEBeOCMpg+yIvdhN/3YaEB3B/bfxDR
 zAXScaWtqKz/zpOtYgHDFWfmhzsHmbFp56cXNJYjGqThko2fHg9fDVHnqk86w/JBDJIE
 JXPQF6jo5fKHKVzQgSMaJlCMV7hB+uMDyUzQj9/X/fy0tnXH7eKfV5MBVxc/yC4Z2n10
 vlXBalJlgAT6DqD//zbsfnxVDuR/cM5pfun/DX7kw18oq3ikuC9HzyMy2mQ7mSxDB352
 p7x9Kqph1kXKsSwL5HXn/FYqJR1ackdRTBIsgpJ/HK3AfmsJQKzrA+xLOpQMkbBw3wwK 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbsfxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:57:06 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FNv5UX008768;
 Wed, 15 Mar 2023 23:57:05 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbsfx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:57:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FLoebh002458;
 Wed, 15 Mar 2023 23:57:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbp9qr31g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:57:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FNv0SL4522578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 23:57:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D851A20040;
 Wed, 15 Mar 2023 23:57:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4488620043;
 Wed, 15 Mar 2023 23:57:00 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 23:57:00 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/2] tests/tcg/s390x: Add rxsbg.c
Date: Thu, 16 Mar 2023 00:56:42 +0100
Message-Id: <20230315235642.118002-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315235642.118002-1-iii@linux.ibm.com>
References: <20230315235642.118002-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UFQsl4CAgH3MpxgqJTF6WAyh8gL5IzxU
X-Proofpoint-GUID: 2OvO0yEPiCIbvQx2t1EgOiBjEqqV_oxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=912 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150192
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Add a small test for RXSBG with T=1 to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  3 +++
 tests/tcg/s390x/rxsbg.c         | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 tests/tcg/s390x/rxsbg.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cf93b966862..3c940ac952e 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -29,10 +29,13 @@ TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
 TESTS+=chrl
+TESTS+=rxsbg
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
 
+rxsbg: CFLAGS+=-O2
+
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
 TESTS+=$(Z13_TESTS)
diff --git a/tests/tcg/s390x/rxsbg.c b/tests/tcg/s390x/rxsbg.c
new file mode 100644
index 00000000000..4b155db304e
--- /dev/null
+++ b/tests/tcg/s390x/rxsbg.c
@@ -0,0 +1,46 @@
+/*
+ * Test the RXSBG instruction.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdlib.h>
+
+static inline __attribute__((__always_inline__)) void
+rxsbg(unsigned long *r1, unsigned long r2, int i3, int i4, int i5, int *cc)
+{
+    asm("rxsbg %[r1],%[r2],%[i3],%[i4],%[i5]\n"
+        "ipm %[cc]"
+        : [r1] "+r" (*r1), [cc] "=r" (*cc)
+        : [r2] "r" (r2) , [i3] "i" (i3) , [i4] "i" (i4) , [i5] "i" (i5)
+        : "cc");
+    *cc = (*cc >> 28) & 3;
+}
+
+void test_cc0(void)
+{
+    unsigned long r1 = 6;
+    int cc;
+
+    rxsbg(&r1, 3, 61 | 0x80, 62, 1, &cc);
+    assert(r1 == 6);
+    assert(cc == 0);
+}
+
+void test_cc1(void)
+{
+    unsigned long r1 = 2;
+    int cc;
+
+    rxsbg(&r1, 3, 61 | 0x80, 62, 1, &cc);
+    assert(r1 == 2);
+    assert(cc == 1);
+}
+
+int main(void)
+{
+    test_cc0();
+    test_cc1();
+
+    return EXIT_SUCCESS;
+}
-- 
2.39.2


