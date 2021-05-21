Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4538BCD4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:03:40 +0200 (CEST)
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvRr-0006OE-Ju
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQF-0004tP-OU; Thu, 20 May 2021 23:02:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59940
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQD-0005Sp-53; Thu, 20 May 2021 23:01:59 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L2YEBe002137; Thu, 20 May 2021 23:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2+hPymc5IEHsm46D2OWsUqYcFUy3ZRQoir022thuC9k=;
 b=h9bwtEIqBwHM3tO/90W8Py1AGzBSvpSXtizdqtrabanYAGn+JcQeU2qeam9YcFeIBzn1
 gbfOx0+mICIILyivrzT+jgOAvEwtUBmKuWDvlsdO8Ct7kc/Ds7XB5IvKImOk2w4eaUnb
 FBHzD1hHeFzXSqaI52R+fegJDVzxwzQwEpojVR9gtmARaGPOUxojBB+KwI8xwwn0ALWS
 2+dhK+izSXTnOXK7vtkN4fDcIUEijkno+8DdMHOvXt6MaugmKP7Z7J59BupLhul3HnuJ
 RiYRJYGiDPZuFSgb4UCwivQYIDFMNY66VfPdnCe2dVhQfdcFDrgf2LyDmlWejIv2I8eT 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p293afe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:54 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L2YrOu006457;
 Thu, 20 May 2021 23:01:54 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38p293afdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:54 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L2qKWK032589;
 Fri, 21 May 2021 03:01:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 38j5jh1md6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:01:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L31nY133554794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 03:01:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAA45A4057;
 Fri, 21 May 2021 03:01:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC58A4040;
 Fri, 21 May 2021 03:01:49 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 03:01:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] tests/tcg/s390x: Test SIGILL handling
Date: Fri, 21 May 2021 05:01:46 +0200
Message-Id: <20210521030146.2831663-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521030146.2831663-1-iii@linux.ibm.com>
References: <20210521030146.2831663-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -JrxCEDf0QvfK60z5Fd990NypDYUj0kO
X-Proofpoint-ORIG-GUID: E8vJUXhpV080fuk28tmMAqYoFqKRtfFG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_07:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210017
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
 tests/tcg/s390x/sigill.c        | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)
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
index 0000000000..f8021dc6af
--- /dev/null
+++ b/tests/tcg/s390x/sigill.c
@@ -0,0 +1,41 @@
+#include <assert.h>
+#include <signal.h>
+#include <string.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+extern char expected_si_addr[];
+extern char expected_psw_addr[];
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
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_signal;
+    act.sa_flags = SA_SIGINFO;
+
+    int ret = sigaction(SIGILL, &act, NULL);
+    assert(ret == 0);
+
+    asm volatile("expected_si_addr:\t.byte\t0x00,0x00\n"
+                 "expected_psw_addr:");
+
+    return 0;
+}
-- 
2.31.1


