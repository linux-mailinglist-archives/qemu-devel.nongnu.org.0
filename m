Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00316BA3EB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 01:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEju-00068G-N7; Tue, 14 Mar 2023 20:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEjs-00067G-8d; Tue, 14 Mar 2023 20:11:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEjq-0008FY-Cf; Tue, 14 Mar 2023 20:11:32 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ENlIZR030491; Wed, 15 Mar 2023 00:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=SzkH4xpm44mLlHquj9uEzxqtfDKWG+EDS38D78mqn5M=;
 b=BeU0brao8v7ax5mmv+oKC42kozn3xhElWG3ZS+4XuDitKAyWwZCMOn0wEwLHTpMzDbpl
 BEQtoAgG+cDx1DRRFCTkW9urkMfdNmCVcK1Lnb0V80qH6cAypCA+ICBbsvLbQuSYE29T
 jabTt/x2xRwx6A0TfbDdKps2eACc75tFXqPQL3YC3r8Fdfl6mxioECqSUp6N8csc1P1H
 +xO8yhVfJYwiJwdeV5H/GcmarpY3/4XyEK90Tiy6hPiFaLtc0HIAyELfhu4BgOJbSbjl
 4Zwid8a/MHH9vIGP+ZC2v215NjC/NlHTAPtjy5HGYWfhpxQ7RVjiT2lp8rFgKMuaEan3 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2wgrfe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:25 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ENwun2000806;
 Wed, 15 Mar 2023 00:11:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2wgrfdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN5MYs032158;
 Wed, 15 Mar 2023 00:11:23 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pb29u81n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 00:11:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F0BKsH26870280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 00:11:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20BFE2004E;
 Wed, 15 Mar 2023 00:11:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B9FC2004B;
 Wed, 15 Mar 2023 00:11:19 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 00:11:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/2] Fix EXECUTE of relative long instructions
Date: Wed, 15 Mar 2023 01:11:15 +0100
Message-Id: <20230315001117.337128-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gARzXeku-f6Cdb-B2WfE1Ma4JV3GYzzJ
X-Proofpoint-GUID: 8XSrgQ2fmue8tf4EO6LjmgtVau03Ynw0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=530 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303140189
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
 tests/tcg/s390x/ex-relative-long.c | 159 +++++++++++++++++++++++++++++
 5 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/ex-relative-long.c

-- 
2.39.2


