Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9F3487EBC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:01:38 +0100 (CET)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xIn-0005nw-RD
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:01:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr8-0005Hh-QV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:02 -0500
Received: from [2607:f8b0:4864:20::1031] (port=39880
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr6-0007rN-BL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:02 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11741856pjm.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IoCTcgZr8ax/7M37Z9ZYxx4sW/uyBEgqSZ20UDGQHeQ=;
 b=gMQmOXzkwTxyrm2GQhr6We3rFtK457tlpDKpS/nEFpBZMyd6NT1i5fMNoshLMhL5EE
 A28livDmGZH8/uwwiIAUedKptoKKoKrUE4rpGcZorKxp2d5E1aR+UMSAD2NGU16mGOuB
 W+QgFtBDS358UvPLMastvR/6W0E7+E56rpUeqKJN8lrj1x85WQqabX/05LTjclJIo2Gi
 h+g1VBwisfuXzr//d0sHr7R01e+D09JfL+Tp7cLl5R8gklsKwFwU5kBqp6BKarXxsRXX
 XT+vN5fe7avJ6oNgDi8/j4vsJsECmO98/cmTBciXcpYuLxI6r85ulwPq5uI0yAn0kTLB
 f25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IoCTcgZr8ax/7M37Z9ZYxx4sW/uyBEgqSZ20UDGQHeQ=;
 b=qXLzYMod5giWEkECHmIZ5ZYSg6VnAF8dv9NM+iCA4DrZ6Bu0FtM6Vb7JuOKTNkM0Ui
 ZGQJD6fwWuMZa0i0cSATXfpibajL2JNAqNAz/11W7PV/mnoaoJPAjuSGSXXNA4CHhXeT
 pxHS+MLTTho1/3+n6QFXODIVffOQ/nZfwPR3g0teGeExonq4m/SovYTiamSCLTqd7oBs
 cOJrj4NMmh9sG26lKPuGfMJpzPpRss1c4FkW/gSEJmCWPi9mjL1B4f8PHD24agYPXyde
 QQj3mY6QpJ03ltQSlwxOBLFrZemWRKEQ1yRq/FRYSz+R3ZOuZ2IqWdu53XvSNogr7tAK
 Zc7A==
X-Gm-Message-State: AOAM532ZCA7RJpy9axXFHmeQESzgdJHi+YRuPgvtgCZZZbDYCmbsGJtX
 mj/0SeUT+2CwV31P1qSe0y2Lu7aRJpGVsg==
X-Google-Smtp-Source: ABdhPJxHp7fO3GXjv/X9KIM23Cj9LRKBBHcGXv/p3BAl3w8ItAsDJEt9/hfTmkOaCyY4ISMM/mvvEQ==
X-Received: by 2002:a17:90a:ce04:: with SMTP id
 f4mr17958746pju.10.1641591177986; 
 Fri, 07 Jan 2022 13:32:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/24] linux-user/sh4: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:41 -0800
Message-Id: <20220107213243.212806-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 3290f6445c..1bd313cb19 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -28,7 +28,6 @@ void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -60,10 +59,7 @@ void cpu_loop(CPUSH4State *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


