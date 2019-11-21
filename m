Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D481A1047D0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 02:01:25 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXaqa-0002tn-Lz
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 20:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iXao5-0001Qe-Lb
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:58:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iXao4-0001rk-90
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:58:49 -0500
Received: from ozlabs.org ([203.11.71.1]:47185)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iXao3-0001ql-5Q; Wed, 20 Nov 2019 19:58:48 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47JLm40WNcz9sPL; Thu, 21 Nov 2019 11:58:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574297924;
 bh=tCEjjjB7GWqDoKkmTHHtPfHvbR0elnZvywA0y/9MLo0=;
 h=From:To:Cc:Subject:Date:From;
 b=EyVBCYXMbgL/PZAgLOTtz0gX0pXijPuX9pUZJRgcHWhLB/w4oLX2BSi4I/VPlBnOC
 q0FYGB73r6i3IDHdz26veT6iTYIPVJLENM+xVShNbLHYT6ymE19SLFyXyQA/XjtblG
 dqtn6WBoa1baAQuibNkZrG2Ez5v4xLF3w4mfR4fA=
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex Williamson <alex.williamson@redhat.com>,
	clg@kaod.org
Subject: [PATCH 0/5] vfio/spapr: Handle changes of master irq chip for VFIO
 devices
Date: Thu, 21 Nov 2019 11:56:02 +1100
Message-Id: <20191121005607.274347-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to the way feature negotiation works in PAPR (which is a
paravirtualized platform), we can end up changing the global irq chip
at runtime, including it's KVM accelerate model.  That causes
complications for VFIO devices with INTx, which wire themselves up
directly to the KVM irqchip for performance.

This series introduces a new notifier to let VFIO devices (and
anything else that needs to in the future) know about changes to the
master irqchip.  It modifies VFIO to respond to the notifier,
reconnecting itself to the new KVM irqchip as necessary.

In particular this removes a misleading (though not wholly inaccurate)
warning that occurs when using VFIO devices on a pseries machine type
guest.

Open question: should this go into qemu-4.2 or wait until 5.0?  It's
has medium complexity / intrusiveness, but it *is* a bugfix that I
can't see a simpler way to fix.  It's effectively a regression from
qemu-4.0 to qemu-4.1 (because that introduced XIVE support by
default), although not from 4.1 to 4.2.

Changes since RFC:
 * Fixed some incorrect error paths pointed by aw in 3/5
 * 5/5 had some problems previously, but they have been obsoleted by
   other changes merged in the meantime

David Gibson (5):
  kvm: Introduce KVM irqchip change notifier
  vfio/pci: Split vfio_intx_update()
  vfio/pci: Respond to KVM irqchip change notifier
  spapr: Handle irq backend changes with VFIO PCI devices
  spapr: Work around spurious warnings from vfio INTx initialization

 accel/kvm/kvm-all.c    | 18 ++++++++++++
 accel/stubs/kvm-stub.c | 12 ++++++++
 hw/ppc/spapr_irq.c     | 17 +++++++++++-
 hw/vfio/pci.c          | 62 +++++++++++++++++++++++++++---------------
 hw/vfio/pci.h          |  1 +
 include/sysemu/kvm.h   |  5 ++++
 6 files changed, 92 insertions(+), 23 deletions(-)

--=20
2.23.0


