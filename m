Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EA441F8F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:48:44 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbQJ-0004wE-5P
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb61-0003aO-B0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:45 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5v-0000bV-UL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:45 -0400
Received: by mail-qk1-x72a.google.com with SMTP id br39so4060090qkb.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zdgSjVcgig3g8hdbqYsAKc9D/WSYZskIFgwWrF7DRk=;
 b=sc9UQVSXBwS5Y2NaATpU60XEKCCdjLkIvvvSuMXc6vwuAKK+YgpT+i60YiFV+tyLZ+
 BRxEP/nYef+6uklpv/xaVknhdik2UJn5kdo7I9P8cuotrGvP6+i3UiFrxPZS7SyV7mhn
 5aYLvCD+8EnkeUw+gAO7bYnNXzEwmBHBa+kqqPBiT4zlkgZvso33XAJQD3uuyh0+BTu8
 AJUhHBGZCMBi2Z3Qmw8ikPO5t9Ag+hrBQJ5JRjr9XOaO/MIs5mgNSZugeItOs8dUHVJC
 FPTvfnRGC/GgTt/ofK9UhEhqP+dZn0wUUaTp6kPlHLz4ix4Quo7Py8EuZxT5TfR1GwUp
 pn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zdgSjVcgig3g8hdbqYsAKc9D/WSYZskIFgwWrF7DRk=;
 b=A7D2FrfAzwpy8fMVvQOs8butVKcBHNwT78oHcDCzp+ZtDa2nrzW0t48f3zK0vFo3dk
 tYHr9eYI9IlGcDyW+DirKrqI+FeHIKMiWCzhwDPik1WbdGUhNXqabPPokXElCHOSvoTy
 9HGK7xuO4pWPsPuCTe3ZB8FM6pLXikOHS+vUzazIsBfyNaWd1FC3J0qxEpFlg4JVVM+F
 5g6XTCqVIGGa4MCOkmGBWZepaEyJV7CaC8BZWq+Ff4XZI1OYmQ9sA0cC10CpqxN5MeNt
 4WacFILLR/fg+dVqZuuYMvenz2IXm2DRoc7XUlwb/B0ivdp8435PLLEO/8NKfHn7jtyV
 XVGg==
X-Gm-Message-State: AOAM532pxNK0QeUj2fkD7+M/wmgWr7kcKGDPxydQGsCB0m9TvraeTSEK
 jAkiLSV5ZToXazIvORxafkb3AKbiERD/EQ==
X-Google-Smtp-Source: ABdhPJyobcRrLcLKZhcCs2migFaTfaBtnparF5I858dy9p2+kOaWZde+xmoNzR6kYchzjuwIN0UFQQ==
X-Received: by 2002:a37:f902:: with SMTP id l2mr23587606qkj.511.1635787657282; 
 Mon, 01 Nov 2021 10:27:37 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/60] linux-user/host/arm: Populate host_signal.h
Date: Mon,  1 Nov 2021 13:26:40 -0400
Message-Id: <20211101172729.23149-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/arm/host-signal.h | 31 ++++++++++++++++++++-
 accel/tcg/user-exec.c             | 45 +------------------------------
 2 files changed, 31 insertions(+), 45 deletions(-)

diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
index f4b4d65031..efb165c0c5 100644
--- a/linux-user/host/arm/host-signal.h
+++ b/linux-user/host/arm/host-signal.h
@@ -1 +1,30 @@
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


