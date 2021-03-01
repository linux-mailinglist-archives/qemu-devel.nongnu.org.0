Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E21329456
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:01:03 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqb8-00046h-J8
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSY-000244-Tj; Mon, 01 Mar 2021 16:52:10 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSV-00058Q-SG; Mon, 01 Mar 2021 16:52:10 -0500
Received: by mail-ed1-x534.google.com with SMTP id v13so6304863edw.9;
 Mon, 01 Mar 2021 13:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X120oQI07eFl+Ysl6eq3iFfdrvQzs+b+T4SMXWlM8P0=;
 b=FFWdFnjV9kAaXTetaWV4cYn/IEBr10Cp/HZxWpapsDOZ5BcCSgSVj1RLUNs+1QRhl+
 El1VWa12iYQqeBpnv/uxitNfCxuqaGKrdZnhbZr0c2Bc879rQUv+XUQ+F8AEwKWXwbdK
 5ZdFOhkM/NDV610RMb1eRsluYJINyCEPoA1HLvNaTHXEdrMxaW54f9DZ/Pw+t7/Chsgg
 FsYz6LSPFwtEhAO1fJeYNotASRFojvxPSCK4IPXCGSkZdBz3Fog4OQZzqbBvXOkxaM33
 8UhWtTOW8KZJRpGtnYUpjrIFWHoUslqe3VtuW4fKTqYIcU75ONFV70N+P9SNBDyuQTs+
 fYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X120oQI07eFl+Ysl6eq3iFfdrvQzs+b+T4SMXWlM8P0=;
 b=J81XdowoCJZYsRHL4A+64mnRkkdoPLzwlG4ht4lGt/1hDDxm7g6Tl2TkxZiOquorgn
 P/6QBRFDZVhppJ/y3YFkGlPORiN0Fb3RN6gIK5MmgTsMnRl85mbcFhYhAGHOMCQ2V3N7
 Pfb1AbcJJ3q2548Ly8OyRbhC+SEiZNqedBsDocH0+4PlD0ruYtej0/sjJxxVlaI83svx
 ylGOM4xquxCWdacwW5yYYxksl6zZg8uK24C583alm5c6U3DLNNBuxX+G+PUiCjz00LsF
 6O/+fBsk2zX11a2Ptz3l3IJHyBCbAktEuwoeRYod7MvX1uoS4jaZyAR25chAXqK6dBEU
 xQCg==
X-Gm-Message-State: AOAM5331I0Z//T5FpHyziYz/ja3HDhh8EE+w8AAI9enF3ASd0rwiEcbM
 3BIzJb85mUsFUTxKLGMtt075W9Aabgs=
X-Google-Smtp-Source: ABdhPJzsdhRBLzeY0zF4p1GIPgchBxGvNRlJckLVkhXEthxoC/UDES220OCzWIN+tyQBqw1PmoAjYw==
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr18445845edd.271.1614635524422; 
 Mon, 01 Mar 2021 13:52:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b6sm15129585ejb.8.2021.03.01.13.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:52:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] cpu: Introduce SysemuCPUOps structure
Date: Mon,  1 Mar 2021 22:51:00 +0100
Message-Id: <20210301215110.772346-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a structure to hold handler specific to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  5 +++++
 include/hw/core/sysemu-cpu-ops.h | 21 +++++++++++++++++++++
 target/alpha/cpu.c               |  6 ++++++
 target/arm/cpu.c                 |  6 ++++++
 target/avr/cpu.c                 |  4 ++++
 target/cris/cpu.c                |  6 ++++++
 target/hppa/cpu.c                |  6 ++++++
 target/i386/cpu.c                |  6 ++++++
 target/lm32/cpu.c                |  6 ++++++
 target/m68k/cpu.c                |  6 ++++++
 target/microblaze/cpu.c          |  6 ++++++
 target/mips/cpu.c                |  6 ++++++
 target/moxie/cpu.c               |  4 ++++
 target/nios2/cpu.c               |  6 ++++++
 target/openrisc/cpu.c            |  6 ++++++
 target/riscv/cpu.c               |  6 ++++++
 target/rx/cpu.c                  |  8 ++++++++
 target/s390x/cpu.c               |  6 ++++++
 target/sh4/cpu.c                 |  6 ++++++
 target/sparc/cpu.c               |  6 ++++++
 target/tricore/cpu.c             |  4 ++++
 target/unicore32/cpu.c           |  4 ++++
 target/xtensa/cpu.c              |  6 ++++++
 target/ppc/translate_init.c.inc  |  6 ++++++
 24 files changed, 152 insertions(+)
 create mode 100644 include/hw/core/sysemu-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b12028c3c03..3c26471d0fa 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,6 +80,8 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
+#include "hw/core/sysemu-cpu-ops.h"
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -190,6 +192,9 @@ struct CPUClass {
     bool gdb_stop_before_watchpoint;
     struct AccelCPUClass *accel_cpu;
 
+    /* when system emulation is not available, this pointer is NULL */
+    const struct SysemuCPUOps *sysemu_ops;
+
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
 };
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
new file mode 100644
index 00000000000..e54a08ea25e
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
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index faabffe0796..b9b431102f2 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -206,6 +206,11 @@ static void alpha_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps alpha_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps alpha_tcg_ops = {
@@ -238,6 +243,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_alpha_cpu;
+    cc->sysemu_ops = &alpha_sysemu_ops;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71fc..994e7b344d4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2260,6 +2260,11 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
     return g_strdup("arm");
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps arm_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
@@ -2303,6 +2308,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
+    cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0f4596932ba..84f7ad4167e 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -184,6 +184,9 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+static struct SysemuCPUOps avr_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps avr_tcg_ops = {
@@ -214,6 +217,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
     cc->vmsd = &vms_avr_cpu;
+    cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 29a865b75d2..a97ad7c9c65 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -193,6 +193,11 @@ static void cris_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps cris_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps crisv10_tcg_ops = {
@@ -294,6 +299,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_cris_cpu;
+    cc->sysemu_ops = &cris_sysemu_ops;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4f142de6e45..48946cf6669 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -131,6 +131,11 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_HPPA_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps hppa_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps hppa_tcg_ops = {
@@ -163,6 +168,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_hppa_cpu;
+    cc->sysemu_ops = &hppa_sysemu_ops;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a5..fa517555e73 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7386,6 +7386,11 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps i386_sysemu_ops = {
+};
+#endif
+
 static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 {
     X86CPUClass *xcc = X86_CPU_CLASS(oc);
@@ -7427,6 +7432,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->vmsd = &vmstate_x86_cpu;
+    cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c23d72874c0..2d8d16d5535 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -210,6 +210,11 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps lm32_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps lm32_tcg_ops = {
@@ -242,6 +247,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_lm32_cpu;
+    cc->sysemu_ops = &lm32_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c98fb1e33be..5c43981c35d 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -502,6 +502,11 @@ static const VMStateDescription vmstate_m68k_cpu = {
 };
 #endif
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps m68k_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps m68k_tcg_ops = {
@@ -534,6 +539,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_m68k_cpu;
+    cc->sysemu_ops = &m68k_sysemu_ops;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 335dfdc734e..34a60edd1cc 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -352,6 +352,11 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_MICROBLAZE_CPU);
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps mb_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps mb_tcg_ops = {
@@ -388,6 +393,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     cc->vmsd = &vmstate_mb_cpu;
+    cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bf70c77295f..ea9259896f2 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -680,6 +680,11 @@ static Property mips_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps mips_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 /*
@@ -721,6 +726,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
+    cc->sysemu_ops = &mips_sysemu_ops;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 83bec34d36c..dbc9e022b61 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -94,6 +94,9 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static struct SysemuCPUOps moxie_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps moxie_tcg_ops = {
@@ -125,6 +128,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
+    cc->sysemu_ops = &moxie_sysemu_ops;
     cc->tcg_ops = &moxie_tcg_ops;
 }
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e9c9fc3a389..57023e38cb8 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -207,6 +207,11 @@ static Property nios2_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps nios2_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps nios2_tcg_ops = {
@@ -238,6 +243,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = nios2_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &nios2_sysemu_ops;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 79d246d1930..e00678ae038 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -174,6 +174,11 @@ static void openrisc_any_initfn(Object *obj)
                       | (IMMUCFGR_NTS & (ctz32(TLB_SIZE) << 2));
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps openrisc_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps openrisc_tcg_ops = {
@@ -205,6 +210,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_openrisc_cpu;
+    cc->sysemu_ops = &openrisc_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a342388..fd85e6fc6af 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -580,6 +580,11 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     return NULL;
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps riscv_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps riscv_tcg_ops = {
@@ -624,6 +629,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
+    cc->sysemu_ops = &riscv_sysemu_ops;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 7ac6618b26b..812cf718732 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -173,6 +173,11 @@ static void rx_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps rx_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps rx_tcg_ops = {
@@ -202,6 +207,9 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
+#ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &rx_sysemu_ops;
+#endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bb..0efb1381647 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -477,6 +477,11 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps s390_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -520,6 +525,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index bd44de53729..41f1c7c0507 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -223,6 +223,11 @@ static const VMStateDescription vmstate_sh_cpu = {
     .unmigratable = 1,
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps sh4_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps superh_tcg_ops = {
@@ -257,6 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &sh4_sysemu_ops;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index aece2c7dc83..377378ca1f2 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -848,6 +848,11 @@ static Property sparc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps sparc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -890,6 +895,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
+    cc->sysemu_ops = &sparc_sysemu_ops;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0b1e139bcba..75f8a2d8014 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -142,6 +142,9 @@ static void tc27x_initfn(Object *obj)
     set_feature(&cpu->env, TRICORE_FEATURE_161);
 }
 
+static struct SysemuCPUOps tricore_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps tricore_tcg_ops = {
@@ -171,6 +174,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
+    cc->sysemu_ops = &tricore_sysemu_ops;
     cc->tcg_ops = &tricore_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 12894ffac6a..37e57178657 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -120,6 +120,9 @@ static const VMStateDescription vmstate_uc32_cpu = {
     .unmigratable = 1,
 };
 
+static struct SysemuCPUOps uc32_sysemu_ops = {
+};
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps uc32_tcg_ops = {
@@ -147,6 +150,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_uc32_cpu;
+    cc->sysemu_ops = &uc32_sysemu_ops;
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6bedd5b97b8..7b925468203 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -181,6 +181,11 @@ static const VMStateDescription vmstate_xtensa_cpu = {
     .unmigratable = 1,
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps xtensa_sysemu_ops = {
+};
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static struct TCGCPUOps xtensa_tcg_ops = {
@@ -215,6 +220,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
+    cc->sysemu_ops = &xtensa_sysemu_ops;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e7324e85cdb..a835bd86214 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10843,6 +10843,11 @@ static Property ppc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifndef CONFIG_USER_ONLY
+static struct SysemuCPUOps ppc_sysemu_ops = {
+};
+#endif
+
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -10886,6 +10891,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_ppc_cpu;
+    cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
 #if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-- 
2.26.2


