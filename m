Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453AF699AF0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnC-0007wA-GB; Thu, 16 Feb 2023 12:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnA-0007u3-Q8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:32 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn9-0007p5-1f
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:32 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y1so2553307wru.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0mZsyYHXMMzgbZQYO+cjM5qTlEPxz+umbuwXPDLbPoQ=;
 b=ia6tSNF2LvlntfU+73d+SEfS9437xg7ZH9LySRGEwq2vkjY4TPkjjdAadMxtYWwsBQ
 FzT+FS+Ymvwn7opZIKhvL50yoWKZhul+M+dyygWZfeZouZJomO0woSJVbMmHItoGDE0k
 bWDgHPJya0clPFhtAVBecARGFEsCQ16Onyz+8Snr2oP81jHXGQwO1nMFqWbmAzfEIQfP
 u2l4EXa7noBZ25pIn13SaTuRsfG6pDAob5xRX6njPPinoSPS8mb1j6KtsG0Plrx0pq3o
 RPRTnmrqfQQHrn0JGtXDyf2kciEDYFClaUG6GrQktlIcgmhixrKuUvmmAqo6jvpXueS2
 dSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mZsyYHXMMzgbZQYO+cjM5qTlEPxz+umbuwXPDLbPoQ=;
 b=Nzg1lVoHeksViZ5DZefbw0vu2hfd29DJ6EvCwpmaCYrmw0UHZiZqbCkA0hsoXqZ3cP
 2KdXrG3SYocYnOeSsTZVoaGDOnk74tTUwxwlyY7Dn+kOARFn5hQ4S9pKHhJ0vFN2JZzK
 A/JtYJw0ZCFz7Kbc1LypCZss9Ylsn1iHduVHvhbam3NcrEmz61PguIXoZaaEI/xwGPMa
 rzaafUOIcVZGE2laVuPH4kaQqVr8Je9gVgZRj5+a4/1l3AD0qRWTEI+H5yv8lKJvsj9+
 +jK46Cb/Jpxa0bjLb6mYlYwGu7ZYnWJCsZo7fvBpSOfKoY+DeebF11QWNFyeFrBA99MH
 qxQg==
X-Gm-Message-State: AO0yUKX21XX+NamZZthGADm1RYvdUASXSw61SfdKW8WbJF3MlJvzNby+
 QqB+Zl7vd5rlnSD3zYY8Nx6S0F7Ym9VzwbQi
X-Google-Smtp-Source: AK7set+3Df2/mQ5Mi9QWbGAVipGkQUi/kr7NDkvxIibrgOr4vrKfMReuMyPhuWZeN7Klm8aWpAbkVA==
X-Received: by 2002:a5d:53c2:0:b0:2bf:e5cc:91c1 with SMTP id
 a2-20020a5d53c2000000b002bfe5cc91c1mr5564241wrw.52.1676567489750; 
 Thu, 16 Feb 2023 09:11:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] target/arm: Convert CPUARMState::eabi to boolean
Date: Thu, 16 Feb 2023 17:10:58 +0000
Message-Id: <20230216171123.2518285-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-6-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/user-internals.h | 2 +-
 target/arm/cpu.h            | 2 +-
 linux-user/arm/cpu_loop.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76addd..3576da413f4 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -135,7 +135,7 @@ void print_termios(void *arg);
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
-    return cpu_env->eabi == 1;
+    return cpu_env->eabi;
 }
 #elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece97..05b9012cee9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -723,7 +723,7 @@ typedef struct CPUArchState {
 
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
-    int eabi;
+    bool eabi;
 #endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index c0790f3246b..a9924232578 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -356,7 +356,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_SWI:
             {
-                env->eabi = 1;
+                env->eabi = true;
                 /* system call */
                 if (env->thumb) {
                     /* Thumb is always EABI style with syscall number in r7 */
@@ -382,7 +382,7 @@ void cpu_loop(CPUARMState *env)
                          * > 0xfffff and are handled below as out-of-range.
                          */
                         n ^= ARM_SYSCALL_BASE;
-                        env->eabi = 0;
+                        env->eabi = false;
                     }
                 }
 
-- 
2.34.1


