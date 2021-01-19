Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230802FB181
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:35:53 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kcK-0006Ru-4u
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQo-0001RS-GP; Tue, 19 Jan 2021 01:23:59 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34225 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQi-0000X6-Sg; Tue, 19 Jan 2021 01:23:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrY1mhQz9sXV; Tue, 19 Jan 2021 17:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037405;
 bh=HP858G5qc9k8vOQonuo25UNuAaA0dfPJcMSiZV0WaHg=;
 h=From:To:Cc:Subject:Date:From;
 b=cRCjCH8uKzMFyagN49irdKDyguKdcIta432l1XgOui6Zgvh/hQjYmN+PXlip0MPCL
 7T/YZCe9y+cIHymZ5t4Bs0J/UwRZcbGHykJjlIVpR66pDxvA4ZmcogvEL13caZD41a
 t/iFDza9vpwPKFh3Iu0uYl/eueCLrb+TJ36eMflc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/13] ppc-for-6.0 queue 20210119
Date: Tue, 19 Jan 2021 17:23:05 +1100
Message-Id: <20210119062318.13857-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

The following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f33:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-18 15:19:06 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210119

for you to fetch changes up to 2a05350e90ba09b6f42f5cff81f4aa7580a998be:

  spapr_cpu_core.c: use g_auto* in spapr_create_vcpu() (2021-01-19 10:20:29 +1100)

----------------------------------------------------------------
ppc patch queue 2021-01-19

Next pull request for qemu-6.0.  Not a huge amount here, but it does
have some important fixes from Greg Kurz.  Includes:

 * A number of minor cleanups from Daniel Barboza (preliminaries for
   some hotplug changes that are still under review)
 * Improved handling of memory hotplug from Greg Kurz
 * A number of fixes for sam460ex and other 440 based platforms from
   Zolan Balaton
 * Some fixes for the QOMification of the PPC 4xx UIC interrupt
   controller from Peter Maydell

----------------------------------------------------------------
BALATON Zoltan (3):
      Revert "sam460ex: Remove FDT_PPC dependency from KConfig"
      Revert "ppc4xx: Move common dependency on serial to common option"
      sam460ex: Use type cast macro instead of simple cast

Daniel Henrique Barboza (4):
      spapr.h: fix trailing whitespace in phb_placement
      spapr_hcall.c: make do_client_architecture_support static
      spapr_rtas.c: fix identation of rtas_ibm_suspend_me() args
      spapr_cpu_core.c: use g_auto* in spapr_create_vcpu()

Greg Kurz (1):
      spapr: Improve handling of memory unplug with old guests

Peter Maydell (5):
      hw/ppc/sam460ex: Drop use of ppcuic_init()
      hw/ppc: Delete unused ppc405cr_init() code
      hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
      hw/ppc/ppc405_uc: Drop use of ppcuic_init()
      hw/ppc: Remove unused ppcuic_init()

 hw/intc/ppc-uic.c           |   2 +-
 hw/ppc/Kconfig              |   6 +-
 hw/ppc/ppc405.h             |   8 +-
 hw/ppc/ppc405_boards.c      |   8 +-
 hw/ppc/ppc405_uc.c          | 415 +++++---------------------------------------
 hw/ppc/ppc4xx_devs.c        |  38 ----
 hw/ppc/sam460ex.c           |  76 +++++---
 hw/ppc/spapr.c              |  24 +--
 hw/ppc/spapr_cpu_core.c     |  12 +-
 hw/ppc/spapr_events.c       |   3 +-
 hw/ppc/spapr_hcall.c        |   1 +
 hw/ppc/spapr_ovec.c         |   7 +
 hw/ppc/spapr_rtas.c         |   6 +-
 include/hw/intc/ppc-uic.h   |   7 +
 include/hw/ppc/ppc4xx.h     |   9 -
 include/hw/ppc/spapr.h      |   9 +-
 include/hw/ppc/spapr_ovec.h |   1 +
 17 files changed, 146 insertions(+), 486 deletions(-)

