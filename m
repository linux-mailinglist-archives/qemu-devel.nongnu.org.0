Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B713CC6C1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:25:05 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tg8-0000oI-MT
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcO-0001f3-DO
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcM-0000iF-IK
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so9097990wmf.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i8y5R85+M8+6PdkH9oStWkg2AYTRr/oyBaoRFz3LQCk=;
 b=cIHlhZqScnRppIt+Mcc0e1WpUqd2BANu6HJXQnqFSG9KmsXW5aTYCc67oa+96XsUPU
 sLfEA+Qokd34oX/pFXyYYZPKzCwCiQwd4LL/5E7tD/QhYI1i+VkRXJSBV0RA4XvxFrva
 Qp+1MHZPNyj2KaifNil+i22RvjkBssQYBiPXzXiFF9b00hrYJtyIQ22Fu470U9sYysxZ
 ri+6qHax70+ZcyyTK0i2te/zLdOHBkcvuK0iIlsl2+8Tb6f+KSzcFB6fP8lO9tNBf+uP
 L5IE6Ko8Od5Nntxw8j1Tr3j0KbLTFHoKbeEdGtOU/fxqNXrmsbMSSYKX54aVFPGp/Z99
 nHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i8y5R85+M8+6PdkH9oStWkg2AYTRr/oyBaoRFz3LQCk=;
 b=X+6JaWt/EdU7wMbcXO0Xfi5hRl1rmX1/CnIJ56tJWfD9jk+4J9TokdU2xoO2cQa25x
 E1+8RcY3vEroGPjHs0kJXDsOqaINqP+aXddP+dhg9+TeSX4mcOe55ikn+amWv/4bKMu/
 wR1KFFSDVuXFuFGyOvPhoFIqwiyFPb6XkAW1JlY42QnYLKuwUlJbmPNAbx9rM2A7bbPO
 7KVIHGZZxRmOBN5+opLd6tHS8wq323ZVil4vp7KQ9MsIere76gfoC7ZV+cwMfClnBsb4
 dc0AsYbL1AbYrbemlkGg+flJrm4cmb7dtMKiqWCD3Je3LZ+HXCdMOp3K2VdgKL2eNh7/
 totg==
X-Gm-Message-State: AOAM530eYo8EV7cCzbb8Zlc4zo2a6iwhox6hwRknUZstn1Zbxuqo5nQ/
 /F8JZONGFe3C8haMn4b72mQWH01vpg87Lg==
X-Google-Smtp-Source: ABdhPJwP6fQWnNhw4u2fUEzss/M4XSnAdwXVgBGGEm/t2UYVVEvfrjaCfP55saZcjQaVnTLbipUyOA==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr24610623wmj.128.1626564069236; 
 Sat, 17 Jul 2021 16:21:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/10] linux-user: Split mmap prototypes into
 user-mmap.h
Date: Sun, 18 Jul 2021 00:20:58 +0100
Message-Id: <20210717232103.18047-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Split out the mmap prototypes into a new header user-mmap.h
which we only include where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h          | 20 --------------------
 linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
 linux-user/elfload.c       |  1 +
 linux-user/flatload.c      |  1 +
 linux-user/i386/cpu_loop.c |  1 +
 linux-user/main.c          |  1 +
 linux-user/mmap.c          |  1 +
 linux-user/syscall.c       |  1 +
 8 files changed, 40 insertions(+), 20 deletions(-)
 create mode 100644 linux-user/user-mmap.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9e700d3af18..0cb79990579 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -201,12 +201,6 @@ extern IOCTLEntry ioctl_entries[];
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
@@ -395,20 +389,6 @@ void sparc64_set_context(CPUSPARCState *env);
 void sparc64_get_context(CPUSPARCState *env);
 #endif
 
-/* mmap.c */
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, abi_ulong offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
-extern unsigned long last_brk;
-extern abi_ulong mmap_next_start;
-abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-void mmap_fork_start(void);
-void mmap_fork_end(int child);
-
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
new file mode 100644
index 00000000000..e94fbd10433
--- /dev/null
+++ b/linux-user/user-mmap.h
@@ -0,0 +1,34 @@
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
+#ifndef LINUX_USER_USER_MMAP_H
+#define LINUX_USER_USER_MMAP_H
+
+int target_mprotect(abi_ulong start, abi_ulong len, int prot);
+abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, int fd, abi_ulong offset);
+int target_munmap(abi_ulong start, abi_ulong len);
+abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+                       abi_ulong new_size, unsigned long flags,
+                       abi_ulong new_addr);
+extern unsigned long last_brk;
+extern abi_ulong mmap_next_start;
+abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
+void mmap_fork_start(void);
+void mmap_fork_end(int child);
+
+#endif /* LINUX_USER_USER_MMAP_H */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d56e00c18b4..f770de31672 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "disas/disas.h"
 #include "qemu/bitops.h"
 #include "qemu/path.h"
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 7484a4a3543..99550061db8 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -37,6 +37,7 @@
 
 #include "qemu.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "flat.h"
 #include "target_flat.h"
 
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index db6dbf40cdc..fca0a75d8a1 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "sighandling.h"
+#include "user-mmap.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/main.c b/linux-user/main.c
index 4ec0e2ad55d..dfcdd80a563 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -51,6 +51,7 @@
 #include "fd-trans.h"
 #include "sighandling.h"
 #include "loader.h"
+#include "user-mmap.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0e103859fed..4b182444bbd 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/log.h"
 #include "qemu.h"
+#include "user-mmap.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d6019b1c4c2..1dd285972f7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -130,6 +130,7 @@
 #include "strace.h"
 #include "sighandling.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


