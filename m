Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE102AF35F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:19:19 +0100 (CET)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqxy-00037W-TP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcqxB-0002aA-9x; Wed, 11 Nov 2020 09:18:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcqx8-0007aY-38; Wed, 11 Nov 2020 09:18:29 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWRf64XPlz15VGj;
 Wed, 11 Nov 2020 22:18:06 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:18:07 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
Date: Wed, 11 Nov 2020 22:17:33 +0800
Message-ID: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
 Yoshinori
 Sato <ysato@users.sourceforge.jp>, f4bug@amsat.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When 'j = icu->nr_sense – 1', the 'j < icu->nr_sense' condition is true,
then 'j = icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds access.

The asan showed stack:
ERROR: AddressSanitizer: heap-buffer-overflow on address 0x604000004d7d at pc 0x55852cd26a76 bp 0x7ffe39f26200 sp 0x7ffe39f261f0
READ of size 1 at 0x604000004d7d thread T0
    #0 0x55852cd26a75 in rxicu_realize ../hw/intc/rx_icu.c:311
    #1 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
    #2 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
    #3 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
    #4 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c:28
    #5 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
    #6 0x55852cbf0b27 in register_icu ../hw/rx/rx62n.c:156
    #7 0x55852cbf12a6 in rx62n_realize ../hw/rx/rx62n.c:261
    #8 0x55852cf075f7 in device_set_realized ../hw/core/qdev.c:886
    #9 0x55852cd4a32f in property_set_bool ../qom/object.c:2251
    #10 0x55852cd4f9bb in object_property_set ../qom/object.c:1398
    #11 0x55852cd54f3f in object_property_set_qobject ../qom/qom-qobject.c:28
    #12 0x55852cd4fc3f in object_property_set_bool ../qom/object.c:1465
    #13 0x55852cbf1a85 in rx_gdbsim_init ../hw/rx/rx-gdbsim.c:109
    #14 0x55852cd22de0 in qemu_init ../softmmu/vl.c:4380
    #15 0x55852ca57088 in main ../softmmu/main.c:49
    #16 0x7feefafa5d42 in __libc_start_main (/lib64/libc.so.6+0x26d42)

Add the 'ice->src[i].sense' initialize to the default value, and then
process init_sense array to identify which irqs should be level-triggered.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>

v1->v2:
Modify the code logic based on Peter's suggestions.
We first initialize everything to the default before processing the init_sense array to identify which irqs should be level-triggered.
---
 hw/intc/rx_icu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
index 94e17a9dea..e5c01807b9 100644
--- a/hw/intc/rx_icu.c
+++ b/hw/intc/rx_icu.c
@@ -300,22 +300,20 @@ static const MemoryRegionOps icu_ops = {
 static void rxicu_realize(DeviceState *dev, Error **errp)
 {
     RXICUState *icu = RX_ICU(dev);
-    int i, j;
+    int i;
 
     if (icu->init_sense == NULL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "rx_icu: trigger-level property must be set.");
         return;
     }
-    for (i = j = 0; i < NR_IRQS; i++) {
-        if (icu->init_sense[j] == i) {
-            icu->src[i].sense = TRG_LEVEL;
-            if (j < icu->nr_sense) {
-                j++;
-            }
-        } else {
-            icu->src[i].sense = TRG_PEDGE;
-        }
+
+    for (i = 0; i < NR_IRQS; i++) {
+        icu->src[i].sense = TRG_PEDGE;
+    }
+    for (i = 0; i < icu->nr_sense; i++) {
+        uint8_t irqno = icu->init_sense[i];
+        icu->src[irqno].sense = TRG_LEVEL;
     }
     icu->req_irq = -1;
 }
-- 
2.27.0


