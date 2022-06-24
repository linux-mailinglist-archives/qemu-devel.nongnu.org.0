Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0F558C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:44:46 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XRF-0008MB-3I
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK9-00084p-6d
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:25 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:31248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK5-000848-8m
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:23 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2r3k022809
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=6SlvhMCavBBobAXJJDPXciwOF/nZLD9WLBqoNhXiLls=;
 b=CNSgC6MrDp98K2Wl+bismmxvxUs7OPb7vp1I7EHrEHsGFVLNNF03ZjZU03JsoW7N32Bu
 O3snL1LiIefmkWt8Ocz4xRdbQX6LD0hkmZGC382Nokej2+2wTY6gBI3r6RrRe35UHnMW
 WKlklYbJ10wzaz4F9RMiNYN8t8Oc2UXw+tQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvn945bj6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:13 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 34FCA88BA297; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 4/8] aspeed: Map unimplemented devices in SoC memory
Date: Thu, 23 Jun 2022 17:36:57 -0700
Message-ID: <20220624003701.1363500-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jVUyDbzILvoM-k4M8VOreMsuIIbH4ghZ
X-Proofpoint-GUID: jVUyDbzILvoM-k4M8VOreMsuIIbH4ghZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     | 16 ++++++++++------
 hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++---------
 hw/arm/aspeed_soc.c         | 23 +++++++++++++++++++----
 include/hw/arm/aspeed_soc.h |  9 +++++++++
 4 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index f8f321374a..d34c06db16 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -142,6 +142,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_=
DEVICE);
+    object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemen=
ted,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
=20
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **err=
p)
@@ -158,12 +162,12 @@ static void aspeed_soc_ast1030_realize(DeviceState =
*dev_soc, Error **errp)
     }
=20
     /* General I/O memory space to catch all unimplemented device */
-    create_unimplemented_device("aspeed.sbc",
-                                sc->memmap[ASPEED_DEV_SBC],
-                                0x40000);
-    create_unimplemented_device("aspeed.io",
-                                sc->memmap[ASPEED_DEV_IOMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.=
io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sbc_unimplemente=
d),
+                                  "aspeed.sbc", sc->memmap[ASPEED_DEV_SB=
C],
+                                  0x40000);
=20
     /* AST1030 CPU Core */
     armv7m =3D DEVICE(&s->armv7m);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 477dd36042..8693660271 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -246,6 +246,13 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
=20
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_=
DEVICE);
+    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_=
DEVICE);
+    object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_=
DEVICE);
+    object_initialize_child(obj, "emmc-boot-controller",
+                            &s->emmc_boot_controller,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
=20
 /*
@@ -267,21 +274,22 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
     qemu_irq irq;
=20
     /* IO space */
-    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_I=
OMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.=
io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
     /* RAM */
     if (!aspeed_soc_dram_init(s, errp)) {
         return;
     }
=20
     /* Video engine stub */
-    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VI=
DEO],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.=
video",
+                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
=20
     /* eMMC Boot Controller stub */
-    create_unimplemented_device("aspeed.emmc-boot-controller",
-                                sc->memmap[ASPEED_DEV_EMMC_BC],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->emmc_boot_contro=
ller),
+                                  "aspeed.emmc-boot-controller",
+                                  sc->memmap[ASPEED_DEV_EMMC_BC], 0x1000=
);
=20
     /* CPU */
     for (i =3D 0; i < sc->num_cpus; i++) {
@@ -337,8 +345,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
=20
     /* DPMCU */
-    create_unimplemented_device("aspeed.dpmcu", sc->memmap[ASPEED_DEV_DP=
MCU],
-                                ASPEED_SOC_DPMCU_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu), "aspeed.=
dpmcu",
+                                  sc->memmap[ASPEED_DEV_DPMCU],
+                                  ASPEED_SOC_DPMCU_SIZE);
=20
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 46cbc63644..16394c8e0b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -223,6 +223,9 @@ static void aspeed_soc_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_=
DEVICE);
+    object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_=
DEVICE);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -233,8 +236,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     Error *err =3D NULL;
=20
     /* IO space */
-    create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_DEV_I=
OMEM],
-                                ASPEED_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.=
io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  ASPEED_SOC_IOMEM_SIZE);
=20
     /* RAM */
     if (!aspeed_soc_dram_init(s, errp)) {
@@ -242,8 +246,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     }
=20
     /* Video engine stub */
-    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VI=
DEO],
-                                0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->video), "aspeed.=
video",
+                                  sc->memmap[ASPEED_DEV_VIDEO], 0x1000);
=20
     /* CPU */
     for (i =3D 0; i < sc->num_cpus; i++) {
@@ -611,3 +615,14 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice=
 *dev, int n, hwaddr addr)
     memory_region_add_subregion(s->memory, addr,
                                 sysbus_mmio_get_region(dev, n));
 }
+
+void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
+                                   const char *name, hwaddr addr, uint64=
_t size)
+{
+    qdev_prop_set_string(DEVICE(dev), "name", name);
+    qdev_prop_set_uint64(DEVICE(dev), "size", size);
+    sysbus_realize(dev, &error_abort);
+
+    memory_region_add_subregion_overlap(s->memory, addr,
+                                        sysbus_mmio_get_region(dev, 0), =
-1000);
+}
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 1ab328d00c..6cfc063985 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -34,6 +34,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/misc/unimp.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -66,6 +67,7 @@ struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
     AspeedSBCState sbc;
+    UnimplementedDeviceState sbc_unimplemented;
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
@@ -77,6 +79,10 @@ struct AspeedSoCState {
     AspeedLPCState lpc;
     uint32_t uart_default;
     Clock *sysclk;
+    UnimplementedDeviceState iomem;
+    UnimplementedDeviceState video;
+    UnimplementedDeviceState emmc_boot_controller;
+    UnimplementedDeviceState dpmcu;
 };
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -169,5 +175,8 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int de=
v);
 void aspeed_soc_uart_init(AspeedSoCState *s);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr=
 addr);
+void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
+                                   const char *name, hwaddr addr,
+                                   uint64_t size);
=20
 #endif /* ASPEED_SOC_H */
--=20
2.30.2


