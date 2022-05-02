Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA915171CF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 16:43:36 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXGx-0006ay-2F
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 10:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXDe-0003Ka-Pb; Mon, 02 May 2022 10:40:11 -0400
Received: from [187.72.171.209] (port=32289 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXDc-0002wc-Sx; Mon, 02 May 2022 10:40:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 2 May 2022 11:39:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id ED57B8001CD;
 Mon,  2 May 2022 11:39:56 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 00/21] target/ppc: Remove hidden usages of *env
Date: Mon,  2 May 2022 11:39:13 -0300
Message-Id: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 May 2022 14:39:57.0453 (UTC)
 FILETIME=[7EB3FBD0:01D85E32]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
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

Patches requiring review: Patch 3 and after

Hello everyone, thanks for your kind reviews in v1,
What do you think of this new approach I did for v2?

v2:
- Abandon the ideia to add an M_MSR_* macro
- Instead, use registerfields API as suggested by Richard
- Add patch 21 to invert MSR_* values to match ISA ordering

Víctor Colombo (21):
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
  target/ppc: Remove msr_me macro
  target/ppc: Remove msr_ir macro
  target/ppc: Remove msr_dr macro
  target/ppc: Remove msr_ep macro
  target/ppc: Remove msr_fe0 and msr_fe1 macros
  target/ppc: Remove msr_ts macro
  target/ppc: Remove msr_hv macro
  target/ppc: Add unused msr bits FIELDs
  target/ppc: Change MSR_* to follow POWER ISA numbering convention

 hw/ppc/pegasos2.c        |   2 +-
 hw/ppc/spapr.c           |   2 +-
 target/ppc/cpu.c         |   2 +-
 target/ppc/cpu.h         | 214 ++++++++++++++++++---------------------
 target/ppc/cpu_init.c    |  23 +++--
 target/ppc/excp_helper.c |  66 +++++++-----
 target/ppc/fpu_helper.c  |  28 ++---
 target/ppc/gdbstub.c     |   2 +-
 target/ppc/helper_regs.c |  12 +--
 target/ppc/kvm.c         |   7 +-
 target/ppc/machine.c     |   2 +-
 target/ppc/mem_helper.c  |  23 +++--
 target/ppc/misc_helper.c |   2 +-
 target/ppc/mmu-radix64.c |  11 +-
 target/ppc/mmu_common.c  |  40 ++++----
 target/ppc/mmu_helper.c  |   6 +-
 16 files changed, 225 insertions(+), 217 deletions(-)

-- 
2.25.1


