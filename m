Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4E47E8BB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:23:36 +0100 (CET)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Uch-0002RT-QD
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:23:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXp-0003OW-AB; Thu, 23 Dec 2021 15:18:33 -0500
Received: from [2607:f8b0:4864:20::935] (port=40483
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXm-0004Lo-EW; Thu, 23 Dec 2021 15:18:33 -0500
Received: by mail-ua1-x935.google.com with SMTP id v12so168170uar.7;
 Thu, 23 Dec 2021 12:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOM7FeP/6w2aBYadCaZ4laQxkp4EdcNZX4A1uV0Fgus=;
 b=FAvJI9W8RR+zJDNN11tCIbPIXXKUT70GZBRTOxIthnqcNoBQB/D5tLXrb3/gUaToWK
 Gi4tuIyYD9Qt1u3lcUCixSP0CpQ0KGPMOGlJVMCgzd5PYMDUwmBaTsXqS6ioTk0fySZ7
 8BibtgMSebWAtBa2sHCyrvdVOeNwNqCUSlmT0V/sTTqJ5tdigxvxzOD506w7rfP9Dx+g
 C5jUIemzGKiOnCjkANMnKvLHUTTEEmQs+ktzVSnRenbIr306T93MgIuu+xGYxGLeWdw/
 VFWN1C82FxfzjNVKmXeOCArgOWWHpcdG0wSD9RqNiYsho9S1dqaXgmPWn8VY6pmoDGdA
 jp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wOM7FeP/6w2aBYadCaZ4laQxkp4EdcNZX4A1uV0Fgus=;
 b=XeMBTTH/tGDidiwIbGjAZcQzPPf5Mr98S0BYmA7oBuXX2L1w39W777qb6r4ZYyPHFW
 suYlhToPVoPUgG9nxS9fEGP7IuYQqNuT7eb9QmNyVbQoBUCCmrzcFWGmVGpTFZ+iH654
 aeKz+MIgKjAIxzbR066mJ0U8Z/6F0reaKqtjxQyJirF6ZaCIaZrxAtQzV4+8Qi++e4io
 XIvn9n7REsfn6X6m6+Rhj52Tla2Q3zC6L3Nm2UZStktO+5NCiisPeGl+iLNKdffEo8ga
 ZKyRlc6JptRLEF67pAC7arhneG2PZGTtpfUEY59/zbFeBU9jUs5J2xHBcAwzVHZVZzJJ
 XtWQ==
X-Gm-Message-State: AOAM533q28UBIDAlHfu4J2rV5j3zJ9EV4QnDMYrsiRXP/v0QDaPyRLYm
 W/hkx6j9fBqpMsM4C1QnF2s60oiYhQE=
X-Google-Smtp-Source: ABdhPJzDnXNZjypRpdbGjryuHckzqMQQOdWy76Q7VfVnVRVYsBXDx2L0uAqhdFZnSMouksbfnYKRKg==
X-Received: by 2002:a67:e3cd:: with SMTP id k13mr1280330vsm.59.1640290707216; 
 Thu, 23 Dec 2021 12:18:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/ppc/power8-pmu-insn-cnt: introduce
 inc_spr_if_cond()
Date: Thu, 23 Dec 2021 17:18:09 -0300
Message-Id: <20211223201812.846495-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
References: <20211223201812.846495-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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

The code that increments a PMC is repetitive: check if a given register
has a bit/mask set or cleared and increment the counter.

inc_spr_if_cond() will help deal with this repetition. This patch also
gives a sample of how the function works by incrementing PMC5, which is
supposed to be incremented only if MMCR0_FC56 is not set.

We've also removing the call from the helper since that would cause
PMC5 to be counted twice.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 43 ++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index 6cdf2d2d88..3cfb801c69 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -10,6 +10,38 @@
  * See the COPYING file in the top-level directory.
  */
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+/*
+ * This function increments a SPR 'spr' by 'inc_val' if a given
+ * register 'reg' has a bitmask 'mask' set (cond = TCG_COND_EQ) or
+ * not set (TCG_COND_NE).
+ */
+static void inc_spr_if_cond(int reg, uint64_t mask, TCGCond cond,
+                            int spr, int inc_val)
+{
+    TCGCond exit_cond = tcg_invert_cond(cond);
+    TCGLabel *l_exit;
+    TCGv t0, t1;
+
+    l_exit = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, reg);
+    tcg_gen_andi_tl(t0, t0, mask);
+    tcg_gen_brcondi_tl(exit_cond, t0, mask, l_exit);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, spr);
+    tcg_gen_addi_tl(t1, t1, inc_val);
+    gen_store_spr(spr, t1);
+
+    gen_set_label(l_exit);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+#endif /* #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
+
 #if defined(TARGET_PPC64)
 static void pmu_count_insns(DisasContext *ctx)
 {
@@ -22,15 +54,8 @@ static void pmu_count_insns(DisasContext *ctx)
     }
 
  #if !defined(CONFIG_USER_ONLY)
-    /*
-     * The PMU insns_inc() helper stops the internal PMU timer if a
-     * counter overflows happens. In that case, if the guest is
-     * running with icount and we do not handle it beforehand,
-     * the helper can trigger a 'bad icount read'.
-     */
-    gen_icount_io_start(ctx);
-
-    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+    inc_spr_if_cond(SPR_POWER_MMCR0, MMCR0_FC56, TCG_COND_NE,
+                    SPR_POWER_PMC5, ctx->base.num_insns);
 #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
-- 
2.33.1


