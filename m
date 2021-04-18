Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087C93636CF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:47:13 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAZk-00076K-2Y
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALn-0003Pf-Np
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALl-0004hr-DL
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id e5so2843664wrg.7
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QSdjZPBkyJ6FqSaRthyncYNHDdrgyyU6EiNpdq4e+4=;
 b=l/Nw+egHeP96/M6GJ4dlO/6ovab5emWf8JGNLQsiWFDXFoNujZy04EtKMINeLU4aSv
 x4nD7TH00VM92iLlYTGeTBA0GBduKElGB3Mhjt3/bI+eYEDmn4teoyR41f69054e17cK
 5bpgCioYUQMy1EE0G676C9raiCRN2TOLkJfH/ax2CEh6+f46vtRNXgMuGnNJbfZiqEGM
 L2+VSDyLIyMk1hAxxvzLi27HbGefAW+oysH9BbvjlD/5SaFzj4cfs9z68+YrEZINiTUN
 gKV3qiBIkR6n/cJ7/e71Wamf9TwLt2bRDN2PBAcI1vaU6Z01gC57FvQWytXmPAgi6FPA
 1ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3QSdjZPBkyJ6FqSaRthyncYNHDdrgyyU6EiNpdq4e+4=;
 b=TFMwG3mwRAVbVQ2RQU4KGQ/91k0qK7PnA630ZkzEjROKFjgw0Q2vxdydPOxvNNreyN
 4oFYg3blsGTFPUls9nbOKyVVYX0GRn38B5pk9Ktfx9ziZSNuFn/cKgOrpACXwwQuaRuG
 5jeNTSYGOSNE7NdgeXSJx+rkT9GJ1SSv52byAH41WHfmj2+loghC0aQhzJUYqThtlp3P
 jNI+v/AcVkDuXJaS8m2gHXvsMawyfJZ3DYMeRbYYX217kihDUleuoODJdYiC7rqINUru
 9ffa2GXklEAkkjZbVDqnHhhYEMxjyoDAS1bS/GYvbqKVFfTbeWHzKbKOEFazRGW/PX1k
 KbIA==
X-Gm-Message-State: AOAM532G6Ade1oyD45HSVbyzu/Ri5SoIPEI8V4PgPXLIS/QpGD4xWggf
 KyD1CO9zMKtIBl6lMGmv+YQGg+fDvzFNOg==
X-Google-Smtp-Source: ABdhPJwEhJy+iyWlgqQ1xARh+1Gb0Du6S/eJ+Po5ppipZi+4T+CWQ2se+qVBN00kioRZ0Gh4e/bRbA==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr9901023wrs.204.1618763563539; 
 Sun, 18 Apr 2021 09:32:43 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm2134743wrw.20.2021.04.18.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] target/mips: Move sysemu TCG-specific code to
 tcg/sysemu/ subfolder
Date: Sun, 18 Apr 2021 18:31:22 +0200
Message-Id: <20210418163134.1133100-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Declare cpu_mips_get_random() and update_pagemask() on local scope,
and move cp0_helper.c and mips-semi.c to the new tcg/sysemu/ folder,
adapting the Meson machinery.

Move the opcode definitions to tcg/sysemu_helper.h.inc.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                      | 166 +--------------------
 target/mips/internal.h                    |   4 -
 target/mips/tcg/tcg-internal.h            |   9 ++
 target/mips/tcg/sysemu_helper.h.inc       | 168 ++++++++++++++++++++++
 target/mips/{ => tcg/sysemu}/cp0_helper.c |   0
 target/mips/{ => tcg/sysemu}/mips-semi.c  |   0
 target/mips/meson.build                   |   5 -
 target/mips/tcg/meson.build               |   3 +
 target/mips/tcg/sysemu/meson.build        |   4 +
 9 files changed, 188 insertions(+), 171 deletions(-)
 create mode 100644 target/mips/tcg/sysemu_helper.h.inc
 rename target/mips/{ => tcg/sysemu}/cp0_helper.c (100%)
 rename target/mips/{ => tcg/sysemu}/mips-semi.c (100%)
 create mode 100644 target/mips/tcg/sysemu/meson.build

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 709494445dd..bc308e5db13 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -2,10 +2,6 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_1(raise_exception_debug, noreturn, env)
 
-#ifndef CONFIG_USER_ONLY
-DEF_HELPER_1(do_semihosting, void, env)
-#endif
-
 #ifdef TARGET_MIPS64
 DEF_HELPER_4(sdl, void, env, tl, tl, int)
 DEF_HELPER_4(sdr, void, env, tl, tl, int)
@@ -42,164 +38,6 @@ DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
 
-#ifndef CONFIG_USER_ONLY
-/* CP0 helpers */
-DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
-DEF_HELPER_1(mfc0_mvpconf0, tl, env)
-DEF_HELPER_1(mfc0_mvpconf1, tl, env)
-DEF_HELPER_1(mftc0_vpecontrol, tl, env)
-DEF_HELPER_1(mftc0_vpeconf0, tl, env)
-DEF_HELPER_1(mfc0_random, tl, env)
-DEF_HELPER_1(mfc0_tcstatus, tl, env)
-DEF_HELPER_1(mftc0_tcstatus, tl, env)
-DEF_HELPER_1(mfc0_tcbind, tl, env)
-DEF_HELPER_1(mftc0_tcbind, tl, env)
-DEF_HELPER_1(mfc0_tcrestart, tl, env)
-DEF_HELPER_1(mftc0_tcrestart, tl, env)
-DEF_HELPER_1(mfc0_tchalt, tl, env)
-DEF_HELPER_1(mftc0_tchalt, tl, env)
-DEF_HELPER_1(mfc0_tccontext, tl, env)
-DEF_HELPER_1(mftc0_tccontext, tl, env)
-DEF_HELPER_1(mfc0_tcschedule, tl, env)
-DEF_HELPER_1(mftc0_tcschedule, tl, env)
-DEF_HELPER_1(mfc0_tcschefback, tl, env)
-DEF_HELPER_1(mftc0_tcschefback, tl, env)
-DEF_HELPER_1(mfc0_count, tl, env)
-DEF_HELPER_1(mfc0_saar, tl, env)
-DEF_HELPER_1(mfhc0_saar, tl, env)
-DEF_HELPER_1(mftc0_entryhi, tl, env)
-DEF_HELPER_1(mftc0_status, tl, env)
-DEF_HELPER_1(mftc0_cause, tl, env)
-DEF_HELPER_1(mftc0_epc, tl, env)
-DEF_HELPER_1(mftc0_ebase, tl, env)
-DEF_HELPER_2(mftc0_configx, tl, env, tl)
-DEF_HELPER_1(mfc0_lladdr, tl, env)
-DEF_HELPER_1(mfc0_maar, tl, env)
-DEF_HELPER_1(mfhc0_maar, tl, env)
-DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
-DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
-DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
-DEF_HELPER_1(mfc0_debug, tl, env)
-DEF_HELPER_1(mftc0_debug, tl, env)
-#ifdef TARGET_MIPS64
-DEF_HELPER_1(dmfc0_tcrestart, tl, env)
-DEF_HELPER_1(dmfc0_tchalt, tl, env)
-DEF_HELPER_1(dmfc0_tccontext, tl, env)
-DEF_HELPER_1(dmfc0_tcschedule, tl, env)
-DEF_HELPER_1(dmfc0_tcschefback, tl, env)
-DEF_HELPER_1(dmfc0_lladdr, tl, env)
-DEF_HELPER_1(dmfc0_maar, tl, env)
-DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
-DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
-DEF_HELPER_1(dmfc0_saar, tl, env)
-#endif /* TARGET_MIPS64 */
-
-DEF_HELPER_2(mtc0_index, void, env, tl)
-DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
-DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
-DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
-DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
-DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
-DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
-DEF_HELPER_2(mtc0_yqmask, void, env, tl)
-DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
-DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
-DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
-DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
-DEF_HELPER_2(mtc0_tcbind, void, env, tl)
-DEF_HELPER_2(mttc0_tcbind, void, env, tl)
-DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
-DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
-DEF_HELPER_2(mtc0_tchalt, void, env, tl)
-DEF_HELPER_2(mttc0_tchalt, void, env, tl)
-DEF_HELPER_2(mtc0_tccontext, void, env, tl)
-DEF_HELPER_2(mttc0_tccontext, void, env, tl)
-DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
-DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
-DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
-DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
-DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
-DEF_HELPER_2(mtc0_context, void, env, tl)
-DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
-DEF_HELPER_2(mtc0_pagemask, void, env, tl)
-DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
-DEF_HELPER_2(mtc0_segctl0, void, env, tl)
-DEF_HELPER_2(mtc0_segctl1, void, env, tl)
-DEF_HELPER_2(mtc0_segctl2, void, env, tl)
-DEF_HELPER_2(mtc0_pwfield, void, env, tl)
-DEF_HELPER_2(mtc0_pwsize, void, env, tl)
-DEF_HELPER_2(mtc0_wired, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
-DEF_HELPER_2(mtc0_hwrena, void, env, tl)
-DEF_HELPER_2(mtc0_pwctl, void, env, tl)
-DEF_HELPER_2(mtc0_count, void, env, tl)
-DEF_HELPER_2(mtc0_saari, void, env, tl)
-DEF_HELPER_2(mtc0_saar, void, env, tl)
-DEF_HELPER_2(mthc0_saar, void, env, tl)
-DEF_HELPER_2(mtc0_entryhi, void, env, tl)
-DEF_HELPER_2(mttc0_entryhi, void, env, tl)
-DEF_HELPER_2(mtc0_compare, void, env, tl)
-DEF_HELPER_2(mtc0_status, void, env, tl)
-DEF_HELPER_2(mttc0_status, void, env, tl)
-DEF_HELPER_2(mtc0_intctl, void, env, tl)
-DEF_HELPER_2(mtc0_srsctl, void, env, tl)
-DEF_HELPER_2(mtc0_cause, void, env, tl)
-DEF_HELPER_2(mttc0_cause, void, env, tl)
-DEF_HELPER_2(mtc0_ebase, void, env, tl)
-DEF_HELPER_2(mttc0_ebase, void, env, tl)
-DEF_HELPER_2(mtc0_config0, void, env, tl)
-DEF_HELPER_2(mtc0_config2, void, env, tl)
-DEF_HELPER_2(mtc0_config3, void, env, tl)
-DEF_HELPER_2(mtc0_config4, void, env, tl)
-DEF_HELPER_2(mtc0_config5, void, env, tl)
-DEF_HELPER_2(mtc0_lladdr, void, env, tl)
-DEF_HELPER_2(mtc0_maar, void, env, tl)
-DEF_HELPER_2(mthc0_maar, void, env, tl)
-DEF_HELPER_2(mtc0_maari, void, env, tl)
-DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
-DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
-DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
-DEF_HELPER_2(mtc0_xcontext, void, env, tl)
-DEF_HELPER_2(mtc0_framemask, void, env, tl)
-DEF_HELPER_2(mtc0_debug, void, env, tl)
-DEF_HELPER_2(mttc0_debug, void, env, tl)
-DEF_HELPER_2(mtc0_performance0, void, env, tl)
-DEF_HELPER_2(mtc0_errctl, void, env, tl)
-DEF_HELPER_2(mtc0_taglo, void, env, tl)
-DEF_HELPER_2(mtc0_datalo, void, env, tl)
-DEF_HELPER_2(mtc0_taghi, void, env, tl)
-DEF_HELPER_2(mtc0_datahi, void, env, tl)
-
-#if defined(TARGET_MIPS64)
-DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
-DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
-#endif
-
-/* MIPS MT functions */
-DEF_HELPER_2(mftgpr, tl, env, i32)
-DEF_HELPER_2(mftlo, tl, env, i32)
-DEF_HELPER_2(mfthi, tl, env, i32)
-DEF_HELPER_2(mftacx, tl, env, i32)
-DEF_HELPER_1(mftdsp, tl, env)
-DEF_HELPER_3(mttgpr, void, env, tl, i32)
-DEF_HELPER_3(mttlo, void, env, tl, i32)
-DEF_HELPER_3(mtthi, void, env, tl, i32)
-DEF_HELPER_3(mttacx, void, env, tl, i32)
-DEF_HELPER_2(mttdsp, void, env, tl)
-DEF_HELPER_0(dmt, tl)
-DEF_HELPER_0(emt, tl)
-DEF_HELPER_1(dvpe, tl, env)
-DEF_HELPER_1(evpe, tl, env)
-
-/* R6 Multi-threading */
-DEF_HELPER_1(dvp, tl, env)
-DEF_HELPER_1(evp, tl, env)
-#endif /* !CONFIG_USER_ONLY */
-
 /* microMIPS functions */
 DEF_HELPER_4(lwm, void, env, tl, tl, i32)
 DEF_HELPER_4(swm, void, env, tl, tl, i32)
@@ -783,4 +621,8 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
 DEF_HELPER_3(cache, void, env, tl, i32)
 
+#ifndef CONFIG_USER_ONLY
+#include "tcg/sysemu_helper.h.inc"
+#endif /* !CONFIG_USER_ONLY */
+
 #include "msa_helper.h.inc"
diff --git a/target/mips/internal.h b/target/mips/internal.h
index 51a45bd397a..59c2c22cd0a 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,6 @@ void r4k_helper_tlbr(CPUMIPSState *env);
 void r4k_helper_tlbinv(CPUMIPSState *env);
 void r4k_helper_tlbinvf(CPUMIPSState *env);
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
-uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
@@ -237,9 +236,6 @@ void cpu_mips_stop_count(CPUMIPSState *env);
 /* helper.c */
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
-/* op_helper.c */
-void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
-
 static inline void restore_pamask(CPUMIPSState *env)
 {
     if (env->hflags & MIPS_HFLAG_ELPA) {
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 24438667f47..b65580af211 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -11,10 +11,19 @@
 #define MIPS_TCG_INTERNAL_H
 
 #include "hw/core/cpu.h"
+#include "cpu.h"
 
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 
+#if !defined(CONFIG_USER_ONLY)
+
+void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
+
+uint32_t cpu_mips_get_random(CPUMIPSState *env);
+
+#endif /* !CONFIG_USER_ONLY */
+
 #endif
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
new file mode 100644
index 00000000000..d136c4160a7
--- /dev/null
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -0,0 +1,168 @@
+/*
+ *  QEMU MIPS sysemu helpers
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_1(do_semihosting, void, env)
+
+/* CP0 helpers */
+DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
+DEF_HELPER_1(mfc0_mvpconf0, tl, env)
+DEF_HELPER_1(mfc0_mvpconf1, tl, env)
+DEF_HELPER_1(mftc0_vpecontrol, tl, env)
+DEF_HELPER_1(mftc0_vpeconf0, tl, env)
+DEF_HELPER_1(mfc0_random, tl, env)
+DEF_HELPER_1(mfc0_tcstatus, tl, env)
+DEF_HELPER_1(mftc0_tcstatus, tl, env)
+DEF_HELPER_1(mfc0_tcbind, tl, env)
+DEF_HELPER_1(mftc0_tcbind, tl, env)
+DEF_HELPER_1(mfc0_tcrestart, tl, env)
+DEF_HELPER_1(mftc0_tcrestart, tl, env)
+DEF_HELPER_1(mfc0_tchalt, tl, env)
+DEF_HELPER_1(mftc0_tchalt, tl, env)
+DEF_HELPER_1(mfc0_tccontext, tl, env)
+DEF_HELPER_1(mftc0_tccontext, tl, env)
+DEF_HELPER_1(mfc0_tcschedule, tl, env)
+DEF_HELPER_1(mftc0_tcschedule, tl, env)
+DEF_HELPER_1(mfc0_tcschefback, tl, env)
+DEF_HELPER_1(mftc0_tcschefback, tl, env)
+DEF_HELPER_1(mfc0_count, tl, env)
+DEF_HELPER_1(mfc0_saar, tl, env)
+DEF_HELPER_1(mfhc0_saar, tl, env)
+DEF_HELPER_1(mftc0_entryhi, tl, env)
+DEF_HELPER_1(mftc0_status, tl, env)
+DEF_HELPER_1(mftc0_cause, tl, env)
+DEF_HELPER_1(mftc0_epc, tl, env)
+DEF_HELPER_1(mftc0_ebase, tl, env)
+DEF_HELPER_2(mftc0_configx, tl, env, tl)
+DEF_HELPER_1(mfc0_lladdr, tl, env)
+DEF_HELPER_1(mfc0_maar, tl, env)
+DEF_HELPER_1(mfhc0_maar, tl, env)
+DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
+DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
+DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
+DEF_HELPER_1(mfc0_debug, tl, env)
+DEF_HELPER_1(mftc0_debug, tl, env)
+#ifdef TARGET_MIPS64
+DEF_HELPER_1(dmfc0_tcrestart, tl, env)
+DEF_HELPER_1(dmfc0_tchalt, tl, env)
+DEF_HELPER_1(dmfc0_tccontext, tl, env)
+DEF_HELPER_1(dmfc0_tcschedule, tl, env)
+DEF_HELPER_1(dmfc0_tcschefback, tl, env)
+DEF_HELPER_1(dmfc0_lladdr, tl, env)
+DEF_HELPER_1(dmfc0_maar, tl, env)
+DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
+DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
+DEF_HELPER_1(dmfc0_saar, tl, env)
+#endif /* TARGET_MIPS64 */
+
+DEF_HELPER_2(mtc0_index, void, env, tl)
+DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
+DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
+DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
+DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
+DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
+DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
+DEF_HELPER_2(mtc0_yqmask, void, env, tl)
+DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
+DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
+DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
+DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
+DEF_HELPER_2(mtc0_tcbind, void, env, tl)
+DEF_HELPER_2(mttc0_tcbind, void, env, tl)
+DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
+DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
+DEF_HELPER_2(mtc0_tchalt, void, env, tl)
+DEF_HELPER_2(mttc0_tchalt, void, env, tl)
+DEF_HELPER_2(mtc0_tccontext, void, env, tl)
+DEF_HELPER_2(mttc0_tccontext, void, env, tl)
+DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
+DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
+DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
+DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
+DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
+DEF_HELPER_2(mtc0_context, void, env, tl)
+DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
+DEF_HELPER_2(mtc0_pagemask, void, env, tl)
+DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
+DEF_HELPER_2(mtc0_segctl0, void, env, tl)
+DEF_HELPER_2(mtc0_segctl1, void, env, tl)
+DEF_HELPER_2(mtc0_segctl2, void, env, tl)
+DEF_HELPER_2(mtc0_pwfield, void, env, tl)
+DEF_HELPER_2(mtc0_pwsize, void, env, tl)
+DEF_HELPER_2(mtc0_wired, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
+DEF_HELPER_2(mtc0_hwrena, void, env, tl)
+DEF_HELPER_2(mtc0_pwctl, void, env, tl)
+DEF_HELPER_2(mtc0_count, void, env, tl)
+DEF_HELPER_2(mtc0_saari, void, env, tl)
+DEF_HELPER_2(mtc0_saar, void, env, tl)
+DEF_HELPER_2(mthc0_saar, void, env, tl)
+DEF_HELPER_2(mtc0_entryhi, void, env, tl)
+DEF_HELPER_2(mttc0_entryhi, void, env, tl)
+DEF_HELPER_2(mtc0_compare, void, env, tl)
+DEF_HELPER_2(mtc0_status, void, env, tl)
+DEF_HELPER_2(mttc0_status, void, env, tl)
+DEF_HELPER_2(mtc0_intctl, void, env, tl)
+DEF_HELPER_2(mtc0_srsctl, void, env, tl)
+DEF_HELPER_2(mtc0_cause, void, env, tl)
+DEF_HELPER_2(mttc0_cause, void, env, tl)
+DEF_HELPER_2(mtc0_ebase, void, env, tl)
+DEF_HELPER_2(mttc0_ebase, void, env, tl)
+DEF_HELPER_2(mtc0_config0, void, env, tl)
+DEF_HELPER_2(mtc0_config2, void, env, tl)
+DEF_HELPER_2(mtc0_config3, void, env, tl)
+DEF_HELPER_2(mtc0_config4, void, env, tl)
+DEF_HELPER_2(mtc0_config5, void, env, tl)
+DEF_HELPER_2(mtc0_lladdr, void, env, tl)
+DEF_HELPER_2(mtc0_maar, void, env, tl)
+DEF_HELPER_2(mthc0_maar, void, env, tl)
+DEF_HELPER_2(mtc0_maari, void, env, tl)
+DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
+DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
+DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
+DEF_HELPER_2(mtc0_xcontext, void, env, tl)
+DEF_HELPER_2(mtc0_framemask, void, env, tl)
+DEF_HELPER_2(mtc0_debug, void, env, tl)
+DEF_HELPER_2(mttc0_debug, void, env, tl)
+DEF_HELPER_2(mtc0_performance0, void, env, tl)
+DEF_HELPER_2(mtc0_errctl, void, env, tl)
+DEF_HELPER_2(mtc0_taglo, void, env, tl)
+DEF_HELPER_2(mtc0_datalo, void, env, tl)
+DEF_HELPER_2(mtc0_taghi, void, env, tl)
+DEF_HELPER_2(mtc0_datahi, void, env, tl)
+
+#if defined(TARGET_MIPS64)
+DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
+DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
+#endif
+
+/* MIPS MT functions */
+DEF_HELPER_2(mftgpr, tl, env, i32)
+DEF_HELPER_2(mftlo, tl, env, i32)
+DEF_HELPER_2(mfthi, tl, env, i32)
+DEF_HELPER_2(mftacx, tl, env, i32)
+DEF_HELPER_1(mftdsp, tl, env)
+DEF_HELPER_3(mttgpr, void, env, tl, i32)
+DEF_HELPER_3(mttlo, void, env, tl, i32)
+DEF_HELPER_3(mtthi, void, env, tl, i32)
+DEF_HELPER_3(mttacx, void, env, tl, i32)
+DEF_HELPER_2(mttdsp, void, env, tl)
+DEF_HELPER_0(dmt, tl)
+DEF_HELPER_0(emt, tl)
+DEF_HELPER_1(dvpe, tl, env)
+DEF_HELPER_1(evpe, tl, env)
+
+/* R6 Multi-threading */
+DEF_HELPER_1(dvp, tl, env)
+DEF_HELPER_1(evp, tl, env)
diff --git a/target/mips/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
similarity index 100%
rename from target/mips/cp0_helper.c
rename to target/mips/tcg/sysemu/cp0_helper.c
diff --git a/target/mips/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
similarity index 100%
rename from target/mips/mips-semi.c
rename to target/mips/tcg/sysemu/mips-semi.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9a507937ece..a55af1cd6cf 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -47,11 +47,6 @@
 
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cp0_helper.c',
-  'mips-semi.c',
-))
-
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
 
 target_arch += {'mips': mips_ss}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index b74fa04303e..2cffc5a5ac6 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,3 +1,6 @@
 if have_user
   subdir('user')
 endif
+if have_system
+  subdir('sysemu')
+endif
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
new file mode 100644
index 00000000000..5c3024e7760
--- /dev/null
+++ b/target/mips/tcg/sysemu/meson.build
@@ -0,0 +1,4 @@
+mips_softmmu_ss.add(files(
+  'cp0_helper.c',
+  'mips-semi.c',
+))
-- 
2.26.3


