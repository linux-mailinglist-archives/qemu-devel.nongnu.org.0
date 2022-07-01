Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6356295D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 05:09:23 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7721-0003gS-Ub
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 23:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o770Z-0002mT-Qc
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:07:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59182 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o770X-0007li-5K
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 23:07:51 -0400
Received: from localhost.localdomain (unknown [10.2.9.158])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7+P8ZL5iPjIAAA--.699S2;
 Fri, 01 Jul 2022 11:07:40 +0800 (CST)
From: Mao Bibo <maobibo@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/intc: loongarch_pch_msi: Fix msi vector convertion
Date: Fri,  1 Jul 2022 11:07:40 +0800
Message-Id: <20220701030740.2469162-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx7+P8ZL5iPjIAAA--.699S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4DtrWrJFyUJw4rur18Grg_yoW5ZrWkpF
 ZrurW5tr48Ja1DXFZ7K34UZr95GFn7CFyIvF4akryxCr4UAr1UX3WkJrW7WFyUKw4kGFyq
 v348Ga17ua1UGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUozVbDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Loongarch pch msi intc connects to extioi controller, the range of irq number
is 64-255. Here adds irqbase property for loongarch pch msi controller, we can
get irq offset from view of pch_msi controller with the method:
  msi vector (from view of upper extioi intc) - irqbase

Signed-off-by: Mao Bibo <maobibo@loongson.cn>
---
 hw/intc/loongarch_pch_msi.c         | 22 ++++++++++++++++++++--
 hw/loongarch/loongson3.c            |  1 +
 include/hw/intc/loongarch_pch_msi.h |  2 ++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
index 74bcdbdb48..b36d6d76e4 100644
--- a/hw/intc/loongarch_pch_msi.c
+++ b/hw/intc/loongarch_pch_msi.c
@@ -23,9 +23,14 @@ static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
 static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
                                     uint64_t val, unsigned size)
 {
-    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
-    int irq_num = val & 0xff;
+    LoongArchPCHMSI *s = (LoongArchPCHMSI *)opaque;
+    int irq_num;
 
+    /*
+     * vector number is irq number from upper extioi intc
+     * need subtract irq base to get msi vector offset
+     */
+    irq_num = (val & 0xff) - s->irq_base;
     trace_loongarch_msi_set_irq(irq_num);
     assert(irq_num < PCH_MSI_IRQ_NUM);
     qemu_set_irq(s->pch_msi_irq[irq_num], 1);
@@ -58,11 +63,24 @@ static void loongarch_pch_msi_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
 }
 
+static Property loongarch_msi_properties[] = {
+    DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, loongarch_msi_properties);
+}
+
 static const TypeInfo loongarch_pch_msi_info = {
     .name          = TYPE_LOONGARCH_PCH_MSI,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(LoongArchPCHMSI),
     .instance_init = loongarch_pch_msi_init,
+    .class_init    = loongarch_pch_msi_class_init,
 };
 
 static void loongarch_pch_msi_register_types(void)
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bd20ebbb78..403dd91e11 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -267,6 +267,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     }
 
     pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
     d = SYS_BUS_DEVICE(pch_msi);
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
index f668bfca7a..6d67560dea 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -17,4 +17,6 @@ struct LoongArchPCHMSI {
     SysBusDevice parent_obj;
     qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
     MemoryRegion msi_mmio;
+    /* irq base passed to upper extioi intc */
+    unsigned int irq_base;
 };
-- 
2.27.0


