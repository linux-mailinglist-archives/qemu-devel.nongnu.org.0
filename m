Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0944669450
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHQp-0004RX-0T; Fri, 13 Jan 2023 05:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHQm-0004Qp-5G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:37:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pGHQj-0008Jv-Ey
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:37:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id q8so3162089wmo.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTx5bej53p4aZG7Y8vT5uMw2vQpJvrGmkuGu4VWPpck=;
 b=jLHr+o1UKMvZPmjkM9ZMLpVMUqu/JOljzFOPFq+nJZF9U6YAR+pUk41D6eMyzNl7WP
 yEN/igpmYaO0pmHvu5Lc+4aknbivW4D+kQI+GYUEyZB3oXJbtS5UijZsRz7D1qgoNk2/
 g4OIoL6RAQmM7WIDkpbX67jULdtvybsIsuKw8esB6cJaaRJxXGAEC/aC2+OapCOJBuO6
 fvShetiAgP/nQD9LUg4hBKder2H9RIiH62QSaw9jXj3QhxMcESovUGXE0hDUFGbrSCVM
 nPlOSxMtUzQs9ufv4ygxyzhLwLyKc9kVhD66mqoX4M1M9qCbNkvDEpkg6sB7N+ZKY/G3
 ZLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTx5bej53p4aZG7Y8vT5uMw2vQpJvrGmkuGu4VWPpck=;
 b=k3wjRoxM0yxxxhQX7Djy63VlwGdswfEOYbY6Jrs617NtaOtu+u+evDLCzmDC2yEti9
 lGGgoVCt8rPS1QBjx1AcB4Tbwh8d4fWr6QAhdWbdhEMCRrftRhPATnLEtGRYSmW6ET4E
 mddw1RuKfcMmXgIYrSJFlfUezTWF46ebvUOZRrIDjy3dLaIzlhoHZnLrC1lz1KUtwMZL
 x+WqTHlS999Us7ENHZ1yxO4AevGUSu0DKtYeEgINY+a+hUSrjc3Tsz7sZKfHTVEF1qQm
 nhTWKLvF1HPAnPdXV8hl6lTF/ye/WFOAeVT1nChUj3bspkhhxYWRzbOYezDtRQc+AHlM
 WknQ==
X-Gm-Message-State: AFqh2kqYvn1EyH7XBvt0D4Y3t3I1mA3AYCEJb+y3L4Z1SbBnmm8lPOM1
 nBc6C0GSTsiAcc2am89xPP18IA==
X-Google-Smtp-Source: AMrXdXskE3MuCNe2xeoHERH8Ho8VUeeNCyMvUlIOduGhoynOW3RRgRDxzZdwZ+xIY0quEWC/FFjCUg==
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id
 n19-20020a05600c3b9300b003d21bf65796mr58945798wms.35.1673606219900; 
 Fri, 13 Jan 2023 02:36:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b003d237d60318sm24696480wmb.2.2023.01.13.02.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:36:59 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Ludovic Henry <ludovic@rivosinc.com>
Subject: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Date: Fri, 13 Jan 2023 11:34:53 +0100
Message-Id: <20230113103453.42776-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113103453.42776-1-alexghiti@rivosinc.com>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

RISC-V specifies multiple sizes for addressable memory and Linux probes for
the machine's support at startup via the satp CSR register (done in
csr.c:validate_vm).

As per the specification, sv64 must support sv57, which in turn must
support sv48...etc. So we can restrict machine support by simply setting the
"highest" supported mode and the bare mode is always supported.

You can set the satp mode using the new properties "sv32", "sv39", "sv48",
"sv57" and "sv64" as follows:
-cpu rv64,sv57=on  # Linux will boot using sv57 scheme
-cpu rv64,sv39=on  # Linux will boot using sv39 scheme
-cpu rv64,sv57=off # Linux will boot using sv48 scheme
-cpu rv64          # Linux will boot using sv57 scheme by default

We take the highest level set by the user:
-cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme

We make sure that invalid configurations are rejected:
-cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
-cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
                           # enabled

We accept "redundant" configurations:
-cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
-cpu rv64,sv32=on,sv32=off # Linux will boot using sv57 scheme (the default)

In addition, we now correctly set the device-tree entry 'mmu-type' using
those new properties.

Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 hw/riscv/virt.c    |  19 ++--
 target/riscv/cpu.c | 221 +++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  19 ++++
 target/riscv/csr.c |  17 +++-
 4 files changed, 262 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..48d034a5f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7181b34f86..1f0d040a80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -27,6 +27,7 @@
 #include "time_helper.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -229,6 +230,85 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
+static uint8_t satp_mode_from_str(const char *satp_mode_str)
+{
+    if (!strncmp(satp_mode_str, "sv32", 4)) {
+        return VM_1_10_SV32;
+    }
+
+    if (!strncmp(satp_mode_str, "sv39", 4)) {
+        return VM_1_10_SV39;
+    }
+
+    if (!strncmp(satp_mode_str, "sv48", 4)) {
+        return VM_1_10_SV48;
+    }
+
+    if (!strncmp(satp_mode_str, "sv57", 4)) {
+        return VM_1_10_SV57;
+    }
+
+    if (!strncmp(satp_mode_str, "sv64", 4)) {
+        return VM_1_10_SV64;
+    }
+
+    g_assert_not_reached();
+}
+
+uint8_t satp_mode_max_from_map(uint32_t map)
+{
+    /* map here has at least one bit set, so no problem with clz */
+    return 31 - __builtin_clz(map);
+}
+
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
+{
+    if (is_32_bit) {
+        switch (satp_mode) {
+        case VM_1_10_SV32:
+            return "sv32";
+        case VM_1_10_MBARE:
+            return "none";
+        }
+    } else {
+        switch (satp_mode) {
+        case VM_1_10_SV64:
+            return "sv64";
+        case VM_1_10_SV57:
+            return "sv57";
+        case VM_1_10_SV48:
+            return "sv48";
+        case VM_1_10_SV39:
+            return "sv39";
+        case VM_1_10_MBARE:
+            return "none";
+        }
+    }
+
+    g_assert_not_reached();
+}
+
+static void set_satp_mode(RISCVCPU *cpu, const char *satp_mode_str)
+{
+    cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str(satp_mode_str));
+}
+
+static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
+{
+    /*
+     * If an mmu is present, the default satp mode is:
+     * - sv32 for 32-bit
+     * - sv57 for 64-bit
+     * Otherwise, it is mbare.
+     */
+
+    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
+        set_satp_mode(cpu, is_32_bit ? "sv32" : "sv57");
+    } else {
+        set_satp_mode(cpu, "mbare");
+    }
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -619,6 +699,53 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
+{
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+    const char *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
+
+    /* Get rid of 32-bit/64-bit incompatibility */
+    for (int i = 0; i < 16; ++i) {
+        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
+            error_setg(errp, "satp_mode %s is not valid",
+                       satp_mode_str(i, !rv32));
+            return;
+        }
+    }
+
+    /*
+     * Make sure the user did not ask for an invalid configuration as per
+     * the specification.
+     */
+    if (!rv32) {
+        uint8_t satp_mode_max;
+
+        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+
+        for (int i = satp_mode_max - 1; i >= 0; --i) {
+            if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
+                (cpu->cfg.satp_mode.init & (1 << i)) &&
+                valid_vm[i]) {
+                error_setg(errp, "cannot disable %s satp mode if %s "
+                           "is enabled", satp_mode_str(i, false),
+                           satp_mode_str(satp_mode_max, false));
+                return;
+            }
+        }
+    }
+}
+
+static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    Error *local_err = NULL;
+
+    riscv_cpu_satp_mode_finalize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -919,6 +1046,55 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
      }
 #endif
 
+    bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
+
+    if (cpu->cfg.satp_mode.map == 0) {
+        /*
+         * If unset by both the user and the cpu, we fallback to the default
+         * satp mode.
+         */
+        if (cpu->cfg.satp_mode.init == 0) {
+            set_satp_mode_default(cpu, rv32);
+        } else {
+            /*
+             * Find the lowest level that was disabled and then enable the
+             * first valid level below which can be found in
+             * valid_vm_1_10_32/64.
+             */
+            const char *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
+
+            for (int i = 0; i < 16; ++i) {
+                if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
+                    (cpu->cfg.satp_mode.init & (1 << i)) &&
+                    valid_vm[i]) {
+                    for (int j = i - 1; j >= 0; --j) {
+                        if (valid_vm[j]) {
+                            cpu->cfg.satp_mode.map |= (1 << j);
+                            break;
+                        }
+                    }
+                    break;
+                }
+            }
+
+            /*
+             * The user actually init a satp mode but appears to be invalid
+             * (ex: "-cpu rv64,sv32=on,sv32=off"). Fallback to the default
+             * mode.
+             */
+            if (cpu->cfg.satp_mode.map == 0) {
+                set_satp_mode_default(cpu, rv32);
+            }
+        }
+    }
+
+    riscv_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -927,6 +1103,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t satp = satp_mode_from_str(name);
+    bool value;
+
+    value = (satp_map->map & (1 << satp));
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVSATPMap *satp_map = opaque;
+    uint8_t satp = satp_mode_from_str(name);
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    satp_map->map = deposit32(satp_map->map, satp, 1, value);
+    satp_map->init |= 1 << satp;
+}
+
+static void riscv_add_satp_mode_properties(Object *obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+    object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
+                        cpu_riscv_set_satp, NULL, &cpu->cfg.satp_mode);
+}
+
 #ifndef CONFIG_USER_ONLY
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
@@ -1091,6 +1310,8 @@ static void register_cpu_props(Object *obj)
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    riscv_add_satp_mode_properties(obj);
 }
 
 static Property riscv_cpu_properties[] = {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..0ffa1bcfd5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "qapi/qapi-types-common.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -413,6 +414,17 @@ struct RISCVCPUClass {
     ResettablePhases parent_phases;
 };
 
+/*
+ * map is a 16-bit bitmap: the most significant set bit in map is the maximum
+ * satp mode that is supported.
+ *
+ * init is a 16-bit bitmap used to make sure the user selected a correct
+ * configuration as per the specification.
+ */
+typedef struct {
+    uint16_t map, init;
+} RISCVSATPMap;
+
 struct RISCVCPUConfig {
     bool ext_i;
     bool ext_e;
@@ -488,6 +500,8 @@ struct RISCVCPUConfig {
     bool debug;
 
     bool short_isa_string;
+
+    RISCVSATPMap satp_mode;
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
@@ -794,9 +808,14 @@ enum riscv_pmu_event_idx {
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
+extern const char valid_vm_1_10_32[], valid_vm_1_10_64[];
+
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 
+uint8_t satp_mode_max_from_map(uint32_t map);
+const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
+
 #endif /* RISCV_CPU_H */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..6e27299761 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1117,12 +1117,12 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-static const char valid_vm_1_10_32[16] = {
+const char valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV32] = 1
 };
 
-static const char valid_vm_1_10_64[16] = {
+const char valid_vm_1_10_64[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV39] = 1,
     [VM_1_10_SV48] = 1,
@@ -1211,10 +1211,17 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        return valid_vm_1_10_32[vm & 0xf];
+    uint8_t satp_mode_max;
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    bool is_32_bit = riscv_cpu_mxl(env) == MXL_RV32;
+
+    vm &= 0xf;
+    satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
+
+    if (is_32_bit) {
+        return valid_vm_1_10_32[vm] && (vm <= satp_mode_max);
     } else {
-        return valid_vm_1_10_64[vm & 0xf];
+        return valid_vm_1_10_64[vm] && (vm <= satp_mode_max);
     }
 }
 
-- 
2.37.2


