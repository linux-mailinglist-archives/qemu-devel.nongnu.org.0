Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AF368935
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:06:44 +0200 (CEST)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiPD-000163-60
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLD-0005AQ-OC
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:35 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLA-0007p2-UH
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u15so15754627plf.10
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3bcQGoF5tL2SwrZa81gd5wA84VGUXSBs7q30g13W7s=;
 b=Z8uoVgCBCKRqwEyyy1CXT+mgEXTiPQK5aDHiBM7TftnnuVidzhBNCWd5KknmnKCQ0G
 X1DBKTZ06hoX/atHKDcyFQSIpAEu+NcouEWH6xIDMEvLXS/dMZDDrpTLHZsmWaFUHPGY
 Fnrf6y1hWrIw0ZgWkVk/JCZgsI9ZCCKYynVgAMtgW18rIKYIZN/9j7TdL6jpqiaT9YqX
 pjr3FhMUpNwMsMa0aKa+eUJeKeNz1mRd1ewn4N8ZPBEZJs/PSwlyuZnlQxGQzdq4ZJWb
 c7WOO3Iqq+xpF+kGFLDqe7Ds9kG6jyo3Cllxf0nkyLvDrmHfPUa9evFn4fAA9vEtfxEW
 axDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3bcQGoF5tL2SwrZa81gd5wA84VGUXSBs7q30g13W7s=;
 b=lsCPdh+/LgFQAAvl8Qsqc3/jValaiCtQJV1uQVZnPPxwxyEYSthQ47DOYfFB2n9xiC
 WHyrl6CD2Vr71/76M+jq75RVbOsf+ZQB8c7rA6kY/pqZHw4bDKRs5tE+YzbmFwehpY1A
 ZJzdumMfKwTbhMfUfm4TZ2eNHCI+3LV7MvC7ZU3OGkm8zDL1ZfZkrGYNTfTKlkclsV11
 3eXpPDArSaLP9U0YyaqewU7wgTMFP2scVf9f3sWIyOmmfNpEJ5zHuXgNXhDr2dJ1e8Cg
 MK1RoKdDWs7xKPF5SZiBxC8wGcI7a+cU3quZg+IFFIOVi7cImGXqBMhJ901qivE8wjkF
 KMQg==
X-Gm-Message-State: AOAM533xIrY46ig7m6B+sc4s6bld1JuOP4LiVqyVlsSqZyx5WjIH5B5X
 0yS6D1Zab3KJPSjHTxXAjF5vybdA1NULxQ==
X-Google-Smtp-Source: ABdhPJwxoWceg63ddk3cjhGTbBfZWuYlQwkYIG5b0SORKPxECErp1WFVRpuslUPimmHPjMU3Q+KtCA==
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr1136828pjh.19.1619132550891; 
 Thu, 22 Apr 2021 16:02:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] linux-user/alpha: Rename the sigaction restorer field
Date: Thu, 22 Apr 2021 16:02:22 -0700
Message-Id: <20210422230227.314751-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use ka_restorer, in line with TARGET_ARCH_HAS_KA_RESTORER
vs TARGET_ARCH_HAS_SA_RESTORER, since Alpha passes this
field as a syscall argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 2 +-
 linux-user/alpha/signal.c | 8 ++++----
 linux-user/syscall.c      | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 25be414727..693d4f3788 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -519,7 +519,7 @@ struct target_sigaction {
     abi_ulong _sa_handler;
     abi_ulong sa_flags;
     target_sigset_t sa_mask;
-    abi_ulong sa_restorer;
+    abi_ulong ka_restorer;
 };
 #elif defined(TARGET_MIPS)
 struct target_sigaction {
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 86f5d2276d..3aa4b339a4 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -138,8 +138,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     setup_sigcontext(&frame->sc, env, frame_addr, set);
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
@@ -192,8 +192,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc43..ee21eb5e6f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8989,7 +8989,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
-                act.sa_restorer = 0;
+                act.ka_restorer = 0;
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             }
@@ -9085,7 +9085,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = rt_act->_sa_handler;
                 act.sa_mask = rt_act->sa_mask;
                 act.sa_flags = rt_act->sa_flags;
-                act.sa_restorer = arg5;
+                act.ka_restorer = arg5;
                 unlock_user_struct(rt_act, arg2, 0);
                 pact = &act;
             }
-- 
2.25.1


