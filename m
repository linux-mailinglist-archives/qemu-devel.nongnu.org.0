Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF046BDA97
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 22:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcupT-0002SI-Cg; Thu, 16 Mar 2023 17:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupR-0002Rt-4z; Thu, 16 Mar 2023 17:08:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupP-0008Qb-67; Thu, 16 Mar 2023 17:08:04 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GJp9Rg031494; Thu, 16 Mar 2023 21:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LZ2UW6E5Xg6ty9+TP4HkrnCpnBF30qYJ9lfPGJSabJk=;
 b=KH4IHjdQIHrzOC9r4QClu4BAohuJ0knsPy60boVvRG1IfmKrmKjhI0yl3LG86JH+l+Sp
 DdOKxYekmJlEUDN8MrMEDc6sqJQP4CTnHUX3g2Y/U0/XV+qEe7ocbk8OHjFgfmjkILuu
 OrVZs2tABQ31DguVD90QSLfNBlEBplcDZ/KZ89iir/HYViQkcfGue51RNYm0KdmXew7t
 t7TTC4XmF4drpaaGjJu8XxraqNlQMbAgWPV8KOBmdF6V4UqJ51qAxLoMIT01HLuCLsQx
 kHMTctAfnWeXzC9EUVI4JAX7ZAKMDs0wDadiSd9yqqEgLYqPZSowBxnj+Wcg28zJx/fl mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc9mmsn2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:07:59 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GKvHfi015182;
 Thu, 16 Mar 2023 21:07:59 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc9mmsn1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:07:59 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GI7HJw000859;
 Thu, 16 Mar 2023 21:07:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pbsmrh0qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:07:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GL7sSF27591366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 21:07:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B08A2004B;
 Thu, 16 Mar 2023 21:07:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B33F220040;
 Thu, 16 Mar 2023 21:07:53 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 21:07:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/2] Fix EXECUTE of relative long instructions
Date: Thu, 16 Mar 2023 22:07:49 +0100
Message-Id: <20230316210751.302423-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HNsFytVAKpKueSTptLZ5gI3Sqv6X5WDX
X-Proofpoint-GUID: LgxA0LyRg1RfbHn6uvF8JGQxcDPB-Mpv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=706
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303160158
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

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04499.html
v2 -> v3: Make mem static (Nina).
          Initialize cc with cr (Nina).
          Drop long casts (Nina).
          Move mask assignment outside of asm.
          Use "a" constraints instead of "r" where necessary.
          Drop unnecessary earlyclobbers.

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04316.html
v1 -> v2: Address the middle of an array in the test (Richard).
          Rebase - not 100% trivial, so not carrying Reviewed-bys.

Hi,

This series fixes EXECUTE of instructions like LARL, LGLR, etc.
Currently the address calculation uses EXECUTE's address as a base,
while it should be using that of the target instruction.
Patch 1 fixes the issue, patch 2 adds a test.

Best regards,
Ilya

Ilya Leoshkevich (2):
  target/s390x: Fix EXECUTE of relative long instructions
  tests/tcg/s390x: Add ex-relative-long.c

 target/s390x/cpu.h                 |   1 +
 target/s390x/tcg/mem_helper.c      |   1 +
 target/s390x/tcg/translate.c       |  13 ++-
 tests/tcg/s390x/Makefile.target    |   1 +
 tests/tcg/s390x/ex-relative-long.c | 156 +++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

-- 
2.39.2


