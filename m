Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A43A8E54
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:25:01 +0200 (CEST)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKIe-0004j0-HB
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6T-0005Wn-IX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:25 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6M-0008Qv-T5
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id m2so573653pgk.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9nbSdV/mD1SXmQjAVp8s+mtCkOW7kXOYfRwNUm5mNPg=;
 b=e5/vIn2su3+gLCLIJpe0NCHvkWkgi7pgf+12oJ/0O0AzmLIgRoLjgPknrwRhaKYqzD
 ogqjDisC9VjAH6K7t7yN3+AOx+/M4cm5RAiiiUOWUwDjOj+IA44oQQBso9i58w+Edxhy
 zbnEL1KMLz690WDVAYKWus4TUkudIXc4SwPbumLgxNuXGemiDjUTpiLfdldX1WI0UTCE
 lwQi9WK1fmrInSGi1KQajI5KeL7yE14PgEfhiwKiSX90I1EkwXQ7v2xbTSymy+mAVq57
 enqPqJdPqfgACiKikQw6e8d8458archYR/3yF6DWNrMtwmWPXuHgV/bP2DkJWnVnWKof
 rWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9nbSdV/mD1SXmQjAVp8s+mtCkOW7kXOYfRwNUm5mNPg=;
 b=kApfI8OpvmI2tfTYA/gbcVuLeY5b1ZMMxr3jvFMGtuWosJe9YZCmWNNBH4K2OyslPQ
 xe1/qy7udMkqDcsa6c7AAx/ecIxFu+bduUUL3FFPvYS+87SEumx2g2/bu/6J3ihZiA8r
 Gnh1KYGeroCieCZur8xOK2u0WvT+2VV+4b0e1fQMjKOFy5sLC18VTC9RUrxHu+cBFHKj
 vnBVT4TzxsiX8GSqVX8iCG2pXIGcKGA8meN2sF3cxUdXTlmS4EMgKstNoddPhtuINrta
 ps/DOI03EO8YzfoE2CjHtw8nOaAx4mwBrdH7PfCCwmRVIfz2UhOBWm8tc8Zq/trjzTf9
 ZjHw==
X-Gm-Message-State: AOAM531r8obNUEinpHrPYDij//LZRkW9yko+4O6kGo8aIR5SrO0jeKKp
 9FKqKHb5LLL10LtmB8CKXN2LbJUU4bXsqA==
X-Google-Smtp-Source: ABdhPJw2ArJNtUHL1y04WlQy2PODUKpsXXAvBcPA4Q6CgNpjoI0BlhuatQCVsNpDT2yotGh6IN8qEQ==
X-Received: by 2002:a05:6a00:7ca:b029:2fc:daf6:d0f0 with SMTP id
 n10-20020a056a0007cab02902fcdaf6d0f0mr1943820pfu.15.1623805937523; 
 Tue, 15 Jun 2021 18:12:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/21] linux-user/microblaze: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:59 -0700
Message-Id: <20210616011209.1446045-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/target_signal.h |  2 ++
 linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 1c326296de..e8b510f6b1 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -21,4 +21,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MICROBLAZE_TARGET_SIGNAL_H */
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 4c483bd8c6..aa27454931 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -160,17 +160,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Kernel does not use SA_RESTORER. */
 
-    /* addi r12, r0, __NR_sigreturn */
-    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, frame->tramp + 0);
-    /* brki r14, 0x8 */
-    __put_user(0xb9cc0008U, frame->tramp + 1);
-
     /*
      * Return from sighandler will jump to the tramp.
      * Negative 8 offset because return is rtsd r15, 8
      */
-    env->regs[15] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp) - 8;
+    env->regs[15] = default_rt_sigreturn - 8;
 
     /* Set up registers for signal handler */
     env->regs[1] = frame_addr;
@@ -219,3 +213,19 @@ long do_rt_sigreturn(CPUMBState *env)
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * addi r12, r0, __NR_rt_sigreturn
+     * brki r14, 0x8
+     */
+    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, tramp);
+    __put_user(0xb9cc0008U, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


