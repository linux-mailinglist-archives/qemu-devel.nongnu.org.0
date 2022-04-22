Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218250C029
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:08:04 +0200 (CEST)
Received: from localhost ([::1]:52504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhydP-0007q0-AF
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyQq-0001hy-D7; Fri, 22 Apr 2022 14:55:04 -0400
Received: from [187.72.171.209] (port=52505 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyQo-0000CU-FF; Fri, 22 Apr 2022 14:55:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8309C80031F;
 Fri, 22 Apr 2022 15:54:53 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 00/20] target/ppc: Remove hidden usages of *env
Date: Fri, 22 Apr 2022 15:54:30 -0300
Message-Id: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:53.0811 (UTC)
 FILETIME=[73E97C30:01D8567A]
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
adding macros in the same style of FP_* ones (e.g. FP_FI defined in cpu.h).

Patch 20 (target/ppc: Add unused M_MSR_* macros) implements unused macros, the
same that were removed in patch 02 (target/ppc: Remove unused msr_* macros). I
did that to keep the changes consistent with what was already present before.

[1]: https://lists.gnu.org/archive/html/qemu-ppc/2021-11/msg00280.html

Víctor Colombo (20):
  target/ppc: Remove fpscr_* macros from cpu.h
  target/ppc: Remove unused msr_* macros
  target/ppc: Substitute msr_pr macro with new M_MSR_PR macro
  target/ppc: Substitute msr_le macro with new M_MSR_LE macro
  target/ppc: Substitute msr_ds macro with new M_MSR_DS macro
  target/ppc: Substitute msr_ile macro with new M_MSR_ILE macro
  target/ppc: Substitute msr_ee macro with new M_MSR_EE macro
  target/ppc: Substitute msr_ce macro with new M_MSR_CE macro
  target/ppc: Substitute msr_pow macro with new M_MSR_POW macro
  target/ppc: Substitute msr_me macro with new M_MSR_ME macro
  target/ppc: Substitute msr_gs macro with new M_MSR_GS macro
  target/ppc: Substitute msr_fp macro with new M_MSR_FP macro
  target/ppc: Substitute msr_cm macro with new M_MSR_CM macro
  target/ppc: Substitute msr_ir macro with new M_MSR_IR macro
  target/ppc: Substitute msr_dr macro with new M_MSR_DR macro
  target/ppc: Substitute msr_ep macro with new M_MSR_EP macro
  target/ppc: Substitute msr_fe macro with new M_MSR_FE macro
  target/ppc: Substitute msr_ts macro with new M_MSR_TS macro
  target/ppc: Substitute msr_hv macro with new M_MSR_HV macro
  target/ppc: Add unused M_MSR_* macros

 hw/ppc/pegasos2.c        |   2 +-
 hw/ppc/spapr.c           |   2 +-
 target/ppc/cpu.c         |   2 +-
 target/ppc/cpu.h         | 125 ++++++++++++++++-----------------------
 target/ppc/cpu_init.c    |  21 ++++---
 target/ppc/excp_helper.c |  53 +++++++++--------
 target/ppc/fpu_helper.c  |  28 ++++-----
 target/ppc/gdbstub.c     |   2 +-
 target/ppc/helper_regs.c |  12 ++--
 target/ppc/kvm.c         |   7 ++-
 target/ppc/machine.c     |   2 +-
 target/ppc/mem_helper.c  |  23 +++----
 target/ppc/misc_helper.c |   2 +-
 target/ppc/mmu-radix64.c |  10 ++--
 target/ppc/mmu_common.c  |  38 ++++++------
 target/ppc/mmu_helper.c  |   6 +-
 16 files changed, 161 insertions(+), 174 deletions(-)

-- 
2.25.1


