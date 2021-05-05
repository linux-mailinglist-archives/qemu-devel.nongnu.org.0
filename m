Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F25373F1E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:01:54 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJyD-00089A-Dp
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1leJq0-0000jk-48; Wed, 05 May 2021 11:53:24 -0400
Received: from [201.28.113.2] (port=24774 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1leJpy-0002fr-4o; Wed, 05 May 2021 11:53:23 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 5 May 2021 12:53:17 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 48D018013C2;
 Wed,  5 May 2021 12:53:17 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] target/ppc: Untangle CPU init from translation
Date: Wed,  5 May 2021 12:53:06 -0300
Message-Id: <20210505155310.62710-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 05 May 2021 15:53:17.0437 (UTC)
 FILETIME=[C3C2C2D0:01D741C6]
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

Based-on: ppc-for-6.1 tree

This patch series aims to remove the logic of initializing CPU from
the file related to TCG translation. To achieve this, we have to make
it so registering SPRs isn't directly tied to TCG, and move code only
related to translation out of translate_init.c.inc and into translate.c.
This is in preparation to compile this target without TCG.

Changes for v5:
 * removed first patch, as it has already been applied
 * rebased on dgibson's tree

Changes for v4:
 * reordered patches, to make partially applying simpler
 * removed patches that were already applied
 * undone creation of spt_tcg.c.inc, now waiting for further cleanup
 * moved SPR_NOACCESS motion to last patch, and to spr_tcg.h

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

Bruno Larsen (billionai) (4):
  target/ppc: renamed SPR registration functions
  target/ppc: move SPR R/W callbacks to translate.c
  target/ppc: turned SPR R/W callbacks not static
  target/ppc: isolated cpu init from translation logic

 .../ppc/{translate_init.c.inc => cpu_init.c}  | 1877 ++++-------------
 target/ppc/meson.build                        |    1 +
 target/ppc/spr_tcg.h                          |  136 ++
 target/ppc/translate.c                        | 1035 ++++++++-
 4 files changed, 1598 insertions(+), 1451 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (89%)
 create mode 100644 target/ppc/spr_tcg.h

-- 
2.17.1


