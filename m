Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DB3F9029
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:30:53 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMxY-0002jG-14
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfu-000647-Rh
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:38 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfs-0006qa-Oe
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:38 -0400
Received: by mail-io1-xd34.google.com with SMTP id f6so5682275iox.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JyL/yK7CLdcOECpXnv/+HDkYR4dz7Ewg44hKHA7ob7s=;
 b=bv72zNsgcnKMsfwmTMYXAY159Ub+csDzwy76sqraNPEUUSu4UI+rXPOzoQRn7Xyjh8
 plo2fhWTyxJSIbhidP2e98waDBOaaBujZkbcj0+35YaehTBuC4THC3fXnSGAKEOI0Ads
 QnAagV8fEEeJhTkpceCeYbWCXRkI93aIawUbFwNysWCRDfaSfCRog5A9/7og04fJnQmE
 KqF7Czq05bm09fG80lHFaDuiDp59Zwt7eUXLW2bUOU1Y+lJTb2TqxQ38TRtEEvGfAISZ
 6Ix+4goPkb43ut0/XPNGC6ftraD9syLwnsdpOGChb+Lx7/eNNDpghXya8gq/5lT1eTrq
 UsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JyL/yK7CLdcOECpXnv/+HDkYR4dz7Ewg44hKHA7ob7s=;
 b=aAYfXr0X+DrTQpY+qKnD2+qE8PRhWX9Vwx3HP44sOungL3sUdtut7aJo3xjF7vJxsN
 Pakk+DKiCilfoOk0ouRo+bnqxNlLFhhxgFxQ87T0lVhUA+D7PNOKAPFGia1TFA9lEHF2
 dPVdMze+IaXuv0kWkAV2lMavlyY0Mo/+Zj5ICHmx4Hd29/85EeLhsmKqqlO7HvvEYyaK
 p6gO97XVQtUUI6WDNqmuMF/gbXP4n5NilH93Th2B5K62hjYumfYjdVk6YhR41nFenOrt
 CV3oy+F7eFBTQPUqAb475PvSLlYKOBN+ZbhMsHW1Pcjf7+LONZYteTFSC0Pt9D+U2o9M
 wcBg==
X-Gm-Message-State: AOAM533orgf8J6lxSzyOtMNAEeA1hZ7AU/4f5RT44iY2m9iCC92K4xew
 fiEvy36fFhwlLPqmSdlD1H6kEEkt+cYlTnqx
X-Google-Smtp-Source: ABdhPJyC63058YMLQK8MrNrvfIbXjpoxizNjW0H3CvjyGVn6bRO0FvjxqJhM4R1lzmhUHAV8LzJq+Q==
X-Received: by 2002:a6b:8e87:: with SMTP id q129mr4723232iod.176.1630012355320; 
 Thu, 26 Aug 2021 14:12:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:34 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/43] bsd-user: elfload: simplify bswap a bit.
Date: Thu, 26 Aug 2021 15:11:32 -0600
Message-Id: <20210826211201.98877-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Reduce the number of ifdefs by always calling the swapping routine, but
making them empty when swapping isn't needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 97 ++++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 50 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 9c34e2ffcb..8a6a72bf05 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -67,13 +67,13 @@
 
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
-        memcpy(to, from, n);
+    memcpy(to, from, n);
 }
 
 #ifdef BSWAP_NEEDED
 static void bswap_ehdr(struct elfhdr *ehdr)
 {
-    bswap16s(&ehdr->e_type);                    /* Object file type */
+    bswap16s(&ehdr->e_type);            /* Object file type */
     bswap16s(&ehdr->e_machine);         /* Architecture */
     bswap32s(&ehdr->e_version);         /* Object file version */
     bswaptls(&ehdr->e_entry);           /* Entry point virtual address */
@@ -81,37 +81,45 @@ static void bswap_ehdr(struct elfhdr *ehdr)
     bswaptls(&ehdr->e_shoff);           /* Section header table file offset */
     bswap32s(&ehdr->e_flags);           /* Processor-specific flags */
     bswap16s(&ehdr->e_ehsize);          /* ELF header size in bytes */
-    bswap16s(&ehdr->e_phentsize);               /* Program header table entry size */
+    bswap16s(&ehdr->e_phentsize);       /* Program header table entry size */
     bswap16s(&ehdr->e_phnum);           /* Program header table entry count */
-    bswap16s(&ehdr->e_shentsize);               /* Section header table entry size */
+    bswap16s(&ehdr->e_shentsize);       /* Section header table entry size */
     bswap16s(&ehdr->e_shnum);           /* Section header table entry count */
-    bswap16s(&ehdr->e_shstrndx);                /* Section header string table index */
+    bswap16s(&ehdr->e_shstrndx);        /* Section header string table index */
 }
 
-static void bswap_phdr(struct elf_phdr *phdr)
+static void bswap_phdr(struct elf_phdr *phdr, int phnum)
 {
-    bswap32s(&phdr->p_type);                    /* Segment type */
-    bswaptls(&phdr->p_offset);          /* Segment file offset */
-    bswaptls(&phdr->p_vaddr);           /* Segment virtual address */
-    bswaptls(&phdr->p_paddr);           /* Segment physical address */
-    bswaptls(&phdr->p_filesz);          /* Segment size in file */
-    bswaptls(&phdr->p_memsz);           /* Segment size in memory */
-    bswap32s(&phdr->p_flags);           /* Segment flags */
-    bswaptls(&phdr->p_align);           /* Segment alignment */
+    int i;
+
+    for (i = 0; i < phnum; i++, phdr++) {
+        bswap32s(&phdr->p_type);        /* Segment type */
+        bswap32s(&phdr->p_flags);       /* Segment flags */
+        bswaptls(&phdr->p_offset);      /* Segment file offset */
+        bswaptls(&phdr->p_vaddr);       /* Segment virtual address */
+        bswaptls(&phdr->p_paddr);       /* Segment physical address */
+        bswaptls(&phdr->p_filesz);      /* Segment size in file */
+        bswaptls(&phdr->p_memsz);       /* Segment size in memory */
+        bswaptls(&phdr->p_align);       /* Segment alignment */
+    }
 }
 
-static void bswap_shdr(struct elf_shdr *shdr)
+static void bswap_shdr(struct elf_shdr *shdr, int shnum)
 {
-    bswap32s(&shdr->sh_name);
-    bswap32s(&shdr->sh_type);
-    bswaptls(&shdr->sh_flags);
-    bswaptls(&shdr->sh_addr);
-    bswaptls(&shdr->sh_offset);
-    bswaptls(&shdr->sh_size);
-    bswap32s(&shdr->sh_link);
-    bswap32s(&shdr->sh_info);
-    bswaptls(&shdr->sh_addralign);
-    bswaptls(&shdr->sh_entsize);
+    int i;
+
+    for (i = 0; i < shnum; i++, shdr++) {
+        bswap32s(&shdr->sh_name);
+        bswap32s(&shdr->sh_type);
+        bswaptls(&shdr->sh_flags);
+        bswaptls(&shdr->sh_addr);
+        bswaptls(&shdr->sh_offset);
+        bswaptls(&shdr->sh_size);
+        bswap32s(&shdr->sh_link);
+        bswap32s(&shdr->sh_info);
+        bswaptls(&shdr->sh_addralign);
+        bswaptls(&shdr->sh_entsize);
+    }
 }
 
 static void bswap_sym(struct elf_sym *sym)
@@ -121,7 +129,15 @@ static void bswap_sym(struct elf_sym *sym)
     bswaptls(&sym->st_size);
     bswap16s(&sym->st_shndx);
 }
-#endif
+
+#else /* ! BSWAP_NEEDED */
+
+static void bswap_ehdr(struct elfhdr *ehdr) { }
+static void bswap_phdr(struct elf_phdr *phdr, int phnum) { }
+static void bswap_shdr(struct elf_shdr *shdr, int shnum) { }
+static void bswap_sym(struct elf_sym *sym) { }
+
+#endif /* ! BSWAP_NEEDED */
 
 /*
  * 'copy_elf_strings()' copies argument/envelope strings from user
@@ -367,9 +383,7 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     last_bss = 0;
     error = 0;
 
-#ifdef BSWAP_NEEDED
     bswap_ehdr(interp_elf_ex);
-#endif
     /* First of all, some simple consistency checks */
     if ((interp_elf_ex->e_type != ET_EXEC &&
          interp_elf_ex->e_type != ET_DYN) ||
@@ -410,12 +424,7 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
         free(elf_phdata);
         return retval;
     }
-#ifdef BSWAP_NEEDED
-    eppnt = elf_phdata;
-    for (i = 0; i<interp_elf_ex->e_phnum; i++, eppnt++) {
-        bswap_phdr(eppnt);
-    }
-#endif
+    bswap_phdr(elf_phdata, interp_elf_ex->e_phnum);
 
     if (interp_elf_ex->e_type == ET_DYN) {
         /* in order to avoid hardcoding the interpreter load
@@ -560,9 +569,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
     for (i = 0; i < hdr->e_shnum; i++) {
         if (read(fd, &sechdr, sizeof(sechdr)) != sizeof(sechdr))
             return;
-#ifdef BSWAP_NEEDED
-        bswap_shdr(&sechdr);
-#endif
+        bswap_shdr(&sechdr, 1);
         if (sechdr.sh_type == SHT_SYMTAB) {
             symtab = sechdr;
             lseek(fd, hdr->e_shoff
@@ -570,9 +577,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
             if (read(fd, &strtab, sizeof(strtab))
                 != sizeof(strtab))
                 return;
-#ifdef BSWAP_NEEDED
-            bswap_shdr(&strtab);
-#endif
+            bswap_shdr(&strtab, 1);
             goto found;
         }
     }
@@ -605,9 +610,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
     i = 0;
     while (i < nsyms) {
-#ifdef BSWAP_NEEDED
         bswap_sym(syms + i);
-#endif
         // Throw away entries which we do not need.
         if (syms[i].st_shndx == SHN_UNDEF ||
                 syms[i].st_shndx >= SHN_LORESERVE ||
@@ -679,9 +682,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     load_addr = 0;
     load_bias = 0;
     elf_ex = *((struct elfhdr *) bprm->buf);          /* exec-header */
-#ifdef BSWAP_NEEDED
     bswap_ehdr(&elf_ex);
-#endif
 
     /* First of all, some simple consistency checks */
     if ((elf_ex.e_type != ET_EXEC && elf_ex.e_type != ET_DYN) ||
@@ -715,12 +716,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
         return -errno;
     }
 
-#ifdef BSWAP_NEEDED
-    elf_ppnt = elf_phdata;
-    for (i = 0; i < elf_ex.e_phnum; i++, elf_ppnt++) {
-        bswap_phdr(elf_ppnt);
-    }
-#endif
+    bswap_phdr(elf_phdata, elf_ex.e_phnum);
+
     elf_ppnt = elf_phdata;
 
     elf_bss = 0;
-- 
2.32.0


