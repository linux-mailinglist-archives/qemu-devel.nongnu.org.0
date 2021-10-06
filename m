Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5B424466
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:35:53 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYApc-0001xG-Bf
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdY-0007B1-FY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdT-00081F-Dq
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:23 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4974529pjw.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2GWITk8oxe18I9ipdy9WjFyz78hsT1MEY4LiBFBhSc=;
 b=WF1R5ivKQvsbmbHjKKtt9n/SE3NPpdDipNcDoh/12wSf5txQxrIGYg5OxsObIvGDgM
 TLkY7uuxKsunQVRNEVAg9a3vFVAzO7ZMpv21y0wYoGou7KMOegLp07KtfDSYYi3ZBm5/
 zGlmy4dwT+cX0mzpe675QwqvZ4F6qPS3XodLUKj25HzDyhES7B3detxIZ/6/6hX1Moi1
 A7DRwidlHpMjjP9Q4qC58WU1z/x6jQSFyGo7nzD9FaAKlm5DY26bLxwGG0hw5/bV8+HY
 zfe9Y4eqdXRqy2X5c+awKv96dfzOae0RDss3/Sm9i7d+jB78ddv6PfjAbtBTuNkT87xN
 8Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2GWITk8oxe18I9ipdy9WjFyz78hsT1MEY4LiBFBhSc=;
 b=vpvZuiJ4qjeGdQQ61ZWwD3HZmiC1vYNq9i++VGwX24HjsJsksqgFvmDxeZwhI6gKZ/
 AVdcRpQWBhXVRmFgti5/RRHfQ+5z4gxSTEqsQ5XSmgR5mP46m5EPNHb93n8dqcL1muJm
 mu/tuFHaedCSUqJJO7vRVK9XmFTtXWsz4UK+5oGR0xV2VGNpQ28VAY0zTpizhd+fHXq6
 uQAyCRo9VNVDe4xh4t10/DkpMtJMlUTcs/wUEHy82bKVc0pwm8wbJFoZb7aaWKyGnYUF
 yotJ2hgjzqsGvb0+OycEcbA/xzg6sRqb3I6TPYIsJ07T67og9t54RCfNbMmS5vGEgGeE
 zAmA==
X-Gm-Message-State: AOAM5339HNfh4z1nPujLwjUHbuC305AhRfoNhFh84jJ1Py0JAiXMjD6j
 FNbzKJGs34ebpqwP+tqv8C7QgIUM/XR2fA==
X-Google-Smtp-Source: ABdhPJxYi46MLEOhO7wee0qGOMsCGbOpseLFlCQMAo2qxIbH1aeFhvqlslR3AJ7TqVOF6qkjMb/0Qw==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr12337323pjb.56.1633540997813; 
 Wed, 06 Oct 2021 10:23:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/41] linux-user/host/arm: Populate host_signal.h
Date: Wed,  6 Oct 2021 10:22:37 -0700
Message-Id: <20211006172307.780893-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

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
index a05703b3b7..1f9b846555 100644
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


