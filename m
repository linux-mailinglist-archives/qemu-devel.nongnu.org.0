Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D756BD631
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:46:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqis-00053i-9z; Thu, 16 Mar 2023 12:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqip-00052S-O2; Thu, 16 Mar 2023 12:44:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqin-0008MX-E2; Thu, 16 Mar 2023 12:44:59 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFmYGa019793; Thu, 16 Mar 2023 16:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jqBVGq8yc0E6kS17ER39cm+YQ8MGSS4zSVebVECvQOw=;
 b=tSulQ2SNJL6/9VNR/nkcgkLNbGoFuXMxXntuaPbA3zcQ6Ddft6SbxVGjUvbZmK+1uvcD
 iqQHjwZf8XbKjtMiE4bdayavXmrNkdG+v20coyuYw6GVuSdDWqpwofpHM6UHjqEISbmy
 w5BCqljkZ/TwKM24h1fsKIrPPisDLdBJX7aeZP5yCWohb7+RfmTreZNA6d8lZXD4IHaI
 ccE7EMopadFUZz0eSrqXEJyBD/s2vbC2s0RjzfcMxjCvR6ATo5jbIqwixT1jCG1AL+PZ
 XEXbI0tla/7mS1fhXnS5dYEABPb4AsJWtC4I6MtC5DsCvsFh/K6oSKpCGtOYGB5L5y0r vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc62uhm4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:54 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GFnQlu021684;
 Thu, 16 Mar 2023 16:44:54 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc62uhm3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1e82r001711;
 Thu, 16 Mar 2023 16:44:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pbsmrgt3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GGineT55050514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 16:44:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C9DC20040;
 Thu, 16 Mar 2023 16:44:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E2320043;
 Thu, 16 Mar 2023 16:44:48 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 16:44:48 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 12/12] tests/tcg/s390x: Test unaligned accesses
Date: Thu, 16 Mar 2023 17:44:28 +0100
Message-Id: <20230316164428.275147-13-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316164428.275147-1-iii@linux.ibm.com>
References: <20230316164428.275147-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QScGhWvVDuqQ12re-ggwQ5QsK06-fXOR
X-Proofpoint-ORIG-GUID: dOMa9Ku-v1ATm6dSXwxsAqIpyyXXwQy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

Add a number of small test that check whether accessing unaligned
addresses in various ways leads to a specification exception.

Run these test both in softmmu and user configurations; expect a PGM
in one case and SIGILL in the other.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target     | 15 ++++++--
 tests/tcg/s390x/Makefile.target             |  8 +++++
 tests/tcg/s390x/br-odd.S                    | 16 +++++++++
 tests/tcg/s390x/cgrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/clrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/crl-unaligned.S             | 16 +++++++++
 tests/tcg/s390x/ex-odd.S                    | 17 +++++++++
 tests/tcg/s390x/lgrl-unaligned.S            | 16 +++++++++
 tests/tcg/s390x/llgfrl-unaligned.S          | 16 +++++++++
 tests/tcg/s390x/lpswe-unaligned.S           | 18 ++++++++++
 tests/tcg/s390x/lrl-unaligned.S             | 16 +++++++++
 tests/tcg/s390x/pgm-specification-softmmu.S | 40 +++++++++++++++++++++
 tests/tcg/s390x/pgm-specification-user.c    | 37 +++++++++++++++++++
 tests/tcg/s390x/pgm-specification.mak       | 15 ++++++++
 tests/tcg/s390x/softmmu.ld                  | 20 +++++++++++
 tests/tcg/s390x/stgrl-unaligned.S           | 16 +++++++++
 tests/tcg/s390x/strl-unaligned.S            | 16 +++++++++
 17 files changed, 311 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification-softmmu.S
 create mode 100644 tests/tcg/s390x/pgm-specification-user.c
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/softmmu.ld
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598db..6d8bf299b28 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -1,11 +1,20 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
 QEMU_OPTS=-action panic=exit-failure -kernel
+LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
+LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT)
 
-%: %.S
-	$(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
-		-Wl,--build-id=none $< -o $@
+%.o: %.S
+	$(CC) -march=z13 -m64 -c $< -o $@
+
+%: %.o $(LINK_SCRIPT)
+	$(CC) $< -o $@ $(LDFLAGS)
 
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+
+include $(S390X_SRC)/pgm-specification.mak
+$(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
+$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
+TESTS += $(PGM_SPECIFICATION_TESTS)
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cf93b966862..1002ab79886 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -2,6 +2,9 @@ S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
 
+%.o: %.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
+
 config-cc.mak: Makefile
 	$(quiet-@)( \
 	    $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
@@ -33,6 +36,11 @@ TESTS+=chrl
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
 
+include $(S390X_SRC)/pgm-specification.mak
+$(PGM_SPECIFICATION_TESTS): pgm-specification-user.o
+$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-user.o
+TESTS += $(PGM_SPECIFICATION_TESTS)
+
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
 TESTS+=$(Z13_TESTS)
diff --git a/tests/tcg/s390x/br-odd.S b/tests/tcg/s390x/br-odd.S
new file mode 100644
index 00000000000..2fae47a9e34
--- /dev/null
+++ b/tests/tcg/s390x/br-odd.S
@@ -0,0 +1,16 @@
+/*
+ * Test BRanching to a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,odd_addr
+    br %r1
+
+    .align 8
+odd_addr:
+    .quad 0xDDDDDDDDDDDDDDDD
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,0xDDDDDDDDDDDDDDDD
diff --git a/tests/tcg/s390x/cgrl-unaligned.S b/tests/tcg/s390x/cgrl-unaligned.S
new file mode 100644
index 00000000000..164d68f2e64
--- /dev/null
+++ b/tests/tcg/s390x/cgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CGRL with a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    cgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/clrl-unaligned.S b/tests/tcg/s390x/clrl-unaligned.S
new file mode 100644
index 00000000000..182b1b6462f
--- /dev/null
+++ b/tests/tcg/s390x/clrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CLRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    clrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/crl-unaligned.S b/tests/tcg/s390x/crl-unaligned.S
new file mode 100644
index 00000000000..b86fbe0ef3f
--- /dev/null
+++ b/tests/tcg/s390x/crl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test CRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    crl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/ex-odd.S b/tests/tcg/s390x/ex-odd.S
new file mode 100644
index 00000000000..4e42a47df34
--- /dev/null
+++ b/tests/tcg/s390x/ex-odd.S
@@ -0,0 +1,17 @@
+/*
+ * Test EXECUTing a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,odd_addr
+fail:
+    ex 0,0(%r1)
+
+    .align 8
+odd_addr:
+    .quad 0xDDDDDDDDDDDDDDDD
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,fail
diff --git a/tests/tcg/s390x/lgrl-unaligned.S b/tests/tcg/s390x/lgrl-unaligned.S
new file mode 100644
index 00000000000..ef8d51d47c9
--- /dev/null
+++ b/tests/tcg/s390x/lgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LGRL from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/llgfrl-unaligned.S b/tests/tcg/s390x/llgfrl-unaligned.S
new file mode 100644
index 00000000000..c9b4eeaecf5
--- /dev/null
+++ b/tests/tcg/s390x/llgfrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LLGFRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    llgfrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/lpswe-unaligned.S b/tests/tcg/s390x/lpswe-unaligned.S
new file mode 100644
index 00000000000..989f249a6ad
--- /dev/null
+++ b/tests/tcg/s390x/lpswe-unaligned.S
@@ -0,0 +1,18 @@
+/*
+ * Test LPSWE from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    larl %r1,unaligned
+fail:
+    lpswe 0(%r1)
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,fail
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/lrl-unaligned.S b/tests/tcg/s390x/lrl-unaligned.S
new file mode 100644
index 00000000000..11eb07f93a7
--- /dev/null
+++ b/tests/tcg/s390x/lrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test LRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    lrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
diff --git a/tests/tcg/s390x/pgm-specification-softmmu.S b/tests/tcg/s390x/pgm-specification-softmmu.S
new file mode 100644
index 00000000000..d534f4e505d
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification-softmmu.S
@@ -0,0 +1,40 @@
+/*
+ * Common softmmu code for specification exception testing.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .section .head
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0x180000000,pgm              /* 64-bit mode */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe test_psw
+
+pgm:
+    chhsi program_interruption_code,0x6          /* PGM_SPECIFICATION? */
+    jne failure
+    lg %r0,expected_old_psw+8                    /* ilc adjustment */
+    llgc %r1,ilc
+    agr %r0,%r1
+    stg %r0,expected_old_psw+8
+    clc expected_old_psw(16),program_old_psw     /* correct location? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+test_psw:
+    .quad 0x180000000,test             /* 64-bit mode */
+success_psw:
+    .quad 0x2000180000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000180000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/pgm-specification-user.c b/tests/tcg/s390x/pgm-specification-user.c
new file mode 100644
index 00000000000..9ee6907b7c2
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification-user.c
@@ -0,0 +1,37 @@
+/*
+ * Common user code for specification exception testing.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+extern void test(void);
+extern long expected_old_psw[2];
+
+static void handle_sigill(int sig, siginfo_t *info, void *ucontext)
+{
+    if ((long)info->si_addr != expected_old_psw[1]) {
+        _exit(EXIT_FAILURE);
+    }
+    _exit(EXIT_SUCCESS);
+}
+
+int main(void)
+{
+    struct sigaction act;
+    int err;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_sigill;
+    act.sa_flags = SA_SIGINFO;
+    err = sigaction(SIGILL, &act, NULL);
+    assert(err == 0);
+
+    test();
+
+    return EXIT_FAILURE;
+}
diff --git a/tests/tcg/s390x/pgm-specification.mak b/tests/tcg/s390x/pgm-specification.mak
new file mode 100644
index 00000000000..2999aee26e6
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification.mak
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# List of specification exception tests.
+# Shared between the softmmu and the user makefiles.
+PGM_SPECIFICATION_TESTS = \
+	br-odd \
+	cgrl-unaligned \
+	clrl-unaligned \
+	crl-unaligned \
+	ex-odd \
+	lgrl-unaligned \
+	llgfrl-unaligned \
+	lpswe-unaligned \
+	lrl-unaligned \
+	stgrl-unaligned \
+	strl-unaligned
diff --git a/tests/tcg/s390x/softmmu.ld b/tests/tcg/s390x/softmmu.ld
new file mode 100644
index 00000000000..ea944eaa3cb
--- /dev/null
+++ b/tests/tcg/s390x/softmmu.ld
@@ -0,0 +1,20 @@
+/*
+ * Linker script for the softmmu test kernels.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+ENTRY(_start)
+
+SECTIONS {
+    . = 0;
+
+    .text : {
+        *(.head)
+        *(.text)
+    }
+
+    /DISCARD/ : {
+        *(*)
+    }
+}
diff --git a/tests/tcg/s390x/stgrl-unaligned.S b/tests/tcg/s390x/stgrl-unaligned.S
new file mode 100644
index 00000000000..32df37780ad
--- /dev/null
+++ b/tests/tcg/s390x/stgrl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test STGRL to a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    stgrl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .long 0
+unaligned:
+    .quad 0
diff --git a/tests/tcg/s390x/strl-unaligned.S b/tests/tcg/s390x/strl-unaligned.S
new file mode 100644
index 00000000000..1d248819f02
--- /dev/null
+++ b/tests/tcg/s390x/strl-unaligned.S
@@ -0,0 +1,16 @@
+/*
+ * Test STRL to a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .globl test
+test:
+    strl %r1,unaligned
+
+    .align 8
+    .globl expected_old_psw
+expected_old_psw:
+    .quad 0x180000000,test
+    .short 0
+unaligned:
+    .long 0
-- 
2.39.2


