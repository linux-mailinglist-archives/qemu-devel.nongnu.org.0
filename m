Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637D38C593
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:21:16 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3DP-0003H1-GM
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3Ba-0001or-Cg; Fri, 21 May 2021 07:19:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3BW-0002wq-LZ; Fri, 21 May 2021 07:19:22 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LB46T2156372; Fri, 21 May 2021 07:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DIAr1n7UsFaUqX12/DV9CtfQn3d7GiXXtqikGBUVW+E=;
 b=WXKc4XgtygKFmPuKWCVfpyl7DKwp8LSer3sn6BJQbZEolqZQTG9bAE53Bx0dblW+2UI5
 ZdAMkNdD9eQwXd97aNzxyCw/YPhvNmXusEOzsjxQ0ofXWDkzJPov+DxYaRmiPkCr9z6P
 oEK4nqIn3G1/DZLXEKsKedYW3IRdXU1bckNvhhT31rIjTDMahvL8iATNIDFMpjICLh5H
 7xT+8AFAzOj3TbppX2aELziTFtgacx5tM/F9/lO4Lg05gR6fMR0VeVSdYVsG3fyDJjKC
 qp08HrzXKORj8O3iZSQBbUfuan2iwE6A8GL1L5V2JfG+whMvKB44I+8fvamR9dSryZnR dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pb7jh1j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:17 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LB4PUQ157381;
 Fri, 21 May 2021 07:19:16 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pb7jh1hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LB819Z014233;
 Fri, 21 May 2021 11:19:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgu3e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 11:19:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LBJCJV42140114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 11:19:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1572AE04D;
 Fri, 21 May 2021 11:19:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B996AE045;
 Fri, 21 May 2021 11:19:11 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 11:19:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 2/2] tests/tcg/s390x: Test SIGILL handling
Date: Fri, 21 May 2021 13:19:08 +0200
Message-Id: <20210521111908.2843735-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521111908.2843735-1-iii@linux.ibm.com>
References: <20210521111908.2843735-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qC_gjk_cQjYqz-MpRywVfhaJ_kuRCoa6
X-Proofpoint-GUID: 3kfYrUmuxNAfDvott_SfcJJsKgoI2nIA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that s390x-specific uc_mcontext.psw.addr is reported correctly.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/sigill.c        | 52 +++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 tests/tcg/s390x/sigill.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 241ef28f61..8699d829a5 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -8,3 +8,4 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=sigill
diff --git a/tests/tcg/s390x/sigill.c b/tests/tcg/s390x/sigill.c
new file mode 100644
index 0000000000..aab560b30f
--- /dev/null
+++ b/tests/tcg/s390x/sigill.c
@@ -0,0 +1,52 @@
+#include <assert.h>
+#include <signal.h>
+#include <string.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+/*
+ * The labels for the instruction that generates a SIGILL and for the one that
+ * follows it. They could have been defined in a separate .s file, but this
+ * would complicate the build, so use the inline asm instead.
+ */
+
+void expected_si_addr(void);
+void expected_psw_addr(void);
+
+asm(".globl\texpected_si_addr\n"
+    "expected_si_addr:\t.byte\t0x00,0x00\n"
+    "\t.globl\texpected_psw_addr\n"
+    "expected_psw_addr:\tbr\t%r14");
+
+static void handle_signal(int sig, siginfo_t *info, void *ucontext)
+{
+    if (sig != SIGILL) {
+        _exit(1);
+    }
+
+    if (info->si_addr != expected_si_addr) {
+        _exit(2);
+    }
+
+    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr !=
+            (unsigned long)expected_psw_addr) {
+        _exit(3);
+    }
+}
+
+int main(void)
+{
+    struct sigaction act;
+    int ret;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_signal;
+    act.sa_flags = SA_SIGINFO;
+
+    ret = sigaction(SIGILL, &act, NULL);
+    assert(ret == 0);
+
+    expected_si_addr();
+
+    return 0;
+}
-- 
2.31.1


