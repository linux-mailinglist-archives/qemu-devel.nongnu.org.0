Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B5488E36
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 02:50:19 +0100 (CET)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6jpB-0005jl-V4
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 20:50:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n6jec-0004em-TS; Sun, 09 Jan 2022 20:39:24 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n6jeQ-0006wt-A4; Sun, 09 Jan 2022 20:39:12 -0500
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JXGgS6Z1pzcbMg;
 Mon, 10 Jan 2022 09:38:28 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 09:39:06 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 10 Jan
 2022 09:39:05 +0800
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup@brainfault.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 07/12] target/riscv: Support setting external interrupt by
 KVM
Date: Mon, 10 Jan 2022 09:38:26 +0800
Message-ID: <20220110013831.1594-8-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20220110013831.1594-1-jiangyifei@huawei.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

When KVM is enabled, set the S-mode external interrupt through
kvm_riscv_set_irq function.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c       |  6 +++++-
 target/riscv/kvm-stub.c  |  5 +++++
 target/riscv/kvm.c       | 17 +++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8a979a3762..39382b1d62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -603,7 +603,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
     case IRQ_S_EXT:
     case IRQ_VS_EXT:
     case IRQ_M_EXT:
-        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        if (kvm_enabled()) {
+            kvm_riscv_set_irq(cpu, irq, level);
+        } else {
+            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        }
         break;
     default:
         g_assert_not_reached();
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
index 39b96fe3f4..4e8fc31a21 100644
--- a/target/riscv/kvm-stub.c
+++ b/target/riscv/kvm-stub.c
@@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
 {
     abort();
 }
+
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    abort();
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index db6d8a5b6e..0027f11f45 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -383,6 +383,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->satp = 0;
 }
 
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    int ret;
+    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
+
+    if (irq != IRQ_S_EXT) {
+        perror("kvm riscv set irq != IRQ_S_EXT\n");
+        abort();
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
+    if (ret < 0) {
+        perror("Set irq failed");
+        abort();
+    }
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index f38c82bf59..ed281bdce0 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,5 +20,6 @@
 #define QEMU_KVM_RISCV_H
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
 #endif
-- 
2.19.1


