Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B057EA63
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:44:14 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF2JZ-0004pw-Ca
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2CW-00070f-Af; Fri, 22 Jul 2022 19:36:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2CU-0004iS-Jf; Fri, 22 Jul 2022 19:36:56 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MMjS3j007205;
 Fri, 22 Jul 2022 23:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oh2/roONDaJQnPSeQ3PmZ/weoNlAbaCp2Jc8rXngRF4=;
 b=AKrZCxErkaluMHDsu1zN4XdLn6PBOM2Oa4ykClFCmlruLLqkr7V1Lj+zATCqEtOEtP0r
 WS42NetF3kBENlaS5uK2TQD+0qMxmMOl9MSTp5bzYA3pZKL19+ZapLTbsh4k8dhobRDL
 nHzI5uFeQwN4MzaiElziHtIqVw2pjfRlKbmt3vdH8BBRIWu9KcIhlEn6Akq2vNtWscMN
 HC+IcR2hf/P8vfXso+mz0j1UatlQCZDDJucbPH4L+oWCTLLX1qBnqdppvNIQyajskRQs
 vEFMmwofelb8LLduHKQHviIMHV5HCxDqjRyPZ6FPdJmVnIXxNI0VqXsLmI1ji0zxd/hv EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78w5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:51 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MNPrWS015160;
 Fri, 22 Jul 2022 23:36:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78w4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MNYsMD019902;
 Fri, 22 Jul 2022 23:36:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3hfyhsr9rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26MNaws730736684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 23:36:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84044C04A;
 Fri, 22 Jul 2022 23:36:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CE144C046;
 Fri, 22 Jul 2022 23:36:45 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.90.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 23:36:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/2] tests/tcg/s390x: Test unaligned accesses to lowcore
Date: Sat, 23 Jul 2022 01:36:14 +0200
Message-Id: <20220722233614.7254-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722233614.7254-1-iii@linux.ibm.com>
References: <20220722233614.7254-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eYshyId3L66aqklvr2KxFUXMdoHHqdwu
X-Proofpoint-ORIG-GUID: beQvRA_IYE0afFjBOsTthsRc7Mf1M7Ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220094
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
 tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
new file mode 100644
index 0000000000..a34fa68473
--- /dev/null
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -0,0 +1,9 @@
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
+QEMU_OPTS=-action panic=exit-failure -kernel
+
+%: %.S
+	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
+		-Wl,--build-id=none $< -o $@
+
+TESTS += unaligned-lowcore
diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
new file mode 100644
index 0000000000..246b517f11
--- /dev/null
+++ b/tests/tcg/s390x/unaligned-lowcore.S
@@ -0,0 +1,19 @@
+    .org 0x1D0                         /* program new PSW */
+    .quad 0x2000000000000, 0           /* disabled wait */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c0,%c0,_c0
+    vst %v0,_unaligned
+    lpswe quiesce_psw
+
+    .align 8
+quiesce_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+_c0:
+    .quad 0x10060000                   /* lowcore protection, AFP, VX */
+
+    .byte 0
+_unaligned:
+    .octa 0
-- 
2.35.3


