Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194EB364A88
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:26:07 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZX4-0005gV-5q
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQd-0007L9-QW
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQb-0001Mx-3O
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id h4so26141013wrt.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fed/u7MVzry73SqP8iio3AZoUczbP2euKtzU1T6r66I=;
 b=SVPNoQy5C2O3nCxebE9YFtNTEr6CdeHOEVl08Qh8oQ1etTJyiwkYZH9rym8YEOcy/q
 Kht/G/jHkWKdLFgKKw3ZNmedE1B3z5b7W7Mfsob1B4biITfw8kAE4UrU+0JAkYFUoyMZ
 YktvRaJjjEHbUbNsZyJqotxZN5fMUag1Neh4UZlTYeCx4qzrlnCJpgSeYOGA0g1CPKW9
 DR5IUL7T6O2ex+gh1Yqa4eMeFfa5BvsWZh4v8/4yt8P4Gn0vFKj0lL4OOeJcWS++0soh
 4zBNxV6FwgZrzeQXpuMES1MgF6Z8leih9FhnZ6FzoBZArF112eevUU0l22327Ae1Iqdy
 Yz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fed/u7MVzry73SqP8iio3AZoUczbP2euKtzU1T6r66I=;
 b=CQM2IlL3SDm7oLEQyhO1RZGhErBrdqHg6aLfAZO4VoVL84z69Cji+hFojdRMqDtLc7
 EVqWX9r2eq1jNRoZpGyxUtbYMvKqYZW+X0F8UeVUXnHZa1AAmpGBddlyWGsQ2nuP95Hz
 5NVarn3l7gWKRcJ2Nkcpqc/biFyFjJbQPsWNHs5q1GWx4ZII1LyFG4U3zkkuIfpD5ZSE
 6dk20a0/0YbyvZg6aYMnefSAyTJgOcFmit8jO7T99ASx7p2P7mUvgoxn4/FhtvbisZZy
 TCsG06mn8z2Ficlf8bHbya3Hrso+GHes2hMk+xrgQuslhKLeAhOgpfCtmHyTd8Pz2ppP
 i/dQ==
X-Gm-Message-State: AOAM533Fko+61PeS3a1Dl27SaY64E8thLNVcBuUfQYduTKNVSdViK3q9
 ro7UOuiKgirHK3Xs3g0NoVS0qTpsFd2fJg==
X-Google-Smtp-Source: ABdhPJzO+SOFeUAxD9HhFqvdVRQTCVfUWgSK1ecmQtsfv6MIyQPjn2ggfOUFTNEJ/1wYKzWPV/IGYw==
X-Received: by 2002:adf:f40f:: with SMTP id g15mr16175927wro.46.1618859963596; 
 Mon, 19 Apr 2021 12:19:23 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e9sm24923561wrs.84.2021.04.19.12.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/30] target/mips: Introduce tcg-internal.h for TCG
 specific declarations
Date: Mon, 19 Apr 2021 21:18:05 +0200
Message-Id: <20210419191823.1555482-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
---
 target/mips/internal.h         |  7 +++----
 target/mips/tcg/tcg-internal.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 target/mips/tcg/tcg-internal.h

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 806d39fa6c3..9e86f6ad6b7 100644
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


