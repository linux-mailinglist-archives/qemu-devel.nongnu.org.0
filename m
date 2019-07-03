Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1B5D319
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:40:19 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKtG-0003Xr-Sy
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKMz-0006BV-3Y
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKMx-0008MY-W8
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKMx-0008Kw-Ms
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00B2930832D8;
 Tue,  2 Jul 2019 15:06:55 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40BA95D9D6;
 Tue,  2 Jul 2019 15:06:49 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:06:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190702150606.24851-5-mst@redhat.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 15:06:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/22] pcie: minor cleanups for slot
 control/status
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename function arguments to make intent clearer.
Better documentation for slot control logic.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci/pcie.h |  3 ++-
 hw/pci/pcie.c         | 17 +++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 8d90c0e193..34f277735c 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -108,7 +108,8 @@ void pcie_cap_lnkctl_reset(PCIDevice *dev);
 void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
 void pcie_cap_slot_reset(PCIDevice *dev);
 void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slot_ctl, uint16_t *slt=
_sta);
-void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slot_ctl, uint1=
6_t slt_sta,
+void pcie_cap_slot_write_config(PCIDevice *dev,
+                                uint16_t old_slot_ctl, uint16_t old_slt_=
sta,
                                 uint32_t addr, uint32_t val, int len);
 int pcie_cap_slot_post_load(void *opaque, int version_id);
 void pcie_cap_slot_push_attention_button(PCIDevice *dev);
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index c605d32dd4..a6beb567bd 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -602,7 +602,8 @@ void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_=
ctl, uint16_t *slt_sta)
     *slt_sta =3D pci_get_word(exp_cap + PCI_EXP_SLTSTA);
 }
=20
-void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slt_ctl, uint16=
_t slt_sta,
+void pcie_cap_slot_write_config(PCIDevice *dev,
+                                uint16_t old_slt_ctl, uint16_t old_slt_s=
ta,
                                 uint32_t addr, uint32_t val, int len)
 {
     uint32_t pos =3D dev->exp.exp_cap;
@@ -625,8 +626,8 @@ void pcie_cap_slot_write_config(PCIDevice *dev, uint1=
6_t slt_ctl, uint16_t slt_s
                           PCI_EXP_SLTSTA_MRLSC | PCI_EXP_SLTSTA_PDC | \
                           PCI_EXP_SLTSTA_CC)
=20
-        if (val & ~slt_sta & PCIE_SLOT_EVENTS) {
-            sltsta =3D (sltsta & ~PCIE_SLOT_EVENTS) | (slt_sta & PCIE_SL=
OT_EVENTS);
+        if (val & ~old_slt_sta & PCIE_SLOT_EVENTS) {
+            sltsta =3D (sltsta & ~PCIE_SLOT_EVENTS) | (old_slt_sta & PCI=
E_SLOT_EVENTS);
             pci_set_word(exp_cap + PCI_EXP_SLTSTA, sltsta);
         }
         hotplug_event_clear(dev);
@@ -646,13 +647,17 @@ void pcie_cap_slot_write_config(PCIDevice *dev, uin=
t16_t slt_ctl, uint16_t slt_s
     }
=20
     /*
-     * If the slot is polulated, power indicator is off and power
+     * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
+     *
+     * Note: don't detach if condition was already true:
+     * this is a work around for guests that overwrite
+     * control of powered off slots before powering them on.
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
         (val & PCI_EXP_SLTCTL_PIC_OFF) =3D=3D PCI_EXP_SLTCTL_PIC_OFF &&
-        (!(slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) !=3D PCI_EXP_SLTCTL_PIC_OFF))=
 {
+        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) !=3D PCI_EXP_SLTCTL_PIC_O=
FF)) {
         PCIBus *sec_bus =3D pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
         pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
                             pcie_unplug_device, NULL);
--=20
MST


