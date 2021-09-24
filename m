Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676C417981
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:14:30 +0200 (CEST)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTomJ-0003Uc-Fq
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToYA-00030P-Gw
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:50 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY8-000763-2M
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:50 -0400
Received: by mail-qt1-x82f.google.com with SMTP id j13so10053206qtq.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JReOUZ1JauLUBHSvydaez4tEecQ2s9UVamV6Wd7OsXg=;
 b=daLEaNGm2JcBkU6qTxW3+UqnC899+eVTOSVIn7EyU8Dk7RAlC4wGj2VFQlN80RsthD
 Rh2nmyERAt9nxhAQZ3n4IuQx35c9YR+7/WqRDfIHLSfhzVrZzc3EGOg8ozQSk3IArTQv
 peUJS/lV92BSFaP39eKF/xeJkKpLf12PmQTshsPzRu+RyDLJkk39rJdSSW9pXfscX+0J
 ExbMQoTLMQ7HjM9fDGnabNmmvrYjXy2bByeyTxkUN2pe0skvRCfFKG/8RhsyUWX1Uw86
 G8OG/dVvk/eKJsVdO48WF5ZJpNwD3os3+wvOpPugzbb0y4mLK5GMiAok472xRwzCTjOm
 pDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JReOUZ1JauLUBHSvydaez4tEecQ2s9UVamV6Wd7OsXg=;
 b=50GanN+GF0i3mj5z8DjyLfDD9Soc0QUHLxcAJ3TSB11YanC2wrMBwSK+nzhe8vOPIh
 VxelASetu9oEhR1aaxVLEvLifGwNOcVHhu4GspjJdBNOvLSsTNcO3saFJM8oMh5aebmc
 QcOd5tN0RU7LteT+msUflJBLHI4GGs2dDyIQGCmHV6cEh1oyLoLrKi59tW8EGvLFJ2Ja
 MKRujY7IeOYbjinJMGRNztWLoV24zMROxSpsA04p55k6GODKNKqzjR95DR/C73DwXbQs
 3DPq7Q3lvSNVfkIJVIu2E6g6yKJiZqg4WL4NVzEoKnQaK6XDPXlpzm/FVWvljTl5sIBF
 leEg==
X-Gm-Message-State: AOAM531fvwpNFlpRzInYn0M0U6n/mK5FMAklkWmcIUmqaWMyvcqZkMo0
 ZQ8RIb79mS/+WK3RXbCOOvYRU5E/agzJog==
X-Google-Smtp-Source: ABdhPJzLc2yYEs22jUJTSY5HtjZam5ExvpzNe1Qwwfv0ZqrgKX/o8JNOOp0Gxpoc8+cIv0BKmfLiQA==
X-Received: by 2002:ac8:5290:: with SMTP id s16mr5162195qtn.412.1632502787172; 
 Fri, 24 Sep 2021 09:59:47 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/27] linux-user/sparc: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:24 -0400
Message-Id: <20210924165926.752809-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  4 ++++
 linux-user/sparc/signal.c        | 40 +++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 34f9a12519..e661ddd6ab 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+#else
+/* For sparc64, use of KA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
 
 /* bit-flags */
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3bc023d281..23e1e761de 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -242,6 +242,12 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 }
 
 #ifdef TARGET_ARCH_HAS_SETUP_FRAME
+static void install_sigtramp(uint32_t *tramp, int syscall)
+{
+    __put_user(0x82102000u + syscall, &tramp[0]); /* mov syscall, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);           /* t 0x10 */
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
@@ -291,13 +297,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] = sf_addr +
-                offsetof(struct target_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_sigreturn, %g1 */
-        __put_user(0x821020d8u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_sigreturn);
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -358,13 +360,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] =
-            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_rt_sigreturn, %g1 */
-        __put_user(0x82102065u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_rt_sigreturn);
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -775,4 +773,18 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+#else
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
-- 
2.25.1


