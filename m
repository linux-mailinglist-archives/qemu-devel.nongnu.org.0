Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F82387C56
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:21:08 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1Wt-0003TK-Er
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1I1-00037W-Bt; Tue, 18 May 2021 11:05:45 -0400
Received: from [201.28.113.2] (port=5990 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1Hr-0007Ay-FQ; Tue, 18 May 2021 11:05:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 12:05:29 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id A97A0801362;
 Tue, 18 May 2021 12:05:29 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] target/ppc: Misc motion to support disabling TCG
Date: Tue, 18 May 2021 12:05:08 -0300
Message-Id: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 18 May 2021 15:05:29.0898 (UTC)
 FILETIME=[3DF1C8A0:01D74BF7]
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

This patch series does a lot of the missing misc work to get the
disable-tcg flag working for the ppc architecture. most of the work is
code motion, with the notable exception of overhauling the logic of
dealing with fpscr.

The mmu logic overhaul has been removed from this patch series as it is
pretty complex, and this way we can test the patches a bit better. 

One caveat is that while testing the commits for regressions, one test
of the check-acceptance has failed on patch 2, but my automated script
didn't give me any info and I couldn't reproduce it manually. Given how
small that change is, I don't think that patch is the culprit, but
rather there is a non deterministic edge case that may cause a problem
in one of the acceptance tests.

based on dgibson's ppc-for-6.1 tree

Changelog for v2:
 * split the patch series
 * added a fix for 5d145639e, which no longer compiles with linux-user
 * removed patches ther were already accepted
 * applied rth's cleanup to ppc_store_sdr1
 * changed destination of ppc_store_msr
 * undone change to helper-proto, now fewer files include it

Bruno Larsen (billionai) (7):
  target/ppc: fix ppc_store_sdr1 for user-only compilation
  target/ppc: moved ppc_store_lpcr and ppc_store_msr to cpu.c
  target/ppc: reduce usage of fpscr_set_rounding_mode
  target/ppc: overhaul and moved logic of storing fpscr
  target/ppc: removed unnecessary inclusion of helper-proto.h
  target/ppc: moved ppc_cpu_do_interrupt to cpu.c
  target/ppc: wrapped some TCG only logic with ifdefs

 target/ppc/cpu.c         |  90 +++++++++++++-
 target/ppc/cpu.h         |  13 ++-
 target/ppc/cpu_init.c    |  17 +--
 target/ppc/excp_helper.c | 101 ++++++++--------
 target/ppc/fpu_helper.c  | 246 +++------------------------------------
 target/ppc/gdbstub.c     |   7 +-
 target/ppc/misc_helper.c |  16 ---
 target/ppc/mmu-hash32.c  |   1 -
 target/ppc/mmu-hash64.c  |   8 ++
 target/ppc/mmu-radix64.c |   1 -
 10 files changed, 181 insertions(+), 319 deletions(-)

-- 
2.17.1


