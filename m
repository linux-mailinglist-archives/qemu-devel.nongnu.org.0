Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A1463CD28
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CUy-00027G-GA; Tue, 29 Nov 2022 21:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZc-0007z9-AI
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:36 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZZ-0004tk-78
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:36 -0500
Received: by mail-lf1-x12c.google.com with SMTP id p8so24487704lfu.11
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVi/U26AhZf/rbBLtYfoyTLQ+an6palKbfw2UihlUPo=;
 b=J4SRGL0g94ieDKiNuaxfiz9V9cCKQvS1Rag/VUbpXq9TGlQCzYF0m2SCJf1wf9fOxK
 Rb25m9ZFQsltyBuZh7qQj99cAsGRzMKDY91zmdwogZn8pIwj7haJ6MCf0Gb5a4ul2lKt
 Vcf2Cmu6qmRj2UMiwN943xz1Di0QL2IXKuc/toiv6DyELPpWVdGAlqX878pWBQ6MRilk
 TxohHZG9Gajtf1hHlOSE2QZEc1MjyCZO5ORfP059YA0+XwbSsbNSgAKULa0ioyyTpGYK
 EN3NrXzMFTbMuyoJg7QPEoBTeKSfpfhCYNbaerBUt7ksiN3psfEOTqY/0AO55MXykKeT
 Kj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVi/U26AhZf/rbBLtYfoyTLQ+an6palKbfw2UihlUPo=;
 b=3cVhyEYTUqUKXSaWtYrbnHt8wM4N96y49cHS6d6ygHXaNJ/mi/IQwUazHX2YNlO9tj
 MyD53FdGFv5WOg5zn3mNLVPS684K1Hxewhs543ihVZgvzxaa9hv28NLf7DMfe4QfvKJL
 JN8lOYNnrC2cxBpilJ/IrkVwYG7+zLC7Cx/c/VxliWcnnvsZpC6bZWME7ZCWUUJ3N5Ah
 jPNf5gfAzoxn4808hEe+BJrLTiuD+jpBuVQQ0I2FR2hQBY5P6bFqLDRNobp1b47wudE7
 DdVtQHDYwDknolIs3APC8ATp2yeqfksI50FrHdBVzbjgyTzE1kFjJ6Sq4fLj1NNQRxb6
 +5xw==
X-Gm-Message-State: ANoB5pkc5T9GwZSs8IDq0MiB0rrYPVDEvwZwUJy52M3HunVqOXJSG+IO
 bYxgg+V5r9J0Z9VQoufQvDaG6A==
X-Google-Smtp-Source: AA0mqf7MSLsUmPtfakOHTto+bk3KZ8gE3f86J9i857f1ETnvp1aJok23A9+TiW9dIQ7mmCIhUQBlXg==
X-Received: by 2002:a05:6512:32ce:b0:4a2:676e:cf60 with SMTP id
 f14-20020a05651232ce00b004a2676ecf60mr12506707lfg.624.1669766610542; 
 Tue, 29 Nov 2022 16:03:30 -0800 (PST)
Received: from vp-pc.. (46-138-224-213.dynamic.spd-mgts.ru. [46.138.224.213])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a056512079100b004b4f4360407sm2399377lfr.105.2022.11.29.16.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:03:30 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v1 1/3] contrib/elf2dmp: fix code style
Date: Wed, 30 Nov 2022 03:03:18 +0300
Message-Id: <20221130000320.287976-2-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130000320.287976-1-viktor@daynix.com>
References: <20221130000320.287976-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12c;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Nov 2022 21:06:53 -0500
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


