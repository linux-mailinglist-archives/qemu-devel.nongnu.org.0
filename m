Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C8289F3A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 10:17:15 +0200 (CEST)
Received: from localhost ([::1]:32966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRA42-0005sS-0k
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 04:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kR9u0-0000BB-Pf; Sat, 10 Oct 2020 04:06:52 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50088 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kR9tx-0007ne-Hy; Sat, 10 Oct 2020 04:06:52 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3F9065905E23944C2E87;
 Sat, 10 Oct 2020 16:06:42 +0800 (CST)
Received: from huawei.com (10.174.185.47) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 10 Oct 2020
 16:06:33 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH V2 1/5] target/riscv: Add basic vmstate description of CPU
Date: Sat, 10 Oct 2020 16:06:19 +0800
Message-ID: <20201010080623.768-2-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201010080623.768-1-jiangyifei@huawei.com>
References: <20201010080623.768-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.47]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=jiangyifei@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 04:06:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 richard.henderson@linaro.org, Yifei Jiang <jiangyifei@huawei.com>,
 Alistair.Francis@wdc.com, yinyipeng1@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add basic CPU state description to the newly created machine.c

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c       |  7 ----
 target/riscv/cpu.h       |  4 +++
 target/riscv/machine.c   | 77 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |  3 +-
 4 files changed, 83 insertions(+), 8 deletions(-)
 create mode 100644 target/riscv/machine.c

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f457..bf396e2916 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -496,13 +496,6 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
 
-#ifndef CONFIG_USER_ONLY
-static const VMStateDescription vmstate_riscv_cpu = {
-    .name = "cpu",
-    .unmigratable = 1,
-};
-#endif
-
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de275782e6..8440ea0793 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -311,6 +311,10 @@ extern const char * const riscv_fpr_regnames[];
 extern const char * const riscv_excp_names[];
 extern const char * const riscv_intr_names[];
 
+#ifndef CONFIG_USER_ONLY
+extern const VMStateDescription vmstate_riscv_cpu;
+#endif
+
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
new file mode 100644
index 0000000000..af2828a80a
--- /dev/null
+++ b/target/riscv/machine.c
@@ -0,0 +1,77 @@
+/*
+ * RISC-V VMState Description
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
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/error-report.h"
+#include "sysemu/kvm.h"
+#include "migration/cpu.h"
+
+const VMStateDescription vmstate_riscv_cpu = {
+    .name = "cpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
+        VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
+        VMSTATE_UINTTL(env.pc, RISCVCPU),
+        VMSTATE_UINTTL(env.load_res, RISCVCPU),
+        VMSTATE_UINTTL(env.load_val, RISCVCPU),
+        VMSTATE_UINTTL(env.frm, RISCVCPU),
+        VMSTATE_UINTTL(env.badaddr, RISCVCPU),
+        VMSTATE_UINTTL(env.guest_phys_fault_addr, RISCVCPU),
+        VMSTATE_UINTTL(env.priv_ver, RISCVCPU),
+        VMSTATE_UINTTL(env.vext_ver, RISCVCPU),
+        VMSTATE_UINTTL(env.misa, RISCVCPU),
+        VMSTATE_UINTTL(env.misa_mask, RISCVCPU),
+        VMSTATE_UINT32(env.features, RISCVCPU),
+        VMSTATE_UINTTL(env.priv, RISCVCPU),
+        VMSTATE_UINTTL(env.virt, RISCVCPU),
+        VMSTATE_UINTTL(env.resetvec, RISCVCPU),
+        VMSTATE_UINTTL(env.mhartid, RISCVCPU),
+        VMSTATE_UINTTL(env.mstatus, RISCVCPU),
+        VMSTATE_UINTTL(env.mip, RISCVCPU),
+        VMSTATE_UINT32(env.miclaim, RISCVCPU),
+        VMSTATE_UINTTL(env.mie, RISCVCPU),
+        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
+        VMSTATE_UINTTL(env.sptbr, RISCVCPU),
+        VMSTATE_UINTTL(env.satp, RISCVCPU),
+        VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
+        VMSTATE_UINTTL(env.mbadaddr, RISCVCPU),
+        VMSTATE_UINTTL(env.medeleg, RISCVCPU),
+        VMSTATE_UINTTL(env.stvec, RISCVCPU),
+        VMSTATE_UINTTL(env.sepc, RISCVCPU),
+        VMSTATE_UINTTL(env.scause, RISCVCPU),
+        VMSTATE_UINTTL(env.mtvec, RISCVCPU),
+        VMSTATE_UINTTL(env.mepc, RISCVCPU),
+        VMSTATE_UINTTL(env.mcause, RISCVCPU),
+        VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.scounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.sscratch, RISCVCPU),
+        VMSTATE_UINTTL(env.mscratch, RISCVCPU),
+        VMSTATE_UINT64(env.mfromhost, RISCVCPU),
+        VMSTATE_UINT64(env.mtohost, RISCVCPU),
+        VMSTATE_UINT64(env.timecmp, RISCVCPU),
+
+#ifdef TARGET_RISCV32
+        VMSTATE_UINTTL(env.mstatush, RISCVCPU),
+#endif
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index abd647fea1..14a5c62dac 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -27,7 +27,8 @@ riscv_ss.add(files(
 riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
   'pmp.c',
-  'monitor.c'
+  'monitor.c',
+  'machine.c'
 ))
 
 target_arch += {'riscv': riscv_ss}
-- 
2.19.1


