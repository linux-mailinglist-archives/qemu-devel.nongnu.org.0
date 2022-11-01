Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49A614846
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppCw-0003kg-Gg; Tue, 01 Nov 2022 07:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oppCs-0003kB-S5
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:13:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oppCr-0007wk-7U
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:13:22 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1AHUjU007939;
 Tue, 1 Nov 2022 11:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w8ZHiX9CnexXE2maxve0S6V/u25R38e9nZ0NQFyoERo=;
 b=nIYJ4iyUTTxWeOYvMiJQQ/yNf9uRzICLQQAeBH8eLrYxp2IALR48rveOWkxyRMZWkQEZ
 yRWQDFPTuG4hKMWK6PQS2l+5Ki1FCJ1UuIoPvlMxEq05kPWxFHt1iwrhLuM073xujQsG
 v0kLbB8ky2Bou8MHaToX3Z7hR5M7q/mesUTe30U/+QUoEuSIiiLHpuHBaYpreCktWRNU
 wOlkMwfddEFw5g0f2/nvKLDI8ukqfKlcr5SFwiVWShqGmEfox0TRUQ9M8Zza0xSSfCsS
 B+ZsFEApOuceeYV6ov/dpQzdr3FP3dy4MHF0P5BxbvkO5nVdHZHCSwWg2aYIiIzC/NpZ 0w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjw3k9267-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 11:13:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A1B7clI015061;
 Tue, 1 Nov 2022 11:13:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3kguehvdc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 11:13:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A1B7iH341550106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Nov 2022 11:07:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D7A3A404D;
 Tue,  1 Nov 2022 11:13:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31640A4040;
 Tue,  1 Nov 2022 11:13:12 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Nov 2022 11:13:12 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/s390x: Add div.c
Date: Tue,  1 Nov 2022 12:13:00 +0100
Message-Id: <20221101111300.2539919-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073006.2398819-2-richard.henderson@linaro.org>
References: <20221021073006.2398819-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TDXoPlDGLQYoVDleXW1q-pfEpjwytplz
X-Proofpoint-ORIG-GUID: TDXoPlDGLQYoVDleXW1q-pfEpjwytplz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_06,2022-11-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=700 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211010080
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/div.c           | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/s390x/div.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index c882db7a78a..f2ec7587387 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -26,6 +26,7 @@ TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=clst
 TESTS+=long-double
+TESTS+=div
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
new file mode 100644
index 00000000000..58072956147
--- /dev/null
+++ b/tests/tcg/s390x/div.c
@@ -0,0 +1,40 @@
+#include <assert.h>
+#include <stdint.h>
+
+static void test_dr(void)
+{
+    register int32_t r0 asm("r0") = -1;
+    register int32_t r1 asm("r1") = -4241;
+    int32_t b = 101, q, r;
+
+    asm("dr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlr(void)
+{
+    register uint32_t r0 asm("r0") = 0;
+    register uint32_t r1 asm("r1") = 4243;
+    uint32_t b = 101, q, r;
+
+    asm("dlr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
+int main(void)
+{
+    test_dr();
+    test_dlr();
+}
-- 
2.37.2


