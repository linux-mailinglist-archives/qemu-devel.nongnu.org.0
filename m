Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6F315B45
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:34:05 +0100 (CET)
Received: from localhost ([::1]:54542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dSG-0007rW-J9
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyj-00040q-Jx
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:36 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyG-00088t-IT
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:32 -0500
Received: by mail-pg1-x536.google.com with SMTP id z21so43242pgj.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=Ut4E022Zyu2Bn5DIZNeLp4ypk0WNVoURbqtMA+9zFGrwTq0H3S/L8fIx+EoM6xZW3+
 egem8M1GHd/zmyTHF5oFZHa4fEK60Ym9xR2aLJ68cXahmBIHKgUkIok4Z0mk84Orsspj
 DmlKz5X3KVEIcpkXeopp5Ndlf4yu39h6L4S+ntTHxekDA4Hb1F8wZ5uTs+VjrRMsggWa
 FcbViu3gC3PmfjXeS5isVLejsgyj06hoWlDoPuy6CPzQoYwSvGp8YabncCiQLZtYx/1b
 Wcf+eLNBBnJqSyP6DsMo3MtERSU56WWBfn69KsT7kkfrppZGXZEbIo0KkkrLIIcIJ5Tl
 nLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=H8npG8VY678dlIMLEjAyRIN9kzwN6AZOobgY7vzofKslbe0gAJL3pLcLqIkzvSeGb8
 BB35qzkXeUZ8fLUs821dm3WlqRDMYJd0QcoGuIxClzWM+n1O+ntaBF64afkkgCUK0ac3
 FlbPgBDAx+WziYvZLDASkibj0+Uer947J2Ly8KtaAQWCvGv+aaD685e1jSKj4ywXYpiG
 v/JA7e0DxkxxO5Aegvok7EJiW5KxOtxVDnE+Ynz6qS28rhHCfdlKt0vPxiwtMm2c8cSc
 n61utkG8jhjASXTAP7r9QFbyLOcDQ/w2TKMkDLp8kT3+yIu1ODc5p5s16pKRAPp4iW9w
 Mj1Q==
X-Gm-Message-State: AOAM530z99MfrrzG8Pj92dpD2LN1Idcoy2zCKZzKOjZTPL25pytofj3i
 Ie8XHioZJTSApTfK35FzQ9yiZIJt4/2Vhg==
X-Google-Smtp-Source: ABdhPJw3s7Gr5RHpzMPgJ2OY7dONoVrkoanQqfPbuG8kbLGeJqeY/Ad4DtWtHGsloiIQpN7schnJpw==
X-Received: by 2002:a05:6a00:16c7:b029:1bc:6eb9:ee47 with SMTP id
 l7-20020a056a0016c7b02901bc6eb9ee47mr440436pfc.0.1612915379463; 
 Tue, 09 Feb 2021 16:02:59 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 28/31] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Tue,  9 Feb 2021 16:02:20 -0800
Message-Id: <20210210000223.884088-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
state on any kernel entry (interrupt, exception etc), and then delivers
the signal in advance of resuming the thread.

This means that while the signal won't be delivered immediately, it will
not be delayed forever -- at minimum it will be delivered after the next
clock interrupt.

We don't have a clock interrupt in linux-user, so we issue a cpu_kick
to signal a return to the main loop at the end of the current TB.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 11 +++++++++++
 target/arm/mte_helper.c            | 10 ++++++++++
 3 files changed, 22 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 777fb667fe..18013e1b23 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index b6a2e65593..7c42f65706 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -164,6 +164,17 @@ void cpu_loop(CPUARMState *env)
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
             abort();
         }
+
+        /* Check for MTE asynchronous faults */
+        if (unlikely(env->cp15.tfsr_el[0])) {
+            env->cp15.tfsr_el[0] = 0;
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info._sifields._sigfault._addr = 0;
+            info.si_code = TARGET_SEGV_MTEAERR;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        }
+
         process_pending_signals(env);
         /* Exception return on AArch64 always clears the exclusive monitor,
          * so any return to running guest code implies this.
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 153bd1e9df..d55f8d1e1e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -565,6 +565,16 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
             select = 0;
         }
         env->cp15.tfsr_el[el] |= 1 << select;
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
+         * which then sends a SIGSEGV when the thread is next scheduled.
+         * This cpu will return to the main loop at the end of the TB,
+         * which is rather sooner than "normal".  But the alternative
+         * is waiting until the next syscall.
+         */
+        qemu_cpu_kick(env_cpu(env));
+#endif
         break;
 
     default:
-- 
2.25.1


