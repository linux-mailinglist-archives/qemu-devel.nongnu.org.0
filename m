Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA479364A82
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:24:05 +0200 (CEST)
Received: from localhost ([::1]:36994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZV6-0003aS-Kl
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPw-0006I3-HD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZPt-00012D-Ba
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:18:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id e7so26206649wrs.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMxvZRcRgCBUS8Ws91rPcuJR47xd/yHVMPRhORw6260=;
 b=nQE502sHi5eGXJbb1fVxBwVrznc3AS7pXvc8Qa/ZpuNM+OG0Yfy8boGqOR1OfgOQhM
 0ydB6OKTfl4YDhx9QM+yHiZZQuNC/eV+IjW9OW232W8EZLgUOPiq0zaHtZrHgDGVylXl
 bGpx1k+lhD2cmpHzljRV3YGWjxD8fypndsbfs6PDUgXqtedb1kHY23VCr0hN5jo4jBke
 FaaQt2tEVyPhL4rVWJklWVBdHiHCp1FnkE1CN3HeJQhGNTtHseBDf2YaiKBQ4dNKsUQc
 fTcBG8Ksma45W0RitXPZdSPgAphx2VTonrYLJoJcEmKGlVTyh0cj+zi+SW2IfFCEO1zZ
 fPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yMxvZRcRgCBUS8Ws91rPcuJR47xd/yHVMPRhORw6260=;
 b=hOcKCjHZJZOd1IezUHGvpVRcCjNv7I41ccSak45f/reJemh516LcV0+B2hLFnh+Zab
 UtX6nUUajW1dAV7k9KhxCKXoccsjMFth0LWZkdzlpiRf8Gi084+UX4FuSRqS7Ghpgnwj
 2s4HgrEj3CqtKgfg1RnjhztgEd1PV9DduTrq7J9KNLHOenxosZmvwIHb/4GTnZ4WDsr1
 OnYX8nYtEmdy4EmH5GfIhNubjBchN6O+LRKmnO4CGGVJQbbKolC1euRvMWiz5DXT8OhP
 baG/ufaIeNlMMulz8BRGdxPxig51nqL6fYf/yNx1e0lRN51UZLeSG4M260ZLr66ev7jl
 kw0w==
X-Gm-Message-State: AOAM530MARQToyO1xwYiQKOeAzqkgYXHY6kDYqp87840tN/lnROJ+Ffg
 HjkFcVap72wzALDj+BGx5Nib1KR588iHaA==
X-Google-Smtp-Source: ABdhPJxwGLP6MlXN6ThkTGEFofWzQJz6yBu73ZjjgmqIhu+NOoRHZ8TOzzEw0x7Hnsxg8MZKRI9LmQ==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr16408730wrt.291.1618859919698; 
 Mon, 19 Apr 2021 12:18:39 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g5sm23970738wrq.30.2021.04.19.12.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/30] target/mips: Move msa_reset() to new source file
Date: Mon, 19 Apr 2021 21:17:56 +0200
Message-Id: <20210419191823.1555482-4-f4bug@amsat.org>
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

mips_cpu_reset() is used by all accelerators, and calls
msa_reset(), which is defined in msa_helper.c.

Beside msa_reset(), the rest of msa_helper.c is only useful
to the TCG accelerator. To be able to restrict this helper
file to TCG, we need to move msa_reset() out of it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


