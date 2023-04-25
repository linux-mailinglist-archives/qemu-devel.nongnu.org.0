Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB666EE880
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:47:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOOl-0008Cf-W2; Tue, 25 Apr 2023 15:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOj-0008Bn-Ju
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:32:21 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOd-00045q-L7
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:32:21 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8ba693f69so59501391fa.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451133; x=1685043133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+fxTxTqIhiI86kN5IY9M/+obOs0ta97k4WM4ZR41R8=;
 b=X+97rYn7nYhePOgZIOufdVTChNLCg1ILAZNK6JF98HvkPuvQ6h4ZOmVWwXCYKLFXAb
 zT9ZI2rCNNxKwLYS7397Dt+CYNqhlxrmyEqZaqDZ2C2h7xb0xw6bme8oW90JX3z6EDql
 RbUbhwkeQEm8FnWA8rmLSEuffeamgPyLTbBWuAb18Z6L2kTCJUBiz4ZS6+tbe0YVtnjJ
 A/F5RIdnbr4fkD7KL/hkTnwuycLIvz4h+XM1uJnnFN1ZcoiEjVlJJiMj3ecUBq13dgMu
 ii9tXAvn92OjS4pLUTDldQf8VHidA/mSrRRsCnweHmF39FpdIAyljaveHOcu0pWqgIMp
 PpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451133; x=1685043133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+fxTxTqIhiI86kN5IY9M/+obOs0ta97k4WM4ZR41R8=;
 b=Ptuq9yQpGBu3lc4nHsJFHBI3hMgMJY5GUosdbNy/Zu7sj4yKCgwp9wgI0u7ItX/ZF/
 nSvSh8+YSOM45T/pOajbUc3qr4mwMd4wUeez2Rs+jW5SGPTz4LmyOH9IvmbmMQRyu0tw
 39O1YQRn4cS/t5J3Oof0O2s/f3mCtqsZAfmKL/G2OELbkH85picf7Ecieza9ZlmviT4u
 SzX6g5awPBaexnTc6Azrib3gAMMrk8GaGREdS2Zij7LelNuYimruwfgLTWnEjXeucDJA
 eSsMqtW+aDokDzNGBs1D2ewi6TvU37CSUencCDzzuRjp9asGf9bpJpTs8Gx1Dmj87Tzz
 1Qig==
X-Gm-Message-State: AAQBX9ecd4l46mKZCptEvBRKdc9xWb9OpC3Z7pwf/+txOytVLQaFSia2
 nU6YuSJ/iVLumrxpIaUlWYu10ECeKc5qW7oL6ghxPA==
X-Google-Smtp-Source: AKy350ZEhMVq2MhtpL8/LPCYy0S8TrfSY41eE9e1biZYO5Tq8sjSdOsKUyp8IAy7TbYhsUf8WbQc7A==
X-Received: by 2002:a2e:7010:0:b0:2a9:f114:f166 with SMTP id
 l16-20020a2e7010000000b002a9f114f166mr3637834ljc.2.1682451133777; 
 Tue, 25 Apr 2023 12:32:13 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:32:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/57] accel/tcg: Add cpu_in_serial_context
Date: Tue, 25 Apr 2023 20:30:51 +0100
Message-Id: <20230425193146.2106111-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index 96f198b28b..8250ecbf74 100644
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


