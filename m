Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9754451B02A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:12:25 +0200 (CEST)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMIK-0004Xy-Mf
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMDx-00019M-Hu; Wed, 04 May 2022 17:07:53 -0400
Received: from [187.72.171.209] (port=62190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMDv-0007Ne-Ja; Wed, 04 May 2022 17:07:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B2D04800066;
 Wed,  4 May 2022 18:07:45 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 00/22] target/ppc: Remove hidden usages of *env
Date: Wed,  4 May 2022 18:05:19 -0300
Message-Id: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:46.0146 (UTC)
 FILETIME=[00C04420:01D85FFB]
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

By running the grep command `git grep -nr 'define \(fpscr\|msr\)_[a-z0-9]\+\>'`
we can find multiple macros that use `env->fpscr` and `env->msr` but doesn't
take *env as a parameter.

Richard Henderson said [1] that these macros hiding the usage of *env "are evil".
This patch series remove them and substitute with an explicit usage of *env by
using registerfields API.

Patch 20 (target/ppc: Add unused msr bits FIELDs) declares unused FIELDs, the
same that were removed in patch 02 (target/ppc: Remove unused msr_* macros). I
did that to keep the changes consistent with what was already present before.

Patch 21 (target/ppc: Change MSR_* to follow POWER ISA numbering convention)
changes the MSR_* bit number to match POWER ISA by adding a new macro to
'invert' the ordering. (added in v2)

[1]: https://lists.gnu.org/archive/html/qemu-ppc/2021-11/msg00280.html

Sending a v4 because another patch queued in ppc-next added an usage of
msr_de

v2:
- Abandon the ideia to add an M_MSR_* macro
- Instead, use registerfields API as suggested by Richard
- Add patch 21 to invert MSR_* values to match ISA ordering

v3:
- Add macro to extract both FE0 and FE1. Use it to simplify the
  conditionals in patch 17
- Fix the checks that should be a xor
- Fix incorrect parameter in FIELD_EX64 (was env->msr should be value)
  in patch 16
- Fix patch 13 title

v4:
- Rebase on top of target/ppc: Fix BookE debug interrupt generation
- Add patch target/ppc: Remove msr_de macro. msr_de was not being used
  anywhere before, but an usage was added in the patch
  target/ppc: Fix BookE debug interrupt generation
- Necessary changes in other patches:
  dont remove msr_de in patch 2
  context change in other patches


Víctor Colombo (22):
  target/ppc: Remove fpscr_* macros from cpu.h
  target/ppc: Remove unused msr_* macros
  target/ppc: Remove msr_pr macro
  target/ppc: Remove msr_le macro
  target/ppc: Remove msr_ds macro
  target/ppc: Remove msr_ile macro
  target/ppc: Remove msr_ee macro
  target/ppc: Remove msr_ce macro
  target/ppc: Remove msr_pow macro
  target/ppc: Remove msr_me macro
  target/ppc: Remove msr_gs macro
  target/ppc: Remove msr_fp macro
  target/ppc: Remove msr_cm macro
  target/ppc: Remove msr_ir macro
  target/ppc: Remove msr_dr macro
  target/ppc: Remove msr_ep macro
  target/ppc: Remove msr_fe0 and msr_fe1 macros
  target/ppc: Remove msr_ts macro
  target/ppc: Remove msr_hv macro
  target/ppc: Remove msr_de macro
  target/ppc: Add unused msr bits FIELDs
  target/ppc: Change MSR_* to follow POWER ISA numbering convention

 hw/ppc/pegasos2.c        |   2 +-
 hw/ppc/spapr.c           |   2 +-
 target/ppc/cpu.c         |   2 +-
 target/ppc/cpu.h         | 220 ++++++++++++++++++---------------------
 target/ppc/cpu_init.c    |  23 ++--
 target/ppc/excp_helper.c |  54 +++++-----
 target/ppc/fpu_helper.c  |  28 ++---
 target/ppc/gdbstub.c     |   2 +-
 target/ppc/helper_regs.c |  15 ++-
 target/ppc/kvm.c         |   7 +-
 target/ppc/machine.c     |   2 +-
 target/ppc/mem_helper.c  |  23 ++--
 target/ppc/misc_helper.c |   2 +-
 target/ppc/mmu-radix64.c |  11 +-
 target/ppc/mmu_common.c  |  40 +++----
 target/ppc/mmu_helper.c  |   6 +-
 16 files changed, 220 insertions(+), 219 deletions(-)

-- 
2.25.1


