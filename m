Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBA336DDE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:09:36 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbngt-0004Ej-TC
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncu-0008EM-7K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncq-00066h-Af
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id q9so9682045wrs.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/l+wNVz0p8CKuO/J0+adTcaPg0pyoEzc7P/c9rJpHXk=;
 b=qUw6js57fEQVPv/bZHlHy99YuRL7evFKjcW3NxE7+ZASxBIM7utZF+/P8KNsROXP4A
 p/e/L+5zSYPrE6Fk23QgHQRyx0AcxPgCofGXhiySXPgSz5z/F4YfVN2ZPSSP3KJxcifu
 d1gamI7WD7e7Nne3GN55wUe32JCt9Z1Z3Yk/I+adWKY8qh4Jkt4HpWGO2JjCVxGehjHy
 tuxC9El75dgqUXYPKd2oKxK8ZZEGpb/23Qo62qX0alVsqrvli9dF6GHpGj4XYz4Vuaz7
 kTamNTst7sEzF0KLe3tSvKZ3jTsSSPZA0cEk6QK3fbjkf6m6Mxnp6IVsjBMI9juWe4dr
 3kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/l+wNVz0p8CKuO/J0+adTcaPg0pyoEzc7P/c9rJpHXk=;
 b=VbZtxuvYMHEtcwO/gCc82uATKWVK8vxCHpIZ/w7mmL7kfBjxXrwp6HTIGW+iXAsj1w
 H9neBc+qXU6vyttGEM2FIcO9iD0w/w8vvJdR6jfCH8GQSjUrNy8s4xJ+iLIJR/+426Jo
 AJbtxfZ/AlIHmxBW6JeFgr3whZSFdLC2YhNgiLfIOU9GQTNdL5JDHjOUgpmXVPgdrh40
 L2SgLntgtkBneFE6uvEZzw2SlKm9UJNzWx6014izvvVgrvtq+iWQOZK4wisHxM2V/vzs
 M1ggaRdmxb6g+YU3A1doyCS3PjnrLF0Zb/ucrdVB8Mz7i8MR6XMotvovQwnrA5DKBipV
 /K0w==
X-Gm-Message-State: AOAM530CQg5e1Vp1ICih5JkDtLzGXHWAV6sL3VMvBWJiggEpeLwI2YVy
 8wXcbpYPJvpFykSDfmX+P7puHfYGCj3PAQ==
X-Google-Smtp-Source: ABdhPJwkYVj7lJqJJCH0e+81mCYyeZ9G9V6cqAeLGeg2PcOLnD2uZU9jJ/ilJ4N9KkFEFH6C0iPNUg==
X-Received: by 2002:adf:df90:: with SMTP id z16mr15254779wrl.132.1619629521643; 
 Wed, 28 Apr 2021 10:05:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f22sm282930wmj.42.2021.04.28.10.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/30] target/mips: Extract load/store helpers to
 ldst_helper.c
Date: Wed, 28 Apr 2021 19:03:50 +0200
Message-Id: <20210428170410.479308-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/ldst_helper.c | 288 ++++++++++++++++++++++++++++++++++++++
 target/mips/op_helper.c   | 259 ----------------------------------
 target/mips/meson.build   |   1 +
 3 files changed, 289 insertions(+), 259 deletions(-)
 create mode 100644 target/mips/ldst_helper.c

diff --git a/target/mips/ldst_helper.c b/target/mips/ldst_helper.c
new file mode 100644
index 00000000000..d42812b8a6a
--- /dev/null
+++ b/target/mips/ldst_helper.c
@@ -0,0 +1,288 @@
+/*
+ *  MIPS emulation load/store helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
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
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/memop.h"
+#include "internal.h"
+
+#ifndef CONFIG_USER_ONLY
+
+#define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
+target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
+{                                                                             \
+    if (arg & almask) {                                                       \
+        if (!(env->hflags & MIPS_HFLAG_DM)) {                                 \
+            env->CP0_BadVAddr = arg;                                          \
+        }                                                                     \
+        do_raise_exception(env, EXCP_AdEL, GETPC());                          \
+    }                                                                         \
+    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
+                                                 GETPC());                    \
+    env->lladdr = arg;                                                        \
+    env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
+    return env->llval;                                                        \
+}
+HELPER_LD_ATOMIC(ll, ldl, 0x3, (target_long)(int32_t))
+#ifdef TARGET_MIPS64
+HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
+#endif
+#undef HELPER_LD_ATOMIC
+
+#endif /* !CONFIG_USER_ONLY */
+
+#ifdef TARGET_WORDS_BIGENDIAN
+#define GET_LMASK(v) ((v) & 3)
+#define GET_OFFSET(addr, offset) (addr + (offset))
+#else
+#define GET_LMASK(v) (((v) & 3) ^ 3)
+#define GET_OFFSET(addr, offset) (addr - (offset))
+#endif
+
+void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
+
+    if (GET_LMASK(arg2) <= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) <= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) == 0) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
+                          mem_idx, GETPC());
+    }
+}
+
+void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
+
+    if (GET_LMASK(arg2) >= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) >= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK(arg2) == 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+}
+
+#if defined(TARGET_MIPS64)
+/*
+ * "half" load and stores.  We must do the memory access inline,
+ * or fault handling won't work.
+ */
+#ifdef TARGET_WORDS_BIGENDIAN
+#define GET_LMASK64(v) ((v) & 7)
+#else
+#define GET_LMASK64(v) (((v) & 7) ^ 7)
+#endif
+
+void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
+
+    if (GET_LMASK64(arg2) <= 6) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 5) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 4) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) <= 0) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
+                          mem_idx, GETPC());
+    }
+}
+
+void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
+                int mem_idx)
+{
+    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
+
+    if (GET_LMASK64(arg2) >= 1) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 2) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 3) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 4) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 5) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) >= 6) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
+                          mem_idx, GETPC());
+    }
+
+    if (GET_LMASK64(arg2) == 7) {
+        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
+                          mem_idx, GETPC());
+    }
+}
+#endif /* TARGET_MIPS64 */
+
+static const int multiple_regs[] = { 16, 17, 18, 19, 20, 21, 22, 23, 30 };
+
+void helper_lwm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            env->active_tc.gpr[multiple_regs[i]] =
+                (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
+            addr += 4;
+        }
+    }
+
+    if (do_r31) {
+        env->active_tc.gpr[31] =
+            (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
+    }
+}
+
+void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+                              mem_idx, GETPC());
+            addr += 4;
+        }
+    }
+
+    if (do_r31) {
+        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+    }
+}
+
+#if defined(TARGET_MIPS64)
+void helper_ldm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            env->active_tc.gpr[multiple_regs[i]] =
+                cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
+            addr += 8;
+        }
+    }
+
+    if (do_r31) {
+        env->active_tc.gpr[31] =
+            cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
+    }
+}
+
+void helper_sdm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
+                uint32_t mem_idx)
+{
+    target_ulong base_reglist = reglist & 0xf;
+    target_ulong do_r31 = reglist & 0x10;
+
+    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
+        target_ulong i;
+
+        for (i = 0; i < base_reglist; i++) {
+            cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
+                              mem_idx, GETPC());
+            addr += 8;
+        }
+    }
+
+    if (do_r31) {
+        cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
+    }
+}
+
+#endif /* TARGET_MIPS64 */
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 61e68cc8bed..7a7369bc8a6 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -285,265 +285,6 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
     return (int64_t)(int32_t)(uint32_t)tmp5;
 }
 
-#ifndef CONFIG_USER_ONLY
-
-#define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
-target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
-{                                                                             \
-    if (arg & almask) {                                                       \
-        if (!(env->hflags & MIPS_HFLAG_DM)) {                                 \
-            env->CP0_BadVAddr = arg;                                          \
-        }                                                                     \
-        do_raise_exception(env, EXCP_AdEL, GETPC());                          \
-    }                                                                         \
-    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
-                                                 GETPC());                    \
-    env->lladdr = arg;                                                        \
-    env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
-    return env->llval;                                                        \
-}
-HELPER_LD_ATOMIC(ll, ldl, 0x3, (target_long)(int32_t))
-#ifdef TARGET_MIPS64
-HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
-#endif
-#undef HELPER_LD_ATOMIC
-#endif
-
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK(v) ((v) & 3)
-#define GET_OFFSET(addr, offset) (addr + (offset))
-#else
-#define GET_LMASK(v) (((v) & 3) ^ 3)
-#define GET_OFFSET(addr, offset) (addr - (offset))
-#endif
-
-void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
-
-    if (GET_LMASK(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) == 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
-                          mem_idx, GETPC());
-    }
-}
-
-void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
-
-    if (GET_LMASK(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK(arg2) == 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-}
-
-#if defined(TARGET_MIPS64)
-/*
- * "half" load and stores.  We must do the memory access inline,
- * or fault handling won't work.
- */
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK64(v) ((v) & 7)
-#else
-#define GET_LMASK64(v) (((v) & 7) ^ 7)
-#endif
-
-void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
-
-    if (GET_LMASK64(arg2) <= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) <= 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
-                          mem_idx, GETPC());
-    }
-}
-
-void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
-                int mem_idx)
-{
-    cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
-
-    if (GET_LMASK64(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) >= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
-                          mem_idx, GETPC());
-    }
-
-    if (GET_LMASK64(arg2) == 7) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
-                          mem_idx, GETPC());
-    }
-}
-#endif /* TARGET_MIPS64 */
-
-static const int multiple_regs[] = { 16, 17, 18, 19, 20, 21, 22, 23, 30 };
-
-void helper_lwm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            env->active_tc.gpr[multiple_regs[i]] =
-                (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
-            addr += 4;
-        }
-    }
-
-    if (do_r31) {
-        env->active_tc.gpr[31] =
-            (target_long)cpu_ldl_mmuidx_ra(env, addr, mem_idx, GETPC());
-    }
-}
-
-void helper_swm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
-                              mem_idx, GETPC());
-            addr += 4;
-        }
-    }
-
-    if (do_r31) {
-        cpu_stw_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
-    }
-}
-
-#if defined(TARGET_MIPS64)
-void helper_ldm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            env->active_tc.gpr[multiple_regs[i]] =
-                cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
-            addr += 8;
-        }
-    }
-
-    if (do_r31) {
-        env->active_tc.gpr[31] =
-            cpu_ldq_mmuidx_ra(env, addr, mem_idx, GETPC());
-    }
-}
-
-void helper_sdm(CPUMIPSState *env, target_ulong addr, target_ulong reglist,
-                uint32_t mem_idx)
-{
-    target_ulong base_reglist = reglist & 0xf;
-    target_ulong do_r31 = reglist & 0x10;
-
-    if (base_reglist > 0 && base_reglist <= ARRAY_SIZE(multiple_regs)) {
-        target_ulong i;
-
-        for (i = 0; i < base_reglist; i++) {
-            cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[multiple_regs[i]],
-                              mem_idx, GETPC());
-            addr += 8;
-        }
-    }
-
-    if (do_r31) {
-        cpu_stq_mmuidx_ra(env, addr, env->active_tc.gpr[31], mem_idx, GETPC());
-    }
-}
-#endif
-
-
 void helper_fork(target_ulong arg1, target_ulong arg2)
 {
     /*
diff --git a/target/mips/meson.build b/target/mips/meson.build
index daf5f1d55bc..15c2f835c68 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -18,6 +18,7 @@
 mips_tcg_ss.add(files(
   'dsp_helper.c',
   'fpu_helper.c',
+  'ldst_helper.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'msa_translate.c',
-- 
2.26.3


