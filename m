Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492C409F76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:09:02 +0200 (CEST)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPu8L-0004o1-Ao
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5S-0001t2-Td
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5Q-0007OR-64
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso589787pjj.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UEwGCVckIB8KvhnLN1rP6M7bfEXyZ0UAya2D2H0VVIs=;
 b=J8LDeKa3EDA8SSu5356+HpTlXWKwj50nhwERzzWrwr5A9AdfbKlmDsRJCULm3tFc10
 pW/USukh5GQ/dlcCRz6XzWZuTtKOy5NjWjzhJFEfFO2mG9JI5ZEcHVky0C5bOtoHaz5l
 OMEGtDhqK62CDpahobQ+ZihQnT4ROWfqMc5xewBds3KAWKp4ijM/QwMtk7co/KxIai6G
 VcMPpJXhQhOBrRYrLAZ3CUtg5X5O3GQvNTyq5+oCuZquIyL+sd8vMdrI1eHyOZy1RvBz
 QmBrKNVrdsHwbI1yTXhQKFh24RmbElHupSDHrRAc47BWTKqhu3yxJzcTI61IhMbqcETa
 mURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UEwGCVckIB8KvhnLN1rP6M7bfEXyZ0UAya2D2H0VVIs=;
 b=5cZfyNSdf4cfbbW5zURmIbVD6snkiehNi6CsFUtQiRjhXLufrt3rsNwq8BBEsXXavr
 WUMmymfowYRvEn3Ss3xTzChH6xaQbZRE3b7/HrEGjsGWbIUz7x+7zT2r7R1mbfFOO1GB
 o1KBu264htJ7XhGiSVwudquZrg67M0bHKUdOpJnPU140kAsvu2C5Bt/EWgRKaQUsbtzn
 2LDocK8U1XjYAj51pEPAw4tpQ/gX4CR2fQYQaVp3lKWsQlf+KkKCEJawKcWuRJlXl+JK
 r2V0cy2GO6XkPL83k8YFkFH14dx3EU7Y61iD4Sv/Me6/CMBH/jgopMYOazdQEpUcI/ZB
 ovSA==
X-Gm-Message-State: AOAM533U3WiuQ9rFdaPHksoPHDjKUl2V0IDIAienylCuoZaB3cMks/Sv
 XUTRX1Bk7RRbDQFXymyIh8o9Or8DTc5G4g==
X-Google-Smtp-Source: ABdhPJy3JAbqWQJVzATpkb1pIIgzSS18fQdjVmJ+SS6h1BA0B7LnJvzvOYoSXWTHC3u02W0s8IxmQw==
X-Received: by 2002:a17:90a:5511:: with SMTP id
 b17mr1797527pji.222.1631570758512; 
 Mon, 13 Sep 2021 15:05:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/7] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Mon, 13 Sep 2021 15:05:50 -0700
Message-Id: <20210913220552.604064-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the comment about siglongjmp.  We do use sigsetjmp
in the main cpu loop, but we do not save the signal mask
as most exits from the cpu loop do not require them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 83351db719..ad6b4f6abf 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -46,17 +46,6 @@ __thread uintptr_t helper_retaddr;
 
 //#define DEBUG_SIGNAL
 
-/* exit the current TB from a signal handler. The host registers are
-   restored in a state compatible with the CPU emulator
- */
-static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
-                                                      sigset_t *old_set)
-{
-    /* XXX: use siglongjmp ? */
-    sigprocmask(SIG_SETMASK, old_set, NULL);
-    cpu_loop_exit_noexc(cpu);
-}
-
 /**
  * adjust_signal_pc:
  * @pc: raw pc from the host signal ucontext_t.
@@ -157,9 +146,9 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
          * currently executing TB was modified and must be exited
          * immediately.  Clear helper_retaddr for next execution.
          */
-        cpu_exit_tb_from_sighandler(cpu, old_set);
+        sigprocmask(SIG_SETMASK, old_set, NULL);
+        cpu_loop_exit_noexc(cpu);
         /* NORETURN */
-
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


