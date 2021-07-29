Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2683D9AB9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:01:11 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uQ8-000074-Jq
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCZ-0004KW-NS
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCY-0002WT-0N
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id m1so7800290pjv.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=r2GbXBeTrZkFBlEoQpX1xhuSADWB2HHtmhBgZVms75o81+AAWnu/Rp3iSwC/T5UZoD
 hHwx0DsJA2vEjeN3sn3AzWdhQWHkngR70I0Lji8ai2P+wKyoPbXK0Q4vVO9w3fkp1kUp
 wv78eJGnrEWl5MGEKeOaz+15Vdj2YG316WT5qcrENKvymrw2zYbiXmDCdaMkU00oG3JD
 HK2Xp0+6j7Q/Dw0/75ZGTmuOQdBMtlhvT8pyKFeb8kSjATrxw+GqLJbFEnjVJZMotKcs
 WxVG1zktKWw22o4KDt/CcTSI4gEUSrZXrLJQRoqiASv14HUlRA9NIBJ9JMmfd3QHlj13
 HEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXOlbQT0wGZicRa4Afgu+4pPip7Q2NUMioJcGG1uVyI=;
 b=K9IBRAVT7rnoON9EhT/dMEYU1wNLzc5KsfH3dtWWx2h8AnsDKr+k+P8r7+sGixvWJr
 7WL83S4n7ZwcJ2QFQlPDfad30IAPw3Paxswqlf10IRYcIuPxa0c+Te5wxtVqQg3hHl7K
 chQgvyACWfR2vOsr8bH3D2hLSeLoLREaGmvPUvtWxuoBo1nG2JNdBfzxdjoGbu86cJI4
 lNIUZiOF8ABpNDn06qqSiBaNytcQuIsL73ZPxyfVX5L9E+tVTQ761wCmJUoKKwV0Rl/K
 mBIG3EGqAfRTzqIYJNnfMOniDxw41YFeOGLtWamt1RoKgk199k4A9gtCx6cgJonu5L8T
 2M8g==
X-Gm-Message-State: AOAM531Fd+rJbPjRvbq+hA5031zd9OHV+tDeeaH993imoEXEYrsHNMxB
 q3xu7Hikj81vU7qjMSu761xVtopRkUBliA==
X-Google-Smtp-Source: ABdhPJxZo0Iw1FoOhK9S7o95s84uyWQNplf4w9rvd3wCCp+XJQj5ZBjGU0eR1zUgpIY1eoH/EG6j+Q==
X-Received: by 2002:a17:902:6509:b029:12b:5175:43b8 with SMTP id
 b9-20020a1709026509b029012b517543b8mr2254006plk.60.1627519624686; 
 Wed, 28 Jul 2021 17:47:04 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 12/43] target/sh4: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:16 -1000
Message-Id: <20210729004647.282017-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


