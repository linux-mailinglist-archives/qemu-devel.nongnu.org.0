Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25899685C65
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 01:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN1Gg-0006NK-ET; Tue, 31 Jan 2023 19:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1Ge-0006MT-1E
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1Gb-0004Jz-IX
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:27 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VM0ikJ003264; Wed, 1 Feb 2023 00:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5Dncu3fDp4KaNdR+nzKKjfpEqYCUNuYvmiIc/96SuoI=;
 b=M0iujoMRS1NOCI2Qtl54loKjaynfxH45dSzqTdLxIiCTf9hem2R4WFvkzcBXhWra6g3c
 n6rKpeAS3Yek6i9jftmAsTKsvS21hUYA0jHmC9UB9IGY6k+9FBvqmOWJk2Lv57RVkvlA
 S9+0spyNOSB6MKUBldrzo7nFN8b9aJMvN2tMPxpDjOj5/C74g/r7CTpAac8FeA3BLTCf
 318K4nWXeh6zQoozfaxYh3vivRmBtQBv6QvEIXWDJl2usuIiGqB+yqRZYygKgoK2piJG
 WpnXv0yGRb9TLbKf/EYXK6x5N0roa2yeXoG7svRJz/pEdHTpxqY5lHLTd35fVFixWboV tw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf83d967p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VJfGHc030067;
 Wed, 1 Feb 2023 00:46:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshaxqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3110kI3739453008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 00:46:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBB802004B;
 Wed,  1 Feb 2023 00:46:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7829320040;
 Wed,  1 Feb 2023 00:46:18 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.18.228])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 00:46:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 4/4] tests/tcg/linux-test: Add linux-fork-trap test
Date: Wed,  1 Feb 2023 01:46:09 +0100
Message-Id: <20230201004609.3005029-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201004609.3005029-1-iii@linux.ibm.com>
References: <20230201004609.3005029-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4ytAdfIl2-Jo4-ZftggRvuQE8vLXOq2h
X-Proofpoint-GUID: 4ytAdfIl2-Jo4-ZftggRvuQE8vLXOq2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=642
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010003
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

Check that dying due to a signal does not deadlock.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/linux/linux-fork-trap.c | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

diff --git a/tests/tcg/multiarch/linux/linux-fork-trap.c b/tests/tcg/multiarch/linux/linux-fork-trap.c
new file mode 100644
index 00000000000..a921f875380
--- /dev/null
+++ b/tests/tcg/multiarch/linux/linux-fork-trap.c
@@ -0,0 +1,48 @@
+/*
+ * Test that a fork()ed process terminates after __builtin_trap().
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
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
+
+    return EXIT_SUCCESS;
+}
-- 
2.39.1


