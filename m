Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3236EE19
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:28:09 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9WJ-00064K-Vm
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9Q9-0003iI-5x; Thu, 29 Apr 2021 12:21:45 -0400
Received: from [201.28.113.2] (port=29626 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9Q7-0003ag-Mx; Thu, 29 Apr 2021 12:21:44 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:38 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 936C280134B;
 Thu, 29 Apr 2021 13:21:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] target/ppc: untangle cpu init from translation
Date: Thu, 29 Apr 2021 13:21:23 -0300
Message-Id: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 29 Apr 2021 16:21:38.0759 (UTC)
 FILETIME=[BB596570:01D73D13]
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to remove the logic of initializing CPU from
the file related to TCG translation. To achieve this, we have to make
it so registering SPRs isn't directly tied to TCG, and move code only
related to translation out of translate_init.c.inc and into translate.c.
This is in preparation to compile this target without TCG.

This series requires the patch proposed in
<20210426184706.48040-1-bruno.larsen@eldorado.org.br>

Changes for v2:
 * split and reordered patches, to make it easier to review
 * improved commit messages 
 * Undid creation of spr_common, as it was unnecessary
 * kept more functions as static
 * ensured that the project builds after every commit

Bruno Larsen (billionai) (7):
  target/ppc: move opcode table logic to translate.c
  target/ppc: Created !TCG SPR registration macro
  target/ppc: Isolated SPR read/write callbacks
  target/ppc: turned SPR R/W callbacks not static
  target/ppc: removed VSCR from SPR registration
  target/ttc: renamed SPR registration functions
  target/ppc: isolated cpu init from translation logic

 .../ppc/{translate_init.c.inc => cpu_init.c}  | 2298 ++++-------------
 target/ppc/internal.h                         |   11 +
 target/ppc/meson.build                        |    1 +
 target/ppc/spr_tcg.c.inc                      | 1034 ++++++++
 target/ppc/spr_tcg.h                          |  121 +
 target/ppc/translate.c                        |  447 +++-
 6 files changed, 2046 insertions(+), 1866 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (86%)
 create mode 100644 target/ppc/spr_tcg.c.inc
 create mode 100644 target/ppc/spr_tcg.h

-- 
2.17.1


