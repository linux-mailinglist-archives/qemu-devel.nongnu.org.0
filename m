Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD4455CC5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:33:58 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhY5-0004Wp-6p
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mnhPh-00010Q-2a; Thu, 18 Nov 2021 08:25:17 -0500
Received: from [201.28.113.2] (port=22122 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mnhPb-0000gy-Ol; Thu, 18 Nov 2021 08:25:16 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 18 Nov 2021 10:25:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.29])
 by power9a (Postfix) with ESMTP id 4A413800B36;
 Thu, 18 Nov 2021 10:25:07 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/3] Fix mtfsf, mtfsfi and mtfsb1 bug
Date: Thu, 18 Nov 2021 10:24:59 -0300
Message-Id: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Nov 2021 13:25:07.0423 (UTC)
 FILETIME=[B44706F0:01D7DC7F]
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

Changes from v1:
- added a test for mtfsf (patch 3)
- moved "Resolves" to second patch
- removed gen_reset_fpstatus() from mtfsf,mtfsfi and mtfsb1 instructions

Lucas Mateus Castro (alqotel) (3):
  target/ppc: Fixed call to deferred exception
  target/ppc: ppc_store_fpscr doesn't update bit 52
  test/tcg/ppc64le: test mtfsf

 target/ppc/cpu.c                   |  2 +-
 target/ppc/cpu.h                   |  3 ++
 target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++
 target/ppc/helper.h                |  1 +
 target/ppc/translate/fp-impl.c.inc |  9 ++---
 tests/tcg/ppc64/Makefile.target    |  1 +
 tests/tcg/ppc64le/Makefile.target  |  1 +
 tests/tcg/ppc64le/mtfsf.c          | 56 ++++++++++++++++++++++++++++++
 8 files changed, 107 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/ppc64le/mtfsf.c

-- 
2.31.1


