Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB236385C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:58:02 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGMb-0002MS-ES
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGi-000366-6M
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGg-0000hf-L2
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so19283211wrx.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKAXT5WXCLfQhQzehi2fhE4zxpaOOl0wCkh4/8PNfro=;
 b=faqXsieM1n8o+pfoKdPBxi5uu4eaXqnzTirrSPJUjh2mvy3OTe03iI3CIdEqfLzp7t
 4lm6Xg0oMACaRYkkq2A6BleknTtcR3RS3ZYad+QS0EEcFtcmRFnv6G0Qbbp2aEaGSBSX
 /YZ32rZOS7mX3N/p5G2B8ViVaC8Uvmb86iUyu2ZijZAm/HOQXvKlGd5DqWOQY4S3k629
 a6ysN472Nf7awGTyrbtBaBNgoxB6xrc/VYhnpcSirQy2SB96gg5A83dNux23WngDzyPE
 hABIZFYDIztNzD4cLgvXpEgq7bJaLeswWIqKXRGTJq8RvmOW+r4/YAfqeI8KgAnuK9rC
 eRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aKAXT5WXCLfQhQzehi2fhE4zxpaOOl0wCkh4/8PNfro=;
 b=pA6iZ4Cu3EZhmmDmxOjVx76veBTdMJWs+1R6RxY6OBV5C20Pz4LiFsLpQ1AKlTtujn
 Jd+vT6ooHXoegS0swjsoV7XPDmPfmabKq1TD5jHHQki+inGq35uZcAuJ/idS9fSGpJxi
 doFAbw8C0ujfgIOKYW0PFoMcVx8xKNZVhOc23vGvbVZhHOrNPXUpLBhK6khgIMEykaLR
 RVZkqxM22f+Cibrg6zQGuBd49yhMD8W+9wkk9m2bQ4JQLyyeAI2xf/g1OfLVBCDSHKkK
 U456we5O6qzUNeonyYobvQa/R0jrWbQygE5VDXlcS8IGtb33AA17RniDAMy4tfy0csnw
 ltfQ==
X-Gm-Message-State: AOAM532oAXrVWpx5CAMfV5t+/5KBRp0RhMVJEmH2GntiaRriUBcRyeB8
 DF6iPqy73cm92YNfcdmq399yeu7X0o6Q5Q==
X-Google-Smtp-Source: ABdhPJwm5n7ej8XFdeMYgFsyPmKvAT2zTXB8W5vkqsmIRAwRrop/FXJ/5kcNZVFAq6zAljc/DtsUeA==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr11179666wrx.335.1618786313226; 
 Sun, 18 Apr 2021 15:51:53 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm6914472wri.41.2021.04.18.15.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/29] target/mips: Introduce tcg-internal.h for TCG
 specific declarations
Date: Mon, 19 Apr 2021 00:50:40 +0200
Message-Id: <20210418225058.1257014-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h         |  7 +++----
 target/mips/tcg/tcg-internal.h | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 target/mips/tcg/tcg-internal.h

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 81671d567d0..284ef8d1e1a 100644
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


