Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F2A570A52
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:06:48 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAyk3-0001eC-N2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaZ-0002S8-HV; Mon, 11 Jul 2022 14:56:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaX-0006EN-T3; Mon, 11 Jul 2022 14:56:59 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BIgC9a009682;
 Mon, 11 Jul 2022 18:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AKKMF0k3yJb8tvevpDsZzemUWUqGoDljmNqOFoNDKjk=;
 b=NEhEeMkpBwxmzbDnthXXRy+4OASwb4ZUNbkdYVAuSTjmy5wjwpRI5n9oZmQHCjw9FiUw
 QmzKAQIhaAydXmxBJDyumgCikJ4WUoiQT3jPEjKGzFbl+F5SD7AA3qBPxeFkorHbwbY5
 zosoLvBmfVtp2DuE7lOsGyJeWY06X/CNK0H7ULvsJYhX/DQU93Y3tzy4Syj8zj/riKx9
 irOmyWvCwd1E3P/NOfzJUHxZNFxfYI02FH+IJLYZtFmcKTZGlZcUod5uNtx5kJvgNBqA
 eXqSHGlyfXbXR3iX41GAv2hww/lJnryAgHXr9GfqtN0DRABV0s/hjFOAc4pSTWnyRROq +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8sc7ra7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BIiGln024286;
 Mon, 11 Jul 2022 18:56:54 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8sc7ra6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:54 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BIpQGK026840;
 Mon, 11 Jul 2022 18:56:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3h71a8jaxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26BIuxCX33358272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 18:56:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1565A42041;
 Mon, 11 Jul 2022 18:56:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CBAA4203F;
 Mon, 11 Jul 2022 18:56:48 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jul 2022 18:56:48 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 3/3] tests/tcg/s390x: Test unaligned accesses to lowcore
Date: Mon, 11 Jul 2022 20:56:40 +0200
Message-Id: <20220711185640.3558813-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220711185640.3558813-1-iii@linux.ibm.com>
References: <20220711185640.3558813-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xCZLJARZAkR-fom_gEO-fqw_FZSjnPoD
X-Proofpoint-GUID: 9yHaMHizG5Mc4SuLZTu9kEQEsdeYQ9Hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_23,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=998 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110079
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
 tests/tcg/s390x/unaligned-lowcore.S     | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
new file mode 100644
index 0000000000..fdee4a7616
--- /dev/null
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -0,0 +1,9 @@
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
+QEMU_OPTS=-device mmio-debug-exit,base=0x2000 -kernel
+
+%: %.S
+	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
+		-Wl,--build-id=none $< -o $@
+
+TESTS += unaligned-lowcore
diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
new file mode 100644
index 0000000000..2b34c3d5ef
--- /dev/null
+++ b/tests/tcg/s390x/unaligned-lowcore.S
@@ -0,0 +1,24 @@
+    .org 0x1D0                 /* Program new PSW */
+    .quad 0x180000000, _pgm    /* BA, EA */
+    .org 0x200                 /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c0,%c0,_c0
+    vst %v0,_unaligned
+    mviy _exit,0
+
+_pgm:
+    mviy _exit,1
+
+    .align 8
+_c0:
+    .quad 0x10060000           /* lowcore protection, AFP, VX */
+
+    .byte 0
+_unaligned:
+    .octa 0
+
+    .org 0x2000                /* mmio-debug-exit base */
+_exit:
+    .byte 0
-- 
2.35.3


