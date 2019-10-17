Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E14DA52E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 07:44:48 +0200 (CEST)
Received: from localhost ([::1]:35488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKyac-0002nn-Ts
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 01:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYO-00016C-FQ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYM-0005IH-Ur
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49597 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iKyYL-0005HX-Sr; Thu, 17 Oct 2019 01:42:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46tyjT131Zz9sPF; Thu, 17 Oct 2019 16:42:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571290941;
 bh=pTeBBRPUiYQ655velGrbBA42A2orPMeNXM61xPG0sf0=;
 h=From:To:Cc:Subject:Date:From;
 b=INzaKzis75BFT8QGIlFvtLwtaeGpIwh985fZv4XLC6ZRtwbrEaYo2gr5gOaxYM2tD
 gvn4gLjfCB93Js2j++eP6Zt0rU6jqXV16iyO7vV/EoqtOYiTiBLL/wHB5hoa9AGnfK
 LiMswbMjxVw94bXVVZBO3pgoNUr2nHxQ8CKNJ38o=
From: David Gibson <david@gibson.dropbear.id.au>
To: alex.williamson@redhat.com,
	clg@kaod.org,
	groug@kaod.org
Subject: [RFC 0/5] Handle PAPR irq chip changes for VFIO devices
Date: Thu, 17 Oct 2019 16:42:13 +1100
Message-Id: <20191017054218.8876-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pseries machine type has the odd property that it's root irq chip
can be completely changed at runtime.  This comes about because PAPR
feature negotiation lets the guest choose between the old XICS style
or new XIVE style PIC.  It's possible, because both PICs are
paravirtualized via hypercalls.

VFIO needs to wire up device interrupts directly to the kernel irqchip
to accelerate delivery, and that's broken by the irq chip change.
This series introduces a new notifier to get this correctly updated
when PAPR switchs irq chip.

Caveats:
 * I'm not sure I've sufficiently pinned down the semantics of when
   exactly the new notifier should be called yet
  =20
 * It would kind of be niced to automatically fire the notifier from
   somewhere in the irq chip update routines, rather than at the PAPR
   level.  I haven't seen a good way to do that (at least not without
   double firing it on every transition).

 * Patch 5/5 to work around spurious warnings is working a bit *too*
   well.  On a Boston machine which allows in-kernel XICS, but not
   in-kernel XIVE, I (correctly) no longer get the spurious warning at
   initial start up (in XICS mode).  However we incorrectly *don't*
   get the "failed to setup resample irqfd" warning after we negotiate
   features and switch to XIVE mode.  I haven't had a chance to
   investigate, but I suspect a kernel bug where it's responding to
   KVM_IRQFD based on stale information about the kernel irqchip.

David Gibson (5):
  kvm: Introduce KVM irqchip change notifier
  vfio/pci: Split vfio_intx_update()
  vfio/pci: Respond to KVM irqchip change notifier
  spapr: Handle irq backend changes with VFIO PCI devices
  spapr: Work around spurious warnings from vfio INTx initialization

 accel/kvm/kvm-all.c    | 18 +++++++++++++++
 accel/stubs/kvm-stub.c | 12 ++++++++++
 hw/ppc/spapr_irq.c     | 17 +++++++++++++-
 hw/vfio/pci.c          | 51 ++++++++++++++++++++++++++++--------------
 hw/vfio/pci.h          |  2 ++
 include/sysemu/kvm.h   |  5 +++++
 6 files changed, 87 insertions(+), 18 deletions(-)

--=20
2.21.0


