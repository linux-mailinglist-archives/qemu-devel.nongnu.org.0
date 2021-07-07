Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8263BE8F4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:44:31 +0200 (CEST)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17qo-0001SL-Dt
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pa-0007GK-Vo; Wed, 07 Jul 2021 09:43:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pY-00064c-VQ; Wed, 07 Jul 2021 09:43:14 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167DXt6n165619; Wed, 7 Jul 2021 09:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=EkfUU9O8RRN+okx00YPbIU6DbbiarlUXswhpQ5ci+UQ=;
 b=f7qfDtW+dwoopAczTEpXNjgjLCRDAZm/vTz+L5n4kI+lpZjwPGS2SuR9UuJvroJWHVLZ
 dHhJlD3kgWzDQjT8Qb1vGN2BwZQJjb+6mFNxr40Jnak/bNicH8T4Uh2SFl+gEizHCLSF
 yqE055DNqnFCI8FWM+9/rNp+AO8ViBKJ8/j87u6y6DAkE2780uqPLeQjptILZEcsw6EA
 ooGE5cLXUJxRAalrQjJWzM/zCr/wFg132hAri5DSn/4sg8RmRomudN5p6xS8b2jy50hD
 e9HhPqtVvTwpTkGxMpNHnK+4RIvYrq/CNUx42qmFtE78ybY30UfOovxzsZ//vLt4hxQy Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts0ke6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:07 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167DYD3G166854;
 Wed, 7 Jul 2021 09:43:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts0ke62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 167DWJ9V008071;
 Wed, 7 Jul 2021 13:43:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 39jfhcj3fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 13:43:06 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 167Dh3SK10944862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 13:43:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE6328059;
 Wed,  7 Jul 2021 13:43:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B7DF28065;
 Wed,  7 Jul 2021 13:43:03 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.77.134.179])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Jul 2021 13:43:02 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Date: Wed,  7 Jul 2021 09:42:29 -0400
Message-Id: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xljmg3x1nHvMG9Znlk9j3zYpe_2r1POE
X-Proofpoint-GUID: tnI0dMmEAc1OeJ4HLHTmHV9V6K-jHv_g
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_06:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070081
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-s390x signals with SIGILL on compare-and-trap instructions. This
breaks OpenJDK which expects SIGFPE in its implementation of implicit
exceptions.

This patch depends on [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE
psw.addr reporting
https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/

Based-on: 20210705210434.45824-1-iii@linux.ibm.com

v1 -> v2:
- Update to latest version of '... psw.addr reporting' patch
- Rebase to master and fix conflicts in tests/tcg/s390x/Makefile.target

Jonathan Albrecht (2):
  linux-user/s390x: signal with SIGFPE on compare-and-trap
  tests/tcg: Test that compare-and-trap raises SIGFPE

 linux-user/s390x/cpu_loop.c     |  19 +++---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/s390x/trap.c

-- 
2.31.1


