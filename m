Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D63923B0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:19:45 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3kW-00078l-G4
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FP-0005nQ-Bl
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:35 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FJ-0004Xh-FJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 lr4-20020a17090b4b84b02901600455effdso115598pjb.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YoyKQZ/vbIkEieml6WuQhOVk7AT2oQX9AQbQfT0WBxc=;
 b=tJd3xsKXxUtyLXmQX47JKl1NxfArTND+Q3DErlz3IobEjlcKKUjvno8cMIvSKjS43A
 N6ts9Gik2jOfU22TizvRZFgM0ZWbzjPN9TJuRNa9tAOyC5LW7NlAsrYZlJYlfQfeHE8l
 uTIgWUApD4blkZutcpOOoP1dFBbswG8TRdWYZj/DUzahmdkG7qyraYDc7r1cNq8AOC6q
 WLwK42tNh3U0Cm8O/BBKNazyRrbytw2POCYuyf6dUAQfIutXjsk6NXzkAUlFxNGeF3QV
 1Yp9wyW8wMTihgfKNMETykVY2/OzgfD2cU+WZmFnPJXDMjxb9deFhk4CVqgBI2lVwhXN
 //zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoyKQZ/vbIkEieml6WuQhOVk7AT2oQX9AQbQfT0WBxc=;
 b=SQ26TbWH5hIwfz0h6fy9H7cYek70hVQLnQBgnbZw7WrjEFeJzxfJ5xunnNEsTld7Uh
 6oxWcS+XxbZAeuFaWRZS2hZtF3SvbJTuX8Cr6IqNv13BS1ymX0dEOnyHcZUyhUpFjg5I
 GPfsU13w/agsV8jkc7Rm4bfsybp1i4M1Wz9IZzVuiv/odNc23JITHxw4CxqEXeZKihuv
 8CgTsmAgMxmgzklnAzL18fM9MMXpNify6zkPS1mIdXr4wHikf6oaLB30B+e9v8AnbXtI
 Lxcn9Y9otkmhNS3foX4qk81XT6SPk4alGTldg8h4MhLCToiqBMWNCFpjNpjXBrIC11uT
 86YQ==
X-Gm-Message-State: AOAM5306iPDo94etuDIRVFjcOEB88o1GFZbsE4WYjBnlmAQ2BNTVtSAI
 TCww9SR1qJho0W9vifbM9jrDAF13AtcHiw==
X-Google-Smtp-Source: ABdhPJx8RuUiL6yESG5T2tF4/syjQnDudETyW62NyH75BslfJO/abnJTHtkbHYr71f0dje1ww+VaVQ==
X-Received: by 2002:a17:90a:4493:: with SMTP id
 t19mr644587pjg.217.1622072848150; 
 Wed, 26 May 2021 16:47:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/31] cpu: Rename CPUClass vmsd -> legacy_vmsd
Date: Wed, 26 May 2021 16:46:58 -0700
Message-Id: <20210526234710.125396-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Quoting Peter Maydell [*]:

  There are two ways to handle migration for
  a CPU object:

  (1) like any other device, so it has a dc->vmsd that covers
  migration for the whole object. As usual for objects that are a
  subclass of a parent that has state, the first entry in the
  VMStateDescription field list is VMSTATE_CPU(), which migrates
  the cpu_common fields, followed by whatever the CPU's own migration
  fields are.

  (2) a backwards-compatible mechanism for CPUs that were
  originally migrated using manual "write fields to the migration
  stream structures". The on-the-wire migration format
  for those is based on the 'env' pointer (which isn't a QOM object),
  and the cpu_common part of the migration data is elsewhere.

  cpu_exec_realizefn() handles both possibilities:

  * for type 1, dc->vmsd is set and cc->vmsd is not,
    so cpu_exec_realizefn() does nothing, and the standard
    "register dc->vmsd for a device" code does everything needed

  * for type 2, dc->vmsd is NULL and so we register the
    vmstate_cpu_common directly to handle the cpu-common fields,
    and the cc->vmsd to handle the per-CPU stuff

  You can't change a CPU from one type to the other without breaking
  migration compatibility, which is why some guest architectures
  are stuck on the cc->vmsd form. New targets should use dc->vmsd.

To avoid new targets to start using type (2), rename cc->vmsd as
cc->legacy_vmsd. The correct field to implement is dc->vmsd (the
DeviceClass one).

See also commit b170fce3dd0 ("cpu: Register VMStateDescription
through CPUState") for historic background.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg800849.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210517105140.1062037-13-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  5 +++--
 cpu.c                 | 12 ++++++------
 target/arm/cpu.c      |  2 +-
 target/avr/cpu.c      |  2 +-
 target/i386/cpu.c     |  2 +-
 target/mips/cpu.c     |  2 +-
 target/ppc/cpu_init.c |  2 +-
 target/riscv/cpu.c    |  3 +--
 target/s390x/cpu.c    |  2 +-
 target/sparc/cpu.c    |  2 +-
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d96ff4dace..1dfb788415 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -122,7 +122,8 @@ struct AccelCPUClass;
  * 32-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
  * note to a 32-bit VM coredump.
- * @vmsd: State description for migration.
+ * @legacy_vmsd: Legacy state description for migration.
+ *               Do not use in new targets, use #DeviceClass::vmsd instead.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -177,7 +178,7 @@ struct CPUClass {
     int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
                                 void *opaque);
 
-    const VMStateDescription *vmsd;
+    const VMStateDescription *legacy_vmsd;
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/cpu.c b/cpu.c
index 6fe4af2797..c57f4c302b 100644
--- a/cpu.c
+++ b/cpu.c
@@ -143,13 +143,13 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-    assert(cc->vmsd == NULL);
+    assert(cc->legacy_vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    if (cc->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
@@ -159,10 +159,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
 #ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
+    assert(cc->legacy_vmsd == NULL);
 #else
-    if (cc->vmsd != NULL) {
-        vmstate_unregister(NULL, cc->vmsd, cpu);
+    if (cc->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7aeb4b1381..bf82276611 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1983,7 +1983,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->vmsd = &vmstate_arm_cpu;
+    cc->legacy_vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932b..37a8ebcc86 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->vmsd = &vms_avr_cpu;
+    cc->legacy_vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c496bfa1c2..5a1c8ead8e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6749,7 +6749,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
-    cc->vmsd = &vmstate_x86_cpu;
+    cc->legacy_vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1ad2fe4aa3..eba56ac899 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -561,7 +561,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_mips_cpu;
+    cc->legacy_vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 22ecbccad8..668fd141db 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9305,7 +9305,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_ppc_cpu;
+    cc->legacy_vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3191fd0082..16510da259 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -638,8 +638,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    /* For now, mark unmigratable: */
-    cc->vmsd = &vmstate_riscv_cpu;
+    cc->legacy_vmsd = &vmstate_riscv_cpu;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 64455cf309..7ce425f611 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -516,7 +516,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_s390_cpu;
+    cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #endif
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc8..ba497561bf 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -889,7 +889,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_sparc_cpu;
+    cc->legacy_vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
-- 
2.25.1


