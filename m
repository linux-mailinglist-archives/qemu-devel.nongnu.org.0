Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB2496D6E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:49:24 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLRy-0007ez-WC
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL57-0005qW-4m
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:46 -0500
Received: from [2a00:1450:4864:20::431] (port=36822
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007g0-PM
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id u15so5890035wrt.3
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCrj7rNy2XEjALr0o1+JBZ5xuS0aEYwNUaRqVuv6c+Y=;
 b=p90Z/PKgAG2Ho6gU2HaBmCXKaLi2mbclp3rXSdOtHjljyoODr7eJGSLqMZmab3pYGQ
 Oy1SC9AYR/GBiNucTdm0/QVW4DJWM5ufT3Zy8BPw1f4/XkTkq6otLx9P47ftLg3SlC8Y
 4mJSOdoxB/ayWpSABFPRsIhtBM5zqKvuF+g+vZVTE8OYvDUk8Ka3SQZAfAfXcUy73PoL
 +E92GJn6kBTcHzBwHnzb1S8mvUx+MvwQ+bU1YMPkkd+utTBWeKBTZscFkZG22kL8e+Ad
 88wbcfEOiG/HyphbTlLZEYwZJi07W+BAPGMxErD8X6yBgz0AeiAtszXls3wTRHYuJ5rr
 0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCrj7rNy2XEjALr0o1+JBZ5xuS0aEYwNUaRqVuv6c+Y=;
 b=6CUnZNC39DEHL2YT2bRzqX2I/1EIP9xbbw7GaXyzn0EpqXXJDAahXjx/JufU/pEM+p
 9UZ9khG5U0BMKgdQLc5P6OTXADRmcUWcyhe6SoAUwzkGpcPNt1OzGkQ3JQTynxKxZsIW
 Ew4YHc+8n/bFrR1k6IXz0XoDke6pcGNtHTVm70Y2A1+ZjFUO5iR5JMLmHvlKG9IzYUvX
 MqIj05szenpaEDp+N1BnUjG3rFWXrmtu/FfgKkNF7L8EIeNw6CxBwL10PlQN+NNYphY+
 zG4OCS91PDw+J7t9QdLlcNG7NsMOEe+Z32Pymc5o/WnJd4C29nAPmH2th856vLE9sW7N
 QEPQ==
X-Gm-Message-State: AOAM530RBmf787R0X51Fd8e1ZbmTjq18R6WslvhSpgV7AMqbTUs3neVk
 VQsg5JNufPH1OdkLMv7Dt947WQ==
X-Google-Smtp-Source: ABdhPJwQtm0NeE3oYJPBCWBy5upvnbKIwYNs4lZpMwn1Bg1KjHGiJ3U4i/uyZ/zJVco7n0yPCCDpSQ==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr8613731wrv.521.1642875886981; 
 Sat, 22 Jan 2022 10:24:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/14] target/arm: Log CPU index in 'Taking exception' log
Date: Sat, 22 Jan 2022 18:24:31 +0000
Message-Id: <20220122182444.724087-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In an SMP system it can be unclear which CPU is taking an exception;
add the CPU index (which is the same value used in the TCG 'Trace
%d:' logging) to the "Taking exception" log line to clarify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/helper.c    | 9 ++++++---
 target/arm/m_helper.c  | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc5..3f05748ea47 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1130,7 +1130,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
     __attribute__((nonnull));
 
-void arm_log_exception(int idx);
+void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6d..4df12394021 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9317,8 +9317,10 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
-void arm_log_exception(int idx)
+void arm_log_exception(CPUState *cs)
 {
+    int idx = cs->exception_index;
+
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *exc = NULL;
         static const char * const excnames[] = {
@@ -9352,7 +9354,8 @@ void arm_log_exception(int idx)
         if (!exc) {
             exc = "unknown";
         }
-        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s]\n", idx, exc);
+        qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s] on CPU %d\n",
+                      idx, exc, cs->cpu_index);
     }
 }
 
@@ -10185,7 +10188,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
     qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 2c9922dc292..b11e927df1d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2206,7 +2206,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     uint32_t lr;
     bool ignore_stackfaults;
 
-    arm_log_exception(cs->exception_index);
+    arm_log_exception(cs);
 
     /*
      * For exceptions we just mark as pending on the NVIC, and let that
-- 
2.25.1


