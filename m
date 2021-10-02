Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668641FE51
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 23:52:52 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWmw7-00070f-Ez
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 17:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmoT-0002FN-BF
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:57 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:60492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=99090ed790=pdel@fb.com>)
 id 1mWmoR-0006ei-IQ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 17:44:56 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 192JP06w012076
 for <qemu-devel@nongnu.org>; Sat, 2 Oct 2021 14:44:54 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bewj48eru-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 14:44:54 -0700
Received: from intmgw003.48.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sat, 2 Oct 2021 14:44:22 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 6AFE851973DD; Sat,  2 Oct 2021 14:44:15 -0700 (PDT)
From: <pdel@fbc.om>
To: 
Subject: [PATCH 2/2] hw/arm: Integrate ADC model into Aspeed SoC
Date: Sat, 2 Oct 2021 14:44:14 -0700
Message-ID: <20211002214414.2858382-3-pdel@fbc.om>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211002214414.2858382-1-pdel@fbc.om>
References: <20211002214414.2858382-1-pdel@fbc.om>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: vY-Q-50-oufood8kG3X4iMPpLCO_nTRp
X-Proofpoint-GUID: vY-Q-50-oufood8kG3X4iMPpLCO_nTRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-02_07,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1034 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=906 priorityscore=1501
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110020158
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=99090ed790=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Oct 2021 17:49:27 -0400
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, alistair@alistair23.me,
 qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org,
 Peter Delevoryas <pdel@fb.com>, zhdaniel@fb.com, joel@jms.id.au
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


