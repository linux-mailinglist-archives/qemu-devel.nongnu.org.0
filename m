Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135C2EB874
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:40:46 +0100 (CET)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzgi-0007Kb-BZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeg-0005XK-7D; Tue, 05 Jan 2021 22:38:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37043 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzed-0006FF-Kj; Tue, 05 Jan 2021 22:38:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpF5VBWz9sVs; Wed,  6 Jan 2021 14:38:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904309;
 bh=qid1kSPAWarFhU+vVlmYTB7jNKhmBPk6LsuRwTgPmPQ=;
 h=From:To:Cc:Subject:Date:From;
 b=csjSJAQqyVLf5cxSZcGvdQnDwVxZlK2bLDphyuW2PhqOPwdeJIhxKnGB7uErHzhHl
 dLJOGPK4MztJ11YUGSSYGat2iKkg1a56VxSeKOF/RN7NSdmZkEGyloWx3plKKPvTBz
 l27+eY7RJKoYwW0770ZkLSNOdkF1Sq7QwkrMUq3M=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/22] ppc-for-6.0 queue 20210106
Date: Wed,  6 Jan 2021 14:37:54 +1100
Message-Id: <20210106033816.232598-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 52d25464605dc20022ad94aa8bc8e8473e600833:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210104' into staging (2021-01-05 16:18:20 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210106

for you to fetch changes up to 5cbd51a5a58098444ffa246ece2013849be04299:

  ppc440_pcix: Fix up pci config access (2021-01-06 11:09:59 +1100)

----------------------------------------------------------------
ppc patch queue 2021-01-06

First pull request for 2021, which has a bunch of things accumulated
over the holidays.  Includes:
  * A number of cleanups to sam460ex and ppc440 code from BALATON Zoltan
  * Several fixes for builds with --without-default-devices from Greg Kurz
  * Fixes for some DRC reset problems from Greg Kurz
  * QOM conversion of the PPC 4xx UIC devices from Peter Maydell
  * Some other assorted fixes and cleanups

----------------------------------------------------------------
BALATON Zoltan via (5):
      ppc4xx: Move common dependency on serial to common option
      sam460ex: Remove FDT_PPC dependency from KConfig
      ppc440_pcix: Improve comment for IRQ mapping
      ppc440_pcix: Fix register write trace event
      ppc440_pcix: Fix up pci config access

Cédric Le Goater (1):
      spapr/xive: Make spapr_xive_pic_print_info() static

Greg Kurz (12):
      spapr: DRC lookup cannot fail
      spapr: Fix DR properties of the root node
      spapr: Allow memory unplug to always succeed
      spapr: Fix buffer overflow in spapr_numa_associativity_init()
      spapr: Call spapr_drc_reset() for all DRCs at CAS
      spapr: Fix reset of transient DR connectors
      spapr: Introduce spapr_drc_reset_all()
      spapr: Use spapr_drc_reset_all() at machine reset
      spapr: Add drc_ prefix to the DRC realize and unrealize functions
      ppc: Fix build with --without-default-devices
      ppc: Simplify reverse dependencies of POWERNV and PSERIES on XICS and XIVE
      pnv: Fix reverse dependency on PCI express root ports

Peter Maydell (4):
      hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
      ppc: Convert PPC UIC to a QOM device
      hw/ppc/virtex_ml507: Drop use of ppcuic_init()
      hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()

 MAINTAINERS                 |   2 +
 hw/intc/Kconfig             |  17 +--
 hw/intc/meson.build         |  13 +-
 hw/intc/ppc-uic.c           | 321 ++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/spapr_xive.c        |   2 +-
 hw/pci-host/Kconfig         |   5 +
 hw/pci-host/meson.build     |   2 +-
 hw/ppc/Kconfig              |  29 +---
 hw/ppc/ppc440_bamboo.c      |  38 ++++--
 hw/ppc/ppc440_pcix.c        |  50 ++++---
 hw/ppc/ppc4xx_devs.c        | 262 +++++-------------------------------
 hw/ppc/spapr.c              |  44 +++---
 hw/ppc/spapr_drc.c          |  63 +++++++--
 hw/ppc/spapr_events.c       |   3 +-
 hw/ppc/spapr_hcall.c        |  33 +----
 hw/ppc/trace-events         |   1 +
 hw/ppc/virtex_ml507.c       |  21 ++-
 include/hw/intc/ppc-uic.h   |  73 ++++++++++
 include/hw/pci-host/spapr.h |   2 -
 include/hw/ppc/spapr.h      |   6 +-
 include/hw/ppc/spapr_drc.h  |  10 +-
 include/hw/ppc/spapr_xive.h |   2 -
 22 files changed, 616 insertions(+), 383 deletions(-)
 create mode 100644 hw/intc/ppc-uic.c
 create mode 100644 include/hw/intc/ppc-uic.h

