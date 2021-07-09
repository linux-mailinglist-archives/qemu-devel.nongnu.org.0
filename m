Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC53C274D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:08:01 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t2m-0003FD-Oy
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0J-0008Ch-BT; Fri, 09 Jul 2021 12:05:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0H-0007BU-FK; Fri, 09 Jul 2021 12:05:27 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169G40FY057490; Fri, 9 Jul 2021 12:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PPvyftQaSoVUV5zvRZWbw99RoIbePRuZu1v4EQhjEOA=;
 b=PFXG5XG4Yw9bVmKT9UxaE4455ilb8cJYe4jKnwazUnljtwSPlIfttOmCh+caP4IbeXi3
 mzGkGmTf4R+5J3r+YfG+qVqb85sf8sBFClMaxC474yT3g05KxUvHvd7YKZqvX1Qb6adl
 yq5s0SS98GHOfpehRp12/pR1FI4p0YmvODmQgiwaKKmNa3XpP7/4NuJ4dgVLDI+v5Hs6
 u32uEim+clKUUMlDKhtLeB3ptLXKM8vtfmWzzZVG5+iC4hyULTTQecpUR/tn6k+vfr7R
 HQCvlGRMqirxP9vuSz1yTv6mXl4u4LuY1y5Ay5y0+EMEeLJXt98huz38lNScwmdaev/9 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcs6mpe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:22 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 169G4CgP058576;
 Fri, 9 Jul 2021 12:05:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcs6mpd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 169FwCvJ008560;
 Fri, 9 Jul 2021 16:05:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 39jfhdvt9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 16:05:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 169G5Kk640174018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 16:05:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFDB12805E;
 Fri,  9 Jul 2021 16:05:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE5C28058;
 Fri,  9 Jul 2021 16:05:19 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.254.146])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jul 2021 16:05:19 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] tests/tcg: Test that compare-and-trap raises SIGFPE
Date: Fri,  9 Jul 2021 12:04:59 -0400
Message-Id: <20210709160459.4962-3-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9qP9dizXKF8hnPezSgKQThwqf3jYjjEY
X-Proofpoint-GUID: UY1ts58zIEoGLSmXbOD_VpvFMDw7c6vh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_10:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090081
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


