Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0E6FE1E7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:53:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7K-00031r-Is; Wed, 10 May 2023 11:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7H-00030S-Kq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7F-0004Ua-NA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso30918025e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733949; x=1686325949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afgvvt2mEnbYffaRVT+ikKLu+J5+NN7Q7LWy/8ocp6g=;
 b=TetpG3zoFcKBxPNamTMDnC/Yua72RrxSdWn354Q2mwkoB0usAgN179vl/pWpW40lMH
 TubxYwB7JV5t+pt7l1eQpZQWJFliy2FI6Lxp9Vsknv2OUlr5qSr4H7R9kybxgottti6e
 X2CViOe2u0UQpSDaCjbxlTJI4KLuFrLUiBWdpA1jwsFGYObwoPBOUawF8+J9tIxG8D9Z
 j5m8YC1Bws/JpBC7EPiqPfVHCu7BXY0hkwy8IfR4Xx69RGkJEJR+C2DD2+8qnnEjkkc3
 X/6cv1W/RhZD6EH3gCnpb0gtiJ3CUSgSR/Lh4F0uqGBahTXabrvi+w8DHhhRNrxPrYSh
 mvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733949; x=1686325949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afgvvt2mEnbYffaRVT+ikKLu+J5+NN7Q7LWy/8ocp6g=;
 b=aY715mrw+8rxYnkJXVioj8NWvC5MzPhpz8Frp+JGROnSuahb2Y46ZIqGHmhLtsATud
 3cT1MwqVynaF1xgWvsHH9tYU66HM6OLRSEm7paGJWl/EUJkFgdCjm0rsO5oxKlvIpyF1
 I/unZbgXnJR1R5AuNS/F8QwjXPxbPo+W5YthvQlrMpBBqPm0O8RkqqV4IrmZM93+uiID
 GBMVj86fX8PFEALpKgrMnQXdb1Z4NrtCXEIkUrucxbrHZ0kAQhV53cDN7FH8lN8x/+Lp
 20sCQQLG4NhxnZrWDVRXRW96SHspWPoScBOpYqbodmgUEe9Ppj1OL3UvCFZm/x2EM6I8
 xqpQ==
X-Gm-Message-State: AC+VfDyVkAWMPVu0IRpcDOPliTP+FOA6rRGKAoFpBJLauRevWVeIABNX
 apQs2DsIebH6opx4D/u9eAGz2V2jz781r5T+ps2Rjg==
X-Google-Smtp-Source: ACHHUZ5+67xmSspNZ1jOWfbONSgbfVCdR5NClzGL0u6E7OLQi3keW77ltWbX2VGWWAMy8+4eoOFG7Q==
X-Received: by 2002:a1c:f418:0:b0:3f1:6f52:74d with SMTP id
 z24-20020a1cf418000000b003f16f52074dmr11996589wma.39.1683733949622; 
 Wed, 10 May 2023 08:52:29 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23157946wmk.35.2023.05.10.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:52:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 4/5] disas: Move softmmu specific code to separate file
Date: Wed, 10 May 2023 16:52:25 +0100
Message-Id: <20230510155226.647756-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510155226.647756-1-richard.henderson@linaro.org>
References: <20230510155226.647756-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
index a709831e8d..5e7401bb6f 100644
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
@@ -241,8 +236,7 @@ void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size)
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
@@ -338,61 +332,3 @@ const char *lookup_symbol(uint64_t orig_addr)
 
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


