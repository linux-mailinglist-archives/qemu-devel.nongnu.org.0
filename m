Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E246D466B3B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:56:42 +0100 (CET)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst8D-0005Jt-Se
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst69-0002uf-3W
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:54:33 -0500
Received: from [2607:f8b0:4864:20::235] (port=38892
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst67-0006fD-M7
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:54:32 -0500
Received: by mail-oi1-x235.google.com with SMTP id r26so1618160oiw.5
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxDiG73tsDFhm6pQN7GiRjJDURihgWL49OscOC2ndm4=;
 b=T+o6OIOFabv0+OUOuq5Vn/qtvSrPG4RDChB97kN/pI2/mWPTJOyE0/CXQ9JibUHGVl
 Qy5WWJoiN8wba1cPlNWiYV2QirzhGDrOlBL70XlwjA3+Dp2KxHQtPQt72qr0BDv8VkKH
 Rjcj8HgMAN57agr+Ly9qSnHZYRUFgUCvrOVXMibn1SpmpFekd7W3n66DSzTYgqT7PWZ8
 zQ+kNQRZhqfNfscvYqgSsSzcTS+If0S+mGHRJxHWOraRfsnLcodhVmVjAvKNeNegAx2U
 Q/5B5SPD+ace9yoMjhv+5iRkZACJgMtapeQve0rbbAH6lVcMvkUdPJvmBZu3i95d9Dup
 mMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxDiG73tsDFhm6pQN7GiRjJDURihgWL49OscOC2ndm4=;
 b=0vf0vIKW07b8VRRBqQku6l2wB+A8XwMle0Woc3N/E0NMuF052VBjoBhH9MBobV5ANo
 8OZsfQqCdX9B/Ah7mnon1N2Wu1gEz3Vru5AfyX+xJgewJysqBIFI8U4oePOmTwRyd1+l
 0ET0Y5oAOZsiTdBmK+ybUUDSKUR7xYFeIvFZ64zvHBJ3tvFnZq1sPMHg4cfJPwjOhGSN
 J+aM7BVk94IRO5swVHRE3K4G7HJ5DafvB0T7GIxk6e4amU839sNdixVJuxBg1RomcSRk
 XxpEWgKugz4VeL3zB9Yr/iZ1DODf31nux80mnruNdMtsHvj8zd0u4JDH6q+VinQblDnZ
 n+fQ==
X-Gm-Message-State: AOAM533OjzZ9iViF52KU3NFVOqPJdWqFs0UDMEwWWk2k3ayZuGHJ33AC
 S+p7CwWS/S+vtXbf4aeWar/kDMWRrLqhKA==
X-Google-Smtp-Source: ABdhPJwo2BlybWAGtwjCZe4VBrNwyJHl1NtynJuAq8OUWeOHcbpw2Et1MWwS8H0ymfa6w/OhqKSm0w==
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr8890704pjb.10.1638478143761; 
 Thu, 02 Dec 2021 12:49:03 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] linux-user/m68k: Use force_sig_fault
Date: Thu,  2 Dec 2021 12:48:48 -0800
Message-Id: <20211202204900.50973-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 linux-user/m68k/cpu_loop.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 287f24cc60..396f98bd6c 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUM68KState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -46,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
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
@@ -90,10 +77,7 @@ void cpu_loop(CPUM68KState *env)
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


