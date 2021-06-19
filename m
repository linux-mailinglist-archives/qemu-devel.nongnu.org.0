Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA43AD783
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:49:09 +0200 (CEST)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRym-0003qE-Ru
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtg-0000QY-8I
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtS-000839-7z
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g192so1535307pfb.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xf7gfODhEHLAK19nF0i1E5avDqb1sECHeoNiF4HXyew=;
 b=qRFoLw/pun0mqOgFyNOYnYtQG1wLhEr3uqKtZjDoNW+5aagq/WUv3jH4RI8/nv81Ha
 /HNoHJdI3ndQu7M9VMM+M8oD7CfwOrwCJFjfKWNl1aN1ftFRNV1RTgew3Obd8Y9UXe+x
 llBXnNqhsqm+UCKLjmv2D2VrfO2jfWG4YepfWCUzIx9kEBjxoJjoMxjIAOAd/Lqnh6OK
 79+zs+IyA4YAvPsHiBszQ93qgAuJZeCWyV4XYfFOW4TMx8WKysLHA7iOPXDr47kb0j/K
 sF1YMCs/rVlWDon37UHQm44aMT84hC+2CkDu5bqhtyUkIl1HvSUT/a1ut8+u6ddO+TBI
 abGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xf7gfODhEHLAK19nF0i1E5avDqb1sECHeoNiF4HXyew=;
 b=Ps8FelFrvhwgim9p6yLZjEDXQZGn9xl+/CW9fi6RJKIDlHxksmrDR1SS4033IxJb5o
 XHr19keou6gxSMctP+An5Kng5L8AWFv//T0DKLveF2l/FXyyEEICigYvI1OGYGc4aYyn
 q85174OpirlP3WCNE/irynKQay/U/Gwye1dPwPeYJ6LzSRk+Jqci4YzBHQo1zDsIvjF2
 OlAEY2/lXgcpepAygcYthvXwbWJ++ljyRi9Maa+Nsqe3HsJnejsRVDHuNp7QQ1RmVJQo
 imHpxQkPk4ZpsMQdnHjR1hF3ZOowOxyPv6HABS/wa2GYBdFwvcO7wQ5VYZdzGiyI9Smd
 R31A==
X-Gm-Message-State: AOAM53242gmkQSwl1Yb7hSnF+QPxGzCSrEWuRfuPx/GfcOeKLKYglRor
 pI+3esq/qFi371jJjAS+rMYTDbtHuyBpyw==
X-Google-Smtp-Source: ABdhPJwfz47vCpLkpdF+is3yFSxYjk5JBWI8c1dSrFzCWmXyT9HIb1fTaugkpdHMIbMNWDjo2bydlQ==
X-Received: by 2002:a63:5553:: with SMTP id f19mr12828301pgm.419.1624074216535; 
 Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] linux-user: Add gen-vdso tool
Date: Fri, 18 Jun 2021 20:43:27 -0700
Message-Id: <20210619034329.532318-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

This tool will be used for post-processing the linked vdso image,
turning it into something that is easy to include into elfload.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/gen-vdso.c          | 168 ++++++++++++++++++
 linux-user/gen-vdso-elfn.c.inc | 299 +++++++++++++++++++++++++++++++++
 linux-user/meson.build         |   6 +-
 3 files changed, 472 insertions(+), 1 deletion(-)
 create mode 100644 linux-user/gen-vdso.c
 create mode 100644 linux-user/gen-vdso-elfn.c.inc

diff --git a/linux-user/gen-vdso.c b/linux-user/gen-vdso.c
new file mode 100644
index 0000000000..ccbb6c4725
--- /dev/null
+++ b/linux-user/gen-vdso.c
@@ -0,0 +1,168 @@
+/*
+ * Post-process a vdso elf image for inclusion into qemu.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdlib.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <endian.h>
+#include "elf.h"
+
+
+#define bswap_(p)  _Generic(*(p), \
+                            uint16_t: __builtin_bswap16,       \
+                            uint32_t: __builtin_bswap32,       \
+                            uint64_t: __builtin_bswap64,       \
+                            int16_t: __builtin_bswap16,        \
+                            int32_t: __builtin_bswap32,        \
+                            int64_t: __builtin_bswap64)
+#define bswaps(p) (*(p) = bswap_(p)(*(p)))
+
+static void output_reloc(FILE *outf, void *buf, void *loc)
+{
+    fprintf(outf, "    0x%08lx,\n", loc - buf);
+}
+
+#define N 32
+#define elfN(x)  elf32_##x
+#define ElfN(x)  Elf32_##x
+#include "gen-vdso-elfn.c.inc"
+#undef N
+#undef elfN
+#undef ElfN
+
+#define N 64
+#define elfN(x)  elf64_##x
+#define ElfN(x)  Elf64_##x
+#include "gen-vdso-elfn.c.inc"
+#undef N
+#undef elfN
+#undef ElfN
+
+
+int main(int ac, char **av)
+{
+    FILE *inf, *outf;
+    long total_len;
+    const char *inf_name;
+    const char *outf_name;
+    unsigned char *buf;
+    bool need_bswap;
+
+    if (ac != 3) {
+        fprintf(stderr, "usage: input-file output-file\n");
+        return EXIT_FAILURE;
+    }
+    inf_name = av[1];
+    outf_name = av[2];
+
+    /*
+     * Open the input and output files.
+     */
+    inf = fopen(inf_name, "rb");
+    if (inf == NULL) {
+        goto perror_inf;
+    }
+    outf = fopen(outf_name, "w");
+    if (outf == NULL) {
+        goto perror_outf;
+    }
+
+    /*
+     * Read the input file into a buffer.
+     * We expect the vdso to be small, on the order of one page,
+     * therefore we do not expect a partial read.
+     */
+    fseek(inf, 0, SEEK_END);
+    total_len = ftell(inf);
+    fseek(inf, 0, SEEK_SET);
+
+    buf = malloc(total_len);
+    if (buf == NULL) {
+        goto perror_inf;
+    }
+
+    errno = 0;
+    if (fread(buf, 1, total_len, inf) != total_len) {
+        if (errno) {
+            goto perror_inf;
+        }
+        fprintf(stderr, "%s: incomplete read\n", inf_name);
+        return EXIT_FAILURE;
+    }
+    fclose(inf);
+
+    /*
+     * Write out the vdso image now, before we make local changes.
+     */
+
+    fputs("/* Automatically generated from linux-user/gen-vdso.c. */\n"
+          "\n"
+          "static const uint8_t vdso_image[] = {",
+          outf);
+    for (long i = 0; i < total_len; ++i) {
+        if (i % 12 == 0) {
+            fputs("\n   ", outf);
+        }
+        fprintf(outf, " 0x%02x,", buf[i]);
+    }
+    fputs("\n};\n\n", outf);
+
+    /*
+     * Identify which elf flavor we're processing.
+     * The first 16 bytes of the file are e_ident.
+     */
+
+    if (buf[EI_MAG0] != ELFMAG0 || buf[EI_MAG1] != ELFMAG1 ||
+        buf[EI_MAG2] != ELFMAG2 || buf[EI_MAG3] != ELFMAG3) {
+        fprintf(stderr, "%s: not an elf file\n", inf_name);
+        return EXIT_FAILURE;
+    }
+    switch (buf[EI_DATA]) {
+    case ELFDATA2LSB:
+        need_bswap = BYTE_ORDER != LITTLE_ENDIAN;
+        break;
+    case ELFDATA2MSB:
+        need_bswap = BYTE_ORDER != BIG_ENDIAN;
+        break;
+    default:
+        fprintf(stderr, "%s: invalid elf EI_DATA (%u)\n",
+                inf_name, buf[EI_DATA]);
+        return EXIT_FAILURE;
+    }
+    switch (buf[EI_CLASS]) {
+    case ELFCLASS32:
+        elf32_process(outf, buf, total_len, need_bswap);
+        break;
+    case ELFCLASS64:
+        elf64_process(outf, buf, total_len, need_bswap);
+        break;
+    default:
+        fprintf(stderr, "%s: invalid elf EI_CLASS (%u)\n",
+                inf_name, buf[EI_CLASS]);
+        return EXIT_FAILURE;
+    }
+
+    /*
+     * Everything should have gone well.
+     */
+    if (fclose(outf)) {
+        goto perror_outf;
+    }
+    return EXIT_SUCCESS;
+
+ perror_inf:
+    perror(inf_name);
+    return EXIT_FAILURE;
+
+ perror_outf:
+    perror(outf_name);
+    return EXIT_FAILURE;
+}
diff --git a/linux-user/gen-vdso-elfn.c.inc b/linux-user/gen-vdso-elfn.c.inc
new file mode 100644
index 0000000000..4e9277aeff
--- /dev/null
+++ b/linux-user/gen-vdso-elfn.c.inc
@@ -0,0 +1,299 @@
+/*
+ * Post-process a vdso elf image for inclusion into qemu.
+ * Elf size specialization.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+static void elfN(bswap_ehdr)(ElfN(Ehdr) *ehdr)
+{
+    bswaps(&ehdr->e_type);            /* Object file type */
+    bswaps(&ehdr->e_machine);         /* Architecture */
+    bswaps(&ehdr->e_version);         /* Object file version */
+    bswaps(&ehdr->e_entry);           /* Entry point virtual address */
+    bswaps(&ehdr->e_phoff);           /* Program header table file offset */
+    bswaps(&ehdr->e_shoff);           /* Section header table file offset */
+    bswaps(&ehdr->e_flags);           /* Processor-specific flags */
+    bswaps(&ehdr->e_ehsize);          /* ELF header size in bytes */
+    bswaps(&ehdr->e_phentsize);       /* Program header table entry size */
+    bswaps(&ehdr->e_phnum);           /* Program header table entry count */
+    bswaps(&ehdr->e_shentsize);       /* Section header table entry size */
+    bswaps(&ehdr->e_shnum);           /* Section header table entry count */
+    bswaps(&ehdr->e_shstrndx);        /* Section header string table index */
+}
+
+static void elfN(bswap_phdr)(ElfN(Phdr) *phdr)
+{
+    bswaps(&phdr->p_type);            /* Segment type */
+    bswaps(&phdr->p_flags);           /* Segment flags */
+    bswaps(&phdr->p_offset);          /* Segment file offset */
+    bswaps(&phdr->p_vaddr);           /* Segment virtual address */
+    bswaps(&phdr->p_paddr);           /* Segment physical address */
+    bswaps(&phdr->p_filesz);          /* Segment size in file */
+    bswaps(&phdr->p_memsz);           /* Segment size in memory */
+    bswaps(&phdr->p_align);           /* Segment alignment */
+}
+
+static void elfN(bswap_shdr)(ElfN(Shdr) *shdr)
+{
+    bswaps(&shdr->sh_name);
+    bswaps(&shdr->sh_type);
+    bswaps(&shdr->sh_flags);
+    bswaps(&shdr->sh_addr);
+    bswaps(&shdr->sh_offset);
+    bswaps(&shdr->sh_size);
+    bswaps(&shdr->sh_link);
+    bswaps(&shdr->sh_info);
+    bswaps(&shdr->sh_addralign);
+    bswaps(&shdr->sh_entsize);
+}
+
+static void elfN(bswap_sym)(ElfN(Sym) *sym)
+{
+    bswaps(&sym->st_name);
+    bswaps(&sym->st_value);
+    bswaps(&sym->st_size);
+    bswaps(&sym->st_shndx);
+}
+
+static void elfN(bswap_dyn)(ElfN(Dyn) *dyn)
+{
+    bswaps(&dyn->d_tag);              /* Dynamic type tag */
+    bswaps(&dyn->d_un.d_ptr);         /* Dynamic ptr or val, in union */
+}
+
+static void elfN(process)(FILE *outf, void *buf, long total_len,
+                          bool need_bswap)
+{
+    ElfN(Ehdr) *ehdr = buf;
+    ElfN(Phdr) *phdr;
+    ElfN(Shdr) *shdr;
+    unsigned phnum, shnum;
+    unsigned dynamic_ofs = 0;
+    unsigned dynamic_addr = 0;
+    unsigned dynsym_addr = 0;
+    unsigned sigreturn_addr = 0;
+    unsigned rt_sigreturn_addr = 0;
+    unsigned first_segsz = 0;
+    int errors = 0;
+
+    if (need_bswap) {
+        elfN(bswap_ehdr)(ehdr);
+    }
+
+    phnum = ehdr->e_phnum;
+    phdr = buf + ehdr->e_phoff;
+    if (need_bswap) {
+        for (unsigned i = 0; i < phnum; ++i) {
+            elfN(bswap_phdr)(phdr + i);
+        }
+    }
+
+    shnum = ehdr->e_shnum;
+    shdr = buf + ehdr->e_shoff;
+    if (need_bswap) {
+        for (unsigned i = 0; i < shnum; ++i) {
+            elfN(bswap_shdr)(shdr + i);
+        }
+    }
+
+    /*
+     * Validate the VDSO is created as we expect: that PT_PHDR,
+     * PT_DYNAMIC, and PT_NOTE located in a writable data segment.
+     * PHDR and DYNAMIC require relocation, and NOTE will get the
+     * linux version number.
+     */
+    for (unsigned i = 0; i < phnum; ++i) {
+        if (phdr[i].p_type == PT_LOAD && phdr[i].p_vaddr == 0) {
+            if (first_segsz != 0) {
+                fprintf(stderr, "Multiple load segments covering EHDR\n");
+                errors++;
+            }
+            if (phdr[i].p_offset != 0) {
+                fprintf(stderr, "First vdso segment does not cover EHDR\n");
+                errors++;
+            }
+            if (phdr[i].p_vaddr != 0) {
+                fprintf(stderr, "First vdso segment not loaded at address 0\n");
+                errors++;
+            }
+            if ((phdr[i].p_flags & (PF_R | PF_W)) != (PF_R | PF_W)) {
+                fprintf(stderr, "First vdso segment is not read-write\n");
+                errors++;
+            }
+            first_segsz = phdr[i].p_filesz;
+            if (first_segsz < ehdr->e_phoff + phnum * sizeof(*phdr)) {
+                fprintf(stderr, "First vdso segment does not cover PHDRs\n");
+                errors++;
+            }
+        }
+    }
+    for (unsigned i = 0; i < phnum; ++i) {
+        const char *which;
+
+        switch (phdr[i].p_type) {
+        case PT_PHDR:
+            which = "PT_PHDR";
+            break;
+        case PT_NOTE:
+            which = "PT_NOTE";
+            break;
+        case PT_DYNAMIC:
+            dynamic_ofs = phdr[i].p_offset;
+            dynamic_addr = phdr[i].p_vaddr;
+            which = "PT_DYNAMIC";
+            break;
+        default:
+            continue;
+        }
+        if (first_segsz < phdr[i].p_vaddr + phdr[i].p_filesz) {
+            fprintf(stderr, "First vdso segment does not cover %s\n", which);
+            errors++;
+        }
+    }
+    if (errors) {
+        exit(EXIT_FAILURE);
+    }
+        
+    /*
+     * We need to relocate the VDSO image.  The one built into the kernel
+     * is built for a fixed address.  The one we built for QEMU is not,
+     * since that requires close control of the guest address space.
+     *
+     * ??? One might think that we'd need to relocate ehdr->e_entry,
+     * but for some reason glibc does that one itself, though that
+     * is also available via the AT_SYSINFO entry.
+     *
+     * Output relocation addresses as we go.
+     */
+    fputs("static const unsigned vdso_relocs[] = {\n", outf);
+
+    /* Relocate the program headers. */
+    for (unsigned i = 0; i < phnum; ++i) {
+        output_reloc(outf, buf, &phdr[i].p_vaddr);
+        output_reloc(outf, buf, &phdr[i].p_paddr);
+    }
+
+    /* Relocate the DYNAMIC entries. */
+    if (dynamic_addr) {
+        ElfN(Dyn) *dyn = buf + dynamic_ofs;
+        __typeof(dyn->d_tag) tag;
+
+        do {
+
+            if (need_bswap) {
+                elfN(bswap_dyn)(dyn);
+            }
+            tag = dyn->d_tag;
+
+            switch (tag) {
+            case DT_SYMTAB:
+                dynsym_addr = dyn->d_un.d_val;
+                /* fall through */
+            case DT_HASH:
+            case DT_STRTAB:
+            case DT_VERDEF:
+            case DT_VERSYM:
+            case DT_PLTGOT:
+            case DT_ADDRRNGLO ... DT_ADDRRNGHI:
+                /* These entries store an address in the entry. */
+                output_reloc(outf, buf, &dyn->d_un.d_val);
+                break;
+
+            case DT_NULL:
+            case DT_STRSZ:
+            case DT_SONAME:
+            case DT_DEBUG:
+            case DT_FLAGS:
+            case DT_FLAGS_1:
+            case DT_BIND_NOW:
+            case DT_VERDEFNUM:
+            case DT_VALRNGLO ... DT_VALRNGHI:
+                /* These entries store an integer in the entry. */
+                break;
+
+            case DT_SYMENT:
+                if (dyn->d_un.d_val != sizeof(ElfN(Sym))) {
+                    fprintf(stderr, "VDSO has incorrect dynamic symbol size\n");
+                    errors++;
+                }
+                break;
+
+            case DT_REL:
+            case DT_RELSZ:
+            case DT_RELENT:
+            case DT_RELA:
+            case DT_RELASZ:
+            case DT_RELAENT:
+            case DT_TEXTREL:
+                /*
+                 * These entries indicate that the VDSO was built incorrectly.
+                 * It should not have any real relocations.
+                 */
+                fprintf(stderr, "VDSO has dynamic relocations\n");
+                errors++;
+                break;
+
+            case DT_NEEDED:
+            case DT_VERNEED:
+            case DT_PLTREL:
+            case DT_JMPREL:
+            case DT_RPATH:
+            case DT_RUNPATH:
+                fprintf(stderr, "VDSO has external dependencies\n");
+                errors++;
+                break;
+
+            default:
+                /* This is probably something target specific. */
+                fprintf(stderr, "VDSO has unknown DYNAMIC entry (%lx)\n",
+                        (unsigned long)tag);
+                errors++;
+                break;
+            }
+            dyn++;
+        } while (tag != DT_NULL);
+        if (errors) {
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    if (dynsym_addr) {
+        __typeof(shdr->sh_size) dynsym_n = 0;
+        ElfN(Sym) *sym = NULL;
+        const char *str = NULL;
+
+        for (unsigned i = 0; i < shnum; ++i) {
+            if (shdr[i].sh_addr == dynsym_addr) {
+                dynsym_n = shdr[i].sh_size / sizeof(*sym);
+                sym = buf + shdr[i].sh_offset;
+                str = buf + shdr[shdr[i].sh_link].sh_offset;
+                break;
+            }
+        }
+
+        for (unsigned i = 0; i < dynsym_n; ++i) {
+            if (need_bswap) {
+                elfN(bswap_sym)(sym + i);
+            }
+
+            /* Relocate the dynamic symbol table. */
+            output_reloc(outf, buf, &sym[i].st_value);
+
+            /* Locate the signal return symbols. */
+            const char *name = str + sym[i].st_name;
+            if (strcmp("__kernel_sigreturn", name) == 0) {
+                sigreturn_addr = sym[i].st_value;
+            } else if (strcmp("__kernel_rt_sigreturn", name) == 0) {
+                rt_sigreturn_addr = sym[i].st_value;
+            }
+        }
+    }
+
+    fputs("};\n\n", outf);   /* end vdso_relocs. */
+
+    fprintf(outf, "#define vdso_sigreturn    0x%x\n", sigreturn_addr);
+    fprintf(outf, "#define vdso_rt_sigreturn 0x%x\n", rt_sigreturn_addr);
+}
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682..c5e6ab058b 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -18,9 +18,13 @@ linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
 linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
 linux_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING', if_true: files('semihost.c'))
 
-
 syscall_nr_generators = {}
 
+gen_vdso_exe = executable('gen-vdso', 'gen-vdso.c',
+                          native: true, build_by_default: false)
+gen_vdso = generator(gen_vdso_exe, output: '@BASENAME@.c.inc',
+                     arguments: ['@INPUT@', '@OUTPUT@'])
+
 subdir('alpha')
 subdir('arm')
 subdir('hppa')
-- 
2.25.1


