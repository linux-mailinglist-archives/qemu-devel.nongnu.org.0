Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FD370E01
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:38:50 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF7J-00014W-Kq
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmW-00065B-Pp
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmU-0007ii-4c
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id t18so3110877wry.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HO4kVKQpXVHCbWKcXA+wAgV5vQ4RCJonvqTRm6Lg8wM=;
 b=ssBT5LTihEouAFiOZoveFfJ3qnTLdE8cC175rvFZIx1q2/FgUDONIZOxiAeCJs6ZjM
 YUexbvLKG3gCJlqiyzoOrn8OBMv6F/5mNajCdYs9bJxAMPmG3AxdFffKpelOfMVLV7Ce
 0hNXFyAvflP94dZhgFWeaGTeaXVcJdBkdnlYqMgFkHM76sibwBiP04CRxFPul3cUErJy
 rH8hA0HmXbFaeVhR5yz0faR59Usjk+ONpoF3EZOhHhixcOmXA9o3X4Y/54ZvNhHgJ99j
 0ZuS//KMY0uSJmhK6WGC/fyHyXW/CzlpGw6YpkfwYfLw9ItqGUD8iF7Apc+dc3Cs77Iz
 kCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HO4kVKQpXVHCbWKcXA+wAgV5vQ4RCJonvqTRm6Lg8wM=;
 b=X/JJFe/prjdkHiXhMc6HIS7WTZ2GrnEIuq4WGNvlaKtBN8caZzQoIliv119MbzMbBe
 BtODYvyDYr2u1pzf7JGHCVGGc9PrefLXNqacmMgZ4ABMKpEF+1fTbgiI9y+9tJ2WHGcy
 IF8nhhKEqYmwtsAmZJsoLq3He/U3LuuedZtmYOyQ+y4iGwyy4+kD3WFTIahJV50j2wjA
 ipNFsBAMob9fxHVlKsBDAupZVuN0QaHfyBbs0U7w7FY9i4oj78nTs6MVUZNb9rOJ/Vc6
 nrxvGP/xxquZAcaTRXeI+kjshTmXpm2ANnJN4fxQCIDcV+wH8k2X1M5hcrTI5cxpSrMo
 fbUg==
X-Gm-Message-State: AOAM533noT8F2OEQ0pbzBalaWgP2RnGFdyNGSIeGBJsl9kzbiT3ZykNp
 mtM2ghU9FiPA4QaLbPVBlNk3K6NnVaNlU/yB
X-Google-Smtp-Source: ABdhPJyIcUI9jO+QrbAP8GcH4E4U+ZaFXcLi2Gwog3jhi5Ld1Z/1gDnlpIl5AxUbAN5vZ342AbShYA==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr3045326wrf.130.1619972235225; 
 Sun, 02 May 2021 09:17:15 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x4sm2745743wmj.17.2021.05.02.09.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/36] target/mips: Introduce tcg-internal.h for TCG specific
 declarations
Date: Sun,  2 May 2021 18:15:20 +0200
Message-Id: <20210502161538.534038-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-13-f4bug@amsat.org>
---
 target/mips/internal.h         |  7 +++----
 target/mips/tcg/tcg-internal.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 target/mips/tcg/tcg-internal.h

diff --git a/target/mips/internal.h b/target/mips/internal.h
index e93e057bece..754135c1421 100644
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
@@ -77,7 +80,6 @@ extern const char fregnames[32][4];
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


