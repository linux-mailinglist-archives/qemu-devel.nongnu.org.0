Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D063F2E4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ka0-0004au-Op; Thu, 01 Dec 2022 09:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0kZx-0004ZX-Lq; Thu, 01 Dec 2022 09:30:21 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0kZu-0001NC-IN; Thu, 01 Dec 2022 09:30:20 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C6B0911F204;
 Thu,  1 Dec 2022 14:30:15 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 14 Nov 2022 13:06:47 +0100
Subject: [PATCH qemu.git v2 1/1] hw/arm/virt: make second UART available
Message-ID: <166990501232.22022.16582561244534011083-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990501232.22022.16582561244534011083-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

The first UART always always exists. If the security extensions are
enabled, the second UART also always exists. Otherwise, it only exists
if a backend is configured explicitly via '-serial <backend>', where
'null' creates a dummy backend. This allows enabling the second UART
explicitly on demand and does not interfere with any existing setup
that just expect one (or two if security extensions are enabled)
UARTs.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 docs/system/arm/virt.rst |  5 ++--
 hw/arm/virt-acpi-build.c | 12 ++++-----
 hw/arm/virt.c            | 57 ++++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |  4 +--
 4 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..0d9de6bb2e 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -26,7 +26,8 @@ The virt board supports:
=20
 - PCI/PCIe devices
 - Flash memory
-- One PL011 UART
+- Two PL011 UARTs. The second UART only exists if a backend is configured
+  explicitly or TrustZone is enabled.
 - An RTC
 - The fw_cfg device that allows a guest to obtain data from QEMU
 - A PL061 GPIO controller
@@ -42,7 +43,7 @@ The virt board supports:
 - many CPUs (up to 512 if using a GICv3 and highmem)
 - Secure-World-only devices if the CPU has TrustZone:
=20
-  - A second PL011 UART
+  - The second PL011 UART
   - A second PL061 GPIO controller, with GPIO lines for triggering
     a system reset or system poweroff
   - A secure flash memory
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..3e1852a1b9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -482,14 +482,14 @@ build_spcr(GArray *table_data, BIOSLinker *linker, Virt=
MachineState *vms)
     build_append_int_noprefix(table_data, 0, 3); /* Reserved */
     /* Base Address */
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
-                     vms->memmap[VIRT_UART].base);
+                     vms->memmap[VIRT_UART0].base);
     /* Interrupt Type */
     build_append_int_noprefix(table_data,
         (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
     build_append_int_noprefix(table_data, 0, 1); /* IRQ */
     /* Global System Interrupt */
     build_append_int_noprefix(table_data,
-                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
+                              vms->irqmap[VIRT_UART0] + ARM_SPI_BASE, 4);
     build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
     build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
     /* Stop Bits */
@@ -673,11 +673,11 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, Virt=
MachineState *vms)
=20
     /* BaseAddressRegister[] */
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
-                     vms->memmap[VIRT_UART].base);
+                     vms->memmap[VIRT_UART0].base);
=20
     /* AddressSize[] */
     build_append_int_noprefix(table_data,
-                              vms->memmap[VIRT_UART].size, 4);
+                              vms->memmap[VIRT_UART0].size, 4);
=20
     /* NamespaceString[] */
     g_array_append_vals(table_data, name, namespace_length);
@@ -858,8 +858,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMa=
chineState *vms)
      */
     scope =3D aml_scope("\\_SB");
     acpi_dsdt_add_cpus(scope, vms);
-    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
-                       (irqmap[VIRT_UART] + ARM_SPI_BASE));
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0],
+                       (irqmap[VIRT_UART0] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..92f9401b23 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -143,11 +143,11 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_GIC_ITS] =3D            { 0x08080000, 0x00020000 },
     /* This redistributor space allows up to 2*64kB*123 CPUs */
     [VIRT_GIC_REDIST] =3D         { 0x080A0000, 0x00F60000 },
-    [VIRT_UART] =3D               { 0x09000000, 0x00001000 },
+    [VIRT_UART0] =3D              { 0x09000000, 0x00001000 },
     [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
-    [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
+    [VIRT_UART1] =3D              { 0x09040000, 0x00001000 }, /* secure UART=
 */
     [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =3D           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
@@ -184,11 +184,11 @@ static MemMapEntry extended_memmap[] =3D {
 };
=20
 static const int a15irqmap[] =3D {
-    [VIRT_UART] =3D 1,
+    [VIRT_UART0] =3D 1,
     [VIRT_RTC] =3D 2,
     [VIRT_PCIE] =3D 3, /* ... to 6 */
     [VIRT_GPIO] =3D 7,
-    [VIRT_SECURE_UART] =3D 8,
+    [VIRT_UART1] =3D 8,
     [VIRT_ACPI_GED] =3D 9,
     [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
@@ -843,6 +843,27 @@ static void create_uart(const VirtMachineState *vms, int=
 uart,
                         MemoryRegion *mem, Chardev *chr)
 {
     char *nodename;
+    /*
+     * The first UART always always exists. If the security extensions are
+     * enabled, the second UART also always exists. Otherwise, it only exists
+     * if a backend is configured explicitly via '-serial <backend>', where
+     * 'null' creates a dummy backend. This allows enabling the second UART
+     * explicitly on demand and does not interfere with any existing setup t=
hat
+     * just expect one (or two if security extensions are enabled) UARTs.
+     */
+    switch(uart) {
+    case VIRT_UART0:
+        break;
+    case VIRT_UART1:
+        if (!vms->secure && !chr) {
+            return;
+        }
+        break;
+    default:
+        error_report("unsupported UART ID %d", uart);
+        exit(1);
+    }
+
     hwaddr base =3D vms->memmap[uart].base;
     hwaddr size =3D vms->memmap[uart].size;
     int irq =3D vms->irqmap[uart];
@@ -854,6 +875,7 @@ static void create_uart(const VirtMachineState *vms, int =
uart,
=20
     qdev_prop_set_chr(dev, "chardev", chr);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    /* if security extensions are enabled, 'mem' is 'secure_sysmem' for UART=
1 */
     memory_region_add_subregion(mem, base,
                                 sysbus_mmio_get_region(s, 0));
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
@@ -873,15 +895,21 @@ static void create_uart(const VirtMachineState *vms, in=
t uart,
     qemu_fdt_setprop(ms->fdt, nodename, "clock-names",
                          clocknames, sizeof(clocknames));
=20
-    if (uart =3D=3D VIRT_UART) {
+    switch(uart) {
+    case VIRT_UART0:
         qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
-    } else {
-        /* Mark as not usable by the normal world */
-        qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
-
-        qemu_fdt_setprop_string(ms->fdt, "/secure-chosen", "stdout-path",
-                                nodename);
+        break;
+    case VIRT_UART1:
+        if (vms->secure) {
+            qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
+            qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "oka=
y");
+            qemu_fdt_setprop_string(ms->fdt, "/secure-chosen", "stdout-path",
+                                    nodename);
+        }
+        break;
+    default:
+        /* noting special */
+        break;
     }
=20
     g_free(nodename);
@@ -2222,11 +2250,12 @@ static void machvirt_init(MachineState *machine)
=20
     fdt_add_pmu_nodes(vms);
=20
-    create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
+    create_uart(vms, VIRT_UART0, sysmem, serial_hd(0));
+    create_uart(vms, VIRT_UART1, vms->secure ? secure_sysmem : sysmem,
+                serial_hd(1));
=20
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem, secure_tag_sysmem);
-        create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
     }
=20
     if (tag_sysmem) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b..90563c132b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -69,7 +69,7 @@ enum {
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
     VIRT_SMMU,
-    VIRT_UART,
+    VIRT_UART0,
     VIRT_MMIO,
     VIRT_RTC,
     VIRT_FW_CFG,
@@ -79,7 +79,7 @@ enum {
     VIRT_PCIE_ECAM,
     VIRT_PLATFORM_BUS,
     VIRT_GPIO,
-    VIRT_SECURE_UART,
+    VIRT_UART1, /* secure UART if vms->secure */
     VIRT_SECURE_MEM,
     VIRT_SECURE_GPIO,
     VIRT_PCDIMM_ACPI,
--=20
2.34.5

