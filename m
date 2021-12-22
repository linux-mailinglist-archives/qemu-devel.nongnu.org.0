Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE6E47D332
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:52:49 +0100 (CET)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n022y-0005qH-LF
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wD-0008Na-Br; Wed, 22 Dec 2021 08:45:49 -0500
Received: from [2607:f8b0:4864:20::735] (port=46798
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wB-0004aS-4d; Wed, 22 Dec 2021 08:45:48 -0500
Received: by mail-qk1-x735.google.com with SMTP id a11so2261333qkh.13;
 Wed, 22 Dec 2021 05:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1KSHjxR3ttybas9EE5stU1jxAi335HhUK/7wXhnwuE=;
 b=YyR41n0IhlipAqoVGbUqwWWvowfIRcCTx7IItofja2RTH6VHOjzp58YNJHOjZqufoF
 5w/PPpXSVvFNlRV7krwhBI4UKOtUncX9IG6YuA3c1iASmKZbRGxbNkITlaJLE1Fr6pWC
 ghiaGCfxMPPWDk3GbsyUcMmUq4y9F+KpUWM1n14q1nigOCdvXE1e9CSwBacEVlP78WTM
 aUaqY0slIR4EwiUKQ6dW2t7iLDbhT7XVbAzEnq6aw7HEpZDyV8czBmyg3UT/dkNYcZru
 YJ5h6u4r8QqPBGj8ZfCt/6rs0wWt1+BoHAdxi5OBN8+LFzvztid4+u6PedZPN633Dbkb
 s/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1KSHjxR3ttybas9EE5stU1jxAi335HhUK/7wXhnwuE=;
 b=bC4F1YKpzexK9kk1Aytma1bhFZsnMdBqE85HNb3veTmAATPGrc+e48sbU/XOehtd2g
 OBcR8bZg43BPbTjw9fz50//9Ffu2776z2aeNzPwcngFJ4sKpLoCScJVVK74FwdWZumwF
 yQPDtBGo4bTd90m6RAjFUXZcufx4GSMa8aQAcELgTO1wjFRkm8m7E2ib7CxHVGzSYVvI
 lZMsEKnfN52Vi7Ml8l1CeDNeAYzlXWH2sozQHESiHPlZQMmYuOlN2a2YkSn9A6eJ44E5
 k6GPE9CpXjT3ZQg+pZTV1Py1+zniND4ftMx00J5gOJiQynjkU5BUSe6CGaGbdGOKAuP7
 +tWA==
X-Gm-Message-State: AOAM532TPitCFtPFLOcQotldef8hOvXLoM015jr6q/KEsUdvGBBu9FwG
 KyFwUtCuEYr+oFgbjS5LGNWvFqREg08=
X-Google-Smtp-Source: ABdhPJwVk3O31szTnS8kdnz+KAC/w3DLIrjJ7miJ4jKvshNZP7JglnIJZ/0VWyqtROwnl1i3DoujXA==
X-Received: by 2002:a37:658:: with SMTP id 85mr2005960qkg.668.1640180745929;
 Wed, 22 Dec 2021 05:45:45 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc5()
Date: Wed, 22 Dec 2021 10:45:14 -0300
Message-Id: <20211222134520.587877-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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

The first PMC to be counted using exclusively TCG ops will be PMC5.
pmu_inc_pmc5() will always be called inside pmu_count_insns() since it's
able to avoid incrementing PMC5 by checking for MMCR0_FC56 beforehand.

Note that we've already checked that MMCR0_FC is cleared at this point
via ctx->pmu_insn_cnt being set.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 42 ++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index 2febbcc27e..c683573104 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -10,6 +10,38 @@
  * See the COPYING file in the top-level directory.
  */
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+/*
+ * Increments PMC5 if MMCR0_FC is cleared.
+ */
+static void pmu_inc_pmc5(DisasContext *ctx)
+{
+    TCGv t0, t1;
+    TCGLabel *l_skip_pmc;
+
+    /*
+     * If MMCR0_FC56 is set skip PMC5 increment.
+     */
+    l_skip_pmc = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+
+    tcg_gen_andi_tl(t0, t0, MMCR0_FC56);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, MMCR0_FC56, l_skip_pmc);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_PMC5);
+    tcg_gen_addi_tl(t1, t1, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC5, t1);
+
+    gen_set_label(l_skip_pmc);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+#endif /* #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
+
 #if defined(TARGET_PPC64)
 static void pmu_count_insns(DisasContext *ctx)
 {
@@ -22,15 +54,9 @@ static void pmu_count_insns(DisasContext *ctx)
     }
 
  #if !defined(CONFIG_USER_ONLY)
-    /*
-     * The PMU insns_inc() helper stops the internal PMU timer if a
-     * counter overflows happens. In that case, if the guest is
-     * running with icount and we do not handle it beforehand,
-     * the helper can trigger a 'bad icount read'.
-     */
-    gen_icount_io_start(ctx);
 
-    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
+    pmu_inc_pmc5(ctx);
+
 #else
     /*
      * User mode can read (but not write) PMC5 and start/stop
-- 
2.33.1


