Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96E4203A0
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:22:35 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX74E-0007nz-8b
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX71C-0005Wn-WC
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:19:27 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:25206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX71A-00054D-W9
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:19:26 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 193F6ZN4029773
 for <qemu-devel@nongnu.org>; Sun, 3 Oct 2021 12:19:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=o/LzmFX11mtElrb8jkmZBDqYV8D/hFYYIcG5ZEHM/PM=;
 b=HkUXk+5cRr/OW0cZ2A87pniYrdmeyM1e/xdTu7SkpCPFhvldUrcJ6+Dv6EaLfQyqQ//L
 jPY/2nFJKIN6ZOfrZgJdU4T1INVtsXHNKQujBKpW/Yk1mlwb/NqpIu2XcdYWUFuGyfTu
 Ohd8EPh1Z2oPEaRftqcwupUqebhYjRt8WEA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bfev00w3n-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:19:23 -0700
Received: from intmgw002.48.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 3 Oct 2021 12:19:22 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id C4226523C590; Sun,  3 Oct 2021 12:19:11 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <alistair@alistair23.me>, <peter.maydell@linaro.org>, <clg@kaod.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <zhdaniel@fb.com>, <patrick@stwcx.xyz>, Peter
 Delevoryas <pdel@fb.com>
Subject: [PATCH v2 0/2] hw/adc: Add basic Aspeed ADC model
Date: Sun, 3 Oct 2021 12:18:48 -0700
Message-ID: <20211003191850.513658-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="UTF-8"
X-FB-Internal: Safe
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: VDUwQ2FsYlqESo7UKgnj-ao3b2iRCKW7
X-Proofpoint-GUID: VDUwQ2FsYlqESo7UKgnj-ao3b2iRCKW7
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-03_09,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=983
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110030142
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9910b4adaa=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

v1: https://lore.kernel.org/qemu-devel/20211002214414.2858382-1-pdel@fbc.om/

v2:
- Added summary of changes above signed-off-by in commit message.
- Added #define's for ADC and ADC engine memory region sizes.
- Fixed "From: pdel@fbc.com"

Thanks,
Peter

Andrew Jeffery (2):
  hw/adc: Add basic Aspeed ADC model
  hw/arm: Integrate ADC model into Aspeed SoC

 hw/adc/aspeed_adc.c         | 422 ++++++++++++++++++++++++++++++++++++
 hw/adc/meson.build          |   1 +
 hw/adc/trace-events         |   3 +
 hw/arm/aspeed_ast2600.c     |  11 +
 hw/arm/aspeed_soc.c         |  11 +
 include/hw/adc/aspeed_adc.h |  55 +++++
 include/hw/arm/aspeed_soc.h |   2 +
 7 files changed, 505 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

Interdiff against v1:
diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 8a132ef375..fcd93d6853 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -17,6 +17,8 @@
 #include "hw/adc/aspeed_adc.h"
 #include "trace.h"
=20
+#define ASPEED_ADC_MEMORY_REGION_SIZE           0x1000
+#define ASPEED_ADC_ENGINE_MEMORY_REGION_SIZE    0x100
 #define  ASPEED_ADC_ENGINE_CH_EN_MASK           0xffff0000
 #define   ASPEED_ADC_ENGINE_CH_EN(x)            ((BIT(x)) << 16)
 #define  ASPEED_ADC_ENGINE_INIT                 BIT(8)
@@ -264,7 +266,7 @@ static void aspeed_adc_engine_realize(DeviceState *dev,=
 Error **errp)
     sysbus_init_irq(sbd, &s->irq);
=20
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_adc_engine_ops, s, =
name,
-                          0x100);
+                          ASPEED_ADC_ENGINE_MEMORY_REGION_SIZE);
=20
     sysbus_init_mmio(sbd, &s->mmio);
 }
@@ -344,7 +346,8 @@ static void aspeed_adc_realize(DeviceState *dev, Error =
**errp)
=20
     sysbus_init_irq(sbd, &s->irq);
=20
-    memory_region_init(&s->mmio, OBJECT(s), TYPE_ASPEED_ADC, 0x1000);
+    memory_region_init(&s->mmio, OBJECT(s), TYPE_ASPEED_ADC,
+                       ASPEED_ADC_MEMORY_REGION_SIZE);
=20
     sysbus_init_mmio(sbd, &s->mmio);
=20
@@ -356,7 +359,9 @@ static void aspeed_adc_realize(DeviceState *dev, Error =
**errp)
         }
         sysbus_connect_irq(SYS_BUS_DEVICE(eng), 0,
                            qdev_get_gpio_in(DEVICE(sbd), i));
-        memory_region_add_subregion(&s->mmio, i * 0x100, &s->engines[i].mm=
io);
+        memory_region_add_subregion(&s->mmio,
+                                    i * ASPEED_ADC_ENGINE_MEMORY_REGION_SI=
ZE,
+                                    &s->engines[i].mmio);
     }
 }
=20
--=20
2.30.2


