Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74AB42442B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAiy-0007QV-PG
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdS-000783-Ln
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdO-0007vy-Cj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g2so2969250pfc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16N/wNsTVo9PeYeWQegWc9W4v0N1PYDIz/UmP6/tUxE=;
 b=hCfQ1wEsqH6xgdZh0f8KBngcHMFb3WN4bWNRXBIDrZKTtMxJykDUo4c9Ey7HOzEb7k
 iyzMLSHh5Pfwvzwjglx0eSbRzUfojpSVOKRzBlPazGMHHkq4BEpLfKk2xx6bLmRj8pJ7
 Eeksm0UGhL/gMKawsyhtJn1fQwGw1POAVDhDNpVEKEQ1CAwLXaoxq9O73X+ko44S6ZS3
 Jt1ii6yZMqHzun07jdHbI2goCoexO4v99mvRXvBrC+eJ25QGT4GYYL2vhWk4qgvX4lLb
 uOg9APWE9laUs7G7rCAcDs5Y22HJDAhM7Z9uIFc3b38vomOn5uAStuiLa67Pdv8DG9GA
 Liiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16N/wNsTVo9PeYeWQegWc9W4v0N1PYDIz/UmP6/tUxE=;
 b=LhB4EtP/1GBN1vSjRNHCg+AJx68ZuHPz8D1OqunXt71m3ywFEB3aU/CdUK5IWhf/QT
 PWcFiKMPTvemo9rPSNyPTadCN8OQK7aBMluC93ve/gYs7dFG/vJucF05l0OL23kMWeSD
 q9Ece08tnMYpVk4zWNGYae51C6ZI3qU9cX6CeHuKtYgvFGg8jDBMfubaoCQC3qtVLcwk
 VBucnw5IJchQFi8KF7HOzEuzvwuD3D3Q4dsheP6k46N0YDnNw9YXHyoNj3sZ3wQMjSCs
 3yK3emZqX46K8vHOD83lLNr8/I4jRtT1g7IWXfx+iicJUKWfGQVitiipcbEcHnsOY9Rg
 Qfxg==
X-Gm-Message-State: AOAM5329FAk7lqLfuMkaN/OXh+yaDfMCQpp9RiM62GtK7lebTl7EEQiz
 IRJDwuPefAhdLnEfbOkbTl4dqOxfO0L08g==
X-Google-Smtp-Source: ABdhPJwC4/fRb/+FCXvtiNsknugEq2w94iYBHMLnpU8we9mH/bJ58fg6L+2eq1sB7tstZStkrMz9nA==
X-Received: by 2002:a63:dd56:: with SMTP id g22mr20936735pgj.38.1633540992086; 
 Wed, 06 Oct 2021 10:23:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/41] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Wed,  6 Oct 2021 10:22:30 -0700
Message-Id: <20211006172307.780893-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
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
index 619b572378..a5ef684b64 100644
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


