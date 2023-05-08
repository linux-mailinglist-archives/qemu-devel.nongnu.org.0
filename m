Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D246FB1C8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:38:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw145-0006Lu-Sg; Mon, 08 May 2023 09:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw141-0006L9-6D
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw13w-0008Tm-F7
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683553079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMxuOduMsxreILqfhczFco5ffEOowQ/VDaBDf/Bg0sY=;
 b=b62vBNIDCxQlyz0QgKgcZvoX0NCWo9KvmfVR10eNCGv5kr5Fh6J5U2+5NmBDkgKy1AKYPY
 AIqR1YKwFnngA6BkXsW7u4QjIOcHvsIZZLfcxuAXSrvk9ckUJNe7cL68KnQtbdIe//jM+A
 To9Uy6ZqPZOG+v2U+x20udtpSy0J5bQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-iUyB6VgtP7K8pzG0937fiw-1; Mon, 08 May 2023 09:37:56 -0400
X-MC-Unique: iUyB6VgtP7K8pzG0937fiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC30E2812947;
 Mon,  8 May 2023 13:37:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564A8492B00;
 Mon,  8 May 2023 13:37:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Subject: [RFC PATCH 2/2] disas: Move disas.c into the target-independent
 source set
Date: Mon,  8 May 2023 15:37:45 +0200
Message-Id: <20230508133745.109463-3-thuth@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

By using hwaddr instead of target_ulong and by tweaking some other
spots, we can turn this code into target-independent code for
compiling it only once and not multiple times during the build
process.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build           |  4 ++--
 include/disas/disas.h | 15 +++------------
 include/hw/elf_ops.h  |  2 +-
 bsd-user/elfload.c    |  2 +-
 disas.c               | 22 ++++++++++++----------
 linux-user/elfload.c  |  2 +-
 6 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/meson.build b/meson.build
index 229eb585f7..73ceed037f 100644
--- a/meson.build
+++ b/meson.build
@@ -3152,8 +3152,8 @@ specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
-common_ss.add(capstone)
-specific_ss.add(files('disas.c'), capstone)
+common_ss.add(files('disas.c'), capstone)
+specific_ss.add(capstone)
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
diff --git a/include/disas/disas.h b/include/disas/disas.h
index 6c04428620..5132ebf982 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -3,19 +3,14 @@
 
 #include "exec/hwaddr.h"
 
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 /* Disassemble this for me please... (debugging). */
 void disas(FILE *out, const void *code, unsigned long size);
-void target_disas(FILE *out, CPUState *cpu, target_ulong code,
-                  target_ulong size);
+void target_disas(FILE *out, CPUState *cpu, hwaddr code, long size);
 
 char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
-const char *lookup_symbol(target_ulong orig_addr);
-#endif
+const char *lookup_symbol(hwaddr orig_addr);
 
 void monitor_disas(Monitor *mon, CPUState *cpu,
                    hwaddr pc, int nb_insn, int is_physical);
@@ -24,11 +19,7 @@ struct syminfo;
 struct elf32_sym;
 struct elf64_sym;
 
-#if defined(CONFIG_USER_ONLY)
-typedef const char *(*lookup_symbol_t)(struct syminfo *s, target_ulong orig_addr);
-#else
-typedef const char *(*lookup_symbol_t)(struct syminfo *s, hwaddr orig_addr);
-#endif
+typedef const char *(*lookup_symbol_t)(struct syminfo *s, uint64_t orig_addr);
 
 struct syminfo {
     lookup_symbol_t lookup_symbol;
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index dffb0e73d2..5e2af4d504 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -81,7 +81,7 @@ static int glue(symfind, SZ)(const void *s0, const void *s1)
 }
 
 static const char *glue(lookup_symbol, SZ)(struct syminfo *s,
-                                           hwaddr orig_addr)
+                                           uint64_t orig_addr)
 {
     struct elf_sym *syms = glue(s->disas_symtab.elf, SZ);
     struct elf_sym *sym;
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index fbcdc94b96..7c784518ed 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -363,7 +363,7 @@ static int symfind(const void *s0, const void *s1)
     return result;
 }
 
-static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
+static const char *lookup_symbolxx(struct syminfo *s, uint64_t orig_addr)
 {
 #if ELF_CLASS == ELFCLASS32
     struct elf_sym *syms = s->disas_symtab.elf32;
diff --git a/disas.c b/disas.c
index 4f4a07d611..31edbd2e70 100644
--- a/disas.c
+++ b/disas.c
@@ -3,6 +3,9 @@
 #include "disas/disas-internal.h"
 #include "elf.h"
 #include "qemu/qemu-print.h"
+#include "exec/cpu-common.h"
+#include "exec/memory.h"
+#include "hw/core/cpu.h"
 
 #include "disas/disas.h"
 #include "disas/capstone.h"
@@ -121,11 +124,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#if TARGET_BIG_ENDIAN
-    s->info.endian = BFD_ENDIAN_BIG;
-#else
-    s->info.endian = BFD_ENDIAN_LITTLE;
-#endif
+    if (target_words_bigendian()) {
+        s->info.endian = BFD_ENDIAN_BIG;
+    } else {
+        s->info.endian =  BFD_ENDIAN_LITTLE;
+    }
 
     CPUClass *cc = CPU_GET_CLASS(cpu);
     if (cc->disas_set_info) {
@@ -199,10 +202,9 @@ static void initialize_debug_host(CPUDebug *s)
 }
 
 /* Disassemble this for me please... (debugging).  */
-void target_disas(FILE *out, CPUState *cpu, target_ulong code,
-                  target_ulong size)
+void target_disas(FILE *out, CPUState *cpu, hwaddr code, long size)
 {
-    target_ulong pc;
+    hwaddr pc;
     int count;
     CPUDebug s;
 
@@ -221,7 +223,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 
     for (pc = code; size > 0; pc += count, size -= count) {
-	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
+        fprintf(out, "0x" HWADDR_FMT_plx ":  ", pc);
 	count = s.info.print_insn(pc, &s.info);
 	fprintf(out, "\n");
 	if (count < 0)
@@ -318,7 +320,7 @@ void disas(FILE *out, const void *code, unsigned long size)
 }
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
-const char *lookup_symbol(target_ulong orig_addr)
+const char *lookup_symbol(hwaddr orig_addr)
 {
     const char *symbol = "";
     struct syminfo *s;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 703f7434a0..48c9e910a8 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3338,7 +3338,7 @@ static int symfind(const void *s0, const void *s1)
     return result;
 }
 
-static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
+static const char *lookup_symbolxx(struct syminfo *s, uint64_t orig_addr)
 {
 #if ELF_CLASS == ELFCLASS32
     struct elf_sym *syms = s->disas_symtab.elf32;
-- 
2.31.1


