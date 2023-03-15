Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE26BC0DB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcaW2-0007Yq-Lz; Wed, 15 Mar 2023 19:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcaW0-0007Y6-6S; Wed, 15 Mar 2023 19:26:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcaVw-0006d6-Av; Wed, 15 Mar 2023 19:26:39 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FMWLeb018587; Wed, 15 Mar 2023 23:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=liKYsTOzFZJjv4A2fItSVwEEFMIqUKEcPfXgb8tfRts=;
 b=alwm/B/w//SXVhIQL4SzY/mic8UHKWkizcvS665AbP285TSjHHSvQxwsTbXfi9g5I7fW
 uvuW5p4jV71ZiTSv98/v/cPtUUn2cCwkQ2Y2cYtvTcHPAQ67tn47STD93bUt7wNJQBjM
 EsWjYe5ghZ3fhk47MsD0zrjuJEuJRBJWdw/IVU3bvxlfdeM+pZMKD6+Ef5ipR3FgXax6
 LTFdjqrRPCGLvR4CHM8qit7YyAH+rT3toQVtP8Nvf+5NQTIkCp4KnYbnW8SFySrFeaec
 b52pjiaYt5Wu9iztFtuFypJleH0d8a5uNsJcqQCoo/Uo4CsJhHsuAezvuAqr6OxJ5huh qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwarx5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:32 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FNQW9g009077;
 Wed, 15 Mar 2023 23:26:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwarx5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:31 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FLtmIa019121;
 Wed, 15 Mar 2023 23:26:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pbpbq025c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:26:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FNQRDR42074796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 23:26:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AE782004B;
 Wed, 15 Mar 2023 23:26:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D1C20040;
 Wed, 15 Mar 2023 23:26:26 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 23:26:26 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 00/12] target/s390x: Handle unaligned accesses
Date: Thu, 16 Mar 2023 00:26:12 +0100
Message-Id: <20230315232624.107329-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XPsZJV5y0bWPtOS66m8g9O9omSFk_XSD
X-Proofpoint-GUID: zf-kyTFJyF9GBmZCvpZbc5QSqzvFPf3Y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=924
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150188
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

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04231.html
v2 -> v3: Fix clang build (Thomas).

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03821.html
v1 -> v2: Use MO_ALIGN (Richard).

Patches that need review:
- [PATCH 12/12] tests/tcg/s390x: Test unaligned accesses

Hi,

This series makes accessing unaligned addresses with branching, LPSWE,
EXECUTE and relative long instructions fail with a specification
exception instead of succeeding.

Patches 1-10 are fixes, patch 11 adjusts a comment to reflect a change
done by fixes, patch 12 adds a number of softmmu and user tests.

Best regards,
Ilya

Ilya Leoshkevich (12):
  target/s390x: Handle branching to odd addresses
  target/s390x: Handle EXECUTE of odd addresses
  target/s390x: Handle LGRL from non-aligned addresses
  target/s390x: Handle LRL and LGFRL from non-aligned addresses
  target/s390x: Handle LLGFRL from non-aligned addresses
  target/s390x: Handle CRL and CGFRL with non-aligned addresses
  target/s390x: Handle CGRL and CLGRL with non-aligned addresses
  target/s390x: Handle CLRL and CLGFRL with non-aligned addresses
  target/s390x: Handle STRL to non-aligned addresses
  target/s390x: Handle STGRL to non-aligned addresses
  target/s390x: Update do_unaligned_access() comment
  tests/tcg/s390x: Test unaligned accesses

 target/s390x/cpu.h                      |  9 +++
 target/s390x/tcg/excp_helper.c          |  4 +-
 target/s390x/tcg/insn-data.h.inc        | 46 ++++++-------
 target/s390x/tcg/mem_helper.c           | 12 +++-
 target/s390x/tcg/translate.c            | 24 ++++---
 tests/tcg/s390x/Makefile.softmmu-target |  4 +-
 tests/tcg/s390x/Makefile.target         |  3 +
 tests/tcg/s390x/asm-const.h             | 13 ++++
 tests/tcg/s390x/br-odd.S                | 18 +++++
 tests/tcg/s390x/cgrl-unaligned.S        | 17 +++++
 tests/tcg/s390x/clrl-unaligned.S        | 15 +++++
 tests/tcg/s390x/crl-unaligned.S         | 17 +++++
 tests/tcg/s390x/ex-odd.S                | 17 +++++
 tests/tcg/s390x/lgrl-unaligned.S        | 17 +++++
 tests/tcg/s390x/llgfrl-unaligned.S      | 17 +++++
 tests/tcg/s390x/lpswe-unaligned.S       | 17 +++++
 tests/tcg/s390x/lrl-unaligned.S         | 17 +++++
 tests/tcg/s390x/pgm-specification.inc   | 90 +++++++++++++++++++++++++
 tests/tcg/s390x/pgm-specification.mak   | 15 +++++
 tests/tcg/s390x/stgrl-unaligned.S       | 17 +++++
 tests/tcg/s390x/strl-unaligned.S        | 17 +++++
 21 files changed, 370 insertions(+), 36 deletions(-)
 create mode 100644 tests/tcg/s390x/asm-const.h
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification.inc
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S

-- 
2.39.2


