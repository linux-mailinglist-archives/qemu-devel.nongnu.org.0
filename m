Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA268C9AA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5L-0001pI-UV; Mon, 06 Feb 2023 17:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5H-0001lk-Qt
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5F-0004Tu-Ha
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id i5so4715920wrc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blxTJd5Tx9NIUQZO/x0aKGGdE7GU/DbRJ0PEKLke2ts=;
 b=O0v/mntkLzsAwHjb/nhX4yl/zVm8bN+5Pa5mzJVvu642xpmgEbfXxmO5QktMbPnwTa
 FDdLZKmL5u+PUBRidLc/slaVJ/YWNFQlH68bsLYuiF9ZP+My18MhDM64zcVakMJddaAS
 tS3/WInDY8JAspYoDznqDPbiutDScMJ5NpuOtC6LSgiI7214SDRINdzC4kWMXB7v5LJm
 DAMR5yGMmECHelSHznGjsbG8bD3yovzHm76Q7EiqN84H0P+Cbe0iUCYAizx3WG2TSAqY
 AHa+BpdwL6XpnWm2HwUXb1zXaoGCqgKTDk6jdGt/PBle8ssh80HXkl0WHYnawdeL4gPt
 37TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blxTJd5Tx9NIUQZO/x0aKGGdE7GU/DbRJ0PEKLke2ts=;
 b=TMLAIquybA9E0UVqj6InY7M4yhm3QMZg8yETcZie1P5NfMujHSiDKRvR7nShFWjPLl
 ujhNk5VNPakfB+Dg2P/iVGM/chx2ooB+dnlXyom/8K+q5nzPuDeFBdTSAUhy+2S2EWeL
 CLnYjBmpezMQhP61VSCfHm9WQUlR/FGy0VbL3Rz8D+XGFv5HhHp0tJKQA0oiQM+8E6nQ
 2029cHis5qePWDf/225qsMWEFngLhK39+16XzSDvjgX/OnfmrDgTnHGhbliqsF/HSR1N
 QOxUdWYtm6iVQSvBNOm1NQpwjWffrtUjMbxvlDX3GkZ/xOxG4ayY3jM87dK0L0BLN7We
 r6Kg==
X-Gm-Message-State: AO0yUKWLSLSoMM+R5drLMz+r6aZsuKNlBKgOTDTM8RPVyd+83m2J2OyE
 Xtc4AKFlovoQCMoT2k4vWFyP+gBPNZ+l0d8R
X-Google-Smtp-Source: AK7set++ldX3HANNz9Vd093FscB/AXTfa5sMHQ96guUx3U8Q7TOtHG0Op+i7eO7+rObcl7uZTsAapA==
X-Received: by 2002:a05:6000:1287:b0:2bf:bb71:dc55 with SMTP id
 f7-20020a056000128700b002bfbb71dc55mr422119wrx.52.1675722932088; 
 Mon, 06 Feb 2023 14:35:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s7-20020adfeb07000000b002bff1de8d4bsm9769030wrn.49.2023.02.06.14.35.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/11] target/arm: Convert CPUARMState::eabi to boolean
Date: Mon,  6 Feb 2023 23:34:56 +0100
Message-Id: <20230206223502.25122-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/arm/cpu_loop.c   | 4 ++--
 linux-user/user-internals.h | 2 +-
 target/arm/cpu.h            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index c0790f3246..a992423257 100644
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
 
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76add..3576da413f 100644
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
index 7bc97fece9..05b9012cee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -723,7 +723,7 @@ typedef struct CPUArchState {
 
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
-    int eabi;
+    bool eabi;
 #endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
-- 
2.38.1


