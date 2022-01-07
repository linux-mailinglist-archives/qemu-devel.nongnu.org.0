Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD0487E60
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:39:04 +0100 (CET)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wwx-0005Mv-6T
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqy-00059E-P7
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:54 -0500
Received: from [2607:f8b0:4864:20::52a] (port=38466
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqx-0007oM-77
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id s1so6506399pga.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zWx3T0Y8jTkfIXWJVpZHCL/Mjwf+W/c1urCpeZvmP0U=;
 b=Lx9Q+eLgKtnz2EBi/v+NCf2KWdwa1gMmPRd2GsVnBPhlAlepEoCVidKGp73rUy+Zre
 2fj3DF5ldiFs1ZEhMWmJO3tdRvyz3TM6ALcakGOEOi1CAxzuDlIyGSNNZcam0j5xgbtU
 xwsuFm+vW0joaHMl/WEFubMBVgPJ8PcMLonMW3q85kJhDIvpVGzT/94O+8USmOfBlyag
 8LvwWmuXNZo/lvyyuJYHknoKM2O3ycX/xBgHxZ9f/lfBNFgMSG8BA4dzYITtbfrnjiBK
 C1nZOcM2UW3VfM+kCU3YZlF4hTduSTXSEo6sWpUw5PZlX1HwE8LdcEJOHSnuipsBrT//
 /7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zWx3T0Y8jTkfIXWJVpZHCL/Mjwf+W/c1urCpeZvmP0U=;
 b=EyJpCNO+i63isnEXDQp4p2nnCnIf63ZK6XZ838Gv3QExHY6u4I8kHRXCnJfx/4F5DX
 T0zgToqCcywN5CF/gZ0EEx6TsVU8Lt1wjUy19Wo1OcuGq5J/nopk/UagBmgCMvlYKqSY
 72HFK4QrqDi9iExRLzDAFH5k+A2tRHddtbTANt4wi8EWJSd8VxGaB2F3JtBXLoUs3ElP
 dtO5tL1qn37fb6ogM3VaasDQKO0d/RHIlTLzuMeaWk0IqHQT29Wcq0+CwTNUcSUI3UXp
 Gk/ZgdOcmPLoOLh8yL+SyNdhH/g+b6iGgDzMcAhDhl3JqC2HGCHTa8DiCI+pI45GAbhG
 g5Xg==
X-Gm-Message-State: AOAM531akECLZ5aaaBezRkTbosArG6zQXFdnY96ZNEyrwnfaQuVlEOWP
 GZz7TTHrDyg0GGWiFxd1TjVqR0hTaGtXZA==
X-Google-Smtp-Source: ABdhPJy3kuekguY7ddzqFQHO6s5d7Wg8K2Hl9emLfGKcTA5CljdQMkI+A8R3qoFMOLjLLHwZum51sQ==
X-Received: by 2002:a63:7d58:: with SMTP id m24mr4059575pgn.24.1641591169948; 
 Fri, 07 Jan 2022 13:32:49 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/24] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Fri,  7 Jan 2022 13:32:28 -0800
Message-Id: <20220107213243.212806-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Reduce the number of ifdefs within cpu_loop().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 9aaae93e2f..ac0f4e3211 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -198,6 +198,17 @@ static void emulate_vsyscall(CPUX86State *env)
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
@@ -259,12 +270,9 @@ void cpu_loop(CPUX86State *env)
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
@@ -274,22 +282,16 @@ void cpu_loop(CPUX86State *env)
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
@@ -298,12 +300,9 @@ void cpu_loop(CPUX86State *env)
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


