Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50879424465
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:35:53 +0200 (CEST)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYApc-0001uv-B2
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdZ-0007Bw-BR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:26 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdT-0007yt-EJ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2911844pji.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vfF5CpQpkd7cdyzb6zgYmyDf3HKlJSu+7phvtw0Efc=;
 b=p27WFOf+sAmVdb7GD7NUHPrVIHKzma4f7rwwjEOGEwZpcQSbPnPDghGxLyRO2YLgIu
 VLmfPnuTIPpUO4BOJkWQcQMGLO+i7HUsjwqoV/on5gjXGL1kLzk5f4kF02jvafOGQcZq
 xzMFWuCAJ362MA98/PRmT65RZa6SI/YatEVwqDQteZoluyE+1vyrM+F+XaiYQsTDZKx7
 8tRmLLdRTnm4gzDeUznoEJFREYM3Yiuizdc1fuhohj3pyOHNmSgcnTHRAQKTor2wgb7u
 AZKca8N9gqS6mszrfxdDIu1AZBWWI1Cge9XRWC1HzuQLwi3v9EVHT3vDjulp8GiiFOQb
 fMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2vfF5CpQpkd7cdyzb6zgYmyDf3HKlJSu+7phvtw0Efc=;
 b=7uNoegaPu+hx7wTPeJBrQMQCQvSt04Tu1KBrI5TzusRMB4H0Mg9ND6Q0Gfn4RPxVcw
 Z1wZOIPRG60Ttw9Ra2VyHfV6gdc1fvV6D8exjxtL2BJOVlfvCXAXXZQgN/z57ho2+BD0
 S7hDWb/yiCJB7zV4IidtZh8hLHx2SfGFWotAfbYc+YkAOo+42ATQMwwReH3Uoh1QXjDJ
 j6G/jIbbB0nomQbanAdtRDSRC7Fmmim0/wOuYXe39ItJRkFmgbZ0b6eRDdaEMK/IUWA5
 U9Ba85JFGi3jMCICTINAqzSP9l4PmZ7IQK9LfaSt85gC8HAmuTyZLmo4FHATwBbS3ejT
 rZDw==
X-Gm-Message-State: AOAM533rsYwTWN8a/KuCRQsPZWYKrJQCGMCgkIod/zD1fUNgj3KMB1+u
 Fhr00MZjnLOriLT98VyEUfd9rHjk9hxESg==
X-Google-Smtp-Source: ABdhPJxUiQNEg5rDvpIT44+3abQ1VxqAZ+NtN92sjrVJYCOY+9vnLFCaRI97Z/tfn270Bna7VTmvUg==
X-Received: by 2002:a17:902:ee11:b0:13e:bdb6:66fb with SMTP id
 z17-20020a170902ee1100b0013ebdb666fbmr12085168plb.81.1633540995261; 
 Wed, 06 Oct 2021 10:23:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/41] linux-user/host/ppc: Populate host_signal.h
Date: Wed,  6 Oct 2021 10:22:34 -0700
Message-Id: <20211006172307.780893-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/ppc/host-signal.h   | 25 ++++++++-
 linux-user/host/ppc64/host-signal.h |  2 +-
 accel/tcg/user-exec.c               | 79 +----------------------------
 3 files changed, 26 insertions(+), 80 deletions(-)

diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
index f4b4d65031..e09756c691 100644
--- a/linux-user/host/ppc/host-signal.h
+++ b/linux-user/host/ppc/host-signal.h
@@ -1 +1,24 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_HOST_SIGNAL_H
+#define PPC_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.regs->nip;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.regs->trap != 0x400
+        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
+}
+
+#endif
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/host/ppc64/host-signal.h
index f4b4d65031..a353c22a90 100644
--- a/linux-user/host/ppc64/host-signal.h
+++ b/linux-user/host/ppc64/host-signal.h
@@ -1 +1 @@
-#define HOST_SIGNAL_PLACEHOLDER
+#include "../ppc/host-signal.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 06d507b4b0..49f9292ab3 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,84 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(_ARCH_PPC)
-
-/***********************************************************************
- * signal context platform-specific definitions
- * From Wine
- */
-#ifdef linux
-/* All Registers access - only for local access */
-#define REG_sig(reg_name, context)              \
-    ((context)->uc_mcontext.regs->reg_name)
-/* Gpr Registers access  */
-#define GPR_sig(reg_num, context)              REG_sig(gpr[reg_num], context)
-/* Program counter */
-#define IAR_sig(context)                       REG_sig(nip, context)
-/* Machine State Register (Supervisor) */
-#define MSR_sig(context)                       REG_sig(msr, context)
-/* Count register */
-#define CTR_sig(context)                       REG_sig(ctr, context)
-/* User's integer exception register */
-#define XER_sig(context)                       REG_sig(xer, context)
-/* Link register */
-#define LR_sig(context)                        REG_sig(link, context)
-/* Condition register */
-#define CR_sig(context)                        REG_sig(ccr, context)
-
-/* Float Registers access  */
-#define FLOAT_sig(reg_num, context)                                     \
-    (((double *)((char *)((context)->uc_mcontext.regs + 48 * 4)))[reg_num])
-#define FPSCR_sig(context) \
-    (*(int *)((char *)((context)->uc_mcontext.regs + (48 + 32 * 2) * 4)))
-/* Exception Registers access */
-#define DAR_sig(context)                       REG_sig(dar, context)
-#define DSISR_sig(context)                     REG_sig(dsisr, context)
-#define TRAP_sig(context)                      REG_sig(trap, context)
-#endif /* linux */
-
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-#include <ucontext.h>
-#define IAR_sig(context)               ((context)->uc_mcontext.mc_srr0)
-#define MSR_sig(context)               ((context)->uc_mcontext.mc_srr1)
-#define CTR_sig(context)               ((context)->uc_mcontext.mc_ctr)
-#define XER_sig(context)               ((context)->uc_mcontext.mc_xer)
-#define LR_sig(context)                ((context)->uc_mcontext.mc_lr)
-#define CR_sig(context)                ((context)->uc_mcontext.mc_cr)
-/* Exception Registers access */
-#define DAR_sig(context)               ((context)->uc_mcontext.mc_dar)
-#define DSISR_sig(context)             ((context)->uc_mcontext.mc_dsisr)
-#define TRAP_sig(context)              ((context)->uc_mcontext.mc_exc)
-#endif /* __FreeBSD__|| __FreeBSD_kernel__ */
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
-    ucontext_t *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    int is_write;
-
-    pc = IAR_sig(uc);
-    is_write = 0;
-#if 0
-    /* ppc 4xx case */
-    if (DSISR_sig(uc) & 0x00800000) {
-        is_write = 1;
-    }
-#else
-    if (TRAP_sig(uc) != 0x400 && (DSISR_sig(uc) & 0x02000000)) {
-        is_write = 1;
-    }
-#endif
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__alpha__)
+#if defined(__alpha__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                            void *puc)
-- 
2.25.1


