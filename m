Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9849B41C57D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:24:27 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZZS-0000yS-Jq
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI2-0006v8-G3
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:28 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI1-0006EN-30
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:26 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso2736141otu.9
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFT/6UTjn+SRrtv7SJvOboDTfiqpHPjXAVLEeQqZ7rU=;
 b=DibSKAy2R3rstnEKLGPw4vdbEtzcSfuQ5QuOOQoW45mxAzN2TwM2wB8G/tnV5y+Sg+
 OrjCNTyag5UZc9mvKLmPmZwAZZLjKCKPsArdDbkfXPucFyRHrU1hdUG848KRQNYhgtX5
 dSM0imBFpGBjhpPfaNtimtqi9wCTedb0Gg2cop+mITOItU0jojfEfhpmZ7Mux/SwLE/w
 v4/JgGJvG2P7krYvHQ9/OvcxbEj8oFfM+vldGIgA6ZgD6sDZNR61ehk2Lg/L3D79a9KM
 tSwtRdRew1Gk9tSVhqXmxULoGM2/QOIVwX0cmfzfytHV1IuTuM6x7vIvg/ri8QW/CDYW
 s8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFT/6UTjn+SRrtv7SJvOboDTfiqpHPjXAVLEeQqZ7rU=;
 b=bA0acQFFZMXxIoGKRb+fsn2vDc3nxFjnaX6ZF0P4+xKxciSZ9yqAeuhCm9qjwwHp4z
 2eMV1PFauWy7QwMrkuPhqSP8CbTEGrQD5Bcj488x73tQsF0lRLSGl/XO+HF+FXPBZOop
 uF54pK0qe79icWvK5R8oriF4AXxAkhsZYNJhAusosK3uzn46LAuUYOMBvI5AQ/wBvnwp
 8Waawm4NrRq3NP08VFsTL/teyYsgWMuZO1+MbvGQlZUQYYi8Ojqfx5Let+pgNousxCPt
 1ltDOZ/N08NfAsYyWU0HSe21IrYk3PyENSY1oVPsZ/goshETRb1obb9o0PSbEbYb+SaS
 0u8Q==
X-Gm-Message-State: AOAM531FZlfJLM2OuKCMjDHC2ZMinFtUjFCwDeRhoqp/P0bJxlUDxnu2
 uoQbutWFSxJGz2peHft1hi/EjvEXs6zinw==
X-Google-Smtp-Source: ABdhPJzHnHdC/JZk8YbOt36Cwm2sNGlJ/t13aOgNLmODj8Dd5bH3sX1fyqwVYlMXaZQdCTw+RkF26Q==
X-Received: by 2002:a05:6830:1497:: with SMTP id
 s23mr10125653otq.148.1632920782759; 
 Wed, 29 Sep 2021 06:06:22 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/26] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not
 set
Date: Wed, 29 Sep 2021 09:05:38 -0400
Message-Id: <20210929130553.121567-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu
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


