Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B926F51E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tO-0003s7-8R; Wed, 03 May 2023 03:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tJ-0003Pn-AX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tH-0005aD-34
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso46559075e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098825; x=1685690825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wnxm9mpRVuza9SA9+TG1wag1yuuwn7tqFXctqi18Yw4=;
 b=al8MTub9PHrBlAu5PP+HQBZQMxGxnYbPOHWZAu0GP0asNHQy/21X4iEHCK56zlVbXY
 eK+/0jrfEwtrZ34q7WFj2J3V63m/21jw7Hvxs/xuyT1TY/JQKStY/Fo4oHx3hy2bMMWt
 psUqDSN0vSPc13Lg7lsbHFt23tJ7OCRkvwnIVtCUHnUqOvSybgwKOIwZWFrSpNGR2uil
 bOLqfXBJ70sSmCY0sfGGoYZFbSZDIBwm+S44emGdKHFbfRZG81JD/97kgzYcjHoyxN3O
 4mBuIWIy2okkHlwKKYVAsxOp1atqGnXNZtHXCBLezELtCZ7l2MAM2dIyYM8JwyeNjja1
 DETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098825; x=1685690825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wnxm9mpRVuza9SA9+TG1wag1yuuwn7tqFXctqi18Yw4=;
 b=bESxxMOAs/aE0LBxdkM6Y9Zjnizf5VbYcaX1M6FsiNTQpJKKN+jG+WL5LW9tu+WY6h
 Ce0o1DHy3yuhssoufkH6DFWpbtwBkOgYsdRtlWhS4qmcBrnYmo9TjUVlQoePEmge7cys
 nxMF7NE6xRoOuuY/ffS3msF46Z1n85elcTIHU5XQna44dfH8GsmBm4C3SfcfdpJ0tZf7
 icr/465B3BtGOu3Zu+hH5z+j9AEd7h8iuZUAUjBSVnhjdpMdPl+vj8fMHHJ2pqyXu0yY
 o8YUG6aZB0Q4Wo6sVrQZuoCy/TI89sYSiYO9UWa3w31A9KAEhnIUIM36+5evZIf+SmeW
 +XbQ==
X-Gm-Message-State: AC+VfDzDUPHVFZhd6pb2jksqkGclcHwwwnIT8CECIUpGVYtlvtWLLFRT
 9LwQW0G8j+OkSs0liUR2GSvBh4OF1QTOvWMb44YKiw==
X-Google-Smtp-Source: ACHHUZ78uNn9czlqvDjh8XJeLZyVFVM2bObb+DhWcl4d2GkpCoc3hwwKrXc2nH4XQ47r9gpOGYcXZg==
X-Received: by 2002:a1c:4b0c:0:b0:3ee:b3bf:5f7c with SMTP id
 y12-20020a1c4b0c000000b003eeb3bf5f7cmr14438876wma.23.1683098824994; 
 Wed, 03 May 2023 00:27:04 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 42/84] tcg: Split out tcg/oversized-guest.h
Date: Wed,  3 May 2023 08:22:49 +0100
Message-Id: <20230503072331.1747057-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

Move a use of TARGET_LONG_BITS out of tcg/tcg.h.
Include the new file only where required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h       |  3 +--
 include/tcg/oversized-guest.h | 23 +++++++++++++++++++++++
 include/tcg/tcg.h             |  9 ---------
 accel/tcg/cputlb.c            |  1 +
 accel/tcg/tcg-all.c           |  1 +
 target/arm/ptw.c              |  1 +
 target/riscv/cpu_helper.c     |  1 +
 7 files changed, 28 insertions(+), 11 deletions(-)
 create mode 100644 include/tcg/oversized-guest.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index f916a96a31..59abab7421 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -357,8 +357,7 @@ static inline void clear_helper_retaddr(void)
 
 #else
 
-/* Needed for TCG_OVERSIZED_GUEST */
-#include "tcg/tcg.h"
+#include "tcg/oversized-guest.h"
 
 static inline target_ulong tlb_read_idx(const CPUTLBEntry *entry,
                                         MMUAccessType access_type)
diff --git a/include/tcg/oversized-guest.h b/include/tcg/oversized-guest.h
new file mode 100644
index 0000000000..641b9749ff
--- /dev/null
+++ b/include/tcg/oversized-guest.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define TCG_OVERSIZED_GUEST
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef EXEC_TCG_OVERSIZED_GUEST_H
+#define EXEC_TCG_OVERSIZED_GUEST_H
+
+#include "tcg-target-reg-bits.h"
+#include "cpu-param.h"
+
+/*
+ * Oversized TCG guests make things like MTTCG hard
+ * as we can't use atomics for cputlb updates.
+ */
+#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
+#define TCG_OVERSIZED_GUEST 1
+#else
+#define TCG_OVERSIZED_GUEST 0
+#endif
+
+#endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0999847b84..b3e8d78907 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -59,15 +59,6 @@ typedef uint64_t tcg_target_ulong;
 #error unsupported
 #endif
 
-/* Oversized TCG guests make things like MTTCG hard
- * as we can't use atomics for cputlb updates.
- */
-#if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-#define TCG_OVERSIZED_GUEST 1
-#else
-#define TCG_OVERSIZED_GUEST 0
-#endif
-
 #if TCG_TARGET_NB_REGS <= 32
 typedef uint32_t TCGRegSet;
 #elif TCG_TARGET_NB_REGS <= 64
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 83297f9bff..7d3cd877ff 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -40,6 +40,7 @@
 #include "qemu/plugin-memory.h"
 #endif
 #include "tcg/tcg-ldst.h"
+#include "tcg/oversized-guest.h"
 #include "exec/helper-proto.h"
 
 /* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index a831f8d7c3..02af6a2891 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -28,6 +28,7 @@
 #include "exec/replay-core.h"
 #include "sysemu/cpu-timers.h"
 #include "tcg/tcg.h"
+#include "tcg/oversized-guest.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7b7ce65c7a..0926ae4c4a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -14,6 +14,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
+#include "tcg/oversized-guest.h"
 
 
 typedef struct S1Translate {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..7b9744be1e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -30,6 +30,7 @@
 #include "sysemu/cpu-timers.h"
 #include "cpu_bits.h"
 #include "debug.h"
+#include "tcg/oversized-guest.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
-- 
2.34.1


