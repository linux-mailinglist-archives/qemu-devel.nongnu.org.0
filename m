Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641ED2C607F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:30:19 +0100 (CET)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiYCu-0003ks-Ou
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1y-0002Uk-HQ; Fri, 27 Nov 2020 02:18:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1t-0007js-Ah; Fri, 27 Nov 2020 02:18:58 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZW2p5HzhjF1;
 Fri, 27 Nov 2020 15:18:27 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:43 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 7/7] musicpal: Use ptimer_free() in the finalize function to
 avoid memleaks
Date: Fri, 27 Nov 2020 15:18:03 +0800
Message-ID: <20201127071803.2479462-8-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201127071803.2479462-1-ganqixin@huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Jan Kiszka <jan.kiszka@web.de>, Gan Qixin <ganqixin@huawei.com>, Euler
 Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the mv88w8618_pit_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 192 byte(s) in 4 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf5bb2290 in mv88w8618_timer_init /qemu/hw/arm/musicpal.c:862
    #7 0xaaabf5bb2290 in mv88w8618_pit_init /qemu/hw/arm/musicpal.c:954
    #8 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #9 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #10 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #11 0xaaabf5a95540 in qdev_device_help /qemu/softmmu/qdev-monitor.c:283
    #12 0xaaabf5a96940 in qmp_device_add /qemu/softmmu/qdev-monitor.c:801

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Jan Kiszka <jan.kiszka@web.de>
---
 hw/arm/musicpal.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 458b1cbeb7..0e77082e52 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -959,6 +959,17 @@ static void mv88w8618_pit_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void mv88w8618_pit_finalize(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    mv88w8618_pit_state *s = MV88W8618_PIT(dev);
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        ptimer_free(s->timer[i].ptimer);
+    }
+}
+
 static const VMStateDescription mv88w8618_timer_vmsd = {
     .name = "timer",
     .version_id = 1,
@@ -990,11 +1001,12 @@ static void mv88w8618_pit_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo mv88w8618_pit_info = {
-    .name          = TYPE_MV88W8618_PIT,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(mv88w8618_pit_state),
-    .instance_init = mv88w8618_pit_init,
-    .class_init    = mv88w8618_pit_class_init,
+    .name              = TYPE_MV88W8618_PIT,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(mv88w8618_pit_state),
+    .instance_init     = mv88w8618_pit_init,
+    .instance_finalize = mv88w8618_pit_finalize,
+    .class_init        = mv88w8618_pit_class_init,
 };
 
 /* Flash config register offsets */
-- 
2.23.0


