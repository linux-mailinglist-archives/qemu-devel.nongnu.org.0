Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F773F8FD6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:19:53 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMmu-00030t-NE
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfo-0005dW-Br
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:32 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfm-0006lx-ER
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:32 -0400
Received: by mail-io1-xd44.google.com with SMTP id a15so5601010iot.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uckwqi8fgpXgInXS5Wb6gk5oZg7OfAZhOoVreFZ38Y8=;
 b=bETRHER9SjZJMC8FVvSpQztRnQFKsLF9jTek8AVR3krkkMqtyTAbasYUVQCZAPQnVJ
 bRybnRbCfuZF9HuAsb3Gz1wZYQOVrKVod+QKX9W1GZsFuqX7Y72lZaE/ItAFMB0n0ngM
 gFzAdweWfeu67kT+dyl9jwJS9JsmTBHgX4sC1h14RH41BNRjNB40v/la20l/inIBUrRo
 v4FGaAdUYacI3l9TKsnhnTcQt05nyE45Wk0baX08lhz4YG9gHt0aZHWSEDkXGEAunGHw
 LzAkpgakdVkkfjCCstVJZpSmrrk6Cbo+wZ2YcpQMklYieEK+Mk5oACK/Y1nY3MyPpwAn
 qkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uckwqi8fgpXgInXS5Wb6gk5oZg7OfAZhOoVreFZ38Y8=;
 b=uGIhTCMkY7xQ0lMxUOWjWRpp2EE2KAqWaodfUHI5tMF94x56SPL/ifN6kBEHKhiCYZ
 GPF/1icB4dV9KtGeeBBqvn0s02lx3oEBxcSlIA5c+GTONme5Y0fmZvIoQphfZkYct/JM
 04ZoQIM8gB9YRU8GzgS/N2qu5qEcRRh1jL+Zqtn3qz31KfH1kNrgPK/qDlcl2KCOHcgZ
 piEwGM0PAgL8xnq77yGLsBGYLNmMSE9S4f7Fs92+dOgQT758HZN11ZejEKqIMvV1UbZw
 04fIN+kiuzdAOqA0s6Ielp0Wx2NuN9CmV6L/Lu7EbB4MFilHYwtvED7dTCq/d5A+grPm
 JbXg==
X-Gm-Message-State: AOAM530caImhpn7Syd+AYCUbl1QKQvilXXbvIkywlu27EKlIinNdMpdH
 HKBXlunWSGnEMmQxsMc2wGXyQW8SK/C/i19c
X-Google-Smtp-Source: ABdhPJzyYW2teC0SMEIB7Hz2f9U4VFmgAcjsNdTKt9u7vg6O4YbeCUx73XH2mSQrTNXBmU9I83Cluw==
X-Received: by 2002:a5d:9599:: with SMTP id a25mr4779355ioo.86.1630012349141; 
 Thu, 26 Aug 2021 14:12:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:28 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/43] bsd-user: move arch specific defines out of elfload.c
Date: Thu, 26 Aug 2021 15:11:25 -0600
Message-Id: <20210826211201.98877-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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

Move the arcitecture specific defines to target_arch_elf.h and delete
them from elfload.c. unifdef as appropriate for i386 vs x86_64
versions. Add the copyright/license comments, and guard ifdefs.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c                | 81 +------------------------------
 bsd-user/i386/target_arch_elf.h   | 76 +++++++++++++++++++++++++++++
 bsd-user/x86_64/target_arch_elf.h | 64 ++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 79 deletions(-)
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
index 0000000000..84fbc8ba4c
--- /dev/null
+++ b/bsd-user/i386/target_arch_elf.h
@@ -0,0 +1,76 @@
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
+    if (family > 6)
+        family = 6;
+    if (family >= 3)
+        elf_platform[1] = '0' + family;
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
+static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+{
+    regs->esp = infop->start_stack;
+    regs->eip = infop->entry;
+
+    /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
+       starts %edx contains a pointer to a function which might be
+       registered using `atexit'.  This provides a mean for the
+       dynamic linker to call DT_FINI functions for shared libraries
+       that have been loaded before the code runs.
+
+       A value of 0 tells we have no such handler.  */
+    regs->edx = 0;
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE       4096
+
+#endif /* _TARGET_ARCH_ELF_H_ */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
new file mode 100644
index 0000000000..202bf2c447
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -0,0 +1,64 @@
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
+    if (family > 6)
+        family = 6;
+    if (family >= 3)
+        elf_platform[1] = '0' + family;
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
+static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
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
-- 
2.32.0


