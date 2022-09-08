Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A45B1977
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:58:55 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEJC-0006Hi-Ui
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oWE7H-0005EA-QO
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43702 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oWE7D-0004yy-J4
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 05:46:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxYOLwuRljGFYUAA--.17873S5; 
 Thu, 08 Sep 2022 17:46:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 3/9] hw/loongarch: Add interrupt information to FDT table
Date: Thu,  8 Sep 2022 17:46:17 +0800
Message-Id: <20220908094623.73051-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
References: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxYOLwuRljGFYUAA--.17873S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy3Ar47uF47KFykArW8JFb_yoW8urWUpF
 W7Aa90grWxXrn7WFZav345uwsxAr1fAFW2qw1Igr4Sya4DXw17WrWxC34fAF1UW348Xa4Y
 vF4FqFyxW3WIgF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

Add interrupt information to FDT table, such as interrupt
controller info, compatiable info, etc.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
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


