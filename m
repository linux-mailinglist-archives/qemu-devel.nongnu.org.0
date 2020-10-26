Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453C298C88
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 13:00:01 +0100 (CET)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX1AO-0005sW-KO
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 08:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kX16X-0000hO-Bh; Mon, 26 Oct 2020 07:56:01 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kX16T-0000iN-Ol; Mon, 26 Oct 2020 07:56:01 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKYFV1xC2zhb7b;
 Mon, 26 Oct 2020 19:55:58 +0800 (CST)
Received: from huawei.com (10.174.186.209) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 19:55:42 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH V4 6/6] target/riscv: Add sifive_plic vmstate
Date: Mon, 26 Oct 2020 19:55:30 +0800
Message-ID: <20201026115530.304-7-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201026115530.304-1-jiangyifei@huawei.com>
References: <20201026115530.304-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.209]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangyifei@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 07:55:53
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 richard.henderson@linaro.org, Yifei Jiang <jiangyifei@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, yinyipeng1@huawei.com,
 palmer@dabbelt.com, wu.wubin@huawei.com, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add sifive_plic vmstate for supporting sifive_plic migration.
Current vmstate framework only supports one structure parameter
as num field to describe variable length arrays, so introduce
num_enables.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 26 +++++++++++++++++++++++++-
 hw/intc/sifive_plic.h |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f42fd695d8..97a1a27a9a 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -30,6 +30,7 @@
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
 
 #define RISCV_DEBUG_PLIC 0
 
@@ -448,11 +449,12 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
                           TYPE_SIFIVE_PLIC, plic->aperture_size);
     parse_hart_config(plic);
     plic->bitfield_words = (plic->num_sources + 31) >> 5;
+    plic->num_enables = plic->bitfield_words * plic->num_addrs;
     plic->source_priority = g_new0(uint32_t, plic->num_sources);
     plic->target_priority = g_new(uint32_t, plic->num_addrs);
     plic->pending = g_new0(uint32_t, plic->bitfield_words);
     plic->claimed = g_new0(uint32_t, plic->bitfield_words);
-    plic->enable = g_new0(uint32_t, plic->bitfield_words * plic->num_addrs);
+    plic->enable = g_new0(uint32_t, plic->num_enables);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
 
@@ -472,12 +474,34 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
     msi_nonbroken = true;
 }
 
+static const VMStateDescription vmstate_sifive_plic = {
+    .name = "riscv_sifive_plic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_VARRAY_UINT32(source_priority, SiFivePLICState,
+                                  num_sources, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(target_priority, SiFivePLICState,
+                                  num_addrs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(pending, SiFivePLICState, bitfield_words, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(claimed, SiFivePLICState, bitfield_words, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(enable, SiFivePLICState, num_enables, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, sifive_plic_properties);
     dc->realize = sifive_plic_realize;
+    dc->vmsd = &vmstate_sifive_plic;
 }
 
 static const TypeInfo sifive_plic_info = {
diff --git a/hw/intc/sifive_plic.h b/hw/intc/sifive_plic.h
index b75b1f145d..1e451a270c 100644
--- a/hw/intc/sifive_plic.h
+++ b/hw/intc/sifive_plic.h
@@ -52,6 +52,7 @@ struct SiFivePLICState {
     uint32_t num_addrs;
     uint32_t num_harts;
     uint32_t bitfield_words;
+    uint32_t num_enables;
     PLICAddr *addr_config;
     uint32_t *source_priority;
     uint32_t *target_priority;
-- 
2.19.1


