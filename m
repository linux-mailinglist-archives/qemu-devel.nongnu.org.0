Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255D146C3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:03:41 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iue1D-0001O6-V8
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iucXI-00053c-Lj
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:28:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iucXG-0003dh-JQ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:28:40 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:56660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iucXG-0003bm-A7; Thu, 23 Jan 2020 08:28:38 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 5C3C296EF2;
 Thu, 23 Jan 2020 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1579786116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42jsm3HluRurDXbXCzGR5jfB7UdQpNS+7uGKArMoUPM=;
 b=MsaHg//2cppltPKbDRIim0c3O5g6e72nr+C5kY2/qvdsSbhZEZj1Wbs/Yb5BqeiMCArP8p
 8z3SSs2vOEynP5iRCG4/7x3SOdM0trYPXMDlLS+6p1kaBeUd3UjrgI4ZGxvQZ7FpsfoBbT
 oennhS7av1n9p126X9Lmc8C10KoBB84=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/11] add device_legacy_reset function to prepare for
 reset api change
Date: Thu, 23 Jan 2020 14:28:13 +0100
Message-Id: <20200123132823.1117486-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123132823.1117486-1-damien.hedde@greensocs.com>
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1579786116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42jsm3HluRurDXbXCzGR5jfB7UdQpNS+7uGKArMoUPM=;
 b=kFsMpQ0GbNqLH7napMjUzqI68gKiDhplWnHd8xD5MPEEoIkBpgjHEyO/vOBXG0/FigaZQi
 Ayt/1PV3RoOkSpb01311drCcYHeoh32IvWblTtrMqRPy9gxCgNa7fxZw2FfSmoZDNSPXj5
 WhjGj03IDEmwYDh8npuahJr2AdJdTBQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579786116; a=rsa-sha256; cv=none;
 b=GxowEm1sdyfjbwJTO3eUapFYiyNH7THac+cQ1oRtHlkduHfKNbdGkn2+K7UrQllV3O6yAi
 NssYnjXRDvApsiUn//d5TNGA6K87kz9FtP+7r+4xSQMSycimTKV2zY3/mhmF0WVWhroNzC
 2FylgfMlHTu22jpR8XYezq5F3j8zijE=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, david@gibson.dropbear.id.au,
 philmd@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Damien Hedde <damien.hedde@greensocs.com>, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, edgari@xilinx.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a temporary device_legacy_reset function doing what
device_reset does to prepare for the transition with Resettable
API.

All occurrence of device_reset in the code tree are also replaced
by device_legacy_reset.

The new resettable API has different prototype and semantics
(resetting child buses as well as the specified device). Subsequent
commits will make the changeover for each call site individually; once
that is complete device_legacy_reset() will be removed.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v7 update: added new occurence due to rebase

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: John Snow <jsnow@redhat.com>
Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
Cc: Collin Walling <walling@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Fam Zheng <fam@euphon.net>
---
 include/hw/qdev-core.h   | 4 ++--
 hw/audio/intel-hda.c     | 2 +-
 hw/core/qdev.c           | 6 +++---
 hw/hyperv/hyperv.c       | 2 +-
 hw/i386/microvm.c        | 2 +-
 hw/i386/pc.c             | 2 +-
 hw/ide/microdrive.c      | 8 ++++----
 hw/intc/spapr_xive.c     | 2 +-
 hw/ppc/pnv_psi.c         | 4 ++--
 hw/ppc/spapr_pci.c       | 2 +-
 hw/ppc/spapr_vio.c       | 2 +-
 hw/s390x/s390-pci-inst.c | 2 +-
 hw/scsi/vmw_pvscsi.c     | 2 +-
 hw/sd/omap_mmc.c         | 2 +-
 hw/sd/pl181.c            | 2 +-
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1518495b1e..b8341b0fb0 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -427,11 +427,11 @@ char *qdev_get_own_fw_dev_path_from_handler(BusStat=
e *bus, DeviceState *dev);
 void qdev_machine_init(void);
=20
 /**
- * @device_reset
+ * device_legacy_reset:
  *
  * Reset a single device (by calling the reset method).
  */
-void device_reset(DeviceState *dev);
+void device_legacy_reset(DeviceState *dev);
=20
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 6ecd383540..27b71c57cf 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -1087,7 +1087,7 @@ static void intel_hda_reset(DeviceState *dev)
     QTAILQ_FOREACH(kid, &d->codecs.qbus.children, sibling) {
         DeviceState *qdev =3D kid->child;
         cdev =3D HDA_CODEC_DEVICE(qdev);
-        device_reset(DEVICE(cdev));
+        device_legacy_reset(DEVICE(cdev));
         d->state_sts |=3D (1 << cdev->cad);
     }
     intel_hda_update_irq(d);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 58e87d336d..447b081adc 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -298,7 +298,7 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceState =
*dev)
=20
 static int qdev_reset_one(DeviceState *dev, void *opaque)
 {
-    device_reset(dev);
+    device_legacy_reset(dev);
=20
     return 0;
 }
@@ -896,7 +896,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
             }
         }
         if (dev->hotplugged) {
-            device_reset(dev);
+            device_legacy_reset(dev);
         }
         dev->pending_deleted_event =3D false;
=20
@@ -1128,7 +1128,7 @@ void device_class_set_parent_unrealize(DeviceClass =
*dc,
     dc->unrealize =3D dev_unrealize;
 }
=20
-void device_reset(DeviceState *dev)
+void device_legacy_reset(DeviceState *dev)
 {
     DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
=20
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index da8ce82725..8ca3706f5b 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -140,7 +140,7 @@ void hyperv_synic_reset(CPUState *cs)
     SynICState *synic =3D get_synic(cs);
=20
     if (synic) {
-        device_reset(DEVICE(synic));
+        device_legacy_reset(DEVICE(synic));
     }
 }
=20
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 827ce29e58..d23485108d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -370,7 +370,7 @@ static void microvm_machine_reset(MachineState *machi=
ne)
         cpu =3D X86_CPU(cs);
=20
         if (cpu->apic_state) {
-            device_reset(cpu->apic_state);
+            device_legacy_reset(cpu->apic_state);
         }
     }
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8054bc4147..91c7fdaab1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1877,7 +1877,7 @@ static void pc_machine_reset(MachineState *machine)
         cpu =3D X86_CPU(cs);
=20
         if (cpu->apic_state) {
-            device_reset(cpu->apic_state);
+            device_legacy_reset(cpu->apic_state);
         }
     }
 }
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index b0272ea14b..6b30e36ed8 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -173,7 +173,7 @@ static void md_attr_write(PCMCIACardState *card, uint=
32_t at, uint8_t value)
     case 0x00:	/* Configuration Option Register */
         s->opt =3D value & 0xcf;
         if (value & OPT_SRESET) {
-            device_reset(DEVICE(s));
+            device_legacy_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -316,7 +316,7 @@ static void md_common_write(PCMCIACardState *card, ui=
nt32_t at, uint16_t value)
     case 0xe:	/* Device Control */
         s->ctrl =3D value;
         if (value & CTRL_SRST) {
-            device_reset(DEVICE(s));
+            device_legacy_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -541,7 +541,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
     md->attr_base =3D pcc->cis[0x74] | (pcc->cis[0x76] << 8);
     md->io_base =3D 0x0;
=20
-    device_reset(DEVICE(md));
+    device_legacy_reset(DEVICE(md));
     md_interrupt_update(md);
=20
     return 0;
@@ -551,7 +551,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
 {
     MicroDriveState *md =3D MICRODRIVE(card);
=20
-    device_reset(DEVICE(md));
+    device_legacy_reset(DEVICE(md));
     return 0;
 }
=20
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 7663123878..52bab29784 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1766,7 +1766,7 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
         return H_PARAMETER;
     }
=20
-    device_reset(DEVICE(xive));
+    device_legacy_reset(DEVICE(xive));
=20
     if (kvm_irqchip_in_kernel()) {
         Error *local_err =3D NULL;
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 1d8da31738..916e2a9ba7 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -466,7 +466,7 @@ static void pnv_psi_reset(DeviceState *dev)
=20
 static void pnv_psi_reset_handler(void *dev)
 {
-    device_reset(DEVICE(dev));
+    device_legacy_reset(DEVICE(dev));
 }
=20
 static void pnv_psi_realize(DeviceState *dev, Error **errp)
@@ -715,7 +715,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwadd=
r addr,
         break;
     case PSIHB9_INTERRUPT_CONTROL:
         if (val & PSIHB9_IRQ_RESET) {
-            device_reset(DEVICE(&psi9->source));
+            device_legacy_reset(DEVICE(&psi9->source));
         }
         psi->regs[reg] =3D val;
         break;
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 723373de73..81b5d1b6f2 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2014,7 +2014,7 @@ static int spapr_phb_children_reset(Object *child, =
void *opaque)
     DeviceState *dev =3D (DeviceState *) object_dynamic_cast(child, TYPE=
_DEVICE);
=20
     if (dev) {
-        device_reset(dev);
+        device_legacy_reset(dev);
     }
=20
     return 0;
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 554de9930d..f14944e900 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -304,7 +304,7 @@ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *=
crq)
 static void spapr_vio_quiesce_one(SpaprVioDevice *dev)
 {
     if (dev->tcet) {
-        device_reset(DEVICE(dev->tcet));
+        device_legacy_reset(DEVICE(dev->tcet));
     }
     free_crq(dev);
 }
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 92c7e45df5..2f7a7d7bd1 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -243,7 +243,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintpt=
r_t ra)
                 stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
                 goto out;
             }
-            device_reset(DEVICE(pbdev));
+            device_legacy_reset(DEVICE(pbdev));
             pbdev->fh &=3D ~FH_MASK_ENABLE;
             pbdev->state =3D ZPCI_FS_DISABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 452a3b63b2..7baab1532f 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -838,7 +838,7 @@ pvscsi_on_cmd_reset_device(PVSCSIState *s)
=20
     if (sdev !=3D NULL) {
         s->resetting++;
-        device_reset(&sdev->qdev);
+        device_legacy_reset(&sdev->qdev);
         s->resetting--;
         return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
     }
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index c6e516b611..4088a8a80b 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -318,7 +318,7 @@ void omap_mmc_reset(struct omap_mmc_s *host)
      * into any bus, and we must reset it manually. When omap_mmc is
      * QOMified this must move into the QOM reset function.
      */
-    device_reset(DEVICE(host->card));
+    device_legacy_reset(DEVICE(host->card));
 }
=20
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 8033fe455d..2b3776a6a0 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -482,7 +482,7 @@ static void pl181_reset(DeviceState *d)
     /* Since we're still using the legacy SD API the card is not plugged
      * into any bus, and we must reset it manually.
      */
-    device_reset(DEVICE(s->card));
+    device_legacy_reset(DEVICE(s->card));
 }
=20
 static void pl181_init(Object *obj)
--=20
2.24.1


