Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1390410926
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:05:51 +0200 (CEST)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmDG-0000iB-S4
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5F-0003pP-Te
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5D-0005AG-2m
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so12050691pjb.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cTnSUy3sozc2mrt87w0e44ZRvgLTpypGGVhRf1mPH3Q=;
 b=Cropjl5UZYwxNZ/LNy6aKuP6ivtc+G/ncGZXx90wBIw/xmVZ0RXrZ4l1zPVJBJ9fqG
 8TvIXrnoYY/5ePtBr3bnAzBJvd6B7bweeuhU4g1oul++QKPukvsOlM5klmUjXR0U1k6r
 GWF9do5ITjkvbMAe/1dxOO3xjFkjkvZkNXeubMfVjePg7UL8gl4NsLTJYtw+R8cwFCb6
 JzuChVmwmSy4rP4GETTf4Dfc/Qpy/VSi18AKPOA3a+DT1Xc/BMEwROkAZhVga+/UJJlt
 hMw1+qv5NA4xeWsS98BujlBWCqaJt2IDSd52+F+gsXFen6Lfwh4WUdA0ZrWR8UP8YWBg
 jguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTnSUy3sozc2mrt87w0e44ZRvgLTpypGGVhRf1mPH3Q=;
 b=H781jg3EJXezpWkabg+IYrKdsB25i0rev+//2M1JkoYiasMoqAZqUBSnekh0a3UgiK
 +XR9qSOOyPZsPjtcj9Vw7wGGIR+xjTOkq38XhjD2dsH/4UqPrmomgZTBzt5G8eG/iaia
 rAn5tl7u8owUaD1lVVZ3IhM+BVnTxISejirJVXj9Htq52aNwgAYhMmyqdurYMMw2DERa
 Rv4NMiDnq/RkIgjPjvZGJVw/DMQ4KG+y3n7ENuJCXz3TRJg8yvWVOGw3x0WjFlofHDDA
 Fgx8EIc4SigyHpb0xcMFQZUMhmc8Gva4xCs6FaqSC2P/EItYYCCj4xukLtr0bZCbfw9l
 WGRA==
X-Gm-Message-State: AOAM532ndvvrdO00Xik7ZFypK5FfSoE4d/oh4jVaxG7U78tvxrNRtWrw
 Q+8oFcEp4alB2yVf692ujDwGjGH2WFjOVA==
X-Google-Smtp-Source: ABdhPJzgWfRZwliB8hy1wBHsbnN6Zu85eBIAN98PoA7OVgkI2cod1619T5DNDLFyQmJQ3yjJ9Aw2xg==
X-Received: by 2002:a17:902:8ec5:b0:13a:2789:cbb0 with SMTP id
 x5-20020a1709028ec500b0013a2789cbb0mr16527374plo.60.1632016649662; 
 Sat, 18 Sep 2021 18:57:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/25] linux-user/m68k: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:05 -0700
Message-Id: <20210919015718.466207-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 7d106aa86e..cf79a17f93 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -21,13 +21,14 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUM68KState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -44,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTOVF;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
             break;
         case EXCP_DIV0:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTDIV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
         case EXCP_TRAP0:
             {
@@ -89,10 +78,7 @@ void cpu_loop(CPUM68KState *env)
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


