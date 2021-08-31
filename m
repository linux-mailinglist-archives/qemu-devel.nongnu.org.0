Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97043FCFF5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 01:34:16 +0200 (CEST)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLDGh-0007nL-7w
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 19:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mLDEW-0006CE-Bb
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 19:32:00 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:6694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mLDEU-0003No-Am
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 19:32:00 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VNE36I019701
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 16:31:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=ArJ7A304NXOfou4bnSsYVp5J3WAA6e1k3Nqw6AE4mTY=;
 b=OGrkrm1tHBY2rEx+8g+aNigwH7/OBE6iwVLN0pIPpwXvrWgNPJcMCVpt5fkH3NMZxBld
 jvxvxWWMkjd+gqWOFVDxL5fFkNvW4W1C/uVBTmkZBRS01efbPd/2qVXrQPaxOG4JIKgQ
 aVrcD2U4uNkq8vvXoEOwoicJ08piYdS4OHc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3asvpw0nuy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 16:31:56 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 16:31:55 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 7D995172C90E; Tue, 31 Aug 2021 16:31:52 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <andrew@aj.id.au>, <f4bug@amsat.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 1/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
Date: Tue, 31 Aug 2021 16:31:40 -0700
Message-ID: <20210831233140.2659116-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831233140.2659116-1-pdel@fb.com>
References: <20210831233140.2659116-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: somjNRq72WcLv5s246qJOBB3Hc7K57bT
X-Proofpoint-GUID: somjNRq72WcLv5s246qJOBB3Hc7K57bT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_09:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310128
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=88771d3da1=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

When you run QEMU with an Aspeed machine and a single serial device
using stdio like this:

    qemu -machine ast2600-evb -drive ... -serial stdio

The guest OS can read and write to the UART5 registers at 0x1E784000 and
it will receive from stdin and write to stdout. The Aspeed SoC's have a
lot more UART's though (AST2500 has 5, AST2600 has 13) and depending on
the board design, may be using any of them as the serial console. (See
"stdout-path" in a DTS to check which one is chosen).

Most boards, including all of those currently defined in
hw/arm/aspeed.c, just use UART5, but some use UART1. This change adds
some flexibility for different boards without requiring users to change
their command-line invocation of QEMU.

I tested this doesn't break existing code by booting an AST2500 OpenBMC
image and an AST2600 OpenBMC image, each using UART5 as the console.

Then I tested switching the default to UART1 and booting an AST2600
OpenBMC image that uses UART1, and that worked too.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c         |  1 +
 hw/arm/aspeed_ast2600.c | 11 +++++++----
 hw/arm/aspeed_soc.c     |  9 ++++++---
 include/hw/arm/aspeed.h |  1 +
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51..74379907ff 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -804,6 +804,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_parallel =3D 1;
     mc->default_ram_id =3D "ram";
     amc->macs_mask =3D ASPEED_MAC0_ON;
+    amc->serial_hd0 =3D ASPEED_DEV_UART5;
=20
     aspeed_machine_class_props_init(oc);
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c6..361a456214 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
+#include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/module.h"
@@ -231,6 +232,8 @@ static uint64_t aspeed_calc_affinity(int cpu)
 static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 {
     int i;
+    AspeedMachineState *bmc =3D ASPEED_MACHINE(qdev_get_machine());
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCState *s =3D ASPEED_SOC(dev);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     Error *err =3D NULL;
@@ -322,10 +325,10 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* Wire up the first serial device, usually either UART5 or UART1 */
+    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
+                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3ad6c56fa9..77422bbeb1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
+#include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/module.h"
@@ -221,6 +222,8 @@ static void aspeed_soc_init(Object *obj)
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
+    AspeedMachineState *bmc =3D ASPEED_MACHINE(qdev_get_machine());
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCState *s =3D ASPEED_SOC(dev);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     Error *err =3D NULL;
@@ -287,9 +290,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
+    /* Wire up the first serial device, usually either UART5 or UART1 */
+    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
+                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index c9747b15fc..bc0f27885a 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -38,6 +38,7 @@ struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
+    uint32_t serial_hd0;
 };
=20
=20
--=20
2.30.2


