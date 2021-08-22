Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1B3F3D6E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:09:15 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHenK-0007vN-Px
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaL-0007py-Ek
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaJ-0000f4-VM
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so9883309pjb.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WrDsV8FuQ7eVHDLBH4cYkBRu3DriqEOVfUQFkxYbNm0=;
 b=S0ZT/QMRBhf3vVb8u/7R3LEsKkFjJBCi0HxuN7UcM4LUI160vpIAjxxwgFfhbOq4MD
 esdaVv+eE/DMcMWYAKlK0LdAWyvh0wr77CyfG3ZbqcgU+uEDa58xYFHRoSaSn6TZW0VP
 qhJ9WzWBJl964uQcDXYC2+TShzD1gW2g9O+BcGyBcs/J3uzqJHX0Z+WTDHRx06ZyQAIo
 epZ8+w+GTOVeeVYkM5U4SRJEHwWbY+qirUc7+QXrRgYemyDu4spdAvGexF5s8K0AmKrg
 sRBYuASUu+/4R62kChy2nt1twRQE/3L57/WZ3o4mwWtGeWIKp36uVhuL1Sd41ZM2RVCd
 UvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrDsV8FuQ7eVHDLBH4cYkBRu3DriqEOVfUQFkxYbNm0=;
 b=d/yHyf/HE4RIjXtirK7s/9p8R2TQZUPTfIERKc4Sx3lUT/61xHWAHZ25SJoY5J6oqY
 aPHveYoxHY/5H6uYhj4tgwY5eBi3f7RDirka+pmQ1w9YSswqZDsNkjQm8YmNuqj778zl
 sfsJ/iuAr8zUhQQiMsnML88uMQCYM89ZoN7uYGDu2vZpBdv2VrV+l3t/rmPewCab5eff
 3+doolE1DFnmuHnhx5373zJlwUq6+SZhRkKinrGOdSeut3mP2KIF3wWW1q9tTCwkv3Wh
 DII2/hD7pBedY9G4lxbvQeXxgtvY/ojt6ywqUNVlsz0AjeVXMVCVshG2CjOTWAAJ4PkV
 tXrw==
X-Gm-Message-State: AOAM532HxslQVtzSucgCn0fOPrpT8mN4KYsdVyJHio3324iO7g93uYkc
 X+xr6IwoeojM13df9dgcSRreUFyQnrXslw==
X-Google-Smtp-Source: ABdhPJwF7zv60YoAJZNss/UvHz3693pVGWr9LSb6BdOiTkE60tmQE2h85wNWkSUoKWAo2WXN913jAQ==
X-Received: by 2002:a17:902:c401:b0:12d:8258:e07e with SMTP id
 k1-20020a170902c40100b0012d8258e07emr23088099plk.51.1629604546656; 
 Sat, 21 Aug 2021 20:55:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/30] linux-user/cris: Use force_sig_fault,
 force_sigsegv_code
Date: Sat, 21 Aug 2021 20:55:19 -0700
Message-Id: <20210822035537.283193-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cris/cpu_loop.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 334edddd1e..7a31402ab4 100644
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
@@ -36,18 +36,11 @@ void cpu_loop(CPUCRISState *env)
 
         switch (trapnr) {
         case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* XXX: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->pregs[PR_EDA];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sigsegv_for_addr(env->pregs[PR_EDA]);
             break;
         case EXCP_INTERRUPT:
-          /* just indicate that signals should be handled asap */
-          break;
+            /* just indicate that signals should be handled asap */
+            break;
         case EXCP_BREAK:
             ret = do_syscall(env, 
                              env->regs[9], 
@@ -65,10 +58,7 @@ void cpu_loop(CPUCRISState *env)
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


