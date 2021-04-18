Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF803636DE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:54:30 +0200 (CEST)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAgn-0006Ok-HB
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAM6-0003pQ-Pc
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAM4-0004mz-Li
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c15so22554511wro.13
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfl1vVOmadju4NuvWQMEj+geI79LRCcfwum/+LUF72o=;
 b=RZfFsoia9oOB9C0b3endkKhP5gfBLZME5V0IqBfKZRnAiOz2W/yvMH1Y2YnlON0VsL
 Nh2PqnSUZmeA9QM3NBwALuC78AUFRruOzqZ76mT4xyGHmjSSPE+217c6DY+DrJprRlLi
 kkredeiap5LFfGlVNj7MBoWiR0vFaZf63pFCoJ9ORusroD6eEWudd1ZYwk5lzzBMIOnO
 1+0iU7rOGA8mMj4Edo+NdUpR4ymgpv0SDodt9RA/PkpfxPoxd7JhgmYHQMuJutwXcHjh
 L86ANUsZsM/Xx3xnSnzVavCh4RuhySJUJw43Fxvh1yTFXQeOw6TFqHaRrasOjWLVsP1q
 x3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lfl1vVOmadju4NuvWQMEj+geI79LRCcfwum/+LUF72o=;
 b=KAqkaslzWj7rnxDoNFViFv4sM0FMldX/JyNsiwrqpPqh8HW8IYr5+AhCyZ+lX2wmzP
 u6hikq831rTC61aAfnG2SR3IWEKr57JJ6PoRuPPBGclkRhGzze4aaaknjvPtzc3VBonW
 aUmW6JKm6DkDlecy9EZeXfN3hKlu70yyI2qnHZcpt6+tn85T45AdisKFLt2yGXlaOZOV
 U0fj8qtkjKQnOy/fannYshfqHxDe59jXEU+JmyHGyUYTOziguh5Wh/tMMm42U3GNccb7
 Vr86wDpfjz2TDWXhj5sAQrNzKqn7UFUiT+pZWJu1adLkQMLYiHP4/DG5MNAu00a64w6P
 5eEA==
X-Gm-Message-State: AOAM5339sh/AGMXkkM2bVKNa8UYm3U8y2DG7NNLTSNb0YwH5bmJ12GXe
 gYfFa9c0Grc2TsQ3lLO0dYwyOy8XwgsFjw==
X-Google-Smtp-Source: ABdhPJxfWbIbnEs3tGiEtLlmxKRPpwgpeVjgVEPuzDtLhN5CoUBQew2XdOxRCkeEKg78WzQMNJZ8Bg==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr9992260wrw.31.1618763583031; 
 Sun, 18 Apr 2021 09:33:03 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j6sm16194798wmq.16.2021.04.18.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] target/mips: Move Special opcodes to
 tcg/sysemu/special_helper.c
Date: Sun, 18 Apr 2021 18:31:26 +0200
Message-Id: <20210418163134.1133100-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Move the Special opcodes helpers to tcg/sysemu/special_helper.c.

Since mips_io_recompile_replay_branch() is set as
CPUClass::io_recompile_replay_branch handler in cpu.c,
we need to declare its prototype in "tcg-internal.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                    |   5 -
 target/mips/tcg/tcg-internal.h          |   3 +
 target/mips/tcg/sysemu_helper.h.inc     |   7 ++
 target/mips/cpu.c                       |  17 ---
 target/mips/op_helper.c                 | 110 -----------------
 target/mips/tcg/sysemu/special_helper.c | 150 ++++++++++++++++++++++++
 target/mips/tcg/sysemu/meson.build      |   1 +
 7 files changed, 161 insertions(+), 132 deletions(-)
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
index 6615151cba2..e507dd1630f 100644
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
                                   MMUAccessType access_type);
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
index bfc927dd9cd..e756d75667f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -352,23 +352,6 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
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
index 0b54072378c..3903545831f 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -656,116 +656,6 @@ void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
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
-static void set_pc(CPUMIPSState *env, target_ulong error_pc)
-{
-    env->active_tc.PC = error_pc & ~(target_ulong)1;
-    if (error_pc & 1) {
-        env->hflags |= MIPS_HFLAG_M16;
-    } else {
-        env->hflags &= ~(MIPS_HFLAG_M16);
-    }
-}
-
-static inline void exception_return(CPUMIPSState *env)
-{
-    debug_pre_eret(env);
-    if (env->CP0_Status & (1 << CP0St_ERL)) {
-        set_pc(env, env->CP0_ErrorEPC);
-        env->CP0_Status &= ~(1 << CP0St_ERL);
-    } else {
-        set_pc(env, env->CP0_EPC);
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
-    set_pc(env, env->CP0_DEPC);
-
-    debug_post_eret(env);
-}
 #endif /* !CONFIG_USER_ONLY */
 
 static inline void check_hwrena(CPUMIPSState *env, int reg, uintptr_t pc)
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
new file mode 100644
index 00000000000..f2cf7252484
--- /dev/null
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -0,0 +1,150 @@
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
+static void set_pc(CPUMIPSState *env, target_ulong error_pc)
+{
+    env->active_tc.PC = error_pc & ~(target_ulong)1;
+    if (error_pc & 1) {
+        env->hflags |= MIPS_HFLAG_M16;
+    } else {
+        env->hflags &= ~(MIPS_HFLAG_M16);
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
+        set_pc(env, env->CP0_ErrorEPC);
+        env->CP0_Status &= ~(1 << CP0St_ERL);
+    } else {
+        set_pc(env, env->CP0_EPC);
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
+    set_pc(env, env->CP0_DEPC);
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


