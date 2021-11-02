Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF695442C82
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:27:34 +0100 (CET)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrwz-0004id-S5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0003jl-Su
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdt-0000sZ-Ey
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:54 -0400
Received: by mail-qv1-xf36.google.com with SMTP id bu11so5128062qvb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j+5GOHH9i6aEZjBZv3rJ6b7IG39UFn9wARHFg8XAtc=;
 b=uVdB7wPNC2/n/viuGOTnyjvgF1i+kQibUiH0lptoDohSfThKCei0qKZ/PXV2I8gLHF
 hzOWjZXOsh55lwilvs29SkXXP65xXH7syY21fsUTOIBnJrH50wkSdXC3yTJxaEDHzy+8
 J5Z0fm85ZplR6/oq4JBSMrOxens4+HSO12GJEdyMsVTO41dZLYPyLRmOAo5M+Sz4GHeD
 y5/7KhosiGcCisnjibeO19vi+vXFqbLkozvU/JsM9mxstwJG3e0oF2k7LcDlG/mwtvNM
 0ZBsnUTpeRFJrZCVc4Ojbl85hIs+VUtzjw/a59fpTx4k596NHJpekOUbSXv/we8Fzj2T
 Kh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4j+5GOHH9i6aEZjBZv3rJ6b7IG39UFn9wARHFg8XAtc=;
 b=7lnUCS328kvObHH6QXoY5Fogi9JyzENnSIYGtFwUJbsjveaWuS2968gmA85B5vj9D6
 mAQUpBJh/ra7Eij6BslzKgXpNYD1r4lLSKNjktEfOK8MzimmIBo6G7IeR1aPKj1nRIXQ
 uw1/mEg5oqx6OZjuOJSZDDAJVsroAaiYGibfiuUkG+Vhw7unfsXJRU58/nIYBjlz8DgF
 t9NQtSx2Y9uDqo4QbMyHRrBVp35uMELGJS951ug6nZ6XYjVqAlth9njn1vkbSA6xN1QJ
 zo+h2oZQRi8JlTmaBa8jdk81qWrBMDjXPXAvmSVQ3ksBdEZ8U4yGvTCTy3A2qf5nroPr
 SekA==
X-Gm-Message-State: AOAM533HqSWS1DtbjjGMKGWGPdA5vv+z24pfui6KYzBNMyDTbSWjdkBF
 MN9guuD5LaV3/dk1tBI/EGPBdKyL6VG9rw==
X-Google-Smtp-Source: ABdhPJybiKzPZKppCkbf9LZclSG60aXTgTkRZQp4xxo9FbxtzmO18gXl+qFFDPR8Nsn7txbudLNwAQ==
X-Received: by 2002:a05:6214:27e1:: with SMTP id
 jt1mr35320302qvb.62.1635851268144; 
 Tue, 02 Nov 2021 04:07:48 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/60] linux-user/host/arm: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:51 -0400
Message-Id: <20211102110740.215699-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

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


