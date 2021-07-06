Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1773BDFDD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:51:34 +0200 (CEST)
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uqj-0003Rj-IW
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uor-0000gj-Eq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:37 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uop-0006as-FH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:37 -0400
Received: by mail-pg1-x529.google.com with SMTP id o18so383554pgu.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIyLE4ZuKOJBD86psPDmEqSsQf6PKknNWhMLksJinUE=;
 b=t4YmFwWTTdUDGGmvYJtNPTODBkCkCOlKY+HO+Fh5IPsJH4GdL4dH15/Sdi2Ty03pEq
 FNdB8u4toqY7SJAMq9vy+OQzx73Mn0xD27lKr9f1PiuUQOBilN97VQjZx4w/gWXl1RoX
 IQsumo7d2Kq9yPBfyaD8W3viSrdyWHMU/byZYqMqZO4bj5Ect46ZQ9VXAH9GU8uX/Vuw
 PfG35JsLCYIYFmuW0aqwl1nfrHMYxpzQ6gy4gNsIJBg5U1BJb4OVfG00SmSgafJkO0rx
 CTlXfgXcdsH2i7/CdNStit0jN6JigvpSj/JUfyK5M8eCRfQJ3FyqnNjNtqUo9KUjz1nF
 OvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIyLE4ZuKOJBD86psPDmEqSsQf6PKknNWhMLksJinUE=;
 b=QfnvsBT2WA16c+dTH+4vdLZgFW50YsPOxIagSIDd9ItczeVMHW6FvfrI+rKNZOAhYx
 8ZygqPXOq9prRp9vPbksW+JAWUpYRfNcLamtZBaSd2DV6BRfBkG3ipUQHnz5hGDHJCVd
 j1rTcr+kHu+sMlYaxLMmScTIJhwtJud+aKKcMg65hHHqKDC990GjSF9/WK7ChM7bZAJJ
 ah/XVMh0bWrDaC+Sd78QkokiR+sMwAPW5h7/1uiTjkpS8Kld8+K3U9NTS63ODJa9oVSf
 kFzGyriYTcFYfKADzzlLulVpiY8sHygagh/uFVFLlpQyAUIjuifvEj1Eq6DId/D9bF6Z
 9v1g==
X-Gm-Message-State: AOAM5303QgoR6l5EjoesHl24pOl30cYNf8UrGCbolh58Wqi3ESms6Im4
 nG9ExFC2fHicliNBZISIwV+QqfMvopJoAg==
X-Google-Smtp-Source: ABdhPJxgpGV885rIozMZywbaFN+SJqGW0gcDtuiN/rcV10Cmo1TTqOaqrqSvc37DrBZbBU2iWXD9Cg==
X-Received: by 2002:a62:6c4:0:b029:324:8262:b3aa with SMTP id
 187-20020a6206c40000b02903248262b3aamr3065112pfg.25.1625615374148; 
 Tue, 06 Jul 2021 16:49:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/36] linux-user: Add infrastructure for a signal
 trampoline page
Date: Tue,  6 Jul 2021 16:48:57 -0700
Message-Id: <20210706234932.356913-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>,
 alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate a page to hold the signal trampoline(s).
Invoke a guest-specific hook to fill in the contents
of the page before marking it read-execute again.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 598ab8aa13..9bec6613a2 100644
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
@@ -3233,6 +3238,18 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
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
index a8faea6f09..099374d456 100644
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


