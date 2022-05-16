Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A28527D94
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 08:28:17 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqUDI-0001ok-K2
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 02:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU92-0007Gf-2i
 for qemu-devel@nongnu.org; Mon, 16 May 2022 02:23:52 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:24834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU90-0007R3-DG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 02:23:51 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G2dm6X023330
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 23:23:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=kDV6iV5F7fBqFLCXnJIhHkzMTp2lToozwCevtU/G/aw=;
 b=ZAXiWRAqaEXz7mr6Q7btcPxjNe4m5HpMQULsqhfX06PxAsZlZ68AVQfFFTyao06L8GCi
 lwuPlVC2DVahwv9zSS1hwVASvWV7GU2En14ATTSEZRav9FoE6CD8XB+1nH8p7rOpVS6N
 qukuqKSuR88NdUWzTQ87HcDWpbuafbrwHJQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g29xxf9ys-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 23:23:49 -0700
Received: from twshared3657.05.prn5.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:42 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 1A49964DCACC; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>, <zev@bewilderbeest.net>,
 <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH v2 4/5] hw: aspeed: Introduce common UART init function
Date: Sun, 15 May 2022 23:23:27 -0700
Message-ID: <20220516062328.298336-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: lMu_RtQ4tP9aEu_AjbZO9mQYVN50TMfD
X-Proofpoint-ORIG-GUID: lMu_RtQ4tP9aEu_AjbZO9mQYVN50TMfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 hw/arm/aspeed_ast10x0.c     |  7 ++-----
 hw/arm/aspeed_ast2600.c     |  7 ++-----
 hw/arm/aspeed_soc.c         | 16 ++++++++++++----
 include/hw/arm/aspeed_soc.h |  1 +
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index faafb800f3..938615d55f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -15,7 +15,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
-#include "hw/char/serial.h"
 #include "hw/arm/aspeed_soc.h"
=20
 #define ASPEED_SOC_IOMEM_SIZE 0x00200000
@@ -215,10 +214,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *=
dev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->sc=
u),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a9523074a0..b0a4199b69 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -11,7 +11,6 @@
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
-#include "hw/char/serial.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
@@ -372,10 +371,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7008cd1af7..912798a9c9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -303,10 +303,8 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
@@ -544,3 +542,13 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int d=
ev)
 {
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
+
+void aspeed_soc_uart_init(AspeedSoCState *s)
+{
+    AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
+
+    /* Attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+}
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 669bc49855..02a5a9ffcb 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -164,5 +164,6 @@ enum {
 };
=20
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
+void aspeed_soc_uart_init(AspeedSoCState *s);
=20
 #endif /* ASPEED_SOC_H */
--=20
2.30.2


