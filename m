Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80A2DAEB7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:17:46 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB97-00067r-2U
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4X-0001Xq-9e
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:01 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4K-00078D-RS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e25so18631057wme.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0KcOmRFODdzl37ZYt1is0h9nvS6eEXO8j+QkYIiR94Y=;
 b=w5Ba2W46LqF1Vph4gFtWxj/K9UKzspYTmRhGGzTs5yoRklTwCwtHkdyCt+41hG/Ku8
 55G/r/Py0vDP2Rh1PnQvcwkf5LW2ANCIN9cw+EpPq7HsEadZ6biuEEkY9xm3ZwWaF61M
 ENfqolnAORv+D342nSRwe5NKDkmX4AmjufSTIPGq03pyviXAYsu8gJG/wsCE2z/ryaFD
 3O74NICLOs90V1tu70rDF66RnVIjlxGKMhpqpFDMWDdicwaTawguTs8+aUZjrlstNhDd
 EM3FzP66h/gGjnyp7UK7f8HSvyRA6GhaAmO2o+5TQ5cbFJdYaFveIKJ9T3xr5/iuKhCU
 Ae1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0KcOmRFODdzl37ZYt1is0h9nvS6eEXO8j+QkYIiR94Y=;
 b=rvWnD4IwE07wC80y9/TK+xHApsKXr4QPghBEfU5xcZysN78X9mcEZKijibsYObYJAX
 SDLUtkBKaYxPcnIfNEiIszSuL7cdtn4+PhbK4z5cePIttY+wCgNBNH+s8JyHFxansrlm
 DWqwLePfjskd1VZrKhIM5IF96JYoPENI4keHTn8Z0zBGWEuyQ9F/5EKvA0XDs0hnPccr
 io6Pyjai/HJusgUfdtkrtbq1oxZPNGhCQOZfncLOFvUvmP5S5BcUCT9P0Zi+KH5axbaM
 BMdLl2XZJ4zDv4VDhEwGmBR6FWxCBQUNkDD7frd4FnLhvIxwlj8D7CvznAM+JBzftmfj
 +DLA==
X-Gm-Message-State: AOAM530uwYrFz1bYnTgaFhA3kzCO89Th+BBRNt2aeA6U0IouzPFdtPmc
 y3lPcHygv+//beEDTTnKZBpdehqOu2KIOw==
X-Google-Smtp-Source: ABdhPJzc/wJuxJqu3RvO+aLAKPaoQi5QOWqV4cNn6FrL2c5Gi93CClsEMtSXg1/3FHgrPJidEZb9rQ==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr32521530wmg.67.1608041567228; 
 Tue, 15 Dec 2020 06:12:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] target/nios2: Move nios2_check_interrupts() into
 target/nios2
Date: Tue, 15 Dec 2020 14:12:23 +0000
Message-Id: <20201215141237.17868-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function nios2_check_interrupts)() looks only at CPU-internal
state; it belongs in target/nios2, not hw/nios2.  Move it into the
same file as its only caller, so it can just be local to that file.

This removes the only remaining code from cpu_pic.c, so we can delete
that file entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201129174022.26530-3-peter.maydell@linaro.org
Reviewed-by: Wentong Wu <wentong.wu@intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
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


