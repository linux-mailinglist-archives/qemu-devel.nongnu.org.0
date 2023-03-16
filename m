Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730C6BD638
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqie-0004uQ-I3; Thu, 16 Mar 2023 12:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqia-0004tF-R1; Thu, 16 Mar 2023 12:44:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqiX-0007yn-Uk; Thu, 16 Mar 2023 12:44:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GG7hLB032721; Thu, 16 Mar 2023 16:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ngBy8QPkwCWsyxsPijT5BSIaWEHDUVbXihD/acPFrcA=;
 b=XC0/CskzDoYYYCuD2u3kD7d1BNXdqz9cBYefXvsmugTNloEv6P4/zhyFEhv6Smfy01sH
 H07/PpmJ9SWpRLSSySBrWGHqOVHDyPyG95PKvhlGDR4xmb5o0l6THjIHvyYeiMFpVGQ5
 i3vwtnSCoMLWDUg9JRghGD3Bh2W6Zs9WpfuwVM8ycjgSQlre7lctyRraJIyc2fbZgRsR
 fExcWx1M/gdK3s+rmQqmgNQf1VIM/W/FKUq6KsEwwStN3a2bJqDCX5UrRaQGcWYfizE9
 7XBMCxyByslNLq7Ik+PGu57s/4Q1iE/j5J8bvGN8yBqrRblp0XOhmfnBAYN8ueLxElSI 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbsv4ksqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GG83ea003338;
 Thu, 16 Mar 2023 16:44:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbsv4ksq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GEvUm7015005;
 Thu, 16 Mar 2023 16:44:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3h0nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GGiWWn30998886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 16:44:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EB8B20040;
 Thu, 16 Mar 2023 16:44:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3DE320043;
 Thu, 16 Mar 2023 16:44:31 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 16:44:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 00/12] target/s390x: Handle unaligned accesses
Date: Thu, 16 Mar 2023 17:44:16 +0100
Message-Id: <20230316164428.275147-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XOLalH99xnTKoke7DraQTvLPqUb51L97
X-Proofpoint-ORIG-GUID: 7GoR_H78kRcsRMY3Hm_lu7ICneqEuQLe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=841
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160131
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

v3: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04687.html
v3 -> v4: Get rid of the preprocessor magic in the new tests (Thomas).

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

 target/s390x/cpu.h                          |  9 ++++
 target/s390x/tcg/excp_helper.c              |  4 +-
 target/s390x/tcg/insn-data.h.inc            | 46 ++++++++++-----------
 target/s390x/tcg/mem_helper.c               | 12 +++++-
 target/s390x/tcg/translate.c                | 24 +++++++----
 tests/tcg/s390x/Makefile.softmmu-target     | 15 +++++--
 tests/tcg/s390x/Makefile.target             |  8 ++++
 tests/tcg/s390x/br-odd.S                    | 16 +++++++
 tests/tcg/s390x/cgrl-unaligned.S            | 16 +++++++
 tests/tcg/s390x/clrl-unaligned.S            | 16 +++++++
 tests/tcg/s390x/crl-unaligned.S             | 16 +++++++
 tests/tcg/s390x/ex-odd.S                    | 17 ++++++++
 tests/tcg/s390x/lgrl-unaligned.S            | 16 +++++++
 tests/tcg/s390x/llgfrl-unaligned.S          | 16 +++++++
 tests/tcg/s390x/lpswe-unaligned.S           | 18 ++++++++
 tests/tcg/s390x/lrl-unaligned.S             | 16 +++++++
 tests/tcg/s390x/pgm-specification-softmmu.S | 40 ++++++++++++++++++
 tests/tcg/s390x/pgm-specification-user.c    | 37 +++++++++++++++++
 tests/tcg/s390x/pgm-specification.mak       | 15 +++++++
 tests/tcg/s390x/softmmu.ld                  | 20 +++++++++
 tests/tcg/s390x/stgrl-unaligned.S           | 16 +++++++
 tests/tcg/s390x/strl-unaligned.S            | 16 +++++++
 22 files changed, 371 insertions(+), 38 deletions(-)
 create mode 100644 tests/tcg/s390x/br-odd.S
 create mode 100644 tests/tcg/s390x/cgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/clrl-unaligned.S
 create mode 100644 tests/tcg/s390x/crl-unaligned.S
 create mode 100644 tests/tcg/s390x/ex-odd.S
 create mode 100644 tests/tcg/s390x/lgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/llgfrl-unaligned.S
 create mode 100644 tests/tcg/s390x/lpswe-unaligned.S
 create mode 100644 tests/tcg/s390x/lrl-unaligned.S
 create mode 100644 tests/tcg/s390x/pgm-specification-softmmu.S
 create mode 100644 tests/tcg/s390x/pgm-specification-user.c
 create mode 100644 tests/tcg/s390x/pgm-specification.mak
 create mode 100644 tests/tcg/s390x/softmmu.ld
 create mode 100644 tests/tcg/s390x/stgrl-unaligned.S
 create mode 100644 tests/tcg/s390x/strl-unaligned.S

-- 
2.39.2


