Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B584369FD92
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwQD-0000UV-NE; Wed, 22 Feb 2023 16:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQB-0000Tr-JK
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:03 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQ8-0005Bp-1t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:03 -0500
Received: by mail-lf1-x132.google.com with SMTP id f41so11756491lfv.13
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVi/U26AhZf/rbBLtYfoyTLQ+an6palKbfw2UihlUPo=;
 b=OXU5mg4EQ2yeYRIge77rTV8eUPRqjtViqOio7U45Axr6BrRxD2AR2sKnSp/C/KUaIJ
 qVfMvTxWgujBzJyTUAkVnzT65mcNOMXliSqReos8Au9N6vyPglThLgTKPmquL/gZFc/g
 2gTBqz1IO5lrDQEKX8cVfOX4NBY5vL+h9ieJQ9KFs79GqsaZigKczE2zpk5T6GuQFX3L
 Msq8k3Ui/lMgm+1J3x5+dXaNMGBkUC4lRwt7/tqc/vSwSVAdkIsWIlo3lLP3ZyHO8zxO
 X2rM6bTl2ceFGblYlwVll0ejXxlXCQr5luNLcmgup872IeJEYMD9EOcqygEW8c3yMDEM
 C2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVi/U26AhZf/rbBLtYfoyTLQ+an6palKbfw2UihlUPo=;
 b=yzMYwJ4FX9ng3XmBHwxPbWXgETNX6VGrnL0ERp5MBUMBgNsmJmcEpLXu/X6QZT/bd6
 sQoWO4Iy9+OU8pEcsKTUj2Qf/k5BNi6Y8P37q8VuYGbtfuCyPc1ST2YIhKlqnnCHrLtL
 GHJQIvK0WLYaa5raLnksGt3mBH3be5gL8N4xEH07pGKmJDB6O2/YsguF9So4d/IXi3yC
 Bpi6JI/cVQZMCk/0jfknD4PIpr5ZJyRS8tXtpR2bWvCGumPhI3n+cPQa5M1PUFCGUBv0
 aNW8qqp2ka9FDhbk6UbuXA/bAOPbnXuWTzfcQWaWExQs3dr/zNmAgl/nxxlpUc5HayJu
 FOZw==
X-Gm-Message-State: AO0yUKVpR9ByqLf8xxwm9eizcF+487lZ4YUhngaonvnqc3/wv8WB5jKV
 ARHhmTVfq7cTWCX1JfuK5tHvuw==
X-Google-Smtp-Source: AK7set8w93icGHqmELxBSjeMEAT0WK7s0bNIyrN5jLIQXCASczzyMZiWH1cVWYKo49PIXxKfS+tAzg==
X-Received: by 2002:a19:ac0a:0:b0:4b5:a207:8d70 with SMTP id
 g10-20020a19ac0a000000b004b5a2078d70mr3451154lfc.5.1677100377776; 
 Wed, 22 Feb 2023 13:12:57 -0800 (PST)
Received: from vp-pc.. (46-138-232-132.dynamic.spd-mgts.ru. [46.138.232.132])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2558f000000b004db0d97b053sm330068lfg.137.2023.02.22.13.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:12:57 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: annie.li@oracle.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v2 1/3] contrib/elf2dmp: fix code style
Date: Thu, 23 Feb 2023 00:12:44 +0300
Message-Id: <20230222211246.883679-2-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230222211246.883679-1-viktor@daynix.com>
References: <20230222211246.883679-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Originally elf2dmp were added with some code style issues,
especially in pe.h header, and some were introduced by
2d0fc797faaa73fbc1d30f5f9e90407bf3dd93f0. Fix them now.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 contrib/elf2dmp/addrspace.c |   1 +
 contrib/elf2dmp/main.c      |   9 ++--
 contrib/elf2dmp/pe.h        | 100 ++++++++++++++++++------------------
 3 files changed, 57 insertions(+), 53 deletions(-)

diff --git a/contrib/elf2dmp/addrspace.c b/contrib/elf2dmp/addrspace.c
index 53ded17061..0b04cba00e 100644
--- a/contrib/elf2dmp/addrspace.c
+++ b/contrib/elf2dmp/addrspace.c
@@ -11,6 +11,7 @@
 static struct pa_block *pa_space_find_block(struct pa_space *ps, uint64_t pa)
 {
     size_t i;
+
     for (i = 0; i < ps->block_nr; i++) {
         if (ps->block[i].paddr <= pa &&
                 pa <= ps->block[i].paddr + ps->block[i].size) {
diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index d77b8f98f7..9224764239 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -282,14 +282,16 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
     };
 
     for (i = 0; i < ps->block_nr; i++) {
-        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / ELF2DMP_PAGE_SIZE;
+        h.PhysicalMemoryBlock.NumberOfPages +=
+                ps->block[i].size / ELF2DMP_PAGE_SIZE;
         h.PhysicalMemoryBlock.Run[i] = (WinDumpPhyMemRun64) {
             .BasePage = ps->block[i].paddr / ELF2DMP_PAGE_SIZE,
             .PageCount = ps->block[i].size / ELF2DMP_PAGE_SIZE,
         };
     }
 
-    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
+    h.RequiredDumpSpace +=
+            h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
 
     *hdr = h;
 
@@ -299,7 +301,8 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
 static int fill_context(KDDEBUGGER_DATA64 *kdbg,
         struct va_space *vs, QEMU_Elf *qe)
 {
-        int i;
+    int i;
+
     for (i = 0; i < qe->state_nr; i++) {
         uint64_t Prcb;
         uint64_t Context;
diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
index c2a4a6ba7c..807d006364 100644
--- a/contrib/elf2dmp/pe.h
+++ b/contrib/elf2dmp/pe.h
@@ -33,70 +33,70 @@ typedef struct IMAGE_DOS_HEADER {
 } __attribute__ ((packed)) IMAGE_DOS_HEADER;
 
 typedef struct IMAGE_FILE_HEADER {
-  uint16_t  Machine;
-  uint16_t  NumberOfSections;
-  uint32_t  TimeDateStamp;
-  uint32_t  PointerToSymbolTable;
-  uint32_t  NumberOfSymbols;
-  uint16_t  SizeOfOptionalHeader;
-  uint16_t  Characteristics;
+    uint16_t  Machine;
+    uint16_t  NumberOfSections;
+    uint32_t  TimeDateStamp;
+    uint32_t  PointerToSymbolTable;
+    uint32_t  NumberOfSymbols;
+    uint16_t  SizeOfOptionalHeader;
+    uint16_t  Characteristics;
 } __attribute__ ((packed)) IMAGE_FILE_HEADER;
 
 typedef struct IMAGE_DATA_DIRECTORY {
-  uint32_t VirtualAddress;
-  uint32_t Size;
+    uint32_t VirtualAddress;
+    uint32_t Size;
 } __attribute__ ((packed)) IMAGE_DATA_DIRECTORY;
 
 #define IMAGE_NUMBEROF_DIRECTORY_ENTRIES 16
 
 typedef struct IMAGE_OPTIONAL_HEADER64 {
-  uint16_t  Magic; /* 0x20b */
-  uint8_t   MajorLinkerVersion;
-  uint8_t   MinorLinkerVersion;
-  uint32_t  SizeOfCode;
-  uint32_t  SizeOfInitializedData;
-  uint32_t  SizeOfUninitializedData;
-  uint32_t  AddressOfEntryPoint;
-  uint32_t  BaseOfCode;
-  uint64_t  ImageBase;
-  uint32_t  SectionAlignment;
-  uint32_t  FileAlignment;
-  uint16_t  MajorOperatingSystemVersion;
-  uint16_t  MinorOperatingSystemVersion;
-  uint16_t  MajorImageVersion;
-  uint16_t  MinorImageVersion;
-  uint16_t  MajorSubsystemVersion;
-  uint16_t  MinorSubsystemVersion;
-  uint32_t  Win32VersionValue;
-  uint32_t  SizeOfImage;
-  uint32_t  SizeOfHeaders;
-  uint32_t  CheckSum;
-  uint16_t  Subsystem;
-  uint16_t  DllCharacteristics;
-  uint64_t  SizeOfStackReserve;
-  uint64_t  SizeOfStackCommit;
-  uint64_t  SizeOfHeapReserve;
-  uint64_t  SizeOfHeapCommit;
-  uint32_t  LoaderFlags;
-  uint32_t  NumberOfRvaAndSizes;
-  IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
+    uint16_t  Magic; /* 0x20b */
+    uint8_t   MajorLinkerVersion;
+    uint8_t   MinorLinkerVersion;
+    uint32_t  SizeOfCode;
+    uint32_t  SizeOfInitializedData;
+    uint32_t  SizeOfUninitializedData;
+    uint32_t  AddressOfEntryPoint;
+    uint32_t  BaseOfCode;
+    uint64_t  ImageBase;
+    uint32_t  SectionAlignment;
+    uint32_t  FileAlignment;
+    uint16_t  MajorOperatingSystemVersion;
+    uint16_t  MinorOperatingSystemVersion;
+    uint16_t  MajorImageVersion;
+    uint16_t  MinorImageVersion;
+    uint16_t  MajorSubsystemVersion;
+    uint16_t  MinorSubsystemVersion;
+    uint32_t  Win32VersionValue;
+    uint32_t  SizeOfImage;
+    uint32_t  SizeOfHeaders;
+    uint32_t  CheckSum;
+    uint16_t  Subsystem;
+    uint16_t  DllCharacteristics;
+    uint64_t  SizeOfStackReserve;
+    uint64_t  SizeOfStackCommit;
+    uint64_t  SizeOfHeapReserve;
+    uint64_t  SizeOfHeapCommit;
+    uint32_t  LoaderFlags;
+    uint32_t  NumberOfRvaAndSizes;
+    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
 } __attribute__ ((packed)) IMAGE_OPTIONAL_HEADER64;
 
 typedef struct IMAGE_NT_HEADERS64 {
-  uint32_t Signature;
-  IMAGE_FILE_HEADER FileHeader;
-  IMAGE_OPTIONAL_HEADER64 OptionalHeader;
+    uint32_t Signature;
+    IMAGE_FILE_HEADER FileHeader;
+    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
 } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
 
 typedef struct IMAGE_DEBUG_DIRECTORY {
-  uint32_t Characteristics;
-  uint32_t TimeDateStamp;
-  uint16_t MajorVersion;
-  uint16_t MinorVersion;
-  uint32_t Type;
-  uint32_t SizeOfData;
-  uint32_t AddressOfRawData;
-  uint32_t PointerToRawData;
+    uint32_t Characteristics;
+    uint32_t TimeDateStamp;
+    uint16_t MajorVersion;
+    uint16_t MinorVersion;
+    uint32_t Type;
+    uint32_t SizeOfData;
+    uint32_t AddressOfRawData;
+    uint32_t PointerToRawData;
 } __attribute__ ((packed)) IMAGE_DEBUG_DIRECTORY;
 
 #define IMAGE_DEBUG_TYPE_CODEVIEW   2
-- 
2.35.1


