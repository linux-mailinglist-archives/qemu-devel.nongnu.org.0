Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FFE442C5A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:18:25 +0100 (CET)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhro8-0003jP-8w
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdq-0003cO-Ce
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdo-0000rF-GC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: by mail-qt1-x836.google.com with SMTP id n2so18482472qta.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=yvYzfsniw4jwUycH+nacUZQFPP59LTxmD+vlvlqksRp4fc5zGcJycMIfSBrRBRGYBf
 DvpQ1o084lcDDJr+yjy+vf4LNcJyyzuRyLbsTjXjUG/k8DuLT8h5W56hFqKu9SrhMKWc
 KrCc7gHbJ5X5VwNJdzH5d2LFfPcu5k3uemdlUDKc7RXoopPjAWZZssefL5yBtYuTL76E
 1DYwanUxxNziJbbQzhQSY+znyJ9RNjxaSEWIzoJhDpqYp+QiN30/WewjOlwsqIIpQjF8
 f+umoF34ktXgcA8exYLIoUiWs99RImEALqoiakg3qjPjcnnvS9kofU5vU+oJ0qcww5sI
 /Flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=IcxAH2mgDBTvFqYuYP8BS3tcvOZP0H83rvUUQPvI1HKVPx8UkJW8UJ4V110WRQLkhx
 Xb9Wu3MiuoTiA94wJ/DOAP6w1QyCPIM4o2V+Ss7DphjQxNwx6CbQw9qUrdFCa6xBbPzj
 BO7Vc8QqoxG4VrQ9rNOgtJxo7uRrUNnhfGj/Z4+Fozy0KzUMcvIXE66TWSEuGUurno8q
 A8/TGbWrIELqwauuuhx4FedyICvleWnFCeuzNFj048e72XOp5P43bkr1IHHaGDXqQU1Q
 GZWn3vxILND3U/7qJJajGXNqrrKTEr+aUHAw8Tjc/ziwsvH+OldSyXnB9g5PlJAK0KWU
 NxSQ==
X-Gm-Message-State: AOAM5316/1hHyFwdW6h4nDIoEKGDalpJK4h/5n5Gb1ht8RV+ZUGx9ZFv
 YTw1u9DymVoYLTNyLBeDOypRgHrVI7D3LA==
X-Google-Smtp-Source: ABdhPJyK3xFxmK+VluKwFDHKQDI4LM/EwHEh3vO+tDjrF9gKh/GtHtoCeL5RiAtya9O8C9t3rpHHgw==
X-Received: by 2002:a05:622a:3:: with SMTP id x3mr5103195qtw.133.1635851263624; 
 Tue, 02 Nov 2021 04:07:43 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/60] accel/tcg: Fold cpu_exit_tb_from_sighandler into caller
Date: Tue,  2 Nov 2021 07:06:44 -0400
Message-Id: <20211102110740.215699-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: Warner Losh <imp@bsdimp.com>
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


