Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C288B417979
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:11:50 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTojl-0006Ty-RW
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY2-0002fO-1f
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:43 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXx-0006yT-1b
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:40 -0400
Received: by mail-qk1-x735.google.com with SMTP id b65so28387706qkc.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULwFc4fsoMDCKBA2xVTYfXV3nCZVlLyz/guJ8iaI5Rw=;
 b=KNu6QFb8ex3Ct5FPynmI5DxsbDncOGuIO75EcbmuBF3jbNt79pVcljFkepUYRi89rO
 T5UMNy6uW5nTrHuYDBMgZwrmoISGPZe6kiQp0xy5LF+HWtCCMT7DOJ4sguKFJWpljxhM
 2KXBSdTH8kL/7VW3XeldCmoAwG29i1N8Vbrho6GOYbxHe2olKfoaMEDUBza1wZp2ucAS
 8XGJIWh8Ii1Ku5gYSPjPDFJ0m/nodFfUTk1yDhJmgXanietodh1iFKYYpN2TCA9QklAl
 GlStyjvcnxJ/rbHv3+WQM7R56QBOsiWnfZ5w0wcMfpNgyApkeK4AmsKV23ZjsC1BmMS5
 YOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULwFc4fsoMDCKBA2xVTYfXV3nCZVlLyz/guJ8iaI5Rw=;
 b=GEFIOWiOK8W+UIZSB1YY2J+FSiDoyCNqho+HYaisMdfddBSbzgm4/URA8bT82C5zUc
 cF5+qvgu00iwoSGQRHYwNrOg6YTjjgMCnWzs24OxM9w8MicRoXkQPYyVj1hPjceRiIUa
 c4thMS8e8Oc0bmheDvm7khU5Iw5U+2Zeu2XmyJQIDpusY2G6Zrr4d6ZER8e7bc+UnwRs
 HlQOQFbByCpxt7cLN5aw2Ro98NCFZqidUI+67ZLdTOX+03uhe0S+e95DSGh7JMV517LP
 K/T9RALuWxudBZ+x7wMrRGcBfiWA3NBfYiMEMsJ7W0pGqCWe3EI8ORiltoY+KPP924cU
 ybuA==
X-Gm-Message-State: AOAM532jTHIdIcEiHcLOPmpXiAmJmhjYSRA6FPaLIp08kcKBu6py2r2x
 vyrI+U4ANPoFYf1K00JDayNCERhgq5UCMg==
X-Google-Smtp-Source: ABdhPJzcnoalMdne+5oRp7UtFqy+6h36uNZTRqcWD6U3swv/tttfO+0VUyb4uwjbpVSLvNW+0HtWIw==
X-Received: by 2002:a37:b703:: with SMTP id h3mr11870358qkf.240.1632502776173; 
 Fri, 24 Sep 2021 09:59:36 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/27] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not
 set
Date: Fri, 24 Sep 2021 12:59:10 -0400
Message-Id: <20210924165926.752809-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/signal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 94ab6396a0..55a36476d1 100644
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


