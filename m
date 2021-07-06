Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B63BE000
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:02:22 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v1B-00014v-KI
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upA-0001Wp-8L
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:56 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up2-0006f5-8k
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so2539482pjl.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tH4IeYUpSuBmU0n3gRCjrNiQSJ25jU7sgYsJhDOIqq4=;
 b=iqyMQLGrKtY9n5dpEtwUoobadUtvUbcrjsef00FIYOgC9WErPYREInqXAPgMOzAjG9
 tp8+37VY5IzAm50VKf91xniEzkAt0bgq6kEYD8z3QCg3IrZ7ItY7RQ/txhIU1XMDiLVv
 HxZN8WRujQA8vq0WTLkuCmWqVS4ejhUnThZ8wuNi+A1WtZKEl/1nldNJQAwqRF/cgN99
 MbCQfqmdGZvCHYwegSI6vtRIcffM+ZBHvNx3f1r0QD1Cp5/EBgEibGzF9oYey985nXCL
 1AudJbvlYzEwEznVJ0aOm0VNb/DjQg6oPP7bB6U5+n6MklndVJzGCp6iE/y5/MUk/4N6
 /nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tH4IeYUpSuBmU0n3gRCjrNiQSJ25jU7sgYsJhDOIqq4=;
 b=Bczn3t6d36zdXqPPFARiHpkFllakiJB4OOugECh9f6H2zCDO861LbqP9PukJEOG3Yy
 igar3wtYf8S1b4KQzqoh9bb1b5HISvHoFCvT0+qhku0PCqw2CGe5QHaYq7wEuNWLDruB
 JBX2DrmuJ6c6wuJgvzmrhhaWQdem0zw/6DryliLxNDhHzIlA6fAbpfM1qS35q1fRA4Yq
 vXvixRUyEV+6mr3FiAVaLNDcHnDQfOwjYUE+xcUXjE3yeJLGV00/KJTudPuqp7l/kf9f
 goLz02RVLiO4LYShHm1Lit4vOGYFWxgxq0MpHceJAUwqAdlrykVNTLz5Kxc/2xKbAdAG
 HkAA==
X-Gm-Message-State: AOAM532q+orDO4ZIWDMb07h6R/iVnUrmrYvRBeNceoBWVGJwwHLu6yCA
 Zq+/Rsur27JW9L/9NsAycVkpkxW2s/yEzg==
X-Google-Smtp-Source: ABdhPJwwSUD+UacivHx+Oix5arGigtfWuBHcez0sNwzkK+PGI59I6OTiBun3z/iWW4j/V+nxs5airw==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr22612286pjt.14.1625615386980; 
 Tue, 06 Jul 2021 16:49:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/36] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not
 set
Date: Tue,  6 Jul 2021 16:49:17 -0700
Message-Id: <20210706234932.356913-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This has been a fixme for some time.  The effect of
returning -EFAULT from the kernel code is to raise SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/signal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 8701774e37..9894e7c9ac 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -411,10 +411,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-#ifndef TARGET_X86_64
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
+#ifdef TARGET_X86_64
+        /* For x86_64, SA_RESTORER is required ABI.  */
+        goto give_sigsegv;
+#else
         uint16_t val16;
         addr = frame_addr + offsetof(struct rt_sigframe, retcode);
         __put_user(addr, &frame->pretcode);
@@ -423,12 +426,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
         val16 = 0x80cd;
         __put_user(val16, (uint16_t *)(frame->retcode+5));
-    }
-#else
-    /* XXX: Would be slightly better to return -EFAULT here if test fails
-       assert(ka->sa_flags & TARGET_SA_RESTORER); */
-    __put_user(ka->sa_restorer, &frame->pretcode);
 #endif
+    }
 
     /* Set up registers for signal handler */
     env->regs[R_ESP] = frame_addr;
-- 
2.25.1


