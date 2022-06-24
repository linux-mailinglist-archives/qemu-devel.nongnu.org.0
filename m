Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA339558C60
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:45:05 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XRY-0000r9-S2
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKG-0008E3-Oi
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:33 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:48506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKE-0008DA-W0
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:32 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2tAo002361
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=zTCcotPFtS9j+LJq9h53MsFNp2QN5OBdHEP3f4LIZJk=;
 b=ojMMqyesRGAtI+TWUcZ6VA6c1Isrc0WZTH4kkpZ/9asLHHEzDipbSawF9bC0hYPqdbzN
 G6LHTH/UYmxVeDToJ5YdSk9PH1Lb9gaurVtZbamTqos2vUDvrVE1eHP43pd1XZTXmjgX
 qY/DqUH3bCO1gRu7v1+jVORENSNLi+zDzNo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gv2nav1ad-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:27 -0700
Received: from twshared18213.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:23 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 3851C88BA29A; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 7/8] aspeed: Make aspeed_board_init_flashes public
Date: Thu, 23 Jun 2022 17:37:00 -0700
Message-ID: <20220624003701.1363500-8-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: huG6UffINLjpV_30iOHCQUOH-Whj3CQg
X-Proofpoint-GUID: huG6UffINLjpV_30iOHCQUOH-Whj3CQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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
 hw/arm/aspeed.c             | 25 -------------------------
 hw/arm/aspeed_soc.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 3 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b43dc0fda8..a7352ca837 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -257,31 +257,6 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr =
addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
=20
-static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
-                                      unsigned int count, int unit0)
-{
-    int i;
-
-    if (!flashtype) {
-        return;
-    }
-
-    for (i =3D 0; i < count; ++i) {
-        DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
-        qemu_irq cs_line;
-        DeviceState *dev;
-
-        dev =3D qdev_new(flashtype);
-        if (dinfo) {
-            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo)=
);
-        }
-        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
-
-        cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
-    }
-}
-
 static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
 {
         DeviceState *card;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 16394c8e0b..4183f5ffbf 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -21,6 +21,7 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/blockdev.h"
=20
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
=20
@@ -626,3 +627,28 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s=
, SysBusDevice *dev,
     memory_region_add_subregion_overlap(s->memory, addr,
                                         sysbus_mmio_get_region(dev, 0), =
-1000);
 }
+
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+                               unsigned int count, int unit0)
+{
+    int i;
+
+    if (!flashtype) {
+        return;
+    }
+
+    for (i =3D 0; i < count; ++i) {
+        DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
+        qemu_irq cs_line;
+        DeviceState *dev;
+
+        dev =3D qdev_new(flashtype);
+        if (dinfo) {
+            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo)=
);
+        }
+        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
+
+        cs_line =3D qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+    }
+}
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 6cfc063985..5cd31c1306 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -178,5 +178,7 @@ void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice =
*dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
                                    const char *name, hwaddr addr,
                                    uint64_t size);
+void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
+                               unsigned int count, int unit0);
=20
 #endif /* ASPEED_SOC_H */
--=20
2.30.2


