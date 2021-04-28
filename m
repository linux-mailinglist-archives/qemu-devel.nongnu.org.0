Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A736DE27
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:22:53 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbntk-0002OS-Aj
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnd0-0008TQ-7i
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncy-0006By-J5
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id m9so51090251wrx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kx/9p01ewXbbtjHOZt3V0DD4dy9s/DfXp7a3bZduRsU=;
 b=Y7eo0tl7flDM1EiecSNBqpVJBJnCtl3l/emqgjSaQshyn0+Qb8hepFk9ssLLH6CCf4
 pIireY3+rB2AEWu1uppAdhNyPVU474/eSDUeCRyfFPTGGrvbrm6wjv4HkbZojaNZ76mU
 dh/bnRrJhlO6xyFs1NArmd01yXycqP5qUb5/gA+del0w9PmpbTgJUjGVHjM59fHp2VDa
 sVFwmEzwHWirvTfoaDR+eIzxY1aPxwjuD2x8UM57OLTB8gvNabrJFuxKyaJvs2lrJvuD
 xaRtKLWkybnJCKc0wnuZsCwOBYwgnNqSidSGsRtHgGoZxjFgh3h/VZM1ZdQH6KS2PxYm
 THLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kx/9p01ewXbbtjHOZt3V0DD4dy9s/DfXp7a3bZduRsU=;
 b=M28nKuy5YlygSg0c1Y30nCp69XPgAgmN5SPRJnihPZ0gJWJV7QK+Fsy9Xw/1NPFIZP
 KbuRmrLtHXcMEvWklcf3oPdNGJQTY6VvU2iUb+ybTWjkWdxNX6DWqdPCD+JBOJzi9nsf
 MNtqrSUTksojWfruZlmcmMP8LxRS2QSy8kpiCx6YBAvYr4sQPcj7fqrntvex4pLj7BFh
 9U0dhOEaG/DWSpLY2DIPRjwyd8ptBu7UwkDKZmBVFcmZJ81wz4ahOoOuc9B94ob4qtzS
 gexJY+U+bIo3EHAsc8A31Hc0OQOv2SOjQrltlWAsxtbsOnb2Vu6jU/XRRHD+3BsDGtD3
 fjNg==
X-Gm-Message-State: AOAM532eyl4gGXT0heW+Z1S8aRCG1p6f6v6X8kzuXozhu7r8sCejskXp
 Wui5439E9KXhL/xsJ/CjWAusYvMUNxOjUQ==
X-Google-Smtp-Source: ABdhPJz+ydjIG7Js8b+/XNgwLNCx4W6h7IohSbmsu1xf11Nazvke4+W5qkPeubXC/xu/6OSngwlDew==
X-Received: by 2002:a5d:52d0:: with SMTP id r16mr18563621wrv.358.1619629530987; 
 Wed, 28 Apr 2021 10:05:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r11sm446083wrx.22.2021.04.28.10.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/30] target/mips: Introduce tcg-internal.h for TCG
 specific declarations
Date: Wed, 28 Apr 2021 19:03:52 +0200
Message-Id: <20210428170410.479308-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


