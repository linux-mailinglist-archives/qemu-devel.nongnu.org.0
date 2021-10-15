Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F642E7A2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:18:48 +0200 (CEST)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEgB-0004PK-CS
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYm-0006yL-I9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYj-0000B6-Ew
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c29so7319846pfp.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZJwf7vUbtVzNt6WsxVhQTwK2EfiB3pa1Mn8uyvrhI4=;
 b=gWmcTobFCd0EJRqpTcf30s/KZwMfLMTvTUd0k1gbTVKI+jOQx/2FugOpJFqLeunKt4
 d0FwtPoTDeBZRI+m/nUlYnsXDICe5eksAEedefTeJfOmqbPBr/UbdhBRVC7QN31pz0XA
 pnCuHF9rYAg6Os7z7Irg95CpOGbbXKPJ0nDamJtqNG63dyZtixNNxRv/tldnZMH9oEnW
 qRQEgGoDZ1wbiKbxUJhKouk8WkV2KOqmMaAT00Bb9tAcv1f2ytwPd25EE/Y/SotLBMvV
 QelRouqiKNCBBlWJDctTTQC13EP8SDqYTyNee5cIVbxv0FXCcbaIEgPUxrbN140WpnBX
 /RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZJwf7vUbtVzNt6WsxVhQTwK2EfiB3pa1Mn8uyvrhI4=;
 b=uj7fxa4Emwe/EFAR60jQmKK4zXGZn07XEmpZHG5tx5RjUhYfB31Y8ekNJ/IC2WgjSh
 DSOCVejgBEHP8ajIeZHS9jD2bMkL6SDhxoAKh+9VD07F8tdyPIn+oQZuVTSWry2l5866
 CXy88NGoRYpybVPFQGNimLo3tb96p8mnZrcvIXgbTTDzkfBkWb7z6HOwr+FUYZTx3OW4
 ZwaiYonVsg/IDM5zC7yrSu6ubf8+5UkEgK0nT37PL7wyKU3V2N01934Smc6At07EuIOx
 6YumcpNBWS8879n79a9GfhmQ9RtIpqN59fA/7U/PSbyItIM6hxWVULKO1RXLHCeJiCxj
 3a3A==
X-Gm-Message-State: AOAM532+tWHKNFdzQt/FiircJ+wgVRkpr0X5hg9mXw+AAbBNllsb8zdm
 wSs578JNnn308iUmkDe6BdycS9jzcAZhcA==
X-Google-Smtp-Source: ABdhPJzV00RNyA3oi5IWOXcxVK6l+ZNohJg/ISm9ynr1Bqkn+pZexIWweDv4IM2hIzgB+urCwxlAAg==
X-Received: by 2002:a62:1553:0:b0:44c:67cf:e669 with SMTP id
 80-20020a621553000000b0044c67cfe669mr9411921pfv.55.1634271061670; 
 Thu, 14 Oct 2021 21:11:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/67] linux-user/host/ppc: Populate host_signal.h
Date: Thu, 14 Oct 2021 21:09:54 -0700
Message-Id: <20211015041053.2769193-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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
index 474cb9cf82..e0cc765069 100644
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


