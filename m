Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7AA3FF827
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:58:12 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwax-0005qO-GZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR1-0006W2-MK
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:55 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQy-0002tD-Fi
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:55 -0400
Received: by mail-io1-xd2e.google.com with SMTP id f6so4773079iox.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ylt7WV1TVCXXr9QQoMDNZUNuolzJegHkE/e8RkVXe1g=;
 b=MU5fcEVyyt5uitzwvPtBFo/P18dyH3fCpaKxUJcDN2uwFIyQTv6ERwbAtUqUUb7OBv
 Gi9XkoH35194A1APMQCptn7LcmQnvVmHOiPwgbvE7RFxmXONI+SpGqtm3nSgBiMkDE95
 XWV5vK16va7FkzaZtiXztvGUXkTjFgHxUcjLa6eSXQ/Me71yCmn7APWRm2IWz3C6KnIS
 a/NlqPfjdSGCLvg9E55hcfscxdXS2xEM/CUO7u2ZjU95u46pC+0wcBcDyP+/iLKiBM5T
 qtQo/i4URE5MJuDtVpwfBDzBaybAYI8lmFqyCM/IypQYPyxuGMIcLPIexGUPL9OSrGXR
 k15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylt7WV1TVCXXr9QQoMDNZUNuolzJegHkE/e8RkVXe1g=;
 b=ZA2qzf0vebIsB0BBzf9xlubJvjLtJj8nFdGbElRwSTY9lfFT8NPGJsd2LhTIGmrMUX
 7R1/ryUroM8ngz+dqQaUbd4vSwsY/6CiLe/1+3FPp5Dz3q2Hs61BfF7bFmuEhgg5emLy
 +FHApNIjCw8SkNWwsdVx8u9MaqeJxwyWDbSEO+4v9KMrGibR6t+TZjCKUSwiVys3T3zx
 rRearCaC+VIQtzHFmJwTUdAC1JLgIHpCW8kr6ozSswyiR/BBTvb9nmcqU3i97wOQV63/
 pnDE8Xq/3TMj3Oe+4FXTVPExDKI69yvgBmnEP9dsHZ/EhaKjLo9YnhQQE4O5FXzOrMGr
 JlDg==
X-Gm-Message-State: AOAM530XFbL51n2QQKXAbmK4To2eFjlOxI3vIRWhI+/M6kuTGktUxzBv
 5DeqiD8sRCEsKphHarRvagRzbTU53kC06A==
X-Google-Smtp-Source: ABdhPJzjhj6tzYunUKZuQDZjbnhXP6dkgPOrQ2zFS5IfkuOboOB3eXfYm097XY7veHYELDe891dqQA==
X-Received: by 2002:a6b:710f:: with SMTP id q15mr739800iog.77.1630626471168;
 Thu, 02 Sep 2021 16:47:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:50 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/43] bsd-user: move arch specific defines out of elfload.c
Date: Thu,  2 Sep 2021 17:46:53 -0600
Message-Id: <20210902234729.76141-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

Move the architecture specific defines to target_arch_elf.h and delete
them from elfload.c. Only retain ifdefs appropriate for i386 and x86_64.
Add the copyright/license comments, and guard ifdefs.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c                | 81 +------------------------------
 bsd-user/i386/target_arch_elf.h   | 81 +++++++++++++++++++++++++++++++
 bsd-user/x86_64/target_arch_elf.h | 67 +++++++++++++++++++++++++
 slirp                             |  2 +-
 4 files changed, 151 insertions(+), 80 deletions(-)
 create mode 100644 bsd-user/i386/target_arch_elf.h
 create mode 100644 bsd-user/x86_64/target_arch_elf.h

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index fffa24f041..639673f5b7 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -23,6 +23,8 @@
 #include "disas/disas.h"
 #include "qemu/path.h"
 
+#include "target_arch_elf.h"
+
 /* from personality.h */
 
 /*
@@ -93,85 +95,6 @@ enum {
 #define ELIBBAD 80
 #endif
 
-#ifdef TARGET_I386
-
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
-        family = 6;
-    if (family >= 3)
-        elf_platform[1] = '0' + family;
-    return elf_platform;
-}
-
-#define ELF_HWCAP get_elf_hwcap()
-
-static uint32_t get_elf_hwcap(void)
-{
-    X86CPU *cpu = X86_CPU(thread_cpu);
-
-    return cpu->env.features[FEAT_1_EDX];
-}
-
-#ifdef TARGET_X86_64
-#define ELF_START_MMAP 0x2aaaaab000ULL
-#define elf_check_arch(x) (((x) == ELF_ARCH))
-
-#define ELF_CLASS      ELFCLASS64
-#define ELF_DATA       ELFDATA2LSB
-#define ELF_ARCH       EM_X86_64
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->rax = 0;
-    regs->rsp = infop->start_stack;
-    regs->rip = infop->entry;
-    if (bsd_type == target_freebsd) {
-        regs->rdi = infop->start_stack;
-    }
-}
-
-#else /* !TARGET_X86_64 */
-
-#define ELF_START_MMAP 0x80000000
-
-/*
- * This is used to ensure we don't load something for the wrong architecture.
- */
-#define elf_check_arch(x) (((x) == EM_386) || ((x) == EM_486))
-
-/*
- * These are used to set parameters in the core dumps.
- */
-#define ELF_CLASS       ELFCLASS32
-#define ELF_DATA        ELFDATA2LSB
-#define ELF_ARCH        EM_386
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->esp = infop->start_stack;
-    regs->eip = infop->entry;
-
-    /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
-       starts %edx contains a pointer to a function which might be
-       registered using `atexit'.  This provides a mean for the
-       dynamic linker to call DT_FINI functions for shared libraries
-       that have been loaded before the code runs.
-
-       A value of 0 tells we have no such handler.  */
-    regs->edx = 0;
-}
-#endif /* !TARGET_X86_64 */
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE       4096
-
-#endif
-
 #ifndef ELF_PLATFORM
 #define ELF_PLATFORM (NULL)
 #endif
diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
new file mode 100644
index 0000000000..84f61bd930
--- /dev/null
+++ b/bsd-user/i386/target_arch_elf.h
@@ -0,0 +1,81 @@
+/*
+ *  i386 ELF definitions
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
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    static char elf_platform[] = "i386";
+    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
+    if (family > 6) {
+        family = 6;
+    }
+    if (family >= 3) {
+        elf_platform[1] = '0' + family;
+    }
+    return elf_platform;
+}
+
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    X86CPU *cpu = X86_CPU(thread_cpu);
+
+    return cpu->env.features[FEAT_1_EDX];
+}
+
+#define ELF_START_MMAP 0x80000000
+
+/*
+ * This is used to ensure we don't load something for the wrong architecture.
+ */
+#define elf_check_arch(x) (((x) == EM_386) || ((x) == EM_486))
+
+/*
+ * These are used to set parameters in the core dumps.
+ */
+#define ELF_CLASS       ELFCLASS32
+#define ELF_DATA        ELFDATA2LSB
+#define ELF_ARCH        EM_386
+
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    regs->esp = infop->start_stack;
+    regs->eip = infop->entry;
+
+    /*
+     * SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
+     * starts %edx contains a pointer to a function which might be
+     * registered using `atexit'.  This provides a mean for the
+     * dynamic linker to call DT_FINI functions for shared libraries
+     * that have been loaded before the code runs.
+     *
+     * A value of 0 tells we have no such handler.
+     */
+    regs->edx = 0;
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#endif /* _TARGET_ARCH_ELF_H_ */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
new file mode 100644
index 0000000000..e7c8aa2755
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -0,0 +1,67 @@
+/*
+ *  x86_64 ELF definitions
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
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    static char elf_platform[] = "i386";
+    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
+    if (family > 6) {
+        family = 6;
+    }
+    if (family >= 3) {
+        elf_platform[1] = '0' + family;
+    }
+    return elf_platform;
+}
+
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    X86CPU *cpu = X86_CPU(thread_cpu);
+
+    return cpu->env.features[FEAT_1_EDX];
+}
+
+#define ELF_START_MMAP 0x2aaaaab000ULL
+#define elf_check_arch(x) (((x) == ELF_ARCH))
+
+#define ELF_CLASS      ELFCLASS64
+#define ELF_DATA       ELFDATA2LSB
+#define ELF_ARCH       EM_X86_64
+
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    regs->rax = 0;
+    regs->rsp = infop->start_stack;
+    regs->rip = infop->entry;
+    if (bsd_type == target_freebsd) {
+        regs->rdi = infop->start_stack;
+    }
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#endif /* _TARGET_ARCH_ELF_H_ */
diff --git a/slirp b/slirp
index a88d9ace23..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
-- 
2.32.0


