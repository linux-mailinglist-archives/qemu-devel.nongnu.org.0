Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C363C63CD1D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CV0-0002BP-BT; Tue, 29 Nov 2022 21:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZg-00080t-4N
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:40 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1p0AZa-0004tn-LB
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:03:39 -0500
Received: by mail-lf1-x133.google.com with SMTP id r12so24549301lfp.1
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXXvbMaw4dlxbhxJdfBIIOU5Lz9vDqR3CybYqjdPI5Q=;
 b=MEpbTn1Fl42mSn7oBxuk8IrovZ5adchv3GF+Zq3s5GOuZ+C0W7rd9gGxh+frfmf0+l
 jfuFi15rYTE+92nloS2+iKiAZdIuOoeN6OVoUhAT7vBxQ7brfAnDpvljEv6WN0YrGdE0
 H7xLzH1zTNQ68Hl1TxCH482rMz25cJLS8x1KPgx03MOw+Vk68bSdE7gLsN6e61HaSIDH
 6H0useRu8obIUTo5Uctv2zQYdFp3K7KfJOa5SGROCJIAWu04EzgNF0xSiYG4DDctlyr7
 QVp/MJ+w2lp0Z3/3bJzqbltUBUSj04iQGO2kJIdzSjxSL/z4ZKTaKFTZ07EtBLZ5+Kvs
 7UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXXvbMaw4dlxbhxJdfBIIOU5Lz9vDqR3CybYqjdPI5Q=;
 b=KnxGyX3Nlfqgz0gydUERTf1ZRImI/2lvSdoc/jiXNppPP2H59mzFmc+XmTA2fJIuJS
 SpFJi9n0A2lvNbAgERuWD8G9OioBSw2IT2thEn+m3ugDFT2TvBeqUfEUI1IAGFXAKIVG
 nOBE8dvLT/e5YkOoZ77sOyfcrvy1yFb17FrUYyMilYIzx/z63u69Y0u09k+32cbXZpvu
 tqSloZE4dBcjpAc58T1bwuym4mCKCv5JQTSB/kbI/ygF+2ext4jFcosnhscodHc9YR6N
 /rLd5U2VeG9Ut8F7sLKM2l1yBp1I8LSPk3QRfCr2DQ+GLutxcciOVbaW4UErYA+TrAUa
 Ao+A==
X-Gm-Message-State: ANoB5pnS2+T/hX1FUdE47qRD7Pr6QpCpIJUvxOgyDtTDT3PKzvXulie1
 0Ujr9KLl9o7c3TOY8cZhUHXlmw==
X-Google-Smtp-Source: AA0mqf4gI7+WEVoeKnbYVO4dc8MGqbdHwdSyz5lG1fOux7Cl/doBxrQHbEHr7A0+Yz5s92oUsjqIgg==
X-Received: by 2002:a05:6512:151e:b0:4af:1cbe:1ad8 with SMTP id
 bq30-20020a056512151e00b004af1cbe1ad8mr13668924lfb.16.1669766611498; 
 Tue, 29 Nov 2022 16:03:31 -0800 (PST)
Received: from vp-pc.. (46-138-224-213.dynamic.spd-mgts.ru. [46.138.224.213])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a056512079100b004b4f4360407sm2399377lfr.105.2022.11.29.16.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:03:31 -0800 (PST)
From: Viktor Prutyanov <viktor@daynix.com>
To: pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org, viktor@daynix.com
Subject: [PATCH v1 2/3] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
Date: Wed, 30 Nov 2022 03:03:19 +0300
Message-Id: <20221130000320.287976-3-viktor@daynix.com>
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

Move out PE directory search functionality to be reused not only
for Debug Directory processing but for arbitrary PE directory.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 contrib/elf2dmp/main.c | 66 +++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 9224764239..f3052b3c64 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -333,6 +333,40 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
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
+    return 0;
+}
+
 static int write_dump(struct pa_space *ps,
         WinDumpHeader64 *hdr, const char *name)
 {
@@ -369,42 +403,16 @@ static int write_dump(struct pa_space *ps,
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


