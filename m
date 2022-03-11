Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989334D68BA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:51:29 +0100 (CET)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkMK-00011X-J4
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKS-0007L3-PV; Fri, 11 Mar 2022 13:49:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18310
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKR-0007R7-0L; Fri, 11 Mar 2022 13:49:32 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BGKrja006821; 
 Fri, 11 Mar 2022 18:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iqvkK969h6sUZLKTp5hV90rR77w7kCt5U9CHSe8tYeM=;
 b=s6Hm1Ig9gMB1LS+LT9q5PqkjoBedcZmtF7WTXqH+/7QR3pgDMS9a65/R8eIQrxR+eNrr
 ibP1rF4ZVFCLISxkdRhB7BUlTpasQZ6mm485ELaJGB4NynSpYoPrnoy9hm85/x9Gz7/Q
 ABHe807V8iG1TnHdOky9J0HhTORh8uqsXK+tGqOHDmJ3RYSs9hh4jQfP7kT5wov2nkcz
 7IlKBVjGvr1rH0uf8BbpzYqhdMwi4b0L/IaKLtOZ5qMnmuRlpBPvFe1reDbTTe1/TTma
 JBpSbjkfyugZn5WlQDv3w1d3Nf1/i82r7hlsuASbgLoKOh71B9JRqjQTV/9BjBH8oVAw Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqg9ejjj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:29 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BImhXI003323;
 Fri, 11 Mar 2022 18:49:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqg9ejjhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BIhp6O003551;
 Fri, 11 Mar 2022 18:49:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ekyg97mne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22BInOSj39321872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 18:49:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7262AE056;
 Fri, 11 Mar 2022 18:49:23 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A54AE04D;
 Fri, 11 Mar 2022 18:49:23 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Mar 2022 18:49:23 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large negative
 offsets
Date: Fri, 11 Mar 2022 19:49:11 +0100
Message-Id: <20220311184911.557245-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311184911.557245-1-iii@linux.ibm.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XzHDyxvJ_MbH1XxLZ_mKMkW4O268uQwS
X-Proofpoint-ORIG-GUID: 7BNGdsFr8nmJ6oyxY0gVMn0RrWYmqseP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_07,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a small test in order to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 29 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 257c568c58..fd34b130f7 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -15,6 +15,7 @@ TESTS+=mvc
 TESTS+=shift
 TESTS+=trap
 TESTS+=signals-s390x
+TESTS+=branch-relative-long
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
new file mode 100644
index 0000000000..b9fcee9873
--- /dev/null
+++ b/tests/tcg/s390x/branch-relative-long.c
@@ -0,0 +1,29 @@
+#include <assert.h>
+#include <stddef.h>
+#include <sys/mman.h>
+
+int main(void)
+{
+    const unsigned short opcodes[] = {
+        0xc005,  /* brasl %r0 */
+        0xc0f4,  /* brcl 0xf */
+    };
+    size_t length = 0x100000006;
+    unsigned char *buf;
+    int i;
+
+    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
+               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(buf != MAP_FAILED);
+
+    *(unsigned short *)&buf[0] = 0x07fe;  /* br %r14 */
+    *(unsigned int *)&buf[0x100000002] = 0x80000000;
+    for (i = 0; i < sizeof(opcodes) / sizeof(opcodes[0]); i++) {
+        *(unsigned short *)&buf[0x100000000] = opcodes[i];
+        ((void (*)(void))&buf[0x100000000])();
+    }
+
+    munmap(buf, length);
+
+    return 0;
+}
-- 
2.35.1


