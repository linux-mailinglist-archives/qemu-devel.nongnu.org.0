Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA850B620
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:26:55 +0200 (CEST)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrR8-0001xG-Tc
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLL-0001er-8c
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLI-0004tG-PR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXwrRFIl3MKJX75HV4mLMd8urc9MXKNUMtnL7Yxa1mg=;
 b=aNkvT5IkunpSLmRJe/WkHplIskBPzScNVl8Ft6xGiWvqyMqOwZUig0exuNPl9KKCXct0uH
 Xf1uGiMWbriLkAaDOupMk4pTjH+bhSKH2vNN07A1gBXxb1sqIayK70qbdsVgvK+29GT9fq
 PqhbnbKeryChzbaBn/pM9xBMmUUx/L8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-faGv3Cn5PnKqcy-Q9jVQ0g-1; Fri, 22 Apr 2022 06:16:46 -0400
X-MC-Unique: faGv3Cn5PnKqcy-Q9jVQ0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7E20105A404;
 Fri, 22 Apr 2022 10:16:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E15B2C28107;
 Fri, 22 Apr 2022 10:16:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/13] dump/win_dump: add 32-bit guest Windows support
Date: Fri, 22 Apr 2022 14:15:25 +0400
Message-Id: <20220422101525.3260741-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viktor Prutyanov <viktor.prutyanov@redhat.com>

Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
dump header provided by guest through vmcoreinfo and thus was unable
to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
dumping support.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[ misc error handling fixes to avoid compiler warning ]
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220406171558.199263-5-viktor.prutyanov@redhat.com>
---
 dump/win_dump.c | 251 +++++++++++++++++++++++++++++-------------------
 hmp-commands.hx |   2 +-
 2 files changed, 154 insertions(+), 99 deletions(-)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index d733918038b2..fd91350fbb8e 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -23,18 +23,24 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "win_dump.h"
 
-#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
+static size_t win_dump_ptr_size(bool x64)
+{
+    return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
+}
 
-#define _WIN_DUMP_FIELD(f) (h->f)
+#define _WIN_DUMP_FIELD(f) (x64 ? h->x64.f : h->x32.f)
 #define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
 
-#define _WIN_DUMP_FIELD_PTR(f) ((void *)&h->f)
+#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&h->x64.f : (void *)&h->x32.f)
 #define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
 
-#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
+#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h->x64.f) : sizeof(h->x32.f))
 #define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
 
-#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)
+static size_t win_dump_ctx_size(bool x64)
+{
+    return x64 ? sizeof(WinContext64) : sizeof(WinContext32);
+}
 
 static size_t write_run(uint64_t base_page, uint64_t page_count,
         int fd, Error **errp)
@@ -70,7 +76,7 @@ static size_t write_run(uint64_t base_page, uint64_t page_count,
     return total;
 }
 
-static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
+static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error **errp)
 {
     uint64_t BasePage, PageCount;
     Error *local_err = NULL;
@@ -87,22 +93,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
     }
 }
 
-static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)
+static int cpu_read_ptr(bool x64, CPUState *cpu, uint64_t addr, uint64_t *ptr)
 {
     int ret;
+    uint32_t ptr32;
     uint64_t ptr64;
 
-    ret = cpu_memory_rw_debug(cpu, addr, &ptr64, WIN_DUMP_PTR_SIZE, 0);
+    ret = cpu_memory_rw_debug(cpu, addr, x64 ? (void *)&ptr64 : (void *)&ptr32,
+            win_dump_ptr_size(x64), 0);
 
-    *ptr = ptr64;
+    *ptr = x64 ? ptr64 : ptr32;
 
     return ret;
 }
 
-static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
+static void patch_mm_pfn_database(WinDumpHeader *h, bool x64, Error **errp)
 {
     if (cpu_memory_rw_debug(first_cpu,
-            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_OFFSET64,
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_OFFSET,
             WIN_DUMP_FIELD_PTR(PfnDatabase),
             WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
         error_setg(errp, "win-dump: failed to read MmPfnDatabase");
@@ -110,13 +118,12 @@ static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
     }
 }
 
-static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
+static void patch_bugcheck_data(WinDumpHeader *h, bool x64, Error **errp)
 {
     uint64_t KiBugcheckData;
 
-    if (cpu_read_ptr(first_cpu,
-            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
-                KDBG_KI_BUGCHECK_DATA_OFFSET64,
+    if (cpu_read_ptr(x64, first_cpu,
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_KI_BUGCHECK_DATA_OFFSET,
             &KiBugcheckData)) {
         error_setg(errp, "win-dump: failed to read KiBugcheckData");
         return;
@@ -141,45 +148,55 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
 /*
  * This routine tries to correct mistakes in crashdump header.
  */
-static void patch_header(WinDumpHeader64 *h)
+static void patch_header(WinDumpHeader *h, bool x64)
 {
     Error *local_err = NULL;
 
-    h->RequiredDumpSpace = sizeof(WinDumpHeader64) +
-            (h->PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
-    h->PhysicalMemoryBlock.unused = 0;
-    h->unused1 = 0;
+    if (x64) {
+        h->x64.RequiredDumpSpace = sizeof(WinDumpHeader64) +
+            (h->x64.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
+        h->x64.PhysicalMemoryBlock.unused = 0;
+        h->x64.unused1 = 0;
+    } else {
+        h->x32.RequiredDumpSpace = sizeof(WinDumpHeader32) +
+            (h->x32.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
+    }
 
-    patch_mm_pfn_database(h, &local_err);
+    patch_mm_pfn_database(h, x64, &local_err);
     if (local_err) {
         warn_report_err(local_err);
         local_err = NULL;
     }
-    patch_bugcheck_data(h, &local_err);
+    patch_bugcheck_data(h, x64, &local_err);
     if (local_err) {
         warn_report_err(local_err);
     }
 }
 
-static void check_header(WinDumpHeader64 *h, Error **errp)
+static bool check_header(WinDumpHeader *h, bool *x64, Error **errp)
 {
     const char Signature[] = "PAGE";
-    const char ValidDump[] = "DU64";
 
     if (memcmp(h->Signature, Signature, sizeof(h->Signature))) {
         error_setg(errp, "win-dump: invalid header, expected '%.4s',"
                          " got '%.4s'", Signature, h->Signature);
-        return;
+        return false;
     }
 
-    if (memcmp(h->ValidDump, ValidDump, sizeof(h->ValidDump))) {
-        error_setg(errp, "win-dump: invalid header, expected '%.4s',"
-                         " got '%.4s'", ValidDump, h->ValidDump);
-        return;
+    if (!memcmp(h->ValidDump, "DUMP", sizeof(h->ValidDump))) {
+        *x64 = false;
+    } else if (!memcmp(h->ValidDump, "DU64", sizeof(h->ValidDump))) {
+        *x64 = true;
+    } else {
+        error_setg(errp, "win-dump: invalid header, expected 'DUMP' or 'DU64',"
+                   " got '%.4s'", h->ValidDump);
+        return false;
     }
+
+    return true;
 }
 
-static void check_kdbg(WinDumpHeader64 *h, Error **errp)
+static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)
 {
     const char OwnerTag[] = "KDBG";
     char read_OwnerTag[4];
@@ -188,7 +205,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **errp)
 
 try_again:
     if (cpu_memory_rw_debug(first_cpu,
-            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET,
             (uint8_t *)&read_OwnerTag, sizeof(read_OwnerTag), 0)) {
         error_setg(errp, "win-dump: failed to read OwnerTag");
         return;
@@ -213,15 +230,19 @@ try_again:
         }
     }
 
-    h->KdDebuggerDataBlock = KdDebuggerDataBlock;
+    if (x64) {
+        h->x64.KdDebuggerDataBlock = KdDebuggerDataBlock;
+    } else {
+        h->x32.KdDebuggerDataBlock = KdDebuggerDataBlock;
+    }
 }
 
 struct saved_context {
-    WinContext64 ctx;
+    WinContext ctx;
     uint64_t addr;
 };
 
-static void patch_and_save_context(WinDumpHeader64 *h,
+static void patch_and_save_context(WinDumpHeader *h, bool x64,
                                    struct saved_context *saved_ctx,
                                    Error **errp)
 {
@@ -231,15 +252,15 @@ static void patch_and_save_context(WinDumpHeader64 *h,
     CPUState *cpu;
     int i = 0;
 
-    if (cpu_read_ptr(first_cpu,
-            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
+    if (cpu_read_ptr(x64, first_cpu,
+            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET,
             &KiProcessorBlock)) {
         error_setg(errp, "win-dump: failed to read KiProcessorBlock");
         return;
     }
 
     if (cpu_memory_rw_debug(first_cpu,
-            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET,
             (uint8_t *)&OffsetPrcbContext, sizeof(OffsetPrcbContext), 0)) {
         error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
         return;
@@ -250,17 +271,17 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         CPUX86State *env = &x86_cpu->env;
         uint64_t Prcb;
         uint64_t Context;
-        WinContext64 ctx;
+        WinContext ctx;
 
-        if (cpu_read_ptr(first_cpu,
-                KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
+        if (cpu_read_ptr(x64, first_cpu,
+                KiProcessorBlock + i * win_dump_ptr_size(x64),
                 &Prcb)) {
             error_setg(errp, "win-dump: failed to read"
                              " CPU #%d PRCB location", i);
             return;
         }
 
-        if (cpu_read_ptr(first_cpu,
+        if (cpu_read_ptr(x64, first_cpu,
                 Prcb + OffsetPrcbContext,
                 &Context)) {
             error_setg(errp, "win-dump: failed to read"
@@ -270,56 +291,88 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
         saved_ctx[i].addr = Context;
 
-        ctx = (WinContext64){
-            .ContextFlags = WIN_CTX64_ALL,
-            .MxCsr = env->mxcsr,
-
-            .SegEs = env->segs[0].selector,
-            .SegCs = env->segs[1].selector,
-            .SegSs = env->segs[2].selector,
-            .SegDs = env->segs[3].selector,
-            .SegFs = env->segs[4].selector,
-            .SegGs = env->segs[5].selector,
-            .EFlags = cpu_compute_eflags(env),
-
-            .Dr0 = env->dr[0],
-            .Dr1 = env->dr[1],
-            .Dr2 = env->dr[2],
-            .Dr3 = env->dr[3],
-            .Dr6 = env->dr[6],
-            .Dr7 = env->dr[7],
-
-            .Rax = env->regs[R_EAX],
-            .Rbx = env->regs[R_EBX],
-            .Rcx = env->regs[R_ECX],
-            .Rdx = env->regs[R_EDX],
-            .Rsp = env->regs[R_ESP],
-            .Rbp = env->regs[R_EBP],
-            .Rsi = env->regs[R_ESI],
-            .Rdi = env->regs[R_EDI],
-            .R8  = env->regs[8],
-            .R9  = env->regs[9],
-            .R10 = env->regs[10],
-            .R11 = env->regs[11],
-            .R12 = env->regs[12],
-            .R13 = env->regs[13],
-            .R14 = env->regs[14],
-            .R15 = env->regs[15],
-
-            .Rip = env->eip,
-            .FltSave = {
+        if (x64) {
+            ctx.x64 = (WinContext64){
+                .ContextFlags = WIN_CTX64_ALL,
                 .MxCsr = env->mxcsr,
-            },
-        };
+
+                .SegEs = env->segs[0].selector,
+                .SegCs = env->segs[1].selector,
+                .SegSs = env->segs[2].selector,
+                .SegDs = env->segs[3].selector,
+                .SegFs = env->segs[4].selector,
+                .SegGs = env->segs[5].selector,
+                .EFlags = cpu_compute_eflags(env),
+
+                .Dr0 = env->dr[0],
+                .Dr1 = env->dr[1],
+                .Dr2 = env->dr[2],
+                .Dr3 = env->dr[3],
+                .Dr6 = env->dr[6],
+                .Dr7 = env->dr[7],
+
+                .Rax = env->regs[R_EAX],
+                .Rbx = env->regs[R_EBX],
+                .Rcx = env->regs[R_ECX],
+                .Rdx = env->regs[R_EDX],
+                .Rsp = env->regs[R_ESP],
+                .Rbp = env->regs[R_EBP],
+                .Rsi = env->regs[R_ESI],
+                .Rdi = env->regs[R_EDI],
+                .R8  = env->regs[8],
+                .R9  = env->regs[9],
+                .R10 = env->regs[10],
+                .R11 = env->regs[11],
+                .R12 = env->regs[12],
+                .R13 = env->regs[13],
+                .R14 = env->regs[14],
+                .R15 = env->regs[15],
+
+                .Rip = env->eip,
+                .FltSave = {
+                    .MxCsr = env->mxcsr,
+                },
+            };
+        } else {
+            ctx.x32 = (WinContext32){
+                .ContextFlags = WIN_CTX32_FULL | WIN_CTX_DBG,
+
+                .SegEs = env->segs[0].selector,
+                .SegCs = env->segs[1].selector,
+                .SegSs = env->segs[2].selector,
+                .SegDs = env->segs[3].selector,
+                .SegFs = env->segs[4].selector,
+                .SegGs = env->segs[5].selector,
+                .EFlags = cpu_compute_eflags(env),
+
+                .Dr0 = env->dr[0],
+                .Dr1 = env->dr[1],
+                .Dr2 = env->dr[2],
+                .Dr3 = env->dr[3],
+                .Dr6 = env->dr[6],
+                .Dr7 = env->dr[7],
+
+                .Eax = env->regs[R_EAX],
+                .Ebx = env->regs[R_EBX],
+                .Ecx = env->regs[R_ECX],
+                .Edx = env->regs[R_EDX],
+                .Esp = env->regs[R_ESP],
+                .Ebp = env->regs[R_EBP],
+                .Esi = env->regs[R_ESI],
+                .Edi = env->regs[R_EDI],
+
+                .Eip = env->eip,
+            };
+        }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
+                &saved_ctx[i].ctx, win_dump_ctx_size(x64), 0)) {
             error_setg(errp, "win-dump: failed to save CPU #%d context", i);
             return;
         }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                &ctx, WIN_DUMP_CTX_SIZE, 1)) {
+                &ctx, win_dump_ctx_size(x64), 1)) {
             error_setg(errp, "win-dump: failed to write CPU #%d context", i);
             return;
         }
@@ -328,14 +381,14 @@ static void patch_and_save_context(WinDumpHeader64 *h,
     }
 }
 
-static void restore_context(WinDumpHeader64 *h,
+static void restore_context(WinDumpHeader *h, bool x64,
                             struct saved_context *saved_ctx)
 {
     int i;
 
     for (i = 0; i < WIN_DUMP_FIELD(NumberProcessors); i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 1)) {
+                &saved_ctx[i].ctx, win_dump_ctx_size(x64), 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
@@ -343,25 +396,27 @@ static void restore_context(WinDumpHeader64 *h,
 
 void create_win_dump(DumpState *s, Error **errp)
 {
-    WinDumpHeader64 *h = (WinDumpHeader64 *)(s->guest_note +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE);
+    WinDumpHeader *h = (void *)(s->guest_note + VMCOREINFO_ELF_NOTE_HDR_SIZE);
     X86CPU *first_x86_cpu = X86_CPU(first_cpu);
     uint64_t saved_cr3 = first_x86_cpu->env.cr[3];
     struct saved_context *saved_ctx = NULL;
     Error *local_err = NULL;
+    bool x64 = true;
+    size_t hdr_size;
 
-    if (s->guest_note_size != sizeof(WinDumpHeader64) +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE) {
+    if (s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE32 &&
+            s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE64) {
         error_setg(errp, "win-dump: invalid vmcoreinfo note size");
         return;
     }
 
-    check_header(h, &local_err);
-    if (local_err) {
+    if (!check_header(h, &x64, &local_err)) {
         error_propagate(errp, local_err);
         return;
     }
 
+    hdr_size = x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);
+
     /*
      * Further access to kernel structures by virtual addresses
      * should be made from system context.
@@ -369,13 +424,13 @@ void create_win_dump(DumpState *s, Error **errp)
 
     first_x86_cpu->env.cr[3] = WIN_DUMP_FIELD(DirectoryTableBase);
 
-    check_kdbg(h, &local_err);
+    check_kdbg(h, x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_cr3;
     }
 
-    patch_header(h);
+    patch_header(h, x64);
 
     saved_ctx = g_new(struct saved_context, WIN_DUMP_FIELD(NumberProcessors));
 
@@ -384,7 +439,7 @@ void create_win_dump(DumpState *s, Error **errp)
      * to determine if the system-saved context is valid
      */
 
-    patch_and_save_context(h, saved_ctx, &local_err);
+    patch_and_save_context(h, x64, saved_ctx, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_free;
@@ -392,20 +447,20 @@ void create_win_dump(DumpState *s, Error **errp)
 
     s->total_size = WIN_DUMP_FIELD(RequiredDumpSpace);
 
-    s->written_size = qemu_write_full(s->fd, h, sizeof(*h));
-    if (s->written_size != sizeof(*h)) {
+    s->written_size = qemu_write_full(s->fd, h, hdr_size);
+    if (s->written_size != hdr_size) {
         error_setg(errp, QERR_IO_ERROR);
         goto out_restore;
     }
 
-    write_runs(s, h, &local_err);
+    write_runs(s, h, x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_restore;
     }
 
 out_restore:
-    restore_context(h, saved_ctx);
+    restore_context(h, x64, saved_ctx);
 out_free:
     g_free(saved_ctx);
 out_cr3:
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9c9..dd4006d3558a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1064,7 +1064,7 @@ ERST
                       "-l: dump in kdump-compressed format, with lzo compression.\n\t\t\t"
                       "-s: dump in kdump-compressed format, with snappy compression.\n\t\t\t"
                       "-w: dump in Windows crashdump format (can be used instead of ELF-dump converting),\n\t\t\t"
-                      "    for Windows x64 guests with vmcoreinfo driver only.\n\t\t\t"
+                      "    for Windows x86 and x64 guests with vmcoreinfo driver only.\n\t\t\t"
                       "begin: the starting physical address.\n\t\t\t"
                       "length: the memory size, in bytes.",
         .cmd        = hmp_dump_guest_memory,
-- 
2.36.0


