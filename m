Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E735BA71
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 08:58:00 +0200 (CEST)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqWF-0004BX-UZ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 02:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqS6-0007fz-Fl; Mon, 12 Apr 2021 02:53:42 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqS2-0004Wu-TH; Mon, 12 Apr 2021 02:53:42 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJfXx6ZBmzjYsK;
 Mon, 12 Apr 2021 14:51:45 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 14:53:30 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH RFC v5 06/12] target/riscv: Support start kernel directly by
 KVM
Date: Mon, 12 Apr 2021 14:52:40 +0800
Message-ID: <20210412065246.1853-7-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210412065246.1853-1-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=jiangyifei@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, sagark@eecs.berkeley.edu, kvm@vger.kernel.org,
 libvir-list@redhat.com, kbastian@mail.uni-paderborn.de, anup.patel@wdc.com,
 yinyipeng1@huawei.com, Alistair.Francis@wdc.com,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 palmer@dabbelt.com, fanliang@huawei.com, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get kernel and fdt start address in virt.c, and pass them to KVM
when cpu reset. In addition, add kvm_riscv.h to place riscv specific
interface.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 hw/riscv/boot.c          | 11 +++++++++++
 hw/riscv/virt.c          |  7 +++++++
 include/hw/riscv/boot.h  |  1 +
 target/riscv/cpu.c       |  8 ++++++++
 target/riscv/cpu.h       |  3 +++
 target/riscv/kvm-stub.c  | 25 +++++++++++++++++++++++++
 target/riscv/kvm.c       | 13 +++++++++++++
 target/riscv/kvm_riscv.h | 24 ++++++++++++++++++++++++
 target/riscv/meson.build |  2 +-
 9 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/kvm-stub.c
 create mode 100644 target/riscv/kvm_riscv.h

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0d38bb7426..b9741a647d 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -290,3 +290,14 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
 
     return;
 }
+
+void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
+{
+    CPUState *cs;
+
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+        RISCVCPU *riscv_cpu = RISCV_CPU(cs);
+        riscv_cpu->env.kernel_addr = kernel_addr;
+        riscv_cpu->env.fdt_addr = fdt_addr;
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c0dc69ff33..4a1fca139c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -728,6 +728,13 @@ static void virt_machine_init(MachineState *machine)
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, machine->fdt);
 
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
+
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 11a21dd584..28d838cc29 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -51,5 +51,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
+void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
 
 #endif /* RISCV_BOOT_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..dd34ab4978 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
 
 /* RISC-V CPU definitions */
 
@@ -361,6 +363,12 @@ static void riscv_cpu_reset(DeviceState *dev)
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
+
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_riscv_reset_vcpu(cpu);
+    }
+#endif
 }
 
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..a489d94187 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -243,6 +243,9 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    hwaddr kernel_addr;
+    hwaddr fdt_addr;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
new file mode 100644
index 0000000000..39b96fe3f4
--- /dev/null
+++ b/target/riscv/kvm-stub.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU KVM RISC-V specific function stubs
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "kvm_riscv.h"
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    abort();
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9d1441952a..79c931acb4 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -37,6 +37,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
+#include "kvm_riscv.h"
 
 static __u64 kvm_riscv_reg_id(CPURISCVState *env, __u64 type, __u64 idx)
 {
@@ -440,6 +441,18 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     return 0;
 }
 
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (!kvm_enabled()) {
+        return;
+    }
+    env->pc = cpu->env.kernel_addr;
+    env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
+    env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
new file mode 100644
index 0000000000..f38c82bf59
--- /dev/null
+++ b/target/riscv/kvm_riscv.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU KVM support -- RISC-V specific functions.
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_KVM_RISCV_H
+#define QEMU_KVM_RISCV_H
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+
+#endif
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 32afd6e882..0f63e3824d 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -23,7 +23,7 @@ riscv_ss.add(files(
   'vector_helper.c',
   'translate.c',
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
 riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
-- 
2.19.1


