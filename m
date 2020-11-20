Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3AE2BB831
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:19:05 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDo8-0003G8-EC
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfM-000485-1d
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:00 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfJ-00044g-Rn
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:59 -0500
Received: by mail-wr1-x443.google.com with SMTP id c17so11653774wrc.11
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rX+PiacrD0NOUjJecJPa9l0sr2knH8aocVaAZdGhX04=;
 b=Yta7lBFI8muJcLZJ4Vvy3ZoWCW0icroAmkko3jZcQ25pIi0FNBmcOkH5WRaIdi6jL+
 QQiQK57E1UV2lIBgCMR6Dn+ECZCNHcA4qYjMHMR3PsC7UKl/E7+wesYWErV0wuKuZWoi
 XN8CXjn8hlK/NiKVNwabRDwGWfYZFG5tFRFMmfCf2cY0p/ICHmi+6yR0pz0kWo4w0zG3
 qneeL12/EcOAdltSRNdJagCAF18WzD8kNw5fQW50SuBDryaMY2LXgP1zEVvC7bcS5hg2
 jitKM3bENKX2xOw8eIwhcpsL6hlVixYIPdf43mUjM7ttJFFXqjLOMqzfZZO5LJyfPEmB
 dGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rX+PiacrD0NOUjJecJPa9l0sr2knH8aocVaAZdGhX04=;
 b=KG2sl9RRXHGvBcfJn+oL+BBshvum06f9Vm7X3L2QMB8lExJJgAqBZce8rpegvMnDlQ
 OQ1w5EUYbq+3wgoIraTvWeMReJj4b8hxAxmp7li2OaVBaUeI9ExeecJjzN8TJyez0Vc0
 s4TcZ/bfFdCmRM8lBqSmSCVcaz9G0LpBQYGAJhaDTSZqnv6HwoAeOiefIIoTh3owy0us
 AJ8LYX+NFt664dk9JE7hbFlbKhjbqx/bAC83Sd7BENwirkX58taNxj4iE83u2OcDR56H
 q0XQDixoWmhAS6ivAZYL2iD58OOS0fGaDrSV6FZCqeS6h18iRlfvkxSXon0YB6j2+sbH
 rUvg==
X-Gm-Message-State: AOAM531FgZXGYlvNFyc8b4FO1H3gGZNInR81QAPYSVXpj+bY8Ie8b7Gl
 JcwagJT1cssWPtcEE2fyAZSzfcOf+RA=
X-Google-Smtp-Source: ABdhPJx/GvEhKU9fgySWor6l4wOLe5pFQBIFdl6c9COb3cllkBlk5mi8Gc56x4xGLSqNTnq714Bviw==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr16595763wrr.222.1605906596154; 
 Fri, 20 Nov 2020 13:09:56 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a15sm6342117wrn.75.2020.11.20.13.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/26] target/mips: Extract NEC Vr54xx helpers to
 vendor-vr54xx_helper.c
Date: Fri, 20 Nov 2020 22:08:31 +0100
Message-Id: <20201120210844.2625602-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract NEC Vr54xx helpers from op_helper.c to a new file:
'vendor-vr54xx_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index cc4677d94dc..b63ef41cb1d 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -8,6 +8,7 @@
   'op_helper.c',
   'mod-mips-dsp_helper.c',
   'mod-mips-msa_helper.c',
+  'vendor-vr54xx_helper.c',
 
   'translate.c',
 ))
-- 
2.26.2


