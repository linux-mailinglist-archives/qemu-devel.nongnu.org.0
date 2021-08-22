Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD83F3D7A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:13:14 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHer6-0005aZ-7w
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaW-0007vQ-Fh
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaV-0000pE-0e
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so16496065pjr.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZHOBf2F1kyrH2/d+/Nk4ZDYvJLaqXezPeFn7O5njyk=;
 b=kLKHL56ap+cW5BlPBR5VOML2MZOE9Unat0vb5GtGkta6Gy0oN6jM0MFj+iN+XvbCbu
 SHXbrIjrNcBHPj+0h44gTjGAq4aw5UeVoUe2LmBlMnuJDARtyMas5KF/VcgXy+X7mzbw
 Xa1eN8Q3UDq5MUfRoAZpUQL659CgaqxaSRnMgCzHMUqSHlzd0fHKpmg+Q2F2MvuGKuYA
 IKvAtAI6TNPMu97d13BTxAteDMklFGkn990z/wy1tGT6RbfntZiepOk+p3uGS2fsHeGX
 rlxoKlQedZhFwCgvMJ4mhexUXpcF14/J6uCwQDJO6EDYYc1zroiYRVWWmPnGQIkXysK4
 j4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZHOBf2F1kyrH2/d+/Nk4ZDYvJLaqXezPeFn7O5njyk=;
 b=mZXt4Xtzu+lqTvc3YvPRR44iz5Gem8PUuiocopeAgzzJS3C38/TSQpya3CeK343n9+
 +1OLMuKCcGbe8kdDRrTyyS28AtG/DR4lJXjuSbR7QHNqHUTW+L/cMHeC9cUQJD/ieZOg
 JDwedHAqehReuTzjrwpTHzooWcsecikUGMBjL30OgRVcGbewWgjx/YqnXVjhXk0BK5wf
 v+XNqTwIUMwQQVNCR8vtZ1QV7qwZ6ICidi1b21fK9VjuMT1zmRqhGxAd0Ig8OyVTXf3Y
 p5mXNmfUqBFtzSGO6bU4jryekqWcBtEl3RuKJN2wEnFwboI9U1E0n2vgxTBJIDeQgeGZ
 lqSw==
X-Gm-Message-State: AOAM5312oXQ+PawWcsAE4jCr5yYccjXXTrmdnMMOIAC9GqMLJxRTqPSM
 Sv02etM/3EfKFk+Bh/8czMWsbjHbidv2Aw==
X-Google-Smtp-Source: ABdhPJwBGZbEORaiSIoinzMM5HXuW/76O+2Ri6B1S6NBXIAwt7//bFFk9+DDmJJQQQaGPh4voLDiEQ==
X-Received: by 2002:a17:90b:14d5:: with SMTP id
 jz21mr2973552pjb.11.1629604557758; 
 Sat, 21 Aug 2021 20:55:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/30] linux-user/sparc: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:36 -0700
Message-Id: <20210822035537.283193-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 38 +++++++------------------------------
 1 file changed, 7 insertions(+), 31 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198d..20fca9f9f3 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 #define SPARC64_STACK_BIAS 2047
 
@@ -153,7 +154,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -219,14 +219,7 @@ void cpu_loop (CPUSPARCState *env)
             break;
         case TT_TFAULT:
         case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->mmuregs[4];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sigsegv_for_addr(env->mmuregs[4]);
             break;
 #else
         case TT_SPILL: /* window overflow */
@@ -236,18 +229,10 @@ void cpu_loop (CPUSPARCState *env)
             restore_window(env);
             break;
         case TT_TFAULT:
+            force_sigsegv_for_addr(cpu_tsptr(env)->tpc);
+            break;
         case TT_DFAULT:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                if (trapnr == TT_DFAULT)
-                    info._sifields._sigfault._addr = env->dmmu.mmuregs[4];
-                else
-                    info._sifields._sigfault._addr = cpu_tsptr(env)->tpc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sigsegv_for_addr(env->dmmu.mmuregs[4]);
             break;
 #ifndef TARGET_ABI32
         case 0x16e:
@@ -264,19 +249,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
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


