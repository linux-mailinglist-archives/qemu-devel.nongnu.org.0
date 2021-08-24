Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B393F59A6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:07:51 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRTK-0001Ob-6q
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRE-0007Mz-Tb; Tue, 24 Aug 2021 04:05:40 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:30393
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRA-00005A-Qy; Tue, 24 Aug 2021 04:05:40 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629792326; h=from:subject:to:date:message-id;
 bh=4uq+uDOSvvfcwwktSQYDxovYMWaoeW0V175YPMhQjJ4=;
 b=fOSySFUMetAYmNDwtsEPntapIvVJBQ7kcdyuR0EH/5ImZzbxjFSl0ET40Vexy+xjOrboCGWiJ9T
 rRi0ZCFJK0Id493ifZ+wsuB+VaxVcXipj+ksWoc/OnJ4ObQjBqMkKJ5yUNiLdN9kcJE7oIkf3EEU8
 oJUTv6+AmLQfIfxM9oY=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:05:25 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v4 1/4] hw/arm/smmuv3: Support non PCI/PCIe device connect
 with SMMU v3
Thread-Topic: [PATCH v4 1/4] hw/arm/smmuv3: Support non PCI/PCIe device
 connect with SMMU v3
Thread-Index: AdeYvsrLCPkTjNyiRmmpM+r92JCn5A==
Date: Tue, 24 Aug 2021 08:05:24 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FABDE@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.815500-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  . Add sid-map property to store non PCI/PCIe devices SID
  . Create IOMMU memory regions for non PCI/PCIe devices based on their SID
  . Update SID getting strategy for PCI/PCIe and non PCI/PCIe devices

Signed-off-by: Li, Chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 46 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  7 +++++-
 include/hw/arm/smmuv3.h      |  2 ++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60bee4..11d7fe842 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
+#include "hw/qdev-properties.h"
=20
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -1430,6 +1431,19 @@ static void smmu_reset(DeviceState *dev)
     smmuv3_init_regs(s);
 }
=20
+static SMMUDevice *smmu_find_peri_sdev(SMMUState *s, uint16_t sid)
+{
+    SMMUDevice *sdev;
+
+    QLIST_FOREACH(sdev, &s->peri_sdev_list, next) {
+        if (smmu_get_sid(sdev) =3D=3D sid) {
+            return sdev;
+        }
+    }
+
+    return NULL;
+}
+
 static void smmu_realize(DeviceState *d, Error **errp)
 {
     SMMUState *sys =3D ARM_SMMU(d);
@@ -1437,6 +1451,9 @@ static void smmu_realize(DeviceState *d, Error **errp=
)
     SMMUv3Class *c =3D ARM_SMMUV3_GET_CLASS(s);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
     Error *local_err =3D NULL;
+    SMMUDevice *sdev;
+    char *name =3D NULL;
+    uint16_t sid =3D 0;
=20
     c->parent_realize(d, &local_err);
     if (local_err) {
@@ -1454,6 +1471,28 @@ static void smmu_realize(DeviceState *d, Error **err=
p)
     sysbus_init_mmio(dev, &sys->iomem);
=20
     smmu_init_irq(s, dev);
+
+    /* Create IOMMU memory region for peripheral devices based on their SI=
D */
+    for (int i =3D 0; i < s->num_sid; i++) {
+        sid =3D s->sid_map[i];
+        sdev =3D smmu_find_peri_sdev(sys, sid);
+        if (sdev) {
+            continue;
+        }
+
+        sdev =3D g_new0(SMMUDevice, 1);
+        sdev->smmu =3D sys;
+        sdev->bus =3D NULL;
+        sdev->devfn =3D sid;
+
+        name =3D g_strdup_printf("%s-peri-%d", sys->mrtypename, sid);
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 sys->mrtypename,
+                                 OBJECT(sys), name, 1ULL << SMMU_MAX_VA_BI=
TS);
+
+        QLIST_INSERT_HEAD(&sys->peri_sdev_list, sdev, next);
+        g_free(name);
+    }
 }
=20
 static const VMStateDescription vmstate_smmuv3_queue =3D {
@@ -1506,6 +1545,12 @@ static void smmuv3_instance_init(Object *obj)
     /* Nothing much to do here as of now */
 }
=20
+static Property smmuv3_properties[] =3D {
+    DEFINE_PROP_ARRAY("sid-map", SMMUv3State, num_sid, sid_map,
+                      qdev_prop_uint16, uint16_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -1515,6 +1560,7 @@ static void smmuv3_class_init(ObjectClass *klass, voi=
d *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize =3D dc->realize;
     dc->realize =3D smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
=20
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d..95cd12a4b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -117,6 +117,7 @@ struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
+    QLIST_HEAD(, SMMUDevice) peri_sdev_list;
 };
=20
 struct SMMUBaseClass {
@@ -138,7 +139,11 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_=
t bus_num);
 /* Return the stream ID of an SMMU device */
 static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
-    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    if (sdev->bus =3D=3D NULL) {
+        return sdev->devfn;
+    } else {
+        return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    }
 }
=20
 /**
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e6073..32ba84990 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -39,6 +39,8 @@ struct SMMUv3State {
     uint32_t features;
     uint8_t sid_size;
     uint8_t sid_split;
+    uint32_t num_sid;
+    uint16_t *sid_map;
=20
     uint32_t idr[6];
     uint32_t iidr;
--=20


