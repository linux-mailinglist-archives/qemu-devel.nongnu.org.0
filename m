Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A741F307
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:25:06 +0200 (CEST)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMHQ-0007rW-QZ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4k-0004a6-QY
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:02 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4j-0004wv-DH
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:11:58 -0400
Received: by mail-qv1-xf36.google.com with SMTP id gs10so5959590qvb.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lQDDeP4KrE59xBXWzR54VwCb3z15HLMlRMki+IJBEEo=;
 b=VXoI1wrngFfI/1y3jprxxdASxBCUI+A3c6wnpzEoNctfl2zsM5nYZmmSygKzZSvYv1
 N8kcVkftZgXJxzmx9JYoiIDW0bipKiaT/eUQQi0cysu6Zr0Yk7OTm3pYskiSPzerrt48
 3rKbQoViDZc6g8h9wfMQRuNH7CgBRdwjZTk+Ua0/EvirI54/xZJ1cTQ4Djs6/Yvk462r
 sMyFMxATIPI0TVRaduFJhNhI5Dn0GQtcvMafW9wsXwCdlW1bsrYtc9sDfqjTybi+2wuH
 LYxbYzYvyZpYGIZ+RLPHvzBsjVNrUbl15FXa0La39bqnOFAD8iXrDT5S1Vw4K0vgCor3
 Z4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQDDeP4KrE59xBXWzR54VwCb3z15HLMlRMki+IJBEEo=;
 b=qIMMjj48Nb+Q372VKOyfSL12PJzuoir+8cVJzimE1kw9bMn3p4x63LY3HQkMwnhJPg
 R6WWSM4ioyjoAnqqu7qco+N7YqOI+reIdSBYvuivYcQECwyr9UVuHrmvlNnCBRh8LBCG
 QkA+B+aNpdD1esKaKyhz5cF9DB9XE+2BH1bFho69PsbmsyUP/A47C469eqt8rjOvL8bH
 AmweNkdgn+6X5M/qEbGGrvltnrg5iY/7lr5ZGgGIxrlf8RQL7TM5e6t57opeAEix8RFJ
 xIm+0Fcp8e9Qp5d+oudDqZeiSAgT6vXQjK0NVrxojvdhPnT3PTL2/1gbT7L9Neay8PdB
 cyAQ==
X-Gm-Message-State: AOAM532w39DaaRrFLw0vvFTI3Adfd05PHwMbDu1aF0Xn5v5ImyPKFkzD
 Lv/4DnrJjyHQCW8ED+po3kY99dC7QFlp5w==
X-Google-Smtp-Source: ABdhPJzgpr5AQIIv5VOOHCXNZJYKeXaD+oZD4aDwIhza/bDsmTquJWuUNVwwNraQrGdOWTmlAJZ+CA==
X-Received: by 2002:a05:6214:1269:: with SMTP id
 r9mr10196117qvv.35.1633108316552; 
 Fri, 01 Oct 2021 10:11:56 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:11:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/41] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Fri,  1 Oct 2021 13:11:14 -0400
Message-Id: <20211001171151.1739472-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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


