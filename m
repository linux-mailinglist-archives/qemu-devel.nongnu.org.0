Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1A2C6BE1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:16:35 +0100 (CET)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijEQ-0006ZA-2O
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAf-0005C2-Ul
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:41 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kijAe-0004SJ-0u
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:12:41 -0500
Received: by mail-wr1-x444.google.com with SMTP id k14so6652095wrn.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qmdrf344izPcOsTR220jVZVjgW4nvR4+9igArZxzefE=;
 b=p5ezlC+agbP+bkj8naInWfC3/JKnHif7E+N+d3TuL75NvRWPSx19MdgK3ou702xq7m
 PaxkvhTkSM8ZvS5hJzUUo46+O+HiFIHEE5+3Oip4DwI1qHMfrAano4wHIlf+zqqzBw0M
 rh7fx6ka1aQ6L2XNMs2VfBAhVOAAtYdfjlrLhAYjRMHzWiF9hD0q7XCvw7E72vAvi8+s
 MlPYP5xTQ8tC0CA5YsCp7pvu8ZU0uA03Rwr03B8hKHj0Q6YR6MjYDiSkZ0CHJLTjB5Yi
 h8HKgdmcHqihUsM0koi1ALuCFxGDLkU4hSgdSlnDbHOOzIGMM5By0igDHNC6RBdk2hFK
 Cdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qmdrf344izPcOsTR220jVZVjgW4nvR4+9igArZxzefE=;
 b=JAloKoLMnlfyBhCkKMpuVP6algwNQUmIR2rw2Ai4dBsXFU6Gk5iS/P2dysIh7s+T91
 /weyTn7y+nkm/6nr7jXNsYpot4wnaENEFbAI6USWpOgqduFzuvQbN4zmnBygu4lG06QJ
 G/YLkBJWKJSJINmIWsUvTzYPH0eBr6zBRkjrakquzPom860ZME4uMQTe5QYqTTT/kyIX
 fCrupgEHfd5gKjMKIi8bkRZ3bOA1jGehhfPCs13ChPa8fTwtpLv0jw1xsBzivwp+ZFaB
 25Ro1cK4pujvNj7pCsrTyK2abAJtTU2b5w0GUO79YnNc4HlZr7XHv+5jloqGO/3fzCgW
 f+oQ==
X-Gm-Message-State: AOAM530a3Earg1BDEgNOsXizMdsO94rMvSKvUVrkRpwP3nWzYE1xDzkV
 ni53sHeYb6z/LOV7vDwV+AE5TEfBh4ECEw==
X-Google-Smtp-Source: ABdhPJyeHZnaffxKBqfYgObJCbZZuPcdUrmRAtT9vFfIY2w+jAUm71d+m3S1beiUvE/4INzFl7SMCA==
X-Received: by 2002:adf:f881:: with SMTP id u1mr12661343wrp.103.1606504358455; 
 Fri, 27 Nov 2020 11:12:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm15809722wrh.78.2020.11.27.11.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:12:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/nios2: Move nios2_check_interrupts() into
 target/nios2
Date: Fri, 27 Nov 2020 19:12:33 +0000
Message-Id: <20201127191233.11200-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127191233.11200-1-peter.maydell@linaro.org>
References: <20201127191233.11200-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function nios2_check_interrupts)() looks only at CPU-internal
state; it belongs in target/nios2, not hw/nios2.  Move it into the
same file as its only caller, so it can just be local to that file.

This removes the only remaining code from cpu_pic.c, so we can delete
that file entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/cpu.h       |  2 --
 hw/nios2/cpu_pic.c       | 36 ------------------------------------
 target/nios2/op_helper.c |  9 +++++++++
 hw/nios2/meson.build     |  2 +-
 4 files changed, 10 insertions(+), 39 deletions(-)
 delete mode 100644 hw/nios2/cpu_pic.c

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index b7efb54ba7e..2ab82fdc713 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -201,8 +201,6 @@ void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
 
-void nios2_check_interrupts(CPUNios2State *env);
-
 void do_nios2_semihosting(CPUNios2State *env);
 
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c
deleted file mode 100644
index 3fb621c5c85..00000000000
--- a/hw/nios2/cpu_pic.c
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Altera Nios2 CPU PIC
- *
- * Copyright (c) 2016 Marek Vasut <marek.vasut@gmail.com>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see
- * <http://www.gnu.org/licenses/lgpl-2.1.html>
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "hw/irq.h"
-
-#include "qemu/config-file.h"
-
-#include "boot.h"
-
-void nios2_check_interrupts(CPUNios2State *env)
-{
-    if (env->irq_pending &&
-        (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-        env->irq_pending = 0;
-        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
-    }
-}
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a60730faac3..a59003855ab 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -36,6 +36,15 @@ void helper_mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
     mmu_write(env, rn, v);
 }
 
+static void nios2_check_interrupts(CPUNios2State *env)
+{
+    if (env->irq_pending &&
+        (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
+        env->irq_pending = 0;
+        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
+    }
+}
+
 void helper_check_interrupts(CPUNios2State *env)
 {
     qemu_mutex_lock_iothread();
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
index dd66ebb32f6..6c58e8082b4 100644
--- a/hw/nios2/meson.build
+++ b/hw/nios2/meson.build
@@ -1,5 +1,5 @@
 nios2_ss = ss.source_set()
-nios2_ss.add(files('boot.c', 'cpu_pic.c'))
+nios2_ss.add(files('boot.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
 
-- 
2.20.1


