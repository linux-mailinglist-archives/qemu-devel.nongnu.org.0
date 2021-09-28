Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA941A529
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:13:34 +0200 (CEST)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2cf-000474-1M
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QQ-0004a9-Ma
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:55 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QF-0005d8-Hz
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:53 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id a14so12479608qvb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=nV7wlcqb5AJFq2ES+S9KhcKm6ut6yZJBkQL3faOofSs79WBIxDY77TnVlM0HlD7jtj
 RjWPWqGrufS5atKJF4hB64T0SeKA2qYHRF4rtYQwYzI5bWgN+dSqINZobtHDi/zNIOuq
 g5Kpln3bKwGgj5jeXNwIzjiSMIgM5VzJ7cbfZceXzMzZ8O35XIT3XKNhZi6YG2v55304
 OesCUuSrf4MTtvG1qvULy34s3leAdMMWWFXmnMRctQltiJz7fuMcarfAPh3QFwdQrxuk
 vyd6UCuk2KRWhe64N4wxzl76XOJ/MhK/DA8O4nL4ud/gHhLD3VXoyqVDWdYVcsEubJmY
 COXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=4jAdR4qr3tLw7HL4U3S8Dd9zifMDlXDOW/HIfWkCGIJbzYnqP64Yk0tcprQL4QBD1B
 Yvx3xXtubRYc0PE4NUEEYcX/4CKnTItWyi4skZsBsGCwHOB3byJlV960XBh+LpsbWMjc
 hCb74sEi528m+p1JR/ZayWV9TZW2G84XP/Nh9OJ9AfyrKZf5RU6XDY/wDWUbQbZ4c4Xo
 RZP6UOOC63rXCgKe+tjANQlFXv+BGBNKDaj/268CHlmXb6p9Bjd0dBJLcFr64kUSNMw/
 A2Ia8JBX7r8b8y8fXJvPXtCJEzpIsLe7uv6MvK0WzgUTCHEbVJdAO3JcluM3kq0tvmKC
 AITg==
X-Gm-Message-State: AOAM5323vxzMu7kZ6B3Fme+C7q4k90c+HTH2unRSKLFWbpZsisWbm6Hc
 5viRYQ8FamYP/yM89sUjn6vV+wouN2lA4g==
X-Google-Smtp-Source: ABdhPJwrz4BHLnWPuIroy8JjDLLWITAXh+Zm5hyLTDp1n06+bnLFoQvjDIbyg26Auy26cvB7WuYB+Q==
X-Received: by 2002:a0c:90c8:: with SMTP id p66mr3022573qvp.55.1632794442563; 
 Mon, 27 Sep 2021 19:00:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/25] linux-user: Add infrastructure for a signal
 trampoline page
Date: Mon, 27 Sep 2021 22:00:15 -0400
Message-Id: <20210928020039.184412-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


