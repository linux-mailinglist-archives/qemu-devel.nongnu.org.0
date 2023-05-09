Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A6FCB5D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:34:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQHP-0004gr-Tb; Tue, 09 May 2023 12:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHM-0004gG-RP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHK-0007W8-PP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso5397087f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683650009; x=1686242009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGlQDLvqKUT4+MDaEXLHZhgv8xrgNwzz15sJXDY+k8U=;
 b=n9gQkaJUio5C9LeNKNDVP3HadzEUExANS2bxUS4+BhYwFv5dj2IwA0JJxpK4TT3+2a
 TklcGADdrko/17VcRub4nGTrzKkJ4bTDrDbETCGvn89q4WJEss5Q+oJkMCbykZRJUrhA
 MjKo4LtLT2KA6J+XXUWw5MJziVwA116099jaKm8I6/RHktTtF2DqjMnb95xascM/hIL2
 Nx+J4FZyb7k8Ts5fuQSraT102dcpVsuvEC4yBXZyQQyzFwJpDMyJBFGklPtpyEvClBv5
 f3YI/++l55krloSau3pSzMlR89DkAHX74dQ93aF8kAmsytchbwWhwOebdo9I2Fk0fxhT
 Vugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650009; x=1686242009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGlQDLvqKUT4+MDaEXLHZhgv8xrgNwzz15sJXDY+k8U=;
 b=KrFOE64Gt7ZPRByxSj0/N7ZCM6YsrioDCOf9ssOC39PMKDUCRsYztagh6Ux6opB+8K
 TDvO+jISkXyC5oTuWv/KOzkGGoNCe8Ry8f1MYwWneDTOFxVT70k9TxI8qHuSyKgvFmAF
 NE5Q8F1wBlvKKvCRYJrUXd+QNLY154wKhZ/XpHrZDthIUitDaW8mADWoxqT61QyDNKMx
 xW1SZgBCeAyU1SChbYV/85dRhGEIF2iDeYT+NhZj0Sxt4YEtxV7fTWhSCn5jjFgE2i2A
 AstRd58T+MtzmMpw16HuE3q8pn2I2CFVftAwhSpR2LUtB+9A8LmbHY6BaSNJV0aMSoBb
 cjDw==
X-Gm-Message-State: AC+VfDy3UEUxGQSkF4U7kT/ViXHpZ3NakxfTNOQ82oRGffr8QI17U2BG
 scM0IxCXE59xUgSf5m7pk4eqQNVUGUIe23IUOSAicw==
X-Google-Smtp-Source: ACHHUZ6m3GYcC5XniH4TzRIVGDGZFcCPZ1EIFXdfc+P6D2WgUDi8773P+LAERrsMEKNP0gBhntdB3A==
X-Received: by 2002:adf:ff85:0:b0:307:92e8:ec60 with SMTP id
 j5-20020adfff85000000b0030792e8ec60mr5630096wrr.39.1683650009133; 
 Tue, 09 May 2023 09:33:29 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm7393298wrj.92.2023.05.09.09.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	philmd@linaro.org,
	thuth@redhat.com
Subject: [PATCH v2 2/5] disas: Remove target_ulong from the interface
Date: Tue,  9 May 2023 17:33:23 +0100
Message-Id: <20230509163326.121090-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509163326.121090-1-richard.henderson@linaro.org>
References: <20230509163326.121090-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Use uint64_t for the pc, and size_t for the size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503072331.1747057-81-richard.henderson@linaro.org>
---
 include/disas/disas.h | 17 ++++++-----------
 bsd-user/elfload.c    |  5 +++--
 disas/disas.c         | 19 +++++++++----------
 linux-user/elfload.c  |  5 +++--
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/include/disas/disas.h b/include/disas/disas.h
index d363e95ede..6c394e0b09 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -7,28 +7,23 @@
 #include "cpu.h"
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, const void *code, unsigned long size);
-void target_disas(FILE *out, CPUState *cpu, target_ulong code,
-                  target_ulong size);
+void disas(FILE *out, const void *code, size_t size);
+void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size);
 
-void monitor_disas(Monitor *mon, CPUState *cpu,
-                   target_ulong pc, int nb_insn, int is_physical);
+void monitor_disas(Monitor *mon, CPUState *cpu, uint64_t pc,
+                   int nb_insn, bool is_physical);
 
 char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
-const char *lookup_symbol(target_ulong orig_addr);
+const char *lookup_symbol(uint64_t orig_addr);
 #endif
 
 struct syminfo;
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
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index fbcdc94b96..2e76f0d3b5 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -352,9 +352,10 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
 
 static int symfind(const void *s0, const void *s1)
 {
-    target_ulong addr = *(target_ulong *)s0;
+    __typeof(sym->st_value) addr = *(uint64_t *)s0;
     struct elf_sym *sym = (struct elf_sym *)s1;
     int result = 0;
+
     if (addr < sym->st_value) {
         result = -1;
     } else if (addr >= sym->st_value + sym->st_size) {
@@ -363,7 +364,7 @@ static int symfind(const void *s0, const void *s1)
     return result;
 }
 
-static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
+static const char *lookup_symbolxx(struct syminfo *s, uint64_t orig_addr)
 {
 #if ELF_CLASS == ELFCLASS32
     struct elf_sym *syms = s->disas_symtab.elf32;
diff --git a/disas/disas.c b/disas/disas.c
index b087c12c47..f5e95043cf 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -204,10 +204,9 @@ static void initialize_debug_host(CPUDebug *s)
 }
 
 /* Disassemble this for me please... (debugging).  */
-void target_disas(FILE *out, CPUState *cpu, target_ulong code,
-                  target_ulong size)
+void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size)
 {
-    target_ulong pc;
+    uint64_t pc;
     int count;
     CPUDebug s;
 
@@ -226,7 +225,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 
     for (pc = code; size > 0; pc += count, size -= count) {
-	fprintf(out, "0x" TARGET_FMT_lx ":  ", pc);
+	fprintf(out, "0x%08" PRIx64 ":  ", pc);
 	count = s.info.print_insn(pc, &s.info);
 	fprintf(out, "\n");
 	if (count < 0)
@@ -292,7 +291,7 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 }
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, const void *code, unsigned long size)
+void disas(FILE *out, const void *code, size_t size)
 {
     uintptr_t pc;
     int count;
@@ -324,7 +323,7 @@ void disas(FILE *out, const void *code, unsigned long size)
 }
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
-const char *lookup_symbol(target_ulong orig_addr)
+const char *lookup_symbol(uint64_t orig_addr)
 {
     const char *symbol = "";
     struct syminfo *s;
@@ -356,8 +355,8 @@ physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
 }
 
 /* Disassembler for the monitor.  */
-void monitor_disas(Monitor *mon, CPUState *cpu,
-                   target_ulong pc, int nb_insn, int is_physical)
+void monitor_disas(Monitor *mon, CPUState *cpu, uint64_t pc,
+                   int nb_insn, bool is_physical)
 {
     int count, i;
     CPUDebug s;
@@ -378,13 +377,13 @@ void monitor_disas(Monitor *mon, CPUState *cpu,
     }
 
     if (!s.info.print_insn) {
-        monitor_printf(mon, "0x" TARGET_FMT_lx
+        monitor_printf(mon, "0x%08" PRIx64
                        ": Asm output not supported on this arch\n", pc);
         return;
     }
 
     for (i = 0; i < nb_insn; i++) {
-        g_string_append_printf(ds, "0x" TARGET_FMT_lx ":  ", pc);
+        g_string_append_printf(ds, "0x%08" PRIx64 ":  ", pc);
         count = s.info.print_insn(pc, &s.info);
         g_string_append_c(ds, '\n');
         if (count < 0) {
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 703f7434a0..80085b8a30 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3327,9 +3327,10 @@ static void load_elf_interp(const char *filename, struct image_info *info,
 
 static int symfind(const void *s0, const void *s1)
 {
-    target_ulong addr = *(target_ulong *)s0;
     struct elf_sym *sym = (struct elf_sym *)s1;
+    __typeof(sym->st_value) addr = *(uint64_t *)s0;
     int result = 0;
+
     if (addr < sym->st_value) {
         result = -1;
     } else if (addr >= sym->st_value + sym->st_size) {
@@ -3338,7 +3339,7 @@ static int symfind(const void *s0, const void *s1)
     return result;
 }
 
-static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
+static const char *lookup_symbolxx(struct syminfo *s, uint64_t orig_addr)
 {
 #if ELF_CLASS == ELFCLASS32
     struct elf_sym *syms = s->disas_symtab.elf32;
-- 
2.34.1


