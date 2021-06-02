Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F46397DA6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 02:25:11 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loEh3-0006iP-FM
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 20:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1loEeM-0004Zq-VO; Tue, 01 Jun 2021 20:22:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64228
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1loEeJ-000377-QA; Tue, 01 Jun 2021 20:22:22 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1520FTMP172785; Tue, 1 Jun 2021 20:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ey4h8jdTFXNzm8XSXG1wgvFUOMKv8cvw9xTrJoK/qII=;
 b=T9i3hDQUl6dYsJlX85dfQlfNWYPFndbj25SPJIk1M48xDNzaRpNJ8aHSXWXHK9ea3uyH
 Tod7ZuQ26B2kILLRNpgRKdBf2RK6XYZ452evBLX8l/GqrWf7GoC+x4UaG5WdEX0970eS
 4fHgtK6sLiwmXm2wt2gyXJjnwzza9jghItSczxblPd1saaRNcZPhzYPwqU2zT2WMDzkT
 pNLomMzSakOhs3919MtQjVlIjQD2j3Wi1ceHROwxFtligUJHx/XzElz8ccMN1S23RdjY
 2EnGCmQOfyVNbiikNaKlnU3s003wcYvNATiKt70D+ooS793pRdzP5fa6kdygHZjGJC5u Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wy9jg4ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 20:22:17 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1520HDdQ179976;
 Tue, 1 Jun 2021 20:22:16 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wy9jg4dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 20:22:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1520D5O8016686;
 Wed, 2 Jun 2021 00:22:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 38ud88a075-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 00:22:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1520MCEQ29819186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 00:22:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC3B6AE051;
 Wed,  2 Jun 2021 00:22:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BF5FAE045;
 Wed,  2 Jun 2021 00:22:11 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 00:22:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Wed,  2 Jun 2021 02:22:08 +0200
Message-Id: <20210602002210.3144559-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rkvRd9OuVWGpufwbbxoc_YVrCO3NfLQQ
X-Proofpoint-GUID: QQC9NPr8KJXv3qaVbdIJW2dxU_usopGr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_12:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 mlxlogscore=880
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010161
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
should be a pointer to the instruction following the illegal
instruction, but at the moment it is a pointer to the illegal
instruction itself. This breaks OpenJDK, which relies on this value.

Patch 1 fixes the issue, patch 2 adds a test.

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
          magic in the test and add an explanation (David).

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
          qemu-user).

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL psw.addr reporting
  tests/tcg/s390x: Test SIGILL and SIGSEGV handling

 linux-user/s390x/cpu_loop.c     |  23 ++++-
 target/s390x/excp_helper.c      |  71 +++++++-------
 target/s390x/internal.h         |   1 +
 target/s390x/mem_helper.c       |   2 +-
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/signal.c        | 163 ++++++++++++++++++++++++++++++++
 6 files changed, 224 insertions(+), 37 deletions(-)
 create mode 100644 tests/tcg/s390x/signal.c

-- 
2.31.1


