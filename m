Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA0948BFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:30:16 +0100 (CET)
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Z1L-00071J-Dh
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:30:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7Ylc-0005UY-80; Wed, 12 Jan 2022 03:14:01 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7Yla-0008CA-2A; Wed, 12 Jan 2022 03:13:59 -0500
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JYgGf3tN5zZf7J;
 Wed, 12 Jan 2022 16:10:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 16:13:54 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 12 Jan
 2022 16:13:53 +0800
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup@brainfault.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 10/13] target/riscv: Add kvm_riscv_get/put_regs_timer
Date: Wed, 12 Jan 2022 16:13:26 +0800
Message-ID: <20220112081329.1835-11-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20220112081329.1835-1-jiangyifei@huawei.com>
References: <20220112081329.1835-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Yifei Jiang <jiangyifei@huawei.com>
From:  Yifei Jiang via <qemu-devel@nongnu.org>

Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
from KVM.

To set register of RISCV_TIMER_REG(state) will occur a error from KVM
on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
that adaping in QEMU.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  7 +++++
 target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 73ced2116b..22c94d3c57 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -273,6 +273,13 @@ struct CPURISCVState {
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
+
+    /* kvm timer */
+    bool kvm_timer_dirty;
+    uint64_t kvm_timer_time;
+    uint64_t kvm_timer_compare;
+    uint64_t kvm_timer_state;
+    uint64_t kvm_timer_frequency;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e90e2a6709..a43d5a2988 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -40,6 +40,7 @@
 #include "kvm_riscv.h"
 #include "sbi_ecall_interface.h"
 #include "chardev/char-fe.h"
+#include "migration/migration.h"
 
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
@@ -65,6 +66,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
 #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
                  KVM_REG_RISCV_CSR_REG(name))
 
+#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
+                 KVM_REG_RISCV_TIMER_REG(name))
+
 #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
 
 #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
@@ -85,6 +89,22 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
         } \
     } while (0)
 
+#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
+    do { \
+        int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
+        if (ret) { \
+            abort(); \
+        } \
+    } while (0)
+
+#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
+    do { \
+        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg); \
+        if (ret) { \
+            abort(); \
+        } \
+    } while (0)
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret = 0;
@@ -236,6 +256,58 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
     return ret;
 }
 
+static void kvm_riscv_get_regs_timer(CPUState *cs)
+{
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (env->kvm_timer_dirty) {
+        return;
+    }
+
+    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
+    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
+    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
+    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
+
+    env->kvm_timer_dirty = true;
+}
+
+static void kvm_riscv_put_regs_timer(CPUState *cs)
+{
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (!env->kvm_timer_dirty) {
+        return;
+    }
+
+    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
+    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
+
+    /*
+     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
+     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
+     * doesn't matter that adaping in QEMU now.
+     * TODO If KVM changes, adapt here.
+     */
+    if (env->kvm_timer_state) {
+        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
+    }
+
+    /*
+     * For now, migration will not work between Hosts with different timer
+     * frequency. Therefore, we should check whether they are the same here
+     * during the migration.
+     */
+    if (migration_is_running(migrate_get_current()->state)) {
+        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
+        if (reg != env->kvm_timer_frequency) {
+            error_report("Dst Hosts timer frequency != Src Hosts");
+        }
+    }
+
+    env->kvm_timer_dirty = false;
+}
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
-- 
2.19.1


