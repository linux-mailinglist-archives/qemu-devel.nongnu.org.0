Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B528F3F3D6A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:06:42 +0200 (CEST)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHekr-0002I1-N6
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaN-0007q4-2M
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaK-0000fo-GZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:50 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so16445235pjb.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gD9ah6vfgzNO0EDh/fgGFyEHak0Syu4+YvWk62gPhQA=;
 b=yFXC0gwb+N0guip7oQqK4473UXpg3KJKiqPTY+H2ExtyAgv9Oqn5/2h7ZK71GHX/B+
 phs99iKotIT3FJSGCD3PTIYvTfeBP+EsVh0lpmJ9qwizTyXWWL1nJns2CwzKs1wYpb97
 fkevAy9RD8MNHOcDi858Vn8HWPZ0RGOt4lqbnQIA8lHiRMI3q8nVepMuPjKeNfKTCpF7
 RrnagGtr7CCEWlSz8xehz8Ov3T/GAfAEnSrSJka0HupKViWuIKBOKIA3NGVZbXBhcpiO
 0IFVPbf9UkyeBfLd78uF6KcVThiYuHqvyX7oRHs3NXQ/kAJuOfqV+iXCrnsh58/GX4Ex
 KDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gD9ah6vfgzNO0EDh/fgGFyEHak0Syu4+YvWk62gPhQA=;
 b=A+lv3lfGVbSvNKfcjPldIgWiodWXQKRFxsBL9BEEm8S6WfP/iR6MVElxEKbt3vfCDR
 8V+PKWYjELwYwZR3bcI27UMlEbW+79eQMbJTgdgdpbzERTZ97+dm2cR/g8FSxiZuvts5
 jmpMbCuybq9goP3pg6gPN4ylBN55YTlOHOoPWrv0NOnxt7453lShxTAL1zzfcS4qzdIl
 U7fazkd0KQaNTWq2b3Ek7oP5g/UBV37Z/ViQzG/OQ+beItgbKpW0DKu0qFBs79aLhzgD
 k+5RD3vm+oQQim+/w/OL3oq989xgcXfYllHMuEYEJpnHVlwcG+2IQuUbTDb2ijjwvatW
 RDSw==
X-Gm-Message-State: AOAM530hF3LUiudzPRqyOqIWfy7SXS8RI9vTttMhfoQN4W5fFEdMlIgW
 lEUNl1fedSJhoW+Sw9IwD7Q+lVPF67s8iQ==
X-Google-Smtp-Source: ABdhPJz9QdCKGFKOLzo5UNyLxFABH8R+f3/Sb97BqEdfS9hbNEvSBS0yItbeNdqtpLKSMoSH6W6OWA==
X-Received: by 2002:a17:90a:c908:: with SMTP id
 v8mr4859872pjt.196.1629604547255; 
 Sat, 21 Aug 2021 20:55:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/30] linux-user/hexagon: Use force_sigsegv_code
Date: Sat, 21 Aug 2021 20:55:20 -0700
Message-Id: <20210822035537.283193-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Note that we were incorrectly using
QEMU_SI_KILL instead of QEMU_SI_FAULT for raising SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/cpu_loop.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bc34f5d7c3..6095ca06ca 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -21,13 +21,13 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "internal.h"
 
 void cpu_loop(CPUHexagonState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, signum, sigcode;
-    target_ulong sigaddr;
+    int trapnr;
     target_ulong syscallnum;
     target_ulong ret;
 
@@ -37,10 +37,6 @@ void cpu_loop(CPUHexagonState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        signum = 0;
-        sigcode = 0;
-        sigaddr = 0;
-
         switch (trapnr) {
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
@@ -66,8 +62,8 @@ void cpu_loop(CPUHexagonState *env)
         case HEX_EXCP_FETCH_NO_UPAGE:
         case HEX_EXCP_PRIV_NO_UREAD:
         case HEX_EXCP_PRIV_NO_UWRITE:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
+            /* FIXME: need to store vaddr in hexagon_tlb_fill */
+            force_sigsegv_for_addr(0);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
@@ -78,16 +74,6 @@ void cpu_loop(CPUHexagonState *env)
             exit(EXIT_FAILURE);
         }
 
-        if (signum) {
-            target_siginfo_t info = {
-                .si_signo = signum,
-                .si_errno = 0,
-                .si_code = sigcode,
-                ._sifields._sigfault._addr = sigaddr
-            };
-            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
-        }
-
         process_pending_signals(env);
     }
 }
-- 
2.25.1


