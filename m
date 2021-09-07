Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8794030B4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:07:48 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjFs-0006Iq-0U
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2P-0005mC-OO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:54 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2O-0000r4-1R
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:53 -0400
Received: by mail-il1-x12d.google.com with SMTP id b4so147345ilr.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOAZSGqkpjDabAtvYukqX2GF+50RlQa86m0q01cBJbQ=;
 b=b0mSh6fN1+kK9YOuXNsVM8Aa6bCysYnW81bav8TzhQODDMBwtI4u7vEC6VTfpxzaFJ
 P/QJm7wQTjmppzohHWGkoLlGnVuMBOyK1MlHA/wcLCH12negERHXa1+K7Dy0ygkAGyLi
 3hATP/m+9WR6Mj7Z9JtXs11jwjX2OOCRj/uasSknyHJYt7k2AlWHAIe8gSRitfSs0Q0v
 NUGmF0Oz3wmzYMTYy0PQsw4CumAFB183khH9FWdDFxPWLttz0VmpQmXr+m7IjSPnYAE9
 pRiZZbJ7aHbNYJRdQ3bv2F+MXhXYIv+nhTykIEk6ZUvWTfatR0OsfBbs7puAZrj0LcfL
 +kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOAZSGqkpjDabAtvYukqX2GF+50RlQa86m0q01cBJbQ=;
 b=c3uGqFoTf/DnXIfuidAT694tafCXbJmXDw8QwWCbJLQmepCzG8tHZrxe0dlupyNgeV
 EIBkqqBv+4DKX76sNf4EQoV/zquZOOipktM58WT3pARk3tNRJnydh9CBvVFIurle57Bo
 xPlqA21LZ1LWCtDS5ESHw9Bi8/p3fvZKrxWv3Iu+kOUAaj/biXVRlfo/4PIuHHv52Tqr
 rhX9/ZTA6ci63YNAHauYmA2ib7xiFgMimk18WqnMpNB9bF5NlfNLZwNaXtznml5JHv8p
 IV+7Wu1XapHNsRZPfvhcRP0Xp/Hw1T6TSzdB+CHrLecc0QAku1w+rkux5yZFaEZefsmG
 4txw==
X-Gm-Message-State: AOAM533c6p4ItHzuZqrMcSLXqBkc8xIsSJhkcwreWLT+GcZ2SeM+Svgo
 QDcagit4DEaefhxvP/w341ZSTGKs30bMVpdbAI8=
X-Google-Smtp-Source: ABdhPJx5bZmVmbFBSglvnNRr1kOXVtxstiOmthEUGSvqkE9t0Fe5k4T0s5PDUU8hE1GyLaxrVbZ3Tw==
X-Received: by 2002:a05:6e02:134e:: with SMTP id
 k14mr290955ilr.39.1631051630697; 
 Tue, 07 Sep 2021 14:53:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:50 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 14/42] bsd-user: elfload: simplify bswap a bit.
Date: Tue,  7 Sep 2021 15:53:04 -0600
Message-Id: <20210907215332.30737-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
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
index 4f3fa83c2c..ccb1744800 100644
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


