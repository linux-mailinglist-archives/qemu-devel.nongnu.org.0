Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179014F051
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 17:02:06 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYk9-0006DX-EM
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 11:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXzF-0006CX-4n
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXzD-0006tl-Bt
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52197
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXzD-0006sK-6Y
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/V1sPplJvKqepdTEO2MVvkG8XlPvKW/sYjLdsbSB18=;
 b=fT996l6+Rff5VPlJP+sdrEDsR8CIXigwPMBa3vLJukpLBzQ3FeV8c74KLByQPJ/MDiEPcU
 bI12gkvJtua7PVnFARNIjYfbqXANxIy84g7Ex87gPXa5OEweHpu+Aen74CbAL70JkkFJyW
 l7gj4zShWV6RPNDM8al9Vz6iMky0mLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-AYFBzrYFOhKFH2aauhdknA-1; Fri, 31 Jan 2020 10:13:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D796118C43C0;
 Fri, 31 Jan 2020 15:13:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8D9186C4B;
 Fri, 31 Jan 2020 15:13:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 71/80] sparc/sun4m: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:41 +0100
Message-Id: <1580483390-131164-72-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: AYFBzrYFOhKFH2aauhdknA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Patch moves ram size check into sun4m_hw_init() and drops
ram_init() moving remainder to sun4m_hw_init() as well,
as it was the only place that called it.

Also it rewrites impl. of RamDevice a little bit, which
could serve as an example of frontend device for RAM backend.
(Caveats are:
  1. it doesn't check for memdev backend being mapped
     since it's been  usurped by generic machine to handle
     majority of machines which don't have RAM frontend device
  2. it still lacks 'addr' property and still has hardcoded
     sysbus_mmio_map() in board init. If done right, board should
     set 'addr' property and bus/machine plug handler should map
     it during device realize time.
)
Further improvements were left as exercise for the future,
since frontends are out scope of RAM conversion to memdev.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v4:
  * 'machine: introduce memory-backend property' patch changed
    'memory-backend' property from link to backend id to allow for
    delayed initialization. Take that in account and add resolving
    machine->ram_memdev_id into backend pointer before setting link
    on RamDevice.

CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: atar4qemu@gmail.com
---
 hw/sparc/sun4m.c | 74 ++++++++++++++++++++++++++++------------------------=
----
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 25e96db..f5bf95f 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -777,63 +777,42 @@ static const TypeInfo prom_info =3D {
=20
 typedef struct RamDevice {
     SysBusDevice parent_obj;
-
-    MemoryRegion ram;
-    uint64_t size;
+    HostMemoryBackend *memdev;
 } RamDevice;
=20
 /* System RAM */
 static void ram_realize(DeviceState *dev, Error **errp)
 {
     RamDevice *d =3D SUN4M_RAM(dev);
-    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    MemoryRegion *ram =3D host_memory_backend_get_memory(d->memdev);
=20
-    memory_region_allocate_system_memory(&d->ram, OBJECT(d), "sun4m.ram",
-                                         d->size);
-    sysbus_init_mmio(sbd, &d->ram);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), ram);
 }
=20
-static void ram_init(hwaddr addr, ram_addr_t RAM_size,
-                     uint64_t max_mem)
+static void ram_initfn(Object *obj)
 {
-    DeviceState *dev;
-    SysBusDevice *s;
-    RamDevice *d;
-
-    /* allocate RAM */
-    if ((uint64_t)RAM_size > max_mem) {
-        error_report("Too much memory for this machine: %" PRId64 ","
-                     " maximum %" PRId64,
-                     RAM_size / MiB, max_mem / MiB);
-        exit(1);
-    }
-    dev =3D qdev_create(NULL, "memory");
-    s =3D SYS_BUS_DEVICE(dev);
-
-    d =3D SUN4M_RAM(dev);
-    d->size =3D RAM_size;
-    qdev_init_nofail(dev);
-
-    sysbus_mmio_map(s, 0, addr);
+    RamDevice *d =3D SUN4M_RAM(obj);
+    object_property_add_link(obj, "memdev", TYPE_MEMORY_BACKEND,
+                             (Object **)&d->memdev,
+                             object_property_allow_set_link,
+                             OBJ_PROP_LINK_STRONG, &error_abort);
+    object_property_set_description(obj, "memdev", "Set RAM backend"
+                                    "Valid value is ID of a hostmem backen=
d",
+                                     &error_abort);
 }
=20
-static Property ram_properties[] =3D {
-    DEFINE_PROP_UINT64("size", RamDevice, size, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void ram_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D ram_realize;
-    device_class_set_props(dc, ram_properties);
 }
=20
 static const TypeInfo ram_info =3D {
     .name          =3D TYPE_SUN4M_MEMORY,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(RamDevice),
+    .instance_init =3D ram_initfn,
     .class_init    =3D ram_class_init,
 };
=20
@@ -879,6 +858,15 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hw=
def,
     SysBusDevice *s;
     unsigned int smp_cpus =3D machine->smp.cpus;
     unsigned int max_cpus =3D machine->smp.max_cpus;
+    Object *ram_memdev =3D object_resolve_path_type(machine->ram_memdev_id=
,
+                                                  TYPE_MEMORY_BACKEND, NUL=
L);
+
+    if (machine->ram_size > hwdef->max_mem) {
+        error_report("Too much memory for this machine: %" PRId64 ","
+                     " maximum %" PRId64,
+                     machine->ram_size / MiB, hwdef->max_mem / MiB);
+        exit(1);
+    }
=20
     /* init CPUs */
     for(i =3D 0; i < smp_cpus; i++) {
@@ -888,9 +876,12 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hw=
def,
     for (i =3D smp_cpus; i < MAX_CPUS; i++)
         cpu_irqs[i] =3D qemu_allocate_irqs(dummy_cpu_set_irq, NULL, MAX_PI=
LS);
=20
+    /* Create and map RAM frontend */
+    dev =3D qdev_create(NULL, "memory");
+    object_property_set_link(OBJECT(dev), ram_memdev, "memdev", &error_fat=
al);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0);
=20
-    /* set up devices */
-    ram_init(0, machine->ram_size, hwdef->max_mem);
     /* models without ECC don't trap when missing ram is accessed */
     if (!hwdef->ecc_base) {
         empty_slot_init(machine->ram_size, hwdef->max_mem - machine->ram_s=
ize);
@@ -1078,7 +1069,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *h=
wdef,
=20
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, hwdef->machine_id);
     fw_cfg_add_i16(fw_cfg, FW_CFG_SUN4M_DEPTH, graphic_depth);
     fw_cfg_add_i16(fw_cfg, FW_CFG_SUN4M_WIDTH, graphic_width);
@@ -1415,6 +1406,7 @@ static void ss5_class_init(ObjectClass *oc, void *dat=
a)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss5_type =3D {
@@ -1434,6 +1426,7 @@ static void ss10_class_init(ObjectClass *oc, void *da=
ta)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss10_type =3D {
@@ -1453,6 +1446,7 @@ static void ss600mp_class_init(ObjectClass *oc, void =
*data)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss600mp_type =3D {
@@ -1472,6 +1466,7 @@ static void ss20_class_init(ObjectClass *oc, void *da=
ta)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss20_type =3D {
@@ -1490,6 +1485,7 @@ static void voyager_class_init(ObjectClass *oc, void =
*data)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo voyager_type =3D {
@@ -1508,6 +1504,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *d=
ata)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss_lx_type =3D {
@@ -1526,6 +1523,7 @@ static void ss4_class_init(ObjectClass *oc, void *dat=
a)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo ss4_type =3D {
@@ -1544,6 +1542,7 @@ static void scls_class_init(ObjectClass *oc, void *da=
ta)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo scls_type =3D {
@@ -1562,6 +1561,7 @@ static void sbook_class_init(ObjectClass *oc, void *d=
ata)
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display =3D "tcx";
+    mc->default_ram_id =3D "sun4m.ram";
 }
=20
 static const TypeInfo sbook_type =3D {
--=20
2.7.4


