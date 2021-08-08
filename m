Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107C3E3C01
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:36:32 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmit-0004gu-44
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdC-000589-Nm
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:38 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdA-0006VQ-G9
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id h13so18208325wrp.1
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+Z+wzzxvnZ3+Pd2ULhHSg80v3gwgjV2sFikCRT73jM=;
 b=qyWHNHGfVdtl8yZn4bfIiHtmhAEATqNpNsGxZka/LmVS51m1G3OT38k1c8DSUKQ7Li
 hE2diO2839pNJDeM/g4DsMXZ5XLwi8FKfSZsU5VT54OWPrCsWRTP+PKllkr1nMYgCNv/
 6SkGN6/ZDHED/SK+1RCO5BNLUQVkTNnsYwMnsq0xp05ZLSOxJxNG4y4nKtaHw2o/7hdf
 uxvxBghKWrH3R5w3RDozhfWKl1K9J0+Qvk6588BqtTUZzPYfJfWy4uspHgAPXdgWCKki
 JHoihGSL2HAa2vqllYdBoYwfJQ/ns3U6hv451JuoUKgjY6NzsHGbIt0/vI/GEG4orurA
 MpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y+Z+wzzxvnZ3+Pd2ULhHSg80v3gwgjV2sFikCRT73jM=;
 b=GDTQaQ1qbCY9Zf/vNJ5BsJz8lg6VEDtezlQguJbkideqIcLXP3IEEhGFuZ2ojQpaL1
 yYZQ9fqh++cVw7SbBN3ffxfmBigLHR+PwbXLQVeeNYtjw7cb8SikR4gJt1GzErTeaTPj
 R+nsr/O2p3IAWGijNA1bA/OfkAZKzSwggWo05M80JDhpQiqT++YU7I1NTYh2JyJnJmnU
 Iyg9MZf8HqPEp7ddlC1bwWAAOgEp6O//PJqSmpvKAV33EULIWCsFRR+3LHkzorV0p4j1
 cE5vpCfE2FMTp+INl0EXXBx4JB5+DNmD87c4+itD3BRgKKas2IBYHLmASTYAD93cv5/L
 TtHg==
X-Gm-Message-State: AOAM531jm9qIu6NFoGtiZ1oDo1k2RCZgcne5pRvoViClJN+MtxpKIlBP
 5ybSDFQ5O8fq1XpX4oSJd9dThbMzX4k=
X-Google-Smtp-Source: ABdhPJxTlp71X0dwI4nPDLSMebllLiBFZT2GObr233lJ3Gd+U9OJx26ZAbhD8RJd4qmVsn3PxWH5/g==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr13819937wrv.93.1628443834823; 
 Sun, 08 Aug 2021 10:30:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j2sm17090279wrd.14.2021.08.08.10.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 3/7] target/mips: Extract NEC Vr54xx helpers to
 vr54xx_helper.c
Date: Sun,  8 Aug 2021 19:30:14 +0200
Message-Id: <20210808173018.90960-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
References: <20210808173018.90960-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract NEC Vr54xx helpers from op_helper.c to a new file:
'vr54xx_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-14-f4bug@amsat.org>
---
 target/mips/tcg/op_helper.c     | 118 --------------------------
 target/mips/tcg/vr54xx_helper.c | 142 ++++++++++++++++++++++++++++++++
 target/mips/tcg/meson.build     |   1 +
 3 files changed, 143 insertions(+), 118 deletions(-)
 create mode 100644 target/mips/tcg/vr54xx_helper.c

diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index fafbf1faca7..ef3dafcbb3f 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -26,124 +26,6 @@
 #include "exec/memop.h"
 #include "fpu_helper.h"
 
-/* 64 bits arithmetic for 32 bits hosts */
-static inline uint64_t get_HILO(CPUMIPSState *env)
-{
-    return ((uint64_t)(env->active_tc.HI[0]) << 32) |
-           (uint32_t)env->active_tc.LO[0];
-}
-
-static inline target_ulong set_HIT0_LO(CPUMIPSState *env, uint64_t HILO)
-{
-    env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
-    return env->active_tc.HI[0] = (int32_t)(HILO >> 32);
-}
-
-static inline target_ulong set_HI_LOT0(CPUMIPSState *env, uint64_t HILO)
-{
-    target_ulong tmp = env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
-    env->active_tc.HI[0] = (int32_t)(HILO >> 32);
-    return tmp;
-}
-
-/* Multiplication variants of the vr54xx. */
-target_ulong helper_muls(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, 0 - ((int64_t)(int32_t)arg1 *
-                                 (int64_t)(int32_t)arg2));
-}
-
-target_ulong helper_mulsu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, 0 - (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_macc(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_macchi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_maccu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, (uint64_t)get_HILO(env) +
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_macchiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)get_HILO(env) +
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_msac(CPUMIPSState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    return set_HI_LOT0(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_msachi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_msacu(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HI_LOT0(env, (uint64_t)get_HILO(env) -
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_msachiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)get_HILO(env) -
-                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_mulhi(CPUMIPSState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    return set_HIT0_LO(env, (int64_t)(int32_t)arg1 * (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_mulhiu(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
-target_ulong helper_mulshi(CPUMIPSState *env, target_ulong arg1,
-                           target_ulong arg2)
-{
-    return set_HIT0_LO(env, 0 - (int64_t)(int32_t)arg1 *
-                       (int64_t)(int32_t)arg2);
-}
-
-target_ulong helper_mulshiu(CPUMIPSState *env, target_ulong arg1,
-                            target_ulong arg2)
-{
-    return set_HIT0_LO(env, 0 - (uint64_t)(uint32_t)arg1 *
-                       (uint64_t)(uint32_t)arg2);
-}
-
 static inline target_ulong bitswap(target_ulong v)
 {
     v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
diff --git a/target/mips/tcg/vr54xx_helper.c b/target/mips/tcg/vr54xx_helper.c
new file mode 100644
index 00000000000..2255bd11163
--- /dev/null
+++ b/target/mips/tcg/vr54xx_helper.c
@@ -0,0 +1,142 @@
+/*
+ *  MIPS VR5432 emulation helpers
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
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
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+
+/* 64 bits arithmetic for 32 bits hosts */
+static inline uint64_t get_HILO(CPUMIPSState *env)
+{
+    return ((uint64_t)(env->active_tc.HI[0]) << 32) |
+           (uint32_t)env->active_tc.LO[0];
+}
+
+static inline target_ulong set_HIT0_LO(CPUMIPSState *env, uint64_t HILO)
+{
+    env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
+    return env->active_tc.HI[0] = (int32_t)(HILO >> 32);
+}
+
+static inline target_ulong set_HI_LOT0(CPUMIPSState *env, uint64_t HILO)
+{
+    target_ulong tmp = env->active_tc.LO[0] = (int32_t)(HILO & 0xFFFFFFFF);
+    env->active_tc.HI[0] = (int32_t)(HILO >> 32);
+    return tmp;
+}
+
+/* Multiplication variants of the vr54xx. */
+target_ulong helper_muls(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, 0 - ((int64_t)(int32_t)arg1 *
+                                 (int64_t)(int32_t)arg2));
+}
+
+target_ulong helper_mulsu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, 0 - (uint64_t)(uint32_t)arg1 *
+                                (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macc(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_macchi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_maccu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) + (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macchiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) + (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msac(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msachi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                                                     (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msacu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) - (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msachiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) - (uint64_t)(uint32_t)arg1 *
+                                                      (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_mulhi(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)(int32_t)arg1 * (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_mulhiu(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)(uint32_t)arg1 *
+                            (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_mulshi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (int64_t)(int32_t)arg1 *
+                                (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_mulshiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (uint64_t)(uint32_t)arg1 *
+                                (uint64_t)(uint32_t)arg2);
+}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 70fa3dd57df..ff618a159b7 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -18,6 +18,7 @@
   'translate.c',
   'translate_addr_const.c',
   'txx9_translate.c',
+  'vr54xx_helper.c',
 ))
 mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-- 
2.31.1


