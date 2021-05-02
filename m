Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D5370E00
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:38:40 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF75-0000yl-U3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnl-0007U9-NR
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnj-00087e-2n
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2470444wmc.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AI6Xo4TmMGfUY040b6yCfWtAncz9V0VwKjuBz7JTA8w=;
 b=EsX2hEQrlrW2QDHoVe6isjlwUwYip2BOTBm+3dAnhqVUwteH0V2DyVbnjeYkWP8Nqz
 gumme7RAwSPF0VFpV71w3wJEwQkb9AXU46qyDFmPF3L6D0MEoSSV9FfQJYZ4ZJZ8oDXB
 HA6/kY5REohFFmd3lWEGtcV/MzaNWzjBz2+IDbefcy09pmraMKr26ahU+Rejr3paFmFZ
 IfcTVWkpoEPwroQA89xot8ZOMSm/dl4EqTk4GneMqZc5Jt+6Hq+kEp3XE7aYR1+8om55
 E8ty8NEyJLOB6Ma/XoGqViuNl+dM+8l/1+Ua9pcTQn9ER+2kfu4Dwyx1v8CHSAMB9IIC
 WiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AI6Xo4TmMGfUY040b6yCfWtAncz9V0VwKjuBz7JTA8w=;
 b=NBLuCKCgkto0TRrhT/V3zHbwtv8dUcdujA9mU2tgNaP2kxk8NzIr5cDbJB1QPujPyf
 v9w42RicgPbZvlIz+sW4xMOwzMIqemaaoz6GKM8Oia8MpfueJkqMMvPQf5w3iTS796Nn
 jt/ZDFwY9eMQroyzrYB3nckKCdl9ZtMkqd33/v2ky2KE4Lyr2kLJic95Hfiq80MxzClx
 fwnttPShhU3dv+LhMZRWbU0oVLl95VCcrQG9sVb6gbixuFM1zCGK+MoOHZ9Ze+hLHpW5
 bGl1izjU4HrUhDPZmQWKmF2bQpmeQRwnWLgwPS+63Sc2veVv/Fag0TddtxBRXcl04qM7
 HNOA==
X-Gm-Message-State: AOAM532TepyGQH1JwYm4uS2lBH/ak89EcfxiVlu+qzSHm6nJni7Cub68
 EafH/IBIE8q+lek8v72+tx0Vwdl1aPakBlVl
X-Google-Smtp-Source: ABdhPJz54iaNygJfV/7IppaLSXTFohHZ6j/i+Jb53Y/TnBIA81yhFn6TreswV1P47QsGrD6Uy/afZQ==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr3302594wmh.130.1619972313524; 
 Sun, 02 May 2021 09:18:33 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z14sm10890103wrt.54.2021.05.02.09.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/36] target/mips: Move CP0 helpers to sysemu/cp0.c
Date: Sun,  2 May 2021 18:15:35 +0200
Message-Id: <20210502161538.534038-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

Opcodes accessing Coprocessor 0 are privileged.
Move the CP0 helpers to sysemu/ and simplify the #ifdef'ry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-28-f4bug@amsat.org>
---
 target/mips/internal.h         |   9 +--
 target/mips/cpu.c              | 103 ---------------------------
 target/mips/sysemu/cp0.c       | 123 +++++++++++++++++++++++++++++++++
 target/mips/sysemu/meson.build |   1 +
 4 files changed, 129 insertions(+), 107 deletions(-)
 create mode 100644 target/mips/sysemu/cp0.c

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 07573c3e38f..dd332b4dcef 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -156,6 +156,11 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MMUAccessType access_type,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
+
+void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
+void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
+void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
+
 extern const VMStateDescription vmstate_mips_cpu;
 
 #endif /* !CONFIG_USER_ONLY */
@@ -405,8 +410,4 @@ static inline void compute_hflags(CPUMIPSState *env)
     }
 }
 
-void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
-void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
-void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
-
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index daa9a4791ee..1ad2fe4aa33 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -42,109 +42,6 @@ const char regnames[32][4] = {
     "t8", "t9", "k0", "k1", "gp", "sp", "s8", "ra",
 };
 
-#if !defined(CONFIG_USER_ONLY)
-
-/* Called for updates to CP0_Status.  */
-void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc)
-{
-    int32_t tcstatus, *tcst;
-    uint32_t v = cpu->CP0_Status;
-    uint32_t cu, mx, asid, ksu;
-    uint32_t mask = ((1 << CP0TCSt_TCU3)
-                       | (1 << CP0TCSt_TCU2)
-                       | (1 << CP0TCSt_TCU1)
-                       | (1 << CP0TCSt_TCU0)
-                       | (1 << CP0TCSt_TMX)
-                       | (3 << CP0TCSt_TKSU)
-                       | (0xff << CP0TCSt_TASID));
-
-    cu = (v >> CP0St_CU0) & 0xf;
-    mx = (v >> CP0St_MX) & 0x1;
-    ksu = (v >> CP0St_KSU) & 0x3;
-    asid = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
-
-    tcstatus = cu << CP0TCSt_TCU0;
-    tcstatus |= mx << CP0TCSt_TMX;
-    tcstatus |= ksu << CP0TCSt_TKSU;
-    tcstatus |= asid;
-
-    if (tc == cpu->current_tc) {
-        tcst = &cpu->active_tc.CP0_TCStatus;
-    } else {
-        tcst = &cpu->tcs[tc].CP0_TCStatus;
-    }
-
-    *tcst &= ~mask;
-    *tcst |= tcstatus;
-    compute_hflags(cpu);
-}
-
-void cpu_mips_store_status(CPUMIPSState *env, target_ulong val)
-{
-    uint32_t mask = env->CP0_Status_rw_bitmask;
-    target_ulong old = env->CP0_Status;
-
-    if (env->insn_flags & ISA_MIPS_R6) {
-        bool has_supervisor = extract32(mask, CP0St_KSU, 2) == 0x3;
-#if defined(TARGET_MIPS64)
-        uint32_t ksux = (1 << CP0St_KX) & val;
-        ksux |= (ksux >> 1) & val; /* KX = 0 forces SX to be 0 */
-        ksux |= (ksux >> 1) & val; /* SX = 0 forces UX to be 0 */
-        val = (val & ~(7 << CP0St_UX)) | ksux;
-#endif
-        if (has_supervisor && extract32(val, CP0St_KSU, 2) == 0x3) {
-            mask &= ~(3 << CP0St_KSU);
-        }
-        mask &= ~(((1 << CP0St_SR) | (1 << CP0St_NMI)) & val);
-    }
-
-    env->CP0_Status = (old & ~mask) | (val & mask);
-#if defined(TARGET_MIPS64)
-    if ((env->CP0_Status ^ old) & (old & (7 << CP0St_UX))) {
-        /* Access to at least one of the 64-bit segments has been disabled */
-        tlb_flush(env_cpu(env));
-    }
-#endif
-    if (ase_mt_available(env)) {
-        sync_c0_status(env, env, env->current_tc);
-    } else {
-        compute_hflags(env);
-    }
-}
-
-void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
-{
-    uint32_t mask = 0x00C00300;
-    uint32_t old = env->CP0_Cause;
-    int i;
-
-    if (env->insn_flags & ISA_MIPS_R2) {
-        mask |= 1 << CP0Ca_DC;
-    }
-    if (env->insn_flags & ISA_MIPS_R6) {
-        mask &= ~((1 << CP0Ca_WP) & val);
-    }
-
-    env->CP0_Cause = (env->CP0_Cause & ~mask) | (val & mask);
-
-    if ((old ^ env->CP0_Cause) & (1 << CP0Ca_DC)) {
-        if (env->CP0_Cause & (1 << CP0Ca_DC)) {
-            cpu_mips_stop_count(env);
-        } else {
-            cpu_mips_start_count(env);
-        }
-    }
-
-    /* Set/reset software interrupts */
-    for (i = 0 ; i < 2 ; i++) {
-        if ((old ^ env->CP0_Cause) & (1 << (CP0Ca_IP + i))) {
-            cpu_mips_soft_irq(env, i, env->CP0_Cause & (1 << (CP0Ca_IP + i)));
-        }
-    }
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
 {
     if (is_fpu64) {
diff --git a/target/mips/sysemu/cp0.c b/target/mips/sysemu/cp0.c
new file mode 100644
index 00000000000..bae37f515bf
--- /dev/null
+++ b/target/mips/sysemu/cp0.c
@@ -0,0 +1,123 @@
+/*
+ * QEMU MIPS CPU
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
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
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "exec/exec-all.h"
+
+/* Called for updates to CP0_Status.  */
+void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc)
+{
+    int32_t tcstatus, *tcst;
+    uint32_t v = cpu->CP0_Status;
+    uint32_t cu, mx, asid, ksu;
+    uint32_t mask = ((1 << CP0TCSt_TCU3)
+                       | (1 << CP0TCSt_TCU2)
+                       | (1 << CP0TCSt_TCU1)
+                       | (1 << CP0TCSt_TCU0)
+                       | (1 << CP0TCSt_TMX)
+                       | (3 << CP0TCSt_TKSU)
+                       | (0xff << CP0TCSt_TASID));
+
+    cu = (v >> CP0St_CU0) & 0xf;
+    mx = (v >> CP0St_MX) & 0x1;
+    ksu = (v >> CP0St_KSU) & 0x3;
+    asid = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
+
+    tcstatus = cu << CP0TCSt_TCU0;
+    tcstatus |= mx << CP0TCSt_TMX;
+    tcstatus |= ksu << CP0TCSt_TKSU;
+    tcstatus |= asid;
+
+    if (tc == cpu->current_tc) {
+        tcst = &cpu->active_tc.CP0_TCStatus;
+    } else {
+        tcst = &cpu->tcs[tc].CP0_TCStatus;
+    }
+
+    *tcst &= ~mask;
+    *tcst |= tcstatus;
+    compute_hflags(cpu);
+}
+
+void cpu_mips_store_status(CPUMIPSState *env, target_ulong val)
+{
+    uint32_t mask = env->CP0_Status_rw_bitmask;
+    target_ulong old = env->CP0_Status;
+
+    if (env->insn_flags & ISA_MIPS_R6) {
+        bool has_supervisor = extract32(mask, CP0St_KSU, 2) == 0x3;
+#if defined(TARGET_MIPS64)
+        uint32_t ksux = (1 << CP0St_KX) & val;
+        ksux |= (ksux >> 1) & val; /* KX = 0 forces SX to be 0 */
+        ksux |= (ksux >> 1) & val; /* SX = 0 forces UX to be 0 */
+        val = (val & ~(7 << CP0St_UX)) | ksux;
+#endif
+        if (has_supervisor && extract32(val, CP0St_KSU, 2) == 0x3) {
+            mask &= ~(3 << CP0St_KSU);
+        }
+        mask &= ~(((1 << CP0St_SR) | (1 << CP0St_NMI)) & val);
+    }
+
+    env->CP0_Status = (old & ~mask) | (val & mask);
+#if defined(TARGET_MIPS64)
+    if ((env->CP0_Status ^ old) & (old & (7 << CP0St_UX))) {
+        /* Access to at least one of the 64-bit segments has been disabled */
+        tlb_flush(env_cpu(env));
+    }
+#endif
+    if (ase_mt_available(env)) {
+        sync_c0_status(env, env, env->current_tc);
+    } else {
+        compute_hflags(env);
+    }
+}
+
+void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
+{
+    uint32_t mask = 0x00C00300;
+    uint32_t old = env->CP0_Cause;
+    int i;
+
+    if (env->insn_flags & ISA_MIPS_R2) {
+        mask |= 1 << CP0Ca_DC;
+    }
+    if (env->insn_flags & ISA_MIPS_R6) {
+        mask &= ~((1 << CP0Ca_WP) & val);
+    }
+
+    env->CP0_Cause = (env->CP0_Cause & ~mask) | (val & mask);
+
+    if ((old ^ env->CP0_Cause) & (1 << CP0Ca_DC)) {
+        if (env->CP0_Cause & (1 << CP0Ca_DC)) {
+            cpu_mips_stop_count(env);
+        } else {
+            cpu_mips_start_count(env);
+        }
+    }
+
+    /* Set/reset software interrupts */
+    for (i = 0 ; i < 2 ; i++) {
+        if ((old ^ env->CP0_Cause) & (1 << (CP0Ca_IP + i))) {
+            cpu_mips_soft_irq(env, i, env->CP0_Cause & (1 << (CP0Ca_IP + i)));
+        }
+    }
+}
diff --git a/target/mips/sysemu/meson.build b/target/mips/sysemu/meson.build
index 925ceeaa449..cefc2275828 100644
--- a/target/mips/sysemu/meson.build
+++ b/target/mips/sysemu/meson.build
@@ -1,5 +1,6 @@
 mips_softmmu_ss.add(files(
   'addr.c',
+  'cp0.c',
   'cp0_timer.c',
   'machine.c',
   'physaddr.c',
-- 
2.26.3


