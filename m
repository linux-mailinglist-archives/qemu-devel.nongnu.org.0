Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB663BE8F5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:44:33 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17qq-0001cy-V8
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pd-0007MJ-CE; Wed, 07 Jul 2021 09:43:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pb-00064y-Gk; Wed, 07 Jul 2021 09:43:17 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167DXtvf165678; Wed, 7 Jul 2021 09:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PPvyftQaSoVUV5zvRZWbw99RoIbePRuZu1v4EQhjEOA=;
 b=kWalRqnWCsvT5tLc4mXCKf7UUt4B8j1Y6qwAanTDfSVpVKKR1O2wD7Y9PtO2rUM3CsNK
 L/u7j1xh4IWJNFFp7PX6zNDRCTyXcW6dm4+Afi8GHWWkZeyHa9+CmTZNfQ8PLNfsyWQ+
 L/ozndooPSCZE6fRapL87Zc3sCq0uvXfAVGbBMJ4YthOPWilDK7AIEMjR6Xisbv1t4mB
 Sfz0nH+lM7YJpJflt4Cx4QJh4X5ZX3Tl/nUbRWOf1kcn4KdFJl3GQ3nYTJVk9LiHCHTf
 0KiNQ8kMvnSmFUM3CYjSC1WuhXVfPUH33eWp6uAdglVKNExTpifwiEOLInW6nMHJm7rY CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts0ke9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:13 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167DY5Fq166214;
 Wed, 7 Jul 2021 09:43:13 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts0ke96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:12 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 167DXwVb012938;
 Wed, 7 Jul 2021 13:43:12 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 39jfhd27f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 13:43:12 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 167DhAQr35979622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 13:43:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBE192805A;
 Wed,  7 Jul 2021 13:43:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DF5F28065;
 Wed,  7 Jul 2021 13:43:10 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.77.134.179])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Jul 2021 13:43:10 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests/tcg: Test that compare-and-trap raises SIGFPE
Date: Wed,  7 Jul 2021 09:42:31 -0400
Message-Id: <20210707134231.1835-3-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2R3JQxPkfue5HQcNVcUQVyg3H2Bf9M18
X-Proofpoint-GUID: CaPXvVMZKGPPzzxsUxOLfGCqTPyJBglK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_06:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070081
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ruixin.bao@ibm.com,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 tests/tcg/s390x/trap.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0a5b25c156..d440ecd6f7 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -9,6 +9,7 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=trap
 
 # This triggers failures on s390x hosts about 4% of the time
 run-signals: signals
diff --git a/tests/tcg/s390x/trap.c b/tests/tcg/s390x/trap.c
new file mode 100644
index 0000000000..d4c61c7f52
--- /dev/null
+++ b/tests/tcg/s390x/trap.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright 2021 IBM Corp.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <string.h>
+#include <signal.h>
+
+static void error1(const char *filename, int line, const char *fmt, ...)
+{
+    va_list ap;
+    va_start(ap, fmt);
+    fprintf(stderr, "%s:%d: ", filename, line);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    va_end(ap);
+    exit(1);
+}
+
+static int __chk_error(const char *filename, int line, int ret)
+{
+    if (ret < 0) {
+        error1(filename, line, "%m (ret=%d, errno=%d/%s)",
+               ret, errno, strerror(errno));
+    }
+    return ret;
+}
+
+#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
+
+#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
+
+int sigfpe_count;
+int sigill_count;
+
+static void sig_handler(int sig, siginfo_t *si, void *puc)
+{
+    if (sig == SIGFPE) {
+        if (si->si_code != 0) {
+            error("unexpected si_code: 0x%x != 0", si->si_code);
+        }
+        ++sigfpe_count;
+        return;
+    }
+
+    if (sig == SIGILL) {
+        ++sigill_count;
+        return;
+    }
+
+    error("unexpected signal 0x%x\n", sig);
+}
+
+int main(int argc, char **argv)
+{
+    sigfpe_count = sigill_count = 0;
+
+    struct sigaction act;
+
+    /* Set up SIG handler */
+    act.sa_sigaction = sig_handler;
+    sigemptyset(&act.sa_mask);
+    act.sa_flags = SA_SIGINFO;
+    chk_error(sigaction(SIGFPE, &act, NULL));
+    chk_error(sigaction(SIGILL, &act, NULL));
+
+    uint64_t z = 0x0ull;
+    uint64_t lz = 0xffffffffffffffffull;
+    asm volatile (
+        "lg %%r13,%[lz]\n"
+        "cgitne %%r13,0\n" /* SIGFPE */
+        "lg %%r13,%[z]\n"
+        "cgitne %%r13,0\n" /* no trap */
+        "nopr\n"
+        "lg %%r13,%[lz]\n"
+        "citne %%r13,0\n" /* SIGFPE */
+        "lg %%r13,%[z]\n"
+        "citne %%r13,0\n" /* no trap */
+        "nopr\n"
+        :
+        : [z] "m" (z), [lz] "m" (lz)
+        : "memory", "r13");
+
+    if (sigfpe_count != 2) {
+        error("unexpected SIGFPE count: %d != 2", sigfpe_count);
+    }
+    if (sigill_count != 0) {
+        error("unexpected SIGILL count: %d != 0", sigill_count);
+    }
+
+    printf("PASS\n");
+    return 0;
+}
-- 
2.31.1


