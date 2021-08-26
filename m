Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04E53F8FE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:28:32 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMvC-00055e-OA
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgH-0006ek-2m
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:01 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgC-00072W-Vk
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:13:00 -0400
Received: by mail-il1-x133.google.com with SMTP id v16so4699925ilo.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yBdFpKW38rgrbRaBnvax25eipWSclHzIQvFkpqcgHwQ=;
 b=xCkGKn5T2IdgqPGRhLL/YAN0kABujlGt21FiOZUwXhWEwjmuYtxExt+nmq0y32MHer
 y/51NHPnAZLe3yPAJ0eBU5LEzK0r9LVfEnYKvTCSSIdusxA+pPjTjl2NE56ccQ3kRrLI
 RPOOMq6xxPOIZnSJbLXfdprePXDmXawXX03/tUkH5UH3Rl9FPB4kW9wJQUlsYQrif4ns
 XfO1oX6/VMxIW/AsniirdGzdBKkXS7nVa/0uJcGc467L5UEv91BZGyARkI56x+mX9eb4
 C0ff4eQM/Cu2dhudLpxeg9KpnMxACrCq1yK7h8LT9SEEBhancJG5kJDmyzzAlaeneoZo
 OzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yBdFpKW38rgrbRaBnvax25eipWSclHzIQvFkpqcgHwQ=;
 b=ax71xb9oQHm6sgcpEJ+gIhdWyeZb8Cfv44N3uyuy2bVFQDr5w7uULBShUD+JQh68gA
 OIVqFsb+dcEEw6/qygmeBbrvuH8P9m2UT07YBYvkSldAYOrMl5oHIieLwf5GgT+QHGIw
 xgu7BTy6dmJ1Q425fUT1f27X6/qNjq4uT+zp0pZ7Y1F+d7i6SEgyLS0GOkK6yDuq8pVV
 bnVhwc+Nc8dv/VOJE9FAFxraWk/xCVPjkcnyxAXFbhal7QSiITTDDb8kMDF8HSozLcYR
 xTPgWIIxQALS2pBM3TT87xX67G70Q+d0N0Z7aZ0g6TEghAapmTXFoV2qs6oUfItPX0KB
 fXGQ==
X-Gm-Message-State: AOAM531BuqAQbfdTBrIPk4SRluLeJiEv//1UP+KdI/TCw7Q4hIj1xfsN
 oJ3OxVJvkZ+A2cOUwqSIhhqRhc0IZw7mjtzw
X-Google-Smtp-Source: ABdhPJz5/Lw6AJ4diWG+4jUosj+blEM43seBueBouJmB0iNpY8a4b+NhHB1sf7pJOW5olAkIA8ylFA==
X-Received: by 2002:a92:cb47:: with SMTP id f7mr4135828ilq.64.1630012374408;
 Thu, 26 Aug 2021 14:12:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:54 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/43] bsd-user: add stubbed out core dump support
Date: Thu, 26 Aug 2021 15:11:54 -0600
Message-Id: <20210826211201.98877-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add a stubbed-out version of the bsd-user fork's core dump support. This
allows elfload.c to be almost the same between what's upstream and
what's in qemu-project upstream w/o the burden of reviewing the core
dump support.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfcore.c | 10 ++++++++++
 bsd-user/elfload.c | 22 ++++++++++++++++++++--
 bsd-user/qemu.h    |  6 ++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 bsd-user/elfcore.c

diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
new file mode 100644
index 0000000000..c49d9280e2
--- /dev/null
+++ b/bsd-user/elfcore.c
@@ -0,0 +1,10 @@
+/* Stubbed out version of core dump support, explicitly in public domain */
+
+static int elf_core_dump(int signr, CPUArchState *env)
+{
+    struct elf_note en = { 0 };
+
+    bswap_note(&en);
+
+    return 0;
+}
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index c0787a4e52..7632277d87 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -26,15 +26,17 @@
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
+
 static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
     memcpy(to, from, n);
@@ -100,15 +102,25 @@ static void bswap_sym(struct elf_sym *sym)
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
@@ -833,6 +845,12 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
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
index 3685156123..8d20554688 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -51,6 +51,7 @@ extern enum BSDType bsd_type;
  * kernel
  */
 struct image_info {
+    abi_ulong load_bias;
     abi_ulong load_addr;
     abi_ulong start_code;
     abi_ulong end_code;
@@ -65,6 +66,9 @@ struct image_info {
     abi_ulong entry;
     abi_ulong code_offset;
     abi_ulong data_offset;
+    abi_ulong arg_start;
+    abi_ulong arg_end;
+    uint32_t  elf_flags;
 };
 
 #define MAX_SIGQUEUE_SIZE 1024
@@ -132,6 +136,7 @@ struct bsd_binprm {
         char **envp;
         char *filename;         /* (Given) Name of binary */
         char *fullpath;         /* Full path of binary */
+        int (*core_dump)(int, CPUArchState *);
 };
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
@@ -145,6 +150,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
 int load_flt_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
+int is_target_elf_binary(int fd);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
                           unsigned long len);
-- 
2.32.0


