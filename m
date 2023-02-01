Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BDF6866FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:33:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDEm-0001uI-D0; Wed, 01 Feb 2023 08:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNDEe-0001tO-5O
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:33:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNDEc-0006RP-8O
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:33:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311DJRla032553; Wed, 1 Feb 2023 13:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m5abs2Q+t6Ayd/yFZ5Q+b5BcKMVRxm/j53AEIbkkLLM=;
 b=rMjy+zPr/2mRenwV9hijEVNlvki4PKpRSOG8yKirhfhk4qb/xc3OTVfh2Fu36sfuQd5T
 c7qvSmc9NnQYqpqSBg+XjGzVEzaQDmFHG+9tTUT2HW4q0XsWRz0kZsd627/W7iezEdjj
 Ld8UVmkNB638K295XqXHsyebeFdHNV3O4XjxGNGCI4o/Qetb09LaFeNL34op3q6gJNI0
 hOwsnlQu0cYhNWtH1HkuckYTGPQ/iv8Nks9ao/u7Xt5KDkRlnDhcGzkkujzAFkycbysU
 /gpC+6HQtatUSCOlyhYJDGbd75tZLyjJc1F1p5bip0AiB4z45ORaakuKUCjwudd4oQVN ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfrv6gaxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:33:08 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311DLsda006651;
 Wed, 1 Feb 2023 13:33:08 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfrv6gawt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:33:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3117Ue6V013274;
 Wed, 1 Feb 2023 13:33:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtycwyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:33:06 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311DX19749414442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 13:33:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 918C02006E;
 Wed,  1 Feb 2023 13:33:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65C732004E;
 Wed,  1 Feb 2023 13:33:01 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.155.209.149])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 13:33:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, philmd@linaro.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/s390x: Add cdsg.c
Date: Wed,  1 Feb 2023 14:32:57 +0100
Message-Id: <20230201133257.3223115-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <51a3cc7cd7f617f0b39569221c96aaf3716ce9f0.camel@linux.ibm.com>
References: <51a3cc7cd7f617f0b39569221c96aaf3716ce9f0.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VMzltTgcOaS0zaIS_S_gCIPtXrLudm23
X-Proofpoint-ORIG-GUID: 8PfpAEuYrIEjJ_XreyMw3xwfzfxtzT5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=830
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010112
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

Add a simple test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  4 ++
 tests/tcg/s390x/cdsg.c          | 93 +++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/tcg/s390x/cdsg.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1d454270c0e..72ad309b273 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -27,6 +27,10 @@ TESTS+=noexec
 TESTS+=div
 TESTS+=clst
 TESTS+=long-double
+TESTS+=cdsg
+
+cdsg: CFLAGS+=-pthread
+cdsg: LDFLAGS+=-pthread
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
new file mode 100644
index 00000000000..800618ff4b4
--- /dev/null
+++ b/tests/tcg/s390x/cdsg.c
@@ -0,0 +1,93 @@
+/*
+ * Test CDSG instruction.
+ *
+ * Increment the first half of aligned_quadword by 1, and the second half by 2
+ * from 2 threads. Verify that the result is consistent.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+
+static volatile bool start;
+typedef unsigned long aligned_quadword[2] __attribute__((__aligned__(16)));
+static aligned_quadword val;
+static const int n_iterations = 1000000;
+
+static inline int cdsg(unsigned long *orig0, unsigned long *orig1,
+                       unsigned long new0, unsigned long new1,
+                       aligned_quadword *mem)
+{
+    register unsigned long r0 asm("r0");
+    register unsigned long r1 asm("r1");
+    register unsigned long r2 asm("r2");
+    register unsigned long r3 asm("r3");
+    int cc;
+
+    r0 = *orig0;
+    r1 = *orig1;
+    r2 = new0;
+    r3 = new1;
+    asm("cdsg %[r0],%[r2],%[db2]\n"
+        "ipm %[cc]"
+        : [r0] "+r" (r0)
+        , [r1] "+r" (r1)
+        , [db2] "+m" (*mem)
+        , [cc] "=r" (cc)
+        : [r2] "r" (r2)
+        , [r3] "r" (r3)
+        : "cc");
+    *orig0 = r0;
+    *orig1 = r1;
+
+    return (cc >> 28) & 3;
+}
+
+void *cdsg_loop(void *arg)
+{
+    unsigned long orig0, orig1, new0, new1;
+    int cc;
+    int i;
+
+    while (!start) {
+    }
+
+    orig0 = val[0];
+    orig1 = val[1];
+    for (i = 0; i < n_iterations;) {
+        new0 = orig0 + 1;
+        new1 = orig1 + 2;
+
+        cc = cdsg(&orig0, &orig1, new0, new1, &val);
+
+        if (cc == 0) {
+            orig0 = new0;
+            orig1 = new1;
+            i++;
+        } else {
+            assert(cc == 1);
+        }
+    }
+
+    return NULL;
+}
+
+int main(void)
+{
+    pthread_t thread;
+    int ret;
+
+    ret = pthread_create(&thread, NULL, cdsg_loop, NULL);
+    assert(ret == 0);
+    start = true;
+    cdsg_loop(NULL);
+    ret = pthread_join(thread, NULL);
+    assert(ret == 0);
+
+    assert(val[0] == n_iterations * 2);
+    assert(val[1] == n_iterations * 4);
+
+    return EXIT_SUCCESS;
+}
-- 
2.39.1


