Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94B525A84
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 06:08:20 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npMbD-0002HH-9u
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 00:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY3-0007iw-TF
 for qemu-devel@nongnu.org; Fri, 13 May 2022 00:05:03 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY0-0006EP-R5
 for qemu-devel@nongnu.org; Fri, 13 May 2022 00:05:02 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D0ZGYf009683
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 21:04:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=unxFmsA21oO88hQqz1WTAO4u7MbdUrcf6MsuDEBoRA8=;
 b=E9GA4CCrHcLIOEdbwMe7xFGCI+4qCei0QvMo+iG1hNuQExupItMRVsXyo8C1leTd2a+w
 168NbHtUYAndVjD+Lmfrp6mYjOGLESeutQ+DLUIpqF7ERf23xE93boplo7TsrYcB1NaQ
 EoAHu4uvbFCK7lSjyVsnWzQgIW9O6ALoXpY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g1cwx8rfp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 21:04:58 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 21:04:57 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id C648762D7867; Thu, 12 May 2022 21:02:20 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <patrick@stwcx.xyz>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <clg@kaod.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Date: Thu, 12 May 2022 21:02:20 -0700
Message-ID: <20220513040220.3657135-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513040220.3657135-1-pdel@fb.com>
References: <20220513040220.3657135-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: RP7Y77_k3BBWPKVkmmQ1Kd-fswIcHSpv
X-Proofpoint-ORIG-GUID: RP7Y77_k3BBWPKVkmmQ1Kd-fswIcHSpv
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=613212e35b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Usually, QEMU users just provide one serial device on the command line,
either through "-nographic" or "-serial stdio -display none", or just using
VNC and popping up a window. We try to match what the user expects, which is
to connect the first (and usually only) serial device to the UART a board is
using as serial0.

Most Aspeed machines in hw/arm/aspeed.c use UART5 for serial0 in their
device tree, so we connect UART5 to the first serial device. Some machines
use UART1 though, or UART3, so the uart_default property lets us specify
that in a board definition.

In order to specify a nonstandard serial0 UART, a user basically *must* add
a new board definition in hw/arm/aspeed.c. There's no way to do this without
recompiling QEMU, besides constructing the machine completely from scratch
on the command line.

To provide more flexibility, we can also support the user specifying more
serial devices, and connect them to the UART memory regions if possible.
Even if a user doesn't specify any extra serial devices, it's useful to
initialize these memory regions as UART's, so that they respond to the guest
OS more naturally. At the moment, they will just always return zero's for
everything, and some UART registers have a default non-zero state.

With this change, if a new OpenBMC image uses UART3 or some other
nonstandard UART for serial0, you can still use it with the EVB without
recompiling QEMU, even though uart-default=3DUART5 for the EVB.

For example, Facebook's Wedge100 BMC uses UART3: you can fetch an image from
Github[1] and get the serial console output even while running the palmetto
machine type, because we explicitly specify that we want UART3 to be
connected to stdio.

    qemu-system-arm -machine palmetto-bmc \
        -drive file=3Dwedge100.mtd,format=3Draw,if=3Dmtd \
        -serial null -serial null -serial null -serial stdio -display none

Similarly, you can boot a Fuji BMC image[2], which uses UART1, using the
AST2600 EVB machine:

    qemu-system-arm -machine ast2600-evb \
        -drive file=3Dfuji.mtd,format=3Draw,if=3Dmtd \
        -serial null -serial stdio -display none

This is kind of complicated, of course: it might be more natural to get rid
of the uart_default attribute completely, and initialize UART's
sequentially. But, keeping backward compatibility and the way most users
know how to use QEMU in mind, this seems to make the most sense.

[1] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge1=
00.mtd
[2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.m=
td

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c | 14 +++++++++++---
 hw/arm/aspeed_ast2600.c | 10 +++++++++-
 hw/arm/aspeed_soc.c     | 10 +++++++++-
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index f65dc139da..5e6f3a8fed 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -215,10 +215,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *d=
ev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kc=
s_4));
=20
-    /* UART5 - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+    /* UART - attach 8250's to the IO space for each UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default),
                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    for (int i =3D 1, uart =3D ASPEED_DEV_UART1; i < 13; i++, uart++) {
+        if (uart =3D=3D s->uart_default) {
+            uart++;
+        }
+        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
+                       DEVICE_LITTLE_ENDIAN);
+    }
=20
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1b72800682..cbeca7f655 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -372,10 +372,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
+    /* UART - attach 8250's to the IO space for each UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    for (int i =3D 1, uart =3D ASPEED_DEV_UART1; i < 13; i++, uart++) {
+        if (uart =3D=3D s->uart_default) {
+            uart++;
+        }
+        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
+                       DEVICE_LITTLE_ENDIAN);
+    }
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2cd03d49da..1fc1ed808d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -303,10 +303,18 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
+    /* UART - attach 8250's to the IO space for each UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    for (int i =3D 1, uart =3D ASPEED_DEV_UART1; i < 5; i++, uart++) {
+        if (uart =3D=3D s->uart_default) {
+            uart++;
+        }
+        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+                       aspeed_soc_get_irq(s, uart), 38400, serial_hd(i),
+                       DEVICE_LITTLE_ENDIAN);
+    }
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
--=20
2.30.2


