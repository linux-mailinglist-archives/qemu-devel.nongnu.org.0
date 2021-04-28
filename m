Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EF36DFD9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:46:15 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq8U-0008RF-WE
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwu-0005pQ-1H
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwq-0004bE-ML
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:15 -0400
Received: by mail-pl1-x632.google.com with SMTP id a11so2543609plh.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efOPXIXBWd1fL7hpfuKuY271cQpsQ0RFxDHULLI6NJM=;
 b=GdFWYOmqllgkcgY0eLesYISiIWZgvQwjNSZA56czPnZNuc5WOGQ1ogjJKF3hqXJK1p
 u1rh+ZRg3+iGANrOn4QreDcJ72IMw07fFtL7h/JWoI8+Rb8AWbg2zeO5PYdQnta8gaZp
 jZMF3R9AI3Z4aFVCByjr2ROQE7iYjyAFcJ8PWcl+InaCdl3CZfP9hpLeJHJbUOOdN5/z
 Av8yhzZHbyH4j1BqzNGX3bADEu2/vBnKlE8ndatUp1eMCaECpXvPNPikQ/YelFm/z4OO
 CZR6yKckKl6MbVU3u9sFy6NMCRHmNFqP4p0eEmCTU62Oh1ke74jY7Pc+QyAXCJVzdocT
 xAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efOPXIXBWd1fL7hpfuKuY271cQpsQ0RFxDHULLI6NJM=;
 b=Cr+JPR7h9UgWzDPZRfstz/Zu17gCde/OW2FyRa6gYF/Qwp3snxZp3spmRZY8Yjwzuy
 9snnzNWCDYJUijCJtIkAKTXUmY2C3nvxxCggiNnMBtLOZHtdd9xyyVTb1gB9aSU2+j3/
 O/QZZXt3YY5AMzqjcq8DFyYutgVtBBlxMAAF1y0P4jTOC22RoaCaZB79lCO0hCfxR7oG
 /0HrNNT/x7Y2HhbpADaw4wYIiWVYsc53kwDDJTqbKH7Q/CGqq257OG7wvevZ+sNoiRgL
 ZgwvN1noZtORAB+isjjMswCvsFaBdAZ/HOAdz9iuWgkiS5CeNc6SxyUnXhs5xsIMmBe6
 UNcg==
X-Gm-Message-State: AOAM532yst2fYCPz8icf9KFgW4h0CMjUXzVnDiBjGc6XubQYSHi8loRd
 6NQQyHLZrgKmb3mT3/nT0EOb1Isazvt1cA==
X-Google-Smtp-Source: ABdhPJzn5oG9JcB5CnxrZmc9VQnU0mSQa+jOSCHSWh2QYkmmmJRMDZIvkKICSeMFWLPNCZ6FWil4wg==
X-Received: by 2002:a17:902:b117:b029:e6:81ed:8044 with SMTP id
 q23-20020a170902b117b02900e681ed8044mr30901177plr.13.1619638451236; 
 Wed, 28 Apr 2021 12:34:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] linux-user/s390x: Remove PSW_ADDR_AMODE
Date: Wed, 28 Apr 2021 12:33:56 -0700
Message-Id: <20210428193408.233706-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an unnecessary complication since we only
support 64-bit mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index fece8ab97b..1dfca71fa9 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -31,7 +31,6 @@
 #define _SIGCONTEXT_NSIG_BPW    64 /* FIXME: 31-bit mode -> 32 */
 #define _SIGCONTEXT_NSIG_WORDS  (_SIGCONTEXT_NSIG / _SIGCONTEXT_NSIG_BPW)
 #define _SIGMASK_COPY_SIZE    (sizeof(unsigned long)*_SIGCONTEXT_NSIG_WORDS)
-#define PSW_ADDR_AMODE            0x0000000000000000UL /* 0x80000000UL for 31-bit */
 #define S390_SYSCALL_OPCODE ((uint16_t)0x0a00)
 
 typedef struct {
@@ -148,11 +147,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long)
-                ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    &frame->retcode);
     }
@@ -162,7 +159,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
@@ -210,10 +207,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    &frame->retcode);
     }
@@ -223,7 +219,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
@@ -248,7 +244,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
                                      (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
-    /* FIXME: 31-bit -> | PSW_ADDR_AMODE */
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.25.1


