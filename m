Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FE41C649
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:05:57 +0200 (CEST)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaDc-0005c8-Pr
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mVVeB-0002m9-Vk; Wed, 29 Sep 2021 05:13:03 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mVVe8-0000bY-55; Wed, 29 Sep 2021 05:13:03 -0400
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HK9bl4JbfzWVB4;
 Wed, 29 Sep 2021 17:11:31 +0800 (CST)
Received: from huawei.com (10.174.187.17) by dggeme703-chm.china.huawei.com
 (10.1.199.99) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Wed, 29
 Sep 2021 17:12:50 +0800
From: MingWang Li <limingwang@huawei.com>
To: <palmer@dabbelt.com>, <alistair.francis@wdc.com>, <bin.meng@windriver.com>
Subject: [PATCH] hw/riscv: virt: bugfix the memory-backend-file command is
 invalid
Date: Wed, 29 Sep 2021 17:12:44 +0800
Message-ID: <20210929091244.75988-1-limingwang@huawei.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.17]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=limingwang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Sep 2021 09:50:40 -0400
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
Cc: qemu-riscv@nongnu.org, Mingwang Li <limingwang@huawei.com>,
 qemu-devel@nongnu.org, jiangyifei@huawei.com, wanghaibin.wang@huawei.com,
 fanliang@huawei.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mingwang Li <limingwang@huawei.com>

If default main_mem is used to be registered as the system memory,
other memory cannot be initialized. Therefore, the system memory
should be initialized to the machine->ram, which consists of the
default main_mem and other possible memory required by applications,
such as shared hugepage memory in DPDK.
Also, the mc->defaul_ram_id should be set to the default main_mem,
which is named as "riscv_virt_board.ram".

Signed-off-by: Mingwang Li <limingwang@huawei.com>
Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
---
 hw/riscv/virt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c..b3b431c847 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -771,7 +771,6 @@ static void virt_machine_init(MachineState *machine)
     const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     char *plic_hart_config, *soc_name;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
@@ -890,10 +889,8 @@ static void virt_machine_init(MachineState *machine)
     }
 
     /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
-        main_mem);
+        machine->ram);
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
@@ -1032,6 +1029,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    mc->default_ram_id = "riscv_virt_board.ram";
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 
-- 
2.19.1


