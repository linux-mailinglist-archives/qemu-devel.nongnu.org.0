Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DA2C7A5D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 18:49:51 +0100 (CET)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjQpa-0002Wz-4u
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 12:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgZ-0004yV-Uc
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:32 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgX-0000ZF-Pv
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:31 -0500
Received: by mail-wr1-x442.google.com with SMTP id s8so12014843wrw.10
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KndyD6yGKa/K92iCJp2h4vHJHmKSI/QJV9Re5E3slqw=;
 b=IqaEhQUur87bG6wRe6ycHiYmxMkdgZ1AZ1hDh6nE4Ok0OXE0A9TZ31aGQFWy4LGlWU
 x+/4y3ku5uLAhfI86atCXI/H+6bgGuZbqSVSY2GnK9gJqQFuijnyLeIJ+PQOUKQrxYtR
 M4Wfw7Vfv2cEdl2K2+nAh9ro2ffMmUOUb9Sj+3g6YRukMKo+3P9cCPkxUISD6xZNkmvw
 x4+mF5T4Ey6KVEAQl+aNImpEJVjcYTHvssnm98oCqWRtE7IS+AyehFy6/PxPxVpnpQ7R
 mpYxFOJj8TbzKSK6PKERy+UAuSFHd6h+BbZKPwAhBXclZiQcSJqa6MCMXwZwf2LMiLgm
 yBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KndyD6yGKa/K92iCJp2h4vHJHmKSI/QJV9Re5E3slqw=;
 b=tpQMGKrKj1KsvDUXvOh4p42vyiZ5YuRNqA/zbODKy+vmmCdYKGw+dVFU9KcCtxI/Ua
 S2jXYbwA1YXZfKo2PxL6KBxZHMJByRDjbgD+2SAY57MJnD9BLrL6X+WxEC9fKx/5RT1o
 FxIURNWbu0dK8HnZlCl4mReLxrVH62VGsosmXGH6JKLLJ5bi2t53rl8Hjjaoi/kSR7/N
 bZj9aEAndK1960xVTdLL0qagsWzu2+VB00MVEqnDKs1TA3GNpMmYYDQqyFT5gKaxz9GZ
 mGXesfsE8Unyv2syDr8Kmr7uI/t5OAxWScY//QeU2Sy0ryCr0m9JWvpqSqPILA2AxUMr
 CCeA==
X-Gm-Message-State: AOAM531aGZrJvg23Mw466qSa3idEdMiu2UsQPYcrDMPRIA9BSN6eBoSe
 sviPPp9rlGkYoodjLJvNBTwXY9eZ/5Fr8w==
X-Google-Smtp-Source: ABdhPJyTP0CkOE53TwJYnqLCgCtS6bCnTK2uyO3vc6Aoy48b4y6Dy+kKLzX3FWDIAlvo07d+o0Zctg==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr24020362wrq.57.1606671627705; 
 Sun, 29 Nov 2020 09:40:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b4sm23379940wmc.1.2020.11.29.09.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 09:40:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/nios2: Move nios2_check_interrupts() into
 target/nios2
Date: Sun, 29 Nov 2020 17:40:21 +0000
Message-Id: <20201129174022.26530-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129174022.26530-1-peter.maydell@linaro.org>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


