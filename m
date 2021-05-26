Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253AF3923B7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:21:29 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3mC-0000Jr-7F
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FV-0005va-Gz
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FK-0004Ya-Q6
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id k5so1702979pjj.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zzfi92ABknfNg52jfMnZZrvowiWGHuGwWnSwt5HWe2A=;
 b=NgAH5R4zVWoG0aJJ3S3MkRAQTFCoq/s/0k0Wpz5js2XrKDXze+Wb681EC9N1RqQupT
 6uRGVWPUVgEMAiS0VStQGM7/GzryOefQs9Orp7g8xSJHHbqmbKZU52/MNdjdpJu3S3Sv
 wMt0HZNi5P3dYmyYkgE+VqmONUS9Z/RpFmbzvsAGji0X0wmSTpAmsTeB7id0I6vjBh4d
 jUUXn5+i2AJVQ2143TY2xgdzYWX9Th9JkD57WPKZNEvAb7qaIIIKUHKLTIqB+FUAx6us
 qxOj7yAUMUEsD7qhtJPRWzyYN6vfw364KdrnrP3S2Oq5bEWL2/y+ZBb8lOmSDezj0DCY
 U4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zzfi92ABknfNg52jfMnZZrvowiWGHuGwWnSwt5HWe2A=;
 b=s6u6isiIXEBLuUBFiFhQADsjy0IABhWYf/svkfFy271aRMQalN/5ErYeKiwotcB8qK
 Bd+kl9RBZXvY7SedMxXuPXyrIPD5DoRsTkCDYpawnyXt0MPUK3HTSaWxKPJ4Veu22LHX
 hAwq/JzgTS4CfGaMSy2QPLaxznw3K0IUTVO0Ca2+pSrE3NR5PeLyNLIFR/wQ8GDU9gPc
 3SzrfZwIlpAHniygY3NdOMy4gz+PM0ctsJa3RSbT5tlzWn6lCk/XKC0rqU15tMw0szm7
 +G9qucTJO+4TVtN0MadCVQjx8QnkjzFzRG8IlM+9yxILzEba0JkOzjP57rGNophFrU6Q
 J1bw==
X-Gm-Message-State: AOAM531mmcF9r8zRqf4+/mRB5W5ce6jkSlcjv6wo6XkaMTSxkEuVm0be
 xli+o1d9KaTmi9kipmlBgfxox36p43VMNA==
X-Google-Smtp-Source: ABdhPJyoIfXz6cdebVyDDJFurI1DGGVMtZDMhwoHSmj63M3en8KChSQ0RIPx006A/Ukk6o/tKUTk9g==
X-Received: by 2002:a17:902:d717:b029:fe:c349:1453 with SMTP id
 w23-20020a170902d717b02900fec3491453mr96271ply.21.1622072849500; 
 Wed, 26 May 2021 16:47:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/31] cpu: Introduce SysemuCPUOps structure
Date: Wed, 26 May 2021 16:47:00 -0700
Message-Id: <20210526234710.125396-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Introduce a structure to hold handler specific to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-15-f4bug@amsat.org>
[rth: Squash "restrict hw/core/sysemu-cpu-ops.h" patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            |  6 ++++++
 include/hw/core/sysemu-cpu-ops.h | 21 +++++++++++++++++++++
 cpu.c                            |  1 +
 target/alpha/cpu.c               |  8 ++++++++
 target/arm/cpu.c                 |  8 ++++++++
 target/avr/cpu.c                 |  6 ++++++
 target/cris/cpu.c                |  8 ++++++++
 target/hppa/cpu.c                |  8 ++++++++
 target/i386/cpu.c                |  8 ++++++++
 target/m68k/cpu.c                |  8 ++++++++
 target/microblaze/cpu.c          |  8 ++++++++
 target/mips/cpu.c                |  8 ++++++++
 target/nios2/cpu.c               |  8 ++++++++
 target/openrisc/cpu.c            |  8 ++++++++
 target/ppc/cpu_init.c            |  8 ++++++++
 target/riscv/cpu.c               |  8 ++++++++
 target/rx/cpu.c                  | 10 ++++++++++
 target/s390x/cpu.c               |  8 ++++++++
 target/sh4/cpu.c                 |  6 ++++++
 target/sparc/cpu.c               |  8 ++++++++
 target/tricore/cpu.c             |  6 ++++++
 target/xtensa/cpu.c              |  6 ++++++
 22 files changed, 174 insertions(+)
 create mode 100644 include/hw/core/sysemu-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1dfb788415..cd3fb70cb5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,6 +80,9 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
+/* see sysemu-cpu-ops.h */
+struct SysemuCPUOps;
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -191,6 +194,9 @@ struct CPUClass {
     bool gdb_stop_before_watchpoint;
     struct AccelCPUClass *accel_cpu;
 
+    /* when system emulation is not available, this pointer is NULL */
+    const struct SysemuCPUOps *sysemu_ops;
+
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
new file mode 100644
index 0000000000..e54a08ea25
--- /dev/null
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -0,0 +1,21 @@
+/*
+ * CPU operations specific to system emulation
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SYSEMU_CPU_OPS_H
+#define SYSEMU_CPU_OPS_H
+
+#include "hw/core/cpu.h"
+
+/*
+ * struct SysemuCPUOps: System operations specific to a CPU class
+ */
+typedef struct SysemuCPUOps {
+} SysemuCPUOps;
+
+#endif /* SYSEMU_CPU_OPS_H */
diff --git a/cpu.c b/cpu.c
index c57f4c302b..e3f9804f13 100644
--- a/cpu.c
+++ b/cpu.c
@@ -29,6 +29,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
+#include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #endif
 #include "sysemu/tcg.h"
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e2..0b12b2be81 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -206,6 +206,13 @@ static void alpha_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps alpha_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps alpha_tcg_ops = {
@@ -238,6 +245,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
+    cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bf82276611..0116e9d8e8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,13 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
     return g_strdup("arm");
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps arm_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
@@ -1987,6 +1994,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
+    cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3353bcb9fc..b95caf8c0f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -184,6 +184,11 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps avr_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps avr_tcg_ops = {
@@ -214,6 +219,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     dc->vmsd = &vms_avr_cpu;
+    cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fc..f1095fcf5c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -193,6 +193,13 @@ static void cris_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps cris_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps crisv10_tcg_ops = {
@@ -294,6 +301,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
+    cc->sysemu_ops = &cris_sysemu_ops;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1f..870130b159 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -131,6 +131,13 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_HPPA_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps hppa_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps hppa_tcg_ops = {
@@ -163,6 +170,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
+    cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a1c8ead8e..e422fab49a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6714,6 +6714,13 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps i386_sysemu_ops = {
+};
+#endif
+
 static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 {
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
@@ -6750,6 +6757,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->legacy_vmsd = &vmstate_x86_cpu;
+    cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index a14874b4da..97ef3ae31c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -503,6 +503,13 @@ static const VMStateDescription vmstate_m68k_cpu = {
 };
 #endif
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps m68k_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps m68k_tcg_ops = {
@@ -535,6 +542,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
+    cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba20203..96f221ff71 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -352,6 +352,13 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_MICROBLAZE_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps mb_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps mb_tcg_ops = {
@@ -388,6 +395,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
+    cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index eba56ac899..9a8c484cb4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -521,6 +521,13 @@ static Property mips_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps mips_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 /*
@@ -562,6 +569,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->legacy_vmsd = &vmstate_mips_cpu;
+    cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a38..cb04b04d24 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -207,6 +207,13 @@ static Property nios2_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps nios2_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps nios2_tcg_ops = {
@@ -238,6 +245,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46..12d9173043 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -174,6 +174,13 @@ static void openrisc_any_initfn(Object *obj)
                       | (IMMUCFGR_NTS & (ctz32(TLB_SIZE) << 2));
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps openrisc_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps openrisc_tcg_ops = {
@@ -205,6 +212,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
+    cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 668fd141db..302b9b92a5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9263,6 +9263,13 @@ static Property ppc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps ppc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -9306,6 +9313,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->legacy_vmsd = &vmstate_ppc_cpu;
+    cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16510da259..b2b4a0baf4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -596,6 +596,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     return NULL;
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps riscv_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps riscv_tcg_ops = {
@@ -639,6 +646,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     cc->legacy_vmsd = &vmstate_riscv_cpu;
+    cc->sysemu_ops = &riscv_sysemu_ops;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26..98e6596158 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -173,6 +173,13 @@ static void rx_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps rx_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps rx_tcg_ops = {
@@ -202,6 +209,9 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
+#ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &rx_sysemu_ops;
+#endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7ce425f611..77800e99b9 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -476,6 +476,13 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps s390_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -519,6 +526,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->legacy_vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 35d4251aaf..79aec898fa 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -223,6 +223,11 @@ static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps sh4_sysemu_ops = {
+};
 #endif
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -259,6 +264,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &sh4_sysemu_ops;
     dc->vmsd = &vmstate_sh_cpu;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index ba497561bf..70be0ecf5e 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -848,6 +848,13 @@ static Property sparc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps sparc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -890,6 +897,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->legacy_vmsd = &vmstate_sparc_cpu;
+    cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcb..7dc6aab66c 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -142,6 +142,11 @@ static void tc27x_initfn(Object *obj)
     set_feature(&cpu->env, TRICORE_FEATURE_161);
 }
 
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps tricore_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps tricore_tcg_ops = {
@@ -171,6 +176,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 0267571fbd..a196530451 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -180,6 +180,11 @@ static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps xtensa_sysemu_ops = {
+};
 #endif
 
 #include "hw/core/tcg-cpu-ops.h"
@@ -216,6 +221,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &xtensa_sysemu_ops;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_xtensa_cpu;
 #endif
-- 
2.25.1


