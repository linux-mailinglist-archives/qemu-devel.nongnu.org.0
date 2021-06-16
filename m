Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C93A8E37
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:19:38 +0200 (CEST)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKDS-0000U0-0p
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6L-0005FK-88
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:18 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6H-0008Kj-4O
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id a127so811809pfa.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Co+NBcn5XBK+DAK9xxSpgD2XDizycUSYP6OtApqx62Q=;
 b=Pw51J59mq5JRdg9bnCvPTQZYKrPezZDqcSHo1q1pQ8ScRJw3GaukrPvVgqcE+gsnF7
 LBUscSJc7VSox3lGwWQq9JLOBIyyoNId93K8FGt8VgERv2P+dOh8b57/TvIveQ83Jwxt
 CHlAzZtuBvsdDYv0ZbK0LqguZuuxjxUoIKRr9K79AGD2dxpDfT5IsxOKjjLELhmAq2z3
 txAE56yqjyeSfWX5uJVjtbiOt/8dHMAsRPrtzRNry31+Kqe6RFLeEaF3gShN3wwNO3nq
 zqqH9ZXu/9HEVNyhrK0NYsX7xANDqMs0HcYDpCrpEDTNTpuRlFL1tJK+O9aZfmwOjZYb
 CVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Co+NBcn5XBK+DAK9xxSpgD2XDizycUSYP6OtApqx62Q=;
 b=XBFyNENFrMOoe2obsAObxnONmssMahGN08SQf4GBkd+B73axXj4udrOULVbsRYdCvG
 F4/uqcM288t8N56JrcarQNeiEtueERCxco4M8fpWfxtj8ByNtsATIEKyb3rnwRc/AZ4c
 2fbfxl0AChNGJfr70ocHpKCduclecm20Cc/fGeo9DFxIm4Jm5rRDItCb7gcb04aL3xlV
 T1KkQUQEx6978nHUjjtYvNIr3Coi3gYphPwbzo4fhg1j+/EoNVa9gj2ga5ogTn645U7E
 udtBUG2QO1ndev8lpR7348zM8UR+qoLaiaDLe4Nm6vf2gRIEIZLjy5yz6IqAPMVTkSrx
 UAnQ==
X-Gm-Message-State: AOAM532pF4AFNVvXKzTDdVK2mCgxeAbJyanjCtjId78VjER4C/lV9PJn
 Qm7FHJnuCTifjDy0vUNG3WqNyV24Xtd4Fw==
X-Google-Smtp-Source: ABdhPJxygKWn4fmH79Y2Z1AZtQtVo/Aq1AhQO7YHw9/NANQQvZ/395ZJwTjp78AaddbrNta40FHSHA==
X-Received: by 2002:a63:1163:: with SMTP id 35mr2394155pgr.400.1623805931284; 
 Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/21] linux-user: Add infrastructure for a signal trampoline
 page
Date: Tue, 15 Jun 2021 18:11:49 -0700
Message-Id: <20210616011209.1446045-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate a page to hold the signal trampoline(s).
Invoke a guest-specific hook to fill in the contents
of the page before marking it read-execute again.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    |  7 +++++++
 linux-user/elfload.c | 17 +++++++++++++++++
 linux-user/signal.c  |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe..9e5e2aa499 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -437,6 +437,13 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
 int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
 abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
                         abi_ulong unew_ctx, abi_long ctx_size);
+
+/* Fallback addresses into sigtramp page. */
+extern abi_ulong default_sigreturn;
+extern abi_ulong default_rt_sigreturn;
+
+void setup_sigtramp(abi_ulong tramp_page);
+
 /**
  * block_signals: block all signals while handling this guest syscall
  *
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612..7bc67ac9cb 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -14,6 +14,7 @@
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
 #include "qapi/error.h"
+#include "target_signal.h"
 
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
@@ -25,6 +26,10 @@
 #undef ELF_ARCH
 #endif
 
+#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+#endif
+
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
@@ -3232,6 +3237,18 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 #endif
     }
 
+    /*
+     * TODO: load a vdso, which would also contain the signal trampolines.
+     * Otherwise, allocate a private page to hold them.
+     */
+    if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
+        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
+                                           PROT_READ | PROT_WRITE,
+                                           MAP_PRIVATE | MAP_ANON, -1, 0);
+        setup_sigtramp(tramp_page);
+        target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
+    }
+
     bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
                                 info, (elf_interpreter ? &interp_info : NULL));
     info->start_stack = bprm->p;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9016896dcd..2f19cc0bf6 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -30,6 +30,9 @@ static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_signum, siginfo_t *info,
                                 void *puc);
 
+/* Fallback addresses into sigtramp page. */
+abi_ulong default_sigreturn;
+abi_ulong default_rt_sigreturn;
 
 /*
  * System includes define _NSIG as SIGRTMAX + 1,
-- 
2.25.1


