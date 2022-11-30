Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7463CD29
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CUz-0002Ax-8F; Tue, 29 Nov 2022 21:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZi-00083I-Fr
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:42 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZa-0004tx-Ll
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:41 -0500
Received: by mail-lf1-x133.google.com with SMTP id d6so24496024lfs.10
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 16:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LnWPuKtqHKtpKk06xgRc3yHBStzUkLPUQ6Q4gHALNk=;
 b=2g4/zJ7cxTfDlE/n4DOedlCyWUB8EONd1+VCLNH4oABl0NKGcAj6oTvkWpLUkj/WoI
 /sN+e42tIV4jCtbDN+vPv52Zl6f4JTQWbdnJVT2x4zzQB49h0yiwn6QlF8p92gW42rHi
 sMoxw02JgH0sF2M1mFipjKBjHSPjpwxxb0d+tH6Gbl2mfSN41Yk/1Gk/d9e6KJrbZlk7
 TWBxxXiS0hRbZbcTLbBu1GJnykHbMTlorDWq6KtRNbvY8HooMsMBgtqFXu2K7yYOWuKk
 oQt41+Z277fYqlVkESTHEK9QBRZM9hA58HYclW68ydP9UW6GrgauObxOfhydmRUiIZeG
 1Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LnWPuKtqHKtpKk06xgRc3yHBStzUkLPUQ6Q4gHALNk=;
 b=CuMeWI7SSZXtWczSyWeLX10NGJe8XoL1lHQg/sHd1nCQoJTgs/m5GzjAainFG5Yy3k
 3zoCqMSo5J0l54D5g7hSyQcZjp7G2BuI8EYBeIwcrr8A3wv5cupvIgogj16OPq2HHQhi
 H8uo+DX4FgBmGoRetQNbiBffh57pAyb2K3n3G1mjGEKMwMw7dBU6NvjjFIa6zdhHkAjT
 OLEZ4IWWw+uS4smdddvBTYXacMfiJyKEHTd6punD1q/s96PdUurAsDi+kUJHJbfiCBDC
 YcGLGfstteYNZytTuxi5my0sNYfn6rYfPPmequ/4A45X/dFmqQPLsMVBJlXGREf56uuo
 3xMQ==
X-Gm-Message-State: ANoB5plUuMcmah7FBjSENwByywC5M1cBq0NxDh0arWrKl7RORCBB/z0D
 AyhgMx/2b4KqOB9mnMngJCwJFgMb8/ZZvXUE
X-Google-Smtp-Source: AA0mqf6Dy/epY2hZvm2SkRrCBQo5LAUBqXdRnx4CIaOZAxMUsq2/JefnzbqKXK8fE7ZFb5dHAjDiGA==
X-Received: by 2002:a05:6512:118b:b0:4a4:77a8:45a4 with SMTP id
 g11-20020a056512118b00b004a477a845a4mr19108742lfr.654.1669766612479; 
 Tue, 29 Nov 2022 16:03:32 -0800 (PST)
Received: from vp-pc.. (46-138-224-213.dynamic.spd-mgts.ru. [46.138.224.213])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a056512079100b004b4f4360407sm2399377lfr.105.2022.11.29.16.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:03:32 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v1 3/3] contrib/elf2dmp: add PE name check and Windows Server
 2022 support
Date: Wed, 30 Nov 2022 03:03:20 +0300
Message-Id: <20221130000320.287976-4-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130000320.287976-1-viktor@daynix.com>
References: <20221130000320.287976-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x133.google.com
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
---
 contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
 contrib/elf2dmp/pe.h   | 15 +++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index f3052b3c64..f7de82a03e 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -17,6 +17,7 @@
 
 #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
 #define PDB_NAME    "ntkrnlmp.pdb"
+#define PE_NAME     "ntoskrnl.exe"
 
 #define INITIAL_MXCSR   0x1f80
 
@@ -400,6 +401,25 @@ static int write_dump(struct pa_space *ps,
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
@@ -484,6 +504,7 @@ int main(int argc, char *argv[])
     uint64_t KdDebuggerDataBlock;
     KDDEBUGGER_DATA64 *kdbg;
     uint64_t KdVersionBlock;
+    bool kernel_found = false;
 
     if (argc != 3) {
         eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
@@ -531,11 +552,14 @@ int main(int argc, char *argv[])
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
diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
index 807d006364..71126af1ac 100644
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
-- 
2.35.1


