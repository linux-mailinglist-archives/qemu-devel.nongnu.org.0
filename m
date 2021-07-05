Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6053BC389
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:06:21 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VnI-0003Hv-7q
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vlp-0000h0-Ap; Mon, 05 Jul 2021 17:04:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vln-0002rP-6M; Mon, 05 Jul 2021 17:04:49 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165L2jU2032411; Mon, 5 Jul 2021 17:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=v4MnI8qXQW3yP+ybCIsb9f3dPZEsvCPccEO61KeSQMI=;
 b=c/5BBWKKMHqJqNm6ro01layF94gc9LytylDXYYRamCrw/1vTfvnmltSnxXUv9YNJfNtE
 DOo15sALehxrp0KkJY03M1YnYpRD8a57VRXGJOiTIpsI/gm6BG/fbAuxyG1ouZ6PuLIo
 9gbVg/7vLej9OlcAfMCSBtm+EPQc/3MOavnzLtgOz0zLU12Td8k7jwAcT8amT9XAH50H
 eGwHKMeP2KCxWBZrJirSEDq8EDw4D6W9PAGJMT7jE0TqEjKwlRigNUeJeMijHj3nSIAs
 aZ4X0uXGZVWmN1NQC2X5bW3ZyyUKVukwbPfXI3HzG6fj4uGbC9SwA93nJ0IGmqgB6OS0 vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m8x6h0fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:44 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 165L3bWI040946;
 Mon, 5 Jul 2021 17:04:43 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m8x6h0er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:43 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 165L4fMH032417;
 Mon, 5 Jul 2021 21:04:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 39jfh88gv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 21:04:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 165L4bND33030532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Jul 2021 21:04:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB92411C04A;
 Mon,  5 Jul 2021 21:04:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FD2D11C050;
 Mon,  5 Jul 2021 21:04:36 +0000 (GMT)
Received: from vm.lan (unknown [9.145.62.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Jul 2021 21:04:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
Date: Mon,  5 Jul 2021 23:04:32 +0200
Message-Id: <20210705210434.45824-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 44uI5xSxLLPVKz-9qsJSoKFZOHklaJvw
X-Proofpoint-ORIG-GUID: uYG0UP-5bk_0xr-Kti2smMsAi8xDUBxE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_11:2021-07-02,
 2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
should be a pointer to the instruction following the illegal
instruction, but at the moment it is a pointer to the illegal
instruction itself. This breaks OpenJDK, which relies on this value.
A similar problem exists for SIGFPE.

Patch 1 fixes the issue, patch 2 adds a test.

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
          magic in the test and add an explanation (David).

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
          qemu-user).

v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.html
v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).

v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05848.html
v4 -> v5: Greatly simplify the fix (Ulrich).

v5: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06244.html
v5 -> v6: Fix breakpoints (David). Add gdbstub test.

Note: the compare-and-trap SIGFPE issue is being fixed separately.
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
  tests/tcg/s390x: Test SIGILL and SIGSEGV handling

 linux-user/s390x/cpu_loop.c                   |  12 +-
 tests/tcg/s390x/Makefile.target               |  18 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
 tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
 4 files changed, 269 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
 create mode 100644 tests/tcg/s390x/signals-s390x.c

-- 
2.31.1


