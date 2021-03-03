Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52832BC69
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:59:48 +0100 (CET)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZX1-0005Hc-1A
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLs-0004gG-5u; Wed, 03 Mar 2021 16:48:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLq-0002Ir-52; Wed, 03 Mar 2021 16:48:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id d15so10137809wrv.5;
 Wed, 03 Mar 2021 13:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXKlTeCnjmHxOIuW+5ok+sHuvv9dHK5aHCAXQUqIY0w=;
 b=SEZ4KBDcFeAeqQ/5JtNtzvNXQgdGlZcbsKkoAldLMpqwQ9bM41viT6moaATrG27Cr4
 sGitvPcB72EwpGsEuLWBOOZmA8cXMbO07pI+gmawAbmszagWVVKsNmzqTTnh4zLC92jl
 EquBq+ZStJ59VTrs63E1q+52qQZtMXEOfG8tnW7VpZBVtKQEaWrQ3UgvZsy1UuuMhCeY
 E3mqMQKxTpSONYg5tWR9sz40hWl091Tmg521XJahoHdJSdv/RqVsVpi8pY0DcXd7Vz8/
 53aFHfWPNUDarS4ewUItcEcl1J6cH8fEMNCu10bGuHCEyLOlETy1gq/I10d+mgVduaM6
 O3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YXKlTeCnjmHxOIuW+5ok+sHuvv9dHK5aHCAXQUqIY0w=;
 b=S4Rr0X4DqYuz/Vslz52RkKdGhKTfkWpteXp5WGw0s3lO6+1GM4cEGmi0JY6yJag4jf
 e1cpShBv2kDGRa42mZH+ItIGaSbi8b2bYMKDNogBeQXw6OAT18c1LofY2daQ2glk1OwJ
 DIWqxlGzpgewSJP34U2y0hwo2bFGO3rxExiJBN/Rp5LS5IukmeM+MAC9A1Jo3SXqpNoG
 ERQNa2pXt9GKxcJ2kFAyvJIg+1oLtRbANvXkPxkC+C1DD6SeZDy8IXYwLyugkJpwoHyA
 WgmF+bmqcCBaFCA2Hcc6+Kqv8XzA8Ta+3sjiCMKI/7lrZ8BFMDYIWYhsBs2CzFEmrvcw
 ZJAw==
X-Gm-Message-State: AOAM5338kedkOxx06sJNyydpt2VDW038GJUbkzclthSmPQE8JhNbdbAx
 sKvYlXxZtovxLTi4SZok/KK6MMkVs7g=
X-Google-Smtp-Source: ABdhPJxAONuByIIGIauhsjsh8+raA1mqasyYjOXylUqzsaoKTs3hTHMP9yjNuWo4rv2nPee/4+1GRg==
X-Received: by 2002:adf:e485:: with SMTP id i5mr820835wrm.26.1614808090992;
 Wed, 03 Mar 2021 13:48:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm14035298wrt.1.2021.03.03.13.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/28] cpu: Move CPUClass::write_elf* to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:51 +0100
Message-Id: <20210303214708.1727801-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 17 -----------------
 include/hw/core/sysemu-cpu-ops.h | 24 ++++++++++++++++++++++++
 hw/core/cpu.c                    | 16 ++++++++--------
 target/arm/cpu.c                 |  4 ++--
 target/i386/cpu.c                |  8 ++++----
 target/s390x/cpu.c               |  2 +-
 target/ppc/translate_init.c.inc  |  6 ++----
 7 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 781cd8fc42b..0a2c29c3735 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -112,14 +112,6 @@ struct AccelCPUClass;
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
@@ -163,15 +155,6 @@ struct CPUClass {
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
index b9ffca07665..60c667801ef 100644
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
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 0aebc18c41f..c74390aafbf 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -151,10 +151,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
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
@@ -162,10 +162,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
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
@@ -173,10 +173,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
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
@@ -184,10 +184,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fa0d4bba590..0c06b9b1758 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,8 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .write_elf32_note = arm_cpu_write_elf32_note,
+    .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
@@ -2306,8 +2308,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 362ad56ab68..403ed65fc61 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7389,6 +7389,10 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_crash_info = x86_cpu_get_crash_info,
+    .write_elf32_note = x86_cpu_write_elf32_note,
+    .write_elf64_note = x86_cpu_write_elf64_note,
+    .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
+    .write_elf64_qemunote = x86_cpu_write_elf64_qemunote,
     .vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -7428,10 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index fdc169bb0ac..2b249f47eb9 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
     .get_crash_info = s390_cpu_get_crash_info,
+    .write_elf64_note = s390_cpu_write_elf64_note,
     .vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -524,7 +525,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 789124debe7..598304bd636 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,8 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .write_elf32_note = ppc32_cpu_write_elf32_note,
+    .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
@@ -10894,10 +10896,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
-#if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
-#endif
 
     cc->gdb_num_core_regs = 71;
 #ifndef CONFIG_USER_ONLY
-- 
2.26.2


