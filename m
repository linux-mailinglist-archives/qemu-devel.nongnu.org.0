Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77483AD2E3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:32:22 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKE1-00049N-Li
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBh-0001ME-3v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBe-0001P9-Fg
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so8694477pjn.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HS+I0dvUMHSdSBpKd/9G4tO8nimAsDvjzWITh6jD/wc=;
 b=PS5F61YQ+NVkboL5qTD/DEB9kwGdQ0/wMJDxhQcoWnq0aWUuMrRpSUwvtZ2OxtVSum
 ISLMP+VWs0Ibpd1F6iKUsxe2xTDCDhYcPjiUyYlCLN+SonaZjVOfpb+WgWygbEiXjZ1y
 MDKkucdkgvNWm44fQpd95iL5NX0iLgbXuS1DKX2RFTm3AxT830Z4NIcRN8guYFTILQzF
 aVJY9/bKWOkZVqOgTCtjXynXKiVh2ny2D+lZzmUftRUwsrG6eFiBZ1Z98E0LA4gZay/4
 Ot3/rfmaplvCX5mq3RJWz2TlG1fU4mmOgqoiNxSUA2F5QOpd7yTA9bOcTQnxwVQrs1Hv
 7i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HS+I0dvUMHSdSBpKd/9G4tO8nimAsDvjzWITh6jD/wc=;
 b=sms1XaNpRXHndXsYt6O1OtKgG6OZlHkkxpjhyth/MWNFgP5T+8++okiC477HfBHEWI
 0Uzp1Sxr2tFxDDDS0HlQPvWqzApg956WOay0ThQVL9bc2MX0JVcyVFXnwELBmTUZFdHi
 4gMLBUPPrMEzRdGxxAI/rv4yfrLudLx1hSzXwCsVh0OTl/ah58AavRCNmzJ7SOdQwCzD
 RfS2/PThar4HWbqmPgZ7h9CThxjK2vf1XZPHx9dMVjP7r9888b76NgTenr6/M3iREySp
 kVcn29wBBB17+BtmNgZ8ALXSYj6int+iSvh5EC1Pe3j135IjTyN+JPyEq3M8GlX0tnp8
 cPKA==
X-Gm-Message-State: AOAM532jrmOo0Tr98hzLvc5zcd95kXVd+5eKlo9k4zFScOQwJFHyz1RB
 fe1kJzozA4iGnWyeLipQPqF88htrTxLIGQ==
X-Google-Smtp-Source: ABdhPJyuHLSOlX9behXgraUi4MIt46YpL/jKd4JK37D4bOcFvNpB4ePb3h17oiB1QYTEbt2bBNvMGA==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr6155745plp.61.1624044593058; 
 Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] linux-user: Add infrastructure for a signal
 trampoline page
Date: Fri, 18 Jun 2021 12:29:29 -0700
Message-Id: <20210618192951.125651-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate a page to hold the signal trampoline(s).
Invoke a guest-specific hook to fill in the contents
of the page before marking it read-execute again.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
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


