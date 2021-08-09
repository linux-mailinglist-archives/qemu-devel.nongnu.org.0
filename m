Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CF3E4654
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:16:44 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD591-0003CC-C7
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53p-0002TJ-C0; Mon, 09 Aug 2021 09:11:21 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53m-0001FW-5c; Mon, 09 Aug 2021 09:11:21 -0400
Received: by mail-qt1-x831.google.com with SMTP id e15so9691449qtx.1;
 Mon, 09 Aug 2021 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAqSL0Iv8YbbK/i7RisiF9KeqLaKQMj3ENSUeWSQiok=;
 b=pXi8chsrhPT1Bd9z8ikpQ+5h4spmp/eVbxbGPmlRGbl5dL9yKsdPdQab8CBFfiZNoQ
 MWJSxZDIjld9p677HG893o1XUjA/NprEfOT1JqCGa2QW+wafTCtNNfxM+Afdk9+f3chc
 qmGUhJONt6nc1u8RYKwIqKZPn1lEx1ovrvKiGczNXJTuClfPavmVigp0K08EEI8owuao
 VMrkHbnLYNm/sOazqVk+U8+33q3iQNmm/uYcfAyG1m9hMQyzwY3MvUsv/KlBB0iyXwRJ
 VY2Issa1Xng8awGm4JCMwIPg2QC5yA4/JCu1kvaRsH8rQmwj/qt0VPtXGG4syfgF9NBM
 wMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAqSL0Iv8YbbK/i7RisiF9KeqLaKQMj3ENSUeWSQiok=;
 b=KeLydqbTVTvsG8fgxDqabqTUd8NcKnYz4SKAqe6v2JsdnE06WDAU7s20UX5XQ91wU5
 in0j++ysTYEjc3sx0SNbQnF2mpDC4HOnded8eZG4R2teojnpzdH2bA8rNju3tBnZohsi
 Su+4eTLzaSQHOn6AiVFSXBbDWdgEbHcxM4DBT+HkRzIHURejo85+T5P8GmOae4cGqjj5
 AOfvhJincNMX8iT1NzsQ2DG0w4rz9A5T5fTuWBJiDfRs/Qm8+NZicVu4DSJio/FhwUo7
 W9fTxyOYs0r/1x2PzUd6qYz7xB+/KsTLbRzhZOCc+R73quWZwf29imJuJ4seQ967piaJ
 zgag==
X-Gm-Message-State: AOAM532tlVu6s4zZdC8NzL/Nktgxu9JexuFLuMiYCcYt34flxy7dEAYu
 bpGW9tia7FjfbHI7ZX4zXzf7D7VFFCJ3bw==
X-Google-Smtp-Source: ABdhPJwiMNOXvx1LfnzAk69cVPqrhrUv4G15Q3erou4yhrYebM+RGzJGeONYW1GFskbw9LDACIBhmQ==
X-Received: by 2002:a05:622a:110:: with SMTP id
 u16mr9910460qtw.275.1628514676616; 
 Mon, 09 Aug 2021 06:11:16 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for pseries TCG
Date: Mon,  9 Aug 2021 10:10:42 -0300
Message-Id: <20210809131057.1694145-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMCC (PMC Control) bit in the MMCR0 register controls whether the
counters PMC5 and PMC6 are being part of the performance monitor
facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
always be used to measure instructions completed and cycles,
respectively.

This patch adds the barebones of the Book3s PMU logic by enabling
instruction counting, using the icount framework, using the performance
monitor counters 5 and 6. The overall logic goes as follows:

- a helper is added to control the PMU state on each MMCR0 write. This
allows for the PMU to start/stop as quick as possible;

- only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*insns
(for cycles per instruction) for now;

- the intended usage is to freeze the counters by setting MMCR0_FC, do
any additional setting via MMCR1 (not implemented yet) and setting
initial counter values,  and enable the PMU by zeroing MMCR0_FC. Software
must freeze counters to read the results - on the fly reading of the PMCs
will return the starting value of each one.

Since there will be more PMU exclusive code to be added next, let's also
put the PMU logic in its own helper to keep all in the same place. The
code is also repetitive and not really extensible to add more PMCs, but
we'll handle this in the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |  4 ++
 target/ppc/cpu_init.c          |  4 +-
 target/ppc/helper.h            |  1 +
 target/ppc/meson.build         |  1 +
 target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++++++++++
 target/ppc/translate.c         | 14 ++++--
 6 files changed, 97 insertions(+), 5 deletions(-)
 create mode 100644 target/ppc/pmu_book3s_helper.c

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4d96015f81..229abfe7ee 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1175,6 +1175,10 @@ struct CPUPPCState {
     uint32_t tm_vscr;
     uint64_t tm_dscr;
     uint64_t tm_tar;
+
+    /* PMU registers icount state */
+    uint64_t pmc5_base_icount;
+    uint64_t pmc6_base_icount;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 71062809c8..fce89ee994 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
     spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_pmu_generic, &spr_write_pmu_generic,
-                     KVM_REG_PPC_MMCR0, 0x00000000);
+                     KVM_REG_PPC_MMCR0, 0x80000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_pmu_generic, &spr_write_pmu_generic,
@@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
                  &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
-                 0x00000000);
+                 0x80000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
                  &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4076aa281e..5122632784 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
+DEF_HELPER_2(store_mmcr0, void, env, tl)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index b85f295703..bf252ca3ac 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
+  'pmu_book3s_helper.c',
   'timebase_helper.c',
   'translate.c',
 ))
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
new file mode 100644
index 0000000000..fe16fcfce0
--- /dev/null
+++ b/target/ppc/pmu_book3s_helper.c
@@ -0,0 +1,78 @@
+/*
+ * PowerPC Book3s PMU emulation helpers for QEMU TCG
+ *
+ *  Copyright IBM Corp. 2021
+ *
+ * Authors:
+ *  Daniel Henrique Barboza      <danielhb413@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+
+static uint64_t get_insns(void)
+{
+    return (uint64_t)icount_get_raw();
+}
+
+static uint64_t get_cycles(uint64_t insns)
+{
+    /* Placeholder value */
+    return insns * 4;
+}
+
+/* PMC5 always count instructions */
+static void freeze_PMC5_value(CPUPPCState *env)
+{
+    uint64_t insns = get_insns() - env->pmc5_base_icount;
+
+    env->spr[SPR_POWER_PMC5] += insns;
+    env->pmc5_base_icount += insns;
+}
+
+/* PMC6 always count cycles */
+static void freeze_PMC6_value(CPUPPCState *env)
+{
+    uint64_t insns = get_insns() - env->pmc6_base_icount;
+
+    env->spr[SPR_POWER_PMC6] += get_cycles(insns);
+    env->pmc6_base_icount += insns;
+}
+
+void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
+{
+    bool curr_FC = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
+    bool new_FC = value & MMCR0_FC;
+
+    /*
+     * In an frozen count (FC) bit change:
+     *
+     * - if PMCs were running (curr_FC = false) and we're freezing
+     * them (new_FC = true), save the PMCs values in the registers.
+     *
+     * - if PMCs were frozen (curr_FC = true) and we're activating
+     * them (new_FC = false), calculate the current icount for each
+     * register to allow for subsequent reads to calculate the insns
+     * passed.
+     */
+    if (curr_FC != new_FC) {
+        if (!curr_FC) {
+            freeze_PMC5_value(env);
+            freeze_PMC6_value(env);
+        } else {
+            uint64_t curr_icount = get_insns();
+
+            env->pmc5_base_icount = curr_icount;
+            env->pmc6_base_icount = curr_icount;
+        }
+    }
+
+    env->spr[SPR_POWER_MMCR0] = value;
+}
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 29b0a340a9..62356cfadf 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -409,8 +409,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
 {
-    /* For now it's just a call to spr_write_generic() */
-    spr_write_generic(ctx, sprn, gprn);
+    switch (sprn) {
+    case SPR_POWER_MMCR0:
+        gen_icount_io_start(ctx);
+        gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
+        break;
+    default:
+        spr_write_generic(ctx, sprn, gprn);
+    }
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -592,6 +598,8 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
         t0 = tcg_temp_new();
         t1 = tcg_temp_new();
 
+        gen_icount_io_start(ctx);
+
         /*
          * Filter out all bits but FC, PMAO, and PMAE, according
          * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
@@ -603,7 +611,7 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
         tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
         /* Keep all other bits intact */
         tcg_gen_or_tl(t1, t1, t0);
-        gen_store_spr(effective_sprn, t1);
+        gen_helper_store_mmcr0(cpu_env, t1);
 
         tcg_temp_free(t0);
         tcg_temp_free(t1);
-- 
2.31.1


