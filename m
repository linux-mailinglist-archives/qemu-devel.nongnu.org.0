Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8956A1460
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:40:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVM7d-0006qf-GI; Thu, 23 Feb 2023 19:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVM7Q-0006pB-RV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:39:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVM7N-0006TY-CF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:39:24 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NLPdS4017238; Fri, 24 Feb 2023 00:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=zhdyrF8t0TDiC03rvu+Ca3olfZIffU9z/pN1mYIll8g=;
 b=Yd7NkS3RiDUiZXjgX2alfo19AAmJHHlmqGNm6nnBoIgOfQM7PYytjGgpIkQjtZPXatms
 RcfX4gOIkgK7urG5CD0vazy/NlX/OmtuuWhtIAYbSzX8Xx8wJeNFIAvNE+O5+ez/newx
 zS2w5LNvqm1STGntkGDtH2PiBvHjBYiB97OmmHmy+ol59ECt8S8vBL5lDDiFqbBYoPeP
 pSVr4pyxepoaE2IbmTBHMM0tTwJjeD+WcsceAEMz6ZZNQLyYbtCa3oQ3JL73dEVLK8nk
 yGBTlnoIWDs/L5LQ6fO/WbvgVv3rIszRnWjbeWssPRKtjY5q5fEJwTJfuJ/z0h4F4jkJ hQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxg23c0ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 00:39:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NNsZ45007421;
 Fri, 24 Feb 2023 00:39:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6fap1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 00:39:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31O0dBI529164118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 00:39:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B832F20049;
 Fri, 24 Feb 2023 00:39:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C71520043;
 Fri, 24 Feb 2023 00:39:11 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.17.238])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Feb 2023 00:39:11 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Fri, 24 Feb 2023 01:39:05 +0100
Message-Id: <20230224003907.263914-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aC8ejQpioccvA-oqAeSWHYJvnEXTLO6u
X-Proofpoint-GUID: aC8ejQpioccvA-oqAeSWHYJvnEXTLO6u
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_14,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240003
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

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg07017.html
v2 -> v3: Fix __put_user() argument order mixup.
          I tested v2 only against sh4, where the original problem was
          discovered, but it regresses aarch64.

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06999.html
v1 -> v2: Fix by using proper target_rlimit64 alignment (Richard).
          Use __get_user() and __put_user() (Philippe - if I understood
          the suggestion correctly).

Hi,

Richard reported [1] that the new linux-fork-trap test was failing
under UBSan [2], so it was excluded from the PR.

This is a resend of the test plus the fix for the additional issue that
it uncovered.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06130.html
[2] https://gitlab.com/qemu-project/qemu/-/jobs/3807471447#L5064

Best regards,
Ilya

Ilya Leoshkevich (2):
  linux-user: Fix unaligned memory access in prlimit64 syscall
  tests/tcg/linux-test: Add linux-fork-trap test

 linux-user/generic/target_resource.h        |  4 +-
 linux-user/syscall.c                        |  8 ++--
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 +++++++++++++++++++++
 3 files changed, 57 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

-- 
2.39.1


