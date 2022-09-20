Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717E45BE3F1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:56:57 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaavv-0007ur-TS
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000P4-3C
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33982 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tp-SH
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S5; 
 Tue, 20 Sep 2022 17:51:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 3/9] hw/loongarch: Add interrupt information to FDT table
Date: Tue, 20 Sep 2022 17:50:52 +0800
Message-Id: <20220920095058.4124145-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S5
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfGw15ArWDurWrWw1Dtrb_yoW8Kr13pF
 W7Aa98WrWxXrn7WrZav343uw43Ar1rAFy7Xw4I9rWFka4DXwn3WrWxC34IyFy8X34rXa4Y
 vF4Fqry8W3WIgF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 hw/loongarch/virt.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 4f833a2044..68b59a6c9f 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -158,6 +158,33 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
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
+    nodename = g_strdup_printf("/intc@%lx", VIRT_IOAPIC_REG_BASE);
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
@@ -697,6 +724,7 @@ static void loongarch_init(MachineState *machine)
     }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
+    fdt_add_irqchip_node(lams);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
     fdt_add_pcie_node(lams);
-- 
2.31.1


