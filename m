Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D143487E58
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:36:10 +0100 (CET)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wu9-00084p-Nf
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqy-00058Z-1M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:52 -0500
Received: from [2607:f8b0:4864:20::42b] (port=41496
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqw-0007oA-Jl
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:51 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m1so6162400pfk.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHQ4X7rzXaJnYCapLrO4HAeSSTSF3ady3e3gQlLak+8=;
 b=jxeRwy+9RJikNHfgZ7IOqYmx/l7HGCuOPcW9CPWAjpTJrvPj03bwk+UtERwFQLRSTo
 2hSsZz5P7t+/MWAr+3CUKzBKeDD2hSIPOm0kQrvkvQh4Enj2nYcEQ+7IKIRX31MvbJeY
 jnI7LS+CRMR5Ne4eKQqHKdRntwNn2GZoz0WAneKuAmcnnBPMCGGD/wRRe4U+dWRPq4IV
 JQ8Usa37IwFNM0Rqkp964616FoOrSeYH45WljzvkICUSvMyFNaewXXvQ336YbAAfba92
 n2vdB0q0tv7Rvu6BM1vKjihYDYOK0Vh9kZZykpEd6GOPE7eNAurMqVBEyqNW1kUN4hbU
 tRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHQ4X7rzXaJnYCapLrO4HAeSSTSF3ady3e3gQlLak+8=;
 b=Gm1LVczYoOu3b1ol9BmE/wCFyL4vPgFIXZxpTqYy0jvv9fioB/O0vf8I1MVGF54b+4
 +H/pMSzsKu5aWiq9cAh2lkimqIzx6mvdJ2yaleMSVDj4wKPnZShWOmyBUBlCGyK7LoQM
 IKljuHVcn5oKUtZI7n4BHcso9l3x5i0UC7jALQTSa9sNAnkyLAPvWSAv9ay+tNcsHErT
 KZJ+FezTttzmJjQPXXeHTC8vFi7dTU2/KXuDYNvLDfes0PAnJZaDxdpGjjdRiJKpG87C
 gNIB2br4p3HJnyyazn4Z+wcjfA0dDxU8FotuGT/BlrKV+R7UaFJaRxFwRyGPHaT2oM3h
 mvCw==
X-Gm-Message-State: AOAM531IdTWghmc3Yk9b3Vze59msHjoWCUU+s5vQ5WhDcwFFzViba2p1
 rc1dwyPl3bnDdFwyLowYEzX4MILPqIZZEA==
X-Google-Smtp-Source: ABdhPJzNySXbTvMGzFzTyqMzgeyZZIXAKUQBbeXBapG+px1m3MKxmTEaxGckBawJMjGnaYHG/l4ZFA==
X-Received: by 2002:a05:6a00:1484:b0:4bb:86a:c061 with SMTP id
 v4-20020a056a00148400b004bb086ac061mr65951263pfu.36.1641591169399; 
 Fri, 07 Jan 2022 13:32:49 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/24] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Fri,  7 Jan 2022 13:32:27 -0800
Message-Id: <20220107213243.212806-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 75abf64287cab, for linux 4.17.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h  | 1 +
 linux-user/hppa/cpu_loop.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 510a8c1ab5..f23f0a2178 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 
 /*
  * SIGSEGV si_codes
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a65e1571a0..a576d1a249 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -156,6 +156,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
-- 
2.25.1


