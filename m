Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5C162A40
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 17:19:32 +0100 (CET)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j45at-0005Go-L1
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 11:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jusual@redhat.com>) id 1j45Zk-0004hT-QM
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:18:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jusual@redhat.com>) id 1j45Zj-0005Lg-Gc
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:18:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32985
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jusual@redhat.com>) id 1j45Zj-0005L2-D8
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 11:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582042698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ywZUASfH4c2Hhu75Ovg2XJg470DhFPDarMadyNuZ89g=;
 b=W6PGlCj5NDebjw1dvmZduCrzmNa9PfmKiJDn2AIriiN6wpegSFw6B75ZAF+ICMDvsaSZ7N
 NFFM4d6lZWyiE/eBKJGKeUEXEtqRu2B8vivGwH/+Z9Ss/grZH6KS4potuqURRuGLUdE7TL
 WJWR2M+od3VsSbM/UvzytXqp99qwsWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-7MsBdQOpOMORMRP9hiDqkg-1; Tue, 18 Feb 2020 11:17:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C52408C8B40
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 16:17:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-206-52.brq.redhat.com
 [10.40.206.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F4F5D9E2;
 Tue, 18 Feb 2020 16:17:21 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pcie_root_port: Add disable_hotplug option
Date: Tue, 18 Feb 2020 17:17:17 +0100
Message-Id: <20200218161717.386723-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 7MsBdQOpOMORMRP9hiDqkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make hot-plug/hot-unplug on PCIe Root Ports optional to allow libvirt
to manage it and restrict unplug for the entire machine. This is going
to prevent user-initiated unplug in guests (Windows mostly).
Usage:
    -device pcie-root-port,disable-hotplug=3Dtrue,...

Discussion related:
    https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00530.html

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/core/machine.c                  | 1 +
 hw/pci-bridge/pcie_root_port.c     | 3 ++-
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 hw/pci/pcie.c                      | 8 ++++++--
 include/hw/pci/pcie.h              | 2 +-
 include/hw/pci/pcie_port.h         | 1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 84812a1d1c..5ff698ac3c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,6 +36,7 @@ GlobalProperty hw_compat_4_2[] =3D {
     { "usb-redir", "suppress-remote-wake", "off" },
     { "qxl", "revision", "4" },
     { "qxl-vga", "revision", "4" },
+    { "pcie-root-port-base", "disable-hotplug", "false" },
 };
 const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
=20
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.=
c
index 0ba4e4dea4..d6a080bee8 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -94,7 +94,7 @@ static void rp_realize(PCIDevice *d, Error **errp)
=20
     pcie_cap_arifwd_init(d);
     pcie_cap_deverr_init(d);
-    pcie_cap_slot_init(d, s->slot);
+    pcie_cap_slot_init(d, s);
     pcie_cap_root_init(d);
=20
     pcie_chassis_create(s->chassis);
@@ -147,6 +147,7 @@ static Property rp_props[] =3D {
     DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
                     QEMU_PCIE_SLTCAP_PCP_BITNR, true),
     DEFINE_PROP_BOOL("disable-acs", PCIESlot, disable_acs, false),
+    DEFINE_PROP_BOOL("disable-hotplug", PCIESlot, disable_hotplug, false),
     DEFINE_PROP_END_OF_LIST()
 };
=20
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_dow=
nstream.c
index 153a4acad2..04aae72cd6 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -94,7 +94,7 @@ static void xio3130_downstream_realize(PCIDevice *d, Erro=
r **errp)
     }
     pcie_cap_flr_init(d);
     pcie_cap_deverr_init(d);
-    pcie_cap_slot_init(d, s->slot);
+    pcie_cap_slot_init(d, s);
     pcie_cap_arifwd_init(d);
=20
     pcie_chassis_create(s->chassis);
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 08718188bb..6dd9b89e21 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -495,7 +495,7 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *ho=
tplug_dev,
=20
 /* pci express slot for pci express root/downstream port
    PCI express capability slot registers */
-void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot)
+void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
 {
     uint32_t pos =3D dev->exp.exp_cap;
=20
@@ -505,13 +505,17 @@ void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot=
)
     pci_long_test_and_clear_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                  ~PCI_EXP_SLTCAP_PSN);
     pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
-                               (slot << PCI_EXP_SLTCAP_PSN_SHIFT) |
+                               (s->slot << PCI_EXP_SLTCAP_PSN_SHIFT) |
                                PCI_EXP_SLTCAP_EIP |
                                PCI_EXP_SLTCAP_HPS |
                                PCI_EXP_SLTCAP_HPC |
                                PCI_EXP_SLTCAP_PIP |
                                PCI_EXP_SLTCAP_AIP |
                                PCI_EXP_SLTCAP_ABP);
+    if (s->disable_hotplug) {
+        pci_long_test_and_clear_mask(dev->config + pos + PCI_EXP_SLTCAP,
+                                     PCI_EXP_SLTCAP_HPC);
+    }
=20
     if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 7064875835..14c58ebdb6 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -104,7 +104,7 @@ void pcie_cap_deverr_reset(PCIDevice *dev);
 void pcie_cap_lnkctl_init(PCIDevice *dev);
 void pcie_cap_lnkctl_reset(PCIDevice *dev);
=20
-void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
+void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s);
 void pcie_cap_slot_reset(PCIDevice *dev);
 void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_st=
a);
 void pcie_cap_slot_write_config(PCIDevice *dev,
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 4b3d254b08..796fc8f3ab 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -55,6 +55,7 @@ struct PCIESlot {
=20
     /* Disable ACS (really for a pcie_root_port) */
     bool        disable_acs;
+    bool        disable_hotplug;
     QLIST_ENTRY(PCIESlot) next;
 };
=20
--=20
2.24.1


