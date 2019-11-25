Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBF1088EC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 08:03:14 +0100 (CET)
Received: from localhost ([::1]:40752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZ8Ov-0004GT-Mv
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 02:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iZ8KZ-0001tt-H0
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iZ8KX-00016z-BG
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:42 -0500
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:41677)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iZ8KX-00013M-5P
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 01:58:41 -0500
Received: from player697.ha.ovh.net (unknown [10.108.57.18])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 33D91123F9D
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 07:58:31 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 2AB40C8093DF;
 Mon, 25 Nov 2019 06:58:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v6 00/20] ppc/pnv: add XIVE support for KVM guests
Date: Mon, 25 Nov 2019 07:58:00 +0100
Message-Id: <20191125065820.927-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8905586788175285222
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeitddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.72.44
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The QEMU PowerNV machine emulates a baremetal OpenPOWER system and
acts as an hypervisor (L0). Supporting emulation of KVM to run guests
(L1) requires a few more extensions, among which guest support for the
XIVE interrupt controller on POWER9 processor.

The following changes extend the XIVE models with the new XiveFabric
and XivePresenter interfaces to provide support for XIVE escalations
and interrupt resend. This mechanism is used by XIVE to notify the
hypervisor that a vCPU is not dispatched on a HW thread. Tested on a
QEMU PowerNV machine and a simple QEMU pseries guest doing network on
a local bridge.

The XIVE interrupt controller offers a way to increase the XIVE
resources per chip by configuring multiple XIVE blocks on a chip. This
is not currently supported by the model. However, some configurations,
such as OPAL/skiboot, use one block-per-chip configuration with some
optimizations. One of them is to override the hardwired chip ID by the
block id in the PowerBUS operations and for CAM line compares. This
patchset improves the support for this setup. Tested with 4 chips.

A series from Suraj adding guest support in the Radix MMU model of the
QEMU PowerNV machine is still required and will be send later. The
whole patchset can be found under :

  https://github.com/legoater/qemu/tree/powernv-4.2

Thanks,

C.

Changes since v5:

 - Included Greg's rework of the PowerNV chip core list
 - Introduced a ppc_cpu_pir() helper
 - Better pnv_xive_is_cpu_enabled() helper
 - Extra fixes in  pnv_xive_get_indirect_tctx()=20
 - rework of the dump of the NVT table
=20
Changes since v4:

 - rebased on QEMU 4.2-rc1
 - better commit logs
 - moved fixes at the beginning of the patchset
 - reworked pnv_xive_match_nvt() handler to loop on the all threads of
   a PnvChip

Changes since v3:

 - reworked the patches introducing the XiveFabric and XivePresenter
   interfaces
 - moved the get_block_id() handler to the XiveRouter
 - new small addons related to the format of the trigger data
=20
Changes since v2:

 - introduced the XiveFabric and XivePresenter interfaces
 - removed the need of a XiveRouter pointer under XiveTCTX

Changes since v1:

 - minor extra fixes=20
 - split the escalation support in different patches
 - kept the XiveRouter type for XiveTCTX back pointer (will address
   this in P10)
 - removed pnv_xive_vst_size(). Really broken on indirect tables.
 - improved the dump of the NVT table
 - introduce pnv_xive_get_block_id()

C=C3=A9dric Le Goater (19):
  ppc/xive: Introduce a XivePresenter interface
  ppc/xive: Implement the XivePresenter interface
  ppc/pnv: Loop on the threads of the chip to find a matching NVT
  ppc: Introduce a ppc_cpu_pir() helper
  ppc/pnv: Introduce a pnv_xive_is_cpu_enabled() helper
  ppc/pnv: Fix TIMA indirect access
  ppc/xive: Introduce a XiveFabric interface
  ppc/pnv: Implement the XiveFabric interface
  ppc/spapr: Implement the XiveFabric interface
  ppc/xive: Use the XiveFabric and XivePresenter interfaces
  ppc/xive: Extend the TIMA operation with a XivePresenter parameter
  ppc/pnv: Clarify how the TIMA is accessed on a multichip system
  ppc/xive: Move the TIMA operations to the controller model
  ppc/xive: Remove the get_tctx() XiveRouter handler
  ppc/xive: Introduce a xive_tctx_ipb_update() helper
  ppc/xive: Synthesize interrupt from the saved IPB in the NVT
  ppc/pnv: Introduce a pnv_xive_block_id() helper
  ppc/pnv: Extend XiveRouter with a get_block_id() handler
  ppc/pnv: Dump the XIVE NVT table

Greg Kurz (1):
  ppc/pnv: Instantiate cores separately

 include/hw/ppc/pnv.h       |  12 +-
 include/hw/ppc/pnv_xive.h  |   3 -
 include/hw/ppc/ppc.h       |   1 +
 include/hw/ppc/xive.h      |  67 ++++++++-
 include/hw/ppc/xive_regs.h |   3 +
 hw/intc/pnv_xive.c         | 290 ++++++++++++++++++++++++++++--------
 hw/intc/spapr_xive.c       |  88 ++++++++++-
 hw/intc/xive.c             | 293 +++++++++++++++++++------------------
 hw/ppc/pnv.c               |  96 +++++++++---
 hw/ppc/ppc.c               |   9 +-
 hw/ppc/spapr.c             |  39 +++++
 11 files changed, 657 insertions(+), 244 deletions(-)

--=20
2.21.0


