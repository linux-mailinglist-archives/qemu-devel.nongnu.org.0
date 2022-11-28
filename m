Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDF63B620
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 00:49:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozns4-0004Nc-TV; Mon, 28 Nov 2022 18:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozns2-0004NQ-JU
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 18:49:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ozns0-00023A-Nb
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 18:49:06 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ASNcQHC019540; Mon, 28 Nov 2022 23:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0+spj/LQELtf179o1lBUS+CFaxVOmuUEZew95HEno1E=;
 b=tTa9poWp4SzCm5hgjtFSgOxuPFG/e8nHUw06E7jVXKV2NrhEPq2H5sBBr5UiVvJBOJ3i
 Pdbhl/twetgN5pRKCNlPEKysuZQVgNOZH+bGAt0wPYaifpdKPcNy47z8ftSXgXsDq3ul
 909udYyrKkqi6dUFfkDz4dkeY2K8OV7lFRLwMdjEiyHgZHzLrAZzT3hjytqxUE/B6wNf
 7Wo3mbUnlbD0GQ+g6FLySQn7sg34gYpp8jXdaMsmnw/qIPppqVP+WNWTg0rgNVlSrbRA
 tLh0zVaFULdZoBuUA11w20/y4jwNqXE59jDOC9y87ZMksxmUPtzJBEkVKRQ+A4TIgGH4 zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m56g0gfc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:49:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASNkkQt002396;
 Mon, 28 Nov 2022 23:49:02 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m56g0gfbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:49:02 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASNaV89011846;
 Mon, 28 Nov 2022 23:49:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3m3a2htbb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 23:49:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ASNmwmW262718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 23:48:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58E06A4040;
 Mon, 28 Nov 2022 23:48:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 076B1A4051;
 Mon, 28 Nov 2022 23:48:58 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.30.50])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Nov 2022 23:48:57 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/s390x: Add cdsg.c
Date: Tue, 29 Nov 2022 00:48:13 +0100
Message-Id: <20221128234813.46685-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128234051.7j3tre72owh4eyif@heavy>
References: <20221128234051.7j3tre72owh4eyif@heavy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DC_koEntD2jbyMJuq6cFxmLjt424tpdg
X-Proofpoint-GUID: 8MPVwiOGdvbz59sxIFNiohKwAjlcTmXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=749 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280169
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
 tests/tcg/s390x/cdsg.c          | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
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
index 00000000000..83313699f7d
--- /dev/null
+++ b/tests/tcg/s390x/cdsg.c
@@ -0,0 +1,73 @@
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+
+static volatile bool start;
+static unsigned long val[2] __attribute__((__aligned__(16)));
+
+void *cdsg_loop(void *arg)
+{
+    unsigned long orig0, orig1, new0, new1;
+    register unsigned long r0 asm("r0");
+    register unsigned long r1 asm("r1");
+    register unsigned long r2 asm("r2");
+    register unsigned long r3 asm("r3");
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
+        r0 = orig0;
+        r1 = orig1;
+        r2 = new0;
+        r3 = new1;
+        asm("cdsg %[r0],%[r2],%[db2]\n"
+            "ipm %[cc]"
+            : [r0] "+r" (r0)
+            , [r1] "+r" (r1)
+            , [db2] "=m" (val)
+            , [cc] "=r" (cc)
+            : [r2] "r" (r2)
+            , [r3] "r" (r3)
+            : "cc");
+        orig0 = r0;
+        orig1 = r1;
+        cc = (cc >> 28) & 3;
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


