Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5D41C53E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:10:47 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZME-0003GZ-IW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHg-0005yd-IZ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:04 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHe-00061p-R4
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:04 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 h11-20020a4aa74b000000b002a933d156cbso728725oom.4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=W3/43XY8bHaGGHmnCw7HV+qJgnZt0ZWfKU2X1FkPklS1TUAulNtWe5RVdppZVXXsGC
 fHpNig3+eOLRYpUYuShCkDgir1V2BFIeOZYM5RklJWteXhzk52FqPeFMWAXTHPF9uM/R
 12d6v7w5h/nXSwAQ0+uHHGTtd/IVveIhijkkB7wjp5Yv4Aw2KydKbl/ZY/COVBVYKbPB
 Hc/glQrwZyDfqgLedMDXZJ2GeVGo15sxk/p82RTKlg+u6R6SfUwCZ6RhkX3S8FTfQxLB
 3TDiXlWYT69gHpxD1xDavHasY2MEgZtC3nskuNqeQ5BSWWfZJq+/tHseqIy8BRW2ZG1n
 9a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmL+joXfoW+8Wn51iJgMBifiuqpS0R+kHN3F+bMNUq0=;
 b=C2vC2s2PpwtyXeEjf68AR1yzTtvxmqtns+LBwP8jMkYB/b8OmiiUtUscoFL1avGgw5
 +Z9HhCxBTZh/5SF6HwjNwB/sxWuWL8oZx5NacFW/7ic2P2kF2fPFvfkf7pM7sIE83TzP
 wYvoh/PFixjuGqtnwpSsgeXF0hYm0LAoD1ORhcrLiyn+SmpT09SE7tT7MOmsJkzcUAqG
 u7rKqXYYlzPDk9BYOpjauGHSSG0lvBubhsFlDnsYKVDQ9lnLgC78ZCQzdXhUINv4YoJz
 +9H1uBa9H/EwCQSzgMD+wriiu3psIZfsLKCL3LuiNLQ0ValeIfTr/DE58I3Sa1Aw0Ci7
 sQNQ==
X-Gm-Message-State: AOAM531EZ6A3dp2xKsMqHQK+cBcRl+v709F4JvT69zNJ0GToOV9qVIxt
 rbbpEMtbCGLuOG7futZC5l4zibwD3OFJ6A==
X-Google-Smtp-Source: ABdhPJygBtC84DYf+g68v2zDA/sM0ciVhHR7yvo05twFwhmzFingerb+KChgus8oMxf/QGwtIxRVDg==
X-Received: by 2002:a05:6820:28f:: with SMTP id
 q15mr951359ood.78.1632920761302; 
 Wed, 29 Sep 2021 06:06:01 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/26] linux-user: Add infrastructure for a signal
 trampoline page
Date: Wed, 29 Sep 2021 09:05:28 -0400
Message-Id: <20210929130553.121567-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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


