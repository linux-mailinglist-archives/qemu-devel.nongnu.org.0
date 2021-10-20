Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCAB434CF2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:00:14 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC8b-0004ZW-2o
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mdBti-0001DQ-Gm; Wed, 20 Oct 2021 09:44:50 -0400
Received: from [201.28.113.2] (port=17190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mdBtg-0004Hp-RO; Wed, 20 Oct 2021 09:44:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 20 Oct 2021 09:57:30 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id CD0F080045D;
 Wed, 20 Oct 2021 09:57:29 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/2] Fix mtfsf, mtfsfi and mtfsb1 bug
Date: Wed, 20 Oct 2021 09:57:22 -0300
Message-Id: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 20 Oct 2021 12:57:30.0100 (UTC)
 FILETIME=[0A74DB40:01D7C5B2]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

The instructions mtfsf, mtfsfi and mtfsb, when called, fail to set the FI
bit (bit 46 in the FPSCR) and can set to 1 the reserved bit 52 of the
FPSCR, as reported in https://gitlab.com/qemu-project/qemu/-/issues/266
(although the bug report is only for mtfsf, the bug applies to mtfsfi and
mtfsb1 as well).

These instructions also fail to throw an exception when the exception
and enabling bits are set, this can be tested by adding
'prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);' before the __builtin_mtfsf
call in the test case of the bug report.
 
These patches aim to fix these issues.

Lucas Mateus Castro (alqotel) (2):
  target/ppc: Fixed call to deferred exception
  target/ppc: ppc_store_fpscr doesn't update bit 52

 target/ppc/cpu.c                   |  2 +-
 target/ppc/cpu.h                   |  3 +++
 target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
 target/ppc/helper.h                |  1 +
 target/ppc/translate/fp-impl.c.inc |  6 ++---
 5 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.31.1


