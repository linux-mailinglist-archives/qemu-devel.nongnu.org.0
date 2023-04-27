Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9C6F01BB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:28:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prw2G-000575-Gb; Thu, 27 Apr 2023 03:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1prw1v-00052K-Mx
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:04 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1prw1q-0007cR-5v
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:03 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxKuq7I0pk5ncBAA--.2489S3;
 Thu, 27 Apr 2023 15:26:51 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axy7K1I0pk9Ec+AA--.18880S6; 
 Thu, 27 Apr 2023 15:26:51 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v2 4/9] target/loongarch: Implement kvm get/set registers
Date: Thu, 27 Apr 2023 15:26:40 +0800
Message-Id: <20230427072645.3368102-5-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axy7K1I0pk9Ec+AA--.18880S6
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3KFW7trWfKr17uw1DWryrtFb_yoW8Wr43Ko
 Z8C3Wfua45Jw4FkFsru3ZFqFyjqr9Y9an3Krn8XF4F93W7JrW5JryxG343tw42qF95XFy8
 A3WIqFn7XaykGrnxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqm1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
---
 meson.build                   |   1 +
 target/loongarch/kvm.c        | 356 +++++++++++++++++++++++++++++++++-
 target/loongarch/trace-events |  11 ++
 target/loongarch/trace.h      |   1 +
 4 files changed, 367 insertions(+), 2 deletions(-)
 create mode 100644 target/loongarch/trace-events
 create mode 100644 target/loongarch/trace.h

diff --git a/meson.build b/meson.build
index 29f8644d6d..b1b29299da 100644
--- a/meson.build
+++ b/meson.build
@@ -3039,6 +3039,7 @@ if have_system or have_user
     'target/s390x',
     'target/s390x/kvm',
     'target/sparc',
+    'target/loongarch',
   ]
 endif
 
diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
index 24327aaf71..50662fd3fb 100644
--- a/target/loongarch/kvm.c
+++ b/target/loongarch/kvm.c
@@ -26,19 +26,371 @@
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
+
+    for (i = 0; i < 32; i++) {
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
+static inline int kvm_larch_getq(CPUState *cs, uint64_t reg_id,
+                                 uint64_t *addr)
+{
+    struct kvm_one_reg csrreg = {
+        .id = reg_id,
+        .addr = (uintptr_t)addr
+    };
+
+    return kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &csrreg);
+}
+static inline int kvm_larch_putq(CPUState *cs, uint64_t reg_id,
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


