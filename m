Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E726E9AE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 01:59:11 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ3ny-0005Q7-S5
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 19:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mM-0003kn-TP
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:30 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mK-0006e9-9z
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id 7so2312778pgm.11
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MS/1tLLb4oetx2r+bYB6y25h/eLEAPaiuMEVSm1K/g8=;
 b=UjUNVDC4R2lTf4RT66DbOu1/GsDEHMTjLluIhBfRzM++O5Sh/Bn+E9Fp95qxer1EDZ
 fLmmHM0F42+6ct+bvwfQhUBCMW3dQJBgPALwXV1SZHkcUd9yN72fsoXOfr9rJ0r2ulnd
 5Nl194/sshXOH5lflJRIbEqayc7gTeuZgXkC1d4G0aUl6/Es3NOtxc4FooUHyvv/gLej
 3rGCW4chl6yHr1Ztpt5t9u/kYHxtZDJJ+26zSEXAqxpmgKrpegCyjtqkmG7Miuw0K6tD
 Mh8/wVftn3mwO0lDmymYZdwJ4RBMKOgYis7xQW/hpWMm9cqK9hmnGID2FTeL8tyzo68u
 U4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MS/1tLLb4oetx2r+bYB6y25h/eLEAPaiuMEVSm1K/g8=;
 b=LdUWMPSJ8xXW9nioCczjazjjE8D41MgthEI0KIYqg5Xm2UEkC6/mrk+HkFbtuyuarA
 IHZfGBd80p/jee9o5DIWV9P1aNqJK3QjrGV7t/DmwKyAZKhirv/rVIq+6ss5k1UZK79T
 SFU71h/e6WjS9Wi1pzKw2jrvg3c+hcwrq3GX2wdLTlQG6BdZx2Bl7wvEvFsJpl8EaNKb
 8KIaUSQ8bmYVwkfSFA4UPEJRtyJcK8Xn7BufIBVNEm76kJ3/Ptb3y/8BwJlOxcITuTaQ
 zj3X/krEKvbYFxCH7zHL35L8Hzfm/x1Kp3eiR+PYKDoPEL0FlgXFGNOSvzIV9C/E0+WX
 ycHw==
X-Gm-Message-State: AOAM530nf5qT0AxjUUmeCkxyBcAtMyCEihnqV2WLwH40u0yvEQa1OJIa
 gN8SNxjYkW6J5tGELP76SFlPHg6KmT2XlQ==
X-Google-Smtp-Source: ABdhPJwTP19m3f5kxeBvwphXWmnzvtUMcY1u0/9yNMBxCGhjW8Zah+R2kCxf7K0cKu/fyn6Jh99eYg==
X-Received: by 2002:a63:f354:: with SMTP id t20mr2378266pgj.299.1600387045976; 
 Thu, 17 Sep 2020 16:57:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm772699pfk.103.2020.09.17.16.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 16:57:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] disas: Move host asm annotations to tb_gen_code
Date: Thu, 17 Sep 2020 16:57:13 -0700
Message-Id: <20200917235720.2685978-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917235720.2685978-1-richard.henderson@linaro.org>
References: <20200917235720.2685978-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of creating GStrings and passing them into log_disas,
just print the annotations directly in tb_gen_code.

Fix the annotations for the slow paths of the TB, after the
part implementing the final guest instruction.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/disas.h     |  2 +-
 include/exec/log.h        |  4 ++--
 accel/tcg/translate-all.c | 24 +++++++++++++++---------
 disas.c                   | 29 +++++++++--------------------
 tcg/tcg.c                 |  4 ++--
 5 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/include/disas/disas.h b/include/disas/disas.h
index 1b6e035e32..36c33f6f19 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -7,7 +7,7 @@
 #include "cpu.h"
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, void *code, unsigned long size, const char *note);
+void disas(FILE *out, void *code, unsigned long size);
 void target_disas(FILE *out, CPUState *cpu, target_ulong code,
                   target_ulong size);
 
diff --git a/include/exec/log.h b/include/exec/log.h
index 3ed797c1c8..fcc7b9e00b 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -56,13 +56,13 @@ static inline void log_target_disas(CPUState *cpu, target_ulong start,
     rcu_read_unlock();
 }
 
-static inline void log_disas(void *code, unsigned long size, const char *note)
+static inline void log_disas(void *code, unsigned long size)
 {
     QemuLogFile *logfile;
     rcu_read_lock();
     logfile = atomic_rcu_read(&qemu_logfile);
     if (logfile) {
-        disas(logfile->fd, code, size, note);
+        disas(logfile->fd, code, size);
     }
     rcu_read_unlock();
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 2d83013633..2874104a6a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1815,10 +1815,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         qemu_log_in_addr_range(tb->pc)) {
         FILE *logfile = qemu_log_lock();
         int code_size, data_size = 0;
-        g_autoptr(GString) note = g_string_new("[tb header & initial instruction]");
-        size_t chunk_start = 0;
+        size_t chunk_start;
         int insn = 0;
-        qemu_log("OUT: [size=%d]\n", gen_code_size);
+
         if (tcg_ctx->data_gen_ptr) {
             code_size = tcg_ctx->data_gen_ptr - tb->tc.ptr;
             data_size = gen_code_size - code_size;
@@ -1827,26 +1826,33 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         }
 
         /* Dump header and the first instruction */
+        qemu_log("OUT: [size=%d]\n", gen_code_size);
+        qemu_log("  -- guest addr 0x" TARGET_FMT_lx " + tb prologue\n",
+                 tcg_ctx->gen_insn_data[insn][0]);
         chunk_start = tcg_ctx->gen_insn_end_off[insn];
-        log_disas(tb->tc.ptr, chunk_start, note->str);
+        log_disas(tb->tc.ptr, chunk_start);
 
         /*
          * Dump each instruction chunk, wrapping up empty chunks into
          * the next instruction. The whole array is offset so the
          * first entry is the beginning of the 2nd instruction.
          */
-        while (insn <= tb->icount && chunk_start < code_size) {
+        while (insn < tb->icount) {
             size_t chunk_end = tcg_ctx->gen_insn_end_off[insn];
             if (chunk_end > chunk_start) {
-                g_string_printf(note, "[guest addr: " TARGET_FMT_lx "]",
-                                tcg_ctx->gen_insn_data[insn][0]);
-                log_disas(tb->tc.ptr + chunk_start, chunk_end - chunk_start,
-                          note->str);
+                qemu_log("  -- guest addr 0x" TARGET_FMT_lx "\n",
+                         tcg_ctx->gen_insn_data[insn][0]);
+                log_disas(tb->tc.ptr + chunk_start, chunk_end - chunk_start);
                 chunk_start = chunk_end;
             }
             insn++;
         }
 
+        if (chunk_start < code_size) {
+            qemu_log("  -- tb slow paths + alignment\n");
+            log_disas(tb->tc.ptr + chunk_start, code_size - chunk_start);
+        }
+
         /* Finally dump any data we may have after the block */
         if (data_size) {
             int i;
diff --git a/disas.c b/disas.c
index c1397d3933..a4304e8137 100644
--- a/disas.c
+++ b/disas.c
@@ -262,8 +262,7 @@ static void cap_dump_insn_units(disassemble_info *info, cs_insn *insn,
     }
 }
 
-static void cap_dump_insn(disassemble_info *info, cs_insn *insn,
-                          const char *note)
+static void cap_dump_insn(disassemble_info *info, cs_insn *insn)
 {
     fprintf_function print = info->fprintf_func;
     int i, n, split;
@@ -284,11 +283,7 @@ static void cap_dump_insn(disassemble_info *info, cs_insn *insn,
     }
 
     /* Print the actual instruction.  */
-    print(info->stream, "  %-8s %s", insn->mnemonic, insn->op_str);
-    if (note) {
-        print(info->stream, "\t\t%s", note);
-    }
-    print(info->stream, "\n");
+    print(info->stream, "  %-8s %s\n", insn->mnemonic, insn->op_str);
 
     /* Dump any remaining part of the insn on subsequent lines.  */
     for (i = split; i < n; i += split) {
@@ -320,7 +315,7 @@ static bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
         size -= tsize;
 
         while (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn, NULL);
+            cap_dump_insn(info, insn);
         }
 
         /* If the target memory is not consumed, go back for more... */
@@ -349,8 +344,7 @@ static bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size)
 }
 
 /* Disassemble SIZE bytes at CODE for the host.  */
-static bool cap_disas_host(disassemble_info *info, void *code, size_t size,
-                           const char *note)
+static bool cap_disas_host(disassemble_info *info, void *code, size_t size)
 {
     csh handle;
     const uint8_t *cbuf;
@@ -366,8 +360,7 @@ static bool cap_disas_host(disassemble_info *info, void *code, size_t size,
     pc = (uintptr_t)code;
 
     while (cs_disasm_iter(handle, &cbuf, &size, &pc, insn)) {
-        cap_dump_insn(info, insn, note);
-        note = NULL;
+        cap_dump_insn(info, insn);
     }
     if (size != 0) {
         (*info->fprintf_func)(info->stream,
@@ -411,7 +404,7 @@ static bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
         csize += tsize;
 
         if (cs_disasm_iter(handle, &cbuf, &csize, &pc, insn)) {
-            cap_dump_insn(info, insn, NULL);
+            cap_dump_insn(info, insn);
             if (--count <= 0) {
                 break;
             }
@@ -425,7 +418,7 @@ static bool cap_disas_monitor(disassemble_info *info, uint64_t pc, int count)
 #endif /* !CONFIG_USER_ONLY */
 #else
 # define cap_disas_target(i, p, s)  false
-# define cap_disas_host(i, p, s, n)  false
+# define cap_disas_host(i, p, s)  false
 # define cap_disas_monitor(i, p, c)  false
 # define cap_disas_plugin(i, p, c) false
 #endif /* CONFIG_CAPSTONE */
@@ -595,7 +588,7 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size)
 }
 
 /* Disassemble this for me please... (debugging). */
-void disas(FILE *out, void *code, unsigned long size, const char *note)
+void disas(FILE *out, void *code, unsigned long size)
 {
     uintptr_t pc;
     int count;
@@ -673,7 +666,7 @@ void disas(FILE *out, void *code, unsigned long size, const char *note)
     print_insn = print_insn_hppa;
 #endif
 
-    if (s.info.cap_arch >= 0 && cap_disas_host(&s.info, code, size, note)) {
+    if (s.info.cap_arch >= 0 && cap_disas_host(&s.info, code, size)) {
         return;
     }
 
@@ -683,10 +676,6 @@ void disas(FILE *out, void *code, unsigned long size, const char *note)
     for (pc = (uintptr_t)code; size > 0; pc += count, size -= count) {
         fprintf(out, "0x%08" PRIxPTR ":  ", pc);
         count = print_insn(pc, &s.info);
-        if (note) {
-            fprintf(out, "\t\t%s", note);
-            note = NULL;
-        }
         fprintf(out, "\n");
         if (count < 0) {
             break;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 62f299e36e..9a111ce604 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1101,7 +1101,7 @@ void tcg_prologue_init(TCGContext *s)
             size_t data_size = prologue_size - code_size;
             size_t i;
 
-            log_disas(buf0, code_size, NULL);
+            log_disas(buf0, code_size);
 
             for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
                 if (sizeof(tcg_target_ulong) == 8) {
@@ -1115,7 +1115,7 @@ void tcg_prologue_init(TCGContext *s)
                 }
             }
         } else {
-            log_disas(buf0, prologue_size, NULL);
+            log_disas(buf0, prologue_size);
         }
         qemu_log("\n");
         qemu_log_flush();
-- 
2.25.1


