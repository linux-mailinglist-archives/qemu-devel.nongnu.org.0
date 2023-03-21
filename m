Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA56C329A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuy-00008G-5b; Tue, 21 Mar 2023 09:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuw-00005y-1N
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuu-0006dk-9A
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso9436749wmq.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hltfvwW9lBaJea+gwuBtyl1R81ssrvkZkLQe6XX9gms=;
 b=KNfK6xJxYBL62r0yjkLQrBtPxgbOMKvgHFpxxym9rwzBFuNiGr6Ke0U+DSliyhLSsD
 Bjo0ZnAFNm2wVRDmgv93uXwlun2bhtxMmRCpQLbwjvo8NR6FsMWpyIRULWa2AlUP4ogW
 cdTSrNeId6FJ3zwV2Rza4AYvjqV6RFZvw/r48pgX74GJAzuuMATgwNMCWFVRhWOS2Fzb
 DNSGVvCGWPWMteR6PO4yblS/1zbCtDGjSwuUiYF7wBDOAMbAvmr2AEqrhUoZPxfRapB+
 JCjcxD0LBNox7C5T0Xnx4trjGk4UhfbN5xjpc8dnqpqXNgbrDlG1r9+cxKrO9FWEDw8K
 FBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hltfvwW9lBaJea+gwuBtyl1R81ssrvkZkLQe6XX9gms=;
 b=OYvk+LBpbXnmlbv1q1Zj0slAxbS5rKS15C40aTVBxdbUbG0zHb3VAuDppreo67/yK7
 izSmBUAx/m9VCeXSBhfOWIWx6BUF/6yQ6RFhkg7UVn6kQZljRNRpuV9q7GgiCeSUMD8j
 E/lfw9eFT+eA39o9mePPwB0fyyr5m7IiiFb+Isfa4Kc4R7OZQ+Rsav52YpXcdqiXyfPC
 woqbnpOKz2Xcu1XS3vv6FeAWAid2vc8HvZoiq8RTK2qqp/T/Kx+7yz7YNNAyGw/8CjV8
 fn4+FKsSWBCwQCuOiEkfcdpSKNOqM6COHli3M3nSPkxy+BGjxjoAaknknZvNjE4oDf8c
 qK+Q==
X-Gm-Message-State: AO0yUKV0J0Sv+KqX6UoeXxsfTUDyNBF2hRxs363v8ggv6hWsSlYevVAj
 K5vXQVVCQ4jMYhJf49sA6enLYU9zyKwebh8rYx4=
X-Google-Smtp-Source: AK7set/yi3AWANjatu37kA82IiucRievQb4FhNyvkAgOnCWPuxqSa/2LbqawO1XMBCXkutLZONcchQ==
X-Received: by 2002:a7b:ce13:0:b0:3ed:8360:e54 with SMTP id
 m19-20020a7bce13000000b003ed83600e54mr2531584wmc.8.1679404842807; 
 Tue, 21 Mar 2023 06:20:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
Date: Tue, 21 Mar 2023 13:20:32 +0000
Message-Id: <20230321132036.1836617-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Move out PE directory search functionality to be reused not only
for Debug Directory processing but for arbitrary PE directory.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
Reviewed-by: Annie Li <annie.li@oracle.com>
Message-id: 20230222211246.883679-3-viktor@daynix.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/elf2dmp/main.c | 71 +++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 92247642395..2f6028d8eb3 100644
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
2.34.1


