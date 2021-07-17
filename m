Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAD3CC6C5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:26:57 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4thw-00058V-R7
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcP-0001h1-50
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcL-0000hh-SV
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d2so16558963wrn.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbAAYE6Aac70j4yIiLHKaxeoua1xFwIBoeMXuqVsKZg=;
 b=om0feABhM2wU2LWP7j9hPmaI8/9v1RPy0emiBAr+2Jrdtjk6btswltzhh3y+H+Stym
 icySxoTyv+/2A+qVcABP0Z8LETwP66JZlF0nStdP7QYaqRVsknrH48lfrG7tM4mLOhNF
 RPCGRCG1SZaE+P0/CfQAgzcyfP3ssBRpav/+WRhpHmNjumJ7VavmpL4d9X1Wu5y3FLEY
 WSPEGaN8wCEsKFcvMFth6ci7WdJSAQdHZN15a6ig98ezRw/a03C8nDGFhqSnSLarZw9N
 uC4yK/IY7KaQtPjd7TQcSi5x8vOf+cExhuDy4S/oNelK4ZI85HkwtZ6/KebWUusi3UGX
 liqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XbAAYE6Aac70j4yIiLHKaxeoua1xFwIBoeMXuqVsKZg=;
 b=cxXYA5rLI9P6LwgwdvgLMhvRq94s2nDd5xc/K83TVn5mwhIvAYcCUoxV9xovIWGop1
 l1asae6nwUV5Cuwh5GmcYR5NqVCRjcDYlnPbiTrZ5k+fOOH4zaKTK7swQlauCRQihVKE
 HYqsNS03XYdMjgtB9e1a65Q6eyJorCd8B74WQvfRmnJdFgTL/Lyj6T6d4KdWfyC5NJJE
 4jUJ6i0PlLXOZlvnHEUjxSKBujatIT+5+qe6P6byL/09wq04MO63ANL+worNfg0RA0IQ
 896mtfjlBZoLwCDXJ6Pi0Nn5faK1ZlodtrsAqg/4uT+c8B++w9bcZje8rV6AIVnBu87p
 dmmw==
X-Gm-Message-State: AOAM533dSzXqthSraiPMEZ8Ssn/J5TecXwjmEYr9oZw35qFRnJoH4yKe
 +Q8jjETX7cLFpUK7093YVF4KYMBasPP2hQ==
X-Google-Smtp-Source: ABdhPJyrcp7Xy8+Fc+Vb9aaS06m5fUdKk5GAxAYiKBmAnW7at8FaY7unLcZ5mwTxCfIm/gxwU37p3w==
X-Received: by 2002:a5d:414b:: with SMTP id c11mr21677452wrq.162.1626564068523; 
 Sat, 17 Jul 2021 16:21:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/10] linux-user: Split loader-related prototypes
 into loader.h
Date: Sun, 18 Jul 2021 00:20:57 +0100
Message-Id: <20210717232103.18047-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split guest-binary loader prototypes out into a new header
loader.h which we include only where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/loader.h    | 59 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/qemu.h      | 34 ------------------------
 linux-user/elfload.c   |  1 +
 linux-user/flatload.c  |  1 +
 linux-user/linuxload.c |  1 +
 linux-user/main.c      |  1 +
 linux-user/signal.c    |  1 +
 linux-user/syscall.c   |  1 +
 8 files changed, 65 insertions(+), 34 deletions(-)
 create mode 100644 linux-user/loader.h

diff --git a/linux-user/loader.h b/linux-user/loader.h
new file mode 100644
index 00000000000..f375ee0679b
--- /dev/null
+++ b/linux-user/loader.h
@@ -0,0 +1,59 @@
+/*
+ * loader.h: prototypes for linux-user guest binary loader
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
+
+#ifndef LINUX_USER_LOADER_H
+#define LINUX_USER_LOADER_H
+
+/*
+ * Read a good amount of data initially, to hopefully get all the
+ * program headers loaded.
+ */
+#define BPRM_BUF_SIZE  1024
+
+/*
+ * This structure is used to hold the arguments that are
+ * used when loading binaries.
+ */
+struct linux_binprm {
+        char buf[BPRM_BUF_SIZE] __attribute__((aligned));
+        abi_ulong p;
+        int fd;
+        int e_uid, e_gid;
+        int argc, envc;
+        char **argv;
+        char **envp;
+        char *filename;        /* Name of binary */
+        int (*core_dump)(int, const CPUArchState *); /* coredump routine */
+};
+
+void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
+abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
+                              abi_ulong stringp, int push_ptr);
+int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
+             struct target_pt_regs *regs, struct image_info *infop,
+             struct linux_binprm *);
+
+uint32_t get_elf_eflags(int fd);
+int load_elf_binary(struct linux_binprm *bprm, struct image_info *info);
+int load_flt_binary(struct linux_binprm *bprm, struct image_info *info);
+
+abi_long memcpy_to_target(abi_ulong dest, const void *src,
+                          unsigned long len);
+
+extern unsigned long guest_stack_size;
+
+#endif /* LINUX_USER_LOADER_H */
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 76d3f5e7eb9..9e700d3af18 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -173,30 +173,6 @@ void stop_all_tasks(void);
 extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
-/* ??? See if we can avoid exposing so much of the loader internals.  */
-
-/*
- * Read a good amount of data initially, to hopefully get all the
- * program headers loaded.
- */
-#define BPRM_BUF_SIZE  1024
-
-/*
- * This structure is used to hold the arguments that are
- * used when loading binaries.
- */
-struct linux_binprm {
-        char buf[BPRM_BUF_SIZE] __attribute__((aligned));
-        abi_ulong p;
-        int fd;
-        int e_uid, e_gid;
-        int argc, envc;
-        char **argv;
-        char **envp;
-        char *filename;        /* Name of binary */
-        int (*core_dump)(int, const CPUArchState *); /* coredump routine */
-};
-
 typedef struct IOCTLEntry IOCTLEntry;
 
 typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
@@ -217,13 +193,6 @@ extern IOCTLEntry ioctl_entries[];
 #define IOC_W 0x0002
 #define IOC_RW (IOC_R | IOC_W)
 
-void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
-abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
-                              abi_ulong stringp, int push_ptr);
-int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop,
-             struct linux_binprm *);
-
 /*
  * Returns true if the image uses the FDPIC ABI. If this is the case,
  * we have to provide some information (loadmap, pt_dynamic_info) such
@@ -440,9 +409,6 @@ abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
 void mmap_fork_start(void);
 void mmap_fork_end(int child);
 
-/* main.c */
-extern unsigned long guest_stack_size;
-
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 42ef2a11485..d56e00c18b4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "loader.h"
 #include "disas/disas.h"
 #include "qemu/bitops.h"
 #include "qemu/path.h"
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 3e5594cf894..7484a4a3543 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -36,6 +36,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "loader.h"
 #include "flat.h"
 #include "target_flat.h"
 
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 9d4eb5e94b9..27be7090d8f 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "loader.h"
 
 #define NGROUPS 32
 
diff --git a/linux-user/main.c b/linux-user/main.c
index c10e3ccf135..4ec0e2ad55d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -50,6 +50,7 @@
 #include "crypto/init.h"
 #include "fd-trans.h"
 #include "sighandling.h"
+#include "loader.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/signal.c b/linux-user/signal.c
index bbfe250baa3..7abcec9166e 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -24,6 +24,7 @@
 #include "qemu.h"
 #include "strace.h"
 #include "sighandling.h"
+#include "loader.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e2dd799134e..d6019b1c4c2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -129,6 +129,7 @@
 #include "qemu.h"
 #include "strace.h"
 #include "sighandling.h"
+#include "loader.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


