Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDA3636D4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:50:23 +0200 (CEST)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAco-0001fN-40
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALL-0003Bz-Bg
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALJ-0004ZK-QK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g9so15480847wrx.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Zv2jNWA3uTLnu+d0xF3gtwB2+QTD96AaWLMNqFM0mc=;
 b=mdGNVdLAZm4AuD/rWIwIAA54RUX4ymwngLstIxV3daBLAbNaURPU5m43YRctU0JcJ2
 zGcUDT+twsAB/XjulKbCxozv64qBz6uUEL/kv2TvKtiCEFcnEXDxQBjVA2CNslL8pb2s
 WDVDra/Nr9pezs/iKZdIvvRu/jLwFOcde0opt2NTM+a21qLiQ34/Jaq03juEtYrhX6nk
 a/4r8OX2dnNcoqgZCk+E5/icYrl4ov4pVtbdiqClz64GoKOMo26YubIhtnz/YJxYzKem
 5EFQTO/alCpsLMgd6d4ZKJ0VPa7pDkRtIG60GiL1G06XAKnXu+ca6MeXCmPdxzol4Fuc
 Yt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6Zv2jNWA3uTLnu+d0xF3gtwB2+QTD96AaWLMNqFM0mc=;
 b=d+lVHz5SoTryJV7Pef47NmKpqEopB23uNfoB2w2S3lFr39//9RZQTlFj4oLbIHIqyK
 BtOXKif1aeBHZcSMYlEzn42/ap94wT7aKOtJrRz1Kwj9R1aF/kPmuDLAptjy019WyF6E
 ezRyROLuMFzzrLcG1p0H6lGGSr0uQStmwmguiioeDwXuGCwcPd2dPxsWTxGRQZhfM4Q9
 m4DWo9xtEc0hGwVBY0/l8isqkHr1NRMVgSfm1g4DjCSddsZ+e71CEOhpDB6+iqK45jov
 j2b38ksqrf2aeg9Vgvtp31aK4v3tYH6Qyzg6Znxn37Mq0Wjzf33YMuTHOiAI8Df0xOEP
 c8tQ==
X-Gm-Message-State: AOAM530vH2Z7B1u/CzTwBisVtze2CJORUC3ZNW/ZadxuA0ihwPsRmml8
 k+QU3h+bWTSBEL9t+0l4V222TzZmGv9Jyw==
X-Google-Smtp-Source: ABdhPJwi95P0/hFOtSfzKR2k84GVwYvWeWi6M4TXGS4Wchs+LPDvu/+dequYeX8J6nDRzbr3A/ZYdw==
X-Received: by 2002:adf:ed0a:: with SMTP id a10mr9807063wro.61.1618763535056; 
 Sun, 18 Apr 2021 09:32:15 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r2sm19163534wrt.79.2021.04.18.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/26] target/mips: Introduce tcg-internal.h for TCG specific
 declarations
Date: Sun, 18 Apr 2021 18:31:16 +0200
Message-Id: <20210418163134.1133100-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will gradually move TCG-specific declarations to a new local
header: "tcg-internal.h". To keep review simple, first add this
header with 2 TCG prototypes, which we are going to move in the
next 2 commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         |  7 +++----
 target/mips/tcg/tcg-internal.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 target/mips/tcg/tcg-internal.h

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1c5674935aa..b3427fcc517 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -9,6 +9,9 @@
 #define MIPS_INTERNAL_H
 
 #include "exec/memattrs.h"
+#ifdef CONFIG_TCG
+#include "tcg/tcg-internal.h"
+#endif
 
 /*
  * MMU types, the first four entries have the same layout as the
@@ -77,7 +80,6 @@ extern const char * const fregnames[32];
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
 
-void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -212,9 +214,6 @@ void cpu_mips_stop_count(CPUMIPSState *env);
 
 /* helper.c */
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
-bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
 
 /* op_helper.c */
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
new file mode 100644
index 00000000000..24438667f47
--- /dev/null
+++ b/target/mips/tcg/tcg-internal.h
@@ -0,0 +1,20 @@
+/*
+ * MIPS internal definitions and helpers (TCG accelerator)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIPS_TCG_INTERNAL_H
+#define MIPS_TCG_INTERNAL_H
+
+#include "hw/core/cpu.h"
+
+void mips_cpu_do_interrupt(CPUState *cpu);
+bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr);
+
+#endif
-- 
2.26.3


