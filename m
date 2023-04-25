Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702256EEA68
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 00:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prRTB-0002aB-CM; Tue, 25 Apr 2023 18:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prRT9-0002Z4-8x; Tue, 25 Apr 2023 18:49:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prRT7-00045V-DR; Tue, 25 Apr 2023 18:49:07 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PMfxHK028826; Tue, 25 Apr 2023 22:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3sSmCqqp4PVVXUJxxxCqnolLDxJwdfS8G1LGJ7DoThk=;
 b=lvQ0Kn9006z8dBPmY6oiszwCZBXa9d37jchsfGqwbjsMltOjBxI1WgRbuR0n+t75UmBR
 YKIonGsnal2w6ee0i0ys4SwTXdd4AE4XNzFKhY8Gpa0Z8CHCwiqtyplGt5hrY/xyMKXQ
 xDBkUSJDNpuCjC9BN6sQC0MV5XXXLjNIER2rLHcyp+pNX7VcvepcF5izgOUGDL0ke3xy
 i3xUrVQNVenTKEprWxMRjYzzdsfFV0nkrlmiP6qi9d64hsfOKp+5ctpvtJR7ubohy9b3
 a7k98TYIM7QCwUDc3miRae7gOUVSO31QnGWnGXQrzuBkJEuI1SD5ts7BRfcGgBieHUok Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6q0v24da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:49:01 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33PMaLjn000356;
 Tue, 25 Apr 2023 22:49:00 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6q0v24cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:49:00 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33PMaF3q020257;
 Tue, 25 Apr 2023 22:48:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3q47771nt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:48:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33PMmtA619464712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Apr 2023 22:48:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86CF020043;
 Tue, 25 Apr 2023 22:48:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1181520040;
 Tue, 25 Apr 2023 22:48:55 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.10.36])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 25 Apr 2023 22:48:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 2/2] tests/tcg/s390x: Enable the multiarch system tests
Date: Wed, 26 Apr 2023 00:48:50 +0200
Message-Id: <20230425224850.2116064-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425224850.2116064-1-iii@linux.ibm.com>
References: <20230425224850.2116064-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QNKsBi18B2Wo5PA6-0f7VeHei5khX-RW
X-Proofpoint-ORIG-GUID: ATI3K4jVxKzIKGqfoXFciWNomnQGzu_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250201
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Multiarch tests are written in C and need support for printing
characters. Instead of implementing the runtime from scratch, just
reuse the pc-bios/s390-ccw one.

Run tests with -nographic in order to enable SCLP (enable this for
the existing tests as well, since it does not hurt).

Use the default linker script for the new tests.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target | 40 +++++++++++++++++--------
 tests/tcg/s390x/console.c               | 12 ++++++++
 tests/tcg/s390x/head64.S                | 31 +++++++++++++++++++
 3 files changed, 71 insertions(+), 12 deletions(-)
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 3e7f72abcdc..e22df5e1c58 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -1,25 +1,41 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
-QEMU_OPTS=-action panic=exit-failure -kernel
+QEMU_OPTS=-action panic=exit-failure -nographic -kernel
 LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
-LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none
+CFLAGS+=-ggdb -O0
+LDFLAGS=-nostdlib -static
 
 %.o: %.S
 	$(CC) -march=z13 -m64 -c $< -o $@
 
-%: %.o $(LINK_SCRIPT)
+%.o: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -march=z13 -m64 -c $< -o $@
+
+%: %.o
 	$(CC) $< -o $@ $(LDFLAGS)
 
-TESTS += unaligned-lowcore
-TESTS += bal
-TESTS += sam
-TESTS += lpsw
-TESTS += lpswe-early
-TESTS += ssm-early
-TESTS += stosm-early
-TESTS += exrl-ssm-early
+ASM_TESTS =                                                                    \
+    bal                                                                        \
+    exrl-ssm-early                                                             \
+    sam                                                                        \
+    lpsw                                                                       \
+    lpswe-early                                                                \
+    ssm-early                                                                  \
+    stosm-early                                                                \
+    unaligned-lowcore
 
 include $(S390X_SRC)/pgm-specification.mak
 $(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
 $(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
-TESTS += $(PGM_SPECIFICATION_TESTS)
+ASM_TESTS += $(PGM_SPECIFICATION_TESTS)
+
+$(ASM_TESTS): LDFLAGS += -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none
+$(ASM_TESTS): $(LINK_SCRIPT)
+TESTS += $(ASM_TESTS)
+
+S390X_MULTIARCH_RUNTIME_OBJS = head64.o console.o $(MINILIB_OBJS)
+$(MULTIARCH_TESTS): $(S390X_MULTIARCH_RUNTIME_OBJS)
+$(MULTIARCH_TESTS): LDFLAGS += $(S390X_MULTIARCH_RUNTIME_OBJS)
+$(MULTIARCH_TESTS): CFLAGS += $(MINILIB_INC)
+memory: CFLAGS += -DCHECK_UNALIGNED=0
+TESTS += $(MULTIARCH_TESTS)
diff --git a/tests/tcg/s390x/console.c b/tests/tcg/s390x/console.c
new file mode 100644
index 00000000000..d43ce3f44b4
--- /dev/null
+++ b/tests/tcg/s390x/console.c
@@ -0,0 +1,12 @@
+/*
+ * Console code for multiarch tests.
+ * Reuses the pc-bios/s390-ccw implementation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "../../../pc-bios/s390-ccw/sclp.c"
+
+void __sys_outc(char c)
+{
+    write(1, &c, sizeof(c));
+}
diff --git a/tests/tcg/s390x/head64.S b/tests/tcg/s390x/head64.S
new file mode 100644
index 00000000000..c6f36dfea4b
--- /dev/null
+++ b/tests/tcg/s390x/head64.S
@@ -0,0 +1,31 @@
+/*
+ * Startup code for multiarch tests.
+ * Reuses the pc-bios/s390-ccw implementation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#define main main_pre
+#include "../../../pc-bios/s390-ccw/start.S"
+#undef main
+
+main_pre:
+    aghi %r15,-160                     /* reserve stack for C code */
+    brasl %r14,sclp_setup
+    brasl %r14,main
+    larl %r1,success_psw               /* check main() return code */
+    ltgr %r2,%r2
+    je 0f
+    larl %r1,failure_psw
+0:
+    lpswe 0(%r1)
+
+    .align 8
+success_psw:
+    .quad 0x2000180000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000180000000,0            /* disabled wait */
+
+    .section .bss
+    .align 0x1000
+stack:
+    .skip 0x8000
-- 
2.39.2


