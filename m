Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA425D34
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJMv-0006pW-2Z
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:00:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9J-0003j3-Pm
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9I-0006wr-Ns
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:45 -0400
Received: from ozlabs.org ([203.11.71.1]:39523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9I-0006v1-Ce; Wed, 22 May 2019 00:46:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T04H71z9sQq; Wed, 22 May 2019 14:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500372;
	bh=FARLmNP6QREokqn1Yllk7nBfUQ26iSO7Y5de8oWwo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mR9Xc/4m5XUPIAJd00nipxTIJKg3Z9loWkfE3enl/phM9osyiiHAjpkH9K0Gp8sTy
	1pp1ka0wvWOSm5gH+ZO32kTViOZly3Aub4/zmS4yXpNkUVdNLnbY/Sn9NZOpGfUDrV
	h7irE5DknfNe9xNZPf856IzulSpa0j3XDsIICCmY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:53 +1000
Message-Id: <20190522044600.16534-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 31/38] sysbus: add a sysbus_mmio_unmap() helper
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

This will be used to remove the MMIO regions of the POWER9 XIVE
interrupt controller when the sPAPR machine is reseted.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190513084245.25755-9-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/core/sysbus.c    | 10 ++++++++++
 include/hw/sysbus.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 307cf90a51..689a867a22 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -153,6 +153,16 @@ static void sysbus_mmio_map_common(SysBusDevice *dev=
, int n, hwaddr addr,
     }
 }
=20
+void sysbus_mmio_unmap(SysBusDevice *dev, int n)
+{
+    assert(n >=3D 0 && n < dev->num_mmio);
+
+    if (dev->mmio[n].addr !=3D (hwaddr)-1) {
+        memory_region_del_subregion(get_system_memory(), dev->mmio[n].me=
mory);
+        dev->mmio[n].addr =3D (hwaddr)-1;
+    }
+}
+
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 {
     sysbus_mmio_map_common(dev, n, addr, false, 0);
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 1aedcf05c9..4c668fbbdc 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -89,6 +89,7 @@ qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, in=
t n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
+void sysbus_mmio_unmap(SysBusDevice *dev, int n);
 void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
                    MemoryRegion *mem);
 MemoryRegion *sysbus_address_space(SysBusDevice *dev);
--=20
2.21.0


