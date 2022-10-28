Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522046111C8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:44:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOhg-00023L-CO; Fri, 28 Oct 2022 08:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOhN-0001hu-Hn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOhF-00064y-E5
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:56 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SCOlMf037606;
 Fri, 28 Oct 2022 12:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VdxPTl3PYzSF/etfqvu4vIPffjXQdMNkqzRIeTxS+Ls=;
 b=COYwXAkXQFNrKrZ+M/M+zhYc7rNXGflrh5GMcx1OAnBAnq4ixnqUWcI/WcaciWkxlCzP
 lMpI6o1kMncTtHrhiPj9T+8uocv6/oSEXwz8Q1v4eJ0B73je7xIhFp4p5deDb/+XHtJZ
 4Kzg+5T6Lt272l8wtUf+OeXznYQDeCZfA8m34ooZlOGfVihAVFnnxexKOKBPcbumm7i/
 7+hMUmkAbpKPdsk49AE6M9CQ2XzBKHxeEdhCiVdAZ0eDrgZWBe/71VPtCZ5vBptr35K5
 Kq4jtX3RhEUTEwiCvsruAp/OGwRV4VBw/6t+CwHQCEt4W1OneuoZ8q6qUHW9pAo6Mtnt zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf2k0way-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SCPGPW040418;
 Fri, 28 Oct 2022 12:42:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf2k0w94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SCa6NQ000955;
 Fri, 28 Oct 2022 12:42:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3kftf1spej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29SCbJod36569368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 12:37:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E059A4053;
 Fri, 28 Oct 2022 12:42:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E073A4055;
 Fri, 28 Oct 2022 12:42:38 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 12:42:38 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/multiarch: Add munmap-pthread.c
Date: Fri, 28 Oct 2022 14:42:27 +0200
Message-Id: <20221028124227.2354792-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221028124227.2354792-1-iii@linux.ibm.com>
References: <20221028124227.2354792-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rcLeGqdTkmMaw8eMAIjRApjsnRdxONkk
X-Proofpoint-GUID: kqBENIP9kQDOWVf5sNA7WpDudI69QsLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280077
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a test to detect races between munmap() and creating new threads.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/Makefile.target  |  3 ++
 tests/tcg/multiarch/munmap-pthread.c | 71 ++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 tests/tcg/multiarch/munmap-pthread.c

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 78104f9bbb7..5f0fee1aadb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -36,6 +36,9 @@ threadcount: LDFLAGS+=-lpthread
 
 signals: LDFLAGS+=-lrt -lpthread
 
+munmap-pthread: CFLAGS+=-pthread
+munmap-pthread: LDFLAGS+=-pthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/multiarch/munmap-pthread.c b/tests/tcg/multiarch/munmap-pthread.c
new file mode 100644
index 00000000000..d2ac9aae604
--- /dev/null
+++ b/tests/tcg/multiarch/munmap-pthread.c
@@ -0,0 +1,71 @@
+/* Test that munmap() and thread creation do not race. */
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+static const char nop_func[] = {
+#if defined(__s390__)
+    /* br %r14 */
+    0x07, 0xfe,
+#elif defined(__i386__) || defined(__x86_64__)
+    /* ret */
+    0xc3,
+#endif
+};
+
+static void *thread_mmap_munmap(void *arg)
+{
+    volatile bool *run = arg;
+    char *p;
+    int ret;
+
+    while (*run) {
+        p = mmap(NULL, getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC,
+                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        assert(p != MAP_FAILED);
+        if (sizeof(nop_func) != 0) {
+            /*
+             * Create a small translation block if we have a template for the
+             * current architecture.
+             */
+            memcpy(p, nop_func, sizeof(nop_func));
+            ((void(*)(void))p)();
+        }
+        ret = munmap(p, getpagesize());
+        assert(ret == 0);
+    }
+
+    return NULL;
+}
+
+static void *thread_dummy(void *arg)
+{
+    return NULL;
+}
+
+int main(void)
+{
+    pthread_t mmap_munmap, dummy;
+    volatile bool run = true;
+    int i, ret;
+
+    ret = pthread_create(&mmap_munmap, NULL, thread_mmap_munmap, (void *)&run);
+    assert(ret == 0);
+
+    for (i = 0; i < 1000; i++) {
+        ret = pthread_create(&dummy, NULL, thread_dummy, NULL);
+        assert(ret == 0);
+        ret = pthread_join(dummy, NULL);
+        assert(ret == 0);
+    }
+
+    run = false;
+    ret = pthread_join(mmap_munmap, NULL);
+    assert(ret == 0);
+
+    return EXIT_SUCCESS;
+}
-- 
2.37.2


