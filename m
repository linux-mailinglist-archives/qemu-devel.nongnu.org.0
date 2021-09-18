Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDBC41083D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:02:14 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfbJ-0005Ok-RW
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLK-00052Q-RL
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLI-0006m9-00
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id dw14so9179701pjb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sCS25t/S/07LT/4q9hu7ybFQaqd9aKvTlaQnlQkDGSw=;
 b=Vp2sGT18b2W/SP/8Cb+DZnoCgQy8OdRkWcjxnYVfJr5238XGvPSZPLJ9lC2m/fvZPn
 PDGkyeDMVzpxJvZXJFAR2tZHCLjoh75l8Alh+LHPLFgKIY/ZuDho0XwDvEfY90bcTwEu
 3tBP3ZyAC2QTFKlFcUfDEUNeu56Uqtze42EN8z5pGE3nin3kQiSTlOA/tGJV6XfiMA4/
 VXLPF2g2kmSEu1tnvk+INDqcxxrDynSjf7oC6p83eKcuirQzt3OuFQvLObPRwlyq/VYA
 V3oFRdgUR5Ax6j6i7f259gvO34znnxeRC0SVYw7gdARhWG6Se08dk3hCQvMKEOIDvee9
 UoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sCS25t/S/07LT/4q9hu7ybFQaqd9aKvTlaQnlQkDGSw=;
 b=0bTxqFFIdhlr7QyGoazalFQPGq1lAoE2DOxQsp0g9Mwyk+6wfmKsMhXrPE0oe1Z7aI
 1KPulMbamm8EXCOuSnIhaQLl5vauMiplhWOdRihojpkbeZwDbzQJ41I10Hkd9vEeQFLg
 cZYvvr5+kWqHRu2v08pxwqAc5lCY1roKYdjCWIzvJXdIcgJ3R1gPofTl9InCVnxqs0rr
 Uj5aEQ99BMzb9jnPpcU1K5WHj4HBNzP4JHzSWqlQ+jDrv/ktOvyrvmuWum3Uy9O2g5G2
 v7qfUrh6HjJRheCzGOk7x1I0WZ+IAC9CrCY1i3YucCyZTde/OeiFf8J0nzjIRL5oGC9X
 J60A==
X-Gm-Message-State: AOAM530FAUP5h1BXviiYWrnBwPwQpR7Trqw/727/zvIdhku1aOiQixYZ
 mIAqqMPZYcsE6oXghqIEfd6koWyWDSxOJQ==
X-Google-Smtp-Source: ABdhPJzZbN93aIOqQ/vZYR9u/3F8dH/AcxxDNPD1liwuSqCPoFv/HE3eqk/DBe2ttFflbRkjCFYZNg==
X-Received: by 2002:a17:90b:4b52:: with SMTP id
 mi18mr19506767pjb.112.1631990738295; 
 Sat, 18 Sep 2021 11:45:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/41] linux-user/host/arm: Populate host_signal.h
Date: Sat, 18 Sep 2021 11:44:57 -0700
Message-Id: <20210918184527.408540-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/arm/host-signal.h | 30 ++++++++++++++++++++-
 accel/tcg/user-exec.c             | 45 +------------------------------
 2 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
index f4b4d65031..6932224c1c 100644
--- a/linux-user/host/arm/host-signal.h
+++ b/linux-user/host/arm/host-signal.h
@@ -1 +1,29 @@
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
+#ifndef ARM_HOST_SIGNAL_H
+#define ARM_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.arm_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * In the FSR, bit 11 is WnR, assuming a v6 or
+     * later processor.  On v5 we will always report
+     * this as a read, which will fail later.
+     */
+    uint32_t fsr = uc->uc_mcontext.error_code;
+    return extract32(fsr, 11, 1);
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c7d083db92..e9c29f917d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,50 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__arm__)
-
-#if defined(__NetBSD__)
-#include <ucontext.h>
-#include <sys/siginfo.h>
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__NetBSD__)
-    ucontext_t *uc = puc;
-    siginfo_t *si = pinfo;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    uint32_t fsr;
-    int is_write;
-
-#if defined(__NetBSD__)
-    pc = uc->uc_mcontext.__gregs[_REG_R15];
-#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-    pc = uc->uc_mcontext.gregs[R15];
-#else
-    pc = uc->uc_mcontext.arm_pc;
-#endif
-
-#ifdef __NetBSD__
-    fsr = si->si_trap;
-#else
-    fsr = uc->uc_mcontext.error_code;
-#endif
-    /*
-     * In the FSR, bit 11 is WnR, assuming a v6 or
-     * later processor.  On v5 we will always report
-     * this as a read, which will fail later.
-     */
-    is_write = extract32(fsr, 11, 1);
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-
-#elif defined(__aarch64__)
+#if defined(__aarch64__)
 
 #if defined(__NetBSD__)
 
-- 
2.25.1


