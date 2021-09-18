Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03C41082C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:51:58 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfRN-0005Eh-4n
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLF-0004ye-K7
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLC-0006iN-DN
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w14so1833654pfu.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQDDeP4KrE59xBXWzR54VwCb3z15HLMlRMki+IJBEEo=;
 b=KGm835s966tjMmfvd6b/RMcBfUGuOPVjiDmNrxjcG4KnP20QHjSauF2tdYiges49bA
 bGFnIfPlAqz3gcSx/62aK17PuEPc6nEcxXLTDkbcM/eEEAmkGHkr9haNMgDig+fl6Vl+
 fPAqQqe6bWHshZ/Xfa69Anvo24HaewSTijOWWq4EEt07UzwKHkZ9FuzrrJCUWCpy1h4b
 LW1mouTDpCCqg9ha7NGmGV+RUTLHOyg2WJidaUTmKTmpCsoTwTdfM12Z0fnvsUI4Oxi9
 oLszelP8s7nQJmGrimGBHSlZkpO9oeuF1G9JHezxEFlzRHlSU3qoR0l95W4nsr+jIatH
 bKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQDDeP4KrE59xBXWzR54VwCb3z15HLMlRMki+IJBEEo=;
 b=dbDbgBY2iPsNoQfyQ9a0VgzSQCjF+hfNDpYHlaMDh5CQ+4CLkSaRu6flk3/OIOf7OQ
 WBmnRPJnYbAT5H89zT5Y/ilqYMM/ZFGv3SUPT9pNhYUOYTODS+gUSK+d4GF8Jc9byuFr
 JtQqLZH8m+0zEg8g+Qfuj9Wl4VZ8Fi6TCExtbAQvASmWnKFDuOGE/8JS6y5Q5SvuTghF
 8QSP0+l59suZG0mTvnH7VW52hFQhNoAksVNBsmxpARX7Ndkx/JMyzDye4a0Tvc6w4Olp
 xUpc5m1mfdzOdnx8IRrT+R5gdNVf6hHkM71wRg79CpFZuwU0+IdbSUwFJqrkuBW+tqXl
 XIoQ==
X-Gm-Message-State: AOAM5309rH+mwDJaM/y5FYlxp1dKuS9BzPSYwbr22O30C/KoXVrAW5+l
 8AEK37n0b/XDWTEqWmQ1glcUBYG3RuLRJA==
X-Google-Smtp-Source: ABdhPJx4NfuwG/W78UvKXSyjyS7aMObEymRIjKexrEFX2I6Tv+ZCCiMZNl8mKsht+Y65Dqpt+ZwGtg==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr15969970pgj.272.1631990732649; 
 Sat, 18 Sep 2021 11:45:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/41] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Sat, 18 Sep 2021 11:44:50 -0700
Message-Id: <20210918184527.408540-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the comment about siglongjmp.  We do use sigsetjmp
in the main cpu loop, but we do not save the signal mask
as most exits from the cpu loop do not require them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 6f4fc01b60..de4565f13e 100644
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
@@ -155,7 +144,8 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
          * currently executing TB was modified and must be exited
          * immediately.  Clear helper_retaddr for next execution.
          */
-        cpu_exit_tb_from_sighandler(cpu, old_set);
+        sigprocmask(SIG_SETMASK, old_set, NULL);
+        cpu_loop_exit_noexc(cpu);
         /* NORETURN */
     default:
         g_assert_not_reached();
-- 
2.25.1


