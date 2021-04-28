Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9E36DFBF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:40:02 +0200 (CEST)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq2T-00020A-BP
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpws-0005nm-Fq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwp-0004aW-Uq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:14 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so3470944pjn.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFMQ5QPUjvF/CC4yZGIdqNUY924Mg+oEIBltLfl4FzI=;
 b=JwPPJ78SqI14p8RMm24HRmsss0d8BqOTcoAAhyiTaurzcxirk6/srcpKQejebuRYXP
 L3Ylwe5EKXdXN2YnH1MAA23sAmFXAYNVBl51UQLAc/P370AEMyVzouYJtXwmPuAivbB0
 9rIJgJhTCRkxFmLZxmP/JOfh4PFzHws5T8WxK+UjnscPWlCT+tL6dHX4pgGuc4zRCRTn
 r7ijFmXDyll6qU+jQvD4uIN1XSY4xJ7Oi3500EKNViD7VXJYeEEODGbO7ckyD6G3Q7DR
 XHjnTGh68jsNHOFOvuaOLF2gSVc/qb2encax72uc/BCgqNeV1jcWHL4eDlQboYj/ng1s
 dTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFMQ5QPUjvF/CC4yZGIdqNUY924Mg+oEIBltLfl4FzI=;
 b=VNqeQFgWEHpmO2cxQjjR+DWQ7TyzKAebLsSCIy5cscLZvssssChpWNNAgrnUZ2Usqz
 /ByGc7QJoF0H6HgF5bgoiPqvdI/5PbHTmAn1FNM9GlXdtyCo8yW3wnlHENpS2VFox7+j
 JsPnm+7Mg+eGWLhPsr81YqucO5xU69q07oCnN25gnNS7BbNexCb1BTQiLMo6tzx3pU4o
 PjryBZw7nkjbrvQxEU3d5rJxh744KWtDv3FzG5QB11wdBQuTwBmY2xcsw+28Da3sIszW
 sBCFptGouf9eqChqRp23epNKnIa1d1rPcm76L+Ny7MdLFrUJNOJw2Ydj1GfJHcK381fN
 ER4w==
X-Gm-Message-State: AOAM531K9hJavL0xfPI2RhgsN6oWUiiZqtd+UzYEnIeSQpeWoGMYYGCV
 ouYu45Tw+LgWjC0aJkZAhg3G220TXSK74Q==
X-Google-Smtp-Source: ABdhPJx6rEWFqljgUAmdYRc/5cSKBiaaIuhx99GClcGQmgdu2dXcstQvmwmZ8ATxr1p+aZV9uvDGgQ==
X-Received: by 2002:a17:902:bcc7:b029:ed:6f73:ffc4 with SMTP id
 o7-20020a170902bcc7b02900ed6f73ffc4mr5504700pls.1.1619638450688; 
 Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] linux-user/s390x: Use uint16_t for signal retcode
Date: Wed, 28 Apr 2021 12:33:55 -0700
Message-Id: <20210428193408.233706-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Using the right type simplifies the frame setup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 707fb603d7..fece8ab97b 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -25,7 +25,6 @@
 #define __NUM_FPRS 16
 #define __NUM_ACRS 16
 
-#define S390_SYSCALL_SIZE   2
 #define __SIGNAL_FRAMESIZE      160 /* FIXME: 31-bit mode -> 96 */
 
 #define _SIGCONTEXT_NSIG        64
@@ -62,7 +61,7 @@ typedef struct {
     target_sigcontext sc;
     target_sigregs sregs;
     int signo;
-    uint8_t retcode[S390_SYSCALL_SIZE];
+    uint16_t retcode;
 } sigframe;
 
 struct target_ucontext {
@@ -75,7 +74,7 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint8_t retcode[S390_SYSCALL_SIZE];
+    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -155,7 +154,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
                         | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   (uint16_t *)(frame->retcode));
+                   &frame->retcode);
     }
 
     /* Set up backchain. */
@@ -216,7 +215,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
                         | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   (uint16_t *)(frame->retcode));
+                   &frame->retcode);
     }
 
     /* Set up backchain. */
-- 
2.25.1


