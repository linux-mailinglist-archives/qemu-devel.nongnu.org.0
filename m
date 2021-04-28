Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA036DE53
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:31:51 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbo2Q-0005TV-95
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbne1-0001Xl-Ct
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndz-0006iu-5W
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so9226921wmi.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EDhX+WED1Dz1wQl7trAiDfJ6HPpg1cFqmFghcHNe/d0=;
 b=qTQHNOv/20YbT6LuMnFUP8lTQ3TJOX1Fcf6VsKuSDnb4wpwtDKb7/ANzPq+wlV4ZXt
 Rm0LL6vCdR/R6BuMSStm3O4VuvOR6CfGFb6dbKMmjaprV5/d/+v2UEkoIQN7rjOCANx7
 fR/RPh+2yvRSTa7c0QrgNoebqnUEzfVS7ml8BlMU05UXN87+YeAyfY9UdI8n5CAzZU9u
 +TstGNjN4Za5ko13FM0Bwa41aSpFI66tqtoSwEv92zUDvaGKZn9aKbn8tl8YOqNhXMUr
 w+fWRje2eau67N7vQSV34FvmrjCuBid+HL3z6tjJpA3mV6tMagv8WT4waFLzbAorVZl3
 x00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EDhX+WED1Dz1wQl7trAiDfJ6HPpg1cFqmFghcHNe/d0=;
 b=ncdB7qQR1zKTQ3Cce4uxKD9PQeVjHKLUScTHHazjNrSfFJ8qL1gdkBJwXotH+tRbwJ
 640/8Wmxh3GxPdzGf8go1SOC2p8Z4htb2YSkPY33Y7+bv3PT2oGX6Y248VlROrMEBLi1
 g6LLAT20H4EQMQSi0vYT261OTZE5pQyl2R/HnolE8/VNismIAlZPpMZoInVh1Qp56MQe
 TUjuVsFmcf/rXsIgu7Re02nxFai+/5w7QvmNZgMhyDmD///aUhunCwKW8cR14w7SN+11
 cgytjGWyl+MMNuGlqtyTm2YNPgl3BK2vEObplsDjOx/V3MH2OUSKjhMmO/Q+j3jIITHb
 ZQVw==
X-Gm-Message-State: AOAM533E7+n/6tjGZ7LlgJmSt1ftEdMuTN+oqAqtHSSFkUjU0f1frauN
 pv3MZGBuDVf0MkO9eOwaXaSSS39mgBbdLA==
X-Google-Smtp-Source: ABdhPJypzdvlQfmHSIDz8P8/ESnVw3xlV/hZIn2TfeRNDPI7A7m/8ehXdg5WrpZ+AJRW7b6Zju7wjQ==
X-Received: by 2002:a1c:2:: with SMTP id 2mr32645705wma.113.1619629593289;
 Wed, 28 Apr 2021 10:06:33 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm464096wrz.55.2021.04.28.10.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/30] target/mips: Move Special opcodes to
 tcg/sysemu/special_helper.c
Date: Wed, 28 Apr 2021 19:04:03 +0200
Message-Id: <20210428170410.479308-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Move the Special opcodes helpers to tcg/sysemu/special_helper.c.

Since mips_io_recompile_replay_branch() is set as
CPUClass::io_recompile_replay_branch handler in cpu.c,
we need to declare its prototype in "tcg-internal.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                    |   5 -
 target/mips/tcg/tcg-internal.h          |   3 +
 target/mips/tcg/sysemu_helper.h.inc     |   7 ++
 target/mips/cpu.c                       |  17 ---
 target/mips/op_helper.c                 | 100 -----------------
 target/mips/tcg/sysemu/special_helper.c | 140 ++++++++++++++++++++++++
 target/mips/tcg/sysemu/meson.build      |   1 +
 7 files changed, 151 insertions(+), 122 deletions(-)
 create mode 100644 target/mips/tcg/sysemu/special_helper.c

diff --git a/target/mips/helper.h b/target/mips/helper.h
index bc308e5db13..4ee7916d8b2 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -210,11 +210,6 @@ DEF_HELPER_1(tlbp, void, env)
 DEF_HELPER_1(tlbr, void, env)
 DEF_HELPER_1(tlbinv, void, env)
 DEF_HELPER_1(tlbinvf, void, env)
-DEF_HELPER_1(di, tl, env)
-DEF_HELPER_1(ei, tl, env)
-DEF_HELPER_1(eret, void, env)
-DEF_HELPER_1(eretnc, void, env)
-DEF_HELPER_1(deret, void, env)
 DEF_HELPER_3(ginvt, void, env, tl, i32)
 #endif /* !CONFIG_USER_ONLY */
 DEF_HELPER_1(rdhwr_cpunum, tl, env)
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index a39ff45d58f..73667b35778 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -10,6 +10,7 @@
 #ifndef MIPS_TCG_INTERNAL_H
 #define MIPS_TCG_INTERNAL_H
 
+#include "tcg/tcg.h"
 #include "hw/core/cpu.h"
 #include "cpu.h"
 
@@ -27,6 +28,8 @@ void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
+bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb);
+
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type, uintptr_t retaddr);
 void cpu_mips_tlb_flush(CPUMIPSState *env);
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index d136c4160a7..38e55cbf118 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -166,3 +166,10 @@ DEF_HELPER_1(evpe, tl, env)
 /* R6 Multi-threading */
 DEF_HELPER_1(dvp, tl, env)
 DEF_HELPER_1(evp, tl, env)
+
+/* Special */
+DEF_HELPER_1(di, tl, env)
+DEF_HELPER_1(ei, tl, env)
+DEF_HELPER_1(eret, void, env)
+DEF_HELPER_1(eretnc, void, env)
+DEF_HELPER_1(deret, void, env)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c3159e3d7f3..a33e3b6c202 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -342,23 +342,6 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
-
-# ifndef CONFIG_USER_ONLY
-static bool mips_io_recompile_replay_branch(CPUState *cs,
-                                            const TranslationBlock *tb)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-
-    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
-        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
-        env->hflags &= ~MIPS_HFLAG_BMASK;
-        return true;
-    }
-    return false;
-}
-# endif /* !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
 static bool mips_cpu_has_work(CPUState *cs)
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 7a7369bc8a6..a077535194b 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -655,106 +655,6 @@ void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
     }
 }
 
-/* Specials */
-target_ulong helper_di(CPUMIPSState *env)
-{
-    target_ulong t0 = env->CP0_Status;
-
-    env->CP0_Status = t0 & ~(1 << CP0St_IE);
-    return t0;
-}
-
-target_ulong helper_ei(CPUMIPSState *env)
-{
-    target_ulong t0 = env->CP0_Status;
-
-    env->CP0_Status = t0 | (1 << CP0St_IE);
-    return t0;
-}
-
-static void debug_pre_eret(CPUMIPSState *env)
-{
-    if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
-        qemu_log("ERET: PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx,
-                env->active_tc.PC, env->CP0_EPC);
-        if (env->CP0_Status & (1 << CP0St_ERL)) {
-            qemu_log(" ErrorEPC " TARGET_FMT_lx, env->CP0_ErrorEPC);
-        }
-        if (env->hflags & MIPS_HFLAG_DM) {
-            qemu_log(" DEPC " TARGET_FMT_lx, env->CP0_DEPC);
-        }
-        qemu_log("\n");
-    }
-}
-
-static void debug_post_eret(CPUMIPSState *env)
-{
-    if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
-        qemu_log("  =>  PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx,
-                env->active_tc.PC, env->CP0_EPC);
-        if (env->CP0_Status & (1 << CP0St_ERL)) {
-            qemu_log(" ErrorEPC " TARGET_FMT_lx, env->CP0_ErrorEPC);
-        }
-        if (env->hflags & MIPS_HFLAG_DM) {
-            qemu_log(" DEPC " TARGET_FMT_lx, env->CP0_DEPC);
-        }
-        switch (cpu_mmu_index(env, false)) {
-        case 3:
-            qemu_log(", ERL\n");
-            break;
-        case MIPS_HFLAG_UM:
-            qemu_log(", UM\n");
-            break;
-        case MIPS_HFLAG_SM:
-            qemu_log(", SM\n");
-            break;
-        case MIPS_HFLAG_KM:
-            qemu_log("\n");
-            break;
-        default:
-            cpu_abort(env_cpu(env), "Invalid MMU mode!\n");
-            break;
-        }
-    }
-}
-
-static inline void exception_return(CPUMIPSState *env)
-{
-    debug_pre_eret(env);
-    if (env->CP0_Status & (1 << CP0St_ERL)) {
-        mips_env_set_pc(env, env->CP0_ErrorEPC);
-        env->CP0_Status &= ~(1 << CP0St_ERL);
-    } else {
-        mips_env_set_pc(env, env->CP0_EPC);
-        env->CP0_Status &= ~(1 << CP0St_EXL);
-    }
-    compute_hflags(env);
-    debug_post_eret(env);
-}
-
-void helper_eret(CPUMIPSState *env)
-{
-    exception_return(env);
-    env->CP0_LLAddr = 1;
-    env->lladdr = 1;
-}
-
-void helper_eretnc(CPUMIPSState *env)
-{
-    exception_return(env);
-}
-
-void helper_deret(CPUMIPSState *env)
-{
-    debug_pre_eret(env);
-
-    env->hflags &= ~MIPS_HFLAG_DM;
-    compute_hflags(env);
-
-    mips_env_set_pc(env, env->CP0_DEPC);
-
-    debug_post_eret(env);
-}
 #endif /* !CONFIG_USER_ONLY */
 
 static inline void check_hwrena(CPUMIPSState *env, int reg, uintptr_t pc)
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
new file mode 100644
index 00000000000..971883fa385
--- /dev/null
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -0,0 +1,140 @@
+/*
+ *  QEMU MIPS emulation: Special opcode helpers
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
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "internal.h"
+
+/* Specials */
+target_ulong helper_di(CPUMIPSState *env)
+{
+    target_ulong t0 = env->CP0_Status;
+
+    env->CP0_Status = t0 & ~(1 << CP0St_IE);
+    return t0;
+}
+
+target_ulong helper_ei(CPUMIPSState *env)
+{
+    target_ulong t0 = env->CP0_Status;
+
+    env->CP0_Status = t0 | (1 << CP0St_IE);
+    return t0;
+}
+
+static void debug_pre_eret(CPUMIPSState *env)
+{
+    if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
+        qemu_log("ERET: PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx,
+                env->active_tc.PC, env->CP0_EPC);
+        if (env->CP0_Status & (1 << CP0St_ERL)) {
+            qemu_log(" ErrorEPC " TARGET_FMT_lx, env->CP0_ErrorEPC);
+        }
+        if (env->hflags & MIPS_HFLAG_DM) {
+            qemu_log(" DEPC " TARGET_FMT_lx, env->CP0_DEPC);
+        }
+        qemu_log("\n");
+    }
+}
+
+static void debug_post_eret(CPUMIPSState *env)
+{
+    if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
+        qemu_log("  =>  PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx,
+                env->active_tc.PC, env->CP0_EPC);
+        if (env->CP0_Status & (1 << CP0St_ERL)) {
+            qemu_log(" ErrorEPC " TARGET_FMT_lx, env->CP0_ErrorEPC);
+        }
+        if (env->hflags & MIPS_HFLAG_DM) {
+            qemu_log(" DEPC " TARGET_FMT_lx, env->CP0_DEPC);
+        }
+        switch (cpu_mmu_index(env, false)) {
+        case 3:
+            qemu_log(", ERL\n");
+            break;
+        case MIPS_HFLAG_UM:
+            qemu_log(", UM\n");
+            break;
+        case MIPS_HFLAG_SM:
+            qemu_log(", SM\n");
+            break;
+        case MIPS_HFLAG_KM:
+            qemu_log("\n");
+            break;
+        default:
+            cpu_abort(env_cpu(env), "Invalid MMU mode!\n");
+            break;
+        }
+    }
+}
+
+bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
+        && env->active_tc.PC != tb->pc) {
+        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
+        env->hflags &= ~MIPS_HFLAG_BMASK;
+        return true;
+    }
+    return false;
+}
+
+static inline void exception_return(CPUMIPSState *env)
+{
+    debug_pre_eret(env);
+    if (env->CP0_Status & (1 << CP0St_ERL)) {
+        mips_env_set_pc(env, env->CP0_ErrorEPC);
+        env->CP0_Status &= ~(1 << CP0St_ERL);
+    } else {
+        mips_env_set_pc(env, env->CP0_EPC);
+        env->CP0_Status &= ~(1 << CP0St_EXL);
+    }
+    compute_hflags(env);
+    debug_post_eret(env);
+}
+
+void helper_eret(CPUMIPSState *env)
+{
+    exception_return(env);
+    env->CP0_LLAddr = 1;
+    env->lladdr = 1;
+}
+
+void helper_eretnc(CPUMIPSState *env)
+{
+    exception_return(env);
+}
+
+void helper_deret(CPUMIPSState *env)
+{
+    debug_pre_eret(env);
+
+    env->hflags &= ~MIPS_HFLAG_DM;
+    compute_hflags(env);
+
+    mips_env_set_pc(env, env->CP0_DEPC);
+
+    debug_post_eret(env);
+}
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
index 73ab9571ba6..4da2c577b20 100644
--- a/target/mips/tcg/sysemu/meson.build
+++ b/target/mips/tcg/sysemu/meson.build
@@ -1,5 +1,6 @@
 mips_softmmu_ss.add(files(
   'cp0_helper.c',
   'mips-semi.c',
+  'special_helper.c',
   'tlb_helper.c',
 ))
-- 
2.26.3


