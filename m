Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7D41093F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:19:57 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmQu-0007KB-RP
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5P-00045o-Oh
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5M-0005HO-8n
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:43 -0400
Received: by mail-pf1-x434.google.com with SMTP id b7so12832540pfo.11
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56XZ3RwQ/YCK3yV+LJbUGYXQPwjh6Dg9hx9o+/5eyfM=;
 b=kw3nvOJ20zIcHjeFQkjElNoKNm55ipCFPYJ2EY0Yvrjh9Eu9HCjazkoFYABUiwxgKj
 HrSOGgHBOU26/qcIW22RgajvesEc70M6SYhzxxy/hxsKHX0m0I0NnslY3PqFYkG7lkSq
 ANEogJjn+YLt84BuZaG/YIt8rigwjuiBF5JxihDacAHk+GG8jP/MvZ9G2qDUqSUSJ+ck
 iSI86lAXku8SsG/7nNULCMa2kwJyUPpALBvoQYVa4+Xs4v+wxdi4eDy+Q0unI2iVqneP
 byhjTSaXnxmEdye31vN0Nd8e240K/q9aqXIBNzcd3mf/6quMIjYoruBBdbxYoqqWu7C7
 qwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56XZ3RwQ/YCK3yV+LJbUGYXQPwjh6Dg9hx9o+/5eyfM=;
 b=K7biC4T/4c3I2xBrz6bIKG7xwd4HXc/PAa3Z0yFpgSzMaNeWm2jGjJgIVtx1DJJM3K
 beru7ya80kfvcsbWPzjMOGgIgqpCCbndLbNcUJkNqlc1w1fTfVQ5leLzC37XEm/eYETq
 h5/tc+Cid4R+XhX3UdHJ6G4cN2x0CX+LnoIBWZ0v4zaj35YJFusKFZspLZ7a70O7U/sK
 E2dIV3s+Vjag8BqLLbu7b+R0gEoMqg+iNgZGULuEaAgPoK9kCYlxvfnHJGlMpg4pz7j9
 nlRrXuLRQ9RnAy33iGTLof+Sxw0Cl7t/AaiSDLowYFrlR+9OsCWkaZ3vT4Z9ZC4SRmtG
 9Jyg==
X-Gm-Message-State: AOAM530QFfyq2sHBCvSl+x9d61NBF53OHMK3tcYYviAjqAaJRgyyo8k6
 GI5ya/kooGvOdXgMTmuefMD1heod3tl4ow==
X-Google-Smtp-Source: ABdhPJwKJythbaBhaJH35evgy4p2HkqO7xkJERz0nDWqDSrRfEV+zNQ6y7x1sFZSaBQRo+zFNBn3Yw==
X-Received: by 2002:a62:3287:0:b0:439:bfec:8374 with SMTP id
 y129-20020a623287000000b00439bfec8374mr18555242pfy.15.1632016659015; 
 Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/25] linux-user/sh4: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:16 -0700
Message-Id: <20210919015718.466207-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/cpu_loop.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 8408d0c42d..3d0dd6d34e 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -21,12 +21,13 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -58,10 +59,7 @@ void cpu_loop(CPUSH4State *env)
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


