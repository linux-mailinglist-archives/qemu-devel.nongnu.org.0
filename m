Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD0558C62
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:45:13 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XRg-00018R-LL
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKC-00089w-3Q
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:29 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:28776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK5-00087J-KL
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:27 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2tAa002361
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=edMA9bUDiTeK2gcsy2+X3JjRYJ87pb/0uBMsVGVb1OU=;
 b=A6Mhz7KRbKou40iRBW+E3+7Hte0ZYUAhNIn37Ba05UMALUJs1xOQV7VdmCDDpRMgc/Qu
 x+7WOF6GKCiLv3JW2FdNZMIfdqAnHVvh8i+7bpBint0WPLuxMxm/npbAQB8mdLfL0iAZ
 jOt8Amw7pYLo6GUFNz94n/J2x5kHWCVlb8g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gv2nav1ad-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:19 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:17 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 330CA88BA295; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 2/8] aspeed: Add memory property to Aspeed SoC
Date: Thu, 23 Jun 2022 17:36:55 -0700
Message-ID: <20220624003701.1363500-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CGUXMfazXRYkSI6mkpbYDM8vxMdzSIrm
X-Proofpoint-GUID: CGUXMfazXRYkSI6mkpbYDM8vxMdzSIrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multi-SoC machines can use this property to specify a memory container
for each SoC. Single SoC machines will just specify get_system_memory().

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c             |  4 ++++
 hw/arm/aspeed_ast10x0.c     |  5 ++---
 hw/arm/aspeed_ast2600.c     |  4 ++--
 hw/arm/aspeed_soc.c         | 14 ++++++++------
 include/hw/arm/aspeed_soc.h |  1 +
 5 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index dc09773b0b..b43dc0fda8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -329,6 +329,8 @@ static void aspeed_machine_init(MachineState *machine=
)
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_stra=
p2,
                             &error_abort);
+    object_property_set_link(OBJECT(&bmc->soc), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
@@ -1336,6 +1338,8 @@ static void aspeed_minibmc_machine_init(MachineStat=
e *machine)
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_=
name);
     qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
=20
+    object_property_set_link(OBJECT(&bmc->soc), "memory",
+                             OBJECT(get_system_memory()), &error_abort);
     qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
                          amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 5df480a21f..e074f80cc7 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -148,7 +148,6 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
 {
     AspeedSoCState *s =3D ASPEED_SOC(dev_soc);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
-    MemoryRegion *system_memory =3D get_system_memory();
     DeviceState *armv7m;
     Error *err =3D NULL;
     int i;
@@ -172,7 +171,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
-                             OBJECT(system_memory), &error_abort);
+                             OBJECT(s->memory), &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
=20
     /* Internal SRAM */
@@ -181,7 +180,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(system_memory,
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM],
                                 &s->sram);
=20
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f950fff070..d8e5b607e9 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -295,7 +295,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000=
,
                                 &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
-                                 OBJECT(get_system_memory()), &error_abo=
rt);
+                                 OBJECT(s->memory), &error_abort);
=20
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
@@ -333,7 +333,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(),
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
=20
     /* DPMCU */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 06e5629800..3b531519e9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -248,7 +248,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     /* CPU */
     for (i =3D 0; i < sc->num_cpus; i++) {
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
-                                 OBJECT(get_system_memory()), &error_abo=
rt);
+                                 OBJECT(s->memory), &error_abort);
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
@@ -261,7 +261,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         error_propagate(errp, err);
         return;
     }
-    memory_region_add_subregion(get_system_memory(),
+    memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
=20
     /* SCU */
@@ -456,6 +456,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] =3D {
+    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGIO=
N,
+                     MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
@@ -555,14 +557,14 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
     int i, uart;
=20
     /* Attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
     for (i =3D 1, uart =3D ASPEED_DEV_UART1; i < sc->uarts_num; i++, uar=
t++) {
         if (uart =3D=3D s->uart_default) {
             uart++;
         }
-        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+        serial_mm_init(s->memory, sc->memmap[uart], 2,
                        aspeed_soc_get_irq(s, uart), 38400,
                        serial_hd(i), DEVICE_LITTLE_ENDIAN);
     }
@@ -596,7 +598,7 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **=
errp)
     memory_region_add_subregion_overlap(&s->dram_container, ram_size,
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1=
000);
=20
-    memory_region_add_subregion(get_system_memory(),
-                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SDRAM],
+                                &s->dram_container);
     return true;
 }
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e8a104823d..c8e903b821 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -49,6 +49,7 @@ struct AspeedSoCState {
     ARMCPU cpu[ASPEED_CPUS_NUM];
     A15MPPrivState     a7mpcore;
     ARMv7MState        armv7m;
+    MemoryRegion *memory;
     MemoryRegion *dram_mr;
     MemoryRegion dram_container;
     MemoryRegion sram;
--=20
2.30.2


