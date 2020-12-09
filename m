Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C52D4796
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:13:31 +0100 (CET)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn31u-0000Bz-E0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q3-0006Zj-IR
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:17 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2px-0000oG-SZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:15 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-k-eCIie1MoeaaKm4kGI1eQ-1; Wed, 09 Dec 2020 12:00:58 -0500
X-MC-Unique: k-eCIie1MoeaaKm4kGI1eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6861E107ACF7;
 Wed,  9 Dec 2020 17:00:57 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677775D6BA;
 Wed,  9 Dec 2020 17:00:56 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] spapr: Add an "spapr" property to sPAPR PHB
Date: Wed,  9 Dec 2020 18:00:48 +0100
Message-Id: <20201209170052.1431440-3-groug@kaod.org>
In-Reply-To: <20201209170052.1431440-1-groug@kaod.org>
References: <20201209170052.1431440-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR PHB device can only work with pseries machine types. This
is currently checked in the realize function with a dynamic cast of
qdev_get_machine(). Some other places also need to reach out to the
machine using qdev_get_machine().

Make this dependency explicit by introducing an "spapr" link
property which officialy points to the machine. This link is
set by pseries machine types only in the pre-plug handler. This
allows to drop some users of qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/pci-host/spapr.h |  1 +
 hw/ppc/spapr.c              |  4 ++++
 hw/ppc/spapr_pci.c          | 17 +++++++----------
 hw/ppc/spapr_pci_nvlink2.c  |  2 +-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 4f58f0223b56..622a4f1a07c6 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -76,6 +76,7 @@ struct SpaprPhbState {
     SpaprPciMsiMig *msi_devs;
=20
     QLIST_ENTRY(SpaprPhbState) list;
+    SpaprMachineState *spapr;
=20
     bool ddw_enabled;
     uint64_t page_size_mask;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4cc51723c62e..aca7d7af283a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3892,6 +3892,10 @@ static bool spapr_phb_pre_plug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
     const unsigned windows_supported =3D spapr_phb_windows_supported(sphb)=
;
     SpaprDrc *drc;
=20
+    /* Required by spapr_phb_realize() */
+    object_property_set_link(OBJECT(dev), "spapr", OBJECT(hotplug_dev),
+                             &error_abort);
+
     if (dev->hotplugged && !smc->dr_phb_enabled) {
         error_setg(errp, "PHB hotplug not supported for this machine");
         return false;
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index e946bd5055cc..2d9b88b93122 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -722,7 +722,7 @@ static void pci_spapr_set_irq(void *opaque, int irq_num=
, int level)
      * corresponding qemu_irq.
      */
     SpaprPhbState *phb =3D opaque;
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
+    SpaprMachineState *spapr =3D phb->spapr;
=20
     trace_spapr_pci_lsi_set(phb->dtbusname, irq_num, phb->lsi_table[irq_nu=
m].irq);
     qemu_set_irq(spapr_qirq(spapr, phb->lsi_table[irq_num].irq), level);
@@ -1743,10 +1743,10 @@ static void spapr_phb_finalizefn(Object *obj)
=20
 static void spapr_phb_unrealize(DeviceState *dev)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
     PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
     SpaprPhbState *sphb =3D SPAPR_PCI_HOST_BRIDGE(phb);
+    SpaprMachineState *spapr =3D sphb->spapr;
     SpaprTceTable *tcet;
     int i;
     const unsigned windows_supported =3D spapr_phb_windows_supported(sphb)=
;
@@ -1817,15 +1817,9 @@ static void spapr_phb_destroy_msi(gpointer opaque)
 static void spapr_phb_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
-    /* We don't use SPAPR_MACHINE() in order to exit gracefully if the use=
r
-     * tries to add a sPAPR PHB to a non-pseries machine.
-     */
-    SpaprMachineState *spapr =3D
-        (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
-                                                  TYPE_SPAPR_MACHINE);
-    SpaprMachineClass *smc =3D spapr ? SPAPR_MACHINE_GET_CLASS(spapr) : NU=
LL;
     SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
     SpaprPhbState *sphb =3D SPAPR_PCI_HOST_BRIDGE(s);
+    SpaprMachineState *spapr =3D sphb->spapr;
     PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
     MachineState *ms =3D MACHINE(spapr);
     char *namebuf;
@@ -1835,6 +1829,7 @@ static void spapr_phb_realize(DeviceState *dev, Error=
 **errp)
     SpaprTceTable *tcet;
     const unsigned windows_supported =3D spapr_phb_windows_supported(sphb)=
;
=20
+    /* Set in spapr_phb_pre_plug() */
     if (!spapr) {
         error_setg(errp, TYPE_SPAPR_PCI_HOST_BRIDGE " needs a pseries mach=
ine");
         return;
@@ -1986,7 +1981,7 @@ static void spapr_phb_realize(DeviceState *dev, Error=
 **errp)
     for (i =3D 0; i < PCI_NUM_PINS; i++) {
         int irq =3D SPAPR_IRQ_PCI_LSI + sphb->index * PCI_NUM_PINS + i;
=20
-        if (smc->legacy_irq_allocation) {
+        if (SPAPR_MACHINE_GET_CLASS(spapr)->legacy_irq_allocation) {
             irq =3D spapr_irq_findone(spapr, errp);
             if (irq < 0) {
                 error_prepend(errp, "can't allocate LSIs: ");
@@ -2109,6 +2104,8 @@ static Property spapr_phb_properties[] =3D {
     DEFINE_PROP_UINT64("atsd", SpaprPhbState, nv2_atsd_win_addr, 0),
     DEFINE_PROP_BOOL("pre-5.1-associativity", SpaprPhbState,
                      pre_5_1_assoc, false),
+    DEFINE_PROP_LINK("spapr", SpaprPhbState, spapr, TYPE_SPAPR_MACHINE,
+                     SpaprMachineState *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 8ef9b40a18dc..ce62318a6d73 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -368,7 +368,7 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sph=
b, void *fdt)
         _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));
         _FDT((fdt_setprop(fdt, off, "reg", mem_reg, sizeof(mem_reg))));
=20
-        spapr_numa_write_associativity_dt(SPAPR_MACHINE(qdev_get_machine()=
),
+        spapr_numa_write_associativity_dt(sphb->spapr,
                                           fdt, off, nvslot->numa_id);
=20
         _FDT((fdt_setprop_string(fdt, off, "compatible",
--=20
2.26.2


