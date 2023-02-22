Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747C69FD94
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwQE-0000WF-Ag; Wed, 22 Feb 2023 16:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQB-0000U1-Vh
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:03 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwQ9-0005Bt-Vy
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:13:03 -0500
Received: by mail-lf1-x12e.google.com with SMTP id m6so11857506lfq.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlrYiP/Rjyh6JuAfva8PKq43r8eygmT1KPq0YjpxGiU=;
 b=oYd+CFyHKL66WbVmlHq7ScXxCrCJhRqWuRPvyN2R6F2+V7Wu6a4/MFyvLBRGVZ/ds8
 VwBsLS7T/EhqB0InUCbswj6t+AInkJpRtTeTNmNdfOQVs+oUERMZHHRPpo4pyzBSvHT9
 bRvkUzXUOB+I38tSWrt//F0zfSGtXdKzM042BSyQTXYb/0sXbxSPfip/JVnYw20TCuj5
 cAiQDKEnQMZA+nJezXekLO2p7pj7u8ampwvftjQ95TNUqv7T8M7rFj57+BwB8G2p3Zyw
 ncnckNjwYXTPT7eWyHZqbnlgxcCwVCo/oF6fgZPCe9696reWIaY0zbXCM9fpI+gAiWiO
 iyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PlrYiP/Rjyh6JuAfva8PKq43r8eygmT1KPq0YjpxGiU=;
 b=u5DWn9oECLsJ876/VmDqNpYJKRSccDfiQRkQhA3+Ls/TxNrHPrWEwHcgOjwpNr4LLk
 hD4LiEr6PixHAQ8/sVFb7VBu6hkKcJULZoPxKPF9R3QlrdqRFBLbLVt3ckQ1vaIxoNnT
 82B3TI2qA98nQ85aQ6Hy+x8uHYknaqaMmpk8RGmUnluE2WUtNCiMvtAyHYLkgtsjNDdT
 ejX8YmeNdlr7P66/80iMLuhWRcRXcDt6DqCLRrQjmZdBmUqlXV0YmiCVMS3XCy4T56Uk
 JQI49tA0yXU1xgYesP7qlD+S1XlKNmicXCmZku9JmX8oBdj+EiVrC49ScJcNBKAgS8GT
 f0bA==
X-Gm-Message-State: AO0yUKXAuU0YUSj/4viwbJ2zLSuDavft//J68kPy8CVP8Bg6KlrSFKX/
 /PAZ/ranOci9F0PfoW2O0QlCVg==
X-Google-Smtp-Source: AK7set++dPKiaAqS4l3XgbefDVQNvUvub6xiFbCjmH5ol2EuwW2dr7CV9bxS9wYanq8MQFv5NqtNgg==
X-Received: by 2002:ac2:5df1:0:b0:4db:18da:1bc9 with SMTP id
 z17-20020ac25df1000000b004db18da1bc9mr3452323lfq.60.1677100378887; 
 Wed, 22 Feb 2023 13:12:58 -0800 (PST)
Received: from vp-pc.. (46-138-232-132.dynamic.spd-mgts.ru. [46.138.232.132])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2558f000000b004db0d97b053sm330068lfg.137.2023.02.22.13.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 13:12:58 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: annie.li@oracle.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v2 2/3] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
Date: Thu, 23 Feb 2023 00:12:45 +0300
Message-Id: <20230222211246.883679-3-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230222211246.883679-1-viktor@daynix.com>
References: <20230222211246.883679-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12e;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x12e.google.com
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

Move out PE directory search functionality to be reused not only
for Debug Directory processing but for arbitrary PE directory.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 contrib/elf2dmp/main.c | 71 +++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 9224764239..2f6028d8eb 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -333,6 +333,45 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
     return 0;
 }
 
+static int pe_get_data_dir_entry(uint64_t base, void *start_addr, int idx,
+        void *entry, size_t size, struct va_space *vs)
+{
+    const char e_magic[2] = "MZ";
+    const char Signature[4] = "PE\0\0";
+    IMAGE_DOS_HEADER *dos_hdr = start_addr;
+    IMAGE_NT_HEADERS64 nt_hdrs;
+    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
+    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
+    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
+
+    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
+
+    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
+        return 1;
+    }
+
+    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
+                &nt_hdrs, sizeof(nt_hdrs), 0)) {
+        return 1;
+    }
+
+    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
+            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
+        return 1;
+    }
+
+    if (va_space_rw(vs,
+                base + data_dir[idx].VirtualAddress,
+                entry, size, 0)) {
+        return 1;
+    }
+
+    printf("Data directory entry #%d: RVA = 0x%08"PRIx32"\n", idx,
+            (uint32_t)data_dir[idx].VirtualAddress);
+
+    return 0;
+}
+
 static int write_dump(struct pa_space *ps,
         WinDumpHeader64 *hdr, const char *name)
 {
@@ -369,42 +408,16 @@ static int write_dump(struct pa_space *ps,
 static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
         char *hash, struct va_space *vs)
 {
-    const char e_magic[2] = "MZ";
-    const char Signature[4] = "PE\0\0";
     const char sign_rsds[4] = "RSDS";
-    IMAGE_DOS_HEADER *dos_hdr = start_addr;
-    IMAGE_NT_HEADERS64 nt_hdrs;
-    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
-    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
-    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
     IMAGE_DEBUG_DIRECTORY debug_dir;
     OMFSignatureRSDS rsds;
     char *pdb_name;
     size_t pdb_name_sz;
     size_t i;
 
-    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
-
-    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
-        return 1;
-    }
-
-    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
-                &nt_hdrs, sizeof(nt_hdrs), 0)) {
-        return 1;
-    }
-
-    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
-            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
-        return 1;
-    }
-
-    printf("Debug Directory RVA = 0x%08"PRIx32"\n",
-            (uint32_t)data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress);
-
-    if (va_space_rw(vs,
-                base + data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress,
-                &debug_dir, sizeof(debug_dir), 0)) {
+    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_DEBUG_DIRECTORY,
+                &debug_dir, sizeof(debug_dir), vs)) {
+        eprintf("Failed to get Debug Directory\n");
         return 1;
     }
 
-- 
2.35.1


