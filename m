Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8494403CD5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:49:53 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzpf-0006FF-Ap
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkE-00068V-T6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkC-0002Lv-KX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so4006132wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cico1935aZ+ouvJ30MSpc99vW9JRgqOJLkW+Z15Bupg=;
 b=VPoLs/rJ03/nB1+y/t5mW2V6H7iuSU1pqkmqrbtTmCZfCUKl+nRkWwprzIjPiRVo83
 lUSAh78u5k2PPAH+G6FL9U5DpxoE+l1vh0M7D7+sCv7ksOMa2CF9dIfy62MrduRGrqp0
 qa1iBGAGBVo0jN/EwPlYKnugsMc41K9p4SOozAHpEY8XMqJC4Ya2KLRCEiIUGtHJ8REG
 M/hyJPNxGB27S/a2Val9NP4F1Rwm+bNaOMNUA6qEnHsqiXFyi7K16EH93QwKiabC/cSA
 tQPQQ0mxB8HS0u9+ZXepTGh1AqUG+pytTj7egPxqmuE1u9GCtyULaTLVALjusk2u/qYt
 0yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cico1935aZ+ouvJ30MSpc99vW9JRgqOJLkW+Z15Bupg=;
 b=kp4i8jCpPEPkeusCw/IDzxVl44wdg3VpsPC8UR55Cx4P/3o/rjarpaTav/IK4RFDfC
 po0qEVWGhGpvRARm0HZQtkDGndyfNQBX6UI4LuidXZa0JXPpZ65ireYa2WAfDqGedzwc
 4yD+gz6rY84gWr6iIojxyYnOukwHedluDW+ZY7/mU7VLzBEt+qVIrChCXOJccZ7oMxkn
 gwamgrhiH3bKtZaby5KeTJtbyfzRkJUlHsXWw5OIcW068dR+4gC282MgGO+zv9tQpiHu
 DEc2rmUrP3f3J4bEFjuqwZqwyQZHWnmf7P/n2ZOYLMyyLS+IIEtz0OniyygUvzEBvv0E
 p81g==
X-Gm-Message-State: AOAM530bW99Un0gCy8fxjoec+5nKedD0xPpBtgv43MzSXlmsa7RammOg
 xVAmuYL4KMQrxU1QXINGUn3IYdvNxsM/+g==
X-Google-Smtp-Source: ABdhPJyHdCi9dez+czNgjfzgkmygvMuHRD6OCBvGGj22hBP9S55BkWunxaOT/s0S1Bh7C1fyowlIHw==
X-Received: by 2002:a5d:56c4:: with SMTP id m4mr3989856wrw.225.1631115851260; 
 Wed, 08 Sep 2021 08:44:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] linux-user: Split mmap prototypes into user-mmap.h
Date: Wed,  8 Sep 2021 16:44:01 +0100
Message-Id: <20210908154405.15417-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the mmap prototypes into a new header user-mmap.h
which we only include where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h          | 14 --------------
 linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
 linux-user/elfload.c       |  1 +
 linux-user/flatload.c      |  1 +
 linux-user/i386/cpu_loop.c |  1 +
 linux-user/main.c          |  1 +
 linux-user/mmap.c          |  1 +
 linux-user/syscall.c       |  1 +
 8 files changed, 40 insertions(+), 14 deletions(-)
 create mode 100644 linux-user/user-mmap.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 02c4778c970..0cb79990579 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -389,20 +389,6 @@ void sparc64_set_context(CPUSPARCState *env);
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
index 00000000000..d1dec99c024
--- /dev/null
+++ b/linux-user/user-mmap.h
@@ -0,0 +1,34 @@
+/*
+ * user-mmap.h: prototypes for linux-user guest binary loader
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
index 6244fcd05ce..c291f3cee09 100644
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
index ee2e139a063..fcc410a426a 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
+#include "user-mmap.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/main.c b/linux-user/main.c
index 67c5a87ffad..a76aec73368 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -51,6 +51,7 @@
 #include "fd-trans.h"
 #include "signal-common.h"
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
index b1cd7410d8b..b6c8406e1dc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -130,6 +130,7 @@
 #include "strace.h"
 #include "signal-common.h"
 #include "loader.h"
+#include "user-mmap.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


