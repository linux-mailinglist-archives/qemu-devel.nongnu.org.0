Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263958CC8F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:13:46 +0200 (CEST)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6K1-0007c4-Jc
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6H9-0003re-NX; Mon, 08 Aug 2022 13:10:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6H6-00036O-EZ; Mon, 08 Aug 2022 13:10:47 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278H1kOT002745;
 Mon, 8 Aug 2022 17:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=FC7Wt4tjhfWJ2XftlTdFUVSv6NimcXNzgr0fA87Rmsw=;
 b=Rpcod/+PM+dcxphv8wkBRdGa9uQxSnaq5hRcKvQi1Kowx4R6EGKC3swgO56Mf9WOp+bR
 Ok59cRnF/jZIRvhmUDM73FqsuJz4cz/IyIi5+PMvxG4hWScPlz87wRvtLZBu84+yFaIE
 5fXvjLADW5FfhFDelJlj4/WJ4JBpK0NZxBx4F+pVoH9vNxXnMQ/79YlpyoUwjISSD5J5
 U/3TND2QHbXPIiNRlqIoECLIFkLeFIx9eV6us6sboKG086m4UgLVwsBh7/eeq4fSmKY3
 AaSaq7m7id4XWX01EgrIRG0YajFiXM8ceE4E/BDATrHQl2HAoaQqwvisOlStCK/etpDM WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6he89b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:30 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278H34kn012196;
 Mon, 8 Aug 2022 17:10:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6he89a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278GoNXI024572;
 Mon, 8 Aug 2022 17:10:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3hsfx8tgcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 278HAORD27001108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Aug 2022 17:10:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6760DA4053;
 Mon,  8 Aug 2022 17:10:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4F6DA4040;
 Mon,  8 Aug 2022 17:10:23 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Aug 2022 17:10:23 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Mon,  8 Aug 2022 19:10:18 +0200
Message-Id: <20220808171022.49439-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z5DVMX-RrP7KMnADwKMpw4LDav8FtE6l
X-Proofpoint-GUID: 7-33nPj5ytOfWrtWvQ9xN6olwO1h84Fk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_10,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080079
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Hi,

I noticed that when we get a SEGV due to jumping to non-readable
memory, sometimes si_addr and program counter in siginfo_t are slightly
off. I tracked this down to the assumption that translators stop before
the end of a page, while in reality they may stop right after it.

Patch 1 fixes a minor invalidation issue, which may prevent SEGV from
happening altogether.
Patches 2-3 fix the main issue on x86_64 and s390x. Many other
architectures have fixed-size instructions and are not affected.
Patch 4 adds tests.

Best regards,
Ilya

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html
v1 -> v2: Fix individual translators instead of translator_loop
          (Peter).

v2: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01079.html
v2 -> v3: Peek at the next instruction on s390x (Richard).
          Undo more on i386 (Richard).
          Check PAGE_EXEC, not PAGE_READ (Peter, Richard).

Ilya Leoshkevich (4):
  accel/tcg: Invalidate translations when clearing PAGE_EXEC
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 accel/tcg/translate-all.c        |  17 ++--
 accel/tcg/translator.c           |   8 ++
 include/exec/translator.h        |  13 +++
 target/i386/tcg/translate.c      |  21 ++++-
 target/s390x/tcg/translate.c     |  15 +++-
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 10 files changed, 442 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

-- 
2.37.1


