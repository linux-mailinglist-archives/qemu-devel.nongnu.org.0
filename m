Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D6698ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUT4-0003PY-VI; Wed, 15 Feb 2023 21:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSz-0003Nx-OJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:50 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSx-0005Z8-V3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id bg2so549131pjb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h3P6HqEEKj6zOhYvB4XtcCe2Zq35easW5Xbjd8pYTNM=;
 b=nsLQaYJbAbY47m5ol/xuXoAPRpw90+yDDBDUBr472UFio4P+/mMpK/WQRieqR4+9cJ
 zTRsTaoMGF/jLrtVDz0MNrS5oo2Zy/69B9Z2PGIvOVfU0ukzs7AjL/ANs0Y/DJGnCZSZ
 8KW0YmdUXkJujE72labMgcot+4NQEFxQKKrXYE2S5cBJtNHkTVFmRZelrmQ5wz/SOmD7
 pdqHtMe0yMWC+pSYu1tinIjG8j53OuPiu8oB4iGDDj0mnJUsBL7RG4d+IS2EwjMxJi2m
 KcvDQ7fnrcXoChlPi6rn7MllmY5srCumGcsriTM0FB5m4XCHYZJy7ti0+ENRfV4o8IrX
 ObDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3P6HqEEKj6zOhYvB4XtcCe2Zq35easW5Xbjd8pYTNM=;
 b=U66ER8q5DqBLNn4Rv4OtmsLlCh7db/kg7RhQHAUsr85FY/zc8+zMw6pxThnCwhDrE2
 YAYHgBsX0tCeezOVmCLvV367tctY27BawK/HR07G+4XnWrH0vWunCIcQy3rU7tjDtwmp
 8dl4yqissnbWvqeHeIohS6yBFyYLBDZIaLNj79ujDmy/JDMHC5H0dLbxm0XF1E5TCdlN
 L4FbcYip6mr0Quh/ryFkr03/hsuZ/uWug8UwFoVDyBrX3+8Y5WDSnZMB/sp+4HjejnC3
 4WvFJI33olvw0hXdhKGm0jT6rS0s8IacnCqveZOCl9mCc2ZgqEpT8ITnataYfE7ycJGF
 FS7g==
X-Gm-Message-State: AO0yUKX9NQYZDprwpoosaYBRE9tw3SfoZLCRxK1LCBtzoXt0gsBMajY5
 TXQLso/0a8UjD/dlVwCoBsA2oXcXR0Xw0AGiWKc=
X-Google-Smtp-Source: AK7set8X8QHwrKB7fmdwO6peJcsjGVNFazVKNPTKMSbPNU5KIDwzTU1M3ngrD1ImHUEkZbciK6lJNQ==
X-Received: by 2002:a05:6a20:8e09:b0:c7:13ae:2f03 with SMTP id
 y9-20020a056a208e0900b000c713ae2f03mr1320155pzj.31.1676516266509; 
 Wed, 15 Feb 2023 18:57:46 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/30] accel/tcg: Add cpu_in_serial_context
Date: Wed, 15 Feb 2023 16:57:12 -1000
Message-Id: <20230216025739.1211680-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Like cpu_in_exclusive_context, but also true if
there is no other cpu against which we could race.

Use it in tb_flush as a direct replacement.
Use it in cpu_loop_exit_atomic to ensure that there
is no loop against cpu_exec_step_atomic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h        | 5 +++++
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/tb-maint.c        | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 6edff16fb0..e181872a93 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -64,4 +64,9 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 #endif
 }
 
+static inline bool cpu_in_serial_context(CPUState *cs)
+{
+    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(cs);
+}
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..2fb4454c7a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -78,6 +79,8 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
+    /* Prevent looping if already executing in a serial context. */
+    g_assert(!cpu_in_serial_context(cpu));
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index b3d6529ae2..4f6b447149 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -758,7 +758,7 @@ void tb_flush(CPUState *cpu)
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
 
-        if (cpu_in_exclusive_context(cpu)) {
+        if (cpu_in_serial_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
         } else {
             async_safe_run_on_cpu(cpu, do_tb_flush,
-- 
2.34.1


