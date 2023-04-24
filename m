Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4116ECB85
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:46:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pque2-0003GY-D4; Mon, 24 Apr 2023 07:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudo-0003Fb-Gq; Mon, 24 Apr 2023 07:45:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudg-0002Fu-W8; Mon, 24 Apr 2023 07:45:51 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OBVrwL003081; Mon, 24 Apr 2023 11:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oQi+a+taoN7Q99Be/Lk838eknecFSA5JLW96ukaTG+c=;
 b=dI4gYUBxI71aBDBUNRxev1G9ME2COYxNGnwdE/B9lzQ4fL+OI0fZy+QxMFCQ0kbYNfsk
 quzxGqUFWXrmOyuItuCnrcX3KpR55FVAeXb+omb8EHYHYvl89JB23Hw03saMozFebrEM
 jIPrt9XCqN7itIVcg4wxy2ZvS3j4JCXVaC8FbvX7Vyy74qwtX/wbInNFX4I7qeH+UITN
 ViuSL5uyx6cx1lH4dpZjXMcvo6CA31KvWxACtFcehduNMG9W0xrSXkiobch7z+TvaaRn
 tkTiRX/CptU4hIlt4w3tdFEQeLugBaO6I9c5xopkIlogEcNQUFpIkXFV4sFEXKJeVUzr pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q461c1nug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:44 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OBXBEx012292;
 Mon, 24 Apr 2023 11:45:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q461c1nth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33NKq1vS001167;
 Mon, 24 Apr 2023 11:45:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3q477712pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OBjdqX28705282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 11:45:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A839020043;
 Mon, 24 Apr 2023 11:45:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 287B320040;
 Mon, 24 Apr 2023 11:45:39 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.2])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 11:45:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/3] tests/tcg: Make the QEMU headers available to the tests
Date: Mon, 24 Apr 2023 13:45:31 +0200
Message-Id: <20230424114533.1937153-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424114533.1937153-1-iii@linux.ibm.com>
References: <20230424114533.1937153-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MFHccQG7PuIT4ChzQnsBzA0IReEs7LEf
X-Proofpoint-ORIG-GUID: BsxpbBjRLNCFz7NPj_Erfn1sHVr3nfrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=706 clxscore=1015 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QEMU headers contain macros and functions that are useful in the
test context. Add them to tests' include path. Also provide a header
similar to "qemu/osdep.h" for use in the freestanding environment.

Tests that include <sys/auxv.h> get QEMU's copy of <elf.h>, which does
not work without <stdint.h>. Make use of the new header in these tests
in order to fix this.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/include/qemu/testdep.h   | 14 ++++++++++++++
 tests/tcg/Makefile.target      |  4 ++--
 tests/tcg/aarch64/sve-ioctls.c |  1 +
 tests/tcg/aarch64/sysregs.c    |  1 +
 4 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 tests/include/qemu/testdep.h

diff --git a/tests/include/qemu/testdep.h b/tests/include/qemu/testdep.h
new file mode 100644
index 00000000000..ddf7c543bf4
--- /dev/null
+++ b/tests/include/qemu/testdep.h
@@ -0,0 +1,14 @@
+/*
+ * Common dependencies for QEMU tests.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QEMU_TESTDEP_H
+#define QEMU_TESTDEP_H
+
+#include <stdint.h>
+#include "qemu/compiler.h"
+
+#define g_assert_not_reached __builtin_trap
+
+#endif
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 8318caf9247..5474395e693 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -85,8 +85,8 @@ TESTS=
 # additional tests which may re-use existing binaries
 EXTRA_TESTS=
 
-# Start with a blank slate, the build targets get to add stuff first
-CFLAGS=
+# Start with the minimal build flags, the build targets will extend them
+CFLAGS=-I$(SRC_PATH)/include -I$(SRC_PATH)/tests/include
 LDFLAGS=
 
 QEMU_OPTS=
diff --git a/tests/tcg/aarch64/sve-ioctls.c b/tests/tcg/aarch64/sve-ioctls.c
index 9544dffa0ee..11a0a4e47ff 100644
--- a/tests/tcg/aarch64/sve-ioctls.c
+++ b/tests/tcg/aarch64/sve-ioctls.c
@@ -8,6 +8,7 @@
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
+#include "qemu/testdep.h"
 #include <sys/prctl.h>
 #include <asm/hwcap.h>
 #include <stdio.h>
diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index 46b931f781d..35ec25026a9 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -11,6 +11,7 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
+#include "qemu/testdep.h"
 #include <asm/hwcap.h>
 #include <stdio.h>
 #include <sys/auxv.h>
-- 
2.39.2


