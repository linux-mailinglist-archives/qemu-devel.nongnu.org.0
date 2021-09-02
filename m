Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515203FF862
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:29:59 +0200 (CEST)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLx5i-00083n-Er
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRX-0007S9-2R
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:27 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRS-0003GW-LK
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:26 -0400
Received: by mail-io1-xd33.google.com with SMTP id q3so4709833iot.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDAbnkMdGjLZrTpijdudkrC1a7LHfb1d60bODrkxjIc=;
 b=Sn5/ljksljv+XSgEy3ZzsO7aFDccY6ieylH44yyHs1QiJh2i9A7TS6RO9761nhw0a/
 4tLBug4mmHv+3TQzr2rL0uVvvWXQ7nuDE5BR03Hq4fg0ksng9Kqg4zjXIJG2FWoDKz/d
 G0ulknAl4bBqcOxCspKAo6aYXqRaRm9onUNj6MkyMsJyCcyDIhjVigNenkPAZMcy9vUL
 A8SsPac0XgJuGOzu+dRH4njx1TSXIbsksjXdB/FCM7y5t4gIGScOke6q+dO82b/XLB3r
 srKCMz1d5KJNYIWoRHqC4INmTU6foq+LsfN1uGnG8i+3TvjxEteHWI0mwfruqlA3oLrz
 huZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDAbnkMdGjLZrTpijdudkrC1a7LHfb1d60bODrkxjIc=;
 b=lHYV0jXA3LeMYPfVbpYpxWf8vMAuxiW/QYDxxLoGEB2oiXqJjE5dNhVLTV6sbjqOUs
 sC9BPAZ2iMLu9TykNapcmcexJjnw2eVx07HCr5lI1EdQlWIQVhQCwKuJKh2zxovxqEqp
 XdkO6pGfGpiU23TDRkXKEp7dmVNP3pketn69PkTNLdLU0ms91TU/ng9Ux+t2US91h68h
 aa+LDBxbIXRKcWPxlW4R01sHDz33j/KQah9WrSRUcIOxhMrUnCWf5p8SAiKsl9I7a+VV
 jN2DhI8Mcf8YIOx6AoEGPzGSFbVSmeb1Z4O9Nk0g9yp4vi9Gjb/AXCUp33u3l4eiznez
 pLgw==
X-Gm-Message-State: AOAM532j7JbmSSm4plS9IevdEcnbmS96pFx0Bs8oesc0vtg9hik4ai8k
 qwLDQ+U5TEi+ARBGJbimV/ZR4CowN9CYpA==
X-Google-Smtp-Source: ABdhPJyzB42lVK2yorNCoTuvAMRZVcA1/5dJ5RZwPNTvFKZTvVTcJH45DCsM/5q1LGUvk+cDdtny+A==
X-Received: by 2002:a05:6602:730:: with SMTP id
 g16mr750511iox.138.1630626501288; 
 Thu, 02 Sep 2021 16:48:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:20 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 39/43] bsd-user: Refactor load_elf_sections and
 is_target_elf_binary
Date: Thu,  2 Sep 2021 17:47:25 -0600
Message-Id: <20210902234729.76141-40-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Factor out load_elf_sections and is_target_elf_binary out of
load_elf_interp.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 344 +++++++++++++++++++++------------------------
 1 file changed, 158 insertions(+), 186 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 3660961582..142a5bfac2 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -36,6 +36,8 @@ abi_ulong target_stksiz;
 abi_ulong target_stkbas;
 
 static int elf_core_dump(int signr, CPUArchState *env);
+static int load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr,
+    int fd, abi_ulong rbase, abi_ulong *baddrp);
 
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
@@ -271,16 +273,10 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
                                  abi_ulong *interp_load_addr)
 {
     struct elf_phdr *elf_phdata  =  NULL;
-    struct elf_phdr *eppnt;
-    abi_ulong load_addr = 0;
-    int load_addr_set = 0;
+    abi_ulong rbase;
     int retval;
-    abi_ulong last_bss, elf_bss;
-    abi_ulong error;
-    int i;
+    abi_ulong baddr, error;
 
-    elf_bss = 0;
-    last_bss = 0;
     error = 0;
 
     bswap_ehdr(interp_elf_ex);
@@ -325,93 +321,33 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     }
     bswap_phdr(elf_phdata, interp_elf_ex->e_phnum);
 
+    rbase = 0;
     if (interp_elf_ex->e_type == ET_DYN) {
         /*
          * In order to avoid hardcoding the interpreter load
          * address in qemu, we allocate a big enough memory zone.
          */
-        error = target_mmap(0, INTERP_MAP_SIZE, PROT_NONE,
+        rbase = target_mmap(0, INTERP_MAP_SIZE, PROT_NONE,
                 MAP_PRIVATE | MAP_ANON, -1, 0);
-        if (error == -1) {
+        if (rbase == -1) {
             perror("mmap");
             exit(-1);
         }
-        load_addr = error;
-        load_addr_set = 1;
-    }
-
-    eppnt = elf_phdata;
-    for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++)
-        if (eppnt->p_type == PT_LOAD) {
-            int elf_type = MAP_PRIVATE | MAP_DENYWRITE;
-            int elf_prot = 0;
-            abi_ulong vaddr = 0;
-            abi_ulong k;
-
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
-            if (interp_elf_ex->e_type == ET_EXEC || load_addr_set) {
-                elf_type |= MAP_FIXED;
-                vaddr = eppnt->p_vaddr;
-            }
-            error = target_mmap(load_addr + TARGET_ELF_PAGESTART(vaddr),
-                                eppnt->p_filesz + TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
-                                elf_prot,
-                                elf_type,
-                                interpreter_fd,
-                                eppnt->p_offset - TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
-
-            if (error == -1) {
-                /* Real error */
-                close(interpreter_fd);
-                free(elf_phdata);
-                return ~((abi_ulong)0UL);
-            }
-
-            if (!load_addr_set && interp_elf_ex->e_type == ET_DYN) {
-                load_addr = error;
-                load_addr_set = 1;
-            }
-
-            /*
-             * Find the end of the file  mapping for this phdr, and keep
-             * track of the largest address we see for this.
-             */
-            k = load_addr + eppnt->p_vaddr + eppnt->p_filesz;
-            if (k > elf_bss) elf_bss = k;
+    }
 
-            /*
-             * Do the same thing for the memory mapping - between
-             * elf_bss and last_bss is the bss section.
-             */
-            k = load_addr + eppnt->p_memsz + eppnt->p_vaddr;
-            if (k > last_bss) last_bss = k;
-        }
+    error = load_elf_sections(interp_elf_ex, elf_phdata, interpreter_fd, rbase,
+        &baddr);
+    if (error != 0) {
+        perror("load_elf_sections");
+        exit(-1);
+    }
 
     /* Now use mmap to map the library into memory. */
-
     close(interpreter_fd);
-
-    /*
-     * Now fill out the bss section.  First pad the last page up
-     * to the page boundary, and then perform a mmap to make sure
-     * that there are zeromapped pages up to and including the last
-     * bss page.
-     */
-    padzero(elf_bss, last_bss);
-    elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1); /* What we have mapped so far */
-
-    /* Map the last of the bss segment */
-    if (last_bss > elf_bss) {
-        target_mmap(elf_bss, last_bss - elf_bss,
-                    PROT_READ | PROT_WRITE | PROT_EXEC,
-                    MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
-    }
     free(elf_phdata);
 
-    *interp_load_addr = load_addr;
-    return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
+    *interp_load_addr = baddr;
+    return ((abi_ulong) interp_elf_ex->e_entry) + rbase;
 }
 
 static int symfind(const void *s0, const void *s1)
@@ -521,6 +457,10 @@ found:
             }
             continue;
         }
+#if defined(TARGET_ARM) || defined(TARGET_MIPS)
+        /* The bottom address bit marks a Thumb or MIPS16 symbol.  */
+        syms[i].st_value &= ~(target_ulong)1;
+#endif
         i++;
     }
 
@@ -560,26 +500,119 @@ found:
     syminfos = s;
 }
 
+/* Check the elf header and see if this a target elf binary. */
+int is_target_elf_binary(int fd)
+{
+    uint8_t buf[128];
+    struct elfhdr elf_ex;
+
+    if (lseek(fd, 0L, SEEK_SET) < 0) {
+        return 0;
+    }
+    if (read(fd, buf, sizeof(buf)) < 0) {
+        return 0;
+    }
+
+    elf_ex = *((struct elfhdr *)buf);
+    bswap_ehdr(&elf_ex);
+
+    if ((elf_ex.e_type != ET_EXEC && elf_ex.e_type != ET_DYN) ||
+        (!elf_check_arch(elf_ex.e_machine))) {
+        return 0;
+    } else {
+        return 1;
+    }
+}
+
+static int
+load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr, int fd,
+    abi_ulong rbase, abi_ulong *baddrp)
+{
+    struct elf_phdr *elf_ppnt;
+    abi_ulong baddr;
+    int i;
+    bool first;
+
+    /*
+     * Now we do a little grungy work by mmaping the ELF image into
+     * the correct location in memory.  At this point, we assume that
+     * the image should be loaded at fixed address, not at a variable
+     * address.
+     */
+    first = true;
+    for (i = 0, elf_ppnt = phdr; i < hdr->e_phnum; i++, elf_ppnt++) {
+        int elf_prot = 0;
+        abi_ulong error;
+
+        /* XXX Skip memsz == 0. */
+        if (elf_ppnt->p_type != PT_LOAD) {
+            continue;
+        }
+
+        if (elf_ppnt->p_flags & PF_R) {
+            elf_prot |= PROT_READ;
+        }
+        if (elf_ppnt->p_flags & PF_W) {
+            elf_prot |= PROT_WRITE;
+        }
+        if (elf_ppnt->p_flags & PF_X) {
+            elf_prot |= PROT_EXEC;
+        }
+
+        error = target_mmap(TARGET_ELF_PAGESTART(rbase + elf_ppnt->p_vaddr),
+                            (elf_ppnt->p_filesz +
+                             TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)),
+                            elf_prot,
+                            (MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE),
+                            fd,
+                            (elf_ppnt->p_offset -
+                             TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)));
+        if (error == -1) {
+            perror("mmap");
+            exit(-1);
+        } else if (elf_ppnt->p_memsz != elf_ppnt->p_filesz) {
+            abi_ulong start_bss, end_bss;
+
+            start_bss = rbase + elf_ppnt->p_vaddr + elf_ppnt->p_filesz;
+            end_bss = rbase + elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
+
+            /*
+             * Calling set_brk effectively mmaps the pages that we need for the
+             * bss and break sections.
+             */
+            set_brk(start_bss, end_bss);
+            padzero(start_bss, end_bss);
+        }
+
+        if (first) {
+            baddr = TARGET_ELF_PAGESTART(rbase + elf_ppnt->p_vaddr);
+            first = false;
+        }
+    }
+
+    if (baddrp != NULL) {
+        *baddrp = baddr;
+    }
+    return 0;
+}
+
 int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info)
 {
     struct elfhdr elf_ex;
     struct elfhdr interp_elf_ex;
     int interpreter_fd = -1; /* avoid warning */
-    abi_ulong load_addr, load_bias;
-    int load_addr_set = 0;
+    abi_ulong load_addr;
     int i;
-    struct elf_phdr * elf_ppnt;
+    struct elf_phdr *elf_ppnt;
     struct elf_phdr *elf_phdata;
-    abi_ulong elf_bss, k, elf_brk;
-    int retval;
-    char * elf_interpreter;
-    abi_ulong elf_entry, interp_load_addr = 0;
-    abi_ulong start_code, end_code, start_data, end_data;
+    abi_ulong elf_brk;
+    int error, retval;
+    char *elf_interpreter;
+    abi_ulong baddr, elf_entry, et_dyn_addr, interp_load_addr = 0;
     abi_ulong reloc_func_desc = 0;
 
     load_addr = 0;
-    load_bias = 0;
     elf_ex = *((struct elfhdr *) bprm->buf);          /* exec-header */
     bswap_ehdr(&elf_ex);
 
@@ -618,16 +651,10 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     bswap_phdr(elf_phdata, elf_ex.e_phnum);
     elf_ppnt = elf_phdata;
 
-    elf_bss = 0;
     elf_brk = 0;
 
 
     elf_interpreter = NULL;
-    start_code = ~((abi_ulong)0UL);
-    end_code = 0;
-    start_data = 0;
-    end_data = 0;
-
     for (i = 0; i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
             if (elf_interpreter != NULL) {
@@ -714,94 +741,45 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     info->mmap = 0;
     elf_entry = (abi_ulong) elf_ex.e_entry;
 
-    /* Do this so that we can load the interpreter, if need be.  We will
-       change some of these later */
+    /* XXX Join this with PT_INTERP search? */
+    baddr = 0;
+    for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum; i++, elf_ppnt++) {
+        if (elf_ppnt->p_type != PT_LOAD) {
+            continue;
+        }
+        baddr = elf_ppnt->p_vaddr;
+        break;
+    }
+
+    et_dyn_addr = 0;
+    if (elf_ex.e_type == ET_DYN && baddr == 0) {
+        et_dyn_addr = ELF_ET_DYN_LOAD_ADDR;
+    }
+
+    /*
+     * Do this so that we can load the interpreter, if need be.  We will
+     * change some of these later
+     */
     info->rss = 0;
     setup_arg_pages(bprm, info, &bprm->p, &bprm->stringp);
     info->start_stack = bprm->p;
 
-    /* Now we do a little grungy work by mmaping the ELF image into
-     * the correct location in memory.  At this point, we assume that
-     * the image should be loaded at fixed address, not at a variable
-     * address.
-     */
+    info->elf_flags = elf_ex.e_flags;
 
+    error = load_elf_sections(&elf_ex, elf_phdata, bprm->fd, et_dyn_addr,
+        &load_addr);
     for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum; i++, elf_ppnt++) {
-        int elf_prot = 0;
-        int elf_flags = 0;
-        abi_ulong error;
-
-        if (elf_ppnt->p_type != PT_LOAD)
+        if (elf_ppnt->p_type != PT_LOAD) {
             continue;
-
-        if (elf_ppnt->p_flags & PF_R) elf_prot |= PROT_READ;
-        if (elf_ppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-        if (elf_ppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
-        elf_flags = MAP_PRIVATE | MAP_DENYWRITE;
-        if (elf_ex.e_type == ET_EXEC || load_addr_set) {
-            elf_flags |= MAP_FIXED;
-        } else if (elf_ex.e_type == ET_DYN) {
-            /* Try and get dynamic programs out of the way of the default mmap
-               base, as well as whatever program they might try to exec.  This
-               is because the brk will follow the loader, and is not movable.  */
-            /* NOTE: for qemu, we do a big mmap to get enough space
-               without hardcoding any address */
-            error = target_mmap(0, ET_DYN_MAP_SIZE,
-                                PROT_NONE, MAP_PRIVATE | MAP_ANON,
-                                -1, 0);
-            if (error == -1) {
-                perror("mmap");
-                exit(-1);
-            }
-            load_bias = TARGET_ELF_PAGESTART(error - elf_ppnt->p_vaddr);
         }
-
-        error = target_mmap(TARGET_ELF_PAGESTART(load_bias + elf_ppnt->p_vaddr),
-                            (elf_ppnt->p_filesz +
-                             TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)),
-                            elf_prot,
-                            (MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE),
-                            bprm->fd,
-                            (elf_ppnt->p_offset -
-                             TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)));
-        if (error == -1) {
-            perror("mmap");
-            exit(-1);
-        }
-
-        if (!load_addr_set) {
-            load_addr_set = 1;
-            load_addr = elf_ppnt->p_vaddr - elf_ppnt->p_offset;
-            if (elf_ex.e_type == ET_DYN) {
-                load_bias += error -
-                    TARGET_ELF_PAGESTART(load_bias + elf_ppnt->p_vaddr);
-                load_addr += load_bias;
-                reloc_func_desc = load_bias;
-            }
-        }
-        k = elf_ppnt->p_vaddr;
-        if (k < start_code)
-            start_code = k;
-        if (start_data < k)
-            start_data = k;
-        k = elf_ppnt->p_vaddr + elf_ppnt->p_filesz;
-        if (k > elf_bss)
-            elf_bss = k;
-        if ((elf_ppnt->p_flags & PF_X) && end_code <  k)
-            end_code = k;
-        if (end_data < k)
-            end_data = k;
-        k = elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
-        if (k > elf_brk) elf_brk = k;
-    }
-
-    elf_entry += load_bias;
-    elf_bss += load_bias;
-    elf_brk += load_bias;
-    start_code += load_bias;
-    end_code += load_bias;
-    start_data += load_bias;
-    end_data += load_bias;
+        if (elf_ppnt->p_memsz > elf_ppnt->p_filesz)
+            elf_brk = MAX(elf_brk, et_dyn_addr + elf_ppnt->p_vaddr +
+                elf_ppnt->p_memsz);
+    }
+    if (error != 0) {
+        perror("load_elf_sections");
+        exit(-1);
+    }
 
     if (elf_interpreter) {
         elf_entry = load_elf_interp(&interp_elf_ex, interpreter_fd,
@@ -817,6 +795,9 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
             exit(-1);
             return 0;
         }
+    } else {
+        interp_load_addr = et_dyn_addr;
+        elf_entry += interp_load_addr;
     }
 
     free(elf_phdata);
@@ -829,20 +810,11 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     bprm->p = target_create_elf_tables(bprm->p, bprm->argc, bprm->envc,
                                        bprm->stringp, &elf_ex, load_addr,
-                                       load_bias, interp_load_addr, info);
+                                       et_dyn_addr, interp_load_addr, info);
     info->load_addr = reloc_func_desc;
     info->start_brk = info->brk = elf_brk;
-    info->end_code = end_code;
-    info->start_code = start_code;
-    info->start_data = start_data;
-    info->end_data = end_data;
     info->start_stack = bprm->p;
-
-    /* Calling set_brk effectively mmaps the pages that we need for the bss and break
-       sections */
-    set_brk(elf_bss, elf_brk);
-
-    padzero(elf_bss, elf_brk);
+    info->load_bias = 0;
 
     info->entry = elf_entry;
 
-- 
2.32.0


