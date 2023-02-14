Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047656965F1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvza-0002vX-PS; Tue, 14 Feb 2023 09:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzQ-0002qQ-Rz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:09:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzP-0002sM-7v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:09:00 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EDoHrN001758; Tue, 14 Feb 2023 14:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cljWyfQzlHde0c2E4jBmfno1X7SMP5F4ZQpJIy8WO+o=;
 b=Kk1dHaMB06WSJjGtvahupoe+j6F4HvBq0zD6blLn/HoNRAIfDQWOLMpmZYE1707F34M4
 Sy9TNlb156szIYXHHdFHLX6yjj5Ke2NxipkWHxvCi1Ndku1WMC20YZw4v7I45L9iiYwJ
 86ZivEYCe1Dl3J4lWHPMkDJfp6s6AYxQRZSw2B7CJsZtBaCYDRIPuf57nUcUgkcEGf7p
 HIxxNNyRZVfVKsPiCjG7p/38BqUb9DS5n5p9bTi9pE+tNYiIVs/P791agnBbKlGDCVMS
 zQMdz8oeGNkN3MHGajFDHdCyzNxSf3CWMGAyxuSRHPxjgG+2MiszQt8jPWH8U3qt4xVe Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrbhb8tab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:49 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EDtMFR019964;
 Tue, 14 Feb 2023 14:08:49 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrbhb8t8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E5YPO5030092;
 Tue, 14 Feb 2023 14:08:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fm44v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EE8fLN39715256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 14:08:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE3D52005A;
 Tue, 14 Feb 2023 14:08:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A27A2004E;
 Tue, 14 Feb 2023 14:08:41 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.76.115])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 14:08:41 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 4/4] tests/tcg/linux-test: Add linux-fork-trap test
Date: Tue, 14 Feb 2023 15:08:29 +0100
Message-Id: <20230214140829.45392-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214140829.45392-1-iii@linux.ibm.com>
References: <20230214140829.45392-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r6H-qBVL5CgD_6WOLsXL3yhAm8FIlD3h
X-Proofpoint-ORIG-GUID: RTxD127KJaipooVDUEaKXPxg6nB7IoxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=996 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140120
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

Check that dying due to a signal does not deadlock.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 +++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

diff --git a/tests/tcg/multiarch/linux/linux-fork-trap.c b/tests/tcg/multiarch/linux/linux-fork-trap.c
new file mode 100644
index 00000000000..2bfef800c3e
--- /dev/null
+++ b/tests/tcg/multiarch/linux/linux-fork-trap.c
@@ -0,0 +1,51 @@
+/*
+ * Test that a fork()ed process terminates after __builtin_trap().
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/resource.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+int main(void)
+{
+    struct rlimit nodump;
+    pid_t err, pid;
+    int wstatus;
+
+    pid = fork();
+    assert(pid != -1);
+    if (pid == 0) {
+        /* We are about to crash on purpose; disable core dumps. */
+        if (getrlimit(RLIMIT_CORE, &nodump)) {
+            return EXIT_FAILURE;
+        }
+        nodump.rlim_cur = 0;
+        if (setrlimit(RLIMIT_CORE, &nodump)) {
+            return EXIT_FAILURE;
+        }
+        /*
+         * An alternative would be to dereference a NULL pointer, but that
+         * would be an UB in C.
+         */
+        printf("about to trigger fault...\n");
+#if defined(__MICROBLAZE__)
+        /*
+         * gcc emits "bri 0", which is an endless loop.
+         * Take glibc's ABORT_INSTRUCTION.
+         */
+        asm volatile("brki r0,-1");
+#else
+        __builtin_trap();
+#endif
+    }
+    err = waitpid(pid, &wstatus, 0);
+    assert(err == pid);
+    assert(WIFSIGNALED(wstatus));
+    printf("faulting thread exited cleanly\n");
+
+    return EXIT_SUCCESS;
+}
-- 
2.39.1


