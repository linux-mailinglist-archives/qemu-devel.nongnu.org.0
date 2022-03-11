Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25194D68B9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:51:27 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkMI-0000xQ-Uy
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKQ-0007KY-KW; Fri, 11 Mar 2022 13:49:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKO-0007Qe-O8; Fri, 11 Mar 2022 13:49:30 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BFk0vI029720; 
 Fri, 11 Mar 2022 18:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=amAwlhF9HdN4PsqxpJkCEZQrn9qUSKmKv9Kc+tZk9Ps=;
 b=d+7AB1Ug3yOtK738DtlAXjaKiRzRl30U7UNh0XQZadmeGt4+6Jvv8eAi7eoSOeadpTT+
 aSAsCtMzeolVy+marcJ2K22F3W2QsqZoq9sC/4cFV15IZu3n1U9HtN5S20fICi8cIZtS
 bp5nJ+de8MqT4vdMcDFX+rgaQM0kXXBZCZTphlB72u/Qkzp6dO+V21qMluJnD4HjnBeC
 ervxxEifb0ggfVMexmfXUB1OUjXNmd881L64PHA/SGktUYVaDnxsLYECIf4dX0TNVt1q
 wPnwd4bEtxtQT0huIVr0YcTyIsL2ZCPxrYGh4Vn5QaSz40DWE9mUgQEtOndhPD8p8Syz 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqncd296g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:25 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BIX5mH029308;
 Fri, 11 Mar 2022 18:49:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqncd295v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BInMjX024447;
 Fri, 11 Mar 2022 18:49:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnt934-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22BInI8D55378384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 18:49:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7E0FAE04D;
 Fri, 11 Mar 2022 18:49:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C3F6AE045;
 Fri, 11 Mar 2022 18:49:18 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Mar 2022 18:49:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/3] Fix BRASL and BRCL with large negative offsets
Date: Fri, 11 Mar 2022 19:49:08 +0100
Message-Id: <20220311184911.557245-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gIjv8UKrQiuZWFvpXVhiRlooyTCXea8_
X-Proofpoint-GUID: rxwK5bBN9ZBPAoUcygVow9PS4JG_4R6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_07,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I noticed that sometimes jumping backwards leads to crashes or hangs.
The problem is a missing cast.
Patches 1 and 2 fix the problem, patch 3 adds a test.

Best regards,
Ilya

Ilya Leoshkevich (3):
  s390x/tcg: Fix BRASL with a large negative offset
  s390x/tcg: Fix BRCL with a large negative offset
  tests/tcg/s390x: Test BRASL and BRCL with large negative offsets

 target/s390x/tcg/translate.c           |  4 ++--
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 29 ++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

-- 
2.35.1


