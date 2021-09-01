Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E4A3FDF0C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:52:38 +0200 (CEST)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSXV-0006PC-Dv
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLSHv-0002AT-M2
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:36:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:41164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLSHr-0002Ha-TZ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:36:31 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181FSskB027350
 for <qemu-devel@nongnu.org>; Wed, 1 Sep 2021 08:36:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=G2K1jt//5bj99e79ZPLZf8+qyEA8Ilpr7FBj/5VrCUs=;
 b=VSJf0IOzEBBxioGHTJgRtzlRD5Q73We7fHMroCAwxpicPkhmshju9lV8OdiVCugBnNeQ
 lpN8CPGuTyzwfO3vJBr0rcq43/SKPpirGf7JsEiulEP2Z8lb4Ywf4WlaKb9s9dHNwRPt
 JNVbZRJMQ8dwbWj88ZArhr0UM8IERJN1RFg= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3asmx9n2sv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:36:26 -0700
Received: from intmgw002.48.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 08:36:23 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id DEF7917A3EA6; Wed,  1 Sep 2021 08:36:18 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <f4bug@amsat.org>, <patrick@stwcx.xyz>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 0/1] hw/arm/aspeed: Allow machine to set UART default
Date: Wed, 1 Sep 2021 08:36:14 -0700
Message-ID: <20210901153615.2746885-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: 105D53tGGswbZl0-I2bJE8e6hacIPZES
X-Proofpoint-GUID: 105D53tGGswbZl0-I2bJE8e6hacIPZES
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010090
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v1: https://lore.kernel.org/qemu-devel/20210831233140.2659116-1-pdel@fb.com/
v2:
- Replaced AspeedMachineClass "serial_hd0" with "uart_default"
- Removed "qdev_get_machine()" usage
- Removed unnecessary aspeed.h (machine class) includes in device files
- Added "uint32_t uart_default" to AspeedSoCState
- Added "uart-default" uint32 property to AspeedSoCState
- Set "uart-default" just before qdev_realize()

NOTE: Still not totally sure I did this right, especially because I only
initialized the properties in the aspeed_soc.c file (2400 + 2500), but
not aspeed_ast2600.c (2600), but I guess that's because
aspeed_soc_class_init is common to all the SoC's.

Peter Delevoryas (1):
  hw/arm/aspeed: Allow machine to set UART default

 hw/arm/aspeed.c             | 3 +++
 hw/arm/aspeed_ast2600.c     | 8 ++++----
 hw/arm/aspeed_soc.c         | 9 ++++++---
 include/hw/arm/aspeed.h     | 1 +
 include/hw/arm/aspeed_soc.h | 1 +
 5 files changed, 15 insertions(+), 7 deletions(-)

Interdiff against v1:
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 74379907ff..a81e90c539 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -350,6 +350,8 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
=20
     memory_region_add_subregion(get_system_memory(),
@@ -804,7 +806,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, =
void *data)
     mc->no_parallel =3D 1;
     mc->default_ram_id =3D "ram";
     amc->macs_mask =3D ASPEED_MAC0_ON;
-    amc->serial_hd0 =3D ASPEED_DEV_UART5;
+    amc->uart_default =3D ASPEED_DEV_UART5;
=20
     aspeed_machine_class_props_init(oc);
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 361a456214..b07fcf10a0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -10,7 +10,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
-#include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/module.h"
@@ -232,8 +231,6 @@ static uint64_t aspeed_calc_affinity(int cpu)
 static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 {
     int i;
-    AspeedMachineState *bmc =3D ASPEED_MACHINE(qdev_get_machine());
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCState *s =3D ASPEED_SOC(dev);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     Error *err =3D NULL;
@@ -325,9 +322,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev=
, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* Wire up the first serial device, usually either UART5 or UART1 */
-    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
-                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 77422bbeb1..09c0f83710 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
-#include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/char/serial.h"
 #include "qemu/module.h"
@@ -222,8 +221,6 @@ static void aspeed_soc_init(Object *obj)
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
-    AspeedMachineState *bmc =3D ASPEED_MACHINE(qdev_get_machine());
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCState *s =3D ASPEED_SOC(dev);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     Error *err =3D NULL;
@@ -290,9 +287,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error =
**errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* Wire up the first serial device, usually either UART5 or UART1 */
-    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_hd0], 2,
-                   aspeed_soc_get_irq(s, amc->serial_hd0), 38400,
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
@@ -442,6 +439,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error =
**errp)
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
+                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -452,6 +451,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void=
 *data)
     dc->realize =3D aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable =3D false;
+
     device_class_set_props(dc, aspeed_soc_properties);
 }
=20
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index bc0f27885a..cbeacb214c 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -38,7 +38,7 @@ struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
-    uint32_t serial_hd0;
+    uint32_t uart_default;
 };
=20
=20
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d9161d26d6..87d76c9259 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -65,6 +65,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    uint32_t uart_default;
 };
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
--=20
2.30.2


