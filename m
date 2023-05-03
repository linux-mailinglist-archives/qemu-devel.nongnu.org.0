Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17C6F51B9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:34:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6aP-0006B6-27; Wed, 03 May 2023 03:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zs-00050q-Pd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zo-0005Zd-ME
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30851635e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097619; x=1685689619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcNujZc9aYQmCLoddPQYpB6/3gwl5pOhsjTd6sdWfnE=;
 b=jVj/ietQx4LaMjfG8tQYpGGDdD3HDGS+JWCsVWx7lh7ZmIWnvb7VUnNku/7YzvKaWM
 LC4ZyUvV3TpVCz6SaW8LCU+0lEQvO2ZSD7l/4uMN5CdY7arTd7ke/obqwPH3zCEeeSQq
 2lOEufTMtXpn8EVoBimsDvYKTHLfSK0ecIQa17Y3/lSpcX9HjuxVRhIKX5GxoZlpFsU9
 Wrxyqrcq1ylvMe67QYSVCyH228OXvWmbNVj/ObhkO+epIy2JmclIEIlwgwRsY/2v23p8
 uFKUTgZSTnLpq18nDmsYqaFilaew1epYzyRT+zKQO/Syr9F0/ZFlg/AIEDKl+ZKjdgCI
 6TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097619; x=1685689619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcNujZc9aYQmCLoddPQYpB6/3gwl5pOhsjTd6sdWfnE=;
 b=CkO+6tzKdXfbaBMMHLzp392mcmrQfpeABzWNBblpP4r+dXWM0iBYZ881/0tXGQGii0
 zFsx2wLHCN+t/Dhks3nI3uq7GeBJoxlUgUAXQ4keZTmUfh+BMyfxJ5svPL+sFoSKzNsn
 8e53Mi61xhhg5B1qajL8XYEpVJqgWupS3NiqcDmQxPfSqLQC8RpNBBXvk1pzYZ0kgLPU
 njdqJahgNulaOea/8dqb9Uddkl8FdDS+ZoDmqr6Cc7Zn+byUHNbqMzcVhmtx+LPuN6yN
 CAmRQ/gbOlEu2A04v5NLS8Zf7Qv5mxfAzX4F/iKd4toD1jHsDz85nDM/lU2/1tyM9ieL
 HqYg==
X-Gm-Message-State: AC+VfDwJNzLvm0Z6TPl8IasdSQkXW+E783hVQLYJi7djtAypNHQdEMK5
 PM7IkKnrwVUCMRz3TDWLbNiTNCFnNA4w1HXbqaGZ6A==
X-Google-Smtp-Source: ACHHUZ4zx9cYhH1xnVpx1gzt3gf/RZNJhdk7sgkExN+7eA41gxXYRJC3M1cEaeNGQN4BV1CYNwp/ew==
X-Received: by 2002:a7b:cbc8:0:b0:3ee:775:c573 with SMTP id
 n8-20020a7bcbc8000000b003ee0775c573mr13166311wmi.20.1683097619227; 
 Wed, 03 May 2023 00:06:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 02/57] accel/tcg: Add cpu_in_serial_context
Date: Wed,  3 May 2023 08:06:01 +0100
Message-Id: <20230503070656.1746170-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h        | 5 +++++
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/tb-maint.c        | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 7bb0fdbe14..8ca24420ea 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -64,6 +64,11 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
     }
 }
 
+static inline bool cpu_in_serial_context(CPUState *cs)
+{
+    return !(cs->tcg_cflags & CF_PARALLEL) || cpu_in_exclusive_context(cs);
+}
+
 extern int64_t max_delay;
 extern int64_t max_advance;
 
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index e7962c9348..9a5fabf625 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -22,6 +22,7 @@
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
 #include "qemu/plugin.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -81,6 +82,8 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
 
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
+    /* Prevent looping if already executing in a serial context. */
+    g_assert(!cpu_in_serial_context(cpu));
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00..7d613d36d2 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -760,7 +760,7 @@ void tb_flush(CPUState *cpu)
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
 
-        if (cpu_in_exclusive_context(cpu)) {
+        if (cpu_in_serial_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
         } else {
             async_safe_run_on_cpu(cpu, do_tb_flush,
-- 
2.34.1


