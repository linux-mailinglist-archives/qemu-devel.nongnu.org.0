Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D843AE970
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:55:24 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJSV-0000YQ-W3
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJOz-0005v9-ET; Mon, 21 Jun 2021 08:51:45 -0400
Received: from [201.28.113.2] (port=53676 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJOx-0004ci-FP; Mon, 21 Jun 2021 08:51:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id E6CBF800055;
 Mon, 21 Jun 2021 09:51:38 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] Clean up MMU translation
Date: Mon, 21 Jun 2021 09:51:05 -0300
Message-Id: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 21 Jun 2021 12:51:39.0101 (UTC)
 FILETIME=[2D42E8D0:01D7669C]
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
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the second half of rth's patch cleaning up MMU address
translation, which is not complete but is a good start! This patch
series is also required to finally support disable-tcg.

The final patch fixes the bug mentioned by rth and farosas, that cedric
did not confirm actually happens, but agreed is a good cleanup either
way.

Changes for v2:
* rebased on ppc-for-6.1
* added the bugfix

Bruno Larsen (billionai) (1):
  target/ppc: fix address translation bug for radix mmus

Richard Henderson (9):
  target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
  target/ppc: Use MMUAccessType with *_handle_mmu_fault
  target/ppc: Push real-mode handling into ppc_radix64_xlate
  target/ppc: Use bool success for ppc_radix64_xlate
  target/ppc: Split out ppc_hash64_xlate
  target/ppc: Split out ppc_hash32_xlate
  target/ppc: Split out ppc_jumbo_xlate
  target/ppc: Introduce ppc_xlate
  target/ppc: Restrict ppc_cpu_tlb_fill to TCG

 target/ppc/cpu-qom.h       |   1 -
 target/ppc/cpu_init.c      |  45 --------
 target/ppc/internal.h      |  13 +++
 target/ppc/mmu-book3s-v3.c |  19 ----
 target/ppc/mmu-book3s-v3.h |   5 -
 target/ppc/mmu-hash32.c    | 217 ++++++++++++++++---------------------
 target/ppc/mmu-hash32.h    |   6 +-
 target/ppc/mmu-hash64.c    | 118 +++++++-------------
 target/ppc/mmu-hash64.h    |   6 +-
 target/ppc/mmu-radix64.c   | 152 ++++++++++----------------
 target/ppc/mmu-radix64.h   |   6 +-
 target/ppc/mmu_helper.c    | 201 +++++++++++++++++-----------------
 12 files changed, 313 insertions(+), 476 deletions(-)

-- 
2.17.1


