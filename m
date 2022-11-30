Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7076F63E056
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0SFs-0000mx-L6; Wed, 30 Nov 2022 13:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFn-0000lg-9s; Wed, 30 Nov 2022 13:56:19 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFl-0001LS-Mt; Wed, 30 Nov 2022 13:56:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C713611F2CA;
 Wed, 30 Nov 2022 18:56:16 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 30 Nov 2022 18:14:29 +0100
Subject: [PATCH qemu.git 1/1] hw/arm/virt: add 2x sp804 timer
Message-ID: <166983457648.13115.4940680286975412418-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166983457648.13115.4940680286975412418-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add 2x sp804 timer devices.

Co-Authored-by: Florian Hauschild <florian.hauschild@hensoldt.net>
Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/Kconfig           |  1 +
 hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  2 ++
 4 files changed, 51 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..9ad5a3e048 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -28,6 +28,7 @@ The virt board supports:
 - Flash memory
 - One PL011 UART
 - An RTC
+- Two SP804 Dual-Timers
 - The fw_cfg device that allows a guest to obtain data from QEMU
 - A PL061 GPIO controller
 - An optional SMMUv3 IOMMU
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1c..9be8ebcc5b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -18,6 +18,7 @@ config ARM_VIRT
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
+    select ARM_TIMER # sp804
     select GPIO_PWR
     select PLATFORM_BUS
     select SMBIOS
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b871350856..ae043ce04e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -154,6 +154,8 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_NVDIMM_ACPI] =3D        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =3D             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =3D        { 0x090b0000, 0x00001000 },
+    [VIRT_TIMER0] =3D             { 0x090c0000, 0x00001000 },
+    [VIRT_TIMER1] =3D             { 0x090d0000, 0x00001000 },
     [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size =
*/
     [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
@@ -190,6 +192,8 @@ static const int a15irqmap[] =3D {
     [VIRT_GPIO] =3D 7,
     [VIRT_SECURE_UART] =3D 8,
     [VIRT_ACPI_GED] =3D 9,
+    [VIRT_TIMER0] =3D 10,
+    [VIRT_TIMER1] =3D 11,
     [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] =3D 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -236,6 +240,46 @@ static void create_randomness(MachineState *ms, const ch=
ar *node)
     qemu_fdt_setprop(ms->fdt, node, "rng-seed", seed.rng, sizeof(seed.rng));
 }
=20
+static void create_timer(const VirtMachineState *vms, int timer_id)
+{
+    switch (timer_id) {
+        case VIRT_TIMER0:
+        case VIRT_TIMER1:
+            break;
+        default:
+            error_report("timer ID %d unsupported", timer_id);
+            exit(1);
+    }
+
+    MemMapEntry *entry =3D &(vms->memmap[timer_id]);
+    int irq =3D vms->irqmap[timer_id];
+    MachineState *ms =3D MACHINE(vms);
+
+    sysbus_create_simple("sp804", entry->base, qdev_get_gpio_in(vms->gic, ir=
q));
+
+    char *nodename =3D g_strdup_printf("/sp804@%" PRIx64, entry->base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+
+    const char compat[] =3D "arm,sp804\0arm,primecell";
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat)=
);
+
+    const char clocknames[] =3D "timerclk0\0timerclk1\0apb_pclk";
+    qemu_fdt_setprop(ms->fdt, nodename, "clock-names",
+                         clocknames, sizeof(clocknames));
+
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, entry->base,
+                                 2, entry->size);
+
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "clocks",
+                               vms->clock_phandle, vms->clock_phandle);
+
+    g_free(nodename);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms =3D MACHINE(vms);
@@ -2238,6 +2282,9 @@ static void machvirt_init(MachineState *machine)
=20
     create_rtc(vms);
=20
+    create_timer(vms, VIRT_TIMER0);
+    create_timer(vms, VIRT_TIMER1);
+
     create_pcie(vms);
=20
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b..90fdf0b05a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,8 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_TIMER0,
+    VIRT_TIMER1,
     VIRT_LOWMEMMAP_LAST,
 };
=20
--=20
2.34.5

