Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4084410929
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:07:06 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmEU-0002rX-09
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm59-0003Xt-Rw
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm58-000560-AP
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id j14so1626709plx.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SZ58DDfHZ5NNXCzTxtVZbw/RUMu4SwftmLpbsv8pkQ=;
 b=aEuTfyci7/UoN7FPDosaXzSP6R1w/H9B7btpmUNwhyZGfYUOeqdK9n2cyKt34eLlFj
 xN3ANgRPUtm4e1SGqa/PqN6iVOfpxZBdzj2C2w3kMva13a41XxbsAHp4IgoZKJfDegsv
 MfktS+bUixfiZlUYsDDWRiVC8PNlsEFQQDH+1n2AsK5YkaPuedvGlLfILTQfmbkZnvaV
 qHZbiNCXCQfEv+OF8N17QdpF9dW6YB5xlecsrOQf2scXwF8eDPYcAgtjkTqBKjyqaB6w
 gEI2okdHysBHm/vY+EyG3so6eXE+pj3/bgY5Yrnb9XkFVs9CBUlGGU/jeebc+0LuwMRl
 helw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SZ58DDfHZ5NNXCzTxtVZbw/RUMu4SwftmLpbsv8pkQ=;
 b=aySKzXctoAJqfIHRSgndmBsRitHVyvHSw9EN0m1a1xzS74/YkmJPKnDlpWOC4d0iQt
 eplj4WyTAQWUOLzTCDTSBNaPOYjDRhcHCVRORJ/oIVer0ZP8OFXWnQR9Y612zbLLe5xS
 jmMoOlRMob0Qmy5nGVwhupTQfdzi+pgv0rj2T2i6HB1w23jAerATDQYOuPiHhTR4y/J5
 o4kNk0AY+x5Fn7AC/rlUnPpHW4MOr5/0XTKR0mGtYlXteUqAkhoz1F9gRMthbkh/RDYp
 DCHSIvngdzSUfV0dxGzz+L6ZDX6m0IQE79KmRvC9OfxQ1Qt8gMuxxgv//lkmm97hrH0F
 haGQ==
X-Gm-Message-State: AOAM533m+aeQsRGCZUmtR1Z4DiCAOXYQ3iJG9/8HtJS9CAJHf8PhK7CZ
 XC8UNZXDpB4iI7+R4WDTdMoQNdCktk78ww==
X-Google-Smtp-Source: ABdhPJxWXQGZ0+ZMQlSgQxDPK3vHw4fvaVJQ353ZHSA5JL5Popa8qg23/X269zk0x8MwcnmKaGNoTg==
X-Received: by 2002:a17:90a:311:: with SMTP id
 17mr29950310pje.121.1632016644687; 
 Sat, 18 Sep 2021 18:57:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/25] linux-user/cris: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:56:59 -0700
Message-Id: <20210919015718.466207-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cris/cpu_loop.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0de941c0b4..2637c19a46 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -21,13 +21,13 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUCRISState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
-    
+
     while (1) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
@@ -36,8 +36,8 @@ void cpu_loop(CPUCRISState *env)
 
         switch (trapnr) {
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_BREAK:
             ret = do_syscall(env, 
                              env->regs[9], 
@@ -55,10 +55,7 @@ void cpu_loop(CPUCRISState *env)
             }
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


