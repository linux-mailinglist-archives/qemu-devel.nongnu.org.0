Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1C363202
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:43:54 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqrB-0001N2-2v
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpb-0007ur-7Z
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpZ-0008DG-Dv
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j5so28992870wrn.4
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsduZ2xQ+Lw5uRJgQER79kAjHAwxJHgC9H74uOAy+j0=;
 b=K2F99WZkFh6erpATeaoTv09rQDaHrIiO6AC5Iw+6iNjPUUt/sbTHo2AurudMHShoHL
 vp4CUJ1VjN9076bTCXqOsDGgLewrfhaDzkFrG0BUQUaBW43oN/EjMZ18aRV8+HeijFyl
 g8i+JjqX7OyDe7mENMbG1TmgyehM9AaUk8lOKW7hPR4SvP28LVV6DsFZ2xLGImfAI/R9
 Ppe290ZP4T/hYtPhoPOod42morIAuflnyU9l4y+joyLHzksX8iCc1O/J6EXfgAXz5zG9
 fvmlDZTHfr5JOx/vR3xGyCv/4ZHC7EdssWbq+gv7KAWi3NY+AONQ7NTdQ/6izYtm0ogY
 MCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsduZ2xQ+Lw5uRJgQER79kAjHAwxJHgC9H74uOAy+j0=;
 b=baZHxbBXI4vyAro9gIseR50k7zADcuOW4SvCFSPAB0ox4vr3VENaPDQJsh8yyTO7ZZ
 +tUZJJ7FP9Nvt0hwXzptTS8g/D7QqVVD71ul4gRfCgc+n5CP/SbHcaWtcqGhzdEv3TkQ
 9Cg9VSwZEQaOHWkfd+eJIMpchn3CrMUoIOaIdzDRD3tzM1H7FY7rYpeV0RzKDSWtEimy
 xeqc7iu2gIt+cvfqaph4SXpPt9UtTTufMVBNjdBgLwC6zO0853g5tBptTmOZF1zhIkae
 YgZxUJx4p5AIUpo8w1fgjipGsuxPE9E4HUUAtmsy4SHth5ZUQ7Q4EeD5sSXr9yZBq9BZ
 6X0w==
X-Gm-Message-State: AOAM533+T77crBaY8GiryTosNwOHZAb6jHEMkJi0qaDeqq5LOtp4ZgDK
 +nfW4ALII2HJGZb3WqvGt6yyqAQXk7IajCx7
X-Google-Smtp-Source: ABdhPJx1llMiCWU1gyDFXslBEwhHrshcVycE7668ylpKUI75ZRHsv0MHe3mPCLSd0luK93R6lnRbSg==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr5726085wri.210.1618688532175; 
 Sat, 17 Apr 2021 12:42:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/arm: drop CF_LAST_IO/dc->condjump check
Date: Sat, 17 Apr 2021 20:42:04 +0100
Message-Id: <20210417194205.17057-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

This is a left over erroneous check from the days front-ends handled
io start/end themselves. Regardless just because IO could be performed
on the last instruction doesn't obligate the front end to do so.

This fixes an abort faced by the aspeed execute-in-place support which
will necessarily trigger this state (even before the one-shot
CF_LAST_IO fix). The test still seems to hang once it attempts to boot
the Linux kernel but I suspect this is an unrelated issue with icount
and the timer handling code.

The original intention of the cpu_abort (added in commit 2e70f6efa8b9
when the icount stuff was first added) seems to have been to act as
an assert() to catch an unhandled corner case where the generated code
would be something like:
    conditional branch to condlabel if its cc failed
    implementation of the insn (a conditional branch or trap)
    code emitted by gen_io_end()
 condlabel:
    gen_goto_tb or equivalent thing to go to next insn

At runtime the cc-failed case would skip over the code emitted by
gen_io_end(), leaving the can_do_io flag incorrectly set.

In commit ba3e7926691ed33 we switched to an implementation which
always clears can_do_io at the start of the following TB instead
of trying to clear it at the end of a TB that did IO. So the corner
case that this cpu_abort() was trying to flag is no longer possible,
because the gen_io_end() call has been deleted. We can therefore
safely remove the no-longer-valid assertion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210416170207.12504-1-alex.bennee@linaro.org
Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b6..7103da2d7ab 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
-        /* FIXME: This can theoretically happen with self-modifying code. */
-        cpu_abort(cpu, "IO on conditional branch instruction");
-    }
-
     /* At this stage dc->condjmp will only be set when the skipped
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
-- 
2.20.1


