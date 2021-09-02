Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE783FF848
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:12:08 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwoQ-0008T0-US
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRO-00077o-OH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRK-00038h-Lk
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: by mail-il1-x130.google.com with SMTP id v2so3548758ilg.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlyjnJt918zmHi2AK+JxK9solTsqODGX86tuiAE6kG4=;
 b=lp45bB/yJLEB4pQrJTsZE2n9JOue5pFTq9apQdzoQGkPpqOHih501M1tDtzMb516CO
 PGDaSqeE7n2wizQSRhK/82v0x6lXx0dlLkuU37zhi4SCe0FvWZpfwRf09slxbk0t+YAN
 THpY3befb4esL/KqAn2bd7UMGN3DbUWpLGEOL2Er/9pwwGBP5wpOIGbV85f4+ElJtPKV
 SpqFOS5mm7RY818gejhmivDxKdoHGer6nXYeUZaAfPwGiJmCvB92CteSdxUeEp4QoAFK
 Y4HG/hUWUzQYdE7cuJupkU7g4yLHYBGxoW3/HPPapytqj3/B2HcYEfgw183P1v9BXjNO
 5ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JlyjnJt918zmHi2AK+JxK9solTsqODGX86tuiAE6kG4=;
 b=Oav/fb8EORmWJoxy2+eHxqurW24JlhK/VDhyvOFsxtDiXlogBO3J0BRRM7SZI0tHws
 76qXw4gGvnhx8Uz6YWcW2F6aGVdAqSdrSPzP+9A142gU6YI9/swbvZkaZ9CDRfu62bkw
 qLc0su5+FJqEvrprfQFYDH0hIUI8qbrN1A+fE3nMxdl9CjhZQCZ+ETxDOLmmfeCej52Q
 xs393BnufsECXRpv80ZNEbP20NhTU9Hvc6Z0Q+6uyZHWU8PYfOShSN9RZep4NLAsERY9
 R8QMOlezEkeBzHEAhPZnPCso0YkRojslo3pC4D3XhieyxcSxWOwXDzRMSOxHdKeINObx
 /2+Q==
X-Gm-Message-State: AOAM532Z0KrIOmVJHa7aiQDytRBHR00frKTKfjiEXa7c7XVQOE5lFyh4
 WGuroCqCDU9Qb2fFXF5r4wneaG3YVUNa+8Sc
X-Google-Smtp-Source: ABdhPJzos4uboRc3lmEwpRSdZ+VaLTLl7VENiupoErvSXe36j0Hji0jdTdDzp3GPmUVeRYsPu4tFxg==
X-Received: by 2002:a92:2e0d:: with SMTP id v13mr514152ile.111.1630626492581; 
 Thu, 02 Sep 2021 16:48:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:11 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/43] bsd-user: elf cleanup
Date: Thu,  2 Sep 2021 17:47:16 -0600
Message-Id: <20210902234729.76141-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, Justin Hibbits <chmeeedalf@gmail.com>,
 Alexander Kabaev <kan@FreeBSD.ORG>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move OS-dependent defines into target_os_elf.h. Move the architectural
dependent stuff into target_arch_elf.h. Adjust elfload.c to use
target_create_elf_tables instead of create_elf_tables.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
Signed-off-by: Alexander Kabaev <kan@FreeBSD.ORG>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c               | 191 ++++---------------------------
 bsd-user/freebsd/target_os_elf.h | 137 ++++++++++++++++++++++
 bsd-user/netbsd/target_os_elf.h  | 146 +++++++++++++++++++++++
 bsd-user/openbsd/target_os_elf.h | 146 +++++++++++++++++++++++
 bsd-user/qemu.h                  |   1 +
 5 files changed, 454 insertions(+), 167 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_elf.h
 create mode 100644 bsd-user/netbsd/target_os_elf.h
 create mode 100644 bsd-user/openbsd/target_os_elf.h

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 59465b71d4..6156f9775d 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -23,48 +23,17 @@
 #include "disas/disas.h"
 #include "qemu/path.h"
 
-#include "target_arch_elf.h"
-#include "target_os_thread.h"
-
-/* this flag is uneffective under linux too, should be deleted */
-#ifndef MAP_DENYWRITE
-#define MAP_DENYWRITE 0
-#endif
-
-/* should probably go in elf.h */
-#ifndef ELIBBAD
-#define ELIBBAD 80
-#endif
-
-#ifndef ELF_PLATFORM
-#define ELF_PLATFORM (NULL)
-#endif
-
-#ifndef ELF_HWCAP
-#define ELF_HWCAP 0
-#endif
+static abi_ulong target_auxents;   /* Where the AUX entries are in target */
+static size_t target_auxents_sz;   /* Size of AUX entries including AT_NULL */
 
-#ifdef TARGET_ABI32
-#undef ELF_CLASS
-#define ELF_CLASS ELFCLASS32
-#undef bswaptls
-#define bswaptls(ptr) bswap32s(ptr)
-#endif
+#include "target_os_elf.h"
+#include "target_os_stack.h"
+#include "target_os_thread.h"
 
 #include "elf.h"
 
-/* max code+data+bss space allocated to elf interpreter */
-#define INTERP_MAP_SIZE (32 * 1024 * 1024)
-
-/* max code+data+bss+brk space allocated to ET_DYN executables */
-#define ET_DYN_MAP_SIZE (128 * 1024 * 1024)
-
-/* Necessary parameters */
-#define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
-#define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
-#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
-
-#define DLINFO_ITEMS 12
+abi_ulong target_stksiz;
+abi_ulong target_stkbas;
 
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
@@ -195,43 +164,36 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
     return p;
 }
 
-static abi_ulong setup_arg_pages(abi_ulong p, struct bsd_binprm *bprm,
-                                 struct image_info *info)
+static void setup_arg_pages(struct bsd_binprm *bprm, struct image_info *info,
+                            abi_ulong *stackp, abi_ulong *stringp)
 {
-    abi_ulong stack_base, size, error;
-    int i;
+    abi_ulong stack_base, size;
+    abi_long addr;
 
     /* Create enough stack to hold everything.  If we don't use
      * it for args, we'll use it for something else...
      */
     size = target_dflssiz;
-    if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE)
-        size = MAX_ARG_PAGES * TARGET_PAGE_SIZE;
-    error = target_mmap(0,
+    stack_base = TARGET_USRSTACK - size;
+    addr = target_mmap(stack_base,
                         size + qemu_host_page_size,
                         PROT_READ | PROT_WRITE,
                         MAP_PRIVATE | MAP_ANON,
                         -1, 0);
-    if (error == -1) {
+    if (addr == -1) {
         perror("stk mmap");
         exit(-1);
     }
     /* we reserve one extra page at the top of the stack as guard */
-    target_mprotect(error + size, qemu_host_page_size, PROT_NONE);
+    target_mprotect(addr + size, qemu_host_page_size, PROT_NONE);
 
-    stack_base = error + size - MAX_ARG_PAGES * TARGET_PAGE_SIZE;
-    p += stack_base;
+    target_stksiz = size;
+    target_stkbas = addr;
 
-    for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
-        if (bprm->page[i]) {
-            info->rss++;
-            /* FIXME - check return value of memcpy_to_target() for failure */
-            memcpy_to_target(stack_base, bprm->page[i], TARGET_PAGE_SIZE);
-            g_free(bprm->page[i]);
-        }
-        stack_base += TARGET_PAGE_SIZE;
+    if (setup_initial_stack(bprm, stackp, stringp) != 0) {
+        perror("stk setup");
+        exit(-1);
     }
-    return p;
 }
 
 static void set_brk(abi_ulong start, abi_ulong end)
@@ -287,86 +249,6 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
         }
 }
 
-
-static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
-                                   struct elfhdr * exec,
-                                   abi_ulong load_addr,
-                                   abi_ulong load_bias,
-                                   abi_ulong interp_load_addr,
-                                   struct image_info *info)
-{
-        abi_ulong sp;
-        int size;
-        abi_ulong u_platform;
-        const char *k_platform;
-        const int n = sizeof(elf_addr_t);
-
-        sp = p;
-        u_platform = 0;
-        k_platform = ELF_PLATFORM;
-        if (k_platform) {
-            size_t len = strlen(k_platform) + 1;
-            sp -= (len + n - 1) & ~(n - 1);
-            u_platform = sp;
-            /* FIXME - check return value of memcpy_to_target() for failure */
-            memcpy_to_target(sp, k_platform, len);
-        }
-        /*
-         * Force 16 byte _final_ alignment here for generality.
-         */
-        sp = sp & ~(abi_ulong)15;
-        size = (DLINFO_ITEMS + 1) * 2;
-        if (k_platform)
-                size += 2;
-#ifdef DLINFO_ARCH_ITEMS
-        size += DLINFO_ARCH_ITEMS * 2;
-#endif
-        size += envc + argc + 2;
-        size += 1;        /* argc itself */
-        size *= n;
-        if (size & 15)
-                sp -= 16 - (size & 15);
-
-        /* This is correct because Linux defines
-         * elf_addr_t as Elf32_Off / Elf64_Off
-         */
-#define NEW_AUX_ENT(id, val) do {               \
-            sp -= n; put_user_ual(val, sp);     \
-            sp -= n; put_user_ual(id, sp);      \
-          } while (0)
-
-        NEW_AUX_ENT(AT_NULL, 0);
-
-        /* There must be exactly DLINFO_ITEMS entries here.  */
-        NEW_AUX_ENT(AT_PHDR, (abi_ulong)(load_addr + exec->e_phoff));
-        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof(struct elf_phdr)));
-        NEW_AUX_ENT(AT_PHNUM, (abi_ulong)(exec->e_phnum));
-        NEW_AUX_ENT(AT_PAGESZ, (abi_ulong)(TARGET_PAGE_SIZE));
-        NEW_AUX_ENT(AT_BASE, (abi_ulong)(interp_load_addr));
-        NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
-        NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
-        NEW_AUX_ENT(AT_UID, (abi_ulong) getuid());
-        NEW_AUX_ENT(AT_EUID, (abi_ulong) geteuid());
-        NEW_AUX_ENT(AT_GID, (abi_ulong) getgid());
-        NEW_AUX_ENT(AT_EGID, (abi_ulong) getegid());
-        NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
-        NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
-        if (k_platform)
-            NEW_AUX_ENT(AT_PLATFORM, u_platform);
-#ifdef ARCH_DLINFO
-        /*
-         * ARCH_DLINFO must come last so platform specific code can enforce
-         * special alignment requirements on the AUXV if necessary (eg. PPC).
-         */
-        ARCH_DLINFO;
-#endif
-#undef NEW_AUX_ENT
-
-        sp = loader_build_argptr(envc, argc, sp, p);
-        return sp;
-}
-
-
 static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
                                  int interpreter_fd,
                                  abi_ulong *interp_load_addr)
@@ -824,31 +706,10 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     info->mmap = 0;
     elf_entry = (abi_ulong) elf_ex.e_entry;
 
-    /*
-     * In case where user has not explicitly set the guest_base, we
-     * probe here that should we set it automatically.
-     */
-    if (!have_guest_base) {
-        /*
-         * Go through ELF program header table and find out whether
-         * any of the segments drop below our current mmap_min_addr and
-         * in that case set guest_base to corresponding address.
-         */
-        for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum;
-            i++, elf_ppnt++) {
-            if (elf_ppnt->p_type != PT_LOAD)
-                continue;
-            if (HOST_PAGE_ALIGN(elf_ppnt->p_vaddr) < mmap_min_addr) {
-                guest_base = HOST_PAGE_ALIGN(mmap_min_addr);
-                break;
-            }
-        }
-    }
-
     /* Do this so that we can load the interpreter, if need be.  We will
        change some of these later */
     info->rss = 0;
-    bprm->p = setup_arg_pages(bprm->p, bprm, info);
+    setup_arg_pages(bprm, info, &bprm->p, &bprm->stringp);
     info->start_stack = bprm->p;
 
     /* Now we do a little grungy work by mmaping the ELF image into
@@ -965,13 +826,9 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 #ifdef LOW_ELF_STACK
     info->start_stack = bprm->p = elf_stack - 4;
 #endif
-    bprm->p = create_elf_tables(bprm->p,
-                                bprm->argc,
-                                bprm->envc,
-                                &elf_ex,
-                                load_addr, load_bias,
-                                interp_load_addr,
-                                info);
+    bprm->p = target_create_elf_tables(bprm->p, bprm->argc, bprm->envc,
+                                       bprm->stringp, &elf_ex, load_addr,
+                                       load_bias, interp_load_addr, info);
     info->load_addr = reloc_func_desc;
     info->start_brk = info->brk = elf_brk;
     info->end_code = end_code;
diff --git a/bsd-user/freebsd/target_os_elf.h b/bsd-user/freebsd/target_os_elf.h
new file mode 100644
index 0000000000..2d03a883aa
--- /dev/null
+++ b/bsd-user/freebsd/target_os_elf.h
@@ -0,0 +1,137 @@
+/*
+ *  freebsd ELF definitions
+ *
+ *  Copyright (c) 2013-15 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_OS_ELF_H_
+#define _TARGET_OS_ELF_H_
+
+#include "target_arch_elf.h"
+#include "elf.h"
+
+#define bsd_get_ncpu() 1 /* until we pull in bsd-proc.[hc] */
+
+/* this flag is uneffective under linux too, should be deleted */
+#ifndef MAP_DENYWRITE
+#define MAP_DENYWRITE 0
+#endif
+
+/* should probably go in elf.h */
+#ifndef ELIBBAD
+#define ELIBBAD 80
+#endif
+
+#ifndef ELF_PLATFORM
+#define ELF_PLATFORM (NULL)
+#endif
+
+#ifndef ELF_HWCAP
+#define ELF_HWCAP 0
+#endif
+
+/* XXX Look at the other conflicting AT_* values. */
+#define FREEBSD_AT_NCPUS     19
+#define FREEBSD_AT_HWCAP     25
+#define FREEBSD_AT_HWCAP2    26
+
+#ifdef TARGET_ABI32
+#undef ELF_CLASS
+#define ELF_CLASS ELFCLASS32
+#undef bswaptls
+#define bswaptls(ptr) bswap32s(ptr)
+#endif
+
+/* max code+data+bss space allocated to elf interpreter */
+#define INTERP_MAP_SIZE (32 * 1024 * 1024)
+
+/* max code+data+bss+brk space allocated to ET_DYN executables */
+#define ET_DYN_MAP_SIZE (128 * 1024 * 1024)
+
+/* Necessary parameters */
+#define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
+#define TARGET_ELF_PAGESTART(_v) ((_v) & \
+        ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
+
+#define DLINFO_ITEMS 14
+
+static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
+                                          abi_ulong stringp,
+                                          struct elfhdr *exec,
+                                          abi_ulong load_addr,
+                                          abi_ulong load_bias,
+                                          abi_ulong interp_load_addr,
+                                          struct image_info *info)
+{
+        abi_ulong features, sp;
+        int size;
+        const int n = sizeof(elf_addr_t);
+
+        target_auxents_sz = 0;
+        sp = p;
+        /*
+         * Force 16 byte _final_ alignment here for generality.
+         */
+        sp = sp & ~(abi_ulong)15;
+        size = (DLINFO_ITEMS + 1) * 2;
+        size += envc + argc + 2;
+        size += 1;                      /* argc itself */
+        size *= n;
+        if (size & 15) {
+            sp -= 16 - (size & 15);
+        }
+
+        /*
+         * FreeBSD defines elf_addr_t as Elf32_Off / Elf64_Off
+         */
+#define NEW_AUX_ENT(id, val) do {               \
+            sp -= n; put_user_ual(val, sp);     \
+            sp -= n; put_user_ual(id, sp);      \
+            target_auxents_sz += 2 * n;         \
+          } while (0)
+
+        NEW_AUX_ENT(AT_NULL, 0);
+
+        /* There must be exactly DLINFO_ITEMS entries here.  */
+        NEW_AUX_ENT(AT_PHDR, (abi_ulong)(load_addr + exec->e_phoff));
+        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof(struct elf_phdr)));
+        NEW_AUX_ENT(AT_PHNUM, (abi_ulong)(exec->e_phnum));
+        NEW_AUX_ENT(AT_PAGESZ, (abi_ulong)(TARGET_PAGE_SIZE));
+        NEW_AUX_ENT(AT_BASE, (abi_ulong)(interp_load_addr));
+        NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
+        NEW_AUX_ENT(FREEBSD_AT_NCPUS, (abi_ulong)bsd_get_ncpu());
+        NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
+        NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
+        NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
+        NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
+        NEW_AUX_ENT(AT_EGID, (abi_ulong)getegid());
+        features = ELF_HWCAP;
+        NEW_AUX_ENT(FREEBSD_AT_HWCAP, features);
+        target_auxents = sp; /* Note where the aux entries are in the target */
+#ifdef ARCH_DLINFO
+        /*
+         * ARCH_DLINFO must come last so platform specific code can enforce
+         * special alignment requirements on the AUXV if necessary (eg. PPC).
+         */
+        ARCH_DLINFO;
+#endif
+#undef NEW_AUX_ENT
+
+        sp = loader_build_argptr(envc, argc, sp, stringp);
+        return sp;
+}
+
+#endif /* _TARGET_OS_ELF_H_ */
diff --git a/bsd-user/netbsd/target_os_elf.h b/bsd-user/netbsd/target_os_elf.h
new file mode 100644
index 0000000000..21b475f458
--- /dev/null
+++ b/bsd-user/netbsd/target_os_elf.h
@@ -0,0 +1,146 @@
+/*
+ *  netbsd ELF definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_OS_ELF_H_
+#define _TARGET_OS_ELF_H_
+
+#include "target_arch_elf.h"
+#include "elf.h"
+
+/* this flag is uneffective under linux too, should be deleted */
+#ifndef MAP_DENYWRITE
+#define MAP_DENYWRITE 0
+#endif
+
+/* should probably go in elf.h */
+#ifndef ELIBBAD
+#define ELIBBAD 80
+#endif
+
+#ifndef ELF_PLATFORM
+#define ELF_PLATFORM (NULL)
+#endif
+
+#ifndef ELF_HWCAP
+#define ELF_HWCAP 0
+#endif
+
+#ifdef TARGET_ABI32
+#undef ELF_CLASS
+#define ELF_CLASS ELFCLASS32
+#undef bswaptls
+#define bswaptls(ptr) bswap32s(ptr)
+#endif
+
+/* max code+data+bss space allocated to elf interpreter */
+#define INTERP_MAP_SIZE (32 * 1024 * 1024)
+
+/* max code+data+bss+brk space allocated to ET_DYN executables */
+#define ET_DYN_MAP_SIZE (128 * 1024 * 1024)
+
+/* Necessary parameters */
+#define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
+#define TARGET_ELF_PAGESTART(_v) ((_v) & \
+        ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
+
+#define DLINFO_ITEMS 12
+
+static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
+                                          abi_ulong stringp,
+                                          struct elfhdr *exec,
+                                          abi_ulong load_addr,
+                                          abi_ulong load_bias,
+                                          abi_ulong interp_load_addr,
+                                          struct image_info *info)
+{
+        abi_ulong sp;
+        int size;
+        abi_ulong u_platform;
+        const char *k_platform;
+        const int n = sizeof(elf_addr_t);
+
+        sp = p;
+        u_platform = 0;
+        k_platform = ELF_PLATFORM;
+        if (k_platform) {
+            size_t len = strlen(k_platform) + 1;
+            sp -= (len + n - 1) & ~(n - 1);
+            u_platform = sp;
+            /* FIXME - check return value of memcpy_to_target() for failure */
+            memcpy_to_target(sp, k_platform, len);
+        }
+        /*
+         * Force 16 byte _final_ alignment here for generality.
+         */
+        sp = sp & ~(abi_ulong)15;
+        size = (DLINFO_ITEMS + 1) * 2;
+        if (k_platform) {
+            size += 2;
+        }
+#ifdef DLINFO_ARCH_ITEMS
+        size += DLINFO_ARCH_ITEMS * 2;
+#endif
+        size += envc + argc + 2;
+        size += 1;                         /* argc itself */
+        size *= n;
+        if (size & 15) {
+            sp -= 16 - (size & 15);
+        }
+
+        /*
+         * NetBSD defines elf_addr_t as Elf32_Off / Elf64_Off
+         */
+#define NEW_AUX_ENT(id, val) do {               \
+            sp -= n; put_user_ual(val, sp);     \
+            sp -= n; put_user_ual(id, sp);      \
+          } while (0)
+
+        NEW_AUX_ENT(AT_NULL, 0);
+
+        /* There must be exactly DLINFO_ITEMS entries here.  */
+        NEW_AUX_ENT(AT_PHDR, (abi_ulong)(load_addr + exec->e_phoff));
+        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof(struct elf_phdr)));
+        NEW_AUX_ENT(AT_PHNUM, (abi_ulong)(exec->e_phnum));
+        NEW_AUX_ENT(AT_PAGESZ, (abi_ulong)(TARGET_PAGE_SIZE));
+        NEW_AUX_ENT(AT_BASE, (abi_ulong)(interp_load_addr));
+        NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
+        NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
+        NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
+        NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
+        NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
+        NEW_AUX_ENT(AT_EGID, (abi_ulong)getegid());
+        NEW_AUX_ENT(AT_HWCAP, (abi_ulong)ELF_HWCAP);
+        NEW_AUX_ENT(AT_CLKTCK, (abi_ulong)sysconf(_SC_CLK_TCK));
+        if (k_platform) {
+            NEW_AUX_ENT(AT_PLATFORM, u_platform);
+        }
+#ifdef ARCH_DLINFO
+        /*
+         * ARCH_DLINFO must come last so platform specific code can enforce
+         * special alignment requirements on the AUXV if necessary (eg. PPC).
+         */
+        ARCH_DLINFO;
+#endif
+#undef NEW_AUX_ENT
+
+        sp = loader_build_argptr(envc, argc, sp, stringp);
+        return sp;
+}
+
+#endif /* _TARGET_OS_ELF_H_ */
diff --git a/bsd-user/openbsd/target_os_elf.h b/bsd-user/openbsd/target_os_elf.h
new file mode 100644
index 0000000000..a5cfcd3aff
--- /dev/null
+++ b/bsd-user/openbsd/target_os_elf.h
@@ -0,0 +1,146 @@
+/*
+ *  openbsd ELF definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_OS_ELF_H_
+#define _TARGET_OS_ELF_H_
+
+#include "target_arch_elf.h"
+#include "elf.h"
+
+/* this flag is uneffective under linux too, should be deleted */
+#ifndef MAP_DENYWRITE
+#define MAP_DENYWRITE 0
+#endif
+
+/* should probably go in elf.h */
+#ifndef ELIBBAD
+#define ELIBBAD 80
+#endif
+
+#ifndef ELF_PLATFORM
+#define ELF_PLATFORM (NULL)
+#endif
+
+#ifndef ELF_HWCAP
+#define ELF_HWCAP 0
+#endif
+
+#ifdef TARGET_ABI32
+#undef ELF_CLASS
+#define ELF_CLASS ELFCLASS32
+#undef bswaptls
+#define bswaptls(ptr) bswap32s(ptr)
+#endif
+
+/* max code+data+bss space allocated to elf interpreter */
+#define INTERP_MAP_SIZE (32 * 1024 * 1024)
+
+/* max code+data+bss+brk space allocated to ET_DYN executables */
+#define ET_DYN_MAP_SIZE (128 * 1024 * 1024)
+
+/* Necessary parameters */
+#define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
+#define TARGET_ELF_PAGESTART(_v) ((_v) & \
+        ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
+
+#define DLINFO_ITEMS 12
+
+static abi_ulong target_create_elf_tables(abi_ulong p, int argc, int envc,
+                                          abi_ulong stringp,
+                                          struct elfhdr *exec,
+                                          abi_ulong load_addr,
+                                          abi_ulong load_bias,
+                                          abi_ulong interp_load_addr,
+                                          struct image_info *info)
+{
+        abi_ulong sp;
+        int size;
+        abi_ulong u_platform;
+        const char *k_platform;
+        const int n = sizeof(elf_addr_t);
+
+        sp = p;
+        u_platform = 0;
+        k_platform = ELF_PLATFORM;
+        if (k_platform) {
+            size_t len = strlen(k_platform) + 1;
+            sp -= (len + n - 1) & ~(n - 1);
+            u_platform = sp;
+            /* FIXME - check return value of memcpy_to_target() for failure */
+            memcpy_to_target(sp, k_platform, len);
+        }
+        /*
+         * Force 16 byte _final_ alignment here for generality.
+         */
+        sp = sp & ~(abi_ulong)15;
+        size = (DLINFO_ITEMS + 1) * 2;
+        if (k_platform) {
+            size += 2;
+        }
+#ifdef DLINFO_ARCH_ITEMS
+        size += DLINFO_ARCH_ITEMS * 2;
+#endif
+        size += envc + argc + 2;
+        size += 1;                        /* argc itself */
+        size *= n;
+        if (size & 15) {
+            sp -= 16 - (size & 15);
+        }
+
+        /*
+         * OpenBSD defines elf_addr_t as Elf32_Off / Elf64_Off
+         */
+#define NEW_AUX_ENT(id, val) do {               \
+            sp -= n; put_user_ual(val, sp);     \
+            sp -= n; put_user_ual(id, sp);      \
+          } while (0)
+
+        NEW_AUX_ENT(AT_NULL, 0);
+
+        /* There must be exactly DLINFO_ITEMS entries here.  */
+        NEW_AUX_ENT(AT_PHDR, (abi_ulong)(load_addr + exec->e_phoff));
+        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof(struct elf_phdr)));
+        NEW_AUX_ENT(AT_PHNUM, (abi_ulong)(exec->e_phnum));
+        NEW_AUX_ENT(AT_PAGESZ, (abi_ulong)(TARGET_PAGE_SIZE));
+        NEW_AUX_ENT(AT_BASE, (abi_ulong)(interp_load_addr));
+        NEW_AUX_ENT(AT_FLAGS, (abi_ulong)0);
+        NEW_AUX_ENT(AT_ENTRY, load_bias + exec->e_entry);
+        NEW_AUX_ENT(AT_UID, (abi_ulong)getuid());
+        NEW_AUX_ENT(AT_EUID, (abi_ulong)geteuid());
+        NEW_AUX_ENT(AT_GID, (abi_ulong)getgid());
+        NEW_AUX_ENT(AT_EGID, (abi_ulong)getegid());
+        NEW_AUX_ENT(AT_HWCAP, (abi_ulong)ELF_HWCAP);
+        NEW_AUX_ENT(AT_CLKTCK, (abi_ulong)sysconf(_SC_CLK_TCK));
+        if (k_platform) {
+            NEW_AUX_ENT(AT_PLATFORM, u_platform);
+        }
+#ifdef ARCH_DLINFO
+        /*
+         * ARCH_DLINFO must come last so platform specific code can enforce
+         * special alignment requirements on the AUXV if necessary (eg. PPC).
+         */
+        ARCH_DLINFO;
+#endif
+#undef NEW_AUX_ENT
+
+        sp = loader_build_argptr(envc, argc, sp, stringp);
+        return sp;
+}
+
+#endif /* _TARGET_OS_ELF_H_ */
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 3e3bd96cff..3685156123 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -124,6 +124,7 @@ struct bsd_binprm {
         char buf[128];
         void *page[MAX_ARG_PAGES];
         abi_ulong p;
+        abi_ulong stringp;
         int fd;
         int e_uid, e_gid;
         int argc, envc;
-- 
2.32.0


