Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AC15B731
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 03:37:10 +0100 (CET)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j24NJ-0008Vo-IQ
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 21:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j24M3-0007DR-Ms
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j24M2-0000Yr-K9
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 21:35:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2702 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j24M0-0000PV-3G; Wed, 12 Feb 2020 21:35:48 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 24C73388DE11816840F7;
 Thu, 13 Feb 2020 10:35:43 +0800 (CST)
Received: from localhost (10.133.205.53) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 10:35:37 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH 4/4] arm: Create the cpufreq device
Date: Thu, 13 Feb 2020 10:35:32 +0800
Message-ID: <20200213023532.902-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20200213023532.902-1-fangying1@huawei.com>
References: <20200213023532.902-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, shannon.zhaosl@gmail.com, guoheyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the cpufreq device to arm64 virt machine

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 default-configs/aarch64-softmmu.mak |  1 +
 hw/acpi/Kconfig                     |  4 ++++
 hw/arm/virt.c                       | 13 +++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 958b1e08e4..0a030e853f 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -6,3 +6,4 @@ include arm-softmmu.mak
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
 CONFIG_SBSA_REF=3Dy
+CONFIG_CPUFREQ=3Dy
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 54209c6f2f..7d8aa58492 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -38,3 +38,7 @@ config ACPI_VMGENID
     depends on PC
=20
 config ACPI_HW_REDUCED
+
+config CPUFREQ
+    bool
+    default y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ed9dc38b60..53638f9557 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -764,6 +764,17 @@ static void create_uart(const VirtMachineState *vms,=
 int uart,
     g_free(nodename);
 }
=20
+static void create_cpufreq(const VirtMachineState *vms, MemoryRegion *me=
m)
+{
+    hwaddr base =3D vms->memmap[VIRT_CPUFREQ].base;
+    DeviceState *dev =3D qdev_create(NULL, "cpufreq");
+    SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
+
+    qdev_init_nofail(dev);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0))=
;
+}
+
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -1723,6 +1734,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
=20
+    create_cpufreq(vms, sysmem);
+
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
         create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
--=20
2.19.1



