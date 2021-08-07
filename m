Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA23E372D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:46:45 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU9U-0006MA-V2
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5s-0006GW-5W
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:00 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5p-0004i9-Gx
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:59 -0400
Received: by mail-io1-xd32.google.com with SMTP id m13so19894083iol.7
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PT+wrBvlddpGOiPWMW8ZY3I3hc4zlWNJO/ROaM0a72c=;
 b=ZZALewH4vy7V5fFqQw06B4Q1gdW366pW36NkKwowNL0K849/EHNtUL4zoYeCEBIF0t
 y8C1snt3Ez77n+9d7LJ8LzqShdhgtiLhJtRsXOvhf9J3OO6HLOZCKroWxuyeqETISLVl
 v/KaiMr2y99ejVp5OWFenyPiEwc2uxAuQYFPWOjPyYjXJUNhVAYyWHfP16MIvtlkRZPa
 b1i0xCpZEk3qHw0PpEfj76T/pyoN8LDwjFo9mQ4ps1ywNu/1a+xzi7PPRtw/uYQIoBoH
 VDMXolRB/jlT7CGfzH1Mk52nZafoyqw6tyw673PaT3xTa5XovuNwtbOgTL2tFT5HRjMA
 BB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PT+wrBvlddpGOiPWMW8ZY3I3hc4zlWNJO/ROaM0a72c=;
 b=kiZC82xzwojKHC9mVz4N+Iuhg0b2/1+tw0BJmdMF133frYQl+doYS7hg6kBkOXvJJS
 KwXtC5+7X7U7MeJHfGE8DeDGfm4YMVAOuRkM0jNUqoRjKIhbHc4ixx7w5hsg6C/h5hYf
 pC+Fi/Fq8uFy4T4GUNfhTIdq0Ff1YHuY7Cd2LZSViWF0wXGpKzPunNH7Np8eYseK6vOL
 XiSZ4TW0b7QYcBi5KKuGq5aSBKErqtlHuJk/VF1towpqj7hL4mlmtRTtdeaPVzoK7mVe
 0qaaHBjE9e37rV5YVEbjw5j9EKmdY3ucxKTVzyyT9AW88wjjVl0+RAt/2AmsDTkPdFWf
 rtJA==
X-Gm-Message-State: AOAM5307PTIAllwL1qCFzanSxARkAcqsECZt6QHZA1WxdjPjTn2vdtO+
 3UZRuZrHkySkzhAQjJm+pq8cg7VFoBWehtNP
X-Google-Smtp-Source: ABdhPJwk1t9ApaGkjvAhWOMhfupDhdceLJzP2WMK2AYmzlsmjN/p77m5OjNaMI9JTKDvUAsMqtn88g==
X-Received: by 2002:a5e:d80e:: with SMTP id l14mr203090iok.79.1628372576326;
 Sat, 07 Aug 2021 14:42:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:55 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 05/49] bsd-user: move arch specific defines out of
 elfload.c
Date: Sat,  7 Aug 2021 15:41:58 -0600
Message-Id: <20210807214242.82385-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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

Move the arcitecture specific defines to target_arch_elf.h and delete them from
elfload.c. unifdef as appropriate for i386 vs x86_64 versions.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c                | 81 +------------------------------
 bsd-user/i386/target_arch_elf.h   | 54 +++++++++++++++++++++
 bsd-user/x86_64/target_arch_elf.h | 41 ++++++++++++++++
 3 files changed, 97 insertions(+), 79 deletions(-)
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
index 0000000000..084c9a7814
--- /dev/null
+++ b/bsd-user/i386/target_arch_elf.h
@@ -0,0 +1,54 @@
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
+#define elf_check_arch(x) ( ((x) == EM_386) || ((x) == EM_486) )
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
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
new file mode 100644
index 0000000000..08a86da1a5
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -0,0 +1,41 @@
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
+#define elf_check_arch(x) ( ((x) == ELF_ARCH) )
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
-- 
2.32.0


