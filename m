Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2222440AC0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:51:46 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsW9-0003KE-Uo
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryO-00020S-P7
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:52 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryK-00007T-ME
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id n23so2348787pgh.8
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+c0oxO/KqkWahATCsn/ry8zft6rVGU+nYtnuTkgrVg=;
 b=EC7dLdOfmVdUrgDhCF7NCut2nPF9drNieXhjzbdmwjJtMSUhyHk6wBgilcaRgLz26k
 Sqnl4BHPnCjXc6wxraxYeC6FO1VcCXbHs9/O3z1z5l9fZSOI/q1+3ZdI8kUyEzFiUMW1
 cqj9eq4wU3m3EOYMc8pdQRKPFSbcpzDQxZr7bhNLMFUG5r/QVkp13yrinF46aP7EkUVu
 tgMiGejv7oAD5216lse38mQfVGptBhF5dBla0EVaRUXJVxeZPSpSEjRrTbRcLiaKBLjU
 bEQFFZ7FOqj1fr9Sw9XQrrjvy2LUee2A1C/4AqZPD7pPUCBpGnPs64keX1KraMFKfr1h
 GTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+c0oxO/KqkWahATCsn/ry8zft6rVGU+nYtnuTkgrVg=;
 b=UaiOYfZNLZLeoNPgTCMw8reRj5ZoH+EPsGuZ/V+oofwNFzHLL/1hIrYXDLmoMD1dBS
 bfDNoCauvg64GJTi/+tv1snLQ33gy4ilz53kdz+VKONtci/gWKpD3QTmTiegnsBwa0yM
 SQa9N0mv53JWYqq59txygJGDptTNZtOH8unQoZ0gwcF3SuVMYef7bWy9ONb85oKw84hb
 hqGJrI7SXBeMpXfyXEusyT82mZsS7ylQkYC250F3V+zzQ+QzLqBzOnWqulnc5pm2gotU
 j24p2qI4Ia7zAFvRcxE8QWI1aikyJXRhR2CKeUiQ5Vnl4J94+4AOUkv7uLe5QsGULZXW
 WYnA==
X-Gm-Message-State: AOAM531hXQS3Yf95JjKnYECL1/dW5ADa9gmCpmr4Uc9ltlZHUbsjiHZj
 oIC3Vq76+RzouoS1kD7yLAvh/qYrWm8hlQ==
X-Google-Smtp-Source: ABdhPJwJVQVE83PLrjWmfdNxq8BdKRXH+VsC3XT2JDGlaL7k3/Ta+D+BtG3gBgPYE7kI0PBgZ2Ne0g==
X-Received: by 2002:a65:4942:: with SMTP id q2mr10938836pgs.405.1635614207305; 
 Sat, 30 Oct 2021 10:16:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/66] linux-user/host/arm: Populate host_signal.h
Date: Sat, 30 Oct 2021 10:15:40 -0700
Message-Id: <20211030171635.1689530-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 694eff7f04..fabc8855a9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -253,50 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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


