Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42781370167
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:42:10 +0200 (CEST)
Received: from localhost ([::1]:46768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZ1d-0007vM-57
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYva-00057D-OI; Fri, 30 Apr 2021 15:35:54 -0400
Received: from [201.28.113.2] (port=57595 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYvY-0001AO-QL; Fri, 30 Apr 2021 15:35:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 16:35:49 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id F2AD88013C2;
 Fri, 30 Apr 2021 16:35:48 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] target/ppc: untangle CPU init from translation
Date: Fri, 30 Apr 2021 16:35:26 -0300
Message-Id: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 30 Apr 2021 19:35:49.0126 (UTC)
 FILETIME=[05EC1260:01D73DF8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210429162130.2412-2-bruno.larsen@eldorado.org.br
([PATCH v2 1/7] target/ppc: move opcode table logic to translate.c)
which is based on: 20210426184706.48040-1-bruno.larsen@eldorado.org.br
([PATCH v4] target/ppc: code motion from translate_init.c.inc to gdbstub.c)

This patch series aims to remove the logic of initializing CPU from
the file related to TCG translation. To achieve this, we have to make
it so registering SPRs isn't directly tied to TCG, and move code only
related to translation out of translate_init.c.inc and into translate.c.
This is in preparation to compile this target without TCG.

Changes for v3:
 * fixed the parameters of _spr_register
 * remove some redundant #include statements
 * removed some functions that were mentioned in v2 as unnecessary
 * added copyright header to relevant files
 * removed first patch, that was already applied
 * removed a changed that would add a regression

Changes for v2:
 * split and reordered patches, to make it easier to review
 * improved commit messages 
 * Undid creation of spr_common, as it was unnecessary
 * kept more functions as static
 * ensured that the project builds after every commit

Bruno Larsen (billionai) (7):
  target/ppc: Created !TCG SPR registration macro
  target/ppc: Isolated SPR read/write callbacks
  target/ppc: remove unnecessary SPR functions
  target/ppc: turned SPR R/W callbacks not static
  target/ppc: removed VSCR from SPR registration
  target/ppc: renamed SPR registration functions
  target/ppc: isolated cpu init from translation logic

 .../ppc/{translate_init.c.inc => cpu_init.c}  | 1892 ++++-------------
 target/ppc/internal.h                         |    3 +
 target/ppc/meson.build                        |    1 +
 target/ppc/spr_tcg.c.inc                      | 1041 +++++++++
 target/ppc/spr_tcg.h                          |  134 ++
 target/ppc/translate.c                        |   50 +-
 6 files changed, 1651 insertions(+), 1470 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (89%)
 create mode 100644 target/ppc/spr_tcg.c.inc
 create mode 100644 target/ppc/spr_tcg.h

-- 
2.17.1


