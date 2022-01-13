Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCB48CFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 01:57:55 +0100 (CET)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7oR8-0002pT-EZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 19:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMx-0008Vu-H8
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:35 -0500
Received: from [2a00:1450:4864:20::143] (port=44589
 helo=mail-lf1-x143.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMt-0000X0-NO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:35 -0500
Received: by mail-lf1-x143.google.com with SMTP id o15so13979121lfo.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQaRJsaTTS3PbM0RSVFFC7TxkmLvya3coDXUZRZqHSQ=;
 b=vnLcv9LlOUAmvlbbMiVziWFSw4Zl0WkwoMziX2lZrF+sp8Q2gKd7WeVN8jQUDwKUqh
 qGT0LojJFlSnMRUIAdaatbsbp8PwhZ7Yaoz3afKt47OEtSw/PQdQP8W/W7cNjANzO+a0
 D/8Uu49n2BP+YkIpXZX7eqtu02UWOarDzJn/MjiV/5oKM9SZIuUsn00RyKAgi7tfPzNV
 u5KEjvmJXShL6z4XP/U9FoIBt2hE83HgJyLyKXxs5sCKiqDTBgwPHE+k425oqozsvZUf
 hlFh5C+X3lRI451xPelzMp57aFgXRl6vm75o7l6deZIP/xSAxG7Y4qYqmpFZn9L/N99I
 KkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQaRJsaTTS3PbM0RSVFFC7TxkmLvya3coDXUZRZqHSQ=;
 b=q3LgGi+L/RA4mSfKGeTXoF+INGMBCaxnaY8ShVr3ue0K6QiVGWEkfUJTFH708hIlkj
 9IloGD5QgTt5FxTtqkoegIa3us1viO7fcQEuVJMffsfnL7D5RSKU7/uTho4NQbXkaMoH
 9uBHCIpwBPg3bv2zHb2GhVZPWwWyfbMlAuQoe/ux9UgFSFijqM0ANbztafbeNmfAk1Hn
 Vi2A8mWFQ6Qiff1UIn/lgQUSS3/tpDJOuQVqYj41er5Yxg8kihGjvVofMsddFfYMQ5kM
 iC453JVjeHLUAZ3cvnzT2GmavZCtBQ4GgjDzPmYoj9lU1QT4jzIteyFwDVDuFgXx2ryf
 IleA==
X-Gm-Message-State: AOAM531LT83BE8C5P9Mg33TWgfdNG93HOKhz4Ty+js0etgxmuihcr51j
 7kV5SYeT7gcNwvaGmyo6H3Rd6w==
X-Google-Smtp-Source: ABdhPJyPwaKsFm3osm6p08XDbXtlu/6NC+AeNge3Sl3vHEoG9EBQWtWOckCK0dk5xQpcHDQ3ic0glA==
X-Received: by 2002:ac2:41c3:: with SMTP id d3mr1626258lfi.397.1642035209965; 
 Wed, 12 Jan 2022 16:53:29 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id d2sm107688ljj.118.2022.01.12.16.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:53:29 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] dump/win_dump: add helper macros for Windows dump
 header access
Date: Thu, 13 Jan 2022 03:52:46 +0300
Message-Id: <20220113005248.172522-3-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::143
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x143.google.com
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

Perform read access to Windows dump header fields via helper macros.
This is preparation for the next 32-bit guest Windows dump support.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 dump/win_dump.c | 100 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 35 deletions(-)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index 29b6e4f670..df3b432ca5 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -24,11 +24,25 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "win_dump.h"
 
-static size_t write_run(WinDumpPhyMemRun64 *run, int fd, Error **errp)
+#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
+
+#define _WIN_DUMP_FIELD(f) (h->f)
+#define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
+
+#define _WIN_DUMP_FIELD_PTR(f) ((void *)&h->f)
+#define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
+
+#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
+#define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
+
+#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)
+
+static size_t write_run(uint64_t base_page, uint64_t page_count,
+        int fd, Error **errp)
 {
     void *buf;
-    uint64_t addr = run->BasePage << TARGET_PAGE_BITS;
-    uint64_t size = run->PageCount << TARGET_PAGE_BITS;
+    uint64_t addr = base_page << TARGET_PAGE_BITS;
+    uint64_t size = page_count << TARGET_PAGE_BITS;
     uint64_t len, l;
     size_t total = 0;
 
@@ -59,13 +73,14 @@ static size_t write_run(WinDumpPhyMemRun64 *run, int fd, Error **errp)
 
 static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
 {
-    WinDumpPhyMemDesc64 *desc = &h->PhysicalMemoryBlock;
-    WinDumpPhyMemRun64 *run = desc->Run;
+    uint64_t BasePage, PageCount;
     Error *local_err = NULL;
     int i;
 
-    for (i = 0; i < desc->NumberOfRuns; i++) {
-        s->written_size += write_run(run + i, s->fd, &local_err);
+    for (i = 0; i < WIN_DUMP_FIELD(PhysicalMemoryBlock.NumberOfRuns); i++) {
+        BasePage = WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].BasePage);
+        PageCount = WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].PageCount);
+        s->written_size += write_run(BasePage, PageCount, s->fd, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -73,11 +88,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
     }
 }
 
+static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)
+{
+    int ret;
+    uint64_t ptr64;
+
+    ret = cpu_memory_rw_debug(cpu, addr, &ptr64, WIN_DUMP_PTR_SIZE, 0);
+
+    *ptr = ptr64;
+
+    return ret;
+}
+
 static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
 {
     if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_MM_PFN_DATABASE_OFFSET64,
-            (uint8_t *)&h->PfnDatabase, sizeof(h->PfnDatabase), 0)) {
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_OFFSET64,
+            WIN_DUMP_FIELD_PTR(PfnDatabase),
+            WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
         error_setg(errp, "win-dump: failed to read MmPfnDatabase");
         return;
     }
@@ -87,16 +115,17 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
 {
     uint64_t KiBugcheckData;
 
-    if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_KI_BUGCHECK_DATA_OFFSET64,
-            (uint8_t *)&KiBugcheckData, sizeof(KiBugcheckData), 0)) {
+    if (cpu_read_ptr(first_cpu,
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
+                KDBG_KI_BUGCHECK_DATA_OFFSET64,
+            &KiBugcheckData)) {
         error_setg(errp, "win-dump: failed to read KiBugcheckData");
         return;
     }
 
-    if (cpu_memory_rw_debug(first_cpu,
-            KiBugcheckData,
-            h->BugcheckData, sizeof(h->BugcheckData), 0)) {
+    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
+            WIN_DUMP_FIELD(BugcheckData),
+            WIN_DUMP_FIELD_SIZE(BugcheckData), 0)) {
         error_setg(errp, "win-dump: failed to read bugcheck data");
         return;
     }
@@ -105,8 +134,8 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
      * If BugcheckCode wasn't saved, we consider guest OS as alive.
      */
 
-    if (!h->BugcheckCode) {
-        h->BugcheckCode = LIVE_SYSTEM_DUMP;
+    if (!WIN_DUMP_FIELD(BugcheckCode)) {
+        *(uint32_t *)WIN_DUMP_FIELD_PTR(BugcheckCode) = LIVE_SYSTEM_DUMP;
     }
 }
 
@@ -155,7 +184,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **errp)
 {
     const char OwnerTag[] = "KDBG";
     char read_OwnerTag[4];
-    uint64_t KdDebuggerDataBlock = h->KdDebuggerDataBlock;
+    uint64_t KdDebuggerDataBlock = WIN_DUMP_FIELD(KdDebuggerDataBlock);
     bool try_fallback = true;
 
 try_again:
@@ -174,7 +203,7 @@ try_again:
              * we try to use KDBG obtained by guest driver.
              */
 
-            KdDebuggerDataBlock = h->BugcheckParameter1;
+            KdDebuggerDataBlock = WIN_DUMP_FIELD(BugcheckParameter1);
             try_fallback = false;
             goto try_again;
         } else {
@@ -197,20 +226,21 @@ static void patch_and_save_context(WinDumpHeader64 *h,
                                    struct saved_context *saved_ctx,
                                    Error **errp)
 {
+    uint64_t KdDebuggerDataBlock = WIN_DUMP_FIELD(KdDebuggerDataBlock);
     uint64_t KiProcessorBlock;
     uint16_t OffsetPrcbContext;
     CPUState *cpu;
     int i = 0;
 
-    if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
-            (uint8_t *)&KiProcessorBlock, sizeof(KiProcessorBlock), 0)) {
+    if (cpu_read_ptr(first_cpu,
+            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
+            &KiProcessorBlock)) {
         error_setg(errp, "win-dump: failed to read KiProcessorBlock");
         return;
     }
 
     if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
             (uint8_t *)&OffsetPrcbContext, sizeof(OffsetPrcbContext), 0)) {
         error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
         return;
@@ -223,17 +253,17 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         uint64_t Context;
         WinContext64 ctx;
 
-        if (cpu_memory_rw_debug(first_cpu,
-                KiProcessorBlock + i * sizeof(uint64_t),
-                (uint8_t *)&Prcb, sizeof(Prcb), 0)) {
+        if (cpu_read_ptr(first_cpu,
+                KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
+                &Prcb)) {
             error_setg(errp, "win-dump: failed to read"
                              " CPU #%d PRCB location", i);
             return;
         }
 
-        if (cpu_memory_rw_debug(first_cpu,
+        if (cpu_read_ptr(first_cpu,
                 Prcb + OffsetPrcbContext,
-                (uint8_t *)&Context, sizeof(Context), 0)) {
+                &Context)) {
             error_setg(errp, "win-dump: failed to read"
                              " CPU #%d ContextFrame location", i);
             return;
@@ -284,13 +314,13 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         };
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 0)) {
+                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
             error_setg(errp, "win-dump: failed to save CPU #%d context", i);
             return;
         }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&ctx, sizeof(WinContext64), 1)) {
+                &ctx, WIN_DUMP_CTX_SIZE, 1)) {
             error_setg(errp, "win-dump: failed to write CPU #%d context", i);
             return;
         }
@@ -304,9 +334,9 @@ static void restore_context(WinDumpHeader64 *h,
 {
     int i;
 
-    for (i = 0; i < h->NumberProcessors; i++) {
+    for (i = 0; i < WIN_DUMP_FIELD(NumberProcessors); i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) {
+                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
@@ -338,7 +368,7 @@ void create_win_dump(DumpState *s, Error **errp)
      * should be made from system context.
      */
 
-    first_x86_cpu->env.cr[3] = h->DirectoryTableBase;
+    first_x86_cpu->env.cr[3] = WIN_DUMP_FIELD(DirectoryTableBase);
 
     check_kdbg(h, &local_err);
     if (local_err) {
@@ -348,7 +378,7 @@ void create_win_dump(DumpState *s, Error **errp)
 
     patch_header(h);
 
-    saved_ctx = g_new(struct saved_context, h->NumberProcessors);
+    saved_ctx = g_new(struct saved_context, WIN_DUMP_FIELD(NumberProcessors));
 
     /*
      * Always patch context because there is no way
@@ -361,7 +391,7 @@ void create_win_dump(DumpState *s, Error **errp)
         goto out_free;
     }
 
-    s->total_size = h->RequiredDumpSpace;
+    s->total_size = WIN_DUMP_FIELD(RequiredDumpSpace);
 
     s->written_size = qemu_write_full(s->fd, h, sizeof(*h));
     if (s->written_size != sizeof(*h)) {
-- 
2.31.1


