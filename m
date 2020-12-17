Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758732DD0A0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:43:29 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprgu-0004pb-H0
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXQ-0002uO-I5; Thu, 17 Dec 2020 06:33:40 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXL-0005qF-F8; Thu, 17 Dec 2020 06:33:40 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CxVGc53BhzM5ZW;
 Thu, 17 Dec 2020 19:32:40 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 17 Dec 2020
 19:33:23 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 7/7] musicpal: Use ptimer_free() in the finalize function
 to avoid memleaks
Date: Thu, 17 Dec 2020 19:31:54 +0800
Message-ID: <20201217113154.121668-7-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217113154.121668-1-ganqixin@huawei.com>
References: <20201217113154.121668-1-ganqixin@huawei.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 Jan Kiszka <jan.kiszka@web.de>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the
mv88w8618_pit_init function, so use ptimer_free() in the finalize function to
avoid it.

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
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 458b1cbeb7..6aec84aeed 100644
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
@@ -994,6 +1005,7 @@ static const TypeInfo mv88w8618_pit_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_pit_state),
     .instance_init = mv88w8618_pit_init,
+    .instance_finalize = mv88w8618_pit_finalize,
     .class_init    = mv88w8618_pit_class_init,
 };
 
-- 
2.23.0


