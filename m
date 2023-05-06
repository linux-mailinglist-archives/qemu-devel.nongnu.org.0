Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF296F8E05
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 04:26:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv7bH-0008Ks-3x; Fri, 05 May 2023 22:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pv7bD-0008JB-Qp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:39 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pv7b9-00051i-U3
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:39 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxI_BeulVk_okFAA--.9119S3;
 Sat, 06 May 2023 10:24:30 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxOLZXulVkj9RMAA--.9112S6; 
 Sat, 06 May 2023 10:24:30 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v3 4/9] target/loongarch: Implement kvm get/set registers
Date: Sat,  6 May 2023 10:24:17 +0800
Message-Id: <20230506022422.59442-5-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506022422.59442-1-zhaotianrui@loongson.cn>
References: <20230506022422.59442-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxOLZXulVkj9RMAA--.9112S6
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3KFW5Zry8CFWktF1UXFyrZwb_yoW8Ary3Jo
 Z8C3Wfua45Jw4FkFsru3ZFqFyjqr9Ykan3Krn8XF4F93W7JrW5JryxG343tw42qFn5XFy8
 A3WIqFn7XaykGrnxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implement kvm_arch_get/set_registers interfaces, many regs
can be get/set in the function, such as core regs, csr regs,
fpu regs, mp state, etc.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                   |   1 +
 target/loongarch/cpu.c        |   3 +
 target/loongarch/cpu.h        |   2 +
 target/loongarch/kvm.c        | 362 +++++++++++++++++++++++++++++++++-
 target/loongarch/trace-events |  11 ++
 target/loongarch/trace.h      |   1 +
 6 files changed, 378 insertions(+), 2 deletions(-)
 create mode 100644 target/loongarch/trace-events
 create mode 100644 target/loongarch/trace.h

diff --git a/meson.build b/meson.build
index 77d42898c8..ad0b02f65b 100644
--- a/meson.build
+++ b/meson.build
@@ -3033,6 +3033,7 @@ if have_system or have_user
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
+    'target/loongarch',
     'target/mips/tcg',
     'target/nios2',
     'target/ppc',
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d15b4b2844..f20345de34 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -508,6 +508,9 @@ static void loongarch_cpu_reset_hold(Object *obj)
 #ifndef CONFIG_USER_ONLY
     env->pc = 0x1c000000;
     memset(env->tlb, 0, sizeof(env->tlb));
+    if (kvm_enabled()) {
+        kvm_arch_reset_vcpu(env);
+    }
 #endif
 
     restore_fp_status(env);
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 1d9a4009b9..cf3fce4577 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -329,6 +329,7 @@ typedef struct CPUArchState {
     MemoryRegion iocsr_mem;
     bool load_elf;
     uint64_t elf_address;
+    uint32_t mp_state;
 #endif
 } CPULoongArchState;
 
@@ -414,6 +415,7 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
 }
 
 void loongarch_cpu_list(void);
+void kvm_arch_reset_vcpu(CPULoongArchState *env);
 
 #define cpu_list loongarch_cpu_list
 
diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
index 24327aaf71..640fca52fa 100644
--- a/target/loongarch/kvm.c
+++ b/target/loongarch/kvm.c
@@ -26,19 +26,377 @@
 #include "sysemu/runstate.h"
 #include "cpu-csr.h"
 #include "kvm_loongarch.h"
+#include "trace.h"
 
 static bool cap_has_mp_state;
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
 
+static int kvm_loongarch_get_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    struct kvm_regs regs;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    /* Get the current register set as KVM seems it */
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
+    if (ret < 0) {
+        trace_kvm_failed_get_regs_core(strerror(errno));
+        return ret;
+    }
+    /* gpr[0] value is always 0 */
+    env->gpr[0] = 0;
+    for (i = 1; i < 32; i++) {
+        env->gpr[i] = regs.gpr[i];
+    }
+
+    env->pc = regs.pc;
+    return ret;
+}
+
+static int kvm_loongarch_put_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    struct kvm_regs regs;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    /* Set the registers based on QEMU's view of things */
+    for (i = 0; i < 32; i++) {
+        regs.gpr[i] = env->gpr[i];
+    }
+
+    regs.pc = env->pc;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_REGS, &regs);
+    if (ret < 0) {
+        trace_kvm_failed_put_regs_core(strerror(errno));
+    }
+
+    return ret;
+}
+
+static int kvm_larch_getq(CPUState *cs, uint64_t reg_id,
+                                 uint64_t *addr)
+{
+    struct kvm_one_reg csrreg = {
+        .id = reg_id,
+        .addr = (uintptr_t)addr
+    };
+
+    return kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &csrreg);
+}
+static int kvm_larch_putq(CPUState *cs, uint64_t reg_id,
+                                 uint64_t *addr)
+{
+    struct kvm_one_reg csrreg = {
+        .id = reg_id,
+        .addr = (uintptr_t)addr
+    };
+
+    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &csrreg);
+}
+
+#define LOONGARCH_CSR_64(_R, _S)  \
+        (KVM_REG_LOONGARCH_CSR | KVM_REG_SIZE_U64 | (8 * (_R) + (_S)))
+
+#define KVM_IOC_CSRID(id) LOONGARCH_CSR_64(id, 0)
+
+#define KVM_GET_ONE_UREG64(cs, ret, regidx, addr)                 \
+    ({                                                            \
+        err = kvm_larch_getq(cs, KVM_IOC_CSRID(regidx), addr);    \
+        if (err < 0) {                                            \
+            ret = err;                                            \
+            trace_kvm_failed_get_csr(regidx, strerror(errno));    \
+        }                                                         \
+    })
+
+#define KVM_PUT_ONE_UREG64(cs, ret, regidx, addr)                 \
+    ({                                                            \
+        err = kvm_larch_putq(cs, KVM_IOC_CSRID(regidx), addr);    \
+        if (err < 0) {                                            \
+            ret = err;                                            \
+            trace_kvm_failed_put_csr(regidx, strerror(errno));    \
+        }                                                         \
+    })
+
+static int kvm_loongarch_get_csr(CPUState *cs)
+{
+    int err, ret = 0;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_CRMD, &env->CSR_CRMD);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRMD, &env->CSR_PRMD);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_EUEN, &env->CSR_EUEN);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_MISC, &env->CSR_MISC);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_ECFG, &env->CSR_ECFG);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_ESTAT, &env->CSR_ESTAT);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_ERA, &env->CSR_ERA);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_BADV, &env->CSR_BADV);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_BADI, &env->CSR_BADI);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_EENTRY, &env->CSR_EENTRY);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBIDX, &env->CSR_TLBIDX);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBEHI, &env->CSR_TLBEHI);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBELO0, &env->CSR_TLBELO0);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBELO1, &env->CSR_TLBELO1);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_ASID, &env->CSR_ASID);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGDL, &env->CSR_PGDL);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGDH, &env->CSR_PGDH);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGD, &env->CSR_PGD);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PWCL, &env->CSR_PWCL);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PWCH, &env->CSR_PWCH);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_STLBPS, &env->CSR_STLBPS);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_RVACFG, &env->CSR_RVACFG);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_CPUID, &env->CSR_CPUID);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG1, &env->CSR_PRCFG1);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG2, &env->CSR_PRCFG2);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG3, &env->CSR_PRCFG3);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(0), &env->CSR_SAVE[0]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(1), &env->CSR_SAVE[1]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(2), &env->CSR_SAVE[2]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(3), &env->CSR_SAVE[3]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(4), &env->CSR_SAVE[4]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(5), &env->CSR_SAVE[5]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(6), &env->CSR_SAVE[6]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(7), &env->CSR_SAVE[7]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TID, &env->CSR_TID);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_CNTC, &env->CSR_CNTC);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TICLR, &env->CSR_TICLR);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_LLBCTL, &env->CSR_LLBCTL);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_IMPCTL1, &env->CSR_IMPCTL1);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_IMPCTL2, &env->CSR_IMPCTL2);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRENTRY, &env->CSR_TLBRENTRY);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRBADV, &env->CSR_TLBRBADV);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRERA, &env->CSR_TLBRERA);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRSAVE, &env->CSR_TLBRSAVE);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRELO0, &env->CSR_TLBRELO0);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRELO1, &env->CSR_TLBRELO1);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBREHI, &env->CSR_TLBREHI);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRPRMD, &env->CSR_TLBRPRMD);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(0), &env->CSR_DMW[0]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(1), &env->CSR_DMW[1]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(2), &env->CSR_DMW[2]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(3), &env->CSR_DMW[3]);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TVAL, &env->CSR_TVAL);
+    KVM_GET_ONE_UREG64(cs, ret, LOONGARCH_CSR_TCFG, &env->CSR_TCFG);
+
+    return ret;
+}
+
+static int kvm_loongarch_put_csr(CPUState *cs)
+{
+    int err, ret = 0;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_CRMD, &env->CSR_CRMD);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRMD, &env->CSR_PRMD);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_EUEN, &env->CSR_EUEN);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_MISC, &env->CSR_MISC);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_ECFG, &env->CSR_ECFG);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_ESTAT, &env->CSR_ESTAT);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_ERA, &env->CSR_ERA);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_BADV, &env->CSR_BADV);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_BADI, &env->CSR_BADI);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_EENTRY, &env->CSR_EENTRY);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBIDX, &env->CSR_TLBIDX);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBEHI, &env->CSR_TLBEHI);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBELO0, &env->CSR_TLBELO0);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBELO1, &env->CSR_TLBELO1);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_ASID, &env->CSR_ASID);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGDL, &env->CSR_PGDL);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGDH, &env->CSR_PGDH);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PGD, &env->CSR_PGD);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PWCL, &env->CSR_PWCL);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PWCH, &env->CSR_PWCH);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_STLBPS, &env->CSR_STLBPS);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_RVACFG, &env->CSR_RVACFG);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_CPUID, &env->CSR_CPUID);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG1, &env->CSR_PRCFG1);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG2, &env->CSR_PRCFG2);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_PRCFG3, &env->CSR_PRCFG3);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(0), &env->CSR_SAVE[0]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(1), &env->CSR_SAVE[1]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(2), &env->CSR_SAVE[2]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(3), &env->CSR_SAVE[3]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(4), &env->CSR_SAVE[4]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(5), &env->CSR_SAVE[5]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(6), &env->CSR_SAVE[6]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_SAVE(7), &env->CSR_SAVE[7]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TID, &env->CSR_TID);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_CNTC, &env->CSR_CNTC);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TICLR, &env->CSR_TICLR);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_LLBCTL, &env->CSR_LLBCTL);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_IMPCTL1, &env->CSR_IMPCTL1);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_IMPCTL2, &env->CSR_IMPCTL2);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRENTRY, &env->CSR_TLBRENTRY);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRBADV, &env->CSR_TLBRBADV);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRERA, &env->CSR_TLBRERA);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRSAVE, &env->CSR_TLBRSAVE);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRELO0, &env->CSR_TLBRELO0);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRELO1, &env->CSR_TLBRELO1);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBREHI, &env->CSR_TLBREHI);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TLBRPRMD, &env->CSR_TLBRPRMD);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(0), &env->CSR_DMW[0]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(1), &env->CSR_DMW[1]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(2), &env->CSR_DMW[2]);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_DMW(3), &env->CSR_DMW[3]);
+    /*
+     * timer cfg must be put at last since it is used to enable
+     * guest timer
+     */
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TVAL, &env->CSR_TVAL);
+    KVM_PUT_ONE_UREG64(cs, ret, LOONGARCH_CSR_TCFG, &env->CSR_TCFG);
+    return ret;
+}
+
+static int kvm_loongarch_get_regs_fp(CPUState *cs)
+{
+    int ret, i;
+    struct kvm_fpu fpu;
+
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_FPU, &fpu);
+    if (ret < 0) {
+        trace_kvm_failed_get_fpu(strerror(errno));
+        return ret;
+    }
+
+    env->fcsr0 = fpu.fcsr;
+    for (i = 0; i < 32; i++) {
+        env->fpr[i] = fpu.fpr[i].val64[0];
+    }
+    for (i = 0; i < 8; i++) {
+        env->cf[i] = fpu.fcc & 0xFF;
+        fpu.fcc = fpu.fcc >> 8;
+    }
+
+    return ret;
+}
+
+static int kvm_loongarch_put_regs_fp(CPUState *cs)
+{
+    int ret, i;
+    struct kvm_fpu fpu;
+
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    fpu.fcsr = env->fcsr0;
+    fpu.fcc = 0;
+    for (i = 0; i < 32; i++) {
+        fpu.fpr[i].val64[0] = env->fpr[i];
+    }
+
+    for (i = 0; i < 8; i++) {
+        fpu.fcc |= env->cf[i] << (8 * i);
+    }
+
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_FPU, &fpu);
+    if (ret < 0) {
+        trace_kvm_failed_put_fpu(strerror(errno));
+    }
+
+    return ret;
+}
+
+void kvm_arch_reset_vcpu(CPULoongArchState *env)
+{
+    env->mp_state = KVM_MP_STATE_RUNNABLE;
+}
+
+static int kvm_loongarch_get_mpstate(CPUState *cs)
+{
+    int ret = 0;
+    struct kvm_mp_state mp_state;
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    if (cap_has_mp_state) {
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_MP_STATE, &mp_state);
+        if (ret) {
+            trace_kvm_failed_get_mpstate(strerror(errno));
+            return ret;
+        }
+        env->mp_state = mp_state.mp_state;
+    }
+
+    return ret;
+}
+
+static int kvm_loongarch_put_mpstate(CPUState *cs)
+{
+    int ret = 0;
+
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    struct kvm_mp_state mp_state = {
+        .mp_state = env->mp_state
+    };
+
+    if (cap_has_mp_state) {
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_MP_STATE, &mp_state);
+        if (ret) {
+            trace_kvm_failed_put_mpstate(strerror(errno));
+        }
+    }
+
+    return ret;
+}
+
 int kvm_arch_get_registers(CPUState *cs)
 {
-    return 0;
+    int ret;
+
+    ret = kvm_loongarch_get_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_get_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_get_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_get_mpstate(cs);
+
+    return ret;
 }
+
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    return 0;
+    int ret;
+
+    ret = kvm_loongarch_put_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_put_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_put_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_loongarch_put_mpstate(cs);
+
+    return ret;
 }
 
 int kvm_arch_init_vcpu(CPUState *cs)
diff --git a/target/loongarch/trace-events b/target/loongarch/trace-events
new file mode 100644
index 0000000000..67817fee67
--- /dev/null
+++ b/target/loongarch/trace-events
@@ -0,0 +1,11 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+#kvm.c
+kvm_failed_get_regs_core(const char *msg) "Failed to get core regs from KVM: %s"
+kvm_failed_put_regs_core(const char *msg) "Failed to put core regs into KVM: %s"
+kvm_failed_get_csr(int csr, const char *msg) "Failed to get csr 0x%x from KVM: %s"
+kvm_failed_put_csr(int csr, const char *msg) "Failed to put csr 0x%x into KVM: %s"
+kvm_failed_get_fpu(const char *msg) "Failed to get fpu from KVM: %s"
+kvm_failed_put_fpu(const char *msg) "Failed to put fpu into KVM: %s"
+kvm_failed_get_mpstate(const char *msg) "Failed to get mp_state from KVM: %s"
+kvm_failed_put_mpstate(const char *msg) "Failed to put mp_state into KVM: %s"
diff --git a/target/loongarch/trace.h b/target/loongarch/trace.h
new file mode 100644
index 0000000000..c2ecb78f08
--- /dev/null
+++ b/target/loongarch/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_loongarch.h"
-- 
2.31.1


