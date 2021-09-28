Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A693A41A527
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:12:43 +0200 (CEST)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2bq-0002EK-Ki
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QR-0004aB-2y
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:55 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QO-0005j6-BC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:54 -0400
Received: by mail-qt1-x82a.google.com with SMTP id x9so18662277qtv.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFT/6UTjn+SRrtv7SJvOboDTfiqpHPjXAVLEeQqZ7rU=;
 b=vhBW82v745U/Fkr6KnOspKtirs5wywdpyArZYCgmuWjkE/vyQn4TfBvT5MUXM00da5
 4Qge4nBoiNK6Di1eigSBPFpvLNRILThMFGz+EGk+4Y38TyIAYQdxqwCaar/S3mYtSsP3
 uvI2wjIJuTUqLGxGradwajna4xlioeiiCcVY5O5zU6MpZRlF3QnTRHb6nIWhHlw+Qyz2
 OLRNtjIYf9ARLIAFz3B4WAcfQwsdvSkEj8joQiEaL78Bk4mb97Zw2AX7o4YuEmkvIy87
 jFNSOS2+hMGe+UDGBcwEV38SCxhmDkE9Mkj+2jYjWrER92/z0ccRsUXZ2CmWJIDzTniT
 Ebkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFT/6UTjn+SRrtv7SJvOboDTfiqpHPjXAVLEeQqZ7rU=;
 b=1N+nmgq8sY0gFsz9NAPBRfyaHPl0TYWLZmmQ5JyRz2UzqD2uwqTox/2ICeYhEmMZBO
 O93t3FJ1tNgGGazwBA1uT5xpn3yy9ijQ4VQqobFwLEhagqnzbAODx6Bhaq1Jox1m3XDf
 bVivU8Cv8ChZ4x8iYN8IS4qdHcUyxdRWORex+E23reDaIinpFOdxDXNTwiRyGJ6/ZWvJ
 7B9BNY6EdjRiWW0P/yGrhGOwl2aU0TvHo7RhejHhgzAiBrb/1Yc7co4ObMfBPqNpresG
 cRFNQNHEqBqIW7uAg3oUpeaYDIilPn65Es/EEkWuJI7vpo52fVlDLA6Mk5BbIUEyRxp8
 OJmw==
X-Gm-Message-State: AOAM530ICxTxMSh1OK7Ntsv/ziUeY2sBJ6Je4tHrF70AAL3JrV59TKTj
 qm/o1HaG9QyIYt2NJMquUdzf3u9Akp/jlw==
X-Google-Smtp-Source: ABdhPJy5tVZmwZp+J1WNhpZ72S3QVHUqaK5FXeV2N1GEingPY8SYD5Pw5S/8NAlthFk+Drwb/iwqow==
X-Received: by 2002:ac8:4d87:: with SMTP id a7mr3130933qtw.260.1632794451232; 
 Mon, 27 Sep 2021 19:00:51 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/25] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not
 set
Date: Mon, 27 Sep 2021 22:00:25 -0400
Message-Id: <20210928020039.184412-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has been a fixme for some time.  The effect of
returning -EFAULT from the kernel code is to raise SIGSEGV.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/signal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index b38b5f108e..433efa3d69 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -421,19 +421,18 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
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
         /* This is no longer used, but is retained for ABI compatibility. */
         install_rt_sigtramp(frame->retcode);
         __put_user(default_rt_sigreturn, &frame->pretcode);
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


