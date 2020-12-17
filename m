Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C72DD0A7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:44:40 +0100 (CET)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpri3-0006lM-TY
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXR-0002wu-SS; Thu, 17 Dec 2020 06:33:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprXG-0005oC-3s; Thu, 17 Dec 2020 06:33:41 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CxVGt6Kx0zhsqH;
 Thu, 17 Dec 2020 19:32:54 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 17 Dec 2020
 19:33:16 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 3/7] exynos4210_mct: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Thu, 17 Dec 2020 19:31:50 +0800
Message-ID: <20201217113154.121668-3-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217113154.121668-1-ganqixin@huawei.com>
References: <20201217113154.121668-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the
exynos4210_mct_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf56b01a0 in exynos4210_mct_init /qemu/hw/timer/exynos4210_mct.c:1505
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #6 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #7 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #8 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110
    #9 0xaaabf6552708 in aio_bh_call /qemu/util/async.c:136
    #10 0xaaabf6552708 in aio_bh_poll /qemu/util/async.c:164
    #11 0xaaabf655f19c in aio_dispatch /qemu/util/aio-posix.c:381
    #12 0xaaabf65523f4 in aio_ctx_dispatch /qemu/util/async.c:306

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 439053acd2..d0e5343996 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1530,6 +1530,19 @@ static void exynos4210_mct_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_mct_finalize(Object *obj)
+{
+    int i;
+    Exynos4210MCTState *s = EXYNOS4210_MCT(obj);
+
+    ptimer_free(s->g_timer.ptimer_frc);
+
+    for (i = 0; i < 2; i++) {
+        ptimer_free(s->l_timer[i].tick_timer.ptimer_tick);
+        ptimer_free(s->l_timer[i].ptimer_frc);
+    }
+}
+
 static void exynos4210_mct_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1543,6 +1556,7 @@ static const TypeInfo exynos4210_mct_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210MCTState),
     .instance_init = exynos4210_mct_init,
+    .instance_finalize = exynos4210_mct_finalize,
     .class_init    = exynos4210_mct_class_init,
 };
 
-- 
2.23.0


