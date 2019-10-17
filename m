Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E2DA534
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 07:47:19 +0200 (CEST)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKyd4-0005zk-Ad
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 01:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYQ-00016k-IQ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iKyYP-0005Jd-JT
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 01:42:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41887 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iKyYP-0005Ik-8L; Thu, 17 Oct 2019 01:42:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46tyjT6m1bz9sPc; Thu, 17 Oct 2019 16:42:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571290941;
 bh=mGl9erpGvqOrf7exLX2jon0zItJbqLirNCGx+VikJ1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d5nB3dZDlhZ2E1yiltlu72vEEnyFQTnFOMKueOq5If+DHT610AyiIbx0xp6GywPVq
 Nw0biffJMmE99WBz9ZmvmJocd/aMljYjUcCciVF9ETpHJbZv8xbpOH6NxgSSVoXizq
 oV/cU57lGpwD5J5yTZYnXbH748sl/lMvtbUATjEo=
From: David Gibson <david@gibson.dropbear.id.au>
To: alex.williamson@redhat.com,
	clg@kaod.org,
	groug@kaod.org
Subject: [RFC 4/5] spapr: Handle irq backend changes with VFIO PCI devices
Date: Thu, 17 Oct 2019 16:42:17 +1100
Message-Id: <20191017054218.8876-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017054218.8876-1-david@gibson.dropbear.id.au>
References: <20191017054218.8876-1-david@gibson.dropbear.id.au>
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

pseries machine type can have one of two different interrupt controllers =
in
use depending on feature negotiation with the guest.  Usually this is
invisible to devices, because they route to a common set of qemu_irqs whi=
ch
in turn dispatch to the correct back end.

VFIO passthrough devices, however, wire themselves up directly to the KVM
irqchip for performance, which means they are affected by this change in
interrupt controller.  To get them to adjust correctly for the change in
irqchip, we need to fire the kvm irqchip change notifier.

Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 234d1073e5..45544b8976 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -480,6 +480,12 @@ static void set_active_intc(SpaprMachineState *spapr=
,
     }
=20
     spapr->active_intc =3D new_intc;
+
+    /*
+     * We've changed the kernel irqchip, let VFIO devices know they
+     * need to readjust.
+     */
+    kvm_irqchip_change_notify();
 }
=20
 void spapr_irq_update_active_intc(SpaprMachineState *spapr)
--=20
2.21.0


