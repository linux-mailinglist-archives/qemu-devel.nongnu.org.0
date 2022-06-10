Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3630546C51
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:27:09 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjLg-0000cp-Ba
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjIW-0007iG-D6; Fri, 10 Jun 2022 14:23:52 -0400
Received: from [187.72.171.209] (port=8736 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjIU-0003ZW-Cd; Fri, 10 Jun 2022 14:23:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 24E43800058;
 Fri, 10 Jun 2022 15:23:41 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND v2 00/11] target/ppc: BCDA and mffscdrn implementations
Date: Fri, 10 Jun 2022 15:22:59 -0300
Message-Id: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:41.0430 (UTC)
 FILETIME=[36209160:01D87CF7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hello everyone,

Set of patches containing implementations for some instructions that
were missing before. Also, moves some related instructions to
decodetree. Add mffsce test.

Rebase and resend. Patch 8 was conflicting with master.

v2:
- Added R-b on patches 1, 8, 10, and 11. Dropped the R-b on some
  of the patches as there were big changes on them.
- Fixed addg6s issues
- Separated do_mffsc in two different, more specialized functions
- Changed mffs* patches order to make it more readable, as suggested
  by Richard
- Added a new patch with a test for the mffsce instruction

Patches still requiring review: 02-07 and 09

Matheus Ferst (4):
  target/ppc: Add flag for ISA v2.06 BCDA instructions
  target/ppc: implement addg6s
  target/ppc: implement cbcdtd
  target/ppc: implement cdtbcd

Víctor Colombo (7):
  target/ppc: Fix insn32.decode style issues
  target/ppc: Move mffscrn[i] to decodetree
  target/ppc: Move mffsce to decodetree
  target/ppc: Move mffsl to decodetree
  target/ppc: Move mffs[.] to decodetree
  target/ppc: Implement mffscdrn[i] instructions
  tests/tcg/ppc64: Add mffsce test

 target/ppc/cpu.h                           |   5 +-
 target/ppc/cpu_init.c                      |  10 +-
 target/ppc/dfp_helper.c                    |  65 +++++++
 target/ppc/helper.h                        |   2 +
 target/ppc/insn32.decode                   |  55 ++++--
 target/ppc/internal.h                      |   3 -
 target/ppc/translate/fixedpoint-impl.c.inc |  51 ++++++
 target/ppc/translate/fp-impl.c.inc         | 203 ++++++++++++---------
 target/ppc/translate/fp-ops.c.inc          |   9 -
 tests/tcg/ppc64/Makefile.target            |   1 +
 tests/tcg/ppc64le/Makefile.target          |   1 +
 tests/tcg/ppc64le/mffsce.c                 |  37 ++++
 12 files changed, 322 insertions(+), 120 deletions(-)
 create mode 100644 tests/tcg/ppc64le/mffsce.c

-- 
2.25.1


