Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5CC6A1272
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJc7-00074Q-NT; Thu, 23 Feb 2023 16:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVJc4-00072X-JW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:58:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pVJc0-0002Fl-Ih
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:58:51 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NLPdUM017249; Thu, 23 Feb 2023 21:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=BVCWS4IbehyLIdS8quGC63YTZebRMI9+Heib4Fg43aE=;
 b=M9nFCRu2V1W9dxkm5TNmRCenHO1Qy/UEARkEgGL8aSGR+vH+jTk7GIHG8TDHaL6NC3C9
 lsU5k9mNUJwFkiz5jc4C8D0pQCTdbRdp90hYEFtMHscPvEkI+NZL3jeaiBp8DxH06cyK
 bm6u9loIqwMSjNEZ/pcu+Okccam84sooo04eUZa+oV2s0YxpwckRo8vKNJ944INHTr4I
 6Q0yOQbj/aZxaThde2hAH45Q2ydnto7zdgMYLrRv1DrTbT7CZQScDghlrD/NGf0wq9q8
 XFf1X/RsWePuCEeyqN5lLyMBQbEmnqDIPkHVPOQl6cWPmhuzTkEBHvM6vD3OVeQa32Hq AA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nxg238pcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 21:58:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31N7IKco002111;
 Thu, 23 Feb 2023 21:58:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3ntpa65es5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 21:58:42 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NLwctM21627144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:58:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 664D920043;
 Thu, 23 Feb 2023 21:58:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B89220040;
 Thu, 23 Feb 2023 21:58:38 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.17.238])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 21:58:37 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Thu, 23 Feb 2023 22:58:32 +0100
Message-Id: <20230223215834.166055-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -LOIZGwFG1OetaQhoyKiy4JNZvUfnrXo
X-Proofpoint-GUID: -LOIZGwFG1OetaQhoyKiy4JNZvUfnrXo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230177
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

 linux-user/syscall.c                        | 12 +++--
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 +++++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

-- 
2.39.1


