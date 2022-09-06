Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EED5ADC36
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:12:58 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMD3-00086b-0g
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM98-0003dK-0J
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:08:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM95-0002GX-RC
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:08:53 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285NqbHE025209;
 Tue, 6 Sep 2022 00:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=lFYgP4Rz4anqudd9LDrnKAnhQPDYRWLus70ZTNoBkOY=;
 b=an+RtKRWqvDXEc2dFofnX5ByEQ2cgblZHfRCBI/76Zd9egsP9axmJJfo4TaGfS5T9STY
 tIhK+79HznXvgH+EIL0o+4hi4wKuclqHUbGlhQPRV6HnBWL2DHHVB/mTUsfw3KrDg7dw
 3NSwKZwN7jGnP3ef6HkleBre/8yna8fvc5EQWZGFYPioFN9ieayA+4pzLJmY1u93ABTW
 fP9d6FB4oExq1P8IV0UHtbGOmDi+n7ecmigIW5AxYowoUKjbv8Wk+10G032E1D/tbyYg
 hFyhOqJsjHcu2dRcRV9Nz9PMCIO06xydAouuqjLaa8joM/0UxN+uFLhApkl2q9BxMYKm hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rewm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:48 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285Ntli7007417;
 Tue, 6 Sep 2022 00:08:48 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60revc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28606kcs016759;
 Tue, 6 Sep 2022 00:08:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hk134-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:08:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28608hMC41156976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:08:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C97611C04A;
 Tue,  6 Sep 2022 00:08:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C76A11C04C;
 Tue,  6 Sep 2022 00:08:43 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:08:43 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/5] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
Date: Tue,  6 Sep 2022 02:08:34 +0200
Message-Id: <20220906000839.1672934-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kpdid4Cdi7SZjD7vwQjHB14RXxG-oFpF
X-Proofpoint-ORIG-GUID: DgZ3UnChf_sX2MSF9mFUb0RyABrAisjL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050118
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series is made of patches from [1]. I've added a test and noticed
that madvise(MADV_DONTNEED) was broken on alpha, fixing which required
adding per-arch MADV_* definitions. This in turn affected the strace
patch, so it made sense to make a series out of the results.

Patch 1 adds MADV_* constants for all architectures.
Patch 2 fixes the alpha bug.
Patch 3 adds madvise() support to strace.
Patch 4 adds MADV_DONTNEED support for file mappings.
Patch 5 adds a test.

Best regards,
Ilya

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00710.html

Ilya Leoshkevich (5):
  linux-user: Provide MADV_* definitions
  linux-user: Fix madvise(MADV_DONTNEED) on alpha
  linux-user: Implement stracing madvise()
  linux-user: Passthrough MADV_DONTNEED for certain file mappings
  tests/tcg/linux-test: Add linux-madvise test

 accel/tcg/translate-all.c                 |  2 +-
 include/exec/cpu-all.h                    |  6 ++
 linux-user/aarch64/target_mman.h          |  1 +
 linux-user/alpha/target_mman.h            |  8 ++
 linux-user/arm/target_mman.h              |  1 +
 linux-user/cris/target_mman.h             |  1 +
 linux-user/generic/target_mman.h          | 92 +++++++++++++++++++++++
 linux-user/hexagon/target_mman.h          |  1 +
 linux-user/hppa/target_mman.h             | 15 ++++
 linux-user/i386/target_mman.h             |  1 +
 linux-user/loongarch64/target_mman.h      |  1 +
 linux-user/m68k/target_mman.h             |  1 +
 linux-user/microblaze/target_mman.h       |  1 +
 linux-user/mips/target_mman.h             |  1 +
 linux-user/mips64/target_mman.h           |  1 +
 linux-user/mmap.c                         | 30 ++++++--
 linux-user/nios2/target_mman.h            |  1 +
 linux-user/openrisc/target_mman.h         |  1 +
 linux-user/ppc/target_mman.h              |  1 +
 linux-user/riscv/target_mman.h            |  1 +
 linux-user/s390x/target_mman.h            |  1 +
 linux-user/sh4/target_mman.h              |  1 +
 linux-user/sparc/target_mman.h            |  1 +
 linux-user/strace.c                       | 41 ++++++++++
 linux-user/strace.list                    |  2 +-
 linux-user/x86_64/target_mman.h           |  1 +
 linux-user/xtensa/target_mman.h           |  1 +
 tests/tcg/multiarch/linux/linux-madvise.c | 70 +++++++++++++++++
 28 files changed, 277 insertions(+), 8 deletions(-)
 create mode 100644 linux-user/aarch64/target_mman.h
 create mode 100644 linux-user/alpha/target_mman.h
 create mode 100644 linux-user/arm/target_mman.h
 create mode 100644 linux-user/cris/target_mman.h
 create mode 100644 linux-user/generic/target_mman.h
 create mode 100644 linux-user/hexagon/target_mman.h
 create mode 100644 linux-user/hppa/target_mman.h
 create mode 100644 linux-user/i386/target_mman.h
 create mode 100644 linux-user/loongarch64/target_mman.h
 create mode 100644 linux-user/m68k/target_mman.h
 create mode 100644 linux-user/microblaze/target_mman.h
 create mode 100644 linux-user/mips/target_mman.h
 create mode 100644 linux-user/mips64/target_mman.h
 create mode 100644 linux-user/nios2/target_mman.h
 create mode 100644 linux-user/openrisc/target_mman.h
 create mode 100644 linux-user/ppc/target_mman.h
 create mode 100644 linux-user/riscv/target_mman.h
 create mode 100644 linux-user/s390x/target_mman.h
 create mode 100644 linux-user/sh4/target_mman.h
 create mode 100644 linux-user/sparc/target_mman.h
 create mode 100644 linux-user/x86_64/target_mman.h
 create mode 100644 linux-user/xtensa/target_mman.h
 create mode 100644 tests/tcg/multiarch/linux/linux-madvise.c

-- 
2.37.2


