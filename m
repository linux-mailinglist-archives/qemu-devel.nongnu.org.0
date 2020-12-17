Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64C2DD07E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:38:48 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprcN-0008DO-3b
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXE-0002eu-S2; Thu, 17 Dec 2020 06:33:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXB-0005mu-TF; Thu, 17 Dec 2020 06:33:28 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CxVGd4SX2z15fCH;
 Thu, 17 Dec 2020 19:32:41 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 17 Dec 2020
 19:33:10 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 1/7] allwinner-a10-pit: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Thu, 17 Dec 2020 19:31:48 +0800
Message-ID: <20201217113154.121668-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Beniamino Galvani <b.galvani@gmail.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the a10_pit_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 288 byte(s) in 6 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf57415e8 in a10_pit_init /qemu/hw/timer/allwinner-a10-pit.c:278
    #7 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #8 0xaaabf633ca04 in object_initialize_child_with_propsv /qemu/qom/object.c:564
    #9 0xaaabf633cc08 in object_initialize_child_with_props /qemu/qom/object.c:547
    #10 0xaaabf5b94680 in aw_a10_init /qemu/hw/arm/allwinner-a10.c:49
    #11 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #12 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/allwinner-a10-pit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index f84fc0ea25..c3fc2a4daa 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -279,6 +279,16 @@ static void a10_pit_init(Object *obj)
     }
 }
 
+static void a10_pit_finalize(Object *obj)
+{
+    AwA10PITState *s = AW_A10_PIT(obj);
+    int i;
+
+    for (i = 0; i < AW_A10_PIT_TIMER_NR; i++) {
+        ptimer_free(s->timer[i]);
+    }
+}
+
 static void a10_pit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -294,6 +304,7 @@ static const TypeInfo a10_pit_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(AwA10PITState),
     .instance_init = a10_pit_init,
+    .instance_finalize = a10_pit_finalize,
     .class_init = a10_pit_class_init,
 };
 
-- 
2.23.0


