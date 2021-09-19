Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD400410923
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:03:14 +0200 (CEST)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmAj-0003hl-R0
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5E-0003k1-Fv
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:32 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5C-00059V-Ux
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:32 -0400
Received: by mail-pg1-x52e.google.com with SMTP id m21so4540596pgu.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aoy4O375ZO7hM1BTzhLh8wcId79QwPq349k/5KQ0lXY=;
 b=vuKBItTl5fRtZomJl4ONFqne/3MYooY0LVMul61wrsf11dGSb+btqHv+pgFrA1dY4M
 UTi8vLHQzJFmOGtp5twaIqH4dizPIhAMFuDSJHPUWuDHEVeUok5b/VCX/9P/G+juMrIx
 u10UD9dMfxCxZpUGrxyQ7h02h9Fj4IMVRc+/4DLue6Kf/9urho4Z3KRHPQzzjUQUKIwO
 Ev213cqrcExpHq7sWhDm6cYnJkJTTJ0XzJ3c0Vw4J8F3ELKRIv6UKPea1a58mM59L9HQ
 zq2ZnybH7I5D0MjV5r2vRQS56e4sfEAgNCfUDeGD6jhjWuN8tGnFcHLfVJG6ZFXcvEZs
 vQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aoy4O375ZO7hM1BTzhLh8wcId79QwPq349k/5KQ0lXY=;
 b=uG0emNVSMz1aCni/0OLYaVy1mFEwY/LCl+o3hC/rtCmpyRNjwvIFdAFfDfGbIPvWTk
 SCHX832z0i8l/DCeC8toTjvo6fFmOBRngK5ELYUqS+GTar00aN2T9fG9yyYj6Hen1vut
 JPu0cH8xkD9EGmkZfKxLXsn46QmDYHj7bBIoQ+zhfgS7mqfsmKMnq0q1TEMQSNaob6Jl
 yELS3ErSetnEFez7xqdS6GmWK0vZXKnFLrI1SzkGIOpHIaDIzxEB9hFLtUxJkafkjosw
 lZIZRcKDkv4gIAoLMDOjNYTvI8sgT8AV9oT1zaeb+6gXSujrZzNDDjjGsRWzFWf7xgeB
 n5cg==
X-Gm-Message-State: AOAM5309GrfJNoo4dgpikHib5BWN0odoN6h5iXCEHmNb/8nOjM6yEZUa
 h5Eek38fK7z0pmGamcO/lWhFEZBgV45AQA==
X-Google-Smtp-Source: ABdhPJzSzo1ScH0Oa5fyT2U0aMjhmzX5U0pdj59BEpdq60scsubprTb91QWntKWGv/VMnTX8LCPwrw==
X-Received: by 2002:a62:7f01:0:b0:43c:ecef:98dd with SMTP id
 a1-20020a627f01000000b0043cecef98ddmr18708951pfd.50.1632016648159; 
 Sat, 18 Sep 2021 18:57:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/25] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Sat, 18 Sep 2021 18:57:03 -0700
Message-Id: <20210919015718.466207-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Reduce the number of ifdefs within cpu_loop().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294..5866e98441 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -195,6 +195,17 @@ static void emulate_vsyscall(CPUX86State *env)
 }
 #endif
 
+static bool maybe_handle_vm86_trap(CPUX86State *env, int trapnr)
+{
+#ifndef TARGET_X86_64
+    if (env->eflags & VM_MASK) {
+        handle_vm86_trap(env, trapnr);
+        return true;
+    }
+#endif
+    return false;
+}
+
 void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
@@ -256,12 +267,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP0D_GPF:
             /* XXX: potential problem if ABI32 */
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_fault(env);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP0E_PAGE:
@@ -271,22 +279,16 @@ void cpu_loop(CPUX86State *env)
                        env->cr[2]);
             break;
         case EXCP00_DIVZ:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
             break;
         case EXCP01_DB:
         case EXCP03_INT3:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             if (trapnr == EXCP01_DB) {
                 gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
             } else {
@@ -295,12 +297,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP04_INTO:
         case EXCP05_BOUND:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP06_ILLOP:
-- 
2.25.1


