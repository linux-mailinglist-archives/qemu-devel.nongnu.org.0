Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF569465F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYKS-0004vl-8V; Mon, 13 Feb 2023 07:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKO-0004vA-Id
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKM-0008WE-Kh
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:04 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DCiZwb006544; Mon, 13 Feb 2023 12:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Vi4D1PaTa34R0f0RuZiaLfrv6rVIhJLT9vWMkMzCISU=;
 b=ZqWUbKAEWyJEgxLoykdD00EOjhxIdBT0O6bRRnZPAYtifIueqof8WS2Y02de/smBXxg0
 AivpQ0L9YCM7K+F/9AbPMmJtZ7Vc3Iua9hm93CmZWfw4PazOodzZZeAEtOZm3jh+oLTj
 2MkBeronuXBQQFH86zylFUCO0osolAm8XwTcbpuvQs1DAX6uhOR+5KBMPXZDUQ8YvbEF
 B13wspaOiwnnY7mW9hg9dted6MEI12zPLyEJQ97dcs7U8zvLtIfN1rNJoMIX+sy4M02g
 NT5VNA0TUhTB76lrXmfcHjXPtyaGX+YappuFs1bWK71EAQB7FU641RKDDXfjAwmocnP4 RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn15rq5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:51 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DCjYmT013356;
 Mon, 13 Feb 2023 12:52:50 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn15rq4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:50 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31D7oVDH002286;
 Mon, 13 Feb 2023 12:52:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3np2n69yu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DCqjCf50135414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 12:52:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F5F2004F;
 Mon, 13 Feb 2023 12:52:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B9E82004E;
 Mon, 13 Feb 2023 12:52:44 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.19.58])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 12:52:44 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/4] Fix deadlock when dying because of a signal
Date: Mon, 13 Feb 2023 13:52:33 +0100
Message-Id: <20230213125238.331881-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WT0CvaEnuEmxFYsn9bGMYupnXEAGH89-
X-Proofpoint-ORIG-GUID: F5hb7pyv5vQNcBUVbJB8f09jeElsF1Dg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_07,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=957 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130112
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

Based-on: <20230202005204.2055899-1-richard.henderson@linaro.org>
("[PATCH 00/14] linux-user/sparc: Handle missing traps")

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg07251.html
v1 -> v2: Drop the sparc patch (superseded by Richard's series).
          Add the end_exclusive() fix.

Hi,

wasmtime testsuite found a deadlock in qemu_plugin_user_exit().
I tracked it down to one of my earlier patches, which introduced
cleanup in dump_core_and_abort().

Patches 1 and 2 fix the issue, patch 3 fixes __builtin_trap()
handling in microblaze, which is needed for patch 4, that adds a test.

Best regards,
Ilya

Ilya Leoshkevich (4):
  linux-user: Always exit from exclusive state in fork_end()
  cpus: Make {start,end}_exclusive() recursive
  linux-user/microblaze: Handle privileged exception
  tests/tcg/linux-test: Add linux-fork-trap test

 cpus-common.c                               | 12 +++++-
 include/hw/core/cpu.h                       |  4 +-
 linux-user/main.c                           | 10 +++--
 linux-user/microblaze/cpu_loop.c            | 10 ++++-
 linux-user/syscall.c                        |  1 +
 tests/tcg/multiarch/linux/linux-fork-trap.c | 48 +++++++++++++++++++++
 6 files changed, 75 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

-- 
2.39.1


