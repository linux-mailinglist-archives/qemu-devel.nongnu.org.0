Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BD441F54
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:31:20 +0100 (CET)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhb9S-0006Po-6M
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5x-0003MM-LN
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:41 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5q-0000aK-8y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:41 -0400
Received: by mail-qk1-x72b.google.com with SMTP id r8so3404752qkp.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=UA1eWGdJyXvTVpgLElnO8dC0Hxdiku67oApmHxJ7IjgtfADt77JUZp8VE6hMbSz8JJ
 XV2Lc2PAByiW/Dk11ToczazCNbuVaCdNWUg4BZd3OM/lQWhI5BCqZykRVsiTg16Q6wF0
 2IRHTraifY/0UPC+obHyCf/r21QWXqSS1CmWMjrFcuvO6QM0Ye8Msu/MJjFTqe1ZHuoQ
 r9LSyI9LOnzrZ14XzGqdODNV8zw6yaKUJSCVtiwR9/SEWXSxsmNz/Mcd1NeuBoar6y2C
 ff5YYsViVvQv+s67QX3nQQBqFvNGLIC7nwHJJglv+nxXVrUVR4BIw5u/cNuLAGVbNrL+
 5pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNnLCcJOHvXqFRNx4ivHlyFLW3vo/pqpN29drgRbLjE=;
 b=etY0c4GpN1lPRQ2iHt2gH/8SuYQlXKO88mdg14zV1s0edxBv4lNrC4dIHdmfl0SMfZ
 tgHJ0No6NuL5kPAV3pKUym4XcqXivDIojmSwp8D8QMrE8ZusqlTSVH3JxTuKZuBpyRQn
 bykuHZI/Kis1MAZuQyG0JO9rwXB8I06ZPlhYl8uwdML2JvXFsYnswlHtxItbH1jE02i+
 VJBumBNM0RREl4r4APUsQfzZUfeCveY6gBITzCvgHKWiBK7ienokScQSXGf8nWXn9Goy
 4WGMYH2vB4sm+KoeAAAplbgMtZB0Ec4yz6+/jwT2tyzHfWepRQYJH8GF1qKogIEm/9mr
 Df6g==
X-Gm-Message-State: AOAM533jyl1hJXsCZsexc2aZBi3Y4qFhMV29TzDraeBZ6TGGDjLnOAt3
 SYZ8rMIZNh0XDqFB8WTDFmwdiTiQY5tYag==
X-Google-Smtp-Source: ABdhPJyQ5Qlvq4HDzsqMdrPXuvMfjsCAB0K07fLfp7MsVGhJ4Ep1lAseWRlCuMQ8v+RdyEyzkML05w==
X-Received: by 2002:a37:8387:: with SMTP id f129mr24437537qkd.79.1635787653282; 
 Mon, 01 Nov 2021 10:27:33 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/60] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
Date: Mon,  1 Nov 2021 13:26:33 -0400
Message-Id: <20211101172729.23149-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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


