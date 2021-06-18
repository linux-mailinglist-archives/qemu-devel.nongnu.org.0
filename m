Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7F3AD30E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:43:50 +0200 (CEST)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKP7-0002rY-D9
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBt-0001iv-Mz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBp-0001a0-Tf
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:09 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6480535pjp.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YW5guTHBvWRMH5moaLCydApEzADr3l/GtZeuUgDhrc=;
 b=XiP20hLYh78l9XbpOtPsEORO3CXi/DD39o8DfjPNLzM6uUdIRI6MB+yV/zkXVCo5tb
 GkVRz9yfyiV5tIZIqIxCIE4v9Rxnc9QKpOYqE0X8n+aTAddqrwAX+4gbV4ThW3Wt2TMn
 IPwXKhOdfDhEuY/geiZB27n25VlLKuKA0w2s8J2WZ6dmeUoxdQpX5OHFK/m2keCZFC9i
 k89R1OU10QlV6VJ1julayM8o5Dfoyiqc2WLaIwSz7COj/FziujZg+ELGWsb+nrqhLMfW
 BL/9TlSPRGZoWqiPa/LM/v3h+MAjDB5T7uUudYxy3So4N3UoJ956J4ylDUXAoGrYOf/A
 Dk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YW5guTHBvWRMH5moaLCydApEzADr3l/GtZeuUgDhrc=;
 b=G0JwMCqkYJFRJPD8vusAaEzNQNiBp3W0kGpqhP2mY/zAuPJFF93u8kYk4t1E/OMJl3
 kb96Iwfjtv+TEv6CWO2j9DzarTM5gjRbcVAg7QcMk1mqzli/PbjslwmgWm2k9i8orBMa
 1W0rmXDNA2VXWF/2jsjm0DGLcwu+qHE9x/LKZjf0QxvdH35k5/LOuMc9F5HjZRFgJv/P
 egg+EYv3HL9/wAs/bVQXO3DyfdOU7dPOek03b3XS61k3ED96hroU3Y3mcTRZQXEZR92y
 pgHxfh6trhQTzZiaGpps7gaB3cfpjTTI4KM7rM7mCXt0X4dgJ9jXlOayaIwP7hIsxjrR
 9n2g==
X-Gm-Message-State: AOAM532t7ZL4ij8s3r6JdbACRYpBFS/o9SdN7wyPezptFVPweewaIsH3
 Qf/2scepTLLOD3GHNAdIWnKfmaod6PH+jQ==
X-Google-Smtp-Source: ABdhPJz543DaW2Hp/9Ru/jjK5+8Ujlqs5VFyRXCq4p/5iW26PtllmHntnA9YaVwTzn4KQ0xbfaxgdA==
X-Received: by 2002:a17:902:694b:b029:118:b8b1:1e23 with SMTP id
 k11-20020a170902694bb0290118b8b11e23mr6084076plt.31.1624044604671; 
 Fri, 18 Jun 2021 12:30:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/23] linux-user/sparc: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:49 -0700
Message-Id: <20210618192951.125651-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  4 ++++
 linux-user/sparc/signal.c        | 32 ++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

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
index 0cc3db5570..65e9b7f8b4 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -290,13 +290,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -357,13 +351,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -774,4 +762,20 @@ do_sigsegv:
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
+    __put_user(0x821020d8u, &tramp[0]);   /* mov __NR_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);   /* t 0x10 */
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    __put_user(0x82102065u, &tramp[2]);   /* mov __NR_rt_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[3]);   /* t 0x10 */
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
-- 
2.25.1


