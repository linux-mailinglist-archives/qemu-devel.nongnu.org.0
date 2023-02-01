Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBF685C64
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 01:47:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN1Ge-0006Lq-0h; Tue, 31 Jan 2023 19:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1Ga-0006LY-Ns
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1GY-0004JM-Jk
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:24 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VN1Y0D003164; Wed, 1 Feb 2023 00:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=m8x6RBt+VGiy2M3hBCmSIiRHlF6WOoobBP95OZCPhE4=;
 b=JWkCEjlmmAEWXQCXTQe41ZEkbyvu2Cvk+hdgjHfx4KG4eR5iXPKjn1vRgOwmRMx8otXR
 4Mlj3gnfVOL28AXpuUwYxVhjTC11Orn28XagCACYjpeLQrNCutTcKqIleLqsYsvZ/BQo
 4rzl+HQwWHczfkvlr5ge4MrRcePy9r5yQNn+a+XV8/qNPgJv5wd+VoLLqD1txllOM85V
 o4sGNQKoe9grAnefKScex8s9sH6N5Iuc0fEGtviBRAwHIsOYsBT4ZbpA5royr/ow5xc8
 xb8ErcvbTl581nkQVRVaCYWFq8ikWoLrXN4+v4GRRFy3LxN0orBxKHsBq4hD+0hA2K9X lA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nf83d9668-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VE7dsH014675;
 Wed, 1 Feb 2023 00:46:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttv43g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3110kEaX45547860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 00:46:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 126DE2004D;
 Wed,  1 Feb 2023 00:46:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9820F20040;
 Wed,  1 Feb 2023 00:46:13 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.18.228])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 00:46:13 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/4] Fix deadlock when dying because of a signal
Date: Wed,  1 Feb 2023 01:46:05 +0100
Message-Id: <20230201004609.3005029-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y3kImJ9WeQJ0Hlfk2FIZtaOtQgBmY0Vu
X-Proofpoint-GUID: y3kImJ9WeQJ0Hlfk2FIZtaOtQgBmY0Vu
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=991
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010003
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Hi,

wasmtime testsuite found a deadlock in qemu_plugin_user_exit().
I tracked it down to one of my earlier patches, which introduced
cleanup in dump_core_and_abort().

Patch 1 fixes the issue, patches 2 and 3 fix __builtin_trap()
handling in microblaze and sparc - which is needed for patch 4,
that adds a test.

Just before sending this, I noticed that a solution has already been
proposed in [1], but apparently it wasn't accepted.

Best regards,
Ilya

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03506.html

Ilya Leoshkevich (4):
  cpus: Make {start,end}_exclusive() recursive
  linux-user/microblaze: Handle privileged exception
  linux-user/sparc: Handle "ta 5"
  tests/tcg/linux-test: Add linux-fork-trap test

 cpus-common.c                               | 12 +++++-
 include/hw/core/cpu.h                       |  4 +-
 linux-user/microblaze/cpu_loop.c            | 10 ++++-
 linux-user/sparc/cpu_loop.c                 |  3 ++
 tests/tcg/multiarch/linux/linux-fork-trap.c | 48 +++++++++++++++++++++
 5 files changed, 71 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

-- 
2.39.1


