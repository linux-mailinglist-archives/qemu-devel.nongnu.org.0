Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476FF36DDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:07:55 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnfG-0000qO-Bz
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncE-0007c1-Re
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncD-0005mH-0A
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h4so54789686wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMxvZRcRgCBUS8Ws91rPcuJR47xd/yHVMPRhORw6260=;
 b=cfF7Jlr8AovFAUH5K7HDOrFtT2t6AbY2X6XAi5f7uDcSYx1Tu+m+JXHbO3TRyiFOzD
 LSDfP0pS6vgqGblDPJ6jLGIiE//pHJzyFL/w9JON0l6YX/yKcZmKZTcdBctgz5+64jn7
 XPsgGg48Z8GAdEaH4eieB2SN9e6KlYYwHYe74HdXIhj+ZdNwkH5nBk6JUVeNldw5iO8n
 ozuDg3rY7r8Jbg62ZX0Fa53LJRtF4sex37uelfetbRgIlXkhbBUCxArFT2o+QJWFPB1+
 iHOrBcVaXA5uSjnXN0AZwflL8pIk3nJI4WLLe5YFVKSmAaz+lUZn4AAKnXmc1KKIs8me
 0evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yMxvZRcRgCBUS8Ws91rPcuJR47xd/yHVMPRhORw6260=;
 b=uanlSFvh+Eh5lzba0CPxYcgAwusmOyuU969y0nTfeGGLuPn9/sCDJPZszLHdG9GdfN
 Od9tt6SQ4NNcBEX74iUkJVfNpLM5q7nQfn3rNSX528NVGMf4MdfA3PegQ2Gty2bRWK6A
 KegmUr9sMhvzJwXImZPkJVn2xGICXZ72BtWehs+mYDo3/9WhQYqwDqg3vkuKMLB9Ko73
 5xdU+DUNYJnNOFQJQj7IRT8KLW40U2vJ3cCMP8h1QpdevNgqThJkVMP6GwqHTBY5Ly/z
 AAbJNPyRx0cnItkVY0mO2g0K/MbUpZoYMx+l84R0sTfUFv7iXS3y8L9dv91Tbwv+Iprh
 6AZw==
X-Gm-Message-State: AOAM530wU+Mq5Fij4dimboXH/QvcCvJ0NvbmSoDJ/zaMGN+wPiHv7E9a
 /e8h/P/ZPH5UK9tDllxo95lifZ2c1pawsA==
X-Google-Smtp-Source: ABdhPJxR6I5VPh70jEMTzOFjYk9xqCwpMaal72854dpTdThpbCSNj7zEb6BZjHHPrjZyK+4uT6+fcw==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr4954667wrm.32.1619629483498; 
 Wed, 28 Apr 2021 10:04:43 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v18sm529775wro.18.2021.04.28.10.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/30] target/mips: Move msa_reset() to new source file
Date: Wed, 28 Apr 2021 19:03:43 +0200
Message-Id: <20210428170410.479308-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
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


