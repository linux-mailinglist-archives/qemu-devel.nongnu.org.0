Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE265C64F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrr-0000i4-8s; Tue, 03 Jan 2023 13:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClro-0000hS-54
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:28 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrm-0005N1-AR
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:27 -0500
Received: by mail-vs1-xe34.google.com with SMTP id a66so32590147vsa.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dq2GNw8hTG6FuOywlRgnm7eV4dHAv+6eWtmKAnnuvM=;
 b=ldD3932VuXmNbkNYj/Isy5eNYSF/pSk9KDHjhco/Sj2chf5ZGUWguR7wD3wgZEdaYk
 FhLxD9xzsLkrhs8VOLRIRti3Hz6HVZFh0U1vAxUc3GBzs3+6211nnxUG1ctgqnPTse20
 RKK6Z/7zBrX53PAsszBtzv0VyqZn5TF4yozItgyh5zjYa78a+Er9ZutB7JGhBNpK/Hyw
 oCq5A1EDJDXsVg24H2HyAe9K8OeCc2vO2+b/cTcsPncWAL0BU/6AZyHOEi00QRci9p/J
 AuGFgU64H1QzTrniQhhVBs6gA/Q4gZLS0rpPhvTW6VAHlWzTSDQ69DKDtlsLsMIvH8ya
 9Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dq2GNw8hTG6FuOywlRgnm7eV4dHAv+6eWtmKAnnuvM=;
 b=FUR/dD6ujQ0F2b0+CuhQ+v5tKzf4hBXxLrCyWVUuTKjBUBhI+OAR4rFmZHjJ1opmSh
 pOf2aMlR4ekVIN5B+XYyje/NeeYu0Wdc5E2gtVYIZ6vG/ZlLqbI/DBadg3G9iLo/3k9f
 a0qqOp7b9/Q9hV/6bhjt2qHUR+ixh6LSWn5KIfl2o7vamjGuuEsJl7W7XvrSCx5ETh2V
 /2A0s2cxPIfzbS6Kyob4y2kZ8pAq9aW95+4Bfwi+lUUUqTTAJY8t1MggtBqG1GeYwTyP
 almZqH6ftft2Ui7akFZITJY9hxH85EMH2ImZEEA3u1dzAs6JckrxKKYH+oWr75cUaYTR
 WkzA==
X-Gm-Message-State: AFqh2krlbtgriFaCTMTKqbls0hlRUMgY5uMZ/XVPl4KwY3X3At3a4WeP
 8TlkvWvFdOQ0xf6+IFmDPIKtS8Gg501VpecA47I=
X-Google-Smtp-Source: AMrXdXtuxB23vYnIrlg306dHDJLk+YTtjdTjxsx86xPbLwd42ZOP2GQJjTYbWtV8O8WgkCjKV7YQsQ==
X-Received: by 2002:a05:6102:38cc:b0:3c6:cf3d:8381 with SMTP id
 k12-20020a05610238cc00b003c6cf3d8381mr18135061vst.19.1672769905165; 
 Tue, 03 Jan 2023 10:18:25 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 32/40] target/arm: Move "midr" to class property
Date: Tue,  3 Jan 2023 10:16:38 -0800
Message-Id: <20230103181646.55711-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With the movement of the property, we can remove the field
from the cpu entirely, using only the class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h      |  1 -
 hw/arm/xilinx_zynq.c  |  9 ++++++---
 hw/intc/armv7m_nvic.c |  2 +-
 target/arm/cpu.c      | 18 ++++++++++++++++--
 target/arm/helper.c   | 14 ++++++++------
 5 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4b47a420d5..f2dceae0e7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -956,7 +956,6 @@ struct ArchCPU {
      * field by reading the value from the KVM vCPU.
      */
     ARMISARegisters isar;
-    uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
     uint64_t ctr;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..3e5b4f4483 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -177,6 +177,7 @@ static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
 static void zynq_init(MachineState *machine)
 {
     ZynqMachineState *zynq_machine = ZYNQ_MACHINE(machine);
+    ObjectClass *cpu_class;
     ARMCPU *cpu;
     MemoryRegion *address_space_mem = get_system_memory();
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
@@ -191,7 +192,11 @@ static void zynq_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    cpu = ARM_CPU(object_new(machine->cpu_type));
+    cpu_class = object_class_by_name(machine->cpu_type);
+
+    class_property_set_uint(cpu_class, "midr", ZYNQ_BOARD_MIDR, &error_fatal);
+
+    cpu = ARM_CPU(object_new_with_class(cpu_class));
 
     /* By default A9 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
@@ -201,8 +206,6 @@ static void zynq_init(MachineState *machine)
         object_property_set_bool(OBJECT(cpu), "has_el3", false, &error_fatal);
     }
 
-    object_property_set_int(OBJECT(cpu), "midr", ZYNQ_BOARD_MIDR,
-                            &error_fatal);
     object_property_set_int(OBJECT(cpu), "reset-cbar", MPCORE_PERIPHBASE,
                             &error_fatal);
     qdev_realize(DEVICE(cpu), NULL, &error_fatal);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..92f754a74f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1039,7 +1039,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return cpu->revidr;
     case 0xd00: /* CPUID Base.  */
-        return cpu->midr;
+        return ARM_CPU_GET_CLASS(cpu)->midr;
     case 0xd04: /* Interrupt Control State (ICSR) */
         /* VECTACTIVE */
         val = cpu->env.v7m.exception;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 22a6ccaece..7d68c50d7c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1209,7 +1209,6 @@ static void arm_cpu_initfn(Object *obj)
     cpu->env.features = acc->features;
     cpu->isar = acc->isar;
 
-    cpu->midr = acc->midr;
     cpu->ctr = acc->ctr;
     cpu->pmceid0 = acc->pmceid0;
     cpu->pmceid1 = acc->pmceid1;
@@ -2120,7 +2119,6 @@ static void cpu_arm_get_mp_affinity(Object *obj, Visitor *v, const char *name,
 }
 
 static Property arm_cpu_properties[] = {
-    DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
     DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_INT32("core-count", ARMCPU, core_count, -1),
     DEFINE_PROP_END_OF_LIST()
@@ -2173,6 +2171,17 @@ static const struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static bool arm_class_prop_uint64_ofs(ObjectClass *oc, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    uintptr_t ofs = (uintptr_t)opaque;
+    uint64_t *ptr = (void *)acc + ofs;
+
+    return visit_type_uint64(v, name, ptr, errp);
+}
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2220,6 +2229,11 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
      */
     acc->dtb_compatible = "qemu,unknown";
     acc->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
+
+    class_property_add(oc, "midr", "uint64", NULL,
+                       arm_class_prop_uint64_ofs,
+                       arm_class_prop_uint64_ofs,
+                       (void *)(uintptr_t)offsetof(ARMCPUClass, midr));
 }
 
 static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 43756e130a..d18200ed16 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7443,6 +7443,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
     CPUARMState *env = &cpu->env;
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cpu);
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         /* M profile has no coprocessor registers */
         return;
@@ -7926,12 +7928,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = cpu->midr,
+              .resetvalue = acc->midr,
               .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
             { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
-              .access = PL2_RW, .resetvalue = cpu->midr,
+              .access = PL2_RW, .resetvalue = acc->midr,
               .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
@@ -8106,7 +8108,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
              */
             { .name = "MIDR",
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = CP_ANY,
-              .access = PL1_R, .resetvalue = cpu->midr,
+              .access = PL1_R, .resetvalue = acc->midr,
               .writefn = arm_cp_write_ignore, .raw_writefn = raw_write,
               .readfn = midr_read,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
@@ -8131,16 +8133,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo id_v8_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 0,
-              .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
+              .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = acc->midr,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
             /* crn = 0 op1 = 0 crm = 0 op2 = 4,7 : AArch32 aliases of MIDR */
             { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 4,
-              .access = PL1_R, .resetvalue = cpu->midr },
+              .access = PL1_R, .resetvalue = acc->midr },
             { .name = "MIDR", .type = ARM_CP_ALIAS | ARM_CP_CONST,
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 7,
-              .access = PL1_R, .resetvalue = cpu->midr },
+              .access = PL1_R, .resetvalue = acc->midr },
             { .name = "REVIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 6,
               .access = PL1_R,
-- 
2.34.1


