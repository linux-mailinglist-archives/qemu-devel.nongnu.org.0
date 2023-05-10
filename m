Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80846FE818
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 01:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwtC2-0002rJ-CW; Wed, 10 May 2023 19:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pwtBz-0002q8-Uv; Wed, 10 May 2023 19:25:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pwtBx-0004bz-Va; Wed, 10 May 2023 19:25:55 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AN656W018578; Wed, 10 May 2023 23:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=394WjzCcAKR0UhXdJnLwXLVJlHSIqE/x+FkHgVfw1zo=;
 b=Q7tiVdGCw84YfOXXmwOD+OIwuAEU3kpJNsJ5P1xdMhbnb0Qfpo4bHwKGyJxkxvwbXg8B
 +MHkufhRG4MnDRg90eTQnjgPDOoGRaxCR9XXWKvRS8yvfXX3WLqK0Kp4MbNcG6Efp8zX
 JbIX9uaPhIZGcwZsKjHvA5GC/5qI8kNHKa1vZfj8xxWHZ9Pf1LxwCboiEabeMJdoudIn
 9O0gUs74VWi+K4D7+HX5OOLtFc1nyFzcdjJs+K8yVR+3Gt/8UY+iOor5aNuy8he09cHl
 kzHwxkm+CWZeext4xph7AdVPus+MuVfJW0fkI63/WBn9pNofAnIFAcCQ+DIH8zy6b4Xr 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgbxmj3p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:25:50 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34ANG1At031835;
 Wed, 10 May 2023 23:25:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgbxmj3n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:25:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34AMMu4s011852;
 Wed, 10 May 2023 23:02:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qf896sah7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:02:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AN2Lnw9306744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 23:02:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9269320040;
 Wed, 10 May 2023 23:02:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E2820043;
 Wed, 10 May 2023 23:02:21 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.237])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 23:02:20 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] linux-user/s390x: Fix single-stepping SVC
Date: Thu, 11 May 2023 01:02:11 +0200
Message-Id: <20230510230213.330134-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -0NQgeEhOWeiJBLv1tmDxXMpXaIznOTb
X-Proofpoint-GUID: VPIpuKl8-QZvdHuEOCHAxjQxiu4Rlq3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=518 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100191
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

Hi,

I noticed that single-stepping SVC runs two instructions instead of
one. The reason is that EXCP_SVC masks EXCP_DEBUG.
Patch 1 fixes this problem, patch 2 adds a test.

Btw, there is at least one more problem in that area, namely
single-stepping instructions that cause e.g. SIGILL. Using the
existing signals-s390x test as an example:

    (gdb) x/i $pc
    => 0x1001740 <illegal_op>:      .long   0x000007fe

    (gdb) si
    Program received signal SIGILL, Illegal instruction.
    (gdb) x/i $pc
    => 0x1001742 <after_illegal_op>:        br      %r14
    # So far so good.

    (gdb) si
    (gdb) x/i $pc
    => 0x10017b6 <handle_signal+6>: lay     %r15,-344(%r15)
    # Missed the first signal handler instruction!

I'm not sure what to do about it - the trivial fix to add
gdb_handlesig(cpu, 0) to the end of handle_pending_signal() caused GDB
to hang, and I haven't looked further yet.

Best regards,
Ilya

Ilya Leoshkevich (2):
  linux-user/s390x: Fix single-stepping SVC
  tests/tcg/s390x: Test single-stepping SVC

 linux-user/s390x/cpu_loop.c         |  9 ++++
 tests/tcg/s390x/Makefile.target     | 11 ++++-
 tests/tcg/s390x/gdbstub/test-svc.py | 64 +++++++++++++++++++++++++++++
 tests/tcg/s390x/hello-s390x-asm.S   | 20 +++++++++
 4 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-svc.py
 create mode 100644 tests/tcg/s390x/hello-s390x-asm.S

-- 
2.40.1


