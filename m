Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120296B7C27
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:40:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkGP-0007kE-Mx; Mon, 13 Mar 2023 11:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGK-0007jX-Ra; Mon, 13 Mar 2023 11:39:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGI-0004uf-N0; Mon, 13 Mar 2023 11:39:00 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DEVAA1018236; Mon, 13 Mar 2023 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=stb+JVMRJDYe53Ow1FjMy1QCLPWrX8YUnoxqX/Wcqo4=;
 b=QMLbmfYQb7lk5admC8AlRtoolGy7kEr3PJR1IXXiBIGLrv57upy+UMs38lJKyj+1BjjX
 dp129pia3RrqTCtvNe3s9WOqtRenTLTUAlEMfaAPzoL9b6JKtUsdd15ymvykE1sEHo/P
 Dhu2drSlIb2AezgQxQkKF/x8ZM7ZZKu0ystNIA1NR5IuSfAKC2EoViQm+qMSE03mGnEo
 grLUnf22mFpHPgccmS6S5YwBEBYmkumC/eQb/bIlbqs9I3vGaRryqEMQ4OlpzfstXALR
 0TAxAgI6KRPv3k9ulcVVCjD2rrQ4GeQvHvEF+omW7uWNqRwTNLE6F3kDKb/dKxc+EpGB /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa459566p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:53 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DEFwYN015298;
 Mon, 13 Mar 2023 15:38:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa459565q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DDwlax028628;
 Mon, 13 Mar 2023 15:38:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96kjhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DFcmTo32047720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 15:38:48 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AD3920049;
 Mon, 13 Mar 2023 15:38:48 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C293820040;
 Mon, 13 Mar 2023 15:38:47 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.87.70])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 15:38:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 00/12] target/s390x: Handle unaligned accesses
Date: Mon, 13 Mar 2023 16:38:32 +0100
Message-Id: <20230313153844.9231-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q81foF6BYZeCrRcam-uCUT-lUfkBv5kU
X-Proofpoint-GUID: QtfBuaR5t2uTEICk7uXjNNEehvWXPePH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 mlxlogscore=829 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130121
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

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03821.html
v1 -> v2: Use MO_ALIGN (Richard).
Patches that need review:
- [PATCH 01/12] target/s390x: Handle branching to odd addresses
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


