Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FC3E3737
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:50:16 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUCt-0001CD-NJ
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU60-0006nZ-20
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:08 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5y-0004p9-1V
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:07 -0400
Received: by mail-io1-xd2b.google.com with SMTP id y1so19935143iod.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vp5f7S90DTvEQ1BO9I5cNE8X1x32WxFaXNsHwFc0TRw=;
 b=HG5ocVKcCBfbbC3r/ly/NamjNG4VNNQu/1SWt7Fl+4a91CCK/LZUuio1lLatWqkkhL
 XEzDptcnlnuE8DN05ikSRQMABunjrl06ntjd1RyMjXfNpAIrQUpYAuObdms94SGJPExf
 TjE4Q2XBWU+iPYdAeTQUui+PV//cbVgnan/5qyB8mClQA8lK6hMqcxbxXS0LhWB+cWMU
 Uw9W49d0qcl9KVlGRJJxOKw0skh7jU4FL4jrzAJnAFbklCS3GCKSIxKDE+8eXAivEn9U
 5MP2Tvuz/qAvPfTvWo/GjycXOCAhIaPYTc/tvTZQjom6W4y3K5cBLPpG4Xn3b70/ISjR
 12xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vp5f7S90DTvEQ1BO9I5cNE8X1x32WxFaXNsHwFc0TRw=;
 b=YNH/IbQ6bREqQOzb5P7XgyLTVKNwAjxGgDW0WWc+Y5IziR8kw0UDrLmzj5nGI9k8oc
 h0NP5M1sTaSbuQYeS1HilJDB4a9otRrtEGZTsWEiBLDVeJN78bwLnXMNqezaO2wFhDA9
 sqPuSlYWHCkz2roTtK3Wd6D1te9aeWggYS1qWIFNGNI6fo15zDWhaQ42Mu/lZyWtlcUg
 7HJlu/QwxJLHvmqN/QGFCkc599kte2QgVVatZWPEBet/whiRp3WGnG/iGvo6/mMsM7aG
 r2qq3bFNGOYWYX9GwvUsI/8Dg21VM0eGKB2kmOZYXfGnfD/p0iykT8glS/Kszq1nzzpr
 ShdA==
X-Gm-Message-State: AOAM533/wKxEelVD5RAWpGCCoSSV+c8XHQ37QCumOOdS4nLiNL3oSyY5
 L0MaQ2yv8F412XkF7e0SOS64ENJ/RoJIl1ol
X-Google-Smtp-Source: ABdhPJxsrE5rjtxkYfM9FfEu3bTOaKGs7F4aDF4n8+geBj0JeRwiHW/q8JcIIiW+d9qtLnk3LYWdqg==
X-Received: by 2002:a92:1e10:: with SMTP id e16mr211808ile.266.1628372584780; 
 Sat, 07 Aug 2021 14:43:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 14/49] bsd-user: remove a.out support
Date: Sat,  7 Aug 2021 15:42:07 -0600
Message-Id: <20210807214242.82385-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove still-born a.out support. The BSDs switched from a.out to ELF 20+ years
ago. It's out of scope for bsd-user, and what little support there was would
simply wind up at a not-implemented message. Simplify the whole mess by removing
it entirely. Should future support be required, it would be better to start from
scratch.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c |   9 +---
 bsd-user/elfload.c | 105 ++++++++-------------------------------------
 bsd-user/qemu.h    |   2 +-
 3 files changed, 21 insertions(+), 95 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index f8030d72bc..df81e36d88 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -98,7 +98,7 @@ static int prepare_binprm(struct bsd_binprm *bprm)
 
 /* Construct the envp and argv tables on the target stack.  */
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
-                              abi_ulong stringp, int push_ptr)
+                              abi_ulong stringp)
 {
     int n = sizeof(abi_ulong);
     abi_ulong envp;
@@ -108,13 +108,6 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     envp = sp;
     sp -= (argc + 1) * n;
     argv = sp;
-    if (push_ptr) {
-        /* FIXME - handle put_user() failures */
-        sp -= n;
-        put_user_ual(envp, sp);
-        sp -= n;
-        put_user_ual(argv, sp);
-    }
     sp -= n;
     /* FIXME - handle put_user() failures */
     put_user_ual(argc, sp);
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index e950732978..9c34e2ffcb 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -52,25 +52,6 @@
 
 #include "elf.h"
 
-struct exec
-{
-  unsigned int a_info;   /* Use macros N_MAGIC, etc for access */
-  unsigned int a_text;   /* length of text, in bytes */
-  unsigned int a_data;   /* length of data, in bytes */
-  unsigned int a_bss;    /* length of uninitialized data area, in bytes */
-  unsigned int a_syms;   /* length of symbol table data in file, in bytes */
-  unsigned int a_entry;  /* start address */
-  unsigned int a_trsize; /* length of relocation info for text, in bytes */
-  unsigned int a_drsize; /* length of relocation info for data, in bytes */
-};
-
-
-#define N_MAGIC(exec) ((exec).a_info & 0xffff)
-#define OMAGIC 0407
-#define NMAGIC 0410
-#define ZMAGIC 0413
-#define QMAGIC 0314
-
 /* max code+data+bss space allocated to elf interpreter */
 #define INTERP_MAP_SIZE (32 * 1024 * 1024)
 
@@ -82,10 +63,6 @@ struct exec
 #define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
 
-#define INTERPRETER_NONE 0
-#define INTERPRETER_AOUT 1
-#define INTERPRETER_ELF 2
-
 #define DLINFO_ITEMS 12
 
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
@@ -93,8 +70,6 @@ static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
         memcpy(to, from, n);
 }
 
-static int load_aout_interp(void *exptr, int interp_fd);
-
 #ifdef BSWAP_NEEDED
 static void bswap_ehdr(struct elfhdr *ehdr)
 {
@@ -300,7 +275,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
                                    struct elfhdr * exec,
                                    abi_ulong load_addr,
                                    abi_ulong load_bias,
-                                   abi_ulong interp_load_addr, int ibcs,
+                                   abi_ulong interp_load_addr,
                                    struct image_info *info)
 {
         abi_ulong sp;
@@ -330,7 +305,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         size += DLINFO_ARCH_ITEMS * 2;
 #endif
         size += envc + argc + 2;
-        size += (!ibcs ? 3 : 1);        /* argc itself */
+        size += 1;        /* argc itself */
         size *= n;
         if (size & 15)
                 sp -= 16 - (size & 15);
@@ -370,7 +345,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #endif
 #undef NEW_AUX_ENT
 
-        sp = loader_build_argptr(envc, argc, sp, p, !ibcs);
+        sp = loader_build_argptr(envc, argc, sp, p);
         return sp;
 }
 
@@ -432,7 +407,7 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     if (retval < 0) {
         perror("load_elf_interp");
         exit(-1);
-        free (elf_phdata);
+        free(elf_phdata);
         return retval;
     }
 #ifdef BSWAP_NEEDED
@@ -685,11 +660,9 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 {
     struct elfhdr elf_ex;
     struct elfhdr interp_elf_ex;
-    struct exec interp_ex;
     int interpreter_fd = -1; /* avoid warning */
     abi_ulong load_addr, load_bias;
     int load_addr_set = 0;
-    unsigned int interpreter_type = INTERPRETER_NONE;
     int i;
     struct elf_phdr * elf_ppnt;
     struct elf_phdr *elf_phdata;
@@ -702,7 +675,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 #ifdef LOW_ELF_STACK
     abi_ulong elf_stack = ~((abi_ulong)0UL);
 #endif
-    char passed_fileno[6];
 
     load_addr = 0;
     load_bias = 0;
@@ -760,7 +732,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     end_code = 0;
     start_data = 0;
     end_data = 0;
-    interp_ex.a_info = 0;
 
     for (i = 0;i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
@@ -813,7 +784,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                 }
             }
             if (retval >= 0) {
-                interp_ex = *((struct exec *) bprm->buf); /* aout exec-header */
                 interp_elf_ex = *((struct elfhdr *) bprm->buf); /* elf exec-header */
             }
             if (retval < 0) {
@@ -830,20 +800,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     /* Some simple consistency checks for the interpreter */
     if (elf_interpreter) {
-        interpreter_type = INTERPRETER_ELF | INTERPRETER_AOUT;
-
-        /* Now figure out which format our binary is */
-        if ((N_MAGIC(interp_ex) != OMAGIC) && (N_MAGIC(interp_ex) != ZMAGIC) &&
-                (N_MAGIC(interp_ex) != QMAGIC)) {
-            interpreter_type = INTERPRETER_ELF;
-        }
-
         if (interp_elf_ex.e_ident[0] != 0x7f ||
-                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF", 3) != 0) {
-            interpreter_type &= ~INTERPRETER_ELF;
-        }
-
-        if (!interpreter_type) {
+            strncmp((char *)&interp_elf_ex.e_ident[1], "ELF",3) != 0) {
             free(elf_interpreter);
             free(elf_phdata);
             close(bprm->fd);
@@ -854,24 +812,11 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     /* OK, we are done with that, now set up the arg stuff,
        and then start this sucker up */
 
-    {
-        char *passed_p;
-
-        if (interpreter_type == INTERPRETER_AOUT) {
-            snprintf(passed_fileno, sizeof(passed_fileno), "%d", bprm->fd);
-            passed_p = passed_fileno;
-
-            if (elf_interpreter) {
-                bprm->p = copy_elf_strings(1, &passed_p, bprm->page, bprm->p);
-                bprm->argc++;
-            }
-        }
-        if (!bprm->p) {
-            free(elf_interpreter);
-            free(elf_phdata);
-            close(bprm->fd);
-            return -E2BIG;
-        }
+    if (!bprm->p) {
+        free(elf_interpreter);
+        free(elf_phdata);
+        close(bprm->fd);
+        return -E2BIG;
     }
 
     /* OK, This is the point of no return */
@@ -997,13 +942,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     end_data += load_bias;
 
     if (elf_interpreter) {
-        if (interpreter_type & 1) {
-            elf_entry = load_aout_interp(&interp_ex, interpreter_fd);
-        }
-        else if (interpreter_type & 2) {
-            elf_entry = load_elf_interp(&interp_elf_ex, interpreter_fd,
-                                            &interp_load_addr);
-        }
+        elf_entry = load_elf_interp(&interp_elf_ex, interpreter_fd,
+                                    &interp_load_addr);
         reloc_func_desc = interp_load_addr;
 
         close(interpreter_fd);
@@ -1022,19 +962,18 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     if (qemu_log_enabled())
         load_symbols(&elf_ex, bprm->fd);
 
-    if (interpreter_type != INTERPRETER_AOUT) close(bprm->fd);
+    close(bprm->fd);
 
 #ifdef LOW_ELF_STACK
     info->start_stack = bprm->p = elf_stack - 4;
 #endif
     bprm->p = create_elf_tables(bprm->p,
-                    bprm->argc,
-                    bprm->envc,
-                    &elf_ex,
-                    load_addr, load_bias,
-                    interp_load_addr,
-                    (interpreter_type == INTERPRETER_AOUT ? 0 : 1),
-                    info);
+                                bprm->argc,
+                                bprm->envc,
+                                &elf_ex,
+                                load_addr, load_bias,
+                                interp_load_addr,
+                                info);
     info->load_addr = reloc_func_desc;
     info->start_brk = info->brk = elf_brk;
     info->end_code = end_code;
@@ -1063,12 +1002,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     return 0;
 }
 
-static int load_aout_interp(void *exptr, int interp_fd)
-{
-    printf("a.out interpreter not yet supported\n");
-    return(0);
-}
-
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
     init_thread(regs, infop);
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e85c164bab..d1ab58a8eb 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -129,7 +129,7 @@ struct bsd_binprm {
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
-                              abi_ulong stringp, int push_ptr);
+                              abi_ulong stringp);
 int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm);
-- 
2.32.0


