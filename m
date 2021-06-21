Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149693AF895
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 00:33:51 +0200 (CEST)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvSUH-0001nD-SD
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 18:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvST0-0008Bc-OM; Mon, 21 Jun 2021 18:32:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lvSSy-0002FC-77; Mon, 21 Jun 2021 18:32:30 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LM3EWF166450; Mon, 21 Jun 2021 18:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=W/sOTqX+kmqWwltETLTs0Cu+EBwv2oyR3MuKgG9Dy0U=;
 b=YRKaZjvxMdLIqNQwe8qsdoLbiLOrCs7FRTbPGcV16VWg8laxno5zLjtjCtB8TK01PNJx
 K1uMuist2U7mmkd4TWB4J2jbbdg5E4sPIi9siQWd2Lh2sIhOMY1gIW9wLruxukmm0O6H
 42JiFYy9fxvzuv4Dm+MdX7XASyenPAWicfOvO4a/2mbIFk16NXflRxdxSdwl76k6HGhw
 F/MqWgQ8EC/PJiGSOs2EjfZFZkzNpliAmlrFNIJXQinA26t+LUXYPY+kYeM8UoqHtwsm
 ILHRAZarQhLXuJ5Rg3TdBBeVf+yg9VDsua6wKsJHaMdiAGpeqUplCaptWq5BqcSyS1e8 xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b2p51asp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:24 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LMRNMC061677;
 Mon, 21 Jun 2021 18:32:24 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b2p51as9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 18:32:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LMQFik010013;
 Mon, 21 Jun 2021 22:32:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uh93sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 22:32:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15LMUxVY34079040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 22:30:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD9AF4217A;
 Mon, 21 Jun 2021 22:32:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B2DA42175;
 Mon, 21 Jun 2021 22:32:18 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 22:32:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v4 0/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Tue, 22 Jun 2021 00:32:15 +0200
Message-Id: <20210621223217.3642303-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AdPmCm5UIgIZHzezAes9APSWkY-6bu0p
X-Proofpoint-GUID: RCK6Q1FTpnrqeH2XLDP3MR_4X8PODXVJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_13:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=895 phishscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210130
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
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
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

v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.html
v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).

Note: the SIGFPE issue is being fixed separately.
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html 

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL psw.addr reporting
  tests/tcg/s390x: Test SIGILL and SIGSEGV handling

 linux-user/s390x/cpu_loop.c     |  23 ++++-
 target/s390x/excp_helper.c      |  71 +++++++-------
 target/s390x/internal.h         |   1 +
 target/s390x/mem_helper.c       |   2 +-
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
 6 files changed, 226 insertions(+), 37 deletions(-)
 create mode 100644 tests/tcg/s390x/signal.c

-- 
2.31.1


