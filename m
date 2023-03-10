Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4046B4F4E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagli-0007gJ-3Q; Fri, 10 Mar 2023 12:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglf-0007d1-73; Fri, 10 Mar 2023 12:42:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglc-00084A-Ce; Fri, 10 Mar 2023 12:42:58 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AG3tKU029713; Fri, 10 Mar 2023 17:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OuHO3+rdrP3t5x8YpJnEKhhKwGXsd/9XJJ972IsTKj4=;
 b=n+ZUpQ0VYEvhorfs0xtanntcjyjXeGr26ZfFHco37PuAshFXDgo8pnE9nTgq3m6CMyEs
 iPawr4/xBe7PqC9ER4NbojXXlZrES10Oql3H3OJwR3TkIj2ln2C1bX452MBPiu94M2il
 45nI39Ry2XGBeeid8D9LiKgW6UZa4Vo8m904XHVhNeyrW+dtBXmJKj0W2fTUFblfh0O9
 ax3lqgR7dlbDYIs8saDKlVlTkpsWZLl/CU5B1+Q+THGWOt4t09Gu0/cW7WU1D60K4TPO
 nqTkOmzGQg4spw1lgzu15plb5YtWqz1ghOLFyg6gV08FXRQSbw3Ica7umjnYHc/TcoO8 FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p87r9t8dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:54 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AGoBj3018119;
 Fri, 10 Mar 2023 17:42:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p87r9t8cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:54 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A8g35L015865;
 Fri, 10 Mar 2023 17:42:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p6g75b4p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AHgoD347841716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 17:42:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC9E82004E;
 Fri, 10 Mar 2023 17:42:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70B372004B;
 Fri, 10 Mar 2023 17:42:49 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.22.18])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 17:42:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 12/12] tests/tcg/s390x: Test unaligned accesses
Date: Fri, 10 Mar 2023 18:42:23 +0100
Message-Id: <20230310174223.944843-13-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310174223.944843-1-iii@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JoQNDa4Nx5-x_ZPtm2Ba7lwt127dvUNc
X-Proofpoint-ORIG-GUID: n51yJq_FCgvFSGDkT-EONO_ZMZGGgqON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100139
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a number of small test that check whether accessing unaligned
addresses in various ways leads to a specification exception.

Run these test both in softmmu and user configurations; expect a PGM
in one case and SIGILL in the other.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  4 +-
 tests/tcg/s390x/Makefile.target         |  3 +
 tests/tcg/s390x/asm-const.h             | 13 ++++
 tests/tcg/s390x/br-odd.S                | 18 +++++
 tests/tcg/s390x/cgrl-unaligned.S        | 17 +++++
 tests/tcg/s390x/clrl-unaligned.S        | 15 +++++
 tests/tcg/s390x/crl-unaligned.S         | 17 +++++
 tests/tcg/s390x/ex-odd.S                | 17 +++++
 tests/tcg/s390x/lgrl-unaligned.S        | 17 +++++
 tests/tcg/s390x/llgfrl-unaligned.S      | 17 +++++
 tests/tcg/s390x/lpswe-unaligned.S       | 17 +++++
 tests/tcg/s390x/lrl-unaligned.S         | 17 +++++
 tests/tcg/s390x/pgm-specification.inc   | 90 +++++++++++++++++++++++++
 tests/tcg/s390x/pgm-specification.mak   | 15 +++++
 tests/tcg/s390x/stgrl-unaligned.S       | 17 +++++
 tests/tcg/s390x/strl-unaligned.S        | 17 +++++
 16 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/asm-const.h
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification.inc
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598db..f32b7872e51 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -4,8 +4,10 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 
 %: %.S
 	$(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
-		-Wl,--build-id=none $< -o $@
+		-Wl,--build-id=none -D__ASSEMBLY__ -DCONFIG_SOFTMMU $< -o $@
 
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+
+include $(S390X_SRC)/pgm-specification.mak
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index a3d3beeffe8..c826eb6fa24 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -33,6 +33,9 @@ TESTS+=chrl
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
 
+include $(S390X_SRC)/pgm-specification.mak
+$(PGM_SPECIFICATION_TESTS): CFLAGS+=-x c
+
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
 TESTS+=$(Z13_TESTS)
diff --git a/tests/tcg/s390x/asm-const.h b/tests/tcg/s390x/asm-const.h
new file mode 100644
index 00000000000..c7e2d6ddc45
--- /dev/null
+++ b/tests/tcg/s390x/asm-const.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Based on linux kernel's arch/s390/include/asm/asm-const.h . */
+#ifndef ASM_CONST_H
+#define ASM_CONST_H
+
+#ifdef __ASSEMBLY__
+#define stringify_in_c(...) __VA_ARGS__
+#else
+#define __stringify_in_c(...) #__VA_ARGS__
+#define stringify_in_c(...) __stringify_in_c(__VA_ARGS__) " "
+#endif
+
+#endif
diff --git a/tests/tcg/s390x/br-odd.S b/tests/tcg/s390x/br-odd.S
new file mode 100644
index 00000000000..9848c18d6e0
--- /dev/null
+++ b/tests/tcg/s390x/br-odd.S
@@ -0,0 +1,18 @@
+/*
+ * Test BRanching to a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(    lgrl %r1,addr;)                                         \
+    stringify_in_c(    br %r1;)
+
+#define DATA                                                                   \
+    stringify_in_c(addr:;)                                                     \
+    stringify_in_c(    .quad 0xDDDDDDDDDDDDDDDD;)
+
+#define EXPECTED_OLD_PSWA 0xDDDDDDDDDDDDDDDD
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/cgrl-unaligned.S b/tests/tcg/s390x/cgrl-unaligned.S
new file mode 100644
index 00000000000..573eaa5c849
--- /dev/null
+++ b/tests/tcg/s390x/cgrl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test CGRL with a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    cgrl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .long 0;)                                               \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .quad 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/clrl-unaligned.S b/tests/tcg/s390x/clrl-unaligned.S
new file mode 100644
index 00000000000..bd0c02fac73
--- /dev/null
+++ b/tests/tcg/s390x/clrl-unaligned.S
@@ -0,0 +1,15 @@
+/*
+ * Test CLRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa: clrl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(.short 0;)                                                  \
+    stringify_in_c(unaligned: .long 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/crl-unaligned.S b/tests/tcg/s390x/crl-unaligned.S
new file mode 100644
index 00000000000..8446be13efc
--- /dev/null
+++ b/tests/tcg/s390x/crl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test CRL with a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    crl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .short 0;)                                              \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .long 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/ex-odd.S b/tests/tcg/s390x/ex-odd.S
new file mode 100644
index 00000000000..0427c79d8a4
--- /dev/null
+++ b/tests/tcg/s390x/ex-odd.S
@@ -0,0 +1,17 @@
+/*
+ * Test EXECUTEing a non-mapped odd address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(    lgrl %r1,odd_addr;)                                     \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    ex 0,%r1;)
+
+#define DATA                                                                   \
+    stringify_in_c(odd_addr:;)                                                 \
+    stringify_in_c(    .quad 0xDDDDDDDDDDDDDDDD;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/lgrl-unaligned.S b/tests/tcg/s390x/lgrl-unaligned.S
new file mode 100644
index 00000000000..8afb350f0fd
--- /dev/null
+++ b/tests/tcg/s390x/lgrl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test LGRL from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    lgrl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .long 0;)                                               \
+    stringify_in_c(unaligned:)                                                 \
+    stringify_in_c(    .quad 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/llgfrl-unaligned.S b/tests/tcg/s390x/llgfrl-unaligned.S
new file mode 100644
index 00000000000..4b22a31c267
--- /dev/null
+++ b/tests/tcg/s390x/llgfrl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test LLGFRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    llgfrl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .short 0;)                                              \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .long 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/lpswe-unaligned.S b/tests/tcg/s390x/lpswe-unaligned.S
new file mode 100644
index 00000000000..3aa1da7298f
--- /dev/null
+++ b/tests/tcg/s390x/lpswe-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test LPSWE from a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    lpswe unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .long 0;)                                               \
+    stringify_in_c(unaligned:)                                                 \
+    stringify_in_c(    .quad 0, 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/lrl-unaligned.S b/tests/tcg/s390x/lrl-unaligned.S
new file mode 100644
index 00000000000..a7f75a78d7d
--- /dev/null
+++ b/tests/tcg/s390x/lrl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test LRL from a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    lrl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .short 0;)                                              \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .long 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/pgm-specification.inc b/tests/tcg/s390x/pgm-specification.inc
new file mode 100644
index 00000000000..e3899ed4718
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification.inc
@@ -0,0 +1,90 @@
+/*
+ * Common code for specification exception testing.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifdef CONFIG_SOFTMMU
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
+    lpswe start64_psw
+start64:
+    CODE
+    j failure
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
+start64_psw:
+    .quad 0x180000000,start64          /* 64-bit mode */
+expected_old_psw:
+#ifndef EXPECTED_OLD_PSWA
+#define EXPECTED_OLD_PSWA expected_old_pswa
+#endif
+    .quad 0x180000000,EXPECTED_OLD_PSWA
+success_psw:
+    .quad 0x2000180000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000180000000,0            /* disabled wait */
+    DATA
+#else
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#ifndef EXPECTED_OLD_PSWA
+extern char expected_old_pswa[];
+#define EXPECTED_OLD_PSWA (long)expected_old_pswa
+#endif
+
+static void handle_sigill(int sig, siginfo_t *info, void *ucontext)
+{
+    if ((long)info->si_addr != EXPECTED_OLD_PSWA) {
+        _exit(EXIT_FAILURE);
+    }
+    _exit(EXIT_SUCCESS);
+}
+
+asm("    .data\n"
+    "    .align 8\n"
+    DATA
+    "    .previous\n");
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
+    asm volatile(CODE);
+
+    return EXIT_FAILURE;
+}
+#endif
diff --git a/tests/tcg/s390x/pgm-specification.mak b/tests/tcg/s390x/pgm-specification.mak
new file mode 100644
index 00000000000..6f8684901d5
--- /dev/null
+++ b/tests/tcg/s390x/pgm-specification.mak
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
+$(PGM_SPECIFICATION_TESTS) : asm-const.h pgm-specification.inc
+TESTS += $(PGM_SPECIFICATION_TESTS)
diff --git a/tests/tcg/s390x/stgrl-unaligned.S b/tests/tcg/s390x/stgrl-unaligned.S
new file mode 100644
index 00000000000..f105560c5c4
--- /dev/null
+++ b/tests/tcg/s390x/stgrl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test STGRL to a non-doubleword aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:)                                         \
+    stringify_in_c(    stgrl %r1,unaligned)
+
+#define DATA                                                                   \
+    stringify_in_c(    .long 0;)                                               \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .quad 0;)
+
+#include "pgm-specification.inc"
diff --git a/tests/tcg/s390x/strl-unaligned.S b/tests/tcg/s390x/strl-unaligned.S
new file mode 100644
index 00000000000..896708cebd1
--- /dev/null
+++ b/tests/tcg/s390x/strl-unaligned.S
@@ -0,0 +1,17 @@
+/*
+ * Test STRL to a non-word aligned address.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "asm-const.h"
+
+#define CODE                                                                   \
+    stringify_in_c(expected_old_pswa:;)                                        \
+    stringify_in_c(    strl %r1,unaligned;)
+
+#define DATA                                                                   \
+    stringify_in_c(    .short 0;)                                              \
+    stringify_in_c(unaligned:;)                                                \
+    stringify_in_c(    .long 0;)
+
+#include "pgm-specification.inc"
-- 
2.39.2


