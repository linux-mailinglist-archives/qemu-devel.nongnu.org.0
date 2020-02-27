Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE8170E85
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 03:38:45 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j794W-0003qH-B0
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 21:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791V-00083l-Cm
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791U-0001lB-Au
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3175 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791R-0001ZP-MZ; Wed, 26 Feb 2020 21:35:33 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A23DBA7A5288C2477CB3;
 Thu, 27 Feb 2020 10:35:31 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:22 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 6/6] hw/timer/cadence_ttc: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:55 +0800
Message-ID: <20200227025055.14341-7-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200227025055.14341-1-pannengyuan@huawei.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, Alistair Francis <alistair@alistair23.me>,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, euler.robot@huawei.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
---
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 5e3128c1e3..b0ba6b2bba 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -412,16 +412,21 @@ static void cadence_timer_init(uint32_t freq, CadenceTimerState *s)
 static void cadence_ttc_init(Object *obj)
 {
     CadenceTTCState *s = CADENCE_TTC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
+                          "timer", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static void cadence_ttc_realize(DeviceState *dev, Error **errp)
+{
+    CadenceTTCState *s = CADENCE_TTC(dev);
     int i;
 
     for (i = 0; i < 3; ++i) {
         cadence_timer_init(133000000, &s->timer[i]);
-        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->timer[i].irq);
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->timer[i].irq);
     }
-
-    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
-                          "timer", 0x1000);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
 static int cadence_timer_pre_save(void *opaque)
@@ -479,6 +484,7 @@ static void cadence_ttc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_cadence_ttc;
+    dc->realize = cadence_ttc_realize;
 }
 
 static const TypeInfo cadence_ttc_info = {
-- 
2.18.2


