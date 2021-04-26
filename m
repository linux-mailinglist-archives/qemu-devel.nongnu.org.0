Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6993836AAE2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 04:56:55 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larQc-0001Uo-FL
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 22:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNc-0007uC-3S
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:48 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNW-0007Yl-QX
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:47 -0400
Received: by mail-pf1-x431.google.com with SMTP id c19so2086243pfv.2
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=onhoOryfDgjmYPnzWpW1QpsqON14NNGEMZe0Fnj1Tac=;
 b=ijIeKcOAlU9K4Ao1kbOVtj7oWAWkBFp/2tLT7eaFI3nziMs2oQtWMpVnP9yLR1OOjR
 8/LlkK/9hE0SrSNNrUanhaGudofyW8Bz2HnDX1yeUSByc8Kq1GzuGUuvAofxaP7J/92e
 TV8IPm4dkksY28KCl1246AOCf5QTlZJEsl1vUYGoaa463Ulw0JjrPEFXYDQAfq5Oby0F
 bpAkOicTbaEFdTARTaBDP9TmGpXdUDfmw/I5Dq9AMP3gzhmunylR+grA8QI5HL14fj6q
 KHve8+uo5psblfCr34WSN6n5MORsaAqeS1rpHUwxMAyohZHlvWdFAZ1uo3/B4gAZwIuk
 Ng4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onhoOryfDgjmYPnzWpW1QpsqON14NNGEMZe0Fnj1Tac=;
 b=Jb98qEB1Au+/C5cWwd+K+SEqKKuJlJZ33ncmuWClRIVq9rHgjpWClpBtGS+UmpFEqd
 x5ueAV++xXdMZiLqMwY+bYVXWmbkmJL4fJhhXqB1oe6doAUmLU29dWivl2tflSyscnsh
 OYXfwnYmho553YWCepLx2whsWXQIZaJU9uRLyRHVzFzVpqe7EBH+DffztioG94Rg4KgR
 sRLGoqxtKyTbl8LDzhl8tgXSXxaWXx21UuFFDxEfyGH1Rdu77brQnoC52SoQ3a6jrLaC
 Lv8C9L42bscxB2ecAHp973oVgrjwPOnZRAJ1c+JjTms9xdpgBSIdR+DKgZaWu5blaXmq
 m2CQ==
X-Gm-Message-State: AOAM532XbFrv2D1Dk2Bi713WTxV1T7zFWkHMEeQTGOyid3Y3zMYocHen
 qWPAQK/KP1TZTNX91kiaNSap/RQEkolxSw==
X-Google-Smtp-Source: ABdhPJyKVxpqIq6/HpYatN4tpkDaRpjs2f1+0ap1rDNos7IZ6WQP83AG6M4/NBdioXB2AGKFML96nA==
X-Received: by 2002:a63:2204:: with SMTP id i4mr14806611pgi.76.1619405621413; 
 Sun, 25 Apr 2021 19:53:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] linux-user/sparc: Merge sparc64 target_syscall.h
Date: Sun, 25 Apr 2021 19:53:16 -0700
Message-Id: <20210426025334.1168495-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are only a few differences in sparc32 vs sparc64.
This fixes target_shmlba for sparc32plus, which is v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_syscall.h   | 42 +++++++++++++++++++++--------
 linux-user/sparc64/target_syscall.h | 36 +------------------------
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index d8ea04ea83..15d531f389 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -3,18 +3,34 @@
 
 #include "target_errno.h"
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
-	abi_ulong psr;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong u_regs[16];
+    abi_ulong u_regs[16];
+    abi_ulong tstate;
+    abi_ulong pc;
+    abi_ulong npc;
+    uint32_t y;
+    uint32_t magic;
 };
+#else
+struct target_pt_regs {
+    abi_ulong psr;
+    abi_ulong pc;
+    abi_ulong npc;
+    abi_ulong y;
+    abi_ulong u_regs[16];
+};
+#endif
 
-#define UNAME_MACHINE "sparc"
+#ifdef TARGET_SPARC64
+# define UNAME_MACHINE "sparc64"
+#else
+# define UNAME_MACHINE "sparc"
+#endif
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-/* SPARC kernels don't define this in their Kconfig, but they have the
+/*
+ * SPARC kernels don't define this in their Kconfig, but they have the
  * same ABI as if they did, implemented by sparc-specific code which fishes
  * directly in the u_regs() struct for half the parameters in sparc_do_fork()
  * and copy_thread().
@@ -25,20 +41,24 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
 
-/* For SPARC SHMLBA is determined at runtime in the kernel, and
- * libc has to runtime-detect it using the hwcaps (see glibc
- * sysdeps/unix/sysv/linux/sparc/getshmlba; we follow the same
- * logic here, though we know we're not the sparc v9 64-bit case).
+/*
+ * For SPARC SHMLBA is determined at runtime in the kernel, and
+ * libc has to runtime-detect it using the hwcaps.
+ * See glibc sysdeps/unix/sysv/linux/sparc/getshmlba.
  */
 #define TARGET_FORCE_SHMLBA
 
 static inline abi_ulong target_shmlba(CPUSPARCState *env)
 {
+#ifdef TARGET_SPARC64
+    return MAX(TARGET_PAGE_SIZE, 16 * 1024);
+#else
     if (!(env->def.features & CPU_FEATURE_FLUSH)) {
         return 64 * 1024;
     } else {
         return 256 * 1024;
     }
+#endif
 }
 
 #endif /* SPARC_TARGET_SYSCALL_H */
diff --git a/linux-user/sparc64/target_syscall.h b/linux-user/sparc64/target_syscall.h
index 696a68b1ed..164a5fc632 100644
--- a/linux-user/sparc64/target_syscall.h
+++ b/linux-user/sparc64/target_syscall.h
@@ -1,35 +1 @@
-#ifndef SPARC64_TARGET_SYSCALL_H
-#define SPARC64_TARGET_SYSCALL_H
-
-#include "../sparc/target_errno.h"
-
-struct target_pt_regs {
-	abi_ulong u_regs[16];
-	abi_ulong tstate;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong fprs;
-};
-
-#define UNAME_MACHINE "sparc64"
-#define UNAME_MINIMUM_RELEASE "2.6.32"
-
-/* SPARC kernels don't define this in their Kconfig, but they have the
- * same ABI as if they did, implemented by sparc-specific code which fishes
- * directly in the u_regs() struct for half the parameters in sparc_do_fork()
- * and copy_thread().
- */
-#define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      4096
-#define TARGET_MCL_CURRENT 0x2000
-#define TARGET_MCL_FUTURE  0x4000
-#define TARGET_MCL_ONFAULT 0x8000
-
-#define TARGET_FORCE_SHMLBA
-
-static inline abi_ulong target_shmlba(CPUSPARCState *env)
-{
-    return MAX(TARGET_PAGE_SIZE, 16 * 1024);
-}
-#endif /* SPARC64_TARGET_SYSCALL_H */
+#include "../sparc/target_syscall.h"
-- 
2.25.1


