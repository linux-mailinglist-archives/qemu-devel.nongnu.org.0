Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77947B4DE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:13:05 +0100 (CET)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPxv-0006Ly-76
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqm-0000LM-HP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:40 -0500
Received: from [2607:f8b0:4864:20::62f] (port=43688
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqk-0005u9-VQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id m24so9019238pls.10
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eorTYpTGmRMqlosPMgNCUx4CrYGaNy55bmumMBNoYKc=;
 b=uRGKkW9cuq8DD9IfL+LVdwdl+aMB8Kfz5OYXd6uJIu4rXlH0PhQ7QpxC6VK4LEHLZK
 C6WY+9NJIUb6Dr/wS6Alwj+ydkOtDFd78sTG8lK0us1P9BjmVVmeMMh7xShFPwqmOp7h
 QnuhVDACo5vztPkdqr4VkQ/C/tXJt3bxLFln99hkYqf9bEIaKlKpBR2QCjp98ARl9/1D
 4HW30BT0c787v7/OP47YP91nYmnK4bGsdLBnNK/2LLP2YthL1iRzkOuTQ2MLfkPUxN5Y
 QZc5sczCl3HPBvyihV+K6lbpNwTBKcjj5dbEU0InNFHbbdAXaDh67O4mgJte3soKpnay
 75Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eorTYpTGmRMqlosPMgNCUx4CrYGaNy55bmumMBNoYKc=;
 b=R3hys7uW/hPCsASWTpqHqJCpiQIsvxlaCr9fbgqbK8lUzy6odCNAjBqv7BUrVi2rGk
 dCJIkPSZgrELca/AuYGI0723A+E+JYWKyNWXLf4Ff3tyVPtsNJKlwZlRF2S7bIJoMpzb
 2kdtCfdzLhM3+XVFcogt9I2pFjQFJ80S0FxD0LST3UvH1/dwOLSsgIudvNDSLid32B1j
 kgDW79px8HukhD2teH27jVmhQ12z2JInHRy+vwpcqtncl6tStb9Nkahn5S1bbFBZyw82
 JSdgLdoqo3NJmUT8J1AzbmJm8qltQqzPYv18eh5uum51/UUwLk0aG3Yt6mkt0CeKPdfS
 bJ0g==
X-Gm-Message-State: AOAM530dRFRUPjSSZDx6uhFSnLMzoDts6uY456dKS0oJffRMVhP8+BjP
 K53KcGOSsLWTNG577gJPTtiqZpJYMfWzew==
X-Google-Smtp-Source: ABdhPJyxIlLOYVvkWIyiEt6JITu6zn5953ems8wKnQx427+axE4NSrFx6CNp8gZEoOwX8VdMNcaOMg==
X-Received: by 2002:a17:90b:19c7:: with SMTP id
 nm7mr957397pjb.107.1640034337698; 
 Mon, 20 Dec 2021 13:05:37 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/24] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Mon, 20 Dec 2021 13:05:13 -0800
Message-Id: <20211220210529.150423-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
index f6a1cc632b..a372cfe1b2 100644
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


