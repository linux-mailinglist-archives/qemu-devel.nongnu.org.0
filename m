Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF733AD785
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:50:20 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRzv-0006ik-7P
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtZ-00009P-Dn
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtQ-00082H-Ub
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso7040285pjp.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C8iPVs7HJyqae3VBQhrLESrT2Lay4oj3eIp3fHt5b/o=;
 b=JiaXbgl2DWOceQh6kfQsIWz94H9ekP2VWAVw7TZlaEofnW6twKumQxksUu7/kJCHqn
 NWpDVMu/93kCjkRpvunqxirpLkLQ/sSNGpWTab0o+hQmovPinSX6ehPMNruF8r23uNnd
 FZeNnQ14wCvGlu0T/YKfvSHJpwQK1JeWsRna1Qn3TEAJvJCLPBNWsTmfQLw4F2Tu7rvp
 kkqds0qCpjquzWSeXEgxXKqsxwGO9OgRMpCp0ih2dnMYm9agoE/GTIQq1BLblYSRo4G1
 B7y8cJ7MiTqcjmHlQxchukS9QrT8NasRlxms+mfHTtHTujQI+4i/4J1d4BWlT/Z3iYa7
 Ljew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C8iPVs7HJyqae3VBQhrLESrT2Lay4oj3eIp3fHt5b/o=;
 b=me9Ok5qWuhCypw0PCaQi1odwH4CbKQ/+UcKuDS8u76j/QVmG5YzHS3hzt2H4uJa4ef
 AHvpWzTgB5FZvlqz0V2YX+NbqYPv5po8cQza3KAq2SgiatmKHOrZH0xjiQ88rxG6oJPy
 9TEyZMw0feMGvjdLZ2+AXE3o3snkTwjgjCVSihlheXO8w9OX6OHjp8BSK6zjzqdoPNgm
 MxtwJx0FEbnd6uB6tFoZVQ6B42sy1mWwD1MKsd+bFOHNFBAYcNYMw6yK7d7hrh1DqUCR
 S4a9URqmQ8RkclT44wvztDfI3kVBN325wak5JG83bx1oZF3ZHIVTNe4wYbN+rDnVqyNA
 ZxKg==
X-Gm-Message-State: AOAM530KPENnoB4f00p32gVOg6R5ojwgcKs69NW0YwrOo67M2wXaJ2yw
 +0WXAwrAVH/maz18OwwLB7gM2ndM6TQnpA==
X-Google-Smtp-Source: ABdhPJx99vk1wfIylrqqZZ3GwDoqMLApjK+ZD2GUh6xdpfuBDJc2L3UKOg7g5YLZxMHmfU2ak6SW7w==
X-Received: by 2002:a17:90a:b795:: with SMTP id
 m21mr14491730pjr.143.1624074214390; 
 Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] linux-user: Use ImageSource in load_symbols
Date: Fri, 18 Jun 2021 20:43:23 -0700
Message-Id: <20210619034329.532318-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aside from the section headers, we're unlikely to hit the
ImageSource cache on guest executables.  But the interface
for imgsrc_read_* is better.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 87 ++++++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 39 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 425420f0cc..3c31a5e3b0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1729,7 +1729,8 @@ static inline void bswap_mips_abiflags(Mips_elf_abiflags_v0 *abiflags) { }
 #ifdef USE_ELF_CORE_DUMP
 static int elf_core_dump(int, const CPUArchState *);
 #endif /* USE_ELF_CORE_DUMP */
-static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias);
+static void load_symbols(struct elfhdr *hdr, const ImageSource *src,
+                         abi_ulong load_bias);
 
 /* Verify the portions of EHDR within E_IDENT for the target.
    This can be performed before bswapping the entire header.  */
@@ -2896,7 +2897,7 @@ static void load_elf_image(const char *image_name, const ImageSource *src,
     }
 
     if (qemu_log_enabled()) {
-        load_symbols(ehdr, src->fd, load_bias);
+        load_symbols(ehdr, src, load_bias);
     }
 
     mmap_unlock();
@@ -2984,19 +2985,20 @@ static int symcmp(const void *s0, const void *s1)
 }
 
 /* Best attempt to load symbols from this ELF object. */
-static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
+static void load_symbols(struct elfhdr *hdr, const ImageSource *src,
+                         abi_ulong load_bias)
 {
     int i, shnum, nsyms, sym_idx = 0, str_idx = 0;
-    uint64_t segsz;
-    struct elf_shdr *shdr;
+    g_autofree struct elf_shdr *shdr = NULL;
     char *strings = NULL;
-    struct syminfo *s = NULL;
-    struct elf_sym *new_syms, *syms = NULL;
+    struct elf_sym *syms = NULL;
+    struct elf_sym *new_syms;
+    uint64_t segsz;
 
     shnum = hdr->e_shnum;
-    i = shnum * sizeof(struct elf_shdr);
-    shdr = (struct elf_shdr *)alloca(i);
-    if (pread(fd, shdr, i, hdr->e_shoff) != i) {
+    shdr = imgsrc_read_alloc(hdr->e_shoff, shnum * sizeof(struct elf_shdr),
+                             src, NULL);
+    if (shdr == NULL) {
         return;
     }
 
@@ -3014,31 +3016,33 @@ static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
 
  found:
     /* Now know where the strtab and symtab are.  Snarf them.  */
-    s = g_try_new(struct syminfo, 1);
-    if (!s) {
-        goto give_up;
-    }
 
     segsz = shdr[str_idx].sh_size;
-    s->disas_strtab = strings = g_try_malloc(segsz);
-    if (!strings ||
-        pread(fd, strings, segsz, shdr[str_idx].sh_offset) != segsz) {
+    strings = g_try_malloc(segsz);
+    if (!strings) {
+        goto give_up;
+    }
+    if (!imgsrc_read(strings, shdr[str_idx].sh_offset, segsz, src, NULL)) {
         goto give_up;
     }
 
     segsz = shdr[sym_idx].sh_size;
-    syms = g_try_malloc(segsz);
-    if (!syms || pread(fd, syms, segsz, shdr[sym_idx].sh_offset) != segsz) {
-        goto give_up;
-    }
-
     if (segsz / sizeof(struct elf_sym) > INT_MAX) {
-        /* Implausibly large symbol table: give up rather than ploughing
-         * on with the number of symbols calculation overflowing
+        /*
+         * Implausibly large symbol table: give up rather than ploughing
+         * on with the number of symbols calculation overflowing.
          */
         goto give_up;
     }
     nsyms = segsz / sizeof(struct elf_sym);
+    syms = g_try_malloc(segsz);
+    if (!syms) {
+        goto give_up;
+    }
+    if (!imgsrc_read(syms, shdr[sym_idx].sh_offset, segsz, src, NULL)) {
+        goto give_up;
+    }
+
     for (i = 0; i < nsyms; ) {
         bswap_sym(syms + i);
         /* Throw away entries which we do not need.  */
@@ -3063,10 +3067,12 @@ static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
         goto give_up;
     }
 
-    /* Attempt to free the storage associated with the local symbols
-       that we threw away.  Whether or not this has any effect on the
-       memory allocation depends on the malloc implementation and how
-       many symbols we managed to discard.  */
+    /*
+     * Attempt to free the storage associated with the local symbols
+     * that we threw away.  Whether or not this has any effect on the
+     * memory allocation depends on the malloc implementation and how
+     * many symbols we managed to discard.
+     */
     new_syms = g_try_renew(struct elf_sym, syms, nsyms);
     if (new_syms == NULL) {
         goto give_up;
@@ -3075,20 +3081,23 @@ static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
 
     qsort(syms, nsyms, sizeof(*syms), symcmp);
 
-    s->disas_num_syms = nsyms;
-#if ELF_CLASS == ELFCLASS32
-    s->disas_symtab.elf32 = syms;
-#else
-    s->disas_symtab.elf64 = syms;
-#endif
-    s->lookup_symbol = lookup_symbolxx;
-    s->next = syminfos;
-    syminfos = s;
+    {
+        struct syminfo *s = g_new(struct syminfo, 1);
 
+        s->disas_strtab = strings;
+        s->disas_num_syms = nsyms;
+#if ELF_CLASS == ELFCLASS32
+        s->disas_symtab.elf32 = syms;
+#else
+        s->disas_symtab.elf64 = syms;
+#endif
+        s->lookup_symbol = lookup_symbolxx;
+        s->next = syminfos;
+        syminfos = s;
+    }
     return;
 
-give_up:
-    g_free(s);
+ give_up:
     g_free(strings);
     g_free(syms);
 }
-- 
2.25.1


