Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4D2C607A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:29:11 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiYBq-0002n9-4S
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1x-0002Ta-TY; Fri, 27 Nov 2020 02:18:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1v-0007ju-Tj; Fri, 27 Nov 2020 02:18:57 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj5ZW2dByzhjDw;
 Fri, 27 Nov 2020 15:18:27 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:40 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 5/7] exynos4210_rtc: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri, 27 Nov 2020 15:18:01 +0800
Message-ID: <20201127071803.2479462-6-ganqixin@huawei.com>
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Gan Qixin <ganqixin@huawei.com>, Euler
 Robot <euler.robot@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running device-introspect-test, a memory leak occurred in the exynos4210_rtc_init
function, so use ptimer_free() in the finalize function to avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf57b3934 in exynos4210_rtc_init /qemu/hw/rtc/exynos4210_rtc.c:567
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
---
 hw/rtc/exynos4210_rtc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 4c97624478..2f667fb010 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -584,6 +584,14 @@ static void exynos4210_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_rtc_finalize(Object *obj)
+{
+    Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
+
+    ptimer_free(s->ptimer);
+    ptimer_free(s->ptimer_1Hz);
+}
+
 static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -593,11 +601,12 @@ static void exynos4210_rtc_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo exynos4210_rtc_info = {
-    .name          = TYPE_EXYNOS4210_RTC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Exynos4210RTCState),
-    .instance_init = exynos4210_rtc_init,
-    .class_init    = exynos4210_rtc_class_init,
+    .name              = TYPE_EXYNOS4210_RTC,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(Exynos4210RTCState),
+    .instance_init     = exynos4210_rtc_init,
+    .instance_finalize = exynos4210_rtc_finalize,
+    .class_init        = exynos4210_rtc_class_init,
 };
 
 static void exynos4210_rtc_register_types(void)
-- 
2.23.0


