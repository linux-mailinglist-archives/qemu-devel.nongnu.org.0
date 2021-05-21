Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477E38BCD3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:03:40 +0200 (CEST)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvRq-0006M2-Q9
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQE-0004sg-99; Thu, 20 May 2021 23:01:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ljvQC-0005S7-Ef; Thu, 20 May 2021 23:01:58 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L2YCsV066279; Thu, 20 May 2021 23:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BTYBsnMtN+GsFLjizgXj/yClgh56vR3NWkQTn/gWdKQ=;
 b=BB+PetvkIC0SShEPy+L5xlCVUC2d1FXkaIVeRvekyH8L04z7O2pqT4cFkEVmRqmcqodJ
 1vSOVsHzt2aeij49v2IFvxo9Iz6EQZV1b1D4GSqbAmb7MHNl3D/93+lxD2kY8DaM4wyq
 0Wh6kNYQJAxvvsmBOZ/BYWUJpdTdtbn4wKozQwLZqUKK6xo5H1ZP7bVwRc9ec9B2GJlK
 rBsXjmiSwwbHLw33mVlBT+R98xy1MnBDzL0N8dwCErlelX6dUWhmwfCjPc+A3fUJ5efy
 +MVI8Om6RQ4Xf3WcUmufx0PBBf8F/bYF5m46eDTc/UuB9oeNZwDOq38xZVZvfl0i2Wh3 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p3581hfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:52 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L2ondq122503;
 Thu, 20 May 2021 23:01:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p3581hff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 23:01:52 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L31okG031891;
 Fri, 21 May 2021 03:01:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 38j5x81mdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:01:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L31lxE53281146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 03:01:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F66BA4040;
 Fri, 21 May 2021 03:01:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36629A4053;
 Fri, 21 May 2021 03:01:47 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 03:01:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] Fix SIGILL psw.addr reporting
Date: Fri, 21 May 2021 05:01:44 +0200
Message-Id: <20210521030146.2831663-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y56csEqXPCo_IaxKeDwAmz1sw6AaPQTk
X-Proofpoint-ORIG-GUID: ivyuF1cKCEgg-DX33VA7iUtxVszg5BgE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_07:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=796
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210017
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL psw.addr reporting
  tests/tcg/s390x: Test SIGILL handling

 linux-user/s390x/cpu_loop.c     |  6 ++-
 target/s390x/excp_helper.c      | 69 ++++++++++++++++++---------------
 target/s390x/internal.h         |  1 +
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/sigill.c        | 41 ++++++++++++++++++++
 5 files changed, 85 insertions(+), 33 deletions(-)
 create mode 100644 tests/tcg/s390x/sigill.c

-- 
2.31.1


