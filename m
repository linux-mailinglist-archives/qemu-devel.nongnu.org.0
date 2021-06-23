Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28013B11CC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 04:35:42 +0200 (CEST)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvsjt-0005XV-7q
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 22:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvshM-0003wB-Bi; Tue, 22 Jun 2021 22:33:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvshJ-0006ys-2d; Tue, 22 Jun 2021 22:33:04 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N2VmwC070872; Tue, 22 Jun 2021 22:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=W8DI+9iCMqEHReBUIBR89VW+Sryi76cQ1xtzMAmOTNk=;
 b=Ezvy1rUtv9ReAUgbLj9SL9Dn035uJ54+QYaYTsE/i95PwCjEKg4eeAU9w1sCq41YbQ4n
 G1y8lcuOUGzvXifyEXHzK8/qSigcrGOnuyMZ7kzz2qRPEide1Yxz5uzXTqRx8ZMj+yHu
 Y2WZTRAhZJ+LKeOvV2fiDcnxgXVTJenhrTzBXrK533PDavLakIhmeEv5WmKeJnFXFXMo
 ZGy8duKmweGgiT9sbm3+8KBhW+8uXMhaOY3aIUbrevvu4sxoJykyUcjsC7iCaX66eC/M
 bHtmybICDEXIuKfOwtRz2D6qvXyGN1HI2O4BrscLcbzX/qtRpBnRkZHXAxTu4MArrok4 BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bv8jg0e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 22:32:58 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N2WQT8074206;
 Tue, 22 Jun 2021 22:32:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bv8jg0dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 22:32:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N2RNxd032569;
 Wed, 23 Jun 2021 02:32:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3998789qkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 02:32:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N2Wqdb13304288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 02:32:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C442A4054;
 Wed, 23 Jun 2021 02:32:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0DF1A405C;
 Wed, 23 Jun 2021 02:32:51 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 02:32:51 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
Date: Wed, 23 Jun 2021 04:32:48 +0200
Message-Id: <20210623023250.3667563-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TkoBqRfNP5w2QAHGRGYyGYWN-iWaXJqu
X-Proofpoint-GUID: PJO5po-2OWOwMjZaozZYbco9j3qCN_5h
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_14:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106230008
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
A similar problem exists for SIGFPE and SIGTRAP.

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

Note: the compare-and-trap SIGFPE issue is being fixed separately.
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr reporting
  tests/tcg/s390x: Test SIGILL and SIGSEGV handling

 linux-user/s390x/cpu_loop.c     |   5 +
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 tests/tcg/s390x/signal.c

-- 
2.31.1


