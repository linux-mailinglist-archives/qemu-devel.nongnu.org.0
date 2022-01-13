Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB648CFE5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 02:00:33 +0100 (CET)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7oTg-0007N8-RA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 20:00:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oN7-00009J-Ph
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:45 -0500
Received: from [2a00:1450:4864:20::142] (port=38703
 helo=mail-lf1-x142.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMw-0000YK-F5
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:37 -0500
Received: by mail-lf1-x142.google.com with SMTP id x6so14085869lfa.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Auxh+lgZ+uRp/+VUohEf91tHdfU5iJFTNGOhiE2MXRM=;
 b=LrhdmanGEHCkiTXi1UxVDoLmQbYbsZikXR4Cpp499G6Zma6u2Zb3ikxuswjDizlBHF
 ZZtDX1HeeTkiMFzfUdb4Vg93YsJaMDwUIsxc3i577e9rPlMIkJoc/BSXWTb+GZpVu1QR
 v7o1gFiV/01zPjfbGcmgcNulYnwrsEw+bV1kKYfF707PERfBNuj0o+wC8LKOo2dlYqur
 TGAsyxIuYvlbJm6Zgza2vYWuvGh7I0wNN8JndHD1lp8oYBwRIhYKdJi7bSLyOGfLpsVS
 YRRchAeCX+6BzFPbiAyWD4+WGQNuqyhlBTww7tmEUV1euRMzIY5u1QrZng0l3hRUgQG8
 W+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Auxh+lgZ+uRp/+VUohEf91tHdfU5iJFTNGOhiE2MXRM=;
 b=xXhhykH8JvLhIHoBH7+JZEt5qu6U361o4EBhAIqnT0Ox4a7DAdHhXtsAcKw6zvUJO3
 //QVxJdi1QQhvUu7a4m+F7twVW8ogZlT3P2F1YVgSZEZFdFejqXt0fgoX4vUBFcjQcvs
 8bxWpLKVTeUnk3M+I6ypLaV+vRZ52mKpJQMgFawKb1kc5w4JOjzZYoeNgdmBCwvHJaNl
 XMA/ldmanaG2pl8qdCa9DoH4NQ2GR3X8jCi3FwVTupOX1JRo6eETuW+w3AG7AivbQhdh
 qh4bTH/sO63PD0Iym9+EtdiIhiXQXia+MwsjiLzTBt+x+me9OK/R1hRmwKNDWVQdToy5
 Dn/g==
X-Gm-Message-State: AOAM531G63tCHTPt0fT71XabJma/BbUS4rxLmiqg6zGZdhOTOPLP4Uu2
 PWO3476xIS6Te4HvshuYrfLBoA==
X-Google-Smtp-Source: ABdhPJyiojrQDTgvTREDyr1i4hg8TO0cr1TzFGVpxKAygzKNuW+nB6jU7KPuNFjB2GEMEuoE1fnd8g==
X-Received: by 2002:a2e:bc17:: with SMTP id b23mr1386323ljf.365.1642035212181; 
 Wed, 12 Jan 2022 16:53:32 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id d2sm107688ljj.118.2022.01.12.16.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:53:31 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] dump/win_dump: add 32-bit guest Windows support
Date: Thu, 13 Jan 2022 03:52:48 +0300
Message-Id: <20220113005248.172522-5-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::142
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x142.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
dump header provided by guest through vmcoreinfo and thus was unable
to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
dumping support.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 dump/win_dump.c | 231 +++++++++++++++++++++++++++++-------------------
 1 file changed, 139 insertions(+), 92 deletions(-)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index df3b432ca5..d751cd6d36 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -24,18 +24,18 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "win_dump.h"
 
-#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
+#define WIN_DUMP_PTR_SIZE (x64 ? sizeof(uint64_t) : sizeof(uint32_t))
 
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
+#define WIN_DUMP_CTX_SIZE (x64 ? sizeof(WinContext64) : sizeof(WinContext32))
 
 static size_t write_run(uint64_t base_page, uint64_t page_count,
         int fd, Error **errp)
@@ -71,7 +71,7 @@ static size_t write_run(uint64_t base_page, uint64_t page_count,
     return total;
 }
 
-static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
+static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error **errp)
 {
     uint64_t BasePage, PageCount;
     Error *local_err = NULL;
@@ -88,22 +88,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
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
+            WIN_DUMP_PTR_SIZE, 0);
 
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
@@ -111,13 +113,12 @@ static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
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
@@ -142,30 +143,34 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
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
+static void check_header(WinDumpHeader *h, bool *x64, Error **errp)
 {
     const char Signature[] = "PAGE";
-    const char ValidDump[] = "DU64";
 
     if (memcmp(h->Signature, Signature, sizeof(h->Signature))) {
         error_setg(errp, "win-dump: invalid header, expected '%.4s',"
@@ -173,14 +178,17 @@ static void check_header(WinDumpHeader64 *h, Error **errp)
         return;
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
+                         " got '%.4s'", h->ValidDump);
     }
 }
 
-static void check_kdbg(WinDumpHeader64 *h, Error **errp)
+static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)
 {
     const char OwnerTag[] = "KDBG";
     char read_OwnerTag[4];
@@ -189,7 +197,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **errp)
 
 try_again:
     if (cpu_memory_rw_debug(first_cpu,
-            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET,
             (uint8_t *)&read_OwnerTag, sizeof(read_OwnerTag), 0)) {
         error_setg(errp, "win-dump: failed to read OwnerTag");
         return;
@@ -214,15 +222,19 @@ try_again:
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
@@ -232,15 +244,15 @@ static void patch_and_save_context(WinDumpHeader64 *h,
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
@@ -251,9 +263,9 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         CPUX86State *env = &x86_cpu->env;
         uint64_t Prcb;
         uint64_t Context;
-        WinContext64 ctx;
+        WinContext ctx;
 
-        if (cpu_read_ptr(first_cpu,
+        if (cpu_read_ptr(x64, first_cpu,
                 KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
                 &Prcb)) {
             error_setg(errp, "win-dump: failed to read"
@@ -261,7 +273,7 @@ static void patch_and_save_context(WinDumpHeader64 *h,
             return;
         }
 
-        if (cpu_read_ptr(first_cpu,
+        if (cpu_read_ptr(x64, first_cpu,
                 Prcb + OffsetPrcbContext,
                 &Context)) {
             error_setg(errp, "win-dump: failed to read"
@@ -271,47 +283,79 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
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
                 &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
@@ -329,7 +373,7 @@ static void patch_and_save_context(WinDumpHeader64 *h,
     }
 }
 
-static void restore_context(WinDumpHeader64 *h,
+static void restore_context(WinDumpHeader *h, bool x64,
                             struct saved_context *saved_ctx)
 {
     int i;
@@ -344,25 +388,28 @@ static void restore_context(WinDumpHeader64 *h,
 
 void create_win_dump(DumpState *s, Error **errp)
 {
-    WinDumpHeader64 *h = (WinDumpHeader64 *)(s->guest_note +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE);
+    WinDumpHeader *h = (void *)(s->guest_note + VMCOREINFO_ELF_NOTE_HDR_SIZE);
     X86CPU *first_x86_cpu = X86_CPU(first_cpu);
     uint64_t saved_cr3 = first_x86_cpu->env.cr[3];
     struct saved_context *saved_ctx = NULL;
     Error *local_err = NULL;
+    bool x64;
+    size_t hdr_size;
 
-    if (s->guest_note_size != sizeof(WinDumpHeader64) +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE) {
+    if (s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE32 &&
+            s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE64) {
         error_setg(errp, "win-dump: invalid vmcoreinfo note size");
         return;
     }
 
-    check_header(h, &local_err);
+    check_header(h, &x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
 
+    hdr_size = x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);
+
     /*
      * Further access to kernel structures by virtual addresses
      * should be made from system context.
@@ -370,13 +417,13 @@ void create_win_dump(DumpState *s, Error **errp)
 
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
 
@@ -385,7 +432,7 @@ void create_win_dump(DumpState *s, Error **errp)
      * to determine if the system-saved context is valid
      */
 
-    patch_and_save_context(h, saved_ctx, &local_err);
+    patch_and_save_context(h, x64, saved_ctx, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_free;
@@ -393,20 +440,20 @@ void create_win_dump(DumpState *s, Error **errp)
 
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
-- 
2.31.1


