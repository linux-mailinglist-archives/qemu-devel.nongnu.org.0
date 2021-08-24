Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E33F59A8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:09:06 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRUX-00059w-7b
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRN-0007ng-0Z; Tue, 24 Aug 2021 04:05:49 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:30393
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRL-00005A-7L; Tue, 24 Aug 2021 04:05:48 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629792345; h=from:subject:to:date:message-id;
 bh=H5FZe4vybguFidc7hKvpOilUl09s3MEKvHYeLtK04pY=;
 b=GY6J4rxygRaATGbo0RaUiwOEgge92rQcXprER3MNATiUK1p8b+s3LyNXiYYpl3vKG0vvwqkfobv
 h8VGmPfRg8IFzcuhskZh1avvXFdXTxsaEtMQUWsofq88WHfdehzGuaLRZ8mwjsx+VcEO0frfjm6RB
 jMxFmVpxgYy7UBshlSA=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:05:44 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v4 3/4] hw/arm/virt: Update SMMU v3 creation to support non
 PCI/PCIe device connection
Thread-Topic: [PATCH v4 3/4] hw/arm/virt: Update SMMU v3 creation to support
 non PCI/PCIe device connection
Thread-Index: AdeYvtaQLQKo6OU0Q32lkeneOmaMhA==
Date: Tue, 24 Aug 2021 08:05:44 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FABEE@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--5.065300-0.000000-31
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

  . Add "smmuv3_sidmap" to set non PCI/PCIe devices SID value
  . Pass non PCI/PCIe devices SID value to SMMU v3 model creation
  . Store SMMU v3 device in virtual machine then non PCI/PCIe can get its m=
emory region later

Signed-off-by: Li, Chunming <chunming.li@verisilicon.com>
---
 hw/arm/virt.c         | 18 +++++++++++++++++-
 include/hw/arm/virt.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0..c3fd30e07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,10 @@ static const char *valid_cpus[] =3D {
     ARM_CPU_TYPE_NAME("max"),
 };
=20
+static const uint16_t smmuv3_sidmap[] =3D {
+
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -1223,7 +1227,7 @@ static void create_pcie_irq_map(const MachineState *m=
s,
                            0x7           /* PCI irq */);
 }
=20
-static void create_smmu(const VirtMachineState *vms,
+static void create_smmu(VirtMachineState *vms,
                         PCIBus *bus)
 {
     char *node;
@@ -1244,6 +1248,16 @@ static void create_smmu(const VirtMachineState *vms,
=20
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    vms->smmuv3 =3D dev;
+
+    qdev_prop_set_uint32(dev, "len-sid-map", ARRAY_SIZE(smmuv3_sidmap));
+
+    for (i =3D 0; i < ARRAY_SIZE(smmuv3_sidmap); i++) {
+        g_autofree char *propname =3D g_strdup_printf("sid-map[%d]", i);
+        qdev_prop_set_uint16(dev, propname, smmuv3_sidmap[i]);
+    }
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i =3D 0; i < NUM_SMMU_IRQS; i++) {
@@ -2762,6 +2776,8 @@ static void virt_instance_init(Object *obj)
=20
     vms->irqmap =3D a15irqmap;
=20
+    vms->sidmap =3D smmuv3_sidmap;
+
     virt_flash_create(vms);
=20
     vms->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c4669..d3402a43d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -167,6 +167,8 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    DeviceState *smmuv3;
+    const uint16_t *sidmap;
 };
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20



