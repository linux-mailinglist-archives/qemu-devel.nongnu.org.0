Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B12C1745
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:10:35 +0100 (CET)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ6Y-0008RO-Qc
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiv-0002Le-Et
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:09 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIit-0001hI-I9
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:09 -0500
Received: by mail-wr1-x441.google.com with SMTP id e7so2586865wrv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1Y3DPzyuheO159W9qAyN3VYs+itKBeqGyIlOMc68sk=;
 b=XVOSvpkqvZo/jsr4A6heTMi4YSWyXdNjOekuyLOXPLOXp15JJ2Pzl2GrrEIXM69gv3
 MyAf+s+gI7cqkGWrhanj0q/S1VCKqlJ7baZdDXNvgDBJ+b9pq5S6JPnACqmPg8E5jQxO
 sAIvc5lFYcR1AdcVZHW2Ypdn5XNmMEHwVJ7ii8vHVgrjqkx3asNPLt/g6PWlX54ogq+i
 E829Y4WMw2crWQd+dKDJiz/QsuaZi90DXGR3KK+i4DXczzoqmkatVpeZ204ENU48rm59
 opjwV2c638ZQTPau9+MHpaRyrn68xZaurIq4ax+RnFK9R0lRx9A1l7rc3XV96YU6VobX
 5O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j1Y3DPzyuheO159W9qAyN3VYs+itKBeqGyIlOMc68sk=;
 b=rdVqRawmPp3iwohy8Pf+UWkhhyLmBxH35OmhRcxoBL/+d4WR9LvTm0E2oa2LpJjgS5
 m8DUwlhXcv7SdYaEPEapjbjtwlogXjTwEI0KP5M7xUEdV2TnTg5Vv8WNsUHUnm0G8J1v
 BEPHu7qHp2riLNSyr74KnR89Puk9xRVLvbTNSuA9vfupczIMNXlQZb7dws+bmipz3E48
 GBfBVYeCDl5qFKLqSW8edb8iGyEOlbq4dYjHhkhOyKJnaRaq1TflA8ies8GKBw7+qbz8
 f9i0x0ljJxcPmkOFgLl34fLnB/6R0HQqEWfZt2v/lJw23ArJKVQ4mR+k8rfP2lSJxt2S
 VrFg==
X-Gm-Message-State: AOAM531bPUtnpeEeSlflG2QAcy+cmPRLWIGUuPCwibgblKKgFAWIMsRl
 fgQkqfdwoIcuEiOTeY1I03DRQCjKapY=
X-Google-Smtp-Source: ABdhPJzgNeRX9N3E1CubbtsmUgN/ii3fSWs3n685b33/1m+i6r5CNOAm1t4sAH3vVdE9w6mDW0Cm3w==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr1585024wru.175.1606164365838; 
 Mon, 23 Nov 2020 12:46:05 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id l24sm15339465wrb.28.2020.11.23.12.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/28] target/mips: Extract NEC Vr54xx helpers to
 vendor-vr54xx_helper.c
Date: Mon, 23 Nov 2020 21:44:35 +0100
Message-Id: <20201123204448.3260804-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract NEC Vr54xx helpers from op_helper.c to a new file:
'vendor-vr54xx_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-14-f4bug@amsat.org>
---
 target/mips/op_helper.c            | 118 --------------------------
 target/mips/vendor-vr54xx_helper.c | 131 +++++++++++++++++++++++++++++
 target/mips/meson.build            |   1 +
 3 files changed, 132 insertions(+), 118 deletions(-)
 create mode 100644 target/mips/vendor-vr54xx_helper.c

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index dd09a4c714a..a900c008b5a 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -54,124 +54,6 @@ static void raise_exception(CPUMIPSState *env, uint32_t exception)
     do_raise_exception(env, exception, 0);
 }
 
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
diff --git a/target/mips/vendor-vr54xx_helper.c b/target/mips/vendor-vr54xx_helper.c
new file mode 100644
index 00000000000..d8c8f648b54
--- /dev/null
+++ b/target/mips/vendor-vr54xx_helper.c
@@ -0,0 +1,131 @@
+/*
+ * MIPS NEC Vr54xx instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
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
+                       (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macc(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) + (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
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
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) +
+                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_macchiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) +
+                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msac(CPUMIPSState *env, target_ulong arg1,
+                         target_ulong arg2)
+{
+    return set_HI_LOT0(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msachi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, (int64_t)get_HILO(env) - (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_msacu(CPUMIPSState *env, target_ulong arg1,
+                          target_ulong arg2)
+{
+    return set_HI_LOT0(env, (uint64_t)get_HILO(env) -
+                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_msachiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, (uint64_t)get_HILO(env) -
+                       (uint64_t)(uint32_t)arg1 * (uint64_t)(uint32_t)arg2);
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
+                       (uint64_t)(uint32_t)arg2);
+}
+
+target_ulong helper_mulshi(CPUMIPSState *env, target_ulong arg1,
+                           target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (int64_t)(int32_t)arg1 *
+                       (int64_t)(int32_t)arg2);
+}
+
+target_ulong helper_mulshiu(CPUMIPSState *env, target_ulong arg1,
+                            target_ulong arg2)
+{
+    return set_HIT0_LO(env, 0 - (uint64_t)(uint32_t)arg1 *
+                       (uint64_t)(uint32_t)arg2);
+}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index aa6ac67df76..8cc1d0ca0f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -8,6 +8,7 @@
   'op_helper.c',
   'mod-dsp_helper.c',
   'mod-msa_helper.c',
+  'vendor-vr54xx_helper.c',
 
   'translate.c',
 ))
-- 
2.26.2


