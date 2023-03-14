Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C326B90E3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2Og-0001LX-9L; Tue, 14 Mar 2023 07:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc2Oc-0001Kn-Kl; Tue, 14 Mar 2023 07:00:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc2Oa-0004Ko-VX; Tue, 14 Mar 2023 07:00:46 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EAl8DB030675; Tue, 14 Mar 2023 11:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZUsZ9esCKsL3ARBcedc2Z0n9ASaWviuoKZHFbn35heI=;
 b=iUVMOX2DIW21017lwN6Ab46iZouB7Ei5bQdcHFOb0/6eULjMjO+dF1XN4NBg+zyMlKoe
 Aau+ZGMOzC06JuKyMd+yCaOVdk4qEX/outOc0P55UXkqfXNHPw34siL3zB8RnLry17bs
 2aCqV+F6sEOvHj/CPYLfq3C4eB029i30PCIZgfyJAhpejnU0UDh7xTcOP58Ofxzt5rVk
 hGDSpsafoXxdqV3yf90wLpGsm/tIWweoK11dn3pquIxRHWQE+0SA1W8ivmP5cjRyCLCo
 Tstps8HNGf3ijORl42MMwhp+RiELFUawjAgzCGa+VHd0KsgBcQFpN6IN6qDKl0yLLmR6 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paqftg97q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:00:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32EAlOoB031092;
 Tue, 14 Mar 2023 11:00:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paqftg972-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:00:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32E8lF5T018994;
 Tue, 14 Mar 2023 11:00:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p8h96kp3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:00:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32EB0a5Y30867928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 11:00:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B8AF2004B;
 Tue, 14 Mar 2023 11:00:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F89120040;
 Tue, 14 Mar 2023 11:00:36 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 11:00:35 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Add early-exception-recognition.S
Date: Tue, 14 Mar 2023 12:00:22 +0100
Message-Id: <20230314110022.184717-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314110022.184717-1-iii@linux.ibm.com>
References: <20230314110022.184717-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f_wxN19m4RA5D2OhPn2excLGm-2lBDB4
X-Proofpoint-GUID: 3_K5oEYh58TcyAhR2eStiavKVkmak9lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=774 spamscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140090
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

Add a small test that checks whether early exceptions are recognized
and whether the correct ILC and old PSW are stored when they happen.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target       |  1 +
 tests/tcg/s390x/early-exception-recognition.S | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/s390x/early-exception-recognition.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 725b6c598db..9d3180bbcba 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += early-exception-recognition
diff --git a/tests/tcg/s390x/early-exception-recognition.S b/tests/tcg/s390x/early-exception-recognition.S
new file mode 100644
index 00000000000..4e9677fea36
--- /dev/null
+++ b/tests/tcg/s390x/early-exception-recognition.S
@@ -0,0 +1,38 @@
+/*
+ * Test early exception recognition.
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
-- 
2.39.2


