Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CD69FD95
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwQE-0000WG-Dk; Wed, 22 Feb 2023 16:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQD-0000UY-3a
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:05 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQA-0005C0-33
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:04 -0500
Received: by mail-lf1-x134.google.com with SMTP id w27so11840571lfu.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STNqBdWWCIs1BpepAXzTgFwj1FLlfxlkFnmzBHiqxqw=;
 b=KhyVzxpKN16d3kxd1ueB+uXuvzfZWJJO2XUGLR8v7zYdPfHsZ750+PG7fuWOFbCV8Q
 0n+bayl8niTfEgRUOfeyZtOIs6aQr/RTMX4f9MEgYLlOFOjU9jc+4u+Vvpm2BkS6UWL4
 5plWOn6ProHZICOsZsDmIiyGyN74UcQ6VdH26XI6dLxeVbNh0NrKTKaIqNaWpMIptS5V
 Cb+I+lYf1b6ZNMmfk7tvWGO5MUXOyjPnd1ThGFSxHsJNofK+qFwaBzwCKRzzJHcjP6O6
 7rl984yaKg0MkCB3b/jbw33DOsD66SXVE7j0x6b2M01ouoRjVm3KzrJNwyzAKokl5guR
 wC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STNqBdWWCIs1BpepAXzTgFwj1FLlfxlkFnmzBHiqxqw=;
 b=DeyfJjkTaznzZJWrW8lmif5RXj0TmC7W3vqhtkgGjsfNMwy8fOMYmjPc5cbrJzg5ZD
 s4zVfBe078nqyQQPG7zCexzBn6gd6itFwb6SZshcH8cxs/La9GrbyZf6hjPaj9YB2r7g
 eiZ/CsBzsN9lOm9L6wmNyu11bmxDIDNXqw9y2hjE1B5P5yvoW1cO+nnsrcyQMiXACLUe
 js2VJScuhaC+v5ToWWq4sBpTlyoZdqM32FAMsK3Lbj3iGi7IAt5mqeN0sCmiqijbBmYl
 wdL+4JNJ9eytP2NgqcSBe2FS114F/oUFlC/6d2ArWrkvrS2j1HwRwSnEUmFLi5mj4vvw
 Kojw==
X-Gm-Message-State: AO0yUKVGg2fFAR/nrmfgOJcQ9rjpRhTz/kGgML95o/MHXZKltO3J0pOc
 taGQBfh+HJch0fKRTpfzVNcHQw==
X-Google-Smtp-Source: AK7set9znTgxkrXbv4u6CI+qbTwYLBUajtAv80NZobnHjMUMcQNTplH9EH//V9YQkptXCvhJZWV/Cg==
X-Received: by 2002:ac2:52bc:0:b0:4dc:4afe:1622 with SMTP id
 r28-20020ac252bc000000b004dc4afe1622mr3647640lfm.42.1677100380007; 
 Wed, 22 Feb 2023 13:13:00 -0800 (PST)
Received: from vp-pc.. (46-138-232-132.dynamic.spd-mgts.ru. [46.138.232.132])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2558f000000b004db0d97b053sm330068lfg.137.2023.02.22.13.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:12:59 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: annie.li@oracle.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v2 3/3] contrib/elf2dmp: add PE name check and Windows Server
 2022 support
Date: Thu, 23 Feb 2023 00:12:46 +0300
Message-Id: <20230222211246.883679-4-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230222211246.883679-1-viktor@daynix.com>
References: <20230222211246.883679-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x134.google.com
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
index 2f6028d8eb..89f0c69ab0 100644
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


