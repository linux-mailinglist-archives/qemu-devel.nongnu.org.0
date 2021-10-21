Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF824359DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:25:10 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPde-0000sS-0f
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZN-0005TB-Hq; Thu, 21 Oct 2021 00:20:46 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZL-0006tH-11; Thu, 21 Oct 2021 00:20:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p2VTjz4xbZ; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=Aw7DYbX2XJGRT2ApB84PfKFLo/7EoGYxsyss2PvLmgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=mhVx0ALbxN2OufxbfQ0YYyEvFwB2wW3gBHoVvt9CwPwn7d35WsJ7p7cXF6X1gLI0t
 EckIirLt7//Sly+Ba23DsJZTKTnQZqcGLmDP+fgyjtB6cIxFx7fbyajV+pA7TWst8r
 65SfPiI+NBjwnjLn0wbV2MofhP3wsNI7JaKuBIx4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/25] ppc-for-6.2 queue 20211021
Date: Thu, 21 Oct 2021 15:20:02 +1100
Message-Id: <20211021042027.345405-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20211021

for you to fetch changes up to 6f9e8515c106650fbba7222c8f66234c8546c025:

  hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent Linux kernels (2021-10-21 11:42:47 +1100)

----------------------------------------------------------------
ppc patch queue 2021-10-21

Here's the next batch of ppc target related patches for qemu-6.2.
Highlights are:
 * Some fixes and minimal tests for old embedded ppc platforms
 * The beginnings of PMU emulation in TCG from Daniel Barboza
 * Some improvements to the pegasos2 platform
 * A number of TCG bugfixes from the folks at the El Dorado Institute
 * A few other assorted bugfixes and cleanups

----------------------------------------------------------------
BALATON Zoltan (6):
      ppc/pegasos2: Restrict memory to 2 gigabytes
      ppc/pegasos2: Warn when using VOF but no kernel is specified
      ppc/pegasos2: Implement get-time-of-day RTAS function with VOF
      ppc/pegasos2: Access MV64361 registers via their memory region
      ppc/pegasos2: Add constants for PCI config addresses
      ppc/pegasos2: Implement power-off RTAS function with VOF

Cédric Le Goater (3):
      spapr/xive: Add source status helpers
      target/ppc: Fix the test raising the decrementer exception
      spapr/xive: Use xive_esb_rw() to trigger interrupts

Daniel Henrique Barboza (3):
      target/ppc: add MMCR0 PMCC bits to hflags
      target/ppc: add user read/write functions for MMCR2
      target/ppc: adding user read/write functions for PMCs

Gustavo Romero (1):
      target/ppc: add user read/write functions for MMCR0

Matheus Ferst (5):
      linux-user/ppc: Fix XER access in save/restore_user_regs
      target/ppc: Fix XER access in gdbstub
      linux-user: Fix XER access in ppc version of elf_core_copy_regs
      target/ppc: Fix XER access in monitor
      target/ppc: Filter mtmsr[d] input before setting MSR

Philippe Mathieu-Daudé (3):
      target/ppc: Use tcg_constant_i32() in gen_setb()
      target/ppc: Use tcg_constant_i64() in gen_brh()
      hw/ppc/spapr_softmmu: Reduce include list

Thomas Huth (4):
      hw/ppc: Fix iothread locking in the 405 code
      tests/acceptance: Add tests for the ppc405 boards
      tests/acceptance: Add a test for the bamboo ppc board
      hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent Linux kernels

 MAINTAINERS                                 |   1 +
 hw/intc/spapr_xive.c                        |   2 +-
 hw/intc/spapr_xive_kvm.c                    |  14 +-
 hw/intc/xive.c                              |   8 +-
 hw/pci-host/mv64361.c                       |   1 +
 hw/ppc/pegasos2.c                           | 162 ++++++++++-------
 hw/ppc/ppc.c                                |   6 +-
 hw/ppc/ppc4xx_pci.c                         |   8 +-
 hw/ppc/spapr_softmmu.c                      |  15 --
 include/hw/ppc/xive.h                       |  24 +++
 linux-user/elfload.c                        |   2 +-
 linux-user/ppc/signal.c                     |   9 +-
 target/ppc/cpu.c                            |   2 +-
 target/ppc/cpu.h                            |  25 ++-
 target/ppc/cpu_init.c                       |  16 +-
 target/ppc/gdbstub.c                        |   8 +-
 target/ppc/helper_regs.c                    |   6 +
 target/ppc/monitor.c                        |   9 +-
 target/ppc/power8-pmu-regs.c.inc            | 262 ++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h                        |   8 +
 target/ppc/translate.c                      |  95 +++++-----
 tests/acceptance/ppc_405.py                 |  42 +++++
 tests/acceptance/ppc_bamboo.py              |  39 +++++
 tests/tcg/ppc64/Makefile.target             |   2 +
 tests/tcg/ppc64le/Makefile.target           |   2 +
 tests/tcg/ppc64le/signal_save_restore_xer.c |  42 +++++
 26 files changed, 651 insertions(+), 159 deletions(-)
 create mode 100644 target/ppc/power8-pmu-regs.c.inc
 create mode 100644 tests/acceptance/ppc_405.py
 create mode 100644 tests/acceptance/ppc_bamboo.py
 create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

