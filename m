Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4878E339F26
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:40:19 +0100 (CET)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7JK-0003eu-8U
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7Gz-0002Bg-7l
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:37:53 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7Gx-00078t-D0
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:37:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id e10so6433813wro.12
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rnIQur47bUqEW0oQ7uZPNdfpmlBj++ZpXvn5yiPVOw=;
 b=Jj0Ws3ZmjTnUnaoS6kEuwxVtN7cLiHKUISvPltNZfERuZKsC1f6MKe7fcH2fU8nDiR
 o67/SsykaPONvIRs2CGD6GEAPxqaLQ4KUUzlwCv+QrEGSPYTqrZxRKajMjh3WisDcAaN
 FyGB/+R30NL/3nQ7c1zn/Eb22CR1CMaqOqYbVji6SkBrs/HvZlAqOCUbmuz7VsbWqBKZ
 aFn7p3wU1HqvEkiIhggKYjseX7OFWaLPBJG3RZSrSfL8EUiFGrNyd2W+JNDKef/qcOvC
 QSyk94OERGbnBAKPye6LHYeyr2R8boPo4ZYAhqV2voQbl2hV+fWq4q8kxmAunj1lKzxb
 Hx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2rnIQur47bUqEW0oQ7uZPNdfpmlBj++ZpXvn5yiPVOw=;
 b=Tk9nOiYXkdy7jdHZE/7HAcG4aVJ1QgDCK6mnmqDyoTsHRrBQtVAA4yKRGOluyUVlAy
 rDy3PsC7e9nwftDjwNlsVYtHjji06Dq4q5EX+ykALviA+s/vIRj0S88PK24dVuIrORkE
 B3PKfoTapEdi5FEu/V/osaon/T3VHoRI216/NLaxC9052vssaoJawc3iergEg+ieCsDA
 39tnpqZvcq5gBel2BOS945P4TwW+kYaoYNphebqth3IlIvhHlBIQAsloPQ1/oQJUYu57
 ZG2L0v571uaHt/i1BBXrD0c6WV9v8u3pnkACDx2wx/WAkfnF7xWbwwEzii7XPQzaU8px
 6Wjw==
X-Gm-Message-State: AOAM530izBPxnmugRHVOndhCVP64Tp9h0I6qMmGDiIjlg6Obu6C/elXO
 9mPjBMHLBS4ipI4eBOUc6lqWo0eLd/A=
X-Google-Smtp-Source: ABdhPJwTOjWprdyD+7yxQjG1OA2o4z1dtWCQTMx6G/tsgRlgD48Fmz6LJWqYveYW76e1RZN10gegUg==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr19253455wrt.80.1615653469668; 
 Sat, 13 Mar 2021 08:37:49 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:37:49 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] bsd-user/elfload.c: Replaced calls to malloc/free with
 GLib variants
Date: Sat, 13 Mar 2021 18:36:45 +0200
Message-Id: <20210313163653.37089-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced the calls to malloc(), realloc(), and free() to their
equivalents in GLib's allocation functions in various places.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 bsd-user/elfload.c | 74 +++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 5f4d824d78..7b0793693b 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -867,8 +867,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
         if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
             return ~(abi_ulong)0UL;
 
-        elf_phdata =  (struct elf_phdr *)
-                malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
+        elf_phdata = g_try_new(struct elf_phdr, interp_elf_ex->ephnum)
 
         if (!elf_phdata)
           return ~((abi_ulong)0UL);
@@ -878,7 +877,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
          * we will be doing the wrong thing.
          */
         if (interp_elf_ex->e_phentsize != sizeof(struct elf_phdr)) {
-            free(elf_phdata);
+            g_free(elf_phdata);
             return ~((abi_ulong)0UL);
         }
 
@@ -891,7 +890,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
         if (retval < 0) {
                 perror("load_elf_interp");
                 exit(-1);
-                free (elf_phdata);
+                g_free(elf_phdata);
                 return retval;
         }
 #ifdef BSWAP_NEEDED
@@ -940,7 +939,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
             if (error == -1) {
               /* Real error */
               close(interpreter_fd);
-              free(elf_phdata);
+              g_free(elf_phdata);
               return ~((abi_ulong)0UL);
             }
 
@@ -983,7 +982,7 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
                         PROT_READ|PROT_WRITE|PROT_EXEC,
                         MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
         }
-        free(elf_phdata);
+        g_free(elf_phdata);
 
         *interp_load_addr = load_addr;
         return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
@@ -1064,24 +1063,24 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
  found:
     /* Now know where the strtab and symtab are.  Snarf them. */
-    s = malloc(sizeof(*s));
-    syms = malloc(symtab.sh_size);
+    s = g_try_malloc(sizeof(*s));
+    syms = g_try_malloc(symtab.sh_size);
     if (!syms) {
-        free(s);
+        g_free(s);
         return;
     }
-    s->disas_strtab = strings = malloc(strtab.sh_size);
+    s->disas_strtab = strings = g_malloc(strtab.sh_size);
     if (!s->disas_strtab) {
-        free(s);
-        free(syms);
+        g_free(s);
+        g_free(syms);
         return;
     }
 
     lseek(fd, symtab.sh_offset, SEEK_SET);
     if (read(fd, syms, symtab.sh_size) != symtab.sh_size) {
-        free(s);
-        free(syms);
-        free(strings);
+        g_free(s);
+        g_free(syms);
+        g_free(strings);
         return;
     }
 
@@ -1113,11 +1112,11 @@ static void load_symbols(struct elfhdr *hdr, int fd)
         that we threw away.  Whether or not this has any effect on the
         memory allocation depends on the malloc implementation and how
         many symbols we managed to discard. */
-    new_syms = realloc(syms, nsyms * sizeof(*syms));
+    new_syms = g_try_realloc(syms, nsyms * sizeof(*syms));
     if (new_syms == NULL) {
-        free(s);
-        free(syms);
-        free(strings);
+        g_free(s);
+        g_free(syms);
+        g_free(strings);
         return;
     }
     syms = new_syms;
@@ -1126,9 +1125,9 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
     lseek(fd, strtab.sh_offset, SEEK_SET);
     if (read(fd, strings, strtab.sh_size) != strtab.sh_size) {
-        free(s);
-        free(syms);
-        free(strings);
+        g_free(s);
+        g_free(syms);
+        g_free(strings);
         return;
     }
     s->disas_num_syms = nsyms;
@@ -1190,7 +1189,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     }
 
     /* Now read in all of the header information */
-    elf_phdata = (struct elf_phdr *)malloc(elf_ex.e_phentsize*elf_ex.e_phnum);
+    elf_phdata =
+        (struct elf_phdr *)g_try_malloc(elf_ex.e_phentsizei * elf_ex.e_phnum);
     if (elf_phdata == NULL) {
         return -ENOMEM;
     }
@@ -1204,7 +1204,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     if (retval < 0) {
         perror("load_elf_binary");
         exit(-1);
-        free (elf_phdata);
+        g_free(elf_phdata);
         return -errno;
     }
 
@@ -1231,8 +1231,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
         if (elf_ppnt->p_type == PT_INTERP) {
             if ( elf_interpreter != NULL )
             {
-                free (elf_phdata);
-                free(elf_interpreter);
+                g_free(elf_phdata);
+                g_free(elf_interpreter);
                 close(bprm->fd);
                 return -EINVAL;
             }
@@ -1242,10 +1242,10 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
              * is an a.out format binary
              */
 
-            elf_interpreter = (char *)malloc(elf_ppnt->p_filesz);
+            elf_interpreter = (char *)g_try_malloc(elf_ppnt->p_filesz);
 
             if (elf_interpreter == NULL) {
-                free (elf_phdata);
+                g_free(elf_phdata);
                 close(bprm->fd);
                 return -ENOMEM;
             }
@@ -1298,8 +1298,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
             if (retval < 0) {
                 perror("load_elf_binary3");
                 exit(-1);
-                free (elf_phdata);
-                free(elf_interpreter);
+                g_free(elf_phdata);
+                g_free(elf_interpreter);
                 close(bprm->fd);
                 return retval;
             }
@@ -1323,8 +1323,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
         }
 
         if (!interpreter_type) {
-            free(elf_interpreter);
-            free(elf_phdata);
+            g_free(elf_interpreter);
+            g_free(elf_phdata);
             close(bprm->fd);
             return -ELIBBAD;
         }
@@ -1346,8 +1346,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
             }
         }
         if (!bprm->p) {
-            free(elf_interpreter);
-            free (elf_phdata);
+            g_free(elf_interpreter);
+            g_free(elf_phdata);
             close(bprm->fd);
             return -E2BIG;
         }
@@ -1486,17 +1486,17 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
         reloc_func_desc = interp_load_addr;
 
         close(interpreter_fd);
-        free(elf_interpreter);
+        g_free(elf_interpreter);
 
         if (elf_entry == ~((abi_ulong)0UL)) {
             printf("Unable to load interpreter\n");
-            free(elf_phdata);
+            g_free(elf_phdata);
             exit(-1);
             return 0;
         }
     }
 
-    free(elf_phdata);
+    g_free(elf_phdata);
 
     if (qemu_log_enabled())
         load_symbols(&elf_ex, bprm->fd);
-- 
2.25.1


