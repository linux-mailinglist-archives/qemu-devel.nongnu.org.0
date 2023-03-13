Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFA6B862B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrkf-0007Ra-7q; Mon, 13 Mar 2023 19:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkU-0007If-Jg; Mon, 13 Mar 2023 19:38:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkM-0003SX-NH; Mon, 13 Mar 2023 19:38:38 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DLDxDR002247; Mon, 13 Mar 2023 23:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=59vzc2dT9g5j8lnmLOOc6E+XLR23lTJwQDfDROPekfA=;
 b=mCeO8Pr/1O5iFD1TuHhMU7n+507Cdn5SpT2Z13W1MZjjs7e4PcibVHqat5v769HM2opK
 H75LHpohiMkAlAtWsSEMbskqnJP29DWdol1pF21OGqyYJNbfiPUfNrYmbGjpwO+m5EAW
 AlLhIa+stsYTEcf0IlWQ50tqgu/D7BWHwMTvdOMoNzuxAH8h3+XYEWd4Am9ddLmyH10P
 OmB7pMQhlbbZqvlHeVzIrLopiOSAPO5WTfbQBQ7nOagLBv/87yWt0Rwd1siZOcjMWiL9
 wzJ5qGfoug9HQWX7J0r3a+aQRmZzP20Dx68hsuR2PGOP3uHfVyFqOHmmD3XTwW6Iumv+ Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pabjgjywg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DNWZQH029678;
 Mon, 13 Mar 2023 23:38:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pabjgjyw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:27 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DKqCJn030756;
 Mon, 13 Mar 2023 23:38:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3p8h96k3qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DNcNXi5833314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 23:38:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD9C12004D;
 Mon, 13 Mar 2023 23:38:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 393AF2004B;
 Mon, 13 Mar 2023 23:38:23 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 23:38:23 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] Fix EXECUTE of relative long instructions
Date: Tue, 14 Mar 2023 00:38:17 +0100
Message-Id: <20230313233819.122329-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TnceXl9s1km7kgmaee_efGOICQztbz-V
X-Proofpoint-ORIG-GUID: 0vvwZBK8dADTkresqFEn8pL7apuu-ns9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_11,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=520 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130186
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
 target/s390x/tcg/translate.c       |  10 +-
 tests/tcg/s390x/Makefile.target    |   1 +
 tests/tcg/s390x/ex-relative-long.c | 149 +++++++++++++++++++++++++++++
 5 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

-- 
2.39.2


