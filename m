Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2346A138F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKki-0002T9-8v; Thu, 23 Feb 2023 18:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKkf-0002RO-SM
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:11:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVKkd-0007XJ-Ot
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:11:49 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NKL6UK026081; Thu, 23 Feb 2023 23:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=cozK3ta6t/+qnbp5DEdwTbiq9SdTLEMxndnyyVMvq9I=;
 b=hRTxKVpMwMFBEJY8jw3iIrzjM/6RCJqnVw0fFw7NwCnqbLGgYKQfzKJLAt5xFtb9I9eu
 wEAkG003bmkK37kD0txh2EfULvqf9V3Un7HPFemWGScxwim7tGNu2Am4Ri1WAhRTVE+E
 OWlKJAol7RZ9ULHvGCDaTJVwjaD8kw3MjuopFof4oo4AzqWxk4aFPInJ9VPgt+iESMN+
 4phZI32xIFWmQvDHDp1hgVTpQd53M0Mxpmh9kpPB70iXRfjMKV3f1PPA82eIq1dcTMxi
 xB8atsAMgm+w/vwUU75I0UTW/fdWnQbi7RhqIYA5qBW8FsOmBWzniTduBAK6WxMHuzP9 0Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxf3m3vb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 23:11:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NN1KZV016569;
 Thu, 23 Feb 2023 23:11:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6f93a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 23:11:43 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NNBeOp38797740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 23:11:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA352004B;
 Thu, 23 Feb 2023 23:11:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2E7520040;
 Thu, 23 Feb 2023 23:11:39 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.17.238])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 23:11:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Fri, 24 Feb 2023 00:11:35 +0100
Message-Id: <20230223231137.186344-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TYwDzRCY-FutoRznoGwMvBGPH2gChlO4
X-Proofpoint-ORIG-GUID: TYwDzRCY-FutoRznoGwMvBGPH2gChlO4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230192
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


