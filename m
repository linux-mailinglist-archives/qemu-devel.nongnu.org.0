Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980163DC69
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 18:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0RAp-0002jc-Qw; Wed, 30 Nov 2022 12:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RAm-0002ij-TQ; Wed, 30 Nov 2022 12:47:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RAl-0004Lg-8j; Wed, 30 Nov 2022 12:47:04 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUHgDft009124; Wed, 30 Nov 2022 17:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sMuvY/X+pDRNEZsP0+dcESfHcYqv1dtzjpxmljOjoq8=;
 b=E2s3wNUR10QURde/UFvGWNb8kgtVRQXnuy1+OvbLve0+R3z3Fcn9CXPPbGhtml8EqmIC
 si74NqlmloOy8n0BF8RLOmwmfJaB2oihMYXbaFqiRDsWVr2LBlQOR2zIkiijKgaCcRv+
 FZ7VE1HaK6l9uXYZKM8bhZ0hqOvNSmftZKKA/Uz0o/uhg5xZqxCaB/7vXsElH9QrkzGe
 t0oGKGP0R21L7he/poNqwwf8xRPkUkyN9vNrCVUxCzEJTvlGHcBp2RNuxKqTx8qTN38M
 B9xftEDgr+nJtTqlesJPViTCZszoJRGGa5atx+aGGLrF4YyAS/FgiCFQJ/Iz0odGrDxl lg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6bt2r3p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:47:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUHZt86020989;
 Wed, 30 Nov 2022 17:46:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9e6fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:46:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AUHktnK38469996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Nov 2022 17:46:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59BD5A405B;
 Wed, 30 Nov 2022 17:46:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18952A4054;
 Wed, 30 Nov 2022 17:46:55 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.36.196])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Nov 2022 17:46:55 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Add per.S
Date: Wed, 30 Nov 2022 18:46:10 +0100
Message-Id: <20221130174610.434590-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130174610.434590-1-iii@linux.ibm.com>
References: <20221130173325.v5u6xnzcxir4ntrc@heavy>
 <20221130174610.434590-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NbzVrBpdmLX-uUhzE0EtEyCTMBhPH8TF
X-Proofpoint-ORIG-GUID: NbzVrBpdmLX-uUhzE0EtEyCTMBhPH8TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=709 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300122
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/per.S                   | 55 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 tests/tcg/s390x/per.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index a34fa68473e..1d649753f4e 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += per
diff --git a/tests/tcg/s390x/per.S b/tests/tcg/s390x/per.S
new file mode 100644
index 00000000000..02f8422c44d
--- /dev/null
+++ b/tests/tcg/s390x/per.S
@@ -0,0 +1,55 @@
+#define N_ITERATIONS 10
+
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x96
+per_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe per_on_psw
+start_per:
+    lghi %r0,N_ITERATIONS
+    xgr %r1,%r1
+    lctlg %c9,%c11,per_on_regs
+loop:
+    brct %r0,loop
+    lctlg %c9,%c11,per_off_regs
+    cgijne %r1,N_ITERATIONS-1,fail     /* expected number of events? */
+    lpswe success_psw
+fail:
+    lpswe failure_psw
+
+pgm_handler:
+    chhsi program_interruption_code,0x80         /* PER event? */
+    jne fail
+    cli per_code,0x80                  /* successful-branching event? */
+    jne fail
+    la %r1,1(%r1)                      /* increment event counter */
+    mvc return_psw(8),program_old_psw
+    lg %r3,program_old_psw+8
+    llgc %r2,ilc
+    sgr %r3,%r2                        /* rewind PSW */
+    stg %r3,return_psw+8
+    lpswe return_psw
+
+    .align 8
+per_on_psw:
+    .quad 0x4000000000000000,start_per
+per_on_regs:
+    .quad 0x80000000,0,-1              /* successful-branching everywhere */
+per_off_regs:
+    .quad 0,0,0
+return_psw:
+    .quad 0,0
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.38.1


