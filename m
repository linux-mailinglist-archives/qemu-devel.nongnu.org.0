Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D907B4815F1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:55:27 +0100 (CET)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2dAd-0002i5-0b
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:55:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8R-0001Kk-5W
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:12 -0500
Received: from [2a00:1450:4864:20::22c] (port=46777
 helo=mail-lj1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8N-0005j0-S8
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:10 -0500
Received: by mail-lj1-x22c.google.com with SMTP id i11so24475723ljm.13
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jewd/9bwSjb6ji3VZqnU/eVfnI/pG6SYrSpnvJOqWyY=;
 b=XpSS/Htq9w15JAzdwPztXihzbJrNuaD0TCB+VS1SvQJsiYfpeb1wQmieeAw7YXE2WV
 qUhDoJMcAU/LvLkM1zD+Lc7uuKkE/y5miiUjYgsz4Jv/3Th3QD+VXovmJ6SsfyWA/oxC
 WwrTe9LSidjcJHowvchzVeTz9j4AHv6XVPzTxrGBgamgagGJo10+7Ngn9nMV4EceVLvP
 KVhmcMMBzzpzKbSV/A2ZlMj8FRdNFVMGZNe6Y0P9uBjuSP7zc3ypa3HfpERfRDmhU4XP
 l9eTCFR3j4Z0zJ6mwDPqdFckQBuFnBKpyAu+i0Wg+ZYYzh+OoHtTpWurGOA7mIJl2MpM
 aydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jewd/9bwSjb6ji3VZqnU/eVfnI/pG6SYrSpnvJOqWyY=;
 b=cq77zDu0JrC5dPw+VSdU5Xc7QpKPfAcvN9a7u0rFBgFJ6rrhSCzSZNKuUB4cgE3Yff
 pQ5f8sy0wIxK//RYJTdd2Dx89L6HyjrzIYkJ2A8mo90kNyqdJ0iUiJa2XyHR7OOYOx2s
 G/zKNydp2/tyndqkrK857g+yH2EwyjgwQDfNl85nwD6RxSTKI8YhYkas8/UtOE7LFYFB
 BPMI11prjbShfY+8at3qcILYai0t62otDoqWjme+Q24fouFcEPXAXfXCdVgIyT13VeDN
 an4BhytbMlAzR5pWYD4zXVv7i9glFz4DCFNuRBaCx60E8t56F05KE5ql7OgYOIq9cDBJ
 aS7Q==
X-Gm-Message-State: AOAM5314jq/f1d6z4VmHNp0q6/P5VvC5usH3zrptZnGGARXLMAilwIRX
 D409uOu9+OAL4WnTDjWDhFR6rw==
X-Google-Smtp-Source: ABdhPJxs51dqBeibS1m7wku6jcjAn7UodTwKteQPsGFwvt91p0NhTg5qXtwp+zHvmyd4NL0bbFu/fg==
X-Received: by 2002:a05:651c:612:: with SMTP id
 k18mr23207774lje.383.1640800385772; 
 Wed, 29 Dec 2021 09:53:05 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id s19sm2265123lfi.263.2021.12.29.09.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:53:05 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Subject: [PATCH 1/2] include/qemu: add 32-bit Windows dump structures
Date: Wed, 29 Dec 2021 20:52:54 +0300
Message-Id: <20211229175255.133073-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
References: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These structures are required to produce 32-bit guest Windows Complete
Memory Dump. Add 32-bit Windows dump header, CPU context and physical
memory descriptor structures along with corresponding definitions.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/main.c       |   6 +-
 include/qemu/win_dump_defs.h | 115 +++++++++++++++++++++++++++++++++--
 2 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 20b477d582..b9fc6d230c 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -141,10 +141,10 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
     return kdbg;
 }
 
-static void win_context_init_from_qemu_cpu_state(WinContext *ctx,
+static void win_context_init_from_qemu_cpu_state(WinContext64 *ctx,
         QEMUCPUState *s)
 {
-    WinContext win_ctx = (WinContext){
+    WinContext64 win_ctx = (WinContext64){
         .ContextFlags = WIN_CTX_X64 | WIN_CTX_INT | WIN_CTX_SEG | WIN_CTX_CTL,
         .MxCsr = INITIAL_MXCSR,
 
@@ -302,7 +302,7 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
     for (i = 0; i < qe->state_nr; i++) {
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
         QEMUCPUState *s = qe->state[i];
 
         if (va_space_rw(vs, kdbg->KiProcessorBlock + sizeof(Prcb) * i,
diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 145096e8ee..af85f5c3cf 100644
--- a/include/qemu/win_dump_defs.h
+++ b/include/qemu/win_dump_defs.h
@@ -11,11 +11,22 @@
 #ifndef QEMU_WIN_DUMP_DEFS_H
 #define QEMU_WIN_DUMP_DEFS_H
 
+typedef struct WinDumpPhyMemRun32 {
+    uint32_t BasePage;
+    uint32_t PageCount;
+} QEMU_PACKED WinDumpPhyMemRun32;
+
 typedef struct WinDumpPhyMemRun64 {
     uint64_t BasePage;
     uint64_t PageCount;
 } QEMU_PACKED WinDumpPhyMemRun64;
 
+typedef struct WinDumpPhyMemDesc32 {
+    uint32_t NumberOfRuns;
+    uint32_t NumberOfPages;
+    WinDumpPhyMemRun32 Run[86];
+} QEMU_PACKED WinDumpPhyMemDesc32;
+
 typedef struct WinDumpPhyMemDesc64 {
     uint32_t NumberOfRuns;
     uint32_t unused;
@@ -33,6 +44,39 @@ typedef struct WinDumpExceptionRecord {
     uint64_t ExceptionInformation[15];
 } QEMU_PACKED WinDumpExceptionRecord;
 
+typedef struct WinDumpHeader32 {
+    char Signature[4];
+    char ValidDump[4];
+    uint32_t MajorVersion;
+    uint32_t MinorVersion;
+    uint32_t DirectoryTableBase;
+    uint32_t PfnDatabase;
+    uint32_t PsLoadedModuleList;
+    uint32_t PsActiveProcessHead;
+    uint32_t MachineImageType;
+    uint32_t NumberProcessors;
+    union {
+        struct {
+            uint32_t BugcheckCode;
+            uint32_t BugcheckParameter1;
+            uint32_t BugcheckParameter2;
+            uint32_t BugcheckParameter3;
+            uint32_t BugcheckParameter4;
+        };
+        uint8_t BugcheckData[20];
+    };
+    uint8_t VersionUser[32];
+    uint32_t reserved0;
+    uint32_t KdDebuggerDataBlock;
+    union {
+        WinDumpPhyMemDesc32 PhysicalMemoryBlock;
+        uint8_t PhysicalMemoryBlockBuffer[700];
+    };
+    uint8_t reserved1[3200];
+    uint32_t RequiredDumpSpace;
+    uint8_t reserved2[92];
+} QEMU_PACKED WinDumpHeader32;
+
 typedef struct WinDumpHeader64 {
     char Signature[4];
     char ValidDump[4];
@@ -81,24 +125,48 @@ typedef struct WinDumpHeader64 {
     uint8_t reserved[4018];
 } QEMU_PACKED WinDumpHeader64;
 
+typedef union WinDumpHeader {
+    struct {
+        char Signature[4];
+        char ValidDump[4];
+    };
+    WinDumpHeader32 x32;
+    WinDumpHeader64 x64;
+} WinDumpHeader;
+
 #define KDBG_OWNER_TAG_OFFSET64             0x10
 #define KDBG_MM_PFN_DATABASE_OFFSET64       0xC0
 #define KDBG_KI_BUGCHECK_DATA_OFFSET64      0x88
 #define KDBG_KI_PROCESSOR_BLOCK_OFFSET64    0x218
 #define KDBG_OFFSET_PRCB_CONTEXT_OFFSET64   0x338
 
+#define KDBG_OWNER_TAG_OFFSET           KDBG_OWNER_TAG_OFFSET64
+#define KDBG_MM_PFN_DATABASE_OFFSET     KDBG_MM_PFN_DATABASE_OFFSET64
+#define KDBG_KI_BUGCHECK_DATA_OFFSET    KDBG_KI_BUGCHECK_DATA_OFFSET64
+#define KDBG_KI_PROCESSOR_BLOCK_OFFSET  KDBG_KI_PROCESSOR_BLOCK_OFFSET64
+#define KDBG_OFFSET_PRCB_CONTEXT_OFFSET KDBG_OFFSET_PRCB_CONTEXT_OFFSET64
+
 #define VMCOREINFO_ELF_NOTE_HDR_SIZE    24
+#define VMCOREINFO_WIN_DUMP_NOTE_SIZE64 (sizeof(WinDumpHeader64) + \
+                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
+#define VMCOREINFO_WIN_DUMP_NOTE_SIZE32 (sizeof(WinDumpHeader32) + \
+                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
 
 #define WIN_CTX_X64 0x00100000L
+#define WIN_CTX_X86 0x00010000L
 
 #define WIN_CTX_CTL 0x00000001L
 #define WIN_CTX_INT 0x00000002L
 #define WIN_CTX_SEG 0x00000004L
 #define WIN_CTX_FP  0x00000008L
 #define WIN_CTX_DBG 0x00000010L
+#define WIN_CTX_EXT 0x00000020L
+
+#define WIN_CTX64_FULL (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
+#define WIN_CTX64_ALL (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
 
-#define WIN_CTX_FULL    (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
-#define WIN_CTX_ALL     (WIN_CTX_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
+#define WIN_CTX32_FULL (WIN_CTX_X86 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_SEG)
+#define WIN_CTX32_ALL (WIN_CTX32_FULL | WIN_CTX_FP | WIN_CTX_DBG | WIN_CTX_EXT)
 
 #define LIVE_SYSTEM_DUMP    0x00000161
 
@@ -107,7 +175,41 @@ typedef struct WinM128A {
     int64_t high;
 } QEMU_ALIGNED(16) WinM128A;
 
-typedef struct WinContext {
+typedef struct WinContext32 {
+    uint32_t ContextFlags;
+
+    uint32_t Dr0;
+    uint32_t Dr1;
+    uint32_t Dr2;
+    uint32_t Dr3;
+    uint32_t Dr6;
+    uint32_t Dr7;
+
+    uint8_t  FloatSave[112];
+
+    uint32_t SegGs;
+    uint32_t SegFs;
+    uint32_t SegEs;
+    uint32_t SegDs;
+
+    uint32_t Edi;
+    uint32_t Esi;
+    uint32_t Ebx;
+    uint32_t Edx;
+    uint32_t Ecx;
+    uint32_t Eax;
+
+    uint32_t Ebp;
+    uint32_t Eip;
+    uint32_t SegCs;
+    uint32_t EFlags;
+    uint32_t Esp;
+    uint32_t SegSs;
+
+    uint8_t ExtendedRegisters[512];
+} QEMU_ALIGNED(16) WinContext32;
+
+typedef struct WinContext64 {
     uint64_t PHome[6];
 
     uint32_t ContextFlags;
@@ -174,6 +276,11 @@ typedef struct WinContext {
     uint64_t LastBranchFromRip;
     uint64_t LastExceptionToRip;
     uint64_t LastExceptionFromRip;
-} QEMU_ALIGNED(16) WinContext;
+} QEMU_ALIGNED(16) WinContext64;
+
+typedef union WinContext {
+    WinContext32 x32;
+    WinContext64 x64;
+} WinContext;
 
 #endif /* QEMU_WIN_DUMP_DEFS_H */
-- 
2.31.1


