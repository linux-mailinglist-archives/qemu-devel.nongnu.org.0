Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3B39236B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:53:10 +0200 (CEST)
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Kn-0006Rr-Ud
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FQ-0005rT-O1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FL-0004Yl-Gi
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g24so1691531pji.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kb2aLPKfx0CQ9Hf4+41N7G1NBfcWaM1Shon1mRJKU2U=;
 b=SdRctEsY442kh93J6uIWb4BDbawR+qEK33hizaSsigfGGC0HNcSIKZkp+22O8QS0Ev
 incP7w7AP/xn2LB/RZJngKtcbYI/sDwTQTbqGsdFf7t9VRK9sfr164x+AimPuJ1YtNuw
 Us5ziMz1qEsQDZU0L8PkEFn7GcBpcHzGLT1TBpyG3xpJkJHZ6IRjru4FIg6coOXPdzYM
 WLin19MBMO6d2G9h0Yj9BNVF7RpzI759bMTo/056Hlf1BVeIhPbel6yHpsiUsCXhdFJT
 mf6o1ZtP84lFBhA8CB72TLs9Rtd2FX4UBDcjYjRxBOxdX2th2Hl6BsMr0oUpHLNipjtx
 UYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kb2aLPKfx0CQ9Hf4+41N7G1NBfcWaM1Shon1mRJKU2U=;
 b=tyxvveJn1a8X4pZK9ZBQeryFOv9J2TB6BJsVtcGgxykvUV9c9JqAgQRtfRHzIOdMje
 gX7gLYWx3c/ITsH8UfY5U3XO7Mdza9FQGI6zDUvuR5eiQQo2GDQeiP8bsV4lqSgUj66i
 4po1RqzxKrOh/BDcHAEO8sOU+ym9UOtd9YnGC2EWB6hcPOGOH+2ZHAB3hVTT9NYSxELi
 I+Ty+HSyLyx4eok3KjRPBsc+nvYcVj+Y/+yF7VcWOQxoqLvwsC5t2q1JFMU8j5MJHLe8
 g+H4MLSh9+RCVRknHUo1xkopbcgo6lyxkke3NUjfB6paOBP3lfdCJSr0sVpPNyuSxaI3
 +DIA==
X-Gm-Message-State: AOAM5331evcmcJs6dg5YIdJH7qAUONMwnL678nml+32jZMwhpMTOFs2p
 BuExIB98newPRk57llcVqgjszzbNG4KU2A==
X-Google-Smtp-Source: ABdhPJznQZ3LiBwhaW9ZtDDLh0ZFhp3oIdisGihbBriOgOXi/k7yR7LXSiL/Ze4laIwzjW+/E3Rh0Q==
X-Received: by 2002:a17:902:d64e:b029:ef:8b85:d299 with SMTP id
 y14-20020a170902d64eb02900ef8b85d299mr520514plh.27.1622072850158; 
 Wed, 26 May 2021 16:47:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/31] cpu: Move CPUClass::vmsd to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:01 -0700
Message-Id: <20210526234710.125396-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Migration is specific to system emulation.

- Move the CPUClass::vmsd field to SysemuCPUOps,
- restrict VMSTATE_CPU() macro to sysemu,
- vmstate_dummy is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-16-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            |  8 ++------
 include/hw/core/sysemu-cpu-ops.h |  6 ++++++
 include/migration/vmstate.h      |  2 --
 cpu.c                            | 15 +++++++--------
 stubs/vmstate.c                  |  2 --
 target/arm/cpu.c                 |  2 +-
 target/i386/cpu.c                |  2 +-
 target/mips/cpu.c                |  2 +-
 target/ppc/cpu_init.c            |  2 +-
 target/riscv/cpu.c               |  2 +-
 target/s390x/cpu.c               |  2 +-
 target/sparc/cpu.c               |  2 +-
 12 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index cd3fb70cb5..c8d4a8a642 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -125,8 +125,6 @@ struct SysemuCPUOps;
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @legacy_vmsd: Legacy state description for migration.
- *               Do not use in new targets, use #DeviceClass::vmsd instead.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -181,7 +179,6 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *legacy_vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
@@ -1065,10 +1062,8 @@ bool target_words_bigendian(void);
 #ifdef NEED_CPU_H
 
 #ifdef CONFIG_SOFTMMU
+
 extern const VMStateDescription vmstate_cpu_common;
-#else
-#define vmstate_cpu_common vmstate_dummy
-#endif
 
 #define VMSTATE_CPU() {                                                     \
     .name = "parent_obj",                                                   \
@@ -1077,6 +1072,7 @@ extern const VMStateDescription vmstate_cpu_common;
     .flags = VMS_STRUCT,                                                    \
     .offset = 0,                                                            \
 }
+#endif /* CONFIG_SOFTMMU */
 
 #endif /* NEED_CPU_H */
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index e54a08ea25..0370ac1519 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,12 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @legacy_vmsd: Legacy state for migration.
+     *               Do not use in new targets, use #DeviceClass::vmsd instead.
+     */
+    const VMStateDescription *legacy_vmsd;
+
 } SysemuCPUOps;
 
 #endif /* SYSEMU_CPU_OPS_H */
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 075ee80096..8df7b69f38 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,8 +194,6 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };
 
-extern const VMStateDescription vmstate_dummy;
-
 extern const VMStateInfo vmstate_info_bool;
 
 extern const VMStateInfo vmstate_info_int8;
diff --git a/cpu.c b/cpu.c
index e3f9804f13..164fefeaa3 100644
--- a/cpu.c
+++ b/cpu.c
@@ -128,7 +128,9 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
+#endif
 
     cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
@@ -144,26 +146,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-    assert(cc->legacy_vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->legacy_vmsd, cpu);
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-#ifdef CONFIG_USER_ONLY
-    assert(cc->legacy_vmsd == NULL);
-#else
-    if (cc->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->legacy_vmsd, cpu);
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index cc4fe41dfc..8513d9204e 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,8 +1,6 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"
 
-const VMStateDescription vmstate_dummy = {};
-
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
                                    const VMStateDescription *vmsd,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0116e9d8e8..bd623a4961 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1948,6 +1948,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
 
@@ -1990,7 +1991,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->legacy_vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e422fab49a..761fffee34 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6718,6 +6718,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
 
@@ -6756,7 +6757,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->legacy_vmsd = &vmstate_x86_cpu;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 9a8c484cb4..7aa3f3ecf5 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -525,6 +525,7 @@ static Property mips_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps mips_sysemu_ops = {
+    .legacy_vmsd = &vmstate_mips_cpu,
 };
 #endif
 
@@ -568,7 +569,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_mips_cpu;
     cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 302b9b92a5..5121f9cfd4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9267,6 +9267,7 @@ static Property ppc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
 
@@ -9312,7 +9313,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_ppc_cpu;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b2b4a0baf4..44b1f70051 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -600,6 +600,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .legacy_vmsd = &vmstate_riscv_cpu,
 };
 #endif
 
@@ -645,7 +646,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->sysemu_ops = &riscv_sysemu_ops;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 77800e99b9..d7ab7c95b1 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
 
@@ -523,7 +524,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 70be0ecf5e..ffe85a7f59 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -852,6 +852,7 @@ static Property sparc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps sparc_sysemu_ops = {
+    .legacy_vmsd = &vmstate_sparc_cpu,
 };
 #endif
 
@@ -896,7 +897,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vmstate_sparc_cpu;
     cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
-- 
2.25.1


