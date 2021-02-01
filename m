Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888E30A557
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:31:21 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WUK-0006QH-0T
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9K-0000rS-HY
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:55874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9B-0005rZ-BF
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF496ACB0;
 Mon,  1 Feb 2021 10:09:17 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 21/23] hw/core/cpu: call qemu_init_vcpu in
 cpu_common_realizefn
Date: Mon,  1 Feb 2021 11:09:01 +0100
Message-Id: <20210201100903.17309-22-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move the call to qemu_init_vcpu inside cpu_common_realizefn,
so it does not need to be done explicitly in each target cpu.

Despite this, the way cpu realize is done continues to be not ideal;

ideally the cpu_list_add would be done in common_cpu,
and in this case we could avoid even more redundant open coded
additional calls in target/xxx/cpu.c,

but this cannot happen because target cpu code, plugins, etc
now all came to rely on cpu->index
(which is updated in cpu_list_add), since no particular order
was defined previously, so we are stuck with the freak call
order for the target cpu realizefn.

After this patch the target/xxx/cpu.c realizefn body becomes:

void mycpu_realizefn(DeviceState *dev, Error **errp)
{
    /* ... */
    cpu_exec_realizefn(CPU_STATE(dev), errp);

    /* ... anything that needs done pre-qemu_vcpu_init */

    xcc->parent_realize(dev, errp); /* does qemu_vcpu_init */

    /* ... anything that needs to be done after qemu_vcpu_init */
}

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/core/cpu.c                   | 2 ++
 target/alpha/cpu.c              | 5 +----
 target/arm/cpu.c                | 4 +---
 target/avr/cpu.c                | 3 +--
 target/cris/cpu.c               | 2 --
 target/hppa/cpu.c               | 1 -
 target/i386/cpu.c               | 5 +----
 target/lm32/cpu.c               | 3 ---
 target/m68k/cpu.c               | 2 --
 target/microblaze/cpu.c         | 9 +++------
 target/mips/cpu.c               | 2 --
 target/moxie/cpu.c              | 4 +---
 target/nios2/cpu.c              | 4 +---
 target/openrisc/cpu.c           | 4 +---
 target/riscv/cpu.c              | 8 +++-----
 target/rx/cpu.c                 | 8 +++-----
 target/s390x/cpu.c              | 3 +--
 target/sh4/cpu.c                | 2 --
 target/sparc/cpu.c              | 4 +---
 target/tilegx/cpu.c             | 2 --
 target/tricore/cpu.c            | 2 --
 target/unicore32/cpu.c          | 6 +-----
 target/xtensa/cpu.c             | 2 --
 target/ppc/translate_init.c.inc | 5 ++---
 24 files changed, 23 insertions(+), 69 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07d..2d8103167b 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -310,6 +310,8 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
     CPUState *cpu = CPU(dev);
     Object *machine = qdev_get_machine();
 
+    qemu_init_vcpu(cpu);
+
     /* qdev_get_machine() can return something that's not TYPE_MACHINE
      * if this is one of the user-only emulators; in that case there's
      * no need to check the ignore_memory_transaction_failures board flag.
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e2..07406d5e38 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -56,18 +56,15 @@ static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 
 static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     AlphaCPUClass *acc = ALPHA_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_exec_realizefn(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-
     acc->parent_realize(dev, errp);
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8790a92797..05521c9ac5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1877,10 +1877,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     acc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index fa0f8e0e80..b1ffeac72d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -98,10 +98,9 @@ static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void avr_cpu_set_int(void *opaque, int irq, int level)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fc..da161dae1b 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -135,8 +135,6 @@ static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     ccc->parent_realize(dev, errp);
 }
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1f..2724f731b8 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -102,7 +102,6 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
     acc->parent_realize(dev, errp);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d7735f0ed3..dfa797c59b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6476,8 +6476,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     mce_init(cpu);
 
-    qemu_init_vcpu(cs);
-
+    xcc->parent_realize(dev, &local_err);
     /*
      * Most Intel and certain AMD CPUs support hyperthreading. Even though QEMU
      * fixes this issue by adjusting CPUID_0000_0001_EBX and CPUID_8000_0008_ECX
@@ -6504,8 +6503,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     cpu_reset(cs);
 
-    xcc->parent_realize(dev, &local_err);
-
 out:
     if (local_err != NULL) {
         error_propagate(errp, local_err);
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c..3c9987709e 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -133,9 +133,6 @@ static void lm32_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     cpu_reset(cs);
-
-    qemu_init_vcpu(cs);
-
     lcc->parent_realize(dev, errp);
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c6fde8132b..180ad04bd8 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -248,8 +248,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
     m68k_cpu_init_gdb(cpu);
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     mcc->parent_realize(dev, errp);
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba20203..5ee2c65ada 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -178,15 +178,14 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(dev);
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(dev);
     uint8_t version_code = 0;
     const char *version;
     int i = 0;
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_exec_realizefn(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -198,7 +197,7 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
+    mcc->parent_realize(dev, errp);
 
     version = cpu->cfg.version ? cpu->cfg.version : DEFAULT_CPU_VERSION;
     for (i = 0; mb_cpu_lookup[i].name && version; i++) {
@@ -264,8 +263,6 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
     cpu->cfg.mmu_tlb_access = 3;
     cpu->cfg.mmu_zones = 16;
     cpu->cfg.addr_mask = MAKE_64BIT_MASK(0, cpu->cfg.addr_size);
-
-    mcc->parent_realize(dev, errp);
 }
 
 static void mb_cpu_initfn(Object *obj)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad163ead62..993a5e0cac 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -624,8 +624,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     mvp_init(env);
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     mcc->parent_realize(dev, errp);
 }
 
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36..f3284e730d 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -66,10 +66,8 @@ static void moxie_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void moxie_cpu_initfn(Object *obj)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a38..e59ed9e135 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -121,10 +121,8 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     ncc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46..d7877ecfdd 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -105,10 +105,8 @@ static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     occ->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void openrisc_cpu_initfn(Object *obj)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a34238..cc00486b17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -372,7 +372,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
-static void riscv_cpu_realize(DeviceState *dev, Error **errp)
+static void riscv_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
@@ -517,10 +517,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void riscv_cpu_init(Object *obj)
@@ -601,7 +599,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
 
-    device_class_set_parent_realize(dc, riscv_cpu_realize,
+    device_class_set_parent_realize(dc, riscv_cpu_realizefn,
                                     &mcc->parent_realize);
 
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26..3dd2e649d3 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -106,7 +106,7 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-static void rx_cpu_realize(DeviceState *dev, Error **errp)
+static void rx_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RXCPUClass *rcc = RX_CPU_GET_CLASS(dev);
@@ -118,10 +118,8 @@ static void rx_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     rcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void rx_cpu_set_irq(void *opaque, int no, int request)
@@ -192,7 +190,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     CPUClass *cc = CPU_CLASS(klass);
     RXCPUClass *rcc = RX_CPU_CLASS(klass);
 
-    device_class_set_parent_realize(dc, rx_cpu_realize,
+    device_class_set_parent_realize(dc, rx_cpu_realizefn,
                                     &rcc->parent_realize);
     device_class_set_parent_reset(dc, rx_cpu_reset,
                                   &rcc->parent_reset);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1b..303932d51a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -232,8 +232,8 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
 #endif
     s390_cpu_gdb_init(cs);
-    qemu_init_vcpu(cs);
 
+    scc->parent_realize(dev, &err);
     /*
      * KVM requires the initial CPU reset ioctl to be executed on the target
      * CPU thread. CPU hotplug under single-threaded TCG will not work with
@@ -246,7 +246,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu_reset(cs);
     }
 
-    scc->parent_realize(dev, &err);
 out:
     error_propagate(errp, err);
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a78d283bc8..5ee540c6c5 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -186,8 +186,6 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     scc->parent_realize(dev, errp);
 }
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc8..82ed3c0152 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -739,9 +739,9 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(dev);
-    Error *local_err = NULL;
     SPARCCPU *cpu = SPARC_CPU(dev);
     CPUSPARCState *env = &cpu->env;
+    Error *local_err = NULL;
 
 #if defined(CONFIG_USER_ONLY)
     if ((env->def.features & CPU_FEATURE_FLOAT)) {
@@ -769,8 +769,6 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
-
     scc->parent_realize(dev, errp);
 }
 
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index d969c2f133..ae490bb9cd 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -93,8 +93,6 @@ static void tilegx_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     tcc->parent_realize(dev, errp);
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcb..56cae72fa3 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -93,8 +93,6 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, TRICORE_FEATURE_13);
     }
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     tcc->parent_realize(dev, errp);
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f84..04fc657ecb 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -84,18 +84,14 @@ static void uc32_any_cpu_initfn(Object *obj)
 
 static void uc32_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     UniCore32CPUClass *ucc = UNICORE32_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_exec_realizefn(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
-
-    qemu_init_vcpu(cs);
-
     ucc->parent_realize(dev, errp);
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c..ebe5dc2090 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -153,8 +153,6 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
 
     cs->gdb_num_regs = xcc->config->gdb_regmap.num_regs;
 
-    qemu_init_vcpu(cs);
-
     xcc->parent_realize(dev, errp);
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9867d0a6e4..e99106bc1c 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10093,7 +10093,7 @@ static int ppc_fixup_cpu(PowerPCCPU *cpu)
     return 0;
 }
 
-static void ppc_cpu_realize(DeviceState *dev, Error **errp)
+static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     PowerPCCPU *cpu = POWERPC_CPU(dev);
@@ -10143,7 +10143,6 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
                              pcc->gdb_num_sprs, "power-spr.xml", 0);
 #endif
-    qemu_init_vcpu(cs);
 
     pcc->parent_realize(dev, errp);
 
@@ -10850,7 +10849,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    device_class_set_parent_realize(dc, ppc_cpu_realize,
+    device_class_set_parent_realize(dc, ppc_cpu_realizefn,
                                     &pcc->parent_realize);
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
-- 
2.26.2


