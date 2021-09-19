Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59B41093E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:18:31 +0200 (CEST)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmPW-0005uv-E5
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5O-00045m-JY
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:43 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5M-0005HR-QO
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v2so8744305plp.8
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o4amvpiO+LWSxg4WGAwTki8YsyCcWz5FR88AOy0i/nw=;
 b=SIcgwHkSe0q/kkQEcTTOMoD8TuCPUEDAyAdPEkUXh4FhX17JI7Gyv9dUEsHzPiJ27i
 ufDQ/5i4wFHR8AculgXxOu3Pwxz48+p3QRuIcluZdSGjqurj9KITvE9ZDVhlfwTz+kCt
 7Wrl+qPaq9xQYJMULhpotdEJDaR40zhYdG0emkplxBLLLeWKrVlz3a6BB01gb1CKW83I
 f+SLukiPBKWQt8dx47pQfQAgdo0pCbMWfr+jF/S2XrkJta89Nkb0jdC/NOSOUr/02aLM
 d8uYvVDjOmRMvFkQu2X1iRroJrJskF3MbdwAqVYsE7CN/nN5bEmxGsR6t5VyPwpjofhM
 JDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4amvpiO+LWSxg4WGAwTki8YsyCcWz5FR88AOy0i/nw=;
 b=SM8vkBy/M0DOBCRU2NYHOKzjAaqxhlf0ldjiYY/AletYlPlnrTSRXN/vZZW4cuBxgM
 R80MpSPs/O30OGm2UopYTzkQPk9eyRzxbPLDSRGeKmW7K89YJ7tmxWWsIvRJ+NAGcNoF
 JSj9s5jhxXIgBgmDNaOqNFrJUeFW0yn+y/levmSUBRTwidd/ExtVn7aW2ZZX3vwoHRm8
 PFzRee3H05n8hy7bRl5b2pZ0jzzZUsbzpGM3/HO1c/L9u9v8wc+0xhPKYUl+Opwf1TvO
 NsjZUKtfKMlq1xh+Szs2YwdVP7UBcTS9P/c7SKdfu3A92Tpweg51RgCa9jqJcMtWKZza
 ofQw==
X-Gm-Message-State: AOAM533HobTd5G9JOiv5jvkVNCR/8TVrqmWsmlPS1HLUW9f4DRaVUKxw
 f0jkFAR2Ml2Rkxa/fFyfcHNwCbMz7SIfow==
X-Google-Smtp-Source: ABdhPJyfBqi/mG6rnEoUiAzv9wruNOIa//mIDQLJyS9sPVa7LP5pFc0HM9OHK7G2LSSIRKl1in5Fyw==
X-Received: by 2002:a17:90a:192:: with SMTP id
 18mr30075819pjc.119.1632016659565; 
 Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/25] linux-user/sparc: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:17 -0700
Message-Id: <20210919015718.466207-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 linux-user/sparc/cpu_loop.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index f5e0de7eaf..414cc95740 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 #define SPARC64_STACK_BIAS 2047
 
@@ -153,7 +154,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -239,19 +239,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
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


