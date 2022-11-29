Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C942863C281
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:31:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01cu-0004CR-Lk; Tue, 29 Nov 2022 09:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p01cp-0004Ar-JZ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:30:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p01cn-0007rY-IX
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:30:19 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATEPlbl027395; Tue, 29 Nov 2022 14:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bU+HzNE7D5ZdsrlQBmuCTHFL0K/ykWZNS4ezwh50C+U=;
 b=ZW9em+ApckNBLIjjZUELZWLRdIbOn3zapkWMaqDh1QpfgXlSgIvSYpwM6JkZ61b/nG5q
 5hLFtCb8jt+VRSN++rQ4dNezjWZYHvggX8Y583O4+vfTJE8/tNGKlhOB61Q8vkWRU/Uh
 1ULzfXersQB2SN5sk6f0N6um8fNoY760aVp+YvA7NZMuEwSz2jZ0897Sn2GxksguM21T
 +Is37B1dc44iUJjViSrpXszXYf4J2cWDb1VMAx7ZSV9OC7KjEnckr5hAhvULuKwKOU4n
 1XIwZQthEZXO10bz8oFlcJdal5TMd/5ulX4mjw3THF6bWZQnz2ZVp2ywMnjK2xqMj/QK +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuh5vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:30:12 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATEPpEp027859;
 Tue, 29 Nov 2022 14:30:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ebuh5tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:30:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATE5ae4021287;
 Tue, 29 Nov 2022 14:30:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9c5yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:30:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ATEU76g24773158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 14:30:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F2842042;
 Tue, 29 Nov 2022 14:30:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E195A4203F;
 Tue, 29 Nov 2022 14:30:06 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.21.28])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Nov 2022 14:30:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] tests/tcg/s390x: Add cdsg.c
Date: Tue, 29 Nov 2022 15:30:04 +0100
Message-Id: <20221129143004.177852-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <2fb2b364-231d-1087-c516-c0144bac0979@redhat.com>
References: <2fb2b364-231d-1087-c516-c0144bac0979@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6Lrgq7QV0OKqjJ0GsCFxiS5a243Epby6
X-Proofpoint-ORIG-GUID: fUNSkjE5leq_BlmPDRwB0ZPPVwx8Ho2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_08,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=810 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

Add a simple test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  4 ++
 tests/tcg/s390x/cdsg.c          | 84 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 tests/tcg/s390x/cdsg.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1d454270c0e..523214dac33 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -27,6 +27,7 @@ TESTS+=noexec
 TESTS+=div
 TESTS+=clst
 TESTS+=long-double
+TESTS+=cdsg
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
@@ -66,3 +67,6 @@ sha512-mvx: sha512.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 TESTS+=sha512-mvx
+
+cdsg: CFLAGS+=-pthread
+cdsg: LDFLAGS+=-pthread
diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
new file mode 100644
index 00000000000..28b5ac9a000
--- /dev/null
+++ b/tests/tcg/s390x/cdsg.c
@@ -0,0 +1,84 @@
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+
+static volatile bool start;
+typedef unsigned long aligned_quadword[2] __attribute__((__aligned__(16)));
+static aligned_quadword val;
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
+    for (i = 0; i < 1000;) {
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
+    assert(val[0] == 2000);
+    assert(val[1] == 4000);
+
+    return EXIT_SUCCESS;
+}
-- 
2.38.1


