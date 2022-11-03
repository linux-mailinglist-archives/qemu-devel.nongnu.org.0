Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF9617D44
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZpx-00071z-5R; Thu, 03 Nov 2022 09:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oqZpb-0006yR-J8
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:00:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oqZpZ-00047m-IR
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:00:27 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3CfGON011268;
 Thu, 3 Nov 2022 13:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kxhZyeU5hOtItzIG75pwnvNxUmmDATyiNc+lRFZi8DQ=;
 b=HXsdKwCh8+Aa3dSxI5dlbVVQCJXHFceZLC/874s05PD36Gb1YzpZUKcHxQrRiHPo7TXY
 FIoLmU0NCbF19KKIT2PteIeJLZHmP4Z/RckGNcq4VMD8WcriapWPtu0dRNhJ1mqxkGvg
 KL4fQaLSilrMNLiRLTINOJPwKhr2Ps9e15TiFjeurRLqLQFIKY+890G5430oMmf3MfFm
 ZFBzkcFw+c2ZODM5VsatsyKcshrAPHXJ0GZ5jHTmQDseb3J2c2reSi0+wzv9UYArAWpA
 32rcQoGK2OThAcQocFPJku+KlNpnQphUPAbfzUeH7goUdVTKzh8NLPycq0gXsviKnxAb rQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmbdbwf8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:00:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3CqNmd022947;
 Thu, 3 Nov 2022 13:00:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3kgut90t8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 13:00:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A3Csh8i48497016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 12:54:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 504D84C046;
 Thu,  3 Nov 2022 13:00:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 162504C04A;
 Thu,  3 Nov 2022 13:00:15 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Nov 2022 13:00:15 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] tests/tcg/s390x: Add bal.S
Date: Thu,  3 Nov 2022 14:00:11 +0100
Message-Id: <20221103130011.2670186-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221103125252.ctefkrpt26i65rsw@heavy>
References: <20221103125252.ctefkrpt26i65rsw@heavy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hte38j0vhevK5deBKwXrEWhdnkGXdGkk
X-Proofpoint-GUID: hte38j0vhevK5deBKwXrEWhdnkGXdGkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=844 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/bal.S                   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/bal.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index a34fa68473e..295df084919 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += bal
diff --git a/tests/tcg/s390x/bal.S b/tests/tcg/s390x/bal.S
new file mode 100644
index 00000000000..e54d8874ff9
--- /dev/null
+++ b/tests/tcg/s390x/bal.S
@@ -0,0 +1,24 @@
+    .org 0x200                         /* lowcore padding */
+    .globl _start
+_start:
+    lpswe start24_psw
+_start24:
+    lgrl %r0,initial_r0
+    lgrl %r1,expected_r0
+    bal %r0,0f
+0:
+    cgrjne %r0,%r1,1f
+    lpswe success_psw
+1:
+    lpswe failure_psw
+    .align 8
+start24_psw:
+    .quad 0x160000000000,_start24      /* 24-bit mode, cc = 1, pm = 6 */
+initial_r0:
+    .quad 0x1234567887654321
+expected_r0:
+    .quad 0x1234567896000000 + 0b      /* ilc = 2, cc = 1, pm = 6 */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.37.2


