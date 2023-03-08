Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BEE6B1380
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:04:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0wI-0007S2-9R; Wed, 08 Mar 2023 16:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vz-0007RA-Px; Wed, 08 Mar 2023 16:02:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vx-0004xP-MC; Wed, 08 Mar 2023 16:02:51 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328KHnA2012095; Wed, 8 Mar 2023 21:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m0NULSYRz1SxcS0s0BzRxFhuzUkL99lNvSLxk0Ppt08=;
 b=nuPX0DVsj/Z1Ycj1bs/SOS7luhKFFZFiucDJIANh/zYltm/EgcCqtmy17FOTqiRH7jTe
 539taP61GRKmpSah7/lg+wM1I+7CZHacIRbMAV4DjhtryFfq0jOG3bT+BHk5No8n4JwJ
 Bx6oojFgebYhfisKCDF2+3B6FKDh5Pmub/wujDFPkhc35/idgruQJ2G3Tr4I9jksp59l
 GrMEOKt5lGxs5gr+gW6LTrRL0haq22wOxtgBBnkv2jsUM5AyhAwhKhUmTshe1IGHw1JY
 EBh8H5TGl9tmUIgdw0SOJPm6wlwHzF12YDN87nD9w029vZ/TkDviGhtyh3aBcOmyRliA lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry3pqr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 328KtJFX009790;
 Wed, 8 Mar 2023 21:02:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry3pqm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 328DknWw022977;
 Wed, 8 Mar 2023 21:02:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p6fyssbvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 328L2SRf54788512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Mar 2023 21:02:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADC6620040;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 655FB2004D;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v2 2/2] tests/tcg/s390x: Add C(G)HRL test
Date: Wed,  8 Mar 2023 22:02:26 +0100
Message-Id: <20230308210226.2847503-3-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308210226.2847503-1-nsg@linux.ibm.com>
References: <20230308210226.2847503-1-nsg@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1fx5J41d2EroumdlIjz8d_vGQFiTVMHV
X-Proofpoint-ORIG-GUID: ftbiOC5IyQxO58NGLRFrVMuM0PnV_2FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=791 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080178
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
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

Test COMPARE HALFWORD RELATIVE LONG instructions.
Test that the bytes following the second operand do not affect the
instruction.
Test the sign extension performed on the second operand.

Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
---


I don't know what the coding style is for inline asm.
checkpatch.sh complains about the tabs inside the asm, which I find a
bit surprising given they're inside a string.
IMO emitting tabs makes sense in order to be consistent with gcc output.
I left the tabs in for now, but can remove them.


 tests/tcg/s390x/chrl.c          | 76 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 tests/tcg/s390x/chrl.c

diff --git a/tests/tcg/s390x/chrl.c b/tests/tcg/s390x/chrl.c
new file mode 100644
index 0000000000..fa33d43c59
--- /dev/null
+++ b/tests/tcg/s390x/chrl.c
@@ -0,0 +1,76 @@
+#include <stdlib.h>
+#include <assert.h>
+#include <stdint.h>
+
+static void test_chrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+               ".pushsection .rodata\n"
+        "0:	.short	1,0x8000\n"
+        "	.popsection\n"
+
+        "	chrl	%[r],0b\n"
+        "	ipm	%[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+               ".pushsection .rodata\n"
+        "0:	.short	-1,0x8000\n"
+        "	.popsection\n"
+
+        "	chrl	%[r],0b\n"
+        "	ipm	%[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+static void test_cghrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+               ".pushsection .rodata\n"
+        "0:	.short	1,0x8000,0,0\n"
+        "	.popsection\n"
+
+        "	cghrl	%[r],0b\n"
+        "	ipm	%[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+               ".pushsection .rodata\n"
+        "0:	.short	-1,0x8000,0,0\n"
+        "	.popsection\n"
+
+        "	cghrl	%[r],0b\n"
+        "	ipm	%[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+int main(void)
+{
+    test_chrl();
+    test_cghrl();
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 72ad309b27..a3d3beeffe 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -28,6 +28,7 @@ TESTS+=div
 TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
+TESTS+=chrl
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
-- 
2.37.2


