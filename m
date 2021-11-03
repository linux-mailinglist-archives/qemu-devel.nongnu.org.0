Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B078A4445AA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:15:19 +0100 (CET)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIv0-0000LC-Rj
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miItC-0006jv-EB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:26 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miIt7-00046Y-1W
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:25 -0400
Received: by mail-lf1-x143.google.com with SMTP id o18so6133128lfu.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m42+hMcHGp+vSKdwcVtyJDEt3AhdU7btKAlwbjzYiFE=;
 b=ibDu3AlZlb5ZX11N4u+QonO/GUOIO4nYZWetWfjbWNDlYZiWrKf/G3RKF20ab0OB9R
 BoM4XTtb6OwYC/qYyQIA2i7P9vhIj96ngNrsmqH07T5yjkf/xpl+BQRyRddnGQ1YFTFF
 8/pEnQd1YuuRbgbQOtTfP+rQmEhEnSCuWnF+8pE2SBWNy8zM8Fa++vfhmBtdVUpx1gWV
 AuPj8CyOrme3EDgKIpkAH6/d7hFkigBcF2qTWRR7HcXqnTq8a1ozIDhqJtRDW6I+VpcC
 tWmycPWh5znvGMVQL8PRL93lbofLOOF2Z9lTB1fVZoaKhzmpLE7ZryQUHh6byszIaFy3
 6C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m42+hMcHGp+vSKdwcVtyJDEt3AhdU7btKAlwbjzYiFE=;
 b=rqkwpz6jKg4ISGWWVNYkb1Bd24XWU7lIcpMsr88z3tVhroWM/6HaY+it0wix8u+5lk
 JPHg0zSPlT8pfP3z0OcqBkjuJgs3iIjwud+LC3gKMAioYo/AKoiccW7wriyxiZs6ww3D
 zvKt/7im56r/JbpPNrGhh0984gG9DfUPsx8lr4xLJZDHBD1wZ7Oc3KVKinnkbupwTKfB
 Ta8NuiFB2mQ5icneue85v8VVVkar/aq8JVB3wlT1jm8b074uZYjYRVTcrweuZ1g8aJdk
 SlTcLWTNyX2tg4ZbYa0Iq8XzE4mELRJ12KzsJj5/caLt3X1iqwdpw0389z+uM6afmLxx
 2e4w==
X-Gm-Message-State: AOAM530C2pwG4uUZn439hMjV2AE6QJvnUAHg8IIZoxY9sYmIhU+mFhJK
 cbJPWP6c/46BPLfdDLRzE4D73w==
X-Google-Smtp-Source: ABdhPJykC2D4NUXReSz8wz40j+qAEgSaXO8uT+V3WVQxBBzszHYcYXty8cOojuv41NHPeyslEtbg8A==
X-Received: by 2002:a05:6512:3d90:: with SMTP id
 k16mr9247641lfv.365.1635955999356; 
 Wed, 03 Nov 2021 09:13:19 -0700 (PDT)
Received: from vp-pc.redhat.com ([2a00:1370:810e:bd31:a3af:f811:c4e:52b8])
 by smtp.gmail.com with ESMTPSA id a3sm243337lji.48.2021.11.03.09.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 09:13:18 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: peter.maydell@linaro.org,
	yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 3/3] contrib/elf2dmp: add PE name check and Windows Server
 2022 support
Date: Wed,  3 Nov 2021 19:13:00 +0300
Message-Id: <20211103161300.114741-4-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
References: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x143.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since its inception elf2dmp has checked MZ signatures within an
address space above IDT[0] interrupt vector and took first PE image
found as Windows Kernel.
But in Windows Server 2022 memory dump this address space range is
full of invalid PE fragments and the tool must check that PE image
is 'ntoskrnl.exe' actually.
So, introduce additional validation by checking image name from
Export Directory against 'ntoskrnl.exe'.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
 contrib/elf2dmp/pe.h   | 15 +++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index a62fde23cc..04cdd07292 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -17,6 +17,7 @@
 
 #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
 #define PDB_NAME    "ntkrnlmp.pdb"
+#define PE_NAME     "ntoskrnl.exe"
 
 #define INITIAL_MXCSR   0x1f80
 
@@ -399,6 +400,25 @@ static int write_dump(struct pa_space *ps,
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
@@ -483,6 +503,7 @@ int main(int argc, char *argv[])
     uint64_t KdDebuggerDataBlock;
     KDDEBUGGER_DATA64 *kdbg;
     uint64_t KdVersionBlock;
+    bool kernel_found = false;
 
     if (argc != 3) {
         eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
@@ -530,11 +551,14 @@ int main(int argc, char *argv[])
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
2.31.1


