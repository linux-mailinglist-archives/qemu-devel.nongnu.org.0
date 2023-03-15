Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A36BA4FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGVC-0003jW-58; Tue, 14 Mar 2023 22:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGVA-0003jI-Sj; Tue, 14 Mar 2023 22:04:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV8-0000xg-Tx; Tue, 14 Mar 2023 22:04:28 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32F0ONTM014307; Wed, 15 Mar 2023 02:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6bvv9v3NOdkjknja7n9qW0+/oGthEtjbk7LctoW+o48=;
 b=DttRLOexaNW+SMFQRzde4bx7YJCfUXd/ZFe3gULXHheNQ+nj31hOcLKekGtPknd/h+TI
 tn+bnHW2cY+GJzAthoPX3fpQu32kSDpuzHbcRdnLfRZMlf9ef9p6Ly1TfSzRZov0wBFs
 +AFM3GzEICulvrggczvPWQjlppKgyUThcBPppx5GsMtOzX83LOJ+gOFonBafmKOCvaLz
 gq1byJLw2zXUkKL2rbuM1oqelc3aeIwVeK76gJcjij2o0BpDiTzojqR9BusWQ6drB16h
 0nWBaESfN5c+uanTI8Qr8Jik2xgswUWM7yp0CsmoeEEs58lsf1oDMa8pwuU7nBTfSaNu hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3evst9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:24 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32F15IOL024520;
 Wed, 15 Mar 2023 02:04:24 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3evst8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:23 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN5TG7031403;
 Wed, 15 Mar 2023 02:04:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3pb29s0401-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F24Jvr55050612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 02:04:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA9582005A;
 Wed, 15 Mar 2023 02:04:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7970120040;
 Wed, 15 Mar 2023 02:04:18 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 02:04:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 3/3] tests/tcg/s390x: Add PSW modification tests
Date: Wed, 15 Mar 2023 03:04:08 +0100
Message-Id: <20230315020408.384766-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315020408.384766-1-iii@linux.ibm.com>
References: <20230315020408.384766-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oSKTADPBw5LPkQ8_DIq-X7MU0U1j-B6Z
X-Proofpoint-ORIG-GUID: lYyxfy8dRHpPY3MIEZ8PAFthOy3p4RRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=803 bulkscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150017
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

Add several small tests that check the PSW modification instructions:

* lpsw.S checks whether LPSW works correctly in the "happy" case.

* lpswe-early.S checks whether early exceptions are recognized and
  whether the correct ILC and old PSW are stored when they happen.

* ssm-early.S, stosm-early.S and exrl-ssm-early.S check the special
  handling of SSM and STOSM with respect to early exceptions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  5 +++
 tests/tcg/s390x/exrl-ssm-early.S        | 43 +++++++++++++++++++++++++
 tests/tcg/s390x/lpsw.S                  | 36 +++++++++++++++++++++
 tests/tcg/s390x/lpswe-early.S           | 38 ++++++++++++++++++++++
 tests/tcg/s390x/ssm-early.S             | 41 +++++++++++++++++++++++
 tests/tcg/s390x/stosm-early.S           | 41 +++++++++++++++++++++++
 6 files changed, 204 insertions(+)
 create mode 100644 tests/tcg/s390x/exrl-ssm-early.S
 create mode 100644 tests/tcg/s390x/lpsw.S
 create mode 100644 tests/tcg/s390x/lpswe-early.S
 create mode 100644 tests/tcg/s390x/ssm-early.S
 create mode 100644 tests/tcg/s390x/stosm-early.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598db..607f6ba21a4 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,8 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += lpsw
+TESTS += lpswe-early
+TESTS += ssm-early
+TESTS += stosm-early
+TESTS += exrl-ssm-early
diff --git a/tests/tcg/s390x/exrl-ssm-early.S b/tests/tcg/s390x/exrl-ssm-early.S
new file mode 100644
index 00000000000..68fbd87b3a5
--- /dev/null
+++ b/tests/tcg/s390x/exrl-ssm-early.S
@@ -0,0 +1,43 @@
+/*
+ * Test early exception recognition using EXRL + SSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    exrl %r0,ssm
+expected_pswa:
+    j failure
+ssm:
+    ssm ssm_op
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,6                                    /* ilc for EXRL? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0x08                                   /* bit 4 set */
+    .align 8
+expected_old_psw:
+    .quad 0x0800000180000000,expected_pswa       /* bit 2 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/lpsw.S b/tests/tcg/s390x/lpsw.S
new file mode 100644
index 00000000000..b37dec59b73
--- /dev/null
+++ b/tests/tcg/s390x/lpsw.S
@@ -0,0 +1,36 @@
+/*
+ * Test the LPSW instruction.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x140
+svc_old_psw:
+    .org 0x1c0                         /* supervisor call new PSW */
+    .quad 0x80000000,svc               /* 31-bit mode */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpsw short_psw
+lpsw_target:
+    svc 0
+expected_pswa:
+    j failure
+
+svc:
+    clc svc_old_psw(16),expected_psw   /* correct full PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+short_psw:
+    .long 0x90001,0x80000000+lpsw_target         /* problem state,
+                                                    64-bit mode */
+expected_psw:
+    .quad 0x1000180000000,expected_pswa          /* corresponds to short_psw */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/lpswe-early.S b/tests/tcg/s390x/lpswe-early.S
new file mode 100644
index 00000000000..90a7f213dfb
--- /dev/null
+++ b/tests/tcg/s390x/lpswe-early.S
@@ -0,0 +1,38 @@
+/*
+ * Test early exception recognition using LPSWE.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe bad_psw
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,0                                    /* ilc zero? */
+    jne failure
+    clc program_old_psw(16),bad_psw              /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+    .align 8
+bad_psw:
+    .quad 0x8000000000000000,0xfedcba9876543210  /* bit 0 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/ssm-early.S b/tests/tcg/s390x/ssm-early.S
new file mode 100644
index 00000000000..6dfe40c597b
--- /dev/null
+++ b/tests/tcg/s390x/ssm-early.S
@@ -0,0 +1,41 @@
+/*
+ * Test early exception recognition using SSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    ssm ssm_op
+expected_pswa:
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,4                                    /* ilc for SSM? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0x20                                   /* bit 2 set */
+    .align 8
+expected_old_psw:
+    .quad 0x2000000180000000,expected_pswa       /* bit 2 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
diff --git a/tests/tcg/s390x/stosm-early.S b/tests/tcg/s390x/stosm-early.S
new file mode 100644
index 00000000000..0689924f3a4
--- /dev/null
+++ b/tests/tcg/s390x/stosm-early.S
@@ -0,0 +1,41 @@
+/*
+ * Test early exception recognition using STOSM.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1D0                         /* program new PSW */
+    .quad 0,pgm
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    stosm ssm_op,0x10                            /* bit 3 set */
+expected_pswa:
+    j failure
+
+pgm:
+    chhsi program_interruption_code,0x6          /* specification exception? */
+    jne failure
+    cli ilc,4                                    /* ilc for STOSM? */
+    jne failure
+    clc program_old_psw(16),expected_old_psw     /* correct old PSW? */
+    jne failure
+    lpswe success_psw
+failure:
+    lpswe failure_psw
+
+ssm_op:
+    .byte 0
+    .align 8
+expected_old_psw:
+    .quad 0x1000000180000000,expected_pswa       /* bit 3 set */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.39.2


