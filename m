Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA930388E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:57:34 +0200 (CEST)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLlV-0000ln-Qx
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgR-00009m-6H; Wed, 19 May 2021 08:52:19 -0400
Received: from ozlabs.org ([203.11.71.1]:52905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgN-0000u4-Nz; Wed, 19 May 2021 08:52:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnW0vMCz9sWl; Wed, 19 May 2021 22:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428719;
 bh=nJF+r7ZGgZsykebQt2M0d/n63ep5pxY2QLtd/sr8pVM=;
 h=From:To:Cc:Subject:Date:From;
 b=jeVyanePaESDdvgBfPQSweg6gCBmrjvUuZJVQ4Ix5fvlr1veFAWyiMJKfBmfz1JmE
 Aa6BxRlJz8mPdzLN/aOfsF4DWRlLBlH5YtJYPHGRlSuUjFjouritJm8PIhYmc2d+hz
 YXMMc6TiUwUTU3Q1pb4xlIg5yRiitJ+eImCVqZAw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/48] ppc-for-6.1 queue 20210519
Date: Wed, 19 May 2021 22:51:00 +1000
Message-Id: <20210519125148.27720-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c313e52e6459de2e9064767083a0c949c476e32b:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-05-18 16:17:22 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210519

for you to fetch changes up to e543f946856da31c3a7a45ba193f106e042ad907:

  target/ppc: Remove type argument for mmubooke206_get_physical_address (2021-05-19 12:52:07 +1000)

----------------------------------------------------------------
ppc patch queue 2021-05-19

Next set of ppc related patches for qemu-6.1.  Highlights are:
 * Start of a significant softmmu cleanup from Richard Henderson
 * Further work towards allowing builds without CONFIG_TCG

----------------------------------------------------------------
Bruno Larsen (billionai) (9):
      target/ppc: Fold gen_*_xer into their callers
      target/ppc: renamed SPR registration functions
      target/ppc: move SPR R/W callbacks to translate.c
      target/ppc: turned SPR R/W callbacks not static
      target/ppc: isolated cpu init from translation logic
      target/ppc: created ppc_{store,get}_vscr for generic vscr usage
      target/ppc: updated vscr manipulation in machine.c
      target/ppc: moved ppc_store_sdr1 to cpu.c
      target/ppc: moved ppc_cpu_dump_state to cpu_init.c

Fabiano Rosas (2):
      hw/ppc/spapr.c: Extract MMU mode error reporting into a function
      hw/ppc/spapr.c: Make sure the host supports the selected MMU mode

Giuseppe Musacchio (1):
      target/ppc: Fix load endianness for lxvwsx/lxvdsx

Lucas Mateus Castro (alqotel) (4):
      hw/ppc: moved hcalls that depend on softmmu
      target/ppc: moved function out of mmu-hash64
      target/ppc: moved ppc_store_lpcr to misc_helper.c
      hw/ppc: moved has_spr to cpu.h

Richard Henderson (32):
      target/ppc: Add cia field to DisasContext
      target/ppc: Split out decode_legacy
      target/ppc: Move DISAS_NORETURN setting into gen_exception*
      target/ppc: Remove special case for POWERPC_SYSCALL
      target/ppc: Remove special case for POWERPC_EXCP_TRAP
      target/ppc: Simplify gen_debug_exception
      target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
      target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
      target/ppc: Remove unnecessary gen_io_end calls
      target/ppc: Introduce gen_icount_io_start
      target/ppc: Replace POWERPC_EXCP_STOP with DISAS_EXIT_UPDATE
      target/ppc: Replace POWERPC_EXCP_BRANCH with DISAS_NORETURN
      target/ppc: Remove DisasContext.exception
      target/ppc: Move single-step check to ppc_tr_tb_stop
      target/ppc: Tidy exception vs exit_tb
      target/ppc: Mark helper_raise_exception* as noreturn
      target/ppc: Use translator_loop_temp_check
      target/ppc: Introduce prot_for_access_type
      target/ppc: Use MMUAccessType in mmu-radix64.c
      target/ppc: Use MMUAccessType in mmu-hash64.c
      target/ppc: Use MMUAccessType in mmu-hash32.c
      target/ppc: Rename access_type to type in mmu_helper.c
      target/ppc: Use MMUAccessType in mmu_helper.c
      target/ppc: Remove type argument from check_prot
      target/ppc: Remove type argument from ppc6xx_tlb_pte_check
      target/ppc: Remove type argument from ppc6xx_tlb_check
      target/ppc: Remove type argument from get_bat_6xx_tlb
      target/ppc: Remove type argument from mmu40x_get_physical_address
      target/ppc: Remove type argument from mmubooke_check_tlb
      target/ppc: Remove type argument from mmubooke_get_physical_address
      target/ppc: Remove type argument from mmubooke206_check_tlb
      target/ppc: Remove type argument for mmubooke206_get_physical_address

 hw/ppc/meson.build                              |    3 +
 hw/ppc/pnv.c                                    |    2 +-
 hw/ppc/spapr.c                                  |   21 +-
 hw/ppc/spapr_caps.c                             |   59 +
 hw/ppc/spapr_hcall.c                            |  634 +------
 hw/ppc/spapr_softmmu.c                          |  627 +++++++
 include/hw/ppc/spapr.h                          |    7 +
 linux-user/ppc/cpu_loop.c                       |    6 -
 target/ppc/arch_dump.c                          |    3 +-
 target/ppc/cpu.c                                |   47 +
 target/ppc/cpu.h                                |   13 +-
 target/ppc/{translate_init.c.inc => cpu_init.c} | 2034 +++++++----------------
 target/ppc/gdbstub.c                            |    4 +-
 target/ppc/helper.h                             |    4 +-
 target/ppc/int_helper.c                         |    9 +-
 target/ppc/internal.h                           |   19 +
 target/ppc/machine.c                            |    7 +-
 target/ppc/meson.build                          |    1 +
 target/ppc/misc_helper.c                        |   10 +
 target/ppc/mmu-hash32.c                         |   59 +-
 target/ppc/mmu-hash64.c                         |  136 +-
 target/ppc/mmu-hash64.h                         |    4 -
 target/ppc/mmu-radix64.c                        |  123 +-
 target/ppc/mmu_helper.c                         |  325 ++--
 target/ppc/spr_tcg.h                            |  136 ++
 target/ppc/translate.c                          | 1559 ++++++++++++-----
 target/ppc/translate/vsx-impl.c.inc             |    4 +-
 27 files changed, 3020 insertions(+), 2836 deletions(-)
 create mode 100644 hw/ppc/spapr_softmmu.c
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (89%)
 create mode 100644 target/ppc/spr_tcg.h

