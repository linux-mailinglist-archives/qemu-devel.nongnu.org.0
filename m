Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08A1B209
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:45:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6aL-0002z8-5O
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:45:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hQ6Y7-0001xU-Oa
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hQ6Y6-0003v5-IO
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:43:07 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:53173)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hQ6Y6-0003qs-C3
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:43:06 -0400
Received: from player778.ha.ovh.net (unknown [10.108.54.209])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 431E712462B
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 10:42:57 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player778.ha.ovh.net (Postfix) with ESMTPSA id 4C85259C3B3C;
	Mon, 13 May 2019 08:42:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 13 May 2019 10:42:31 +0200
Message-Id: <20190513084245.25755-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3319152929017662438
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrleeggddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.76
Subject: [Qemu-devel] [PATCH v4 00/14] spapr: add KVM support to the XIVE
 interrupt mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the v4 of the QEMU/KVM patchset.

The first patches introduce the XIVE KVM device, state synchronization
and migration support under KVM. The second part of the patchset
modifies the XICS and XIVE interrupt models to add KVM support to the
'dual' IRQ backend.

GitHub trees available here :
=20
QEMU sPAPR:

  https://github.com/legoater/qemu/commits/xive-next
 =20
Linux/KVM:

  https://github.com/legoater/linux/commits/xive-5.1

Thanks,

C.

Changes since v3:

 - updates of the kvm headers are synced with commit 0caecf5b0019
   (kvm-ppc-next-5.2-1) in branch kvm-ppc-next. will conflict with
   kvm-arm.  =20
 - added usage of xive_end_qaddr() helper
 - removed KVM_DESTROY_DEVICE control. KVM device is destroyed when
   the fd is closed.
 - update in kvmppc_xive_source_reset_one()
 - introduced a 'init' boolean under ICSState
 - removed extra spapr_irq_init_device() in spapr_irq_init_xive()=20
 - reworked slightly the code sequence in xics_kvm_init() creating the
   presenters and connecting them to the KVM XICS device.

Changes since v2:

 - update linux headers to 5.1-rc1
 - rebased on new naming scheme
 - rebased on new configuration system
 - replaced error_report_err() by warn_report_err()
 - added an assert() in spapr_xive_end_to_target()
 - moved xive_end_is_valid() check out of kvmppc_xive_set_queue_config()
 - dealt with MASKED EAS
 - reworked ESB memory operations
 - improved KVM_XIVE_EQ_ALWAYS_NOTIFY handling
 - removed the capture of the OS CAM line value from KVM
 - merged in the handling of pending interrupts while the VM is stopped.
 - did an update in ics_set_kvm_state_one()
 - removed spapr_ics_create()=20
 - introduced a spapr_irq_init_device() helper
 - reworked test on single initialization of the emulated IRQ device

Changes since v1:

 - Reworked most of the KVM interface
 - Reworked *All* hcalls which are now handled at the QEMU level,
   possibly extended with a KVM device ioctl when required.
 - TIMA and ESB special mapping done on the KVM device fd.
 - Tested on nested
 - Implemented the device fallback mode when a kernel_irqchip is not
   available and not required. Useful on nested to use XIVE.=20
 - Fix device hotplug when VM is stopped (Is this necessary ?)


C=C3=A9dric Le Goater (14):
  linux-headers: update linux headers to kvm-ppc-next-5.2-1
  spapr/xive: add KVM support
  spapr/xive: add hcall support when under KVM
  spapr/xive: add state synchronization with KVM
  spapr/xive: introduce a VM state change handler
  spapr/xive: add migration support for KVM
  spapr/xive: activate KVM support
  sysbus: add a sysbus_mmio_unmap() helper
  spapr: introduce routines to delete the KVM IRQ device
  spapr: check for the activation of the KVM IRQ device
  spapr/irq: introduce a spapr_irq_init_device() helper
  spapr/irq: initialize the IRQ device only once
  ppc/xics: fix irq priority in ics_set_irq_type()
  spapr/irq: add KVM support to the 'dual' machine

 include/hw/ppc/spapr_irq.h      |   2 +
 include/hw/ppc/spapr_xive.h     |  39 ++
 include/hw/ppc/xics.h           |   1 +
 include/hw/ppc/xics_spapr.h     |   1 +
 include/hw/ppc/xive.h           |  14 +
 include/hw/sysbus.h             |   1 +
 linux-headers/asm-powerpc/kvm.h |  46 ++
 linux-headers/linux/kvm.h       |   3 +
 target/ppc/kvm_ppc.h            |   6 +
 hw/core/sysbus.c                |  10 +
 hw/intc/spapr_xive.c            | 172 ++++++-
 hw/intc/spapr_xive_kvm.c        | 827 ++++++++++++++++++++++++++++++++
 hw/intc/xics.c                  |  10 +-
 hw/intc/xics_kvm.c              | 113 ++++-
 hw/intc/xics_spapr.c            |   7 +
 hw/intc/xive.c                  |  44 +-
 hw/ppc/spapr_irq.c              | 140 ++++--
 target/ppc/kvm.c                |   7 +
 hw/intc/Makefile.objs           |   1 +
 hw/ppc/Kconfig                  |   5 +
 20 files changed, 1384 insertions(+), 65 deletions(-)
 create mode 100644 hw/intc/spapr_xive_kvm.c

--=20
2.20.1


