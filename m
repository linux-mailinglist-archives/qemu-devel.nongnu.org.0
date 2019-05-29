Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5292D64D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:27:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVszg-0005XT-4o
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:27:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQn-0000mo-TY
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQm-00031C-TO
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40051 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQm-0002r7-I6; Wed, 29 May 2019 02:51:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv71THvz9sPv; Wed, 29 May 2019 16:50:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112627;
	bh=FARLmNP6QREokqn1Yllk7nBfUQ26iSO7Y5de8oWwo84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5qbRM86awACnpm/VnZgrNM+Mt83/crDW78KvVoY2mylQSb4KHPcYspGTPWgtQlc6
	Vu5/wSDrcl9BrhcqQqN2VS/V8nltjzyOljpAV4cdfI7uL1HbrEm/aPVs2ZXP8mUSl1
	YLVHHh4cLFZjJ/1zo2UcnIkO1p7go9gQC67/WI4g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:50:05 +1000
Message-Id: <20190529065017.15149-33-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 32/44] sysbus: add a sysbus_mmio_unmap() helper
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
	David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
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


