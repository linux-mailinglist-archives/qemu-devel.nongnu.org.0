Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28CDE781E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 19:08:14 +0100 (CET)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP9R7-0007OV-Ca
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 14:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iP80J-0002cj-74
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iP80F-0007xH-4M
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46091
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iP80D-0007tF-6D
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 12:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572280578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/Dx+PbxKqebN9kqK3yoqBeSkpzxICQMpRExQnwgy+Q=;
 b=EkG6+qiG86lO98dIiFm/qnNMNf3Tpc8Zlbu8GZj4WvKYFSce1J7yhf4a/1K0ZIfIzCFo+p
 tGj9hkbTfALqy23Szh0D69v9PVXv/EYHQy/iK6IUZKGWMdL46jfTf25fGXdZ8rZVlrfRoh
 QfCEaoMZotLnc91n4bz6fuw1n0qQRTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-nZHb64i5MISaPax7YXZxcw-1; Mon, 28 Oct 2019 12:36:14 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6134D1800DCB;
 Mon, 28 Oct 2019 16:36:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-87.brq.redhat.com [10.40.204.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 792D91C941;
 Mon, 28 Oct 2019 16:36:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] hw/pci-host/piix: Extract piix3_create()
Date: Mon, 28 Oct 2019 17:34:40 +0100
Message-Id: <20191028163447.18541-14-philmd@redhat.com>
In-Reply-To: <20191028163447.18541-1-philmd@redhat.com>
References: <20191028163447.18541-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nZHb64i5MISaPax7YXZxcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the PIIX3 creation code from the i440fx_init() function.

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/piix.c | 51 ++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 2f4cbcbfe9..3292703de7 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -331,6 +331,36 @@ static void i440fx_realize(PCIDevice *dev, Error **err=
p)
     }
 }
=20
+static PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
+{
+    PIIX3State *piix3;
+    PCIDevice *pci_dev;
+
+    /*
+     * Xen supports additional interrupt routes from the PCI devices to
+     * the IOAPIC: the four pins of each PCI device on the bus are also
+     * connected to the IOAPIC directly.
+     * These additional routes can be discovered through ACPI.
+     */
+    if (xen_enabled()) {
+        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
+                                                  TYPE_PIIX3_XEN_DEVICE);
+        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
+        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
+                     piix3, XEN_PIIX_NUM_PIRQS);
+    } else {
+        pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true,
+                                                  TYPE_PIIX3_DEVICE);
+        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
+        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+                     piix3, PIIX_NUM_PIRQS);
+        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
+    }
+    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+
+    return piix3;
+}
+
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     PCII440FXState **pi440fx_state,
                     int *piix3_devfn,
@@ -400,27 +430,8 @@ PCIBus *i440fx_init(const char *host_type, const char =
*pci_type,
                  PAM_EXPAN_SIZE);
     }
=20
-    /* Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI. */
-    if (xen_enabled()) {
-        PCIDevice *pci_dev =3D pci_create_simple_multifunction(b,
-                             -1, true, TYPE_PIIX3_XEN_DEVICE);
-        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(b, xen_piix3_set_irq, xen_pci_slot_get_pirq,
-                piix3, XEN_PIIX_NUM_PIRQS);
-    } else {
-        PCIDevice *pci_dev =3D pci_create_simple_multifunction(b,
-                             -1, true, TYPE_PIIX3_DEVICE);
-        piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
-        pci_bus_irqs(b, piix3_set_irq, pci_slot_get_pirq, piix3,
-                PIIX_NUM_PIRQS);
-        pci_bus_set_route_irq_fn(b, piix3_route_intx_pin_to_irq);
-    }
+    piix3 =3D piix3_create(b, isa_bus);
     piix3->pic =3D pic;
-    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
-
     *piix3_devfn =3D piix3->dev.devfn;
=20
     ram_size =3D ram_size / 8 / 1024 / 1024;
--=20
2.21.0


