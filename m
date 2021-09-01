Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F03FDFD4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:26:08 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT3v-0003L3-3C
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLSHw-0002CB-UG
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:36:33 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLSHs-0002IE-SE
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:36:32 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181FSmsm027210
 for <qemu-devel@nongnu.org>; Wed, 1 Sep 2021 08:36:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=MBq1vy0WPgsMaP/HP5CupUdC6htwDYYPtDOlxuYnYiY=;
 b=fUDlc/Lf3lAi0qln6UQsYWAzA282y9XfWUI/+WJ6ahI8WjVU+SnnENQr1pygGlbp2wCZ
 lIoPugegjVI6OBGDLEaqAaAoc/jSNssIB+vW4VB650GY4m+JvH5DTXaaPlBOgFuSLjM/
 fpQ+9WIg8cn8iS9tP/c6vPit85/c0zfqjlQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3asmx9n2pd-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:36:27 -0700
Received: from intmgw001.05.prn6.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 08:36:23 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id C902617A3ED8; Wed,  1 Sep 2021 08:36:19 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <f4bug@amsat.org>, <patrick@stwcx.xyz>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 1/1] hw/arm/aspeed: Allow machine to set UART default
Date: Wed, 1 Sep 2021 08:36:15 -0700
Message-ID: <20210901153615.2746885-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901153615.2746885-1-pdel@fb.com>
References: <20210901153615.2746885-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: f-vDDLMvutGBOj-r1hNM85rhJ9IJXqTd
X-Proofpoint-GUID: f-vDDLMvutGBOj-r1hNM85rhJ9IJXqTd
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
 hw/arm/aspeed.c             | 3 +++
 hw/arm/aspeed_ast2600.c     | 8 ++++----
 hw/arm/aspeed_soc.c         | 9 ++++++---
 include/hw/arm/aspeed.h     | 1 +
 include/hw/arm/aspeed_soc.h | 1 +
 5 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51..a81e90c539 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -350,6 +350,8 @@ static void aspeed_machine_init(MachineState *machine=
)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
=20
     memory_region_add_subregion(get_system_memory(),
@@ -804,6 +806,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_parallel =3D 1;
     mc->default_ram_id =3D "ram";
     amc->macs_mask =3D ASPEED_MAC0_ON;
+    amc->uart_default =3D ASPEED_DEV_UART5;
=20
     aspeed_machine_class_props_init(oc);
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c6..b07fcf10a0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -322,10 +322,10 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3ad6c56fa9..09c0f83710 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -287,9 +287,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
+    /* UART - attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
=20
     /* I2C */
@@ -439,6 +439,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
                      MemoryRegion *),
+    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
+                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -449,6 +451,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, vo=
id *data)
     dc->realize =3D aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable =3D false;
+
     device_class_set_props(dc, aspeed_soc_properties);
 }
=20
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index c9747b15fc..cbeacb214c 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -38,6 +38,7 @@ struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
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


