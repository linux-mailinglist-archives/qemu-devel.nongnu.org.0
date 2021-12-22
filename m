Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742247D341
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:56:14 +0100 (CET)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n026H-0003km-7x
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wL-0000OM-Rc; Wed, 22 Dec 2021 08:45:57 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=38522
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wJ-00051N-GV; Wed, 22 Dec 2021 08:45:57 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id o10so2344524qvc.5;
 Wed, 22 Dec 2021 05:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAil52fIEs5E6gA1R3n57uyzcrMZMpFgtnuFujtsOf8=;
 b=HXUva6/Qr0WJ9TPX+RoYENIcytryOpKmKPf9xnTgIkjTvrxX5zwKsyRV638KpZGNtx
 d79cEf647OrE19rZD6wqcK0eP52sRqicHS+SjyZH0AoIW71LsGu+2NF/TSMqOXlAnQ9y
 wJemwKaO6yL3Zv7UkocRZDJBaTISTYRWtaIici7w2D7TPXj8+IuNvyBWTzTEPn49UM9M
 iepqvlA4QKD7FSx9JaRkICC1KnMOclBsdVBXcMKf/iDqChKucJT5pAiOXs9fjs7CWhtq
 f0/ZRWLnXtz2QDXwyZMBRaVJjavkDVp0cGLzJAvy3INznWDLaKgIs4me1sRD+eQuFrh9
 eMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAil52fIEs5E6gA1R3n57uyzcrMZMpFgtnuFujtsOf8=;
 b=4IzNpaSHO/PXs3letRrMJBqa2fyYPwJarzzfn5Rxql/6KEs6CZwXfnTKNC/Va3T5yb
 HC8JRBA/UG1R3tMHHIIfTv7e4o76OddpGUaitmV1e/zcv2BZqNUbe7aeeLuygJ1HfMOQ
 XJ6lbhOOBKCx8GRojHRxRuzZIfZcWPO547NkNWULQaoIVOOJrev+VEvg/UdXHpsv3Szb
 Ahrnak3aaXFYUeuAvpodvVIDcGKpptYKv74bLe8qz4pW7zPX7qoFQC+XEwdLlcqW/XRO
 P0YOtucpoJXjep6ZuunKMKJtV/XBBgDsWTvA/inAlOgL3UA5L/rL8Mu9k7TRGbCMMhzg
 zWlA==
X-Gm-Message-State: AOAM533nqMi7n+se2UqTCpqlH2wnekjGY7nLJZxy31WXxArkpyxdRALc
 Q3LzdXnA5EuPnScoZl3ztEBJ7/ZdZVg=
X-Google-Smtp-Source: ABdhPJxZ+c8u9caB2SB81QIeqqrCLEDl2+Aarf/ymHEznjY12KPON3hogHbIKcUu72KDwjd0Vr3ZWQ==
X-Received: by 2002:a05:6214:5092:: with SMTP id
 kk18mr2347930qvb.1.1640180754327; 
 Wed, 22 Dec 2021 05:45:54 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:54 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] target/ppc/power8-pmu-insn-cnt.c: add pmu_inc_pmc4()
Date: Wed, 22 Dec 2021 10:45:18 -0300
Message-Id: <20211222134520.587877-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2d.google.com
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

pmu_inc_pmc4() will count both PM_INST_CMPL and PM_RUN_INST_CMPL.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 60 ++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index a84d688503..d3dd6d4685 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -16,6 +16,8 @@
 #define MMCR1_PMC1_INS_CNT2       0xFE000000
 #define MMCR1_PMC2_INS_CNT        0x00020000
 #define MMCR1_PMC3_INS_CNT        0x00000200
+#define MMCR1_PMC4_INS_CNT        0x00000002
+#define MMCR1_PMC4_INS_LATCH_CNT  0x000000FA
 
 /*
  * Increments PMC1 checking if MMCR1_PMC1SEL has one of the following
@@ -123,6 +125,63 @@ static void pmu_inc_pmc3(DisasContext *ctx)
     tcg_temp_free(t1);
 }
 
+/*
+ * Increments PMC4 checking if MMCR1_PMC4SEL has one of the following
+ * events:
+ *
+ * - 0x02: implementation dependent PM_INST_CMPL
+ * - 0xFE: ISA architected PM_RUN_INST_CMPL (run latch)
+ *
+ * This function assumes that MMCR0_FC14 is cleared.
+ */
+static void pmu_inc_pmc4(DisasContext *ctx)
+{
+    TCGv t0, t1, t2, t3;
+    TCGLabel *l_inc_pmc;
+    TCGLabel *l_skip_pmc;
+
+    /*
+     * PMC4 will be incremented if MMCR1_PMC4SEL = 0x2
+     * or 0xFA. For 0xFA (INSN_RUN_LATCH) we need to do an
+     * extra check with SPR_CTRL & CTRL_RUN.
+     */
+    l_inc_pmc = gen_new_label();
+    l_skip_pmc = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t0, t0, MMCR1_PMC4_INS_CNT);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, MMCR1_PMC4_INS_CNT, l_inc_pmc);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t1, t1, MMCR1_PMC4_INS_LATCH_CNT);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t1, MMCR1_PMC4_INS_LATCH_CNT, l_skip_pmc);
+
+    /*
+     * MMCR1_PMC4SEL is 0xFA at this point. Check if we have
+     * the run latch, skip if we don't.
+     */
+    t2 = tcg_temp_new();
+    gen_load_spr(t2, SPR_CTRL);
+    tcg_gen_andi_tl(t2, t2, CTRL_RUN);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t2, CTRL_RUN, l_skip_pmc);
+
+    gen_set_label(l_inc_pmc);
+
+    t3 = tcg_temp_new();
+    gen_load_spr(t3, SPR_POWER_PMC4);
+    tcg_gen_addi_tl(t3, t3, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC4, t3);
+
+    gen_set_label(l_skip_pmc);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    tcg_temp_free(t3);
+}
+
 /*
  * Increments PMC5 if MMCR0_FC is cleared.
  */
@@ -191,6 +250,7 @@ static void pmu_count_insns(DisasContext *ctx)
     pmu_inc_pmc1(ctx);
     pmu_inc_pmc2(ctx);
     pmu_inc_pmc3(ctx);
+    pmu_inc_pmc4(ctx);
 
     gen_set_label(l_skip_pmc14);
 
-- 
2.33.1


