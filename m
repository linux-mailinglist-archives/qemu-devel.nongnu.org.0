Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318943E374E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:01:04 +0200 (CEST)
Received: from localhost ([::1]:55402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUNL-0000xe-8w
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6R-00008D-T6
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:36 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6Q-0005Pp-Ci
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:35 -0400
Received: by mail-io1-xd36.google.com with SMTP id l20so17749618iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZUIjC8fUpD63sq4WTQh3jNXrXunBjaoQkdXkjk1BIE=;
 b=Jxsv0AT+/8KJIxmrnfs8ZZQXcOqOvox/jkk3v+n21zqFQebnSuFPa50BWMnb+JlFc8
 +R4vG1bIoazryICo/ItkPBnlUq3D0KN2/nw4ZBadOQXh1HkMfh/7moLkInZBQqCmQR7d
 yXW+XLxu/h30pF/vYB5+NsNSvxJLtqxkfFub3b/Xjr0FLC3C6ErN6y5tDpz/03ul9H/J
 A9mXUISEklUC0w7pVD6cpNVWUGUNUJjxBThSTOmMLM2vUAbbt9ZpZIfMzMHRws/OhbeR
 kL6VHsNzMlCiYLb7zOdCT1UvIuR/xgjXyhUZ8weXLz68bMep6X+EPJvlniyYR8fMBUGv
 LfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZUIjC8fUpD63sq4WTQh3jNXrXunBjaoQkdXkjk1BIE=;
 b=oxqADOWa7ncmXu7ZZNibcslPrIvYy14EaYVaDWNp+j42KvgsMb1yv+Cv+Q2PBuq86a
 7ECX17q2Jmx0+nrfd/w/1412VlEPVdigHsc25pKvMIYn6h2FdkjsTUw8QJQiidHaWtJn
 97Q7ndHJltCfdmXNtunqkECrcGTGzTvuWNFqhQU2bYRbaL7PX0rmvxk9gfCrM29oGKlz
 vmflXnmNr/KDTu2rNbch5XTPyfSJnXdRWlw3XETQsOrxF+uXL16TYfZRTpmmyq8BYB/c
 DtrIPVxVeMpPeOmeZE7MLt2gizkUNUrIipwAGme7juFDIqt72IfkjdwKiffFckmMgg+C
 e2eQ==
X-Gm-Message-State: AOAM532+SpwwjYc3AA/tXdPgVQm7geiV2T+zPqNEx6RyxzjWSskWPFeJ
 oSUMUHQlXe9dmjH/q15syqgUwX9JCzEslcGG
X-Google-Smtp-Source: ABdhPJwxFbjWS8F/+b/5HBmg6qCeQiIw9UPrb+CNF6RLu3hY8/fXxIuozx+uf4EblCDvQ44k5CamTw==
X-Received: by 2002:a02:6c8d:: with SMTP id w135mr15517994jab.70.1628372613287; 
 Sat, 07 Aug 2021 14:43:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 42/49] bsd-user: add stubbed out core dump support
Date: Sat,  7 Aug 2021 15:42:35 -0600
Message-Id: <20210807214242.82385-43-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add a stubbed-out version of the bsd-user fork's core dump support. This
allows elfload.c to be almost the same between what's upstream and
what's in qemu-project upstream w/o the burden of reviewing the core
dump support.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>

Sponsored by:		Netflix
---
 bsd-user/elfcore.c | 10 ++++++++++
 bsd-user/elfload.c | 24 ++++++++++++++++++++++--
 bsd-user/qemu.h    |  6 ++++++
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 bsd-user/elfcore.c

diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
new file mode 100644
index 0000000000..e3c161942d
--- /dev/null
+++ b/bsd-user/elfcore.c
@@ -0,0 +1,10 @@
+/* Stubbed out version of core dump support, explicitly in public domain */
+
+static int elf_core_dump(int signr, CPUArchState *env)
+{
+    struct elf_note en;
+
+    bswap_note(&en);
+
+    return 0;
+}
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index c0787a4e52..4390a88b07 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -26,15 +26,19 @@
 static abi_ulong target_auxents;   /* Where the AUX entries are in target */
 static size_t target_auxents_sz;   /* Size of AUX entries including AT_NULL */
 
+#include "target_arch_reg.h"
 #include "target_os_elf.h"
 #include "target_os_stack.h"
 #include "target_os_thread.h"
-
-#include "elf.h"
+#include "target_os_user.h"
 
 abi_ulong target_stksiz;
 abi_ulong target_stkbas;
 
+static int elf_core_dump(int signr, CPUArchState *env);
+static int load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr,
+    int fd, abi_ulong rbase, abi_ulong *baddrp);
+
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
     memcpy(to, from, n);
@@ -100,15 +104,25 @@ static void bswap_sym(struct elf_sym *sym)
     bswap16s(&sym->st_shndx);
 }
 
+static void bswap_note(struct elf_note *en)
+{
+    bswap32s(&en->n_namesz);
+    bswap32s(&en->n_descsz);
+    bswap32s(&en->n_type);
+}
+
 #else /* ! BSWAP_NEEDED */
 
 static void bswap_ehdr(struct elfhdr *ehdr) { }
 static void bswap_phdr(struct elf_phdr *phdr, int phnum) { }
 static void bswap_shdr(struct elf_shdr *shdr, int shnum) { }
 static void bswap_sym(struct elf_sym *sym) { }
+static void bswap_note(struct elf_note *en) { }
 
 #endif /* ! BSWAP_NEEDED */
 
+#include "elfcore.c"
+
 /*
  * 'copy_elf_strings()' copies argument/envelope strings from user
  * memory to free pages in kernel mem. These are in a format ready
@@ -833,6 +847,12 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     info->entry = elf_entry;
 
+#ifdef USE_ELF_CORE_DUMP
+    bprm->core_dump = &elf_core_dump;
+#else
+    bprm->core_dump = NULL;
+#endif
+
     return 0;
 }
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a85abb8fe1..b2b7c3b29a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -54,6 +54,7 @@ extern enum BSDType bsd_type;
  * kernel
  */
 struct image_info {
+    abi_ulong load_bias;
     abi_ulong load_addr;
     abi_ulong start_code;
     abi_ulong end_code;
@@ -68,6 +69,9 @@ struct image_info {
     abi_ulong entry;
     abi_ulong code_offset;
     abi_ulong data_offset;
+    abi_ulong arg_start;
+    abi_ulong arg_end;
+    uint32_t  elf_flags;
 };
 
 #define MAX_SIGQUEUE_SIZE 1024
@@ -134,6 +138,7 @@ struct bsd_binprm {
         char **envp;
         char *filename;         /* (Given) Name of binary */
         char *fullpath;         /* Full path of binary */
+        int (*core_dump)(int, CPUArchState *);
 };
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
@@ -147,6 +152,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
 int load_flt_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
+int is_target_elf_binary(int fd);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
                           unsigned long len);
-- 
2.32.0


