Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D306FEDAC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:15:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1IZ-0006NK-1h; Thu, 11 May 2023 04:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IN-0006JL-Fb
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IJ-0000x2-Ef
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:02 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50db7ec8188so4836969a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792297; x=1686384297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/w4TC2x/MHMk9Ao0+lVZ7OcQUDEv1JV3QxIfXizq1io=;
 b=H5NxAMfIQgano+lRowYSclNtkepUAuhDcFP9aIEXIXg1wSgQSZ57Snv2CKQSQNHEuI
 062du9IaSqH6fmix8WrtSCYrqZUpNKoakNY6Zz5aN75EsiTgU1mayJoSnn31xzoBW2Cp
 W5QNcBx6O/VgTQ9hEoDa08TX8Vf3wRtgrCbObl+MzRyy/zsODw9l/Q2JA9ktq2Fb4BeP
 +XENOf186SCHMvkU07k+43EhnzBEn9fxK0APuG1gheEBVkaOlAmU0R13WnyMIadFqqVR
 duFo823yoInEqZhGky/4VAz6O9ZJAvrSVYscsHqNu4KBUOtvVDIIUsBDs0y9BKhXhTYx
 xKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792297; x=1686384297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/w4TC2x/MHMk9Ao0+lVZ7OcQUDEv1JV3QxIfXizq1io=;
 b=T7u/asaNGRLnbk2P0Xeg0IRa8ZTJ+l6YLE+9QAhxrhkjVekQ/1kMCvwY+dj4Jpa0Ra
 M92Ad+7KCOTnz8oF7EblUV8GZbb0OAfJRbXGC6qmm5PgYZ2soX0XPwpaUC/bPTeBxcVG
 GUkBnXP9JyLAjHh8SkkuYaRVNC1VjoHSD0g/lobuPhuWq4dq+XlWrWB6KHHKwyPjOnXh
 ZMpO63R0haiLQ5QT2EYo4p9oD+zqwjq0/xpxU8HbaU9n0g6FoY9JleJank/3HisnG6AA
 J+OI4OevckZS4ANSsPRUe2l4j9d1P8TGkeuTMIvxyZq2bFK4XfNs81EXjzWR2bOF0pOF
 qVMw==
X-Gm-Message-State: AC+VfDy4zcyIZWAcrZiBfge09FLDOPqLheg96pj6yiDdqhSXr6/ZerhQ
 nnVcgLJRl/+b9CAsOQ55pJkHqgrcnNfnmaOYQeB8QQ==
X-Google-Smtp-Source: ACHHUZ6/2dkPrSSYhe3uCPO//b3ZuYI2KnOMse6jU2syoIssviBSidw6BMRUItxCLc+iUNdyOngoRg==
X-Received: by 2002:a17:907:a49:b0:96a:30b5:cfac with SMTP id
 be9-20020a1709070a4900b0096a30b5cfacmr3623521ejc.28.1683792297352; 
 Thu, 11 May 2023 01:04:57 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/53] disas: Move softmmu specific code to separate file
Date: Thu, 11 May 2023 09:04:04 +0100
Message-Id: <20230511080450.860923-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Thomas Huth <thuth@redhat.com>

We'd like to move disas.c into the common code source set, where
CONFIG_USER_ONLY is not available anymore. So we have to move
the related code into a separate file instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230508133745.109463-2-thuth@redhat.com>
[rth: Type change done in a separate patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas-internal.h | 21 ++++++++++++
 disas/disas-mon.c      | 65 ++++++++++++++++++++++++++++++++++++
 disas/disas.c          | 76 ++++--------------------------------------
 disas/meson.build      |  1 +
 4 files changed, 93 insertions(+), 70 deletions(-)
 create mode 100644 disas/disas-internal.h
 create mode 100644 disas/disas-mon.c

diff --git a/disas/disas-internal.h b/disas/disas-internal.h
new file mode 100644
index 0000000000..84a01f126f
--- /dev/null
+++ b/disas/disas-internal.h
@@ -0,0 +1,21 @@
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
+int disas_gstring_printf(FILE *stream, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
+
+#endif
diff --git a/disas/disas-mon.c b/disas/disas-mon.c
new file mode 100644
index 0000000000..48ac492c6c
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
+void monitor_disas(Monitor *mon, CPUState *cpu, uint64_t pc,
+                   int nb_insn, bool is_physical)
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
+        monitor_printf(mon, "0x%08" PRIx64
+                       ": Asm output not supported on this arch\n", pc);
+        return;
+    }
+
+    for (i = 0; i < nb_insn; i++) {
+        g_string_append_printf(ds, "0x%08" PRIx64 ":  ", pc);
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
diff --git a/disas/disas.c b/disas/disas.c
index a06954254b..45614af02d 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -1,6 +1,6 @@
 /* General "disassemble this chunk" code.  Used for debugging. */
 #include "qemu/osdep.h"
-#include "disas/dis-asm.h"
+#include "disas/disas-internal.h"
 #include "elf.h"
 #include "qemu/qemu-print.h"
 #include "disas/disas.h"
@@ -8,11 +8,6 @@
 #include "hw/core/cpu.h"
 #include "exec/memory.h"
 
-typedef struct CPUDebug {
-    struct disassemble_info info;
-    CPUState *cpu;
-} CPUDebug;
-
 /* Filled in by elfload.c.  Simplistic, but will do for now. */
 struct syminfo *syminfos = NULL;
 
@@ -120,7 +115,7 @@ static void initialize_debug(CPUDebug *s)
     s->info.symbol_at_address_func = symbol_at_address;
 }
 
-static void initialize_debug_target(CPUDebug *s, CPUState *cpu)
+void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
 {
     initialize_debug(s);
 
@@ -211,7 +206,7 @@ void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size)
     int count;
     CPUDebug s;
 
-    initialize_debug_target(&s, cpu);
+    disas_initialize_debug_target(&s, cpu);
     s.info.fprintf_func = fprintf;
     s.info.stream = out;
     s.info.buffer_vma = code;
@@ -242,8 +237,7 @@ void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size)
     }
 }
 
-static int G_GNUC_PRINTF(2, 3)
-gstring_printf(FILE *stream, const char *fmt, ...)
+int disas_gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
     GString *s = (GString *)stream;
@@ -273,8 +267,8 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
     CPUDebug s;
     GString *ds = g_string_new(NULL);
 
-    initialize_debug_target(&s, cpu);
-    s.info.fprintf_func = gstring_printf;
+    disas_initialize_debug_target(&s, cpu);
+    s.info.fprintf_func = disas_gstring_printf;
     s.info.stream = (FILE *)ds;  /* abuse this slot */
     s.info.buffer_vma = addr;
     s.info.buffer_length = size;
@@ -339,61 +333,3 @@ const char *lookup_symbol(uint64_t orig_addr)
 
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
-void monitor_disas(Monitor *mon, CPUState *cpu, uint64_t pc,
-                   int nb_insn, bool is_physical)
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
-        monitor_printf(mon, "0x%08" PRIx64
-                       ": Asm output not supported on this arch\n", pc);
-        return;
-    }
-
-    for (i = 0; i < nb_insn; i++) {
-        g_string_append_printf(ds, "0x%08" PRIx64 ":  ", pc);
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
diff --git a/disas/meson.build b/disas/meson.build
index cbf6315f25..f40230c58f 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -12,4 +12,5 @@ common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
 
+softmmu_ss.add(files('disas-mon.c'))
 specific_ss.add(files('disas.c'), capstone)
-- 
2.34.1


