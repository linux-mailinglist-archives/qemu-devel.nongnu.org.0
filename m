Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5239442C76
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:25:00 +0100 (CET)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhruV-0007N7-BK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0003jd-QH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdr-0000sF-8p
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:53 -0400
Received: by mail-qk1-x736.google.com with SMTP id bj20so7951719qkb.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/7KXVD3zq87x6TOe7PU4RK3OGzoSoejAMrm7z+tUkk=;
 b=aEJ791NdOwLJ3MBpD57UXs5LdjWjmtoREtOAI6CCNAe1YYkzZZy+v1+UIjt+X7pIro
 IIpFEjL0M2srSnjn+zO5f5JcVBbfHefDOuluox5Ihnuww9XG9GupeGULwPlPSMoMTwJ8
 oH3zIa3jIRF+KH1BDQSq8diajZjYEmA2+ThdL8813beVAOFmDvqEb3kSnKlewWwXs7gF
 QUh8XsPGWUdkrAmDK0jJ8tpAha9F3GBQO9H+JtiEtDWOs88XSDp5/PvYEkempvLKEBGM
 U7Ch05dyDtfMy8bWaIzvnARnLYH6Tuvvg7yZQi0N5iRrZiB9+kszlT38Ef/k5k1Rh5j8
 6yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/7KXVD3zq87x6TOe7PU4RK3OGzoSoejAMrm7z+tUkk=;
 b=2ZDSHfyTFjTtuV6jUskCFpS1p6wFi+hPlPb+B1xXxEqRumuEvfZv0eQr/ya/oZxCQP
 QU3kPoQdLaTZrVaTvx2o4mHaberBO29M9xv3Muf4w2LKk1qx63bGGzubNDFBNQKJ4rUS
 FJJiHRUK9jFTPdEVdfL7QvCuCMf4lifJ233Nag8shFvOwxwzgB1eaqAXL+tt+VSR/F+/
 QI8synRvzC+mBvWbKm8nRv/D4yOeAVlYb6UdkpGBajVYEtk3GtHG88/GTlAgOnsmEIo6
 QNjt9sStnbOmUiWDqs4eVcLzjsA2W1rQ5oLBcAPYsC8TxIw+jEDH56evXIZ8mB8TY9V1
 1ZGA==
X-Gm-Message-State: AOAM530BLcYONRYwxNxPPqCUBPcMZVQQwFPEcAEDydY77Lub2GXSCABu
 dy019tIRmse5VImSV3Rk4kC08xk4Uxn/vA==
X-Google-Smtp-Source: ABdhPJz63HdGoVgPYpkiD3ftEZYl0dAKDa61Xjtu3gwHNz2yzLMjPAfDEDNQo8TTbo93XnPTohVqGA==
X-Received: by 2002:a05:620a:2910:: with SMTP id
 m16mr11515492qkp.389.1635851266289; 
 Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/60] linux-user/host/ppc: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:48 -0400
Message-Id: <20211102110740.215699-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/ppc/host-signal.h   | 26 +++++++++-
 linux-user/host/ppc64/host-signal.h |  2 +-
 accel/tcg/user-exec.c               | 79 +----------------------------
 3 files changed, 27 insertions(+), 80 deletions(-)

diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
index f4b4d65031..a491c413dc 100644
--- a/linux-user/host/ppc/host-signal.h
+++ b/linux-user/host/ppc/host-signal.h
@@ -1 +1,25 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
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
index b121e6c2e9..5a0a65fa46 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,84 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


