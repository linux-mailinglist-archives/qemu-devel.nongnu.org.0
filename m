Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DD063C3AE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02Tm-00058h-UD; Tue, 29 Nov 2022 10:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p02Tj-000574-Rw
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:25:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p02Th-0000Jc-D0
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:24:59 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATEQIHK031640; Tue, 29 Nov 2022 15:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7UWeqxAdk8Uuvom3ScMO3z6LLbMZ1/9j8ipQAs7JUiI=;
 b=iYVztH8TV/8DorDVyJ1NhphUXCXwV/LU6a3lcf0CS57BUnJndf1mY1i48o0r1HTHsRfq
 Grn7BeQ2H3J24zHOBNsi9iEnpdIgITGgZFHHwypnjkJ+Uq8M6lYRYCuG/oq/Jmg9tlRB
 PXalDgHUZFN6ZBx3ezQg6cu3ppC3FPcoQaZIJxch5vnaHghVM/Uz8USkublJqLrDeDj7
 jmXUuSxR6NLRKh1efxZuC33BxkahooINKRMxqiYB/akYefn0kJ31Qklk1NCheeljqH8Z
 tNFsw4nPjSO8crH3mgCEGSje/v6UxdfxITqAy80cirRh//LEbZ/otI0+uzWFrt6xU6cu Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5hhye25t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:24:55 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATEQKhD031989;
 Tue, 29 Nov 2022 15:24:54 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5hhye254-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:24:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATF5vQc000766;
 Tue, 29 Nov 2022 15:24:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3m3ae933kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:24:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ATFOob628901840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 15:24:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46615AE04D;
 Tue, 29 Nov 2022 15:24:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10277AE045;
 Tue, 29 Nov 2022 15:24:50 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.21.28])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Nov 2022 15:24:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3] tests/tcg/s390x: Add cdsg.c
Date: Tue, 29 Nov 2022 16:24:48 +0100
Message-Id: <20221129152448.244821-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129143004.177852-1-iii@linux.ibm.com>
References: <20221129143004.177852-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PcIcPGY-BFw1JObb7OXWCaqH77wHiVz9
X-Proofpoint-GUID: wT-jZaxJ8m91B0kHgqjmOzw8aycReKOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=810
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290081
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

Sorry, I just realized that in v2 that I sent the iteration count was
not increased. For v3 I've decided to bump it further to 1m, since it's
still fast enough:

$ time -p ./qemu-s390x ./tests/tcg/s390x-linux-user/cdsg
real 0.15

v2 -> v3: Increase iteration count to 1m.
v1 -> v2: Add cdsg() wrapper.

 tests/tcg/s390x/Makefile.target |  4 ++
 tests/tcg/s390x/cdsg.c          | 85 +++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)
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
index 00000000000..c7a5246181d
--- /dev/null
+++ b/tests/tcg/s390x/cdsg.c
@@ -0,0 +1,85 @@
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
2.38.1


