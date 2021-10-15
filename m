Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D101C42E78C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:13:15 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEao-0001Bb-RB
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYf-0006fy-Nj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYd-000077-Cd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:01 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so8449598pjc.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPg0TWxPCq+nfWOlqCTkACXTywAZGmXvHVDfXz+ELxA=;
 b=ePhDaFwdkoIUlg1au87K7rxAPdx48d4LVSZRjofcCcROBwMK8nhxSI3csTLCVftxWO
 KX5P+tuO+//XWZWsMZIYFtkJM4Gr4B5hoSzeXxvsx+2yIgAxZJxn1ON06VoUqx81IPtN
 fh3jrt0QfekybvPfPdHIy68umQgfOdE/EWXtZSDAknjSMENUIHxw7N7bLF48/d9kae0/
 xkBt12KlLxPIjG0hMpp1ysOsrGQu7NNW/c37huy5tFQ2fB9B/3+TmYgQiU6najvruhdu
 DGGtWw1x/3+EJYhlVcV92mcwD75qzyD3BN1PgKDgRuhw9D0PoCTayTaKl3GUddr8JkJq
 FjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPg0TWxPCq+nfWOlqCTkACXTywAZGmXvHVDfXz+ELxA=;
 b=20LOER6nKk1qtXdpFUJLpPB54nyEYsAyHBemNkkcxjFqmg96X7U25KtzULUonsqyrh
 MsXwIGbJlbZ5lkvPvHC6tByBvqaDqlBtB7QtmeVqp0bUk1t1+K8lmIN6WbfPM0dV7bfw
 UP+w0/cXNSZfFthk0ZVivKjHypYwzwhJGyHAaBDl0rM9yyrW1Km7wrvoB/ve3T2bZkoo
 ZTyO78Bf+wXBzAP03+tjxXoM3V/pFQ/M1TkemS7998u1411m4WLIUIE0J+MOObCIuSR3
 uyfn6Ohr9kwAizDk6oILILnC4Jnqe8BPy/yRt8jV21PtZICo2oGiSFyzZLKul4AtRpmu
 wXsw==
X-Gm-Message-State: AOAM532m9oBUC7+VS9AKLL1dPHtchpFpZ+lnC9/c/rtlmrzbS/zfuwLm
 y9NczCa26QyIX8cyRAhyMHVzka4hC7DMAw==
X-Google-Smtp-Source: ABdhPJwpcqeH91Evad7jUEJ6V6QNo388CFagij2o4f0Qxn+szlz4puSL+n7KXJ/Br8ZPKq0G1Wjl7g==
X-Received: by 2002:a17:90b:350f:: with SMTP id
 ls15mr10897543pjb.220.1634271057979; 
 Thu, 14 Oct 2021 21:10:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/67] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Thu, 14 Oct 2021 21:09:50 -0700
Message-Id: <20211015041053.2769193-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
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
index cb63e528c5..744af19397 100644
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


