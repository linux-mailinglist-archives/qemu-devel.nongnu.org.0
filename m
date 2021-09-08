Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3E403CE8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:54:45 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzuP-0007JE-2r
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkG-0006G1-RL
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkC-0002LI-KL
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i28so4013343wrb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KROLpWqCOHez44cAkaaggM3uqI+TJzoxIzvtRoun+Uo=;
 b=fELDk7D74SEuMgJfmK1T5AXJsbeyCD8Ij/ts1Y7LSEZJvLVGARFsSQj6w45Or47gjf
 ERMVAa3EhFTjYwD8svTjqOhnGtTIPYSZzpL/2bJ3iK7/EZyo64SgTP31NRJY4+7c13iV
 pxLQPJg6z3W9blPvFXXk7R8fS6SUwt+vu3/RVxuUGEO0D9oNBR/iUXgDZr9Je6uDb/3i
 X8JKgIjEi5Ss0pf4A4ZogfrBtWl1fbznlisO4ASV/NwOpVr98//yLxFrxEL27e4rWSFE
 uHuBgnVzKe+ewm1gM6tYIMoOUOD9vyfPMBeZ7XjZtF75xMLMfAwEru6LmuV5rOlReiij
 WBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KROLpWqCOHez44cAkaaggM3uqI+TJzoxIzvtRoun+Uo=;
 b=YFmxkXjOXInne4t4SfoXV+oDYXzcFePRhD6SWRyLe5vaWSIjwyQEhwm0GH/4MUJ+zb
 VR1EUTmzVYkNJSd0QSSGvZxrDLfB/yPLW7ZZZtVhwlEpsu6S53BhdPV3bEI4AqEpx/HW
 QphYLMs9KoDlpMtf9TCid2/QuiDlEq7cMzihVCbFbnU9Vpw4SLfOiYPCannh9GJ34R4P
 MKVae56MphD1eR0fdFUa2TQHmkT+SlDiozyoxZNgKdqajvt7J1jJrEhgqCAoK7ZuplBJ
 /wFN09vnvno+qpIfhmkCDpTNvJfEQroEFqIuHVYkA1T+rotnbHZBqTrsitYNKhqo41H7
 MOzQ==
X-Gm-Message-State: AOAM532tIZQyI/35KzHztwMcmNzmASrlj4PtKcD3GxleOFBVzhgJX9aN
 r0u0McaAn4ks7PGzqOHsw5VWPDygfkBO+Q==
X-Google-Smtp-Source: ABdhPJybYhOYkg85IAQL01f8Q4aQouCbWVJ3cc+zy7IzF0YL3GMidFFRp5Hj7ueVk6lwo0xN4fTfMQ==
X-Received: by 2002:adf:fdd2:: with SMTP id i18mr4808548wrs.406.1631115850483; 
 Wed, 08 Sep 2021 08:44:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] linux-user: Split loader-related prototypes into
 loader.h
Date: Wed,  8 Sep 2021 16:44:00 +0100
Message-Id: <20210908154405.15417-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split guest-binary loader prototypes out into a new header
loader.h which we include only where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/loader.h    | 59 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/qemu.h      | 40 ----------------------------
 linux-user/elfload.c   |  1 +
 linux-user/flatload.c  |  1 +
 linux-user/linuxload.c |  1 +
 linux-user/main.c      |  1 +
 linux-user/signal.c    |  1 +
 linux-user/syscall.c   |  1 +
 8 files changed, 65 insertions(+), 40 deletions(-)
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
index 76d3f5e7eb9..02c4778c970 100644
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
@@ -232,12 +201,6 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
  */
 int info_is_fdpic(struct image_info *info);
 
-uint32_t get_elf_eflags(int fd);
-int load_elf_binary(struct linux_binprm *bprm, struct image_info *info);
-int load_flt_binary(struct linux_binprm *bprm, struct image_info *info);
-
-abi_long memcpy_to_target(abi_ulong dest, const void *src,
-                          unsigned long len);
 void target_set_brk(abi_ulong new_brk);
 abi_long do_brk(abi_ulong new_brk);
 void syscall_init(void);
@@ -440,9 +403,6 @@ abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
 void mmap_fork_start(void);
 void mmap_fork_end(int child);
 
-/* main.c */
-extern unsigned long guest_stack_size;
-
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01e9a833fbb..6244fcd05ce 100644
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
index 4f516707357..67c5a87ffad 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -50,6 +50,7 @@
 #include "crypto/init.h"
 #include "fd-trans.h"
 #include "signal-common.h"
+#include "loader.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ee1934947ac..0fa15f088b0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -23,6 +23,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "loader.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ad635ed3a5f..b1cd7410d8b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -129,6 +129,7 @@
 #include "qemu.h"
 #include "strace.h"
 #include "signal-common.h"
+#include "loader.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


