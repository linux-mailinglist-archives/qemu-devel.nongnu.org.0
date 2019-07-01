Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B72487C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:56:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSygu-0003f0-R1
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyIH-0006qX-KO
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyIG-0000GK-Kb
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56223 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyIG-0008Ls-9m; Tue, 21 May 2019 02:30:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpm0wV5z9sPd; Tue, 21 May 2019 16:29:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420176;
	bh=N4Msu5vC5ToRCfQzQVywNNY77GKEdiRxWk6vPULpnQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lm89A6Wr2hI7X5pMLlcy1EuIqK9QG33hjbDPZf3Ymgp9AOpU/fFKNBVXrb8l8yLH2
	QGMzcLbUeN7I016RlUbuwEKecRa3ATW4FM+GlUy2v/T+0RCFnF7F8Loqcv+1ytvayL
	Se1Dt3YXi2Ihx8Vz9pj07qltxwXAx2MuIGtmBkAY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:29:23 +1000
Message-Id: <20190521062924.6930-38-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 37/38] ppc/xics: fix irq priority in
 ics_set_irq_type()
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
Cc: lvivier@redhat.com, gkurz@kaod.org, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Recent commits changed the behavior of ics_set_irq_type() to
initialize correctly LSIs at the KVM level. ics_set_irq_type() is also
called by the realize routine of the different devices of the machine
when initial interrupts are claimed, before the ICSState device is
reseted.

In the case, the ICSIRQState priority is 0x0 and the call to
ics_set_irq_type() results in configuring the target of the
interrupt. On P9, when using the KVM XICS-on-XIVE device, the target
is configured to be server 0, priority 0 and the event queue 0 is
created automatically by KVM.

With the dual interrupt mode creating the KVM device at reset, it
leads to unexpected effects on the guest, mostly blocking IPIs. This
is wrong, fix it by reseting the ICSIRQState structure when
ics_set_irq_type() is called.

Fixes: commit 6cead90c5c9c ("xics: Write source state to KVM at claim tim=
e")
Signed-off-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190513084245.25755-14-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index af7dc709ab..79f5a8a916 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -610,6 +610,12 @@ static const TypeInfo ics_simple_info =3D {
     .class_size =3D sizeof(ICSStateClass),
 };
=20
+static void ics_reset_irq(ICSIRQState *irq)
+{
+    irq->priority =3D 0xff;
+    irq->saved_priority =3D 0xff;
+}
+
 static void ics_base_reset(DeviceState *dev)
 {
     ICSState *ics =3D ICS_BASE(dev);
@@ -623,8 +629,7 @@ static void ics_base_reset(DeviceState *dev)
     memset(ics->irqs, 0, sizeof(ICSIRQState) * ics->nr_irqs);
=20
     for (i =3D 0; i < ics->nr_irqs; i++) {
-        ics->irqs[i].priority =3D 0xff;
-        ics->irqs[i].saved_priority =3D 0xff;
+        ics_reset_irq(ics->irqs + i);
         ics->irqs[i].flags =3D flags[i];
     }
 }
@@ -760,6 +765,7 @@ void ics_set_irq_type(ICSState *ics, int srcno, bool =
lsi)
         lsi ? XICS_FLAGS_IRQ_LSI : XICS_FLAGS_IRQ_MSI;
=20
     if (kvm_irqchip_in_kernel()) {
+        ics_reset_irq(ics->irqs + srcno);
         ics_set_kvm_state_one(ics, srcno);
     }
 }
--=20
2.21.0


