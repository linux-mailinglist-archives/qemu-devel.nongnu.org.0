Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EEA2DBD57
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:12:52 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSrb-0005mR-VO
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpc-0004XL-Mg; Wed, 16 Dec 2020 04:10:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpa-0007A5-Ny; Wed, 16 Dec 2020 04:10:48 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG8XVPJ062914; Wed, 16 Dec 2020 04:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=2f1msu23b57VEk5tALKEDvKrUXn31SDAfOO6PaEKl9w=;
 b=F40KWs4p0FCg5tH0i3WNY0yduY1jB08rbfxT6B7QmovoFm5ThwOxVSOLLv3YRutkP+U5
 +89kjVfcIdzauml0ReTtIogvh1Q7bZueOmxp6lhWFA9+BRIMw8ey9oE3BZfoM5sdVArK
 /oVB9SZUjO80frMEdKmvXmsQXR+f+yWJ1UgJb+VhDPAA0bgp0AsDBua8gIvyvs1fBVep
 lUDBHKQXDdVB7qPzhdBOdC0sIZVkIVWb4s7DEtKdm8+53p64cqWmR6Yzax/NyB9N8p6k
 A+rFlpDgDNI9NgS8m/e0qukwSBq5IWW83SV3ZORj97iSTCSTWAmAIDWg5Df3XD42dXx2 jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fescgx83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:37 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG8YDQm065196;
 Wed, 16 Dec 2020 04:10:36 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fescgx7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:36 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG96rUg026028;
 Wed, 16 Dec 2020 09:10:34 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 35cng9p293-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:10:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9AX9Z25690450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:10:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 226F57805E;
 Wed, 16 Dec 2020 09:10:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BDDD78063;
 Wed, 16 Dec 2020 09:10:27 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:10:26 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] PPC64: Add support for the new prefixed instructions
Date: Wed, 16 Dec 2020 06:07:57 -0300
Message-Id: <20201216090804.58640-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
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
Cc: peter.maydell@linaro.org, gromero@linux.ibm.com,
 gustavo.romero@protonmail.com, mroth@lamentation.net, clg@kaod.org,
 david@gibson.dropbear.id.au, alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims to add support for the new prefixed instructions
introduced with POWER10 CPUs (ISA v3.1).

v2:

- Fixes accordingly to Alex Bennée's review:
  Removed fixes for BUILD_DIR and quiet-command since
  they are already upstream.
  Reverted all the tests to ppc64le-linux-user as they
  are not softmmu tests. To run it:
  
  $ ../configure --target-list=ppc64le-linux-user
  $ make -j $(nproc) check-tcg

- Fixes accordingly to David's review:
  Clarifications for the opcode lookup table and its
  namespaces (normal insn, prefixed type 0/1, and prefixed 2/3).
  Clarification about R macro.
  Fixed missing switch 'break' in parse_prefix_subtype and c1_idx break.
  Fixed duplicated comments.

- Fixed build when target != TARGET_PPC64.


Michael Roth (7):
  target/ppc: Add infrastructure for prefixed instructions
  target/ppc: Add support for prefixed load/store instructions
  tests/tcg: Add tests for prefixed load/store instructions
  target/ppc: Add support for paired vector load/store instructions
  tests/tcg: Add tests for paired vector load/store instructions
  target/ppc: Add support for prefixed load/store FP instructions
  tests/tcg: Add tests for prefixed load/store FP instructions

 target/ppc/cpu.h                              |  30 +-
 target/ppc/helper.h                           |   3 +
 target/ppc/internal.h                         |  27 +
 target/ppc/mem_helper.c                       |  61 ++
 target/ppc/translate.c                        | 442 +++++++-
 target/ppc/translate/fp-impl.c.inc            |  48 +
 target/ppc/translate/fp-ops.c.inc             |   6 +
 target/ppc/translate/vsx-impl.c.inc           |  66 ++
 target/ppc/translate_init.c.inc               |  11 +-
 tests/tcg/ppc64                               |   1 +
 tests/tcg/ppc64le/Makefile.target             |  29 +
 .../test-paired-load-store-vsx.c              | 567 +++++++++++
 .../test-prefixed-load-store-fp.c             | 270 +++++
 .../test-prefixed-load-store.c                | 945 ++++++++++++++++++
 14 files changed, 2499 insertions(+), 7 deletions(-)
 create mode 120000 tests/tcg/ppc64
 create mode 100644 tests/tcg/ppc64le/Makefile.target
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-paired-load-store-vsx.c
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store-fp.c
 create mode 100644 tests/tcg/ppc64le/instruction-tests/test-prefixed-load-store.c

-- 
2.17.1


