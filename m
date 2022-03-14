Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50E4D8025
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:45:05 +0100 (CET)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTiCG-0008RP-Ji
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:45:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nTiA8-0006v1-WC; Mon, 14 Mar 2022 06:42:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nTiA3-0003CD-B4; Mon, 14 Mar 2022 06:42:52 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22E9Gaos019857; 
 Mon, 14 Mar 2022 10:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mHdFNimFGsu6s4QfhzBeXO7qNNN8H0UgX1GjuLnE2e8=;
 b=Ipsx/tvD8oX1QU+nMSBQ0kmMp3U85/G9dVIrtISkcvJHyJN613fw3oyNEayu1Vc9hs+A
 iW15o9TDQXQssWzKMrYHrNSy1ZMgYqioHdZa3zCjxxONtkoBvQz4pYxCQXcaO0aIYv1+
 720FA6VWiwZvgAYouh209h4V3CBhlqxX7SSx/E6jECTkzn6JcWov50IP+JFYQrGcAJ5p
 cN77nISHMCY1soh0cdphCJIb4WLgJcOmG4n6CnEAaweFZgrBI7QFwDEez+0k/Rr+VoCb
 1avg2uwO4s08BRYpUc6a4oF8B4xm0NyD94ae2Bx4CHkgiCpHV8ImHbB3GC55+n+p33Xm 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es53qqqk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:42:44 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22E9pfIu015075;
 Mon, 14 Mar 2022 10:42:44 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es53qqqja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:42:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EAbGvb016751;
 Mon, 14 Mar 2022 10:42:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshkcvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:42:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EAgbH654133014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 10:42:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 044CB11CFC5;
 Mon, 14 Mar 2022 10:42:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4140B11D0C3;
 Mon, 14 Mar 2022 10:42:33 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 10:42:33 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 0/3] Fix BRASL and BRCL with large negative offsets
Date: Mon, 14 Mar 2022 11:42:29 +0100
Message-Id: <20220314104232.675863-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BOKyvlF5dTrYTPHVT8RIS5F1vfIw4jUN
X-Proofpoint-ORIG-GUID: fcRr4FUJSU5f1KjldoEkl5DzFijZloqb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140065
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


v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03356.html
v1 -> v2:
- Skip the test if mmap() fails (Richard).
- Replace test opcodes with inline asm (David). Since we now want to
  skip the test if the code cannot be mapped (e.g. on a 31-bit host),
  we shouldn't be asking the loader to map the code right away. So
  the mmap() approach stays.

v2: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03387.html
v2 -> v3:
- Use MAP_NORESERVE (Christian / David).
- Unhardcode 0x100000006 (Richard).

Best regards,
Ilya

Ilya Leoshkevich (3):
  s390x/tcg: Fix BRASL with a large negative offset
  s390x/tcg: Fix BRCL with a large negative offset
  tests/tcg/s390x: Test BRASL and BRCL with large negative offsets

 target/s390x/tcg/translate.c           |  4 +-
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

-- 
2.35.1


