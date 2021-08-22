Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3BC3F3D77
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:12:57 +0200 (CEST)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHequ-0005Gj-2j
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaQ-0007rW-2D
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:54 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaN-0000ht-Ca
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso9907114pjb.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aoy4O375ZO7hM1BTzhLh8wcId79QwPq349k/5KQ0lXY=;
 b=ml0s82ZddlQ+EDgwGzqJngs/c9cXOYSbyW0bP5lupk5AKzJGoScFuh9IQSdNv732tu
 3UzTLYNVh8WjoJfmkIxX/Hthqn5q5iMTSAs0kHL14jdqtD/aZ4+CTFzZ4KMc/710QzfF
 WMLzIUUpwWcx5MDzJ03TOL8S3v8VIQxYM+rtRC1jC/nPQoyP2uMlqxoswGz6HchHrt8u
 8YMfHr1fDniHZKJgoxF8R0rLoIyB+0MQtv+SFMLQSx8wQoIgYP9nN6RW2EkjjYKBVVYn
 61TbXMp3FRNijPYbmJcK5kd6Kw5b8YJZtfiL5YFezH2Fm7t0vtHiUqm7g+lUVQNw8xFx
 rvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aoy4O375ZO7hM1BTzhLh8wcId79QwPq349k/5KQ0lXY=;
 b=uYzBl+IGCggqDUX3sf+bJEWqsXVAM87I8kJehWka9NWZCuUGr6064/Jyddfowl7WdI
 DwDVqOMxWmDwMI15ptQBKnwuU5pDfVqWPQ13Y53u7n9gzSv+RbmkynasdlFzmdiecJg2
 iZ5vD8dP1SDRW3JmGSaDTOT5MTMtRmhegophFVzYfbATgLPdDpelOSohlX4BQEe1WG9b
 FY3IsrgjP+A1572vX8poo+QJWpvCnr/BTCSDY5jTzKXb92nGrwz2njrRCIfid8kB3HBc
 SWG1w9OAVxl1nJmsHoQNfXb0zDloVarTjloT6yOZUQrNBW5XQjKT8Iq3bu2OtBJbgl5L
 o1oA==
X-Gm-Message-State: AOAM530Ml8xbWSPj5ZPgzZKPHWpcvkvix3gWaY7Pd0Ul1cEpKZrGssqt
 KVpwMrREE+ikDLxsOYK3xSeWCiokWycvlw==
X-Google-Smtp-Source: ABdhPJzWjNTy3YSPoNei79KOvNrFaUwOifteR5OSsHDuCvoHBc+71OtMVIdiLBA3ywmOWS5IoW8+3w==
X-Received: by 2002:a17:902:b711:b029:11e:6480:258a with SMTP id
 d17-20020a170902b711b029011e6480258amr23135868pls.41.1629604550154; 
 Sat, 21 Aug 2021 20:55:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/30] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Sat, 21 Aug 2021 20:55:24 -0700
Message-Id: <20210822035537.283193-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


