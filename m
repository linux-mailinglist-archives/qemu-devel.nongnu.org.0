Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFF46531B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 17:44:01 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msSi6-0002Fh-H6
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 11:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSdh-0008Op-J8; Wed, 01 Dec 2021 11:39:25 -0500
Received: from [201.28.113.2] (port=20732 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSde-0001L4-Rf; Wed, 01 Dec 2021 11:39:24 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 1 Dec 2021 13:39:17 -0300
Received: from eldorado.org.br (unknown [10.10.71.29])
 by power9a (Postfix) with ESMTP id 0A989800CFF;
 Wed,  1 Dec 2021 13:39:17 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 0/3] Fix mtfsf, mtfsfi and mtfsb1 bug
Date: Wed,  1 Dec 2021 13:38:05 -0300
Message-Id: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Dec 2021 16:39:17.0234 (UTC)
 FILETIME=[FB79DD20:01D7E6D1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instructions mtfsf, mtfsfi and mtfsb1, when called, fail to set the FI
bit (bit 46 in the FPSCR) and can set to 1 the reserved bit 52 of the
FPSCR, as reported in https://gitlab.com/qemu-project/qemu/-/issues/266
(although the bug report is only for mtfsf, the bug applies to mtfsfi and
mtfsb1 as well).

These instructions also fail to throw an exception when the exception
and enabling bits are set, this can be tested by adding
'prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);' before the __builtin_mtfsf
call in the test case of the bug report.

These patches aim to fix these issues.

Changes from v3:
- rebased on the master branch of https://gitlab.com/qemu-project/qemu

Changes from v2:
- changed patch order to add the mtfsf test after the FI bit and
  deferred exception fix(patch 1) as these are the errors tested here
- moved code to check FP_VE only once in helper_fpscr_check_status
- tests/tcg/ppc64le/mtfsf.c tests if the signal code is correct
- FPSCR bits 0-28 can't be set anymore as they're reserved bits
- changed (11ull << 11) in FPSCR_MTFS_MASK to PPC_BIT(52) to make it clearer

Changes from v1:
- added a test for mtfsf (patch 3)
- moved "Resolves" to second patch
- removed gen_reset_fpstatus() from mtfsf,mtfsfi and mtfsb1 instructions


Lucas Mateus Castro (alqotel) (3):
  target/ppc: Fixed call to deferred exception
  test/tcg/ppc64le: test mtfsf
  target/ppc: ppc_store_fpscr doesn't update bits 0 to 28 and 52

 target/ppc/cpu.c                   |  2 +-
 target/ppc/cpu.h                   |  4 ++
 target/ppc/fpu_helper.c            | 48 +++++++++++++++++++++++
 target/ppc/helper.h                |  1 +
 target/ppc/translate/fp-impl.c.inc |  9 ++---
 tests/tcg/ppc64/Makefile.target    |  1 +
 tests/tcg/ppc64le/Makefile.target  |  1 +
 tests/tcg/ppc64le/mtfsf.c          | 61 ++++++++++++++++++++++++++++++
 8 files changed, 120 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/ppc64le/mtfsf.c

-- 
2.31.1


