Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0A3636AE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:39:07 +0200 (CEST)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYARu-0007ko-K2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKx-0002al-4g
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAKv-0004Rd-AJ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id x7so31475753wrw.10
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EFDIQe6PQ8GKTE0rEiXMTz5vOIBhY4bny+BnGqRXn94=;
 b=EErOTcIbHVGhX1vYlpG2adImS+FcZvgbJMSqb1s7zfU1nrUgwIUXN04bD+5dmXBZuu
 5hrlWFibdlQb/iJJcl1h9KVNaK5LUV+ut+6kEEsriVhNlN9Fs5q6MT8x1CVArmfrq9/z
 f4cknrZyyfeGu58FEg38iQaUjmtuKt7pzasZrsPMUmLekPmXKz23ssyrU4ebHeRp5REh
 NXnOwdGIJya90VfST+Ns79i+fTkkU3xJsvCpb1VXzV1AQDwlg2OiwLVImcywGhn0OW4o
 rlqf5jUanAvEJfLtxTZ7lKpxbIdScExELfTQ7PRqH2qFF95Anu/JOTihvUejVcxCVdbG
 DOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EFDIQe6PQ8GKTE0rEiXMTz5vOIBhY4bny+BnGqRXn94=;
 b=ry+7NnBWvKRIx8yFczhEKvZyJQcNXdz721FwrEle/ZG/gcC9gu03DjX9Q12jQ2gZEk
 A1bE6AD+uqY5pxfzgZP+cdswf0GjZRqNuoekO/tmRliaV54ABjfqqGGwL517/YsAqnQv
 QMfT+fWggGzCD7J5AoLBI7Pyv/fgjpQY0Kj2nUmtNMyUELDSo31dSQXnqYFZCkKHP5eU
 ow0ir1AFDvTebUcOpTrr/tiNUSNaMH5hLcS9M85JEdFUYupR8LVv9uQXzE6nb417t6dp
 bUM0ljwSBPgtf2f0q0c40tEsXnDSXisLVPmP7TXjMIvw6Q7yDPYowhoeRRUXSEVzuDQ6
 ujbA==
X-Gm-Message-State: AOAM532354Hfu56irIryEPczpfWpKAqpcok/ITpTPNH7Jr9Kq6f44jf/
 WpSqwsz2GPjndoGE1A6irom8RcV7WAshoQ==
X-Google-Smtp-Source: ABdhPJz4kb8nqmTYM1CYONl76WWul/HVrI8Df08gV/8YnyxxSEjMNaTsTRvWSGADCjgeSh3NSUBLgA==
X-Received: by 2002:adf:b344:: with SMTP id k4mr9936350wrd.205.1618763511776; 
 Sun, 18 Apr 2021 09:31:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l5sm18711705wro.4.2021.04.18.09.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:31:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/26] target/mips: Move msa_reset() to new source file
Date: Sun, 18 Apr 2021 18:31:11 +0200
Message-Id: <20210418163134.1133100-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

mips_cpu_reset() is used by all accelerators, and calls
msa_reset(), which is defined in msa_helper.c.

Beside msa_reset(), the rest of msa_helper.c is only useful
to the TCG accelerator. To be able to restrict this helper
file to TCG, we need to move msa_reset() out of it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/msa.c        | 60 ++++++++++++++++++++++++++++++++++++++++
 target/mips/msa_helper.c | 36 ------------------------
 target/mips/meson.build  |  1 +
 3 files changed, 61 insertions(+), 36 deletions(-)
 create mode 100644 target/mips/msa.c

diff --git a/target/mips/msa.c b/target/mips/msa.c
new file mode 100644
index 00000000000..61f1a9a5936
--- /dev/null
+++ b/target/mips/msa.c
@@ -0,0 +1,60 @@
+/*
+ * MIPS SIMD Architecture Module Instruction emulation helpers for QEMU.
+ *
+ * Copyright (c) 2014 Imagination Technologies
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "fpu/softfloat.h"
+#include "fpu_helper.h"
+
+void msa_reset(CPUMIPSState *env)
+{
+    if (!ase_msa_available(env)) {
+        return;
+    }
+
+#ifdef CONFIG_USER_ONLY
+    /* MSA access enabled */
+    env->CP0_Config5 |= 1 << CP0C5_MSAEn;
+    env->CP0_Status |= (1 << CP0St_CU1) | (1 << CP0St_FR);
+#endif
+
+    /*
+     * MSA CSR:
+     * - non-signaling floating point exception mode off (NX bit is 0)
+     * - Cause, Enables, and Flags are all 0
+     * - round to nearest / ties to even (RM bits are 0)
+     */
+    env->active_tc.msacsr = 0;
+
+    restore_msa_fp_status(env);
+
+    /* tininess detected after rounding.*/
+    set_float_detect_tininess(float_tininess_after_rounding,
+                              &env->active_tc.msa_fp_status);
+
+    /* clear float_status exception flags */
+    set_float_exception_flags(0, &env->active_tc.msa_fp_status);
+
+    /* clear float_status nan mode */
+    set_default_nan_mode(0, &env->active_tc.msa_fp_status);
+
+    /* set proper signanling bit meaning ("1" means "quiet") */
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
+}
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 4caefe29ad7..04af54f66d1 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -8595,39 +8595,3 @@ void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
     cpu_stq_data(env, addr + (1 << DF_DOUBLE), pwd->d[1]);
 #endif
 }
-
-void msa_reset(CPUMIPSState *env)
-{
-    if (!ase_msa_available(env)) {
-        return;
-    }
-
-#ifdef CONFIG_USER_ONLY
-    /* MSA access enabled */
-    env->CP0_Config5 |= 1 << CP0C5_MSAEn;
-    env->CP0_Status |= (1 << CP0St_CU1) | (1 << CP0St_FR);
-#endif
-
-    /*
-     * MSA CSR:
-     * - non-signaling floating point exception mode off (NX bit is 0)
-     * - Cause, Enables, and Flags are all 0
-     * - round to nearest / ties to even (RM bits are 0)
-     */
-    env->active_tc.msacsr = 0;
-
-    restore_msa_fp_status(env);
-
-    /* tininess detected after rounding.*/
-    set_float_detect_tininess(float_tininess_after_rounding,
-                              &env->active_tc.msa_fp_status);
-
-    /* clear float_status exception flags */
-    set_float_exception_flags(0, &env->active_tc.msa_fp_status);
-
-    /* clear float_status nan mode */
-    set_default_nan_mode(0, &env->active_tc.msa_fp_status);
-
-    /* set proper signanling bit meaning ("1" means "quiet") */
-    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
-}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 5fcb211ca9a..daf5f1d55bc 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -11,6 +11,7 @@
   'cpu.c',
   'fpu.c',
   'gdbstub.c',
+  'msa.c',
 ))
 mips_tcg_ss = ss.source_set()
 mips_tcg_ss.add(gen)
-- 
2.26.3


