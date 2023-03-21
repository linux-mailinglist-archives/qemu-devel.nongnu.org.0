Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174D56C32C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebux-00006g-Oi; Tue, 21 Mar 2023 09:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuv-00005N-Hs
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebut-0006dM-KM
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o32so3155630wms.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IZWERytkNXmomft2NnojCvM5GGqoNQvPAxE/TFJNbOI=;
 b=gSt0QxYU1p5KtZ6vCHhAz1OIcB2NuRSIZF1SMOd+HYPltzm3uLj3StFMYmV6XHA6eg
 IhcHUuOGhD7Ls7BU9OIvHfejs6SKwaVOzagZvX+b+fkvdXig5Nk31NCWGY5sRVm+jLvs
 UtIu7Ml62hV3e9J16Iq/CTiEP8SWLzsxjOcl4MhaKLg36QEf0hM8olAe96Vn05INAQRx
 MWraBSc3RZE07SZt94adiSzPC19mK2WwzD6+V5bRi8Yp60RoKGIV9fqDA8Q8QanBurnq
 muLhzBiP82YqarYpOMjESLSXRRYDio+ROoEA+A/KIHVzYEZCgErGfzwr45zlzhPC1Jxb
 mwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZWERytkNXmomft2NnojCvM5GGqoNQvPAxE/TFJNbOI=;
 b=YNqKyL5L3SsC0mNQQsN27ELyDPwgjvl9k8RL4r9LMy2lGnb9dPeLVEluVQR+55sDI7
 RkhZh6QCrNe5zRt3jvrCnlVPhsEydfhFO4f704Ae5VC5qPTt058b5U2wPkBwlZOwJXBA
 6+ic+mSqOsGJRAYC3kxjSNvtRZLjZGDybj26Kh5UP0mKtQja1edGKySdLSpO2wMR/g18
 RSLu0CaCol2WJ7ovUARtNNawHDWms4DqXOer8vIdBjuUiKohWMInoAHWnqeT+TzMCtKh
 CNAFRd6MdVMHxUnhvIEVx08FVgodCdHNHlLQYmKPRL4A7JtcsHI7QCm5u1oq/vuAt+jj
 4Zfg==
X-Gm-Message-State: AO0yUKUi1dmmYQk4HMHpCvuTRg1+bTh6dWEnfKanmHFN1DzG+aueN5Jd
 MwXPHF/84G/n8bA7QKJ8LIu6G6uV0kfeeSj7LWU=
X-Google-Smtp-Source: AK7set8G+R5O8RUnRImPo9ChAPdL9Z1kbfBgEwrGJwsD+pDVeQc1x49LURcDEymclV3RCl/Q1pBsEw==
X-Received: by 2002:a05:600c:2101:b0:3ed:276d:81a4 with SMTP id
 u1-20020a05600c210100b003ed276d81a4mr2561860wml.32.1679404841905; 
 Tue, 21 Mar 2023 06:20:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] contrib/elf2dmp: fix code style
Date: Tue, 21 Mar 2023 13:20:31 +0000
Message-Id: <20230321132036.1836617-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Viktor Prutyanov <viktor@daynix.com>

Originally elf2dmp were added with some code style issues,
especially in pe.h header, and some were introduced by
2d0fc797faaa73fbc1d30f5f9e90407bf3dd93f0. Fix them now.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
Reviewed-by: Annie Li <annie.li@oracle.com>
Message-id: 20230222211246.883679-2-viktor@daynix.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/pe.h        | 100 ++++++++++++++++++------------------
 contrib/elf2dmp/addrspace.c |   1 +
 contrib/elf2dmp/main.c      |   9 ++--
 3 files changed, 57 insertions(+), 53 deletions(-)

diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
index c2a4a6ba7c2..807d0063649 100644
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
diff --git a/contrib/elf2dmp/addrspace.c b/contrib/elf2dmp/addrspace.c
index 53ded170618..0b04cba00e5 100644
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
index d77b8f98f78..92247642395 100644
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
-- 
2.34.1


