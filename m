Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54E6F521A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6wv-0008Ux-JB; Wed, 03 May 2023 03:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wg-0007ib-N4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6we-0006zn-3h
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso29367105e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099033; x=1685691033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7jjo1HRjX5J06Sn78MA0vlVLnBMkg0D1KFM1fdWj48=;
 b=pvKPDLjW1wcTcrrdojjCfANyqPVSjkzMZiE7qhownuIWmUytb8DBnqMwxjZBGIWQXP
 7DifSAVloNwHIB2rfIB9dPsEIxnyKaBpxwTlRHBRJcCD3UTu+RMTo4DrHezrYiouEGuB
 GTD8GoBJRN8ODy8PmHrCrOHIJQrHYRjzhY29SdCii6Z703MgelaChhnVvGyjtT6VwurE
 muh/+psQQBtP+jWJoX7T50bzuF0AIsjVKZ5q3b8RmNwReMDwcnJZpalqmEzNiC+YLQug
 vpyekd8AxXV9GAzBvVbX1tVToyIOpWOW0erMUzLlpmxatBdzktNhABF2uDg+c2VOsjw9
 3X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099033; x=1685691033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7jjo1HRjX5J06Sn78MA0vlVLnBMkg0D1KFM1fdWj48=;
 b=CTWUA+HLg37roX4Ufam/Eq9EI+s4UzfKO7EaCcLa0P0tx6CNFv99L3uYizPI6sa+zv
 tE6Ks7iy85dDsbWVIxjknkfZSqfkzgJAe3Vp9UIFJBgehfBlu3KTu1yPFQk+FeIqvIO7
 tZ2cqszKmjCBhzBLJp8ProcpYh2oJx1FE2IEn+JqYJh6XVxp3qVRTjJz9SZMDSyAXxNY
 4GJ14oayPRWDljPk1z8Ho4PncLue+k/34wyeDAaYdTy2EkWW2OgCAseGYmVDgxYJwD2l
 A1p3yzx58EvBfnNv5W+MrWx1TaGGQqovHNjeMAF85jGou2TO3e4MW6iaanm6IV8e1Yc4
 mCmg==
X-Gm-Message-State: AC+VfDy79bSZm2LrlfGSR95JUJV2cpU86ZYVxU98TB4ZwnegOHOeceBF
 TMfj9ZB3kfgM0nI21NEl3PbWxLhk+Bw028oUbjOR4Q==
X-Google-Smtp-Source: ACHHUZ6zFXV8rZP9RGgd8GA5RBZOIzRO28czFWLf5pZDYwiV0XpCDSZpJCL2DVEOb91M3hTBGkPxwQ==
X-Received: by 2002:a05:600c:298:b0:3ee:1acd:b039 with SMTP id
 24-20020a05600c029800b003ee1acdb039mr14227919wmk.34.1683099033660; 
 Wed, 03 May 2023 00:30:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm982896wmb.25.2023.05.03.00.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 80/84] disas: Remove target_ulong from the interface
Date: Wed,  3 May 2023 08:23:27 +0100
Message-Id: <20230503072331.1747057-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
---
 include/disas/disas.h | 17 ++++++-----------
 disas/disas.c         | 19 +++++++++----------
 linux-user/elfload.c  |  5 +++--
 3 files changed, 18 insertions(+), 23 deletions(-)

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
index f1370a7a8b..d66af2b82a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3329,9 +3329,10 @@ static void load_elf_interp(const char *filename, struct image_info *info,
 
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
@@ -3340,7 +3341,7 @@ static int symfind(const void *s0, const void *s1)
     return result;
 }
 
-static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
+static const char *lookup_symbolxx(struct syminfo *s, uint64_t orig_addr)
 {
 #if ELF_CLASS == ELFCLASS32
     struct elf_sym *syms = s->disas_symtab.elf32;
-- 
2.34.1


