Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD038C592
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:21:15 +0200 (CEST)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3DO-0003Fm-1u
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3BZ-0001of-Sj; Fri, 21 May 2021 07:19:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28618
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lk3BV-0002vW-GG; Fri, 21 May 2021 07:19:21 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LB3AQn118019; Fri, 21 May 2021 07:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6I+G3DMLIgXp78b25k0C5qpu4Ccgoen9hRY42ycuWY4=;
 b=VdkhBBMWZc4Tgk6lq60O41Qiuc8V1F1bid0TrHxZDcbmbtBeWr/WINKJI5LHfDIZDGIX
 mg+BA5jWSYIv4+R986BVGZHGtlgRWuehVzFexOrGRfmiOljpjC8/q1mVu2kZxMGlqvFM
 v65ELuEXUTBi6r+L0yHF2oB/0M2zQ5oHhyjYMui+LU6AXqF0EKH4WZzh4S1Tmbl39GhU
 VXkg5rLia/kG6No1r6g8O6CkE/Qfm8D2vTNEvngsibkGp+A8eTREIzp6zc2Bgu1k8PFv
 g4x80chJ35b7gdkkQheRTAV+GTRri76aRhO0cmSzkZlL0hbowZwnGwLhQhA1w3185VJE 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pamqsy91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:15 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LB4uxs128966;
 Fri, 21 May 2021 07:19:14 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pamqsy8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:19:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LB7eTn030424;
 Fri, 21 May 2021 11:19:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 38m19ss415-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 11:19:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LBJAqC38535536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 11:19:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7A52AE04D;
 Fri, 21 May 2021 11:19:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FBF6AE059;
 Fri, 21 May 2021 11:19:09 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 11:19:09 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 0/2] target/s390x: Fix SIGILL psw.addr reporting
Date: Fri, 21 May 2021 13:19:06 +0200
Message-Id: <20210521111908.2843735-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qJrVFDWlFkp3KAodbJulNVBnDtZ__SUS
X-Proofpoint-GUID: TmmoWjsdgAsSnJDuC2PXZBe7RoCSMKRp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=867 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
          magic in the test and add an explanation (David).

Ilya Leoshkevich (2):
  target/s390x: Fix SIGILL psw.addr reporting
  tests/tcg/s390x: Test SIGILL handling

 linux-user/s390x/cpu_loop.c     |  6 ++-
 target/s390x/excp_helper.c      | 69 ++++++++++++++++++---------------
 target/s390x/internal.h         |  1 +
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/sigill.c        | 52 +++++++++++++++++++++++++
 5 files changed, 96 insertions(+), 33 deletions(-)
 create mode 100644 tests/tcg/s390x/sigill.c

-- 
2.31.1


