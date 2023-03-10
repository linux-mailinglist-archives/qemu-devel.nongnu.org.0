Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37B6B3E3D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:43:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pab8W-0007fu-VW; Fri, 10 Mar 2023 06:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8U-0007ch-S8; Fri, 10 Mar 2023 06:42:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pab8T-00052V-0g; Fri, 10 Mar 2023 06:42:10 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AA1NKJ022624; Fri, 10 Mar 2023 11:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bAwamQG02eY5bVO0rhNQXiO8TnNrTCYZoq6+UCFitAI=;
 b=eyNX6yinXhGCvAvhY06Us9Rc23hgZVxwE3kWpCSaIpV+uNDZgLmKzqtHwKisk4Fl0h2f
 Y8qzmJgHicPoNNDCo6unSDF1tmmi+q7e5lyKHCwH9sxnIhlcjLubZSwnXMVqNcoJf4az
 mRzK4/PDkGyRWLavLZORuWFeBU6I61EKvjI2YYIWrFtoNYIg4N1ak6YWOL6eS/58PA/9
 ku+kOvaf0Ak6edD9fLUCCSexy1LuI+AUJOxmlMzpdiVd8QJl4CyrwZVrMA/3Ujv/2FsG
 +MtXcKH/RrjX2CnAyQA+B+FKpBF1rfMshp/WwVqVBke8vqSoMBl+Dal1HdRnkcjfkeVq yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7j15tv2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ABanij023872;
 Fri, 10 Mar 2023 11:42:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7j15tv27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A8F7d5019984;
 Fri, 10 Mar 2023 11:42:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p6ftvkt0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 11:42:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ABfxQv61210910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 11:41:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CE7120040;
 Fri, 10 Mar 2023 11:41:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8DD20043;
 Fri, 10 Mar 2023 11:41:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 11:41:58 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 0/2] target/s390x: Fix emulation of C(G)HRL
Date: Fri, 10 Mar 2023 12:41:55 +0100
Message-Id: <20230310114157.3024170-1-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RE8yCI-0jtNFK1vmc2Rq2azMFMAP1EOa
X-Proofpoint-GUID: 7NdRFk24K6XIEjDixWKNU3TZse4RNqIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_03,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=611 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
halfword, it does not have the same size as the first operand.
Fix this and add a tcg test for c(g)hrl.

v2 -> v3
 * pick up R-b's (thanks Richard)
 * get rid of tabs in inline asm (cosmetic only)

v1 -> v2
 * rebase on newer version

Nina Schoetterl-Glausch (2):
  target/s390x: Fix emulation of C(G)HRL
  tests/tcg/s390x: Add C(G)HRL test

 target/s390x/tcg/insn-data.h.inc |  4 +-
 target/s390x/tcg/translate.c     |  7 +++
 tests/tcg/s390x/chrl.c           | 80 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |  1 +
 4 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/chrl.c

Range-diff against v2:
1:  228a1d9cfb ! 1:  899db74823 target/s390x: Fix emulation of C(G)HRL
    @@ Commit message
         halfword, it does not have the same size as the first operand.
     
         Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
    +    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
         Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
     
      ## target/s390x/tcg/insn-data.h.inc ##
2:  3b1ca6b682 ! 2:  30868c4692 tests/tcg/s390x: Add C(G)HRL test
    @@ Commit message
         instruction.
         Test the sign extension performed on the second operand.
     
    +    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
         Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
     
      ## tests/tcg/s390x/chrl.c (new) ##
    @@ tests/tcg/s390x/chrl.c (new)
     +    uint32_t program_mask, cc;
     +
     +    asm volatile (
    -+               ".pushsection .rodata\n"
    -+        "0:	.short	1,0x8000\n"
    -+        "	.popsection\n"
    ++        ".pushsection .rodata\n"
    ++        "0:\n\t"
    ++        ".short 1, 0x8000\n\t"
    ++        ".popsection\n\t"
     +
    -+        "	chrl	%[r],0b\n"
    -+        "	ipm	%[program_mask]\n"
    ++        "chrl %[r], 0b\n\t"
    ++        "ipm %[program_mask]\n"
     +        : [program_mask] "=r" (program_mask)
     +        : [r] "r" (1)
     +    );
    @@ tests/tcg/s390x/chrl.c (new)
     +    assert(!cc);
     +
     +    asm volatile (
    -+               ".pushsection .rodata\n"
    -+        "0:	.short	-1,0x8000\n"
    -+        "	.popsection\n"
    ++        ".pushsection .rodata\n"
    ++        "0:\n\t"
    ++        ".short -1, 0x8000\n\t"
    ++        ".popsection\n\t"
     +
    -+        "	chrl	%[r],0b\n"
    -+        "	ipm	%[program_mask]\n"
    ++        "chrl %[r], 0b\n\t"
    ++        "ipm %[program_mask]\n"
     +        : [program_mask] "=r" (program_mask)
     +        : [r] "r" (-1)
     +    );
    @@ tests/tcg/s390x/chrl.c (new)
     +    uint32_t program_mask, cc;
     +
     +    asm volatile (
    -+               ".pushsection .rodata\n"
    -+        "0:	.short	1,0x8000,0,0\n"
    -+        "	.popsection\n"
    ++        ".pushsection .rodata\n"
    ++        "0:\n\t"
    ++        ".short 1, 0x8000, 0, 0\n\t"
    ++        ".popsection\n\t"
     +
    -+        "	cghrl	%[r],0b\n"
    -+        "	ipm	%[program_mask]\n"
    ++        "cghrl %[r], 0b\n\t"
    ++        "ipm %[program_mask]\n"
     +        : [program_mask] "=r" (program_mask)
     +        : [r] "r" (1L)
     +    );
    @@ tests/tcg/s390x/chrl.c (new)
     +    assert(!cc);
     +
     +    asm volatile (
    -+               ".pushsection .rodata\n"
    -+        "0:	.short	-1,0x8000,0,0\n"
    -+        "	.popsection\n"
    ++        ".pushsection .rodata\n"
    ++        "0:\n\t"
    ++        ".short -1, 0x8000, 0, 0\n\t"
    ++        ".popsection\n\t"
     +
    -+        "	cghrl	%[r],0b\n"
    -+        "	ipm	%[program_mask]\n"
    ++        "cghrl %[r], 0b\n\t"
    ++        "ipm %[program_mask]\n"
     +        : [program_mask] "=r" (program_mask)
     +        : [r] "r" (-1L)
     +    );

base-commit: 15002921e878e6cf485f655d580733b5319ea015
-- 
2.39.1


