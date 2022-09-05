Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D85AD6E4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:51:45 +0200 (CEST)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEO0-0001FW-Es
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVEMI-0008BO-BO
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:49:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVEMG-0003yb-55
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:49:57 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285FmF9a020448;
 Mon, 5 Sep 2022 15:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=eLN52ewhCRoeGT/iRfkvTU2sBWQ26qFuAD7fd7sjkGQ=;
 b=Gzc8ajNCl5tRvfQiYDLReGNxfgvOD7fjujsheA+yRgZ9whtjg27OFKsOvulk2xnUy6eu
 pnxdr6f7ryUOVpnc/ldhbCeo/RddCanLMMGVITcKf2vNfS+55q98beFI3O8vjlq9Uuxp
 5anMibq51ewV1wNWkXbf0FPHwaRLSLXzVZU1IzbwPDkyS1L1SY2D/9BgHJeOOLGJYmB9
 IKDCp7/zPVnJdOuHuKWMIPksYjvtiT0XL/4N1S2MCN0ZiTCo0HxTVF+bCiIi830i5xWN
 Wo28QtH5S8P9DQ1G6nfx+ZcMcQ1yIe0+s/VkTvoUYRQLlrUS3ss7Q7VhjlkoVWeQ8E/d BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdm2xg18x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:49:51 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285Fnp1v029919;
 Mon, 5 Sep 2022 15:49:51 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdm2xg188-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:49:51 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285FeDN9021725;
 Mon, 5 Sep 2022 15:49:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3jbxj8sy65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:49:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 285Fnjk832768428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Sep 2022 15:49:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D249611C050;
 Mon,  5 Sep 2022 15:49:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83FAA11C04C;
 Mon,  5 Sep 2022 15:49:45 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Sep 2022 15:49:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2] tests/tcg/x86_64: add cross-modifying code test
Date: Mon,  5 Sep 2022 17:49:44 +0200
Message-Id: <20220905154944.1284289-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AMJeZIUwsuet9w7bSzHFt6gMOb7KDgz-
X-Proofpoint-GUID: acAGTe5neXPUP7aSYSK3iMH8CRto7H7Q
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_12,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit f025692c992c ("accel/tcg: Clear PAGE_WRITE before translation")
fixed cross-modifying code handling, but did not add a test. The
changed code was further improved recently [1], and I was not sure
whether these modifications were safe (spoiler: they were fine).

Add a test to make sure there are no regressions.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00034.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00455.html
v1 -> v2: Fix tweaking the flags (Alex).
          Keep the custom build rule for now.

 tests/tcg/x86_64/Makefile.target        |  6 +-
 tests/tcg/x86_64/cross-modifying-code.c | 80 +++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/x86_64/cross-modifying-code.c

diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 6177fd845a..3d9bc3377b 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -10,6 +10,7 @@ include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
 ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
+X86_64_TESTS += cross-modifying-code
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
@@ -23,5 +24,8 @@ test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
-vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
+%: $(SRC_PATH)/tests/tcg/x86_64/%.c
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+cross-modifying-code: CFLAGS+=-pthread
+cross-modifying-code: LDFLAGS+=-pthread
diff --git a/tests/tcg/x86_64/cross-modifying-code.c b/tests/tcg/x86_64/cross-modifying-code.c
new file mode 100644
index 0000000000..2704df6061
--- /dev/null
+++ b/tests/tcg/x86_64/cross-modifying-code.c
@@ -0,0 +1,80 @@
+/*
+ * Test patching code, running in one thread, from another thread.
+ *
+ * Intel SDM calls this "cross-modifying code" and recommends a special
+ * sequence, which requires both threads to cooperate.
+ *
+ * Linux kernel uses a different sequence that does not require cooperation and
+ * involves patching the first byte with int3.
+ *
+ * Finally, there is user-mode software out there that simply uses atomics, and
+ * that seems to be good enough in practice. Test that QEMU has no problems
+ * with this as well.
+ */
+
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+
+void add1_or_nop(long *x);
+asm(".pushsection .rwx,\"awx\",@progbits\n"
+    ".globl add1_or_nop\n"
+    /* addq $0x1,(%rdi) */
+    "add1_or_nop: .byte 0x48, 0x83, 0x07, 0x01\n"
+    "ret\n"
+    ".popsection\n");
+
+#define THREAD_WAIT 0
+#define THREAD_PATCH 1
+#define THREAD_STOP 2
+
+static void *thread_func(void *arg)
+{
+    int val = 0x0026748d; /* nop */
+
+    while (true) {
+        switch (__atomic_load_n((int *)arg, __ATOMIC_SEQ_CST)) {
+        case THREAD_WAIT:
+            break;
+        case THREAD_PATCH:
+            val = __atomic_exchange_n((int *)&add1_or_nop, val,
+                                      __ATOMIC_SEQ_CST);
+            break;
+        case THREAD_STOP:
+            return NULL;
+        default:
+            assert(false);
+            __builtin_unreachable();
+        }
+    }
+}
+
+#define INITIAL 42
+#define COUNT 1000000
+
+int main(void)
+{
+    int command = THREAD_WAIT;
+    pthread_t thread;
+    long x = 0;
+    int err;
+    int i;
+
+    err = pthread_create(&thread, NULL, &thread_func, &command);
+    assert(err == 0);
+
+    __atomic_store_n(&command, THREAD_PATCH, __ATOMIC_SEQ_CST);
+    for (i = 0; i < COUNT; i++) {
+        add1_or_nop(&x);
+    }
+    __atomic_store_n(&command, THREAD_STOP, __ATOMIC_SEQ_CST);
+
+    err = pthread_join(thread, NULL);
+    assert(err == 0);
+
+    assert(x >= INITIAL);
+    assert(x <= INITIAL + COUNT);
+
+    return EXIT_SUCCESS;
+}
-- 
2.37.2


