Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919F48CFE3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 01:59:57 +0100 (CET)
Received: from localhost ([::1]:41344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7oT6-0006z2-IR
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 19:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oN7-00009F-Q9
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:45 -0500
Received: from [2a00:1450:4864:20::133] (port=36401
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n7oMw-0000YG-NI
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 19:53:37 -0500
Received: by mail-lf1-x133.google.com with SMTP id j11so14111628lfg.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 16:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LJdqGaYOx2UrTajnO9wXZ7cQQh/SPwEo+RieODvDxs=;
 b=e01KiqlSup7/JnROgDxoZp7f9idZ6VZNxrK/OK5bErtN8/Mo3e3wzlonFpUXydVC/u
 tx3gBEdEoLz3k0BUqOg0osEazUnFV4ApAT0zO74s/F7JkQTQ38WbbV4qVge2dx+YI6Wf
 fPdjH8VeulR8I1dA92l9u7basWGkS/HqcG0NkEDMCvqmE8wfbLGyf9GxT2vk2PLiohwn
 ZVfn5AcRZ4d3dRg4Uy8ZFz9TOeeDWXT84Rxiwbmiy8VJ9hfu2qUF2nUpwCCTDyFnhyfe
 gQmWtEOQWMVR/O2+4HgyYLx/CWVQphgtk+IYxFsu3NoeJquFwjS+66sxNhJJkF2sJh6t
 /Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LJdqGaYOx2UrTajnO9wXZ7cQQh/SPwEo+RieODvDxs=;
 b=jH+kU+zYnLWmvTKM7WN7YI+ivQgZfbQOhr07ipGe3KJFJiwes2LsCqtUef29yh+LIs
 NBbcS5DM2ggmtnVOm5OpYi+3XqKtJAkXjCnfxpisJIal+0XW4KF3sFJap+1OAHTJ1eX5
 RPHi689UXq4djpKPuXE8kCMHjVZrxpwoT+t0dwb5u5J3w5k1SPslofLcZJIp9tmVvOYP
 kC4E0k0gJKOiEXX/TcFFflYSV/3Ci43zEj4InlfsCWnvUkAQcPT5lIXqvoiE98teIBdD
 5AzEh0MgVhOypJvtE5EaHyNCsDAbC1Vlawp3MbT7hLrsJ7J16Zp+zw4ydi8Z02AzlULy
 QCNQ==
X-Gm-Message-State: AOAM530OpF9x4OcVCG8wxBvuGNJvV20aHEszWEczCB4krPBk6L1aYfcj
 EuPr2ykRXSbMu8DA2IYgt/55Tw==
X-Google-Smtp-Source: ABdhPJw7Jb+US/t9kgvNt2j6bMN5MSVqGEKDLO79siw67Kxftfo20VgMZs5FgLDdfnNSfh/oXnT/ZQ==
X-Received: by 2002:a05:6512:374f:: with SMTP id
 a15mr1540646lfs.571.1642035211137; 
 Wed, 12 Jan 2022 16:53:31 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id d2sm107688ljj.118.2022.01.12.16.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:53:30 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] include/qemu: add 32-bit Windows dump structures
Date: Thu, 13 Jan 2022 03:52:47 +0300
Message-Id: <20220113005248.172522-4-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x133.google.com
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

These structures are required to produce 32-bit guest Windows Complete
Memory Dump. Add 32-bit Windows dump header, CPU context and physical
memory descriptor structures along with corresponding definitions.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 include/qemu/win_dump_defs.h | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 5a5e5a5e09..73a44e2408 100644
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
@@ -81,25 +125,49 @@ typedef struct WinDumpHeader64 {
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
 
 #define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
 #define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
 
+#define WIN_CTX32_FULL (WIN_CTX_X86 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_SEG)
+#define WIN_CTX32_ALL (WIN_CTX32_FULL | WIN_CTX_FP | WIN_CTX_DBG | WIN_CTX_EXT)
+
 #define LIVE_SYSTEM_DUMP    0x00000161
 
 typedef struct WinM128A {
@@ -107,6 +175,40 @@ typedef struct WinM128A {
     int64_t high;
 } QEMU_ALIGNED(16) WinM128A;
 
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
 typedef struct WinContext64 {
     uint64_t PHome[6];
 
@@ -176,4 +278,9 @@ typedef struct WinContext64 {
     uint64_t LastExceptionFromRip;
 } QEMU_ALIGNED(16) WinContext64;
 
+typedef union WinContext {
+    WinContext32 x32;
+    WinContext64 x64;
+} WinContext;
+
 #endif /* QEMU_WIN_DUMP_DEFS_H */
-- 
2.31.1


