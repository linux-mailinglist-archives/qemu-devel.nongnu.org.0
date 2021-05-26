Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D101D3923BF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:24:42 +0200 (CEST)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3pJ-0002RJ-V0
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FY-00064d-1L
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FO-0004bV-6B
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b7so1442570plg.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pgfHDBcBGjm3dTOmqTxTp7GXgcPswruAXgL6gnPssQw=;
 b=x3zI1jfohF2bQiefU9wXXY/rnpwJGCrJskQ5nYVY7njT6PkZdiEGCz1FmuyPtpnn7d
 UTczZv3EqAdKxPz0GsfrBeUh9cu8uTH2XwSNJ/7NTHKYo3KOr53tIF8NxXWCz66k7JeS
 FO8QA1Sh3Bh9GFOH+Mi6/gfC9Cy2KFGLd7DkFC2FWSn3YobPt4If8GKk0xPmxG53F6bC
 tF3sCH8h4ZramrQVYXfQVkh/Xh/cNME4wgB23CNRiyK6W0jHlkYxbfoisJJIs5oUbCfr
 uHzKW8Tup2q3jw9wjiH2KRDfStgut8PphckZcFNEry8pbWILgn/Cfsr5Xtx+KhJwCMa+
 xseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pgfHDBcBGjm3dTOmqTxTp7GXgcPswruAXgL6gnPssQw=;
 b=aZdAOBkjajNjT7WAJ9R7CpZ2jVl+R6nqpS/yxpLvsDrBcTfudtYeTKkUOPaZ7sHNUt
 NKfK24gQ9ISuNvBg32dlnlWkmezyXwFekmzEG9cJCa8WX1+hY4QA0/Uxoiog4wRKoAiy
 g3mJwbn3ZHR3/sTk2th7AFZN7pVwmNp2rswpMxm+ctp/iyz6CXKsvBpK2Sw6Nq0LNGOZ
 ZjNhrF4K91M1j+o3m8TdAbvzo7qhF1j9a3RziSIFrJRnAj8FTP1IxSY4IbFLC3n2ejwE
 KtS7s8/73P1V8/8LuhuxnQr1rG97ctEW5gncA3ZyAjDJwwlm2Ldd8CHoo9ABiUh4gW3B
 4lVg==
X-Gm-Message-State: AOAM5338AlkJcQhmq6bQGwnxHxjJIA5dp1gRE1/OZbR2oulixk5GXadL
 JAXjHAqFrer9Db4qcbCEqxtq+6zD0DWlIQ==
X-Google-Smtp-Source: ABdhPJxzp3drtTZCYXb/DeLS0PluoFBDFx1d7kRvvttzNuTMwU8RW926W+jDv3jRtZKCla+hdGJsiA==
X-Received: by 2002:a17:90a:d193:: with SMTP id
 fu19mr692468pjb.103.1622072852899; 
 Wed, 26 May 2021 16:47:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/31] cpu: Move CPUClass::write_elf* to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:04 -0700
Message-Id: <20210526234710.125396-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-19-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            | 17 -----------------
 include/hw/core/sysemu-cpu-ops.h | 24 ++++++++++++++++++++++++
 hw/core/cpu-sysemu.c             | 16 ++++++++--------
 target/arm/cpu.c                 |  4 ++--
 target/i386/cpu.c                |  8 ++++----
 target/ppc/cpu_init.c            |  6 ++----
 target/riscv/cpu.c               |  4 ++--
 target/s390x/cpu.c               |  2 +-
 8 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bf7d11b14f..15b16d3f6d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -113,14 +113,6 @@ struct SysemuCPUOps;
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
- * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
- * 64-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
- * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
- * 32-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -164,15 +156,6 @@ struct CPUClass {
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
-    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index b9383101fc..52ac0ae4e1 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,30 @@ typedef struct SysemuCPUOps {
      * GUEST_PANICKED events.
      */
     GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
+    /**
+     * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
+     * 32-bit VM coredump.
+     */
+    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
+     * 64-bit VM coredump.
+     */
+    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 32-bit VM coredump.
+     */
+    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
+    /**
+     * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 64-bit VM coredump.
+     */
+    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      * runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 90b5ac8eb9..d55ef8d23d 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -84,10 +84,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_qemunote) {
+    if (!cc->sysemu_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -95,10 +95,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_note) {
+    if (!cc->sysemu_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -106,10 +106,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_qemunote) {
+    if (!cc->sysemu_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -117,10 +117,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 bool cpu_virtio_is_big_endian(CPUState *cpu)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0111201235..18627cc3c6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1948,6 +1948,8 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .write_elf32_note = arm_cpu_write_elf32_note,
+    .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
@@ -1992,8 +1994,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 7761f2fa4c..2ba82921d6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6719,6 +6719,10 @@ static Property x86_cpu_properties[] = {
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_crash_info = x86_cpu_get_crash_info,
+    .write_elf32_note = x86_cpu_write_elf32_note,
+    .write_elf64_note = x86_cpu_write_elf64_note,
+    .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
+    .write_elf64_qemunote = x86_cpu_write_elf64_qemunote,
     .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -6753,10 +6757,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 108e0c6580..16d966696b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9267,6 +9267,8 @@ static Property ppc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .write_elf32_note = ppc32_cpu_write_elf32_note,
+    .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
@@ -9316,10 +9318,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
-#if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
-#endif
 
     cc->gdb_num_core_regs = 71;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 44b1f70051..80cee005a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -600,6 +600,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
+    .write_elf64_note = riscv_cpu_write_elf64_note,
+    .write_elf32_note = riscv_cpu_write_elf32_note,
     .legacy_vmsd = &vmstate_riscv_cpu,
 };
 #endif
@@ -647,8 +649,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->sysemu_ops = &riscv_sysemu_ops;
-    cc->write_elf64_note = riscv_cpu_write_elf64_note;
-    cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d2175a87f5..157ef61d38 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -481,6 +481,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct SysemuCPUOps s390_sysemu_ops = {
     .get_crash_info = s390_cpu_get_crash_info,
+    .write_elf64_note = s390_cpu_write_elf64_note,
     .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -525,7 +526,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-- 
2.25.1


