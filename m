Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02765605E8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:32:23 +0200 (CEST)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ac2-0003La-SK
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6aYz-0001ZK-68; Wed, 29 Jun 2022 12:29:15 -0400
Received: from [200.168.210.66] (port=33061 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6aYx-0008Gs-8n; Wed, 29 Jun 2022 12:29:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 29 Jun 2022 13:29:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A3F6A800502;
 Wed, 29 Jun 2022 13:29:07 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br
Subject: [PATCH v3 00/11] target/ppc: BCDA and mffscdrn implementations
Date: Wed, 29 Jun 2022 13:28:53 -0300
Message-Id: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Jun 2022 16:29:08.0103 (UTC)
 FILETIME=[5B275970:01D88BD5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

v3:
- Rebase on master
- Add r-b

v2:
- Added R-b on patches 1, 8, 10, and 11. Dropped the R-b on some
  of the patches as there were big changes on them.
- Fixed addg6s issues
- Separated do_mffsc in two different, more specialized functions
- Changed mffs* patches order to make it more readable, as suggested
  by Richard
- Added a new patch with a test for the mffsce instruction

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


