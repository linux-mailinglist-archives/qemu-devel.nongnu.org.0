Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31388440A9F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:31:22 +0200 (CEST)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsCP-0002us-84
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryL-0001up-0I
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:49 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryF-0008W7-6r
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:47 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i5so8917642pla.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=H0fxuFGpgVWcUx9iQQkKPj7piDpF4Jhp9gytm8HLCStyqB+c7r0iX7adtQgeNGCU9P
 XcqVxOb9j3nMhEqu/WYUNpW02fGgw3ot0M8nVDu4/hWyd8BxIGIghoQdGpyfYH27aT8S
 AH1K5XxKa5vVggwVElCOl/AKHsXxomwkieryZQteUMESgNRCB7pP4ubSy4CaiEc+IuP1
 W3W7P5fs5A5phx5C0hpKwa4c/z7xrdFRO4Ye3NmQGSyRgixPMAxQKEVU00czOEtkYSF+
 kv92AlyMkKSjr/w4P1Wdh0V6tnC+4K4TUC6HcEdpgx7vIi91p4DsVSmo6AQWxUXIWl24
 b7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=vQZcCYEULqV1XMujSebug6g0glv2aLgGHkRP2xCabqkzgMqtZBT3FASkJTMzGOr5n7
 6JKuc9ResBZEV6FA7e0Iv+pZCYuAdKi2hwF+PlKiG+eWHczCa0wnWQaWzoqL7NDaTwlv
 RtxVUitsOgSnG+KXZ99gO6FQh09MhqxuMO+foD01KwPEJXoBk8qilQl9xDOMGPe4VppW
 DiiWJO+Yb39BtZcOW+gPHxnygg4f1ccdc7/+XoOoT0EUo4fg/lrFmbCOr7ogm8tphSiL
 ZAB/9L9xeguLwK7zOPOldzsnMgU7PKq8MyOHMmGRnC3wBwo53RSfd5Rru910mKNmc/II
 PDyw==
X-Gm-Message-State: AOAM533vOkGj0lEB4dom95/eA6BZA/cZsJ2CygjHFx4rorVT1AsDqKx3
 GPmTn2twaDb5WogX+mIerKxgLneARhXsKw==
X-Google-Smtp-Source: ABdhPJxNIH4DlJrFvtfu5JlW3UgT0d6JcydDjxh6JVc4DayAZZqjIgMCtPgp1kVDCPGMHzER1PZNMQ==
X-Received: by 2002:a17:90b:128d:: with SMTP id
 fw13mr2413609pjb.50.1635614200832; 
 Sat, 30 Oct 2021 10:16:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/66] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Sat, 30 Oct 2021 10:15:33 -0700
Message-Id: <20211030171635.1689530-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the comment about siglongjmp.  We do use sigsetjmp
in the main cpu loop, but we do not save the signal mask
as most exits from the cpu loop do not require them.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index b83f8d12f4..b1183aa4b3 100644
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
 /*
  * Adjust the pc to pass to cpu_restore_state; return the memop type.
  */
@@ -153,7 +142,8 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
          * Fault caused by protection of cached translation, and the
          * currently executing TB was modified and must be exited immediately.
          */
-        cpu_exit_tb_from_sighandler(cpu, old_set);
+        sigprocmask(SIG_SETMASK, old_set, NULL);
+        cpu_loop_exit_noexc(cpu);
         /* NORETURN */
     default:
         g_assert_not_reached();
-- 
2.25.1


