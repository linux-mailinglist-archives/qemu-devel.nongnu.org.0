Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E649B424548
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:51:59 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB5C-0008Ax-Uk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdm-0007Ur-5B
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdk-0008Hr-Hj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:37 -0400
Received: by mail-pg1-x532.google.com with SMTP id 66so3069843pgc.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVCx2jHCPvPujkZ/wrXYdO47hYaVZq7kiqP/WMFmGDE=;
 b=W7tcHNyrdfnN9SsetmWZx+/z6bPsCiJL79kF4uQ494VMkAcKt5k39GeN2jEONUOn5w
 Z2FHR264L5HtDofC5fs8Q3M6OkXBEdZKrrQJECrvyRVdE0vroZToFG83V607KoSAL9Er
 a4TcUmbKAMZ1KPNhiZOdM0h3u5/pHErdb68viiHwW9DM0w7fH8OLwL5L3Bc2ZugpKfeo
 LoA2jZLcenuBb7HyfukAJTmmqNxkGXxCZhvnKCzv0NHWhwluIy4FmbgTdNBtPoobTQK1
 /kjc+LsCaH3BPxsG8l+c5rRblHWqhsHoupzGoRd08DI2pUH47xWxagQH/d1FTqFxO4GP
 PXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVCx2jHCPvPujkZ/wrXYdO47hYaVZq7kiqP/WMFmGDE=;
 b=y8+bz3d4TQ8SrsS6k8Kp8YeVQSa9wsv7eOniSPfP+NFbgZa9FVfGRtAGSmkHyjGXr3
 nIbsLXjtJUyntqkyJGLCuZkGJq2gf8nK6eXTb0kh3xXF5pCRYL6nwkIoR9khAGnesUuj
 Q9xrwQAbX0dWEY8tNVv416zR2TWWYBWOVwHdxw52vNcKZhidB/72D0/07nSYXPXR2+vS
 J+2HifRXpOZ3iObK+m0dyF985YHOych3cWRIa0hBrNdiYE9zCQdve2tzSaz+6awhVKqs
 MrASnX/1LjOhKnogzM2clw2220T59e4DxnyiGuqinnvuNA7zAdUaXZQQxJtvYPHoDPl5
 x3fA==
X-Gm-Message-State: AOAM533fwbRkXk6V7WuIL96I/+NjxEQUH3WdN/QJ+3Yk8OswK08zvlBr
 sqTsL3ekyWgVIoPreSNlLxQsKLtcFsyjOw==
X-Google-Smtp-Source: ABdhPJwZqFNRdHejDhRf4+aMvIxcNUHYgzHn0e3V9wHRThSyJSNzY38QwgAZwvVqSdAdIiaT3zahHQ==
X-Received: by 2002:a63:1e60:: with SMTP id p32mr21306643pgm.234.1633541015088; 
 Wed, 06 Oct 2021 10:23:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/41] linux-user/openrisc: Adjust signal for EXCP_RANGE,
 EXCP_FPE
Date: Wed,  6 Oct 2021 10:22:58 -0700
Message-Id: <20211006172307.780893-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel vectors both of these through unhandled_exception, which
results in force_sig(SIGSEGV).  This isn't very useful for userland
when enabling overflow traps or fpu traps, but c'est la vie.

Cc: Stafford Horne <shorne@gmail.com>
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


