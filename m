Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162E2CD5D9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:49:32 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kko39-000616-G1
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1M-00042b-QH; Thu, 03 Dec 2020 07:47:40 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1J-0006ra-EJ; Thu, 03 Dec 2020 07:47:40 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmwZn0sQDzkkmH;
 Thu,  3 Dec 2020 20:46:57 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:47:22 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH RFC v4 05/15] target/riscv: Implement kvm_arch_put_registers
Date: Thu, 3 Dec 2020 20:46:53 +0800
Message-ID: <20201203124703.168-6-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: victor.zhangxiaofeng@huawei.com, sagark@eecs.berkeley.edu,
 kvm@vger.kernel.org, libvir-list@redhat.com, kbastian@mail.uni-paderborn.de,
 anup.patel@wdc.com, yinyipeng1@huawei.com, Alistair.Francis@wdc.com,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 palmer@dabbelt.com, dengkai1@huawei.com, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 142 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e679619e79..8b206ce99c 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -85,6 +85,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    reg = env->pc;
+    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    for (i = 1; i < 32; i++) {
+        __u64 id = kvm_riscv_reg_id(KVM_REG_RISCV_CORE, i);
+        reg = env->gpr[i];
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return ret;
+}
+
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
     int ret = 0;
@@ -148,6 +173,70 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_csr(CPUState *cs)
+{
+    int ret = 0;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    reg = env->mstatus;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sstatus), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->mie;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sie), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->stvec;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(stvec), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sscratch;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sscratch), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sepc;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sepc), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->scause;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(scause), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sbadaddr;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(stval), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->mip;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sip), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->satp;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(satp), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
+}
+
+
 static int kvm_riscv_get_regs_fp(CPUState *cs)
 {
     int ret = 0;
@@ -181,6 +270,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_fp(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (riscv_has_ext(env, RVD)) {
+        uint64_t reg;
+        for (i = 0; i < 32; i++) {
+            reg = env->fpr[i];
+            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    if (riscv_has_ext(env, RVF)) {
+        uint32_t reg;
+        for (i = 0; i < 32; i++) {
+            reg = env->fpr[i];
+            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    return ret;
+}
+
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
@@ -209,7 +332,24 @@ int kvm_arch_get_registers(CPUState *cs)
 
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    return 0;
+    int ret = 0;
+
+    ret = kvm_riscv_put_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_put_regs_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_put_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
 }
 
 int kvm_arch_release_virq_post(int virq)
-- 
2.19.1


