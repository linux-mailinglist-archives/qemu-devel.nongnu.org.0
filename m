Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB193F9503
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:21:30 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWB2-0007Ku-5I
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW00-0000rx-06; Fri, 27 Aug 2021 03:10:00 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzu-0007Jv-Vu; Fri, 27 Aug 2021 03:09:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSY55b2z9sVq; Fri, 27 Aug 2021 17:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048189;
 bh=I4sakuYPcrBaQkmCgTNoXL6KPV5pXDpFf41HibTIaXA=;
 h=From:To:Cc:Subject:Date:From;
 b=o7edketcYN1ljU/OWt9e2mIhP3s3ZaS5ChoSueC6hOdSajBuJAGnNvBeuxbYzT4au
 NZsqMkZRDUKsTvPAkJRmRNn1+tv6cPKkFwHlrfqLLtt93+E2NyArmxHmcZHIBnge30
 29323B9ZbRiVwrrG/s3UznmlXkxuvWSnd1ytZbzQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/18] ppc-for-6.2 queue 20210827
Date: Fri, 27 Aug 2021 17:09:28 +1000
Message-Id: <20210827070946.219970-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f214d8e0150766c31172e16ef4b17674f549d852:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26 18:03:57 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20210827

for you to fetch changes up to 0ff16b6b78831240c39cfaaeab1f22ae52c84b09:

  target/ppc: fix vector registers access in gdbstub for little-endian (2021-08-27 12:43:13 +1000)

----------------------------------------------------------------
ppc patch queue 2021-08-27

First ppc pull request for qemu-6.2.  As usual, there's a fair bit
here, since it's been queued during the 6.1 freeze.  Highlights are:

 * Some fixes for 128 bit arithmetic and some vector opcodes that use
   them
 * Significant improvements to the powernv to support POWER10 cpus
   (more to come though)
 * Several cleanups to the ppc softmmu code
 * A few other assorted fixes

----------------------------------------------------------------
Cédric Le Goater (10):
      xive: Remove extra '0x' prefix in trace events
      ppc/pnv: update skiboot to commit 820d43c0a775.
      ppc: Add a POWER10 DD2 CPU
      ppc/pnv: Change the POWER10 machine to support DD2 only
      ppc/pnv: powerpc_excp: Do not discard HDECR exception when entering power-saving mode
      ppc/pnv: Use a simple incrementing index for the chip-id
      ppc/pnv: Distribute RAM among the chips
      ppc/pnv: add a chip topology index for POWER10
      ppc/xive: Export PQ get/set routines
      ppc/xive: Export xive_presenter_notify()

David Gibson (1):
      spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with g_autofree

Lucas Mateus Castro (alqotel) (3):
      target/ppc: divided mmu_helper.c in 2 files
      target/ppc: moved ppc_store_sdr1 to mmu_common.c
      target/ppc: moved store_40x_sler to helper_regs.c

Matheus Ferst (4):
      include/qemu/int128.h: define struct Int128 according to the host endianness
      target/ppc: fix vextu[bhw][lr]x helpers
      include/qemu/int128.h: introduce bswap128s
      target/ppc: fix vector registers access in gdbstub for little-endian

 hw/intc/spapr_xive_kvm.c |    8 +-
 hw/intc/trace-events     |   10 +-
 hw/intc/xive.c           |   14 +-
 hw/ppc/pnv.c             |   46 +-
 hw/ppc/pnv_core.c        |    2 +-
 hw/ppc/pnv_xscom.c       |    2 +
 hw/ppc/spapr_pci.c       |   22 +-
 include/hw/ppc/pnv.h     |   35 +-
 include/hw/ppc/xive.h    |    8 +
 include/qemu/int128.h    |   44 +-
 pc-bios/skiboot.lid      |  Bin 1667280 -> 2528128 bytes
 roms/skiboot             |    2 +-
 target/ppc/cpu-models.c  |    4 +-
 target/ppc/cpu-models.h  |    1 +
 target/ppc/cpu.c         |   28 -
 target/ppc/cpu.h         |    9 +
 target/ppc/cpu_init.c    |    3 +
 target/ppc/excp_helper.c |    6 -
 target/ppc/gdbstub.c     |   32 +-
 target/ppc/helper_regs.c |   12 +
 target/ppc/int_helper.c  |   38 +-
 target/ppc/internal.h    |   39 ++
 target/ppc/meson.build   |    8 +-
 target/ppc/mmu_common.c  | 1620 ++++++++++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c  | 1590 +--------------------------------------------
 25 files changed, 1823 insertions(+), 1760 deletions(-)
 create mode 100644 target/ppc/mmu_common.c

