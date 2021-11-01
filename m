Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D0A441F8B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:47:00 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbOd-0002NM-2X
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5z-0003V1-V5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:43 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5v-0000bD-TI
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:43 -0400
Received: by mail-qk1-x729.google.com with SMTP id a132so16128641qkg.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TZablReYyMhZZRtuFhH4b/hnVjulBdbu56o5gMwMndM=;
 b=Yws3637BZ6sm9fDtMzA5i18gQECM5451RiYVxuiB151N7JgcCGRHAHKTJdV9/SfelX
 0j9LvcD8SrAqmSodggnltT39MtGHYMR//cednKxjWS81E7Stt0XacK9ErENtL2SdqkNt
 QL3+I+l2YWui1P4S05LYbRqbMe5fUxW19JOFJ+E7TSASwSJUcCHmFwCpxBJyNYo5DVIp
 YIcCWtO2sQWWg7ioOjYjHDGIQP4vES5Hhdt5W2wB+z2uDzYCSW5tEkqoucHL87UP9RIM
 3ydIye0o4DqBsaCQPigOkhklPuv0gX7bE2zwVo2yoEAfOk1R02eYvZuRz8YA5cAc8vhu
 tMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZablReYyMhZZRtuFhH4b/hnVjulBdbu56o5gMwMndM=;
 b=xRNCWDG4TTW1Aylpyt0+pLCo+H/SR55+aftrAOWs66xrJX9itFeODbpnCxfnW3BClo
 nHBia/PBEzRyeNUMeh5tjSuOLDYxqeQ/wLllokXONIl0Joo0ijq+/1OZtUURXdj5D+vs
 Qv1GQoKBzCkeNxjfLVG/ZqpyIfn/f1z1Ot7yp47KZadYPGgHGeoicMfL9RLFKseu7Xm8
 c8RukYHDGiZsFpuRjb1QmW+jt1xvZcYPchtsBym6fEiUNkGBwLCySkVstlGP6EJZ15b9
 WBK5HM0EE1HFaMCMFRoHYVb3H3fnobxsehzl5dkKkHErhc0J2akhoO4o4M+DukoBGQ5c
 4Y/A==
X-Gm-Message-State: AOAM532+9uURvvDzy2J5jKFDAyZegRMTXvDwX9epgAXxd+L5egsGfhrv
 TXjaomyAbRutK1wVDTCPQzVMx2HJxt7sqw==
X-Google-Smtp-Source: ABdhPJydHIEihn330nFldosUZ5C4Nsl0ApfKrAXe0gzqaSCFOp+DMAuzdcxjnzGHK0QSTQNExNyDDg==
X-Received: by 2002:a37:ae83:: with SMTP id x125mr24420211qke.37.1635787655611; 
 Mon, 01 Nov 2021 10:27:35 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/60] linux-user/host/ppc: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:37 -0400
Message-Id: <20211101172729.23149-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Cc: Thomas Huth <thuth@redhat.com>
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


