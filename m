Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CE3F0BBB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:26:40 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRCx-0006MF-Bz
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6F-0000Su-So
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:43 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6E-00004x-CQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e15so2427913plh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=I8lwAcoXc7l/5Ytm3zRMIA2zEWDAItlnmy48h+gDvWE3SDXjm4Ni7sulQrJuJOxKkH
 IMHqUOTwDOhfAS9XzoLei+Nwadf43Nan3PugEJrITVhisWCLcSEQ4AZalQN1lcdHtBSQ
 fMDYcgK931mf2t9O4zP/3YF/enz0E0qfTeIaEjyF6fmE2RYt8G5MGm+nEr7DP/Bmln+D
 G9pNV/IurmmZMoFrKX2Uvfy41fdwZH1w+KTPgpQx6GlCWh6B2ZxmWxRlDtHLQ8eOr873
 lLSqczYbXy1mQHKbZEt1KPYPe8fjrpqUwJe8YObix3tODesrWd7MzrIHczRxv7ZS3/IZ
 f7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=fMktimdKGXn3WmG+TUbtY2q61FKpIKw4j8J1vX5N4J/yJOo7XD4d7WuLfB0t6X/j6/
 IitFcMI0uoI0CMenb3D58rBg72PJxAIKqBtBmheKkBFVwQ4xeJCcIyUW50CikUC6Pjpj
 eDI9xTxl8NOHa/9AKqM5qmpmwowXiflKqciLDyvNj6yPy8sMAAAZhCuJd4Dshe3E/qEl
 my5rvDYMb+sPzr6XnLptfZQ3CjcYF+5vW78mGPjbpRIpHdZyJpQxrijoGNtiNvxdJ+hO
 98W0jBZ3ZMKTiTnOps5+6y3kr7HQ7ExoGOkvf0lnBbZgDyDUs+MFUfKvAPa2xRoxv4f5
 DqUA==
X-Gm-Message-State: AOAM531yJjhTqwBGwste39ZuwUP+9lZ0+C0tYZI2odWCVm51NIFySCNm
 FF+FZAYK1squDuptqP7tYUtAap4jqROMyg==
X-Google-Smtp-Source: ABdhPJytclogOyhSP2ebBjEZvRG90KwbuQiI0H9QKG6HLRF/948Bs1QRgLYkY2cnEQ+NOA8myauhjw==
X-Received: by 2002:a17:90a:f3cc:: with SMTP id
 ha12mr10875871pjb.195.1629314381187; 
 Wed, 18 Aug 2021 12:19:41 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/66] target/sh4: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:29 -1000
Message-Id: <20210818191920.390759-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/cpu_loop.c | 8 ++++++++
 target/sh4/cpu.c          | 2 +-
 target/sh4/op_helper.c    | 3 ---
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 222ed1c670..21d97250a8 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -71,6 +71,14 @@ void cpu_loop(CPUSH4State *env)
             info._sifields._sigfault._addr = env->tea;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case 0xe0:
+        case 0x100:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
+            info._sifields._sigfault._addr = env->tea;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             arch_interrupt = false;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8326922942..b60234cd31 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -238,10 +238,10 @@ static const struct TCGCPUOps superh_tcg_ops = {
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
+    .do_unaligned_access = superh_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = superh_cpu_do_interrupt,
-    .do_unaligned_access = superh_cpu_do_unaligned_access,
     .io_recompile_replay_branch = superh_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index d6d70c339f..b46fc1bf11 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -23,7 +23,6 @@
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 
-#ifndef CONFIG_USER_ONLY
 
 void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
@@ -46,8 +45,6 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-#endif
-
 void helper_ldtlb(CPUSH4State *env)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.25.1


