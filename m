Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D206FB1CA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:38:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw144-0006Lb-0E; Mon, 08 May 2023 09:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw13y-0006KG-6G
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw13w-0008Tn-Br
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683553079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeJxtyOdeEpb8xbp7HaPPMMJJOZR4N3fC5s2ymY3lXg=;
 b=AE5fsrHnotPw9IRF/dSixfxQ4/fMw0VqNKTzuPm05qEIyaaMccw8Yzat3oDpN58YSkQUOh
 xkzeBJtaCgb2gvmBv/3bYs9PC2WBv+aY/4LdJv9C35eKeMptcBzqAprCCjFJggDsRQLDkC
 USxWa2BNSVnQHKZqoV3QZwelmbfelw8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-Y3gFGOVyOg-HkzUCzJvvwA-1; Mon, 08 May 2023 09:37:53 -0400
X-MC-Unique: Y3gFGOVyOg-HkzUCzJvvwA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1590D3822DE2;
 Mon,  8 May 2023 13:37:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 287CE492B01;
 Mon,  8 May 2023 13:37:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Subject: [RFC PATCH 1/2] disas: Move softmmu specific code to separate file
Date: Mon,  8 May 2023 15:37:44 +0200
Message-Id: <20230508133745.109463-2-thuth@redhat.com>
In-Reply-To: <20230508133745.109463-1-thuth@redhat.com>
References: <20230508133745.109463-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We'd like to move disas.c into the common code source set, where
CONFIG_USER_ONLY is not available anymore. So we have to move
the related code into a separate file instead.

While doing the movement, change the type of the "pc" parameter of
the monitor_disas() function to "hwaddr" instead of "target_ulong",
so we can add the file to the generic softmmu_ss source set instead
of the specific_ss source set.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 disas/disas-internal.h | 20 +++++++++++
 include/disas/disas.h  |  6 ++--
 disas.c                | 76 ++++--------------------------------------
 disas/disas-mon.c      | 65 ++++++++++++++++++++++++++++++++++++
 disas/meson.build      |  2 ++
 5 files changed, 96 insertions(+), 73 deletions(-)
 create mode 100644 disas/disas-internal.h
 create mode 100644 disas/disas-mon.c

diff --git a/disas/disas-internal.h b/disas/disas-internal.h
new file mode 100644
index 0000000000..354c01307b
--- /dev/null
+++ b/disas/disas-internal.h
@@ -0,0 +1,20 @@
+/*
+ * Definitions used internally in the disassembly code
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef DISAS_INTERNAL_H
+#define DISAS_INTERNAL_H
+
+#include "disas/dis-asm.h"
+
+typedef struct CPUDebug {
+    struct disassemble_info info;
+    CPUState *cpu;
+} CPUDebug;
+
+void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu);
+int disas_gstring_printf(FILE *stream, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+
+#endif
diff --git a/include/disas/disas.h b/include/disas/disas.h
index d363e95ede..6c04428620 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -11,15 +11,15 @@ void disas(FILE *out, const void *code, unsigned long size);
 void target_disas(FILE *out, CPUState *cpu, target_ulong code,
                   target_ulong size);
 
-void monitor_disas(Monitor *mon, CPUState *cpu,
-                   target_ulong pc, int nb_insn, int is_physical);
-
 char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
 const char *lookup_symbol(target_ulong orig_addr);
 #endif
 
+void monitor_disas(Monitor *mon, CPUState *cpu,
+                   hwaddr pc, int nb_insn, int is_physical);
+
 struct syminfo;
 struct elf32_sym;
 struct elf64_sym;
diff --git a/disas.c b/disas.c
index b087c12c47..4f4a07d611 100644
--- a/disas.c
+++ b/disas.c
@@ -1,17 +1,12 @@
 /* General "disassemble this chunk" code.  Used for debugging. */
 #include "qemu/osdep.h"
-#include "disas/dis-asm.h"
+#include "disas/disas-internal.h"
 #include "elf.h"
 #include "qemu/qemu-print.h"
 
 #include "disas/disas.h"
 #include "disas/capstone.h"
 
-typedef struct CPUDebug {
-    struct disassemble_info info;
-    CPUState *cpu;
-} CPUDebug;
-
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
 struct syminfo *syminfos = NULL;
 
@@ -119,7 +114,7 @@ static void initialize_debug(CPUDebug *s)
     s->info.symbol_at_address_func = symbol_at_address;
 }
 
-static void initialize_debug_target(CPUDebug *s, CPUState *cpu)
+void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 {
     initialize_debug(s);
 
@@ -211,7 +206,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     int count;
     CPUDebug s;
 
-    initialize_debug_target(&s, cpu);
+    disas_initialize_debug_target(&s, cpu);
     s.info.fprintf_func = fprintf;
     s.info.stream = out;
     s.info.buffer_vma = code;
@@ -241,8 +236,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 }
 
-static int G_GNUC_PRINTF(2, 3)
-gstring_printf(FILE *stream, const char *fmt, ...)
+int disas_gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
     GString *s = (GString *)stream;
@@ -272,8 +266,8 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
     CPUDebug s;
     GString *ds = g_string_new(NULL);
 
-    initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = gstring_printf;
+    disas_initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = disas_gstring_printf;
     s.info.stream = (FILE *)ds;  /* abuse this slot */
     s.info.buffer_vma = addr;
     s.info.buffer_length = size;
@@ -338,61 +332,3 @@ const char *lookup_symbol(target_ulong orig_addr)
 
     return symbol;
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-#include "monitor/monitor.h"
-
-static int
-physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
-                     struct disassemble_info *info)
-{
-    CPUDebug *s = container_of(info, CPUDebug, info);
-    MemTxResult res;
-
-    res = address_space_read(s->cpu->as, memaddr, MEMTXATTRS_UNSPECIFIED,
-                             myaddr, length);
-    return res == MEMTX_OK ? 0 : EIO;
-}
-
-/* Disassembler for the monitor.  */
-void monitor_disas(Monitor *mon, CPUState *cpu,
-                   target_ulong pc, int nb_insn, int is_physical)
-{
-    int count, i;
-    CPUDebug s;
-    g_autoptr(GString) ds = g_string_new("");
-
-    initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = gstring_printf;
-    s.info.stream = (FILE *)ds;  /* abuse this slot */
-
-    if (is_physical) {
-        s.info.read_memory_func = physical_read_memory;
-    }
-    s.info.buffer_vma = pc;
-
-    if (s.info.cap_arch >= 0 && cap_disas_monitor(&s.info, pc, nb_insn)) {
-        monitor_puts(mon, ds->str);
-        return;
-    }
-
-    if (!s.info.print_insn) {
-        monitor_printf(mon, "0x" TARGET_FMT_lx
-                       ": Asm output not supported on this arch\n", pc);
-        return;
-    }
-
-    for (i = 0; i < nb_insn; i++) {
-        g_string_append_printf(ds, "0x" TARGET_FMT_lx ":  ", pc);
-        count = s.info.print_insn(pc, &s.info);
-        g_string_append_c(ds, '\n');
-        if (count < 0) {
-            break;
-        }
-        pc += count;
-    }
-
-    monitor_puts(mon, ds->str);
-}
-#endif
diff --git a/disas/disas-mon.c b/disas/disas-mon.c
new file mode 100644
index 0000000000..31b7413c40
--- /dev/null
+++ b/disas/disas-mon.c
@@ -0,0 +1,65 @@
+/*
+ * Functions related to disassembly from the monitor
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "disas-internal.h"
+#include "disas/disas.h"
+#include "exec/memory.h"
+#include "hw/core/cpu.h"
+#include "monitor/monitor.h"
+
+static int
+physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
+                     struct disassemble_info *info)
+{
+    CPUDebug *s = container_of(info, CPUDebug, info);
+    MemTxResult res;
+
+    res = address_space_read(s->cpu->as, memaddr, MEMTXATTRS_UNSPECIFIED,
+                             myaddr, length);
+    return res == MEMTX_OK ? 0 : EIO;
+}
+
+/* Disassembler for the monitor.  */
+void monitor_disas(Monitor *mon, CPUState *cpu,
+                   hwaddr pc, int nb_insn, int is_physical)
+{
+    int count, i;
+    CPUDebug s;
+    g_autoptr(GString) ds = g_string_new("");
+
+    disas_initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = disas_gstring_printf;
+    s.info.stream = (FILE *)ds;  /* abuse this slot */
+
+    if (is_physical) {
+        s.info.read_memory_func = physical_read_memory;
+    }
+    s.info.buffer_vma = pc;
+
+    if (s.info.cap_arch >= 0 && cap_disas_monitor(&s.info, pc, nb_insn)) {
+        monitor_puts(mon, ds->str);
+        return;
+    }
+
+    if (!s.info.print_insn) {
+        monitor_printf(mon, "0x" HWADDR_FMT_plx
+                       ": Asm output not supported on this arch\n", pc);
+        return;
+    }
+
+    for (i = 0; i < nb_insn; i++) {
+        g_string_append_printf(ds, "0x" HWADDR_FMT_plx ":  ", pc);
+        count = s.info.print_insn(pc, &s.info);
+        g_string_append_c(ds, '\n');
+        if (count < 0) {
+            break;
+        }
+        pc += count;
+    }
+
+    monitor_puts(mon, ds->str);
+}
diff --git a/disas/meson.build b/disas/meson.build
index c865bdd882..ca6dd81ecf 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -11,3 +11,5 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: files('capstone.c'))
+
+softmmu_ss.add(files('disas-mon.c'))
-- 
2.31.1


