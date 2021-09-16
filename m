Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8F40DE33
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtR6-0008Br-3Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLM-0001Ds-9u
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLK-0002Mf-CM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:32 -0400
Received: by mail-pg1-x529.google.com with SMTP id w7so6441582pgk.13
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+zrbrroX1D6vS/SQV3E4mdDvw0CWYvps+W1iwdat2U=;
 b=yjmIsUl9SCGcAdlA4RzFE2AkEQZyx1XSdMJmFBpEgas3D9QBN3H43THHkqMHC1Adj3
 PsOxF3AFxa6w86E4rungnP6MpHanLcwuZ8l72s7oPT09PR8Qu2rOfSPQDm3mXdSv8GU4
 jdXkJS30MhTnEFLCSoTWAupFrgO3Vu/pG5YuWArJQi55q5g0HjQkrYQLEFB6yrl7LOnW
 fzOqRtSDvM4IoqQP1xULtkdIXGyw8CfbIOwCCBGXZkxlcBFZW0WswX+8WZ8YzZ/d8GK2
 swVSTOQ8XZ/5eslyK+HI5PUDhnyXmAJl/WAZc1YTvcZU9JvhgfCGem2jQoavINeKa384
 7+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+zrbrroX1D6vS/SQV3E4mdDvw0CWYvps+W1iwdat2U=;
 b=R7OUZ6xjllbDnL2gCfvgUaDjDX55FDxfxAcMW1tjerX6TzW40x9B2Fd77by+U+IfGw
 752g0YLWrG0r1Q+hl3KDYhASYr46iEJbbT+bf3KhwZ2jfwmFFwVFPpqcJKIHWsZBdJIf
 zseuID1/fNce7+8JEzCnry8PG5hULY/Ard+7kuTKxUJ3BJYLpZ171/aj6A+0YnJ5rK7m
 VORTqB7iH3CI5ancyrcA77Y4hwTK5XON5WGvW4i72VseTyWnSTfp6jTd6YckSaCMTkYo
 BiFvME+SZ1R7uP910TmvH2Srk9jQp0INCGntd1iIDyEWxdn9OXA4WVWx5VgEw3xfPXRD
 u61w==
X-Gm-Message-State: AOAM530evjeBuFGgkOU4yMjkAaa2cOJM6aFbUEuk6tLd+ldP7iAAbCE5
 POZLyRCZDTO59Y6yB81Ag8MsCy/FwFN8Zw==
X-Google-Smtp-Source: ABdhPJz9zJLaVl//SeRNowTVvlag7uwuKvZJFbF3o90xfvNsR4/1XcVOHDLJK126dxiZWq5NA1kagQ==
X-Received: by 2002:aa7:9395:0:b0:438:9980:5c94 with SMTP id
 t21-20020aa79395000000b0043899805c94mr5752945pfe.81.1631806227746; 
 Thu, 16 Sep 2021 08:30:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Thu, 16 Sep 2021 08:29:52 -0700
Message-Id: <20210916153025.1944763-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 372579427a5 ("tcg: enable thread-per-vCPU") added the following
comment describing EXCP_HALTED in qemu_tcg_cpu_thread_fn():

    case EXCP_HALTED:
         /* during start-up the vCPU is reset and the thread is
          * kicked several times. If we don't ensure we go back
          * to sleep in the halted state we won't cleanly
          * start-up when the vCPU is enabled.
          *
          * cpu->halted should ensure we sleep in wait_io_event
          */
         g_assert(cpu->halted);
         break;

qemu_wait_io_event() is sysemu-specific, so we can restrict the
cpu_handle_halt() call in cpu_exec() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 75dbc1e4e3..5fd1ed3422 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -588,8 +588,9 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
+#if defined(TARGET_I386)
         if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
             X86CPU *x86_cpu = X86_CPU(cpu);
             qemu_mutex_lock_iothread();
@@ -597,13 +598,14 @@ static inline bool cpu_handle_halt(CPUState *cpu)
             cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
             qemu_mutex_unlock_iothread();
         }
-#endif
+#endif /* TARGET_I386 */
         if (!cpu_has_work(cpu)) {
             return true;
         }
 
         cpu->halted = 0;
     }
+#endif /* !CONFIG_USER_ONLY */
 
     return false;
 }
-- 
2.25.1


