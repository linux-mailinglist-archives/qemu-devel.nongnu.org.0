Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349B6EFE21
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 01:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prp1t-000300-KK; Wed, 26 Apr 2023 19:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1p-0002xF-2z; Wed, 26 Apr 2023 19:58:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1m-0005Fv-Sd; Wed, 26 Apr 2023 19:58:28 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QNnbB4000597; Wed, 26 Apr 2023 23:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RCOy+7rYNx8jardrqmZFCQRNMMHYCTzop1cw6RIWUsg=;
 b=h0p1BoKaNZo4CfC2hqASxZesXhJP/NTrAYGJzAUwDLB/ITDKCPL/OgRuhSgRG5aL6KXQ
 6CNHKvf6/OK8sV6L/EEhRxNJ2oaTEKKlL2ruLXMLki+vqtjFzfJ+aDFdOBbaAPUKgCYi
 JhVYmWWPNEy2ylDZJK/NaVxXjy+1X3CqnUJBTMFEFjAjk39xcQ57BZPzQcdbHWMVBSt6
 cXjUkagFQnVY1Q5STx2v+x9VskMvTz3GxaMmrVZMmhCoQqqEI8gamI9Gqy/RSR/+oOHG
 zstBKoTTeGz/g5MHudzzIa0+NNPB+650Jrhx+dsMZW4qBj5iWLBmyhepIRIP6RlFbb1S MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7c7ntq9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:23 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33QNvECF023132;
 Wed, 26 Apr 2023 23:58:22 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7c7ntq99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:22 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33QIatwH023266;
 Wed, 26 Apr 2023 23:58:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3q4776t5tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33QNwIbc1507850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 23:58:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A9CD2004B;
 Wed, 26 Apr 2023 23:58:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24C4320040;
 Wed, 26 Apr 2023 23:58:18 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.69.68])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 26 Apr 2023 23:58:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] target/s390x: Fix EXECUTE of relative branches
Date: Thu, 27 Apr 2023 01:58:11 +0200
Message-Id: <20230426235813.198183-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8o2FCr7P9EgUXmayeFCR5SCuAwnLmY8u
X-Proofpoint-GUID: u1i-N63vp2WHnLbptGI4D4DnLDjueQS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=880
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260203
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This series fixes EXECUTing relative branches: currently the offset is
incorrectly applied to EXECUTE and not the branch itself. This is
similar to what I previously fixed for load/store instructions.

Unfortunately here it's not feaisble to use the ri2 field, since it
would break the direct branch optimization. Instead, introduce the
disas_jdest() macro and pass its output to help_branch().

Patch 1 is the fix, patch 2 is the test.

Best regards,
Ilya

Ilya Leoshkevich (2):
  target/s390x: Fix EXECUTE of relative branches
  tests/tcg/s390x: Test EXECUTE of relative branches

 target/s390x/tcg/translate.c    |  81 +++++++++++-----
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/ex-branch.c     | 158 ++++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+), 23 deletions(-)
 create mode 100644 tests/tcg/s390x/ex-branch.c

-- 
2.40.0


