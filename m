Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24F694663
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYKa-0004y2-S4; Mon, 13 Feb 2023 07:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKZ-0004xt-Lk
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKW-00005o-V3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:14 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DCU2Mw021007; Mon, 13 Feb 2023 12:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pz7MXp7yDmzHt7053ehIx8th1yOLWVuunERxRlYWGhk=;
 b=gLoHfByiti4bxqVUQb2k1l6b13lGg9ZApWBJN6UIks1hK9T6v2OF8cN92YTGfKCyDNFA
 oNGgWrUYxL+gIXhcU+nX3B0jYK9pv1IUrHWdVhnLxuuoxlcm+tFtC2CIx11MgiirY1At
 p9fsWjKzJ+7oeI6zha73NZx//zRZLNQAdVu6wRZb0J07n3e36fEUCzVMeCJwq4tJzx1/
 AB4nSYe27xz0OKEmEYGRjltSnXI+CUzUGHPA9wRqtkMbUHBGo5xh9HNOKA0bUcaTvJY0
 PYhZaogVcgycxbY8Hz25+ClaTjneCwIaH76EYOB5Bwzl7dqQBwZpt9xlY9A+Z7f9NXqM Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn8y0grs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:53:04 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DCVii3002610;
 Mon, 13 Feb 2023 12:53:03 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn8y0gqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:53:03 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31D8lIPI007609;
 Mon, 13 Feb 2023 12:53:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3np2n69ynp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:53:01 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DCqvXk20709746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 12:52:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7569620040;
 Mon, 13 Feb 2023 12:52:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF65520043;
 Mon, 13 Feb 2023 12:52:56 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.19.58])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 12:52:56 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 4/4] tests/tcg/linux-test: Add linux-fork-trap test
Date: Mon, 13 Feb 2023 13:52:37 +0100
Message-Id: <20230213125238.331881-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213125238.331881-1-iii@linux.ibm.com>
References: <20230213125238.331881-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TQbAzbO623F1v7THyghlE0fYVYguxFy4
X-Proofpoint-ORIG-GUID: umztCvxfKZKxNcKSD036OJNubfpH9AEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_07,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=751 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130112
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

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


