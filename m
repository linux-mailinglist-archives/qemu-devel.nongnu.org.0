Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31A841A547
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:21:08 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2jz-0006B8-NL
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QZ-0004ha-3X
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:03 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QX-0005pg-5k
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:02 -0400
Received: by mail-qk1-x733.google.com with SMTP id b65so38728301qkc.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zszFeWHoddqJiQjxDacbGdC0FlOhNlodUAD1GXKctw=;
 b=tGw20w8l0lMbc2LveH9rZnYYzJbTd1hYpchi9+FBZImzseHjrnl9uTJiTDPmnUnvM9
 4Ogntz4l5MYJXrykvFI71hnUlmBnhuT2i0Cdf6c3JVeW5Yt2qwk60JvlfHQGcYyyB1NX
 ub44W2m1lJ4+WutckZJ2+4wFnDjDdTY3zb2RyhIie2XMqSfl/GD0NnNwI/u6TpHuOU82
 12JwJ368mAN6bNABWN7a6vTHzjj4/K8cG8ZEqUMvn/vg1ksm1ktmkVBJPz6YlsWo0skt
 zN43ph0ltBQ+d7sdZ7NYby4YPeG13vdvuwfgQLVGj+6NBohp3jALEgHRgNtwfJK4LD/H
 FC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zszFeWHoddqJiQjxDacbGdC0FlOhNlodUAD1GXKctw=;
 b=0u2G/sbZI0n8wqaEgxeMmOP1jiG0VlZytHoQ7+GzySRyzjqXaM4xyuvnrLM/vx0ywq
 cUM6b3fbeaB24rUfod6YOAspkNDnTBgMzwZCYGBIp6ycxcZEineCZY+oKC0fjC/DbI8E
 fRXMZcFFiI+nTnWw0x7RWzKZhUZtPIabrsW2OylL5uDZV1qJwfzjwOJW9MKpV5zVSB1A
 0MZxKuI8aWQPeGW6KvQ0tA+aDUgmR4X/ZDJfQjoNQWAptFqMzlJWfF9wtBxDXIX6ceD6
 1GrtO1RgEbXiuvfWOKuh1n+iExlRvUimQC99REKQISuUtST/ISvT8Tce0h/r4qaWxvoa
 EfcA==
X-Gm-Message-State: AOAM533JiivkJaPM/S9r6B/xs5ZHZTkY44/YNbudSeB75qTvyN4OWqRV
 dgYtx+rWUwC5LDdClkHM5XM3x5SLHkVTKw==
X-Google-Smtp-Source: ABdhPJxzIRx5AlxJpv8c2xq5kqYy5pRvwksByXhhw43aOg33kdWbqqxieg++XWv1dVDRAkFqYwZQ0w==
X-Received: by 2002:a37:bb41:: with SMTP id l62mr3030567qkf.486.1632794457219; 
 Mon, 27 Sep 2021 19:00:57 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/25] linux-user/ppc: Simplify encode_trampoline
Date: Mon, 27 Sep 2021 22:00:32 -0400
Message-Id: <20210928020039.184412-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sigret parameter is never 0, and even if it was the encoding
of the LI instruction would still work.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index e4d0dfa3bf..77f37b9f01 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -309,10 +309,8 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
 static void encode_trampoline(int sigret, uint32_t *tramp)
 {
     /* Set up the sigreturn trampoline: li r0,sigret; sc.  */
-    if (sigret) {
-        __put_user(0x38000000 | sigret, &tramp[0]);
-        __put_user(0x44000002, &tramp[1]);
-    }
+    __put_user(0x38000000 | sigret, &tramp[0]);
+    __put_user(0x44000002, &tramp[1]);
 }
 
 static void restore_user_regs(CPUPPCState *env,
-- 
2.25.1


