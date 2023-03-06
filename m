Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D176ACF9D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:57:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHsT-0006SE-FS; Mon, 06 Mar 2023 15:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZHsR-0006Mc-6s; Mon, 06 Mar 2023 15:56:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZHsP-0001jb-Fp; Mon, 06 Mar 2023 15:56:10 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326IwUKD013815; Mon, 6 Mar 2023 20:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m0NULSYRz1SxcS0s0BzRxFhuzUkL99lNvSLxk0Ppt08=;
 b=JnIA9X7/d5VnOBut4VpgwlhkwTzumyGxrvynixZhJgeUByDUPU0WbxhFV3ha5vG/ZA99
 rP+QegMYa9LjIk0xTKNt8VpKpbz80FzLgJYCQSqJueZXO6RUiweRzhXLQrRTjjH6mL8z
 g4mdHfwv1bp1xPftmUvL/t10IN8xgDQqByLW/YjwFOI2CdOE73oUZUHFEczVsZ+fiqkj
 Bbq0tuFUHsYtuM6gxXLUfa9fOrI/+OGP+JY0tGUL9pHvUoJ5k/660FVkpya1ulATa3zU
 SUMLLxdFaJIXiyA9Ti3igSE0eV99ipHwLyClxDBD95Qa3XR4Rik6H60dAsvwdE/KK0O2 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uaevy5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:05 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326Ku4Cc014986;
 Mon, 6 Mar 2023 20:56:04 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uaevy56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:04 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3264rsin002528;
 Mon, 6 Mar 2023 20:56:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3p41c3tjrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326KtwfO62849380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 20:55:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB6B120040;
 Mon,  6 Mar 2023 20:55:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72D9720043;
 Mon,  6 Mar 2023 20:55:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 20:55:58 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v1 2/2] tests/tcg/s390x: Add C(G)HRL test
Date: Mon,  6 Mar 2023 21:55:54 +0100
Message-Id: <20230306205554.2070579-3-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306205554.2070579-1-nsg@linux.ibm.com>
References: <20230306205554.2070579-1-nsg@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -MOUILLEmYEHtmpi0xh20HEQXchSetKv
X-Proofpoint-ORIG-GUID: DBl0NKnL-FK1AfNVD9jdG8i3-6DI4Ww0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_13,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=795 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060178
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


