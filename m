Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A917C444349
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:18:43 +0100 (CET)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH6A-0001yQ-Rf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwr-0002fu-JF
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:05 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwp-0005BV-N4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:05 -0400
Received: by mail-qk1-x731.google.com with SMTP id bm28so2356927qkb.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0l8DFIUjHslvq6ryn61Vjm8Wn0lLyOzSxVFdscdlWzg=;
 b=GGhBjrst84xggomt+4RSvPPkY08LeWG99fXCaVYnnS9u/uAhRkuc51cQpFWphvJ9su
 I5v3Hg/5KfnWbIGbwjRWaMAFUe9HFuvXdX3zI0BCSPzVKit+SJi6boytITSsX83LUXzI
 y544x95LhkYtI/diSgknHKZ6pTKqxD4Z9GnICg01beOMBkGNt+P4uwQguQ03laVSTrVh
 /ejUFyspTCjX3xFLcc6dTS9yYM4rQh6LQY1HSyBOyKgZATbiqu3vDJDo6iuk9LNneBQD
 RRCH8RSnUH9DbFchVY8/1VuZYwuXFHM+3ygwSE9Ich0BYFyBKNYfu0tlxGBys5gOELvR
 +Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0l8DFIUjHslvq6ryn61Vjm8Wn0lLyOzSxVFdscdlWzg=;
 b=Y2lPDvXmD2kxK2btHICsdb3BU08jAaS9u/pUXy8spGJKp/SvbhJXaVZRq4NXTqHJ0M
 T8dWFyq0JECZFpuJFtVrbK/ms7LvuTdhAx+vfgtZA3OaITFr/vCzQAw50V3jAz6SA9fM
 mnqUTLjVVwHBmX520THPb/nuK9+Ycnw5wKIysHwUEQ+rTGGw1tIkmLI2cgMlT3Fk9jlw
 rk2IR2OoUtroz1b6uqiVAaw245zKXkMt0Z8P+WC3+2Nrv2Zt0X8Vnory+WMN85WJ8Naj
 +nW9stFrgNhMu4JIvRJyTyoPgToUS2vqsPkBNXnrAPP6rH7lgZJhRu1OUZ4NUF00KWgn
 1jJQ==
X-Gm-Message-State: AOAM533bKYAmQo0k8xShaXLyoFUCIILLPdgrAybjOh4FrU2F98sAo7Hp
 gmtXQZyuf0x5oSQc7gPZBDifGPw5NhcxDg==
X-Google-Smtp-Source: ABdhPJyaHu1euYRmQuIp61LFWBQ7gZ25R01GNjsNKBpn/o55+yLXgLf9RyXfDJmD12NxwfAOBLleow==
X-Received: by 2002:a37:9b83:: with SMTP id
 d125mr34332726qke.374.1635948542800; 
 Wed, 03 Nov 2021 07:09:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:09:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/23] linux-user/sh4: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:45 -0400
Message-Id: <20211103140847.454070-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c..fb561f1113 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -28,7 +28,6 @@ void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -60,10 +59,7 @@ void cpu_loop(CPUSH4State *env)
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


