Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE825D5C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:10:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJVo-0006YI-G7
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:10:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9h-00045g-KZ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9f-00076o-Hy
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44285 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9d-0006v5-EP; Wed, 22 May 2019 00:47:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T05kJKz9sPv; Wed, 22 May 2019 14:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500372;
	bh=9vdpppTxGBDsHN3Z7tJDxzrT9kU/xLpjp2jGJfkC4qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cAMXyUlj+7S8YLGr2jsU8JbX9pzcUK0gw3q9Q+bcGwD4KogAZMsubWuex/pD4Rm9t
	GnS5s4yw9vTD7eFV2w+zx1QyX/dj0rp8hqmc2iQZEcFRpMYSKnr5qwBiqYsIOp1bmw
	KDhyg89nEeb9nNKgIRvkSfY4Pkalu9TXD5IbIdXw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:52 +1000
Message-Id: <20190522044600.16534-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 30/38] spapr/xive: activate KVM support
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

All is in place for KVM now. State synchronization and migration will
come next.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190513084245.25755-8-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_irq.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 8d371523e6..e969683f5c 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -248,19 +248,10 @@ SpaprIrq spapr_irq_xics =3D {
 static void spapr_irq_init_xive(SpaprMachineState *spapr, int nr_irqs,
                                 Error **errp)
 {
-    MachineState *machine =3D MACHINE(spapr);
     uint32_t nr_servers =3D spapr_max_server_number(spapr);
     DeviceState *dev;
     int i;
=20
-    /* KVM XIVE device not yet available */
-    if (kvm_enabled()) {
-        if (machine_kernel_irqchip_required(machine)) {
-            error_setg(errp, "kernel_irqchip requested. no KVM XIVE supp=
ort");
-            return;
-        }
-    }
-
     dev =3D qdev_create(NULL, TYPE_SPAPR_XIVE);
     qdev_prop_set_uint32(dev, "nr-irqs", nr_irqs);
     /*
--=20
2.21.0


