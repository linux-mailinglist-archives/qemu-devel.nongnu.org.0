Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231D12C6078
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:26:17 +0100 (CET)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiY91-0000YR-TX
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1w-0002Qy-Gr; Fri, 27 Nov 2020 02:18:56 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1t-0007jt-TL; Fri, 27 Nov 2020 02:18:56 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZW2GSLzhjDP;
 Fri, 27 Nov 2020 15:18:27 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:42 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 6/7] mss-timer: Use ptimer_free() in the finalize function to
 avoid memleaks
Date: Fri, 27 Nov 2020 15:18:02 +0800
Message-ID: <20201127071803.2479462-7-ganqixin@huawei.com>
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
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the mss_timer_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 192 byte(s) in 2 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf58a0010 in mss_timer_init /qemu/hw/timer/mss-timer.c:235
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #6 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #7 0xaaabf5b8316c in m2sxxx_soc_initfn /qemu/hw/arm/msf2-soc.c:70
    #8 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #9 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #10 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #11 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #12 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/timer/mss-timer.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index 29943fd744..7c4f3a52da 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -244,6 +244,18 @@ static void mss_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
 }
 
+static void mss_timer_finalize(Object *obj)
+{
+    MSSTimerState *t = MSS_TIMER(obj);
+    int i;
+
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
+        ptimer_free(st->ptimer);
+    }
+}
+
 static const VMStateDescription vmstate_timers = {
     .name = "mss-timer-block",
     .version_id = 1,
@@ -283,11 +295,12 @@ static void mss_timer_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo mss_timer_info = {
-    .name          = TYPE_MSS_TIMER,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MSSTimerState),
-    .instance_init = mss_timer_init,
-    .class_init    = mss_timer_class_init,
+    .name              = TYPE_MSS_TIMER,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(MSSTimerState),
+    .instance_init     = mss_timer_init,
+    .instance_finalize = mss_timer_finalize,
+    .class_init        = mss_timer_class_init,
 };
 
 static void mss_timer_register_types(void)
-- 
2.23.0


