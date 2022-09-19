Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AED5BCC92
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:08:43 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGVu-0007Rs-87
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaGCz-0001a3-Qp
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50932 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaGCw-0000I8-0V
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 08:49:09 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72s9ZShjN8QdAA--.43684S5; 
 Mon, 19 Sep 2022 20:49:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 3/9] hw/loongarch: Add interrupt information to FDT table
Date: Mon, 19 Sep 2022 20:48:55 +0800
Message-Id: <20220919124901.2653396-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919124901.2653396-1-gaosong@loongson.cn>
References: <20220919124901.2653396-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72s9ZShjN8QdAA--.43684S5
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfGw15ArWDurWrWw1Dtrb_yoW8Kr45pF
 W7Aa98WrWxXrn7WrZav345uwnxAr1rAFy7Xw4I9r40ka4DXwn3WrWxu34xJFy8X34rXa4Y
 vFsYqry8W3Z2gr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add interrupt information to FDT table, such as interrupt
controller info, compatiable info, etc.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-4-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 4f833a2044..561b05d404 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -158,6 +158,34 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
     qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
 }
 
+static void fdt_add_irqchip_node(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    char *nodename;
+    uint32_t irqchip_phandle;
+
+    irqchip_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", irqchip_phandle);
+
+    nodename = g_strdup_printf("/intc@%" PRIx64,
+                              VIRT_IOAPIC_REG_BASE);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(ms->fdt, nodename, "ranges", NULL, 0);
+
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
+                            "loongarch,ls7a");
+
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, VIRT_IOAPIC_REG_BASE,
+                                 2, PCH_PIC_ROUTE_ENTRY_OFFSET);
+
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", irqchip_phandle);
+    g_free(nodename);
+}
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
@@ -697,6 +725,7 @@ static void loongarch_init(MachineState *machine)
     }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
+    fdt_add_irqchip_node(lams);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
     fdt_add_pcie_node(lams);
-- 
2.31.1


