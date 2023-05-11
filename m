Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C56FED9F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lh-0007Lz-2G; Thu, 11 May 2023 04:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Le-0007KT-69
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lb-0001xz-RZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so12324150a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792502; x=1686384502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1td0lL0uZaD5nr2SdTp9WbksdhKvAu45hDttDXAoNxs=;
 b=OCYaw0V7XnjiaIw05stxbkjyYISym8QxhBPJDm71DvvMmug5HukivZ7j794do6Dhk4
 eSMBthWCoIxsGa7OF9AWiCJgXu+uNvvrWqqc8s0bPNImeg3QVeY+cczVWP67j/rTKXM7
 dyxd10x0J9b5WnBFI189G/ksD0LGrdDBnWoHpnQKuqGL9YajXclC2l4jB5FCFEMckugS
 5R0Tk8imjSEkSrmjJhGlRhZHM8nK6+EL6RkRsXzTKGwEo6N5uO3YmWno3XDwB6HAwWyO
 QjJoaQDWhck4EzGKZU1WwMX3yVHzSNNSlMmxAmtRQVReJXgtzyFWxjIryS6x+s9ppCa8
 ggyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792502; x=1686384502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1td0lL0uZaD5nr2SdTp9WbksdhKvAu45hDttDXAoNxs=;
 b=Q26w4f9HQErsHdsF+09/8rPGijddLZr2P6B2uKK+ExE24eug4p6cTZSgfDwW58vreK
 tbtvS4/ZYij2QWm7ehHRAZBYjHrgDiJDf6QmME5pSfzV/r3d6BhdYPc0Mo5rWeiQ5q40
 7K8EAoL9fb+mPwyrkZS0yK27/bvc8IeKWUCUnXrcI2xwg/CTdafDrS5bl7PXb+iXuk5G
 7BHcE+0O5cghscjGk/nFqbyjVzZBmNAN8+44PYzuD4Czy3n6sQDZztHD54wVRjwrGBYN
 01vxMdbBourhFHAeOjQWjufXYKhnOyyNLTbbgpZfSvsbg0uaUvSLez5W6t/MsBguzx1t
 0H/A==
X-Gm-Message-State: AC+VfDxsun6vdcR/aJMtdsaOLWqEzLZMv3zEOg7wYwJU0Cko62HI+G7q
 Sp0YCwSKduVh9d8afYIMOYiZq5BC+JCvYYTjlQIYqQ==
X-Google-Smtp-Source: ACHHUZ4DwxIlIkYT2DmgCE30Gh5QYwnZ/zKHrUx3t5IoRAEHitQCRYsBYGHxCUaUnBV6euHahruEzg==
X-Received: by 2002:a17:907:1607:b0:96a:440b:d5c8 with SMTP id
 hb7-20020a170907160700b0096a440bd5c8mr3113691ejc.59.1683792502557; 
 Thu, 11 May 2023 01:08:22 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 49/53] accel/tcg: Add cpu_in_serial_context
Date: Thu, 11 May 2023 09:04:46 +0100
Message-Id: <20230511080450.860923-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h        | 9 +++++++++
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/tb-maint.c        | 2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 7bb0fdbe14..24f225cac7 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -64,6 +64,15 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
     }
 }
 
+/*
+ * Return true if CS is not running in parallel with other cpus, either
+ * because there are no other cpus or we are within an exclusive context.
+ */
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
index 0dd173fbf0..991746f80f 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -760,7 +760,7 @@ void tb_flush(CPUState *cpu)
     if (tcg_enabled()) {
         unsigned tb_flush_count = qatomic_read(&tb_ctx.tb_flush_count);
 
-        if (cpu_in_exclusive_context(cpu)) {
+        if (cpu_in_serial_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
         } else {
             async_safe_run_on_cpu(cpu, do_tb_flush,
-- 
2.34.1


