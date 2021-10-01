Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F9341F2FF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:22:23 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMEo-0002PU-4r
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4u-0004iH-8S
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:08 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4q-00050g-Ig
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:07 -0400
Received: by mail-qt1-x836.google.com with SMTP id f15so9620428qtv.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sCS25t/S/07LT/4q9hu7ybFQaqd9aKvTlaQnlQkDGSw=;
 b=ZDOIDG7Yi83QTz10VWbJF1K4VnoBvpRKSgfl4FKywfx0tla/8d8lgz7p63wlJNMymt
 OxDfCV/oYibpMQA8VLqdWcWJ2Z1ODVEce+uBn3CVqZF0UmOgnk45twLifgnEo09ro9BQ
 KvTvXXfyN32g91ok0mg1N/qkow2QjuQyLH+ohdJL6m4lEwf5rVjyubYR6PK+3nhHC6kR
 GBFBCOTQihKrXUzja+y6mHr5BC6gNQ8Iw1D+lh/UYFd4saO2NAxxShK+r/hzvba7sozx
 hDvlQxza/YaUX0SNpMWmiLCEbWMyPmihhuythvB8XQOk7UsUCJKxcWd9l8k2Yc2Zm4Uf
 zSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sCS25t/S/07LT/4q9hu7ybFQaqd9aKvTlaQnlQkDGSw=;
 b=K8Y2NLb3jfLhDMfQOUhKZ7fqAtYoZm5KG3S2tZveB3PbT9Gqyp1bviKki+f9Fhf1xh
 x5W/MkzmvLyqtoelD2f9jpPTzc6XnpXPAYZkprbBHt6TZ9PqGSA4AFrT9Owju9zqtrmQ
 0y/BTb0mbyDG+tCZuDm8x0Lm3bHmfvQJ1fakfj2Juc8jXQT2PZJsqOWfzIPTy3FlHd0n
 K0BEGYNguT74ytGXM/Sk0HSgHvOYDWAqgqxgccPBiVm6xTJP5q24QOG+10QonhVdZHLp
 7KSvBp592as7fnG21k0Yg6XxVrzftuzZ9ZK6UpPLZ2iXth+Q0Ouw/WC5lNl33dPP+SMH
 fsdQ==
X-Gm-Message-State: AOAM532ObxHjuq7+jVu7PvpclxrRogXX5w7Q/3eH632h3QpF7/63RQ1Q
 RWJoc2YsSAXWrchJ17CETd2EtmfXLNy/Bw==
X-Google-Smtp-Source: ABdhPJxzaCpCV6cseXNcY4Gg0tDXXm8gb0UvW2zUFwDnmIRSVD2HPtdH7hxeuLXiuOwy+TE98Mm26Q==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr14026136qtp.2.1633108322998;
 Fri, 01 Oct 2021 10:12:02 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/41] linux-user/host/arm: Populate host_signal.h
Date: Fri,  1 Oct 2021 13:11:21 -0400
Message-Id: <20211001171151.1739472-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
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


