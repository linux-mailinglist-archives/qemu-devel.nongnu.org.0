Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69E417929
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:02:54 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTob6-0005ZQ-QH
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXx-0002dx-2H
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:38 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXq-0006rS-0d
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:36 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a14so6648490qvb.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=xfAv5iPtHAieHsIzSI/p1Ty23DbheWyX3t4bsn4MClUY6i59zpx8PcKP4794BPIgoV
 pfWQKnJe5+OqccwWiI1pTfvv3jNj8bAGrBOB7rJLJuoGm9ILv5AdTHvhX3A/YfYZt4dR
 xfSNNqbxjwciypCFwQ6G19aWGXywb+X0dt+EvojjpE2e1I5d0bDrPE1gAyyF3dQZ4K7N
 BXRrGViO7p7t/jV667+NetbZOExWc8z/i7eGFoTo25rUWP+uVgqBa4hEWv3WPUh0Gp4T
 GEE7QASXo9PFTZtiCrCMKdC+Zoy/rtqV0JVvemmamev45an08Ze+lPlJweoaGZCJvffH
 XaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=Z1e/PnHMrFNY/JqFfE0bPseuGlwPvyGUvx3KldKahEm9zI0pRhh7dWCAw4yA6CmAKi
 FSOzfItu8Hj+osN52PqZmmFHpE5lKwQXK5DOhd0Tx/TrzjjjO6wZm3QGXoMq4etVTEwx
 YxhBscb3/DFURUuDngPULxYrMnbo+AaOyEfnSufgd7HxY92h+UuZDtmWrM/C80yOiUsS
 7UD+3t9d7WJXeHY8qtc2fVn2iy6Ja1MU/hjqIsAiBcBH+c7c4xiWoAW5UNcsB9TRgXwy
 ioQfLgQkdkCf1Xr0e1YF74CnvLiOc1iY1kehYjuBCl/7IiDUdU6Gn2pJtf/AK6Oqp5xL
 +Tdw==
X-Gm-Message-State: AOAM531UIorv4kbEjhuL3XiLEvpK/bY92V3OIhIOFRPE6Xe0orqAu18B
 dASwLaGE8hnzVI2MfU6Ax4W4Es7srohUwA==
X-Google-Smtp-Source: ABdhPJz6WqI8eaMl1uWaYwCGwV/k/XOmG6amKwoTTXyCouwGERAOkhxAPm9Mo96A3dBI8aFv6vWDfg==
X-Received: by 2002:ad4:4629:: with SMTP id x9mr1451260qvv.58.1632502769084;
 Fri, 24 Sep 2021 09:59:29 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/27] linux-user: Add infrastructure for a signal
 trampoline page
Date: Fri, 24 Sep 2021 12:59:00 -0400
Message-Id: <20210924165926.752809-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, laurent@vivier.eu,
 Max Filippov <jcmvbkbc@gmail.com>
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
 linux-user/signal-common.h |  6 ++++++
 linux-user/elfload.c       | 18 ++++++++++++++++++
 linux-user/signal.c        |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 79511becb4..7457f8025c 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -20,6 +20,12 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+/* Fallback addresses into sigtramp page. */
+extern abi_ulong default_sigreturn;
+extern abi_ulong default_rt_sigreturn;
+
+void setup_sigtramp(abi_ulong tramp_page);
+
 int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5f9e2141ad..459a26ef1d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "user-internals.h"
+#include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "disas/disas.h"
@@ -17,6 +18,7 @@
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
 #include "qapi/error.h"
+#include "target_signal.h"
 
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
@@ -28,6 +30,10 @@
 #undef ELF_ARCH
 #endif
 
+#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+#endif
+
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
@@ -3249,6 +3255,18 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
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
index 2038216455..14d8fdfde1 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -35,6 +35,9 @@ static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_signum, siginfo_t *info,
                                 void *puc);
 
+/* Fallback addresses into sigtramp page. */
+abi_ulong default_sigreturn;
+abi_ulong default_rt_sigreturn;
 
 /*
  * System includes define _NSIG as SIGRTMAX + 1,
-- 
2.25.1


