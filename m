Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAD47E8BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:23:57 +0100 (CET)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ud1-0003aL-Vi
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXq-0003SL-GM; Thu, 23 Dec 2021 15:18:34 -0500
Received: from [2607:f8b0:4864:20::930] (port=35730
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXo-0004Ml-Og; Thu, 23 Dec 2021 15:18:34 -0500
Received: by mail-ua1-x930.google.com with SMTP id y22so12052008uap.2;
 Thu, 23 Dec 2021 12:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hb+ZDvD7Ue46fsONRzgs1yhu1sdjeiSWP5hUHzSkAQk=;
 b=LrScrldpreJPAsEnwPVuwl8hCpNSYFZ321n7LdF1f6TPLOCUCrjhnKiwakLC+1plom
 koMoe+oN9EJBFC5FMlwH+X2ZZev6Ju9jUiq6b/DKKxyWOFJI3hgRtTcqS+WaRvo9GfHg
 YBaIDnOfgpPRE1x5WNDdUw1AQVAb2L2gCGLJSYznBKBWZ8br4Qm5mnFtNQvppTN6sMey
 cYQm8u6QYBlXjcJAB4tAmms23b3oXOM9qvbbfZ2dHOllB/6GUsopntIjnYEDT+QeiIX/
 8NTYHsGaDzgxpmjRRmrRCE3HI+M0em9zrhFnYtnRiPDXKMMgI6toz+spNaFMzgdO8zTT
 iJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hb+ZDvD7Ue46fsONRzgs1yhu1sdjeiSWP5hUHzSkAQk=;
 b=J0w9RRkSuCOLVKF3VPfCkCDp2yo5rJTckrSD0KzmK37VUEX4DSrD5oJO//ZYSu1J4V
 /9hALR6RqLcLmHjEmpEtEgzs8NYccvAOz2Aacbadr77qae5l1s4k7eTbZ6N7jXt6idbc
 EO7d7OU702iBjKMByJE20NT8onnQvheH3+KJY2StGTML77mVmBkaVggcLgD3AZflQ8Ok
 O/r/dgAInXra0UkdJg601hsWpIj2SxT2bRXPR14oQ/JD1wtJFHMGlxd5pL2oyaALEL3q
 cjRibJKUhgQJJ/TNukf3iUi2h8iRYIOV4k/z6HdgbF2MHy/N2CRCrIxsWd3bU0zh8nd/
 YyeQ==
X-Gm-Message-State: AOAM530kex+ZIFUdYcTGcuVr3EAuZU8A8Y3Xi7r+aEpemoSNMdGZG1PX
 Q23ZaivBsbLQlUajMWqBNRbLiKsa090=
X-Google-Smtp-Source: ABdhPJxhE2XjR1TDi2NEg70nPMAWzM1neGAUyOG0Mvzk1u5EsEr01IZcJguymrmJj2MoFDBeu8QweA==
X-Received: by 2002:ab0:6414:: with SMTP id x20mr1342024uao.81.1640290711486; 
 Thu, 23 Dec 2021 12:18:31 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:31 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/ppc/power8-pmu-insn-cnt: add
 pmu_check_overflow()
Date: Thu, 23 Dec 2021 17:18:11 -0300
Message-Id: <20211223201812.846495-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
References: <20211223201812.846495-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pmu_check_overflow() will verify for overflow in the PMC1-5 counters,
firing a performance monitor alert if an overflow happened with the
proper MMCR0 bits set.

The alert is fired by using helper_pmu_overflow().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                  |  1 +
 target/ppc/power8-pmu-insn-cnt.c.inc | 76 ++++++++++++++++++++++++++++
 target/ppc/power8-pmu.c              |  8 +++
 3 files changed, 85 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index fb6cac38b4..4d8193caab 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -26,6 +26,7 @@ DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 DEF_HELPER_2(insns_inc, void, env, i32)
+DEF_HELPER_1(pmu_overflow, void, env)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index a5a0d42e71..6e0e4e1270 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -18,6 +18,8 @@
 #define MMCR1_PMC4_INS_CNT        0x00000002
 #define MMCR1_PMC4_INS_LATCH_CNT  0x000000FA
 
+#define PMC_COUNTER_NEGATIVE_VAL  0x80000000UL
+
 /*
  * This function increments a SPR 'spr' by 'inc_val' if a given
  * register 'reg' has a bitmask 'mask' set (cond = TCG_COND_EQ) or
@@ -47,6 +49,78 @@ static void inc_spr_if_cond(int reg, uint64_t mask, TCGCond cond,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+
+/*
+ * Check for overflow of PMC1-PMC5 counters and call the overflow
+ * helper in case any counter has overflown.
+ */
+static void pmu_check_overflow(DisasContext *ctx)
+{
+    TCGv t0, t1, t_pmc1, t_pmc;
+    TCGLabel *l_pmc_overflow;
+    TCGLabel *l_skip_pmc1_overflow;
+    TCGLabel *l_skip_overflow;
+    int i;
+
+    /*
+     * Check if we have overflow bits set and fire an overflow
+     * event if necessary. Skip directly to 'l_pmc_overflow'
+     * right after finding the first overflow.
+     */
+    l_pmc_overflow = gen_new_label();
+    l_skip_pmc1_overflow = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t0, t0, MMCR0_PMC1CE);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, MMCR0_PMC1CE, l_skip_pmc1_overflow);
+
+    t_pmc1 = tcg_temp_new();
+    gen_load_spr(t_pmc1, SPR_POWER_PMC1);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc1, PMC_COUNTER_NEGATIVE_VAL,
+                       l_pmc_overflow);
+
+    gen_set_label(l_skip_pmc1_overflow);
+
+    l_skip_overflow = gen_new_label();
+
+    /*
+     * At this point we're sure PMC1 didn't overflow. If MMCR0_PMCjCE
+     * isn't set we can skip everything since PMC2-5 overflow is
+     * disabled.
+     */
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t1, t1, MMCR0_PMCjCE);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, MMCR0_PMCjCE, l_skip_overflow);
+
+    for (i = SPR_POWER_PMC2; i < SPR_POWER_PMC6; i++) {
+        t_pmc = tcg_temp_new();
+        gen_load_spr(t_pmc, i);
+        tcg_gen_brcondi_tl(TCG_COND_GE, t_pmc, PMC_COUNTER_NEGATIVE_VAL,
+                           l_pmc_overflow);
+        tcg_temp_free(t_pmc);
+    }
+
+    tcg_gen_br(l_skip_overflow);
+
+    gen_set_label(l_pmc_overflow);
+
+    /*
+     * The PMU overflow helper manipulates the internal PMU timer.
+     * In that case, if the guest is running with icount and we do not
+     * handle it beforehand, the helper can trigger a 'bad icount
+     * read'.
+     */
+    gen_icount_io_start(ctx);
+    gen_helper_pmu_overflow(cpu_env);
+
+    gen_set_label(l_skip_overflow);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t_pmc1);
+}
 #endif /* #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
 
 #if defined(TARGET_PPC64)
@@ -115,6 +189,8 @@ static void pmu_count_insns(DisasContext *ctx)
 
     gen_set_label(l_skip_pmc14);
 
+    pmu_check_overflow(ctx);
+
     tcg_temp_free(t_mmcr0);
     tcg_temp_free(t_mmcr1);
     tcg_temp_free(t_ctrl);
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 08d1902cd5..6696c9b3ae 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -323,6 +323,14 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
     }
 }
 
+/* Helper to fire a PMC interrupt from TCG code */
+void helper_pmu_overflow(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    fire_PMC_interrupt(cpu);
+}
+
 static void cpu_ppc_pmu_timer_cb(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
-- 
2.33.1


