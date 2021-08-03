Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFAA3DE502
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:22:05 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlwK-0005lp-9u
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpZ-00034J-90
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpX-0002Bj-Hu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id k2so4598898plk.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=L8hyDq7gkzmLPvYBe6B19El0Bsna1Td5Gmt2ZPtgFCLmNR3ZBLm12OfCyf8xdcWlkw
 hhY07QIpA047ZSpcchkg8OJVoaNKExeMetp0gebjquU+DTn3N8mt6ITYR58wWlAM/eF4
 EuQK+tw7UhAvpVyNmu5hsI3wX+WigaBDGzwUm1fjCcYt3X+f3ZwPSK24bzpmD3N662HG
 y3qhsDLT52lffuY/P2L2h03C/jCbjl9W/gSnORbVhiPRonuVyyXnpkg2iHLs3hIEzYuA
 9602c4v36D5RK4NvcfcgsQFzIoEDRuXi3m7I9Szei8t6E1k0M3FCw24wC0QGh2AAtWvE
 wPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=YQXzAOKSh0ybiEbF5yHla2fBavfq/SRKXGaLLXKy/Ew2lKCjnQs3cYtAoS2ZUqquob
 +ESS5Kou/NEqmwu5ojIaCA1fXFNLCvw0PHYLXL8P7K+e2oagygj7/T8fhdZOkzhDVGoo
 wSAHSGb0fgpm0rCv8OijkfrkHLGzQeZRffZuTEXNVbzR83R9i1wdz+bCaiUnhQyAvldc
 0IQpTLtgSJNgFJQQ87HYxaxS66X5mn9O3/n/luODWzmYqt94dpodWLs39l5i61lGFv6g
 8KkvSX9D7OAKFqiCiPa+opJxv47q3ZRZtQvuSsyfi9Zdg80oZfI6hsG8VEp0mZ3z5moM
 GhIg==
X-Gm-Message-State: AOAM532sy3eymtB2KAVMP8wyt6QDyZqtaMYI2V3/5fORzhHrpBgV+dux
 5yJt0wp2neqP+KfB/MFmrRhcuCnjPx8lhg==
X-Google-Smtp-Source: ABdhPJzHgNE2sWpH/jJHMH3VEG6Pt/+8iHLRQTqPXLkN4BHwC1ocVMTClcwLnXMVIbbSQsSHEpuUfA==
X-Received: by 2002:aa7:848e:0:b029:333:4742:edb3 with SMTP id
 u14-20020aa7848e0000b02903334742edb3mr19675119pfn.12.1627964102229; 
 Mon, 02 Aug 2021 21:15:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/55] target/sh4: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:14:02 -1000
Message-Id: <20210803041443.55452-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


