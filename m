Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3842E7EF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:37:45 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEyW-00048S-7V
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ8-0007Sd-8x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ1-0000Pf-2r
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y1so5586572plk.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jv32Frh7rweOdu9XSPHyzH/l4ZHzlE4pw5zka9V4K8I=;
 b=C0pn/RJfXeJosErKpF0THofxdQkU9lnKZFfdZP0/LmJtrOTLRh2sja8+LvDAnxBE9E
 7Q28onp9VrZBy0b0b5/0RuRGBEN0TlqBfawR+vX7twnStRdy9AdA0Yu91tlZdVa+o0LN
 q2RExSMrS2L9YnLzlR/4nNXBLMgw4Cy88VJ3Uqw96ZtpODPJRidRFEmHJoHUICLmf+f0
 egXvyDWA21g+kyjL+FZY018SYymKDJLpN4nU88izN9feal5O2I3FiCRexUezox0gv9rt
 qg4DTQqMv9r8evGzhZdiZf9lLhh0w/4m3iSsCX/brdNj0uXNLxvPNG1gvHbNf9J8cJDH
 vTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jv32Frh7rweOdu9XSPHyzH/l4ZHzlE4pw5zka9V4K8I=;
 b=nAvd7QMY/l1Ddx1RzrbS7WxkqZpVtsu2fz7IhE4binpnOs/U0T30FVKpRizfL6DH2t
 vHbWYTUFVRphLstSskz+6Mo9FxiJ2LCCulrVnVEDjrVztAYm/4unIM3KyZ7k70rQvOE3
 vyz/4MYoOgUKD8aeJFYzEGk0u3YbsoyXNNn+jb6GfFp7E9hWACw5YB7yKoBw+Ciob40R
 bFJYhQl3B9ccv3N7NXfz2y5caqTtACijHucXrFB9+0DQkAP0JoqIEhs7/O27H2uKmtZ/
 ewnjqsFDW21DPeooeWqsV2TC+OV0HK4X8dLo0LpUCKBEg4tWTD5GpjLjLmRA19Q/qb3x
 J0Qw==
X-Gm-Message-State: AOAM533H6KwnjmMKq4h60xEt0IhHFjt0Y6CYkzk+ZUDjfznNAkvgW17w
 9ISqz4ivg1/wUgUieiTPOG4PLx7Txz6Xig==
X-Google-Smtp-Source: ABdhPJyOkMeDFPAE+tcPkTPKJTTKf281Nvo9Ivgu4VcKcltBhxDkezGBsH7JA4dH+aYjNfnWjvR41w==
X-Received: by 2002:a17:90b:34a:: with SMTP id
 fh10mr25171713pjb.51.1634271081301; 
 Thu, 14 Oct 2021 21:11:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/67] linux-user/openrisc: Adjust signal for EXCP_RANGE,
 EXCP_FPE
Date: Thu, 14 Oct 2021 21:10:18 -0700
Message-Id: <20211015041053.2769193-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel vectors both of these through unhandled_exception, which
results in force_sig(SIGSEGV).  This isn't very useful for userland
when enabling overflow traps or fpu traps, but c'est la vie.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6360db47c..de5417a262 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -56,13 +56,17 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case EXCP_RANGE:
+        case EXCP_FPE:
+            /* ??? The kernel vectors both of these to unhandled_exception. */
+            force_sig(TARGET_SIGSEGV);
+            break;
         case EXCP_ALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
@@ -77,13 +81,6 @@ void cpu_loop(CPUOpenRISCState *env)
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
             break;
-- 
2.25.1


