Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58443421DF7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 07:30:43 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXd2I-0007Qe-AY
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 01:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99121193c4=pdel@fb.com>)
 id 1mXd0K-0005rX-C3
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 01:28:40 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:64502
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99121193c4=pdel@fb.com>)
 id 1mXd0I-00020w-L0
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 01:28:40 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 1953jEQ2030251
 for <qemu-devel@nongnu.org>; Mon, 4 Oct 2021 22:28:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=facebook;
 bh=Ex3XhDUg+/maY50mfPmYC9VbnuQumJpSjE5fM9wnAIo=;
 b=grJT7QLwn8yk5MgKfLIAbGh8USc8MOpPr6VzghcFH4NppDoMCR9VmfNQF7b2QRaeAnMA
 m0PTylNWUxH61VIn/aTcW179eEfe4OEq1/DLMvaIPB1J5UCFBd7ERSen7bjg9QUDW7un
 tK+kd982UABhNFcwhMimIB9V8DUG2mvYbKI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 3bg9jbap5t-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 22:28:37 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 4 Oct 2021 22:28:33 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id DB049534616D; Mon,  4 Oct 2021 22:26:05 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <alistair@alistair23.me>, <peter.maydell@linaro.org>, <clg@kaod.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <zhdaniel@fb.com>, <patrick@stwcx.xyz>,
 <billy_tsai@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v3 2/2] hw/arm: Integrate ADC model into Aspeed SoC
Date: Mon, 4 Oct 2021 22:26:04 -0700
Message-ID: <20211005052604.1674891-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005052604.1674891-1-pdel@fb.com>
References: <20211005052604.1674891-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-GUID: ozy8SYz8Heot1NsSPaoiTfuNPr1RdE3m
X-Proofpoint-ORIG-GUID: ozy8SYz8Heot1NsSPaoiTfuNPr1RdE3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 adultscore=0 mlxlogscore=888 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110050030
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=99121193c4=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c     | 11 +++++++++++
 hw/arm/aspeed_soc.c         | 11 +++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d70e8e060..d553ee2388 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -148,6 +148,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
=20
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
=20
@@ -322,6 +325,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_AD=
C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index ed84502e23..aaec2bba38 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -162,6 +162,9 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
=20
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
=20
@@ -287,6 +290,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_AD=
C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 87d76c9259..8139358549 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -15,6 +15,7 @@
 #include "hw/cpu/a15mpcore.h"
 #include "hw/intc/aspeed_vic.h"
 #include "hw/misc/aspeed_scu.h"
+#include "hw/adc/aspeed_adc.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/misc/aspeed_xdma.h"
 #include "hw/timer/aspeed_timer.h"
@@ -53,6 +54,7 @@ struct AspeedSoCState {
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
+    AspeedADCState adc;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
--=20
2.30.2


