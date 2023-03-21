Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DC6C32B6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuz-00009s-IE; Tue, 21 Mar 2023 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebux-00007G-5z
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuv-0006eb-5N
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso3991193wms.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7k/7Hxrdjupf5zq7nWkwxPkwQ/tKKC42EfTMP4iP9ag=;
 b=HXSXgSbR5QnhNgKNwSjZJ/RosXNaCcdJyrJGC6VSdBxHJ4mrZ5wUXpS6O1FWtJSw+Y
 tKFqqWxLVQKzuQLhOw+3dtIGUYULR/HopwXJUApm8iHZ1HS+qLf9zMfUSl34g0rF53aC
 RUbvIueFafxWDs6OB79ZSziVYLln4NMqws3mVDA7wFm4oaWWvC/Ou7RoLICtjcdzn/vr
 APDd+zD5qZFbBtFA1M4+TJOn84lCHZnV52QjyPZaA0vOlflEuXUVd7oy2ZHkXMKA/I4M
 R/HGotAmdE/TBt+5O4BV3poYeoLtBperCPtt5Uj4PNcjDshQjyhgsYFYQs93lOh/C6Fw
 wTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7k/7Hxrdjupf5zq7nWkwxPkwQ/tKKC42EfTMP4iP9ag=;
 b=q2gzyjr2nDEB340tabOfXs1Lj/1+I57P+JpUdWkTTWTYeA31Hzi9+WzzfpXIaQCrld
 3GwO6htxuv9P44AdbMIuXOWOnZOwSv83P7HYyd59IzeyevaT4HM5rjftEzSFb+4mZUHF
 DjMDbZe9thnpOrvADQHz5ZyZstu475ejqKyFtu9pNGAQYih/H1CFjqAEde5y2oHeXA16
 VdMfBDp/LFiuxTWQmZUcPu9z2ymeyPG/DytmZv6bJ8XVErQSyipBZYsL02Bpt+h7OgDM
 DNPEY3SRWdqeaYB/aQc0M+YQR/p5kvPXGwT7vTS1LJbLhbHqD27DgYzeVXIUAGbEoNnU
 9BHg==
X-Gm-Message-State: AO0yUKUkdYyvaP2Fxkq2gsiAeUEKJyh4DuPidpKKHgqCg+iUE3h0aK8T
 ZJC8NBlmgbDRzj5Pcu00LrYxJXZGudgqXqSqrtM=
X-Google-Smtp-Source: AK7set99Vx/k23HotnWLLDVggx7tyMmQcWRvVj55g1NBdvO4qtjkITNf6Ih7AY9Z+ZEO0G3gteIzqg==
X-Received: by 2002:a05:600c:2199:b0:3ed:1fa1:9030 with SMTP id
 e25-20020a05600c219900b003ed1fa19030mr2170478wme.29.1679404843660; 
 Tue, 21 Mar 2023 06:20:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] contrib/elf2dmp: add PE name check and Windows Server 2022
 support
Date: Tue, 21 Mar 2023 13:20:33 +0000
Message-Id: <20230321132036.1836617-6-peter.maydell@linaro.org>
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

Since its inception elf2dmp has checked MZ signatures within an
address space above IDT[0] interrupt vector and took first PE image
found as Windows Kernel.
But in Windows Server 2022 memory dump this address space range is
full of invalid PE fragments and the tool must check that PE image
is 'ntoskrnl.exe' actually.
So, introduce additional validation by checking image name from
Export Directory against 'ntoskrnl.exe'.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
Tested-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Reviewed-by: Annie Li <annie.li@oracle.com>
Message-id: 20230222211246.883679-4-viktor@daynix.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/pe.h   | 15 +++++++++++++++
 contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
index 807d0063649..71126af1aca 100644
--- a/contrib/elf2dmp/pe.h
+++ b/contrib/elf2dmp/pe.h
@@ -88,6 +88,20 @@ typedef struct IMAGE_NT_HEADERS64 {
     IMAGE_OPTIONAL_HEADER64 OptionalHeader;
 } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
 
+typedef struct IMAGE_EXPORT_DIRECTORY {
+    uint32_t    Characteristics;
+    uint32_t    TimeDateStamp;
+    uint16_t    MajorVersion;
+    uint16_t    MinorVersion;
+    uint32_t    Name;
+    uint32_t    Base;
+    uint32_t    NumberOfFunctions;
+    uint32_t    NumberOfNames;
+    uint32_t    AddressOfFunctions;
+    uint32_t    AddressOfNames;
+    uint32_t    AddressOfNameOrdinals;
+} __attribute__ ((packed)) IMAGE_EXPORT_DIRECTORY;
+
 typedef struct IMAGE_DEBUG_DIRECTORY {
     uint32_t Characteristics;
     uint32_t TimeDateStamp;
@@ -102,6 +116,7 @@ typedef struct IMAGE_DEBUG_DIRECTORY {
 #define IMAGE_DEBUG_TYPE_CODEVIEW   2
 #endif
 
+#define IMAGE_FILE_EXPORT_DIRECTORY 0
 #define IMAGE_FILE_DEBUG_DIRECTORY  6
 
 typedef struct guid_t {
diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 2f6028d8eb3..89f0c69ab0f 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -17,6 +17,7 @@
 
 #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
 #define PDB_NAME    "ntkrnlmp.pdb"
+#define PE_NAME     "ntoskrnl.exe"
 
 #define INITIAL_MXCSR   0x1f80
 
@@ -405,6 +406,25 @@ static int write_dump(struct pa_space *ps,
     return fclose(dmp_file);
 }
 
+static bool pe_check_export_name(uint64_t base, void *start_addr,
+        struct va_space *vs)
+{
+    IMAGE_EXPORT_DIRECTORY export_dir;
+    const char *pe_name;
+
+    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_EXPORT_DIRECTORY,
+                &export_dir, sizeof(export_dir), vs)) {
+        return false;
+    }
+
+    pe_name = va_space_resolve(vs, base + export_dir.Name);
+    if (!pe_name) {
+        return false;
+    }
+
+    return !strcmp(pe_name, PE_NAME);
+}
+
 static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
         char *hash, struct va_space *vs)
 {
@@ -489,6 +509,7 @@ int main(int argc, char *argv[])
     uint64_t KdDebuggerDataBlock;
     KDDEBUGGER_DATA64 *kdbg;
     uint64_t KdVersionBlock;
+    bool kernel_found = false;
 
     if (argc != 3) {
         eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
@@ -536,11 +557,14 @@ int main(int argc, char *argv[])
         }
 
         if (*(uint16_t *)nt_start_addr == 0x5a4d) { /* MZ */
-            break;
+            if (pe_check_export_name(KernBase, nt_start_addr, &vs)) {
+                kernel_found = true;
+                break;
+            }
         }
     }
 
-    if (!nt_start_addr) {
+    if (!kernel_found) {
         eprintf("Failed to find NT kernel image\n");
         err = 1;
         goto out_ps;
-- 
2.34.1


